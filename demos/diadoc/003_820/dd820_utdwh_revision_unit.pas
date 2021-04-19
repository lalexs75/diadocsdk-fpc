unit dd820_utdwh_revision_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject;

function TestUTDWHRevision:TMemoryStream;
implementation
uses UniversalTransferDocumentRevision_SCHF_utd820_05_01_01_hyphen;

function TestUTDWHRevision: TMemoryStream;
var
  U: TUniversalTransferDocumentWithHyphens;
  Seler1: TExtendedOrganizationInfoWithHyphens;
  Buyer1: TExtendedOrganizationInfoWithHyphens;
  Shipper1: TUniversalTransferDocumentWithHyphens_Shippers_Shipper;
  Consignee1: TExtendedOrganizationInfoWithHyphens;
  TT: TInvoiceTable_Item;
  TTC: TCustomsDeclarationWithHyphens;
  PD: TPaymentDocumentInfo;
  TB: TTransferBase820;
begin
  U:=TUniversalTransferDocumentWithHyphens.Create;
  U.Function1:='СЧФ';
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

  U.Signers.SignerDetails.FirstName:='Подписант';
  U.Signers.SignerDetails.LastName:='Подписантов';
  U.Signers.SignerDetails.MiddleName:='Ивнавич';
  U.Signers.SignerDetails.RegistrationCertificate:='1';
  U.Signers.SignerDetails.SignerPowers:=0;
  U.Signers.SignerDetails.SignerType:='3';
  U.Signers.SignerDetails.SignerStatus:=1;
  U.Signers.SignerDetails.SignerPowersBase:='Должностные обязонности';

  U.Table.Vat:=123.4;
  U.Table.TotalWithVatExcluded:=123.4;
  U.Table.Total:=123.4;
  U.Table.TotalNet:=123.4;

  TT:=U.Table.Item.AddItem;
  TT.Product:='Товар № 1';
  TT.TaxRate:='20%';
  TT.Subtotal:=123.45;
  TT.Unit1:='796';
  TT.Vat:=123;
  TTC:=TT.CustomsDeclarations.CustomsDeclaration.AddItem;
  TTC.Country:='804';
  TTC.DeclarationNumber:='10108030/170919/0000744';

  TT:=U.Table.Item.AddItem;
  TT.Product:='Товар № 2';
  TT.TaxRate:='20%';
  TT.Subtotal:=123.45;
  TT.Unit1:='796';
  TT.Vat:=123;
{  TTC:=TT.CustomsDeclarations.AddItem;
  TTC.Country:='804';
  TTC.DeclarationNumber:='10108030/170919/0000744';}


  PD:=U.PaymentDocuments.Document.AddItem;
  PD.Date:='01.01.2019';
  PD.Number:='12323';
  PD.Total:=1234.50;

  TB:=U.TransferInfo.TransferBases.TransferBase.AddItem;
  TB.BaseDocumentId:='123';
  TB.BaseDocumentDate:='01.01.2019';
  TB.BaseDocumentName:='Документа';
  TB.BaseDocumentNumber:='1231';
  TB.BaseDocumentInfo:='Примечание к транспортному документу';
  U.TransferInfo.OperationInfo:='Примеяание';

  Result:=TMemoryStream.Create;
  U.SaveToStream(Result);
  U.Free;
end;

end.
//TExtendedSignerDetails_SellerTitle: property SignerPowers requared value


