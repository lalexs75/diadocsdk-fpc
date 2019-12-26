unit dd820MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  DiadocAPI, RxCloseFormValidator, RxIniPropStorage, DiadocTypes_Organization,
  httpsend;

type

  { Tdd820MainForm }

  Tdd820MainForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CLabel: TLabel;
    DiadocAPI1: TDiadocAPI;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    PageControl1: TPageControl;
    RxCloseFormValidator1: TRxCloseFormValidator;
    RxIniPropStorage1: TRxIniPropStorage;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DiadocAPI1HttpStatus(Sender: TDiadocAPI; AHTTP: THTTPSend);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FSaveDataXmlName:string;
    FResultDocXmlName:string;
    FBoxID: String;
    FMyOrgs: TOrganizationList;
    procedure DoConnect;
  public

  end;

var
  dd820MainForm: Tdd820MainForm;

implementation

uses LazFileUtils, ssl_openssl_lib, UserContract_820_05_01_01_Hyphen;

{$R *.lfm}

{ Tdd820MainForm }

procedure Tdd820MainForm.Button1Click(Sender: TObject);
begin
  if not RxCloseFormValidator1.CheckCloseForm then Exit;
  DoConnect;
end;

procedure Tdd820MainForm.Button2Click(Sender: TObject);
var
  M, M1: TMemoryStream;
begin
  Button3Click(nil);

  M:=TMemoryStream.Create;
  M.LoadFromFile(FSaveDataXmlName);
  M1:=DiadocAPI1.GenerateTitleXml(FBoxID, 'UniversalTransferDocument', 'СЧФ', 'utd820_05_01_01_hyphen', 0, M);
  if Assigned(M1) then
  begin
    M1.SaveToFile(FResultDocXmlName);
    M1.Position:=0;
    Memo2.Lines.LoadFromStream(M1, TEncoding.GetEncoding(1251));
    M1.Free;
    ShowMessage('Успех');
  end
  else
  begin
    Memo2.Lines.LoadFromFile(GetTempDir(false) + PathDelim + 'GenerateTitleXml.xml');
    ShowMessage('Ошибка - смотри логи');
  end;

  M.Free;
end;

procedure Tdd820MainForm.Button3Click(Sender: TObject);
var
  U: TUniversalTransferDocumentWithHyphens;
  Seler1, Buyer1, Consignee1: TExtendedOrganizationInfoWithHyphens;
  TT: TInvoiceItem;
  Shipper1: TShipper;
  Signer1: TSigner;
  PD: TPaymentDocumentInfo;
  TB: TTransferBase820;
begin
  U:=TUniversalTransferDocumentWithHyphens.Create;
  U.Funct:='СЧФ';
  U.DocumentName:='12345';
  U.DocumentNumber:='12345';
  U.DocumentDate:='01.01.2019';
  U.Currency:='643';
  U.DocumentCreator:='1';
  U.DocumentCreatorBase:='1';

  Seler1:=U.Sellers.Seller.AddItem;
  Seler1.OrganizationReference.OrgType:='1';
  //Seler1.OrganizationReference.BoxId:='73B75544-B78C-408E-B88D-A044B79F644D';  <--test fro error code
  Seler1.OrganizationReference.BoxId:='7c715969-e003-4816-b103-7da20541a83a';

  Buyer1:=U.Buyers.Buyer.AddItem;
  Buyer1.OrganizationReference.OrgType:='1';
  //Buyer1.OrganizationReference.BoxId:='B379AD3C-5737-46CF-88A7-A154683352B9';  <--test fro error code
  Buyer1.OrganizationReference.BoxId:='7c715969-e003-4816-b103-7da20541a83a';

  Shipper1:=U.Shippers.Shipper.AddItem;
  Shipper1.SameAsSeller:='true';

  Consignee1:=U.Consignees.Consignee.AddItem;
  Consignee1.OrganizationReference.OrgType:='1';
  //Consignee1.OrganizationReference.BoxId:='9B071EDF-1E30-43CD-9232-860C5F12F7D9'; <--test fro error code
  Consignee1.OrganizationReference.BoxId:='7c715969-e003-4816-b103-7da20541a83a';

  Signer1:=U.Signers;
  Signer1.SignerDetails.FirstName:='Подписант';
  Signer1.SignerDetails.LastName:='Подписантов';
  Signer1.SignerDetails.MiddleName:='Ивнавич';
  Signer1.SignerDetails.RegistrationCertificate:='1';
  Signer1.SignerDetails.SignerPowers:='0';
  Signer1.SignerDetails.SignerType:='3';
  Signer1.SignerDetails.SignerStatus:='1';
  Signer1.SignerDetails.SignerPowersBase:='Должностные обязонности';

  U.Table.Vat:='123.4';
  U.Table.TotalWithVatExcluded:='123.4';
  U.Table.Total:='123.4';
  U.Table.TotalNet:='123.4';
  TT:=U.Table.Items.AddItem;
  TT.Product:='Товар № 1';
  TT.TaxRate:='20%';
  TT.Subtotal:='123.45';
  TT.Unt:='796';
  TT.Vat:='123';

  PD:=U.PaymentDocuments.Documents.AddItem;
  PD.Date:='01.01.2019';
  PD.Number:='12323';
  PD.Total:='1234.50';

  TB:=U.TransferInfo.TransferBases.TransferBase.AddItem;
  TB.BaseDocumentId:='123';
  TB.BaseDocumentDate:='01.01.2019';
  TB.BaseDocumentName:='Документа';
  TB.BaseDocumentNumber:='1231';
  TB.BaseDocumentInfo:='Примечание к транспортному документу';
  U.TransferInfo.OperationInfo:='Примеяание';

  U.SaveToFile(FSaveDataXmlName);
  U.Free;
end;

procedure Tdd820MainForm.DiadocAPI1HttpStatus(Sender: TDiadocAPI;
  AHTTP: THTTPSend);
begin
  Memo1.Lines.Assign(DiadocAPI1.ResultText);
end;

procedure Tdd820MainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if Assigned(FMyOrgs) then
    FreeAndNil(FMyOrgs);
end;

procedure Tdd820MainForm.FormCreate(Sender: TObject);
begin
  FSaveDataXmlName:=AppendPathDelim(ExtractFileDir(ParamStr(0))) + 'data' + DirectorySeparator + 'UC_820_05_01_01_Hyphen.xml';
  FResultDocXmlName:=AppendPathDelim(ExtractFileDir(ParamStr(0))) + 'data' + DirectorySeparator + 'UniversalTransferDocument_001.xml';
  Button2.Enabled:=false;
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
end;

procedure Tdd820MainForm.DoConnect;
var
  O:TOrganization;
  B:TBox;
begin
  DiadocAPI1.ApiClientId:=Edit1.Text;
  DiadocAPI1.UserName:=Edit2.Text;
  DiadocAPI1.Password:=Edit3.Text;
  FMyOrgs:=DiadocAPI1.GetMyOrganizations;
  if not Assigned(FMyOrgs) then
    raise Exception.Create('Ошибка инициализации Diadoc (не полученна информация об организации).')
  else
  begin
    FBoxID:=FMyOrgs.Organizations[0].Boxes[0].BoxId;
    for O in FMyOrgs.Organizations do
    begin
      Memo2.Lines.Add('FullName ' + O.FullName);
      for B in O.Boxes do
      begin
        Memo2.Lines.Add(' BoxId ' + B.BoxId);
      end;
    end;
    Button1.Enabled:=false;
    Button2.Enabled:=true;
  end;
end;

end.

