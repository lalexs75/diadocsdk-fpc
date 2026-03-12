unit DP_UNISOOBSCH_1_982_02_05_01_01.UserContract;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject, AbstractSerializationObjects;

type
  Tstring20 = String;
  Tstring60 = String;
  Tstring100 = String;
  Tstring255 = String;
  Tstring10000 = String;
type

  {  Forward declarations  }
  TUniversalMessage = class;
  TUniversalMessageInfos = class;
  TUniversalMessageInfo = class;
  TPersonInfo = class;
  TContacts = class;
  TPhones = class;
  TEmails = class;
  TFio = class;

  {  Generic classes for collections  }
  TUniversalMessageList = specialize GXMLSerializationObjectList<TUniversalMessage>;
  TUniversalMessageInfosList = specialize GXMLSerializationObjectList<TUniversalMessageInfos>;
  TUniversalMessageInfoList = specialize GXMLSerializationObjectList<TUniversalMessageInfo>;
  TPersonInfoList = specialize GXMLSerializationObjectList<TPersonInfo>;
  TContactsList = specialize GXMLSerializationObjectList<TContacts>;
  TPhonesList = specialize GXMLSerializationObjectList<TPhones>;
  TEmailsList = specialize GXMLSerializationObjectList<TEmails>;
  TFioList = specialize GXMLSerializationObjectList<TFio>;

  {  TUniversalMessage  }
  TUniversalMessage = class(TXmlSerializationObject)
  private
    FUniversalMessageInfos:TUniversalMessageInfos;
    FSender:TPersonInfo;
    FRecipient:TPersonInfo;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
    function RootNodeName:string; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property UniversalMessageInfos:TUniversalMessageInfos read FUniversalMessageInfos;
    property Sender:TPersonInfo read FSender;
    property Recipient:TPersonInfo read FRecipient;
  end;

  {  TUniversalMessageInfos  }
  TUniversalMessageInfos = class(TXmlSerializationObject)
  private
    FUniversalMessageInfo:TUniversalMessageInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property UniversalMessageInfo:TUniversalMessageInfoList read FUniversalMessageInfo;
  end;

  {  TUniversalMessageInfo  }
  TUniversalMessageInfo = class(TXmlSerializationObject)
  private
    FPlainText:Tstring10000;
    FStatusCode:Int64;
    procedure SetPlainText( AValue:Tstring10000);
    procedure SetStatusCode( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property PlainText:Tstring10000 read FPlainText write SetPlainText;
    property StatusCode:Int64 read FStatusCode write SetStatusCode;
  end;

  {  TPersonInfo  }
  TPersonInfo = class(TXmlSerializationObject)
  private
    FFio:TFio;
    FContacts:TContacts;
    FPosition:Tstring255;
    FUseDefaultPersonInfo:String;
    procedure SetPosition( AValue:Tstring255);
    procedure SetUseDefaultPersonInfo( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Fio:TFio read FFio;
    property Contacts:TContacts read FContacts;
    property Position:Tstring255 read FPosition write SetPosition;
    property UseDefaultPersonInfo:String read FUseDefaultPersonInfo write SetUseDefaultPersonInfo;
  end;

  {  TContacts  }
  TContacts = class(TXmlSerializationObject)
  private
    FPhones:TPhones;
    FEmails:TEmails;
    FOtherContactInfo:Tstring255;
    procedure SetOtherContactInfo( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Phones:TPhones read FPhones;
    property Emails:TEmails read FEmails;
    property OtherContactInfo:Tstring255 read FOtherContactInfo write SetOtherContactInfo;
  end;

  {  TPhones  }
  TPhones = class(TXmlSerializationObject)
  private
    FPhone:TXSDStringArray;
    procedure SetPhone( AValue:TXSDStringArray);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Phone:TXSDStringArray read FPhone write SetPhone;
  end;

  {  TEmails  }
  TEmails = class(TXmlSerializationObject)
  private
    FEmail:TXSDStringArray;
    procedure SetEmail( AValue:TXSDStringArray);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Email:TXSDStringArray read FEmail write SetEmail;
  end;

  {  TFio  }
  TFio = class(TXmlSerializationObject)
  private
    FLastName:Tstring60;
    FFirstName:Tstring60;
    FMiddleName:Tstring60;
    procedure SetLastName( AValue:Tstring60);
    procedure SetFirstName( AValue:Tstring60);
    procedure SetMiddleName( AValue:Tstring60);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property LastName:Tstring60 read FLastName write SetLastName;
    property FirstName:Tstring60 read FFirstName write SetFirstName;
    property MiddleName:Tstring60 read FMiddleName write SetMiddleName;
  end;

implementation

  {  TUniversalMessage  }
procedure TUniversalMessage.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('UniversalMessageInfos', 'UniversalMessageInfos', [], '', -1, -1);
  P:=RegisterProperty('Sender', 'Sender', [], '', -1, -1);
  P:=RegisterProperty('Recipient', 'Recipient', [], '', -1, -1);
end;

procedure TUniversalMessage.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FUniversalMessageInfos:=TUniversalMessageInfos.Create;
  FSender:=TPersonInfo.Create;
  FRecipient:=TPersonInfo.Create;
end;

destructor TUniversalMessage.Destroy;
begin
  FUniversalMessageInfos.Free;
  FSender.Free;
  FRecipient.Free;
  inherited Destroy;
end;

function TUniversalMessage.RootNodeName:string;
begin
  Result:='UniversalMessage';
end;

constructor TUniversalMessage.Create;
begin
  inherited Create;
end;

  {  TUniversalMessageInfos  }
procedure TUniversalMessageInfos.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('UniversalMessageInfo', 'UniversalMessageInfo', [], '', -1, -1);
end;

procedure TUniversalMessageInfos.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FUniversalMessageInfo:=TUniversalMessageInfoList.Create;
end;

destructor TUniversalMessageInfos.Destroy;
begin
  FUniversalMessageInfo.Free;
  inherited Destroy;
end;

constructor TUniversalMessageInfos.Create;
begin
  inherited Create;
end;

  {  TUniversalMessageInfo  }
procedure TUniversalMessageInfo.SetPlainText(AValue: Tstring10000);
begin
  CheckStrMinSize('PlainText', AValue);
  CheckStrMaxSize('PlainText', AValue);
  FPlainText:=AValue;
  ModifiedProperty('PlainText');
end;

procedure TUniversalMessageInfo.SetStatusCode(AValue: Int64);
begin
  FStatusCode:=AValue;
  ModifiedProperty('StatusCode');
end;

procedure TUniversalMessageInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('PlainText', 'PlainText', [xsaSimpleObject], '', 1, 10000);
  P:=RegisterProperty('StatusCode', 'StatusCode', [xsaRequared], '', -1, -1);
    P.TotalDigits := 4;
    P.FractionDigits := 0;
end;

procedure TUniversalMessageInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TUniversalMessageInfo.Destroy;
begin
  inherited Destroy;
end;

constructor TUniversalMessageInfo.Create;
begin
  inherited Create;
end;

  {  TPersonInfo  }
procedure TPersonInfo.SetPosition(AValue: Tstring255);
begin
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TPersonInfo.SetUseDefaultPersonInfo(AValue: String);
begin
  CheckLockupValue('UseDefaultPersonInfo', AValue);
  FUseDefaultPersonInfo:=AValue;
  ModifiedProperty('UseDefaultPersonInfo');
end;

procedure TPersonInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Fio', 'Fio', [], '', -1, -1);
  P:=RegisterProperty('Contacts', 'Contacts', [], '', -1, -1);
  P:=RegisterProperty('Position', 'Position', [], '', 1, 255);
  P:=RegisterProperty('UseDefaultPersonInfo', 'UseDefaultPersonInfo', [xsaRequared], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
end;

procedure TPersonInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FFio:=TFio.Create;
  FContacts:=TContacts.Create;
end;

destructor TPersonInfo.Destroy;
begin
  FFio.Free;
  FContacts.Free;
  inherited Destroy;
end;

constructor TPersonInfo.Create;
begin
  inherited Create;
end;

  {  TContacts  }
procedure TContacts.SetOtherContactInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OtherContactInfo', AValue);
  CheckStrMaxSize('OtherContactInfo', AValue);
  FOtherContactInfo:=AValue;
  ModifiedProperty('OtherContactInfo');
end;

procedure TContacts.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Phones', 'Phones', [], '', -1, -1);
  P:=RegisterProperty('Emails', 'Emails', [], '', -1, -1);
  P:=RegisterProperty('OtherContactInfo', 'OtherContactInfo', [], '', 1, 255);
end;

procedure TContacts.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FPhones:=TPhones.Create;
  FEmails:=TEmails.Create;
end;

destructor TContacts.Destroy;
begin
  FPhones.Free;
  FEmails.Free;
  inherited Destroy;
end;

constructor TContacts.Create;
begin
  inherited Create;
end;

  {  TPhones  }
procedure TPhones.SetPhone(AValue: TXSDStringArray);
var
  V:Tstring20;
begin
  for V in AValue do
  begin
    CheckStrMinSize('Phone', V);
    CheckStrMaxSize('Phone', V);
  end;
  FPhone:=AValue;
  ModifiedProperty('Phone');
end;

procedure TPhones.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Phone', 'Phone', [xsaSimpleObject], '', 1, 20);
end;

procedure TPhones.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TPhones.Destroy;
begin
  inherited Destroy;
end;

constructor TPhones.Create;
begin
  inherited Create;
end;

  {  TEmails  }
procedure TEmails.SetEmail(AValue: TXSDStringArray);
var
  V:Tstring100;
begin
  for V in AValue do
  begin
    CheckStrMinSize('Email', V);
    CheckStrMaxSize('Email', V);
  end;
  FEmail:=AValue;
  ModifiedProperty('Email');
end;

procedure TEmails.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Email', 'Email', [xsaSimpleObject], '', 1, 100);
end;

procedure TEmails.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TEmails.Destroy;
begin
  inherited Destroy;
end;

constructor TEmails.Create;
begin
  inherited Create;
end;

  {  TFio  }
procedure TFio.SetLastName(AValue: Tstring60);
begin
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TFio.SetFirstName(AValue: Tstring60);
begin
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TFio.SetMiddleName(AValue: Tstring60);
begin
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TFio.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 60);
end;

procedure TFio.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TFio.Destroy;
begin
  inherited Destroy;
end;

constructor TFio.Create;
begin
  inherited Create;
end;

end.
