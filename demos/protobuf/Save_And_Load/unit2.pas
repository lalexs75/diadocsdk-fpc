unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, protobuf_fpc, protobuf_fpc_types;

type
  {  TTest1  }
  //message Test1 {
  //  optional int32 a = 1;
  //}

  TTest1 = class(TSerializationObject)
  private
    Fa: int32;
  protected
    procedure InternalRegisterProperty; override;
  published
    property a:int32 read Fa write Fa;//1;
  end;


  {  TTest2  }
  //message Test2 {
  //  optional string b = 2;
  //}
  TTest2 = class(TSerializationObject)
  private
    Fb: string;
  protected
    procedure InternalRegisterProperty; override;
  published
    property b:string read Fb write Fb;//2;
  end;


  //message Test3 {
  //  optional Test1 c = 3;
  //}

  { TTest3 }

  TTest3 = class(TSerializationObject)
  private
    Fc: TTest1;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property c:TTest1 read Fc;//3;
  end;



  //message SignedContent {
  //	optional bytes Content = 1;
  //	optional bytes Signature = 2;
  //	optional string NameOnShelf = 4;
  //	optional bool SignWithTestSignature = 5 [default = false];
  //	optional string SignatureNameOnShelf = 6;
  //}

  { TSignedContent }

  TSignedContent = class(TSerializationObject) //message SignedContent
  private
    FContent: TBytes;
    FNameOnShelf: string;
    FSignature: TBytes;
    FSignatureNameOnShelf: string;
    FSignWithTestSignature: Boolean;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Content:TBytes read FContent write FContent;//1;
    property Signature:TBytes read FSignature write FSignature;//2;
    property NameOnShelf:string read FNameOnShelf write FNameOnShelf;//4;
    property SignWithTestSignature:Boolean read FSignWithTestSignature write FSignWithTestSignature;//5
    property SignatureNameOnShelf:string read FSignatureNameOnShelf write FSignatureNameOnShelf;//6;
  end;

  //message DocumentList {
  //  required int32 TotalCount = 1;
  //  repeated string Lines = 2;
  //}

  { TDocumentList }

  TDocumentList = class(TSerializationObject) //message SignedContent
  private
    FLines: TDocumentStrings;
    FTotalCount: integer;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TotalCount:integer read FTotalCount write FTotalCount; //1;
    property Lines:TDocumentStrings read FLines; //2;
  end;

implementation

{ TDocumentList }

procedure TDocumentList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TotalCount', 1);
  RegisterProp('Lines', 2);
end;

procedure TDocumentList.InternalInit;
begin
  inherited InternalInit;
  FLines:=TDocumentStrings.Create;
end;

destructor TDocumentList.Destroy;
begin
  FreeAndNil(FLines);
  inherited Destroy;
end;

{ TSignedContent }

procedure TSignedContent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Content', 1);
  RegisterProp('Signature', 2);
  RegisterProp('NameOnShelf', 4);
  RegisterProp('SignWithTestSignature', 5);
  RegisterProp('SignatureNameOnShelf', 6);
end;

procedure TSignedContent.InternalInit;
begin
  inherited InternalInit;
end;

destructor TSignedContent.Destroy;
begin
  inherited Destroy;
end;

{ TTest3 }

procedure TTest3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('c', 3);
end;

procedure TTest3.InternalInit;
begin
  inherited InternalInit;
  Fc:=TTest1.Create;
end;

destructor TTest3.Destroy;
begin
  FreeAndNil(Fc);
  inherited Destroy;
end;

{ TTest2 }

procedure TTest2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('b', 2);
end;

{ TTest1 }

procedure TTest1.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('a', 1);
end;

end.

