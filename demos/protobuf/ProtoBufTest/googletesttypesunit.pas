unit GoogleTestTypesUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, protobuf_fpc, protobuf_fpc_types;

type
(*
  TDocumentBytes = class(TSerializationArray)
  private
    FItems:array of TBytes;
    function GetItem(AIndex:Integer): TBytes;
  protected
    procedure InternalAddAsString(AValue:String); override;
    function GetCount: integer; override;
  public
    constructor Create;
    destructor Destroy; override;
    property Item[AIndex:Integer]:TBytes read GetItem; default;
  end;
*)

  //message Person {
  //  required string name = 1;
  //  required int32 id = 2;
  //  optional string email = 3;
  //}

  { TPerson }

  TPerson = class(TSerializationObject)
  private
    FEMail: string;
    FId: int32;
    FName: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property Name:string read FName write FName;//1;
    property Id:int32 read FId write FId; //2;
    property EMail:string read FEMail write FEMail;//3;
  end;


  //message SearchRequest {
  //  required string query = 1;
  //  optional int32 page_number = 2;
  //  optional int32 result_per_page = 3;
  //}

  { TSearchRequest }

  TSearchRequest= class(TSerializationObject)
  private
    Fpage_number: int32;
    Fquery: string;
    Fresult_per_page: int32;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property query:string read Fquery write Fquery; //1;
    property page_number:int32 read Fpage_number write Fpage_number;//2;
    property result_per_page:int32 read Fresult_per_page write Fresult_per_page;//3;
  end;

  //message Test1 {
  //  optional int32 a = 1;
  //}

  { TTest1 }

  TTest1= class(TSerializationObject)
  private
    FA: int32;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property A:int32 read FA write FA; //1;
  end;


  //message Test2 {
  //  optional string b = 2;
  //}

  { TTest2 }

  TTest2 = class(TSerializationObject)
  private
    FB: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property B:string read FB write FB; //2;
  end;

  //message Test3 {
  //  optional Test1 c = 3;
  //}

  { TTest3 }

  TTest3 = class(TSerializationObject)
  private
    FB: string;
    FC: TTest1;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property C:TTest1 read FC; //3;
  end;


implementation

{ TTest3 }

procedure TTest3.InternalInit;
begin
  inherited InternalInit;
  FC:=TTest1.Create;
end;

procedure TTest3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('C', 3);
end;

destructor TTest3.Destroy;
begin
  FreeAndNil(FC);
  inherited Destroy;
end;

{ TTest2 }

procedure TTest2.InternalInit;
begin
  inherited InternalInit;
end;

procedure TTest2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('B', 2);
end;

{ TTest1 }

procedure TTest1.InternalInit;
begin
  inherited InternalInit;
end;

procedure TTest1.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('A', 1);
end;

{ TSearchRequest }

procedure TSearchRequest.InternalInit;
begin
  inherited InternalInit;
end;

procedure TSearchRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('query', 1);
  RegisterProp('page_number', 2);
  RegisterProp('result_per_page', 3);
end;

{ TPerson }

procedure TPerson.InternalInit;
begin
  inherited InternalInit;
end;

procedure TPerson.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1);
  RegisterProp('Id', 2);
  RegisterProp('EMail', 3);
end;

end.

