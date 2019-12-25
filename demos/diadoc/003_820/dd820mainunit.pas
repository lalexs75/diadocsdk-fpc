unit dd820MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DiadocAPI,
  RxCloseFormValidator, RxIniPropStorage, DiadocTypes_Organization, httpsend;

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
    RxCloseFormValidator1: TRxCloseFormValidator;
    RxIniPropStorage1: TRxIniPropStorage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DiadocAPI1HttpStatus(Sender: TDiadocAPI; AHTTP: THTTPSend);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    FBoxID: String;
    FMyOrgs: TOrganizationList;
    procedure DoConnect;
  public

  end;

var
  dd820MainForm: Tdd820MainForm;

implementation

uses ssl_openssl_lib, Unit2;

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
(*
  //POST /GenerateTitleXml?boxId=a96be310-0982-461a-8b2a-91d198b7861c&documentTypeNamedId=Invoice&documentFunction=default&documentVersion=utd820_05_01_01&titleIndex=0 HTTP/1.1
  M.LoadFromFile('/home/alexs/1/1/aa.xml');
  M1:=DiadocAPI1.GenerateTitleXml(FBoxID, 'UniversalTransferDocument', 'СЧФ', 'utd820_05_01_01_hyphen', 0, M);
  //M1:=DiadocAPI1.GenerateTitleXml(FBoxID, 'Invoice', 'default', 'utd820_05_01_01', 0, M);

  //POST /GenerateSenderTitleXml?boxId=a96be310-0982-461a-8b2a-91d198b7861c&documentTypeNamedId=UniversalTransferDocument&documentFunction=ДОП&documentVersion=utd_05_01_04 HTTP/1.1
  //M.LoadFromFile('/home/alexs/1/1/aa1.xml');
  //M1:=DiadocAPI1.GenerateSenderTitleXml(FBoxID, 'UniversalTransferDocument', 'default', 'utd820_05_01_01_hyphen', M, '', false);
*)

//GetContent?typeNamedId=UniversalTransferDocument&function=%u0421%u0427%u0424&version=utd820_05_01_01_hyphen&titleIndex=0&contentType=UserContractXsd

  M.LoadFromFile('/home/alexs/1/1/u1.xml');
  M1:=DiadocAPI1.GenerateTitleXml(FBoxID, 'UniversalTransferDocument', 'СЧФ', 'utd820_05_01_01_hyphen', 0, M);
  if Assigned(M1) then
  begin
    M1.SaveToFile('/home/alexs/3/UniversalTransferDocument_001.xml');
    M1.Free;
    ShowMessage('Успех');
  end
  else
    ShowMessage('Ошибка - смотри логи');

  M.Free;
end;

procedure Tdd820MainForm.Button3Click(Sender: TObject);
var
  U: TUniversalTransferDocumentWithHyphens;
  Seler1, Buyer1, Consignee1: TExtendedOrganizationInfoWithHyphens;
  TT: TInvoiceItem;
  Shipper1: TShipper;
  Signer1: TSigner;
begin
  U:=TUniversalTransferDocumentWithHyphens.Create;
  U.Funct:='СЧФ';
  U.DocumentName:='12345';
  U.DocumentNumber:='12345';
  U.DocumentDate:='01.01.2019';
  U.Currency:='643';
  U.DocumentCreator:='1';
  U.DocumentCreatorBase:='1';

  Seler1:=U.Sellers.Seller.CreateChild;
  Seler1.OrganizationReference.OrgType:='1';
  Seler1.OrganizationReference.BoxId:='73B75544-B78C-408E-B88D-A044B79F644D'; //'7c715969e0034816b1037da20541a83a@diadoc.ru';

  Buyer1:=U.Buyers.Buyer.CreateChild;
  Buyer1.OrganizationReference.OrgType:='1';
  Buyer1.OrganizationReference.BoxId:='B379AD3C-5737-46CF-88A7-A154683352B9';//'7c715969e0034816b1037da20541a83a@diadoc.ru';

  Shipper1:=U.Shippers.Shipper.CreateChild;
  Shipper1.SameAsSeller:='true';

  Consignee1:=U.Consignees.Consignee.CreateChild;
  Consignee1.OrganizationReference.OrgType:='1';
  Consignee1.OrganizationReference.BoxId:='9B071EDF-1E30-43CD-9232-860C5F12F7D9';//'7c715969e0034816b1037da20541a83a@diadoc.ru';

  //Signer1:=U.Signers.Signer.CreateChild;
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
  TT:=U.Table.Items.CreateChild;
  TT.Product:='Товар № 1';
  TT.TaxRate:='20%';
  TT.Subtotal:='123.45';
  TT.Unt:='796';
  TT.Vat:='123';

  U.SaveToFile('/home/alexs/1/1/u1.xml');
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
  end;
end;

end.

