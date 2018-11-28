unit UniversalTransferDocumentSellerTitleInfoUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, ComCtrls,
  StdCtrls, DB, rxdbgrid, rxmemds, DiadocTypes_UniversalTransferDocumentInfo,
  DiadocTypes_ExtendedSigner,
  DiadocTypes_Torg12Info,
  DiadocTypes_InvoiceInfo;

type

  { TUniversalTransferDocumentSellerTitleInfoForm }

  TUniversalTransferDocumentSellerTitleInfoForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    dsData: TDataSource;
    edtFunctionType: TEdit;
    edtPaymentDocuments: TEdit;
    edtCurrency: TEdit;
    edtRevisionDate: TEdit;
    edtRevisionNumber: TEdit;
    aiAdditionalInfo: TEdit;
    edtTransferInfo: TEdit;
    edtDocumentCreator: TEdit;
    edtDocumentCreatorBase: TEdit;
    edtDocumentName: TEdit;
    edtGovernmentContractInfo: TEdit;
    edtDocumentDate: TEdit;
    edtDocumentNumber: TEdit;
    edtSellerOrgName: TEdit;
    edtBuyerOrgName: TEdit;
    edtShipperOrgName: TEdit;
    edtConsigneeOrgName: TEdit;
    edtSigners: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    rxDataAdditionalInfo: TStringField;
    rxDataAdditionalProperty: TStringField;
    rxDataCustomsDeclaration: TStringField;
    rxDataExcise: TStringField;
    rxDataItemAccountCredit: TStringField;
    rxDataItemAccountDebit: TStringField;
    rxDataItemMark: TStringField;
    rxDataItemToRelease: TStringField;
    rxDataItemVendorCode: TStringField;
    rxDataPrice: TStringField;
    rxDataProduct: TStringField;
    rxDataQuantity: TStringField;
    rxDataSubtotal: TStringField;
    rxDataSubtotalWithVatExcluded: TStringField;
    rxDataTaxRate: TStringField;
    rxDataUnitName: TStringField;
    rxDataVat: TStringField;
    RxDBGrid1: TRxDBGrid;
    rxData: TRxMemoryData;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure FormCreate(Sender: TObject);
  private
    procedure FillInvoiceTable(ATableInfo:TInvoiceTable);
    procedure FillInvoiceTable(ATableInfo:TInvoiceItems);
    procedure FillTorg12Table(ATableInfo:TTorg12Items);
  public
    procedure OpenInfo(AInfo:TUniversalTransferDocumentSellerTitleInfo);
    procedure OpenInfo(AInfo:TInvoiceInfo);
    procedure OpenInfo(AInfo:TTorg12SellerTitleInfo);
  end;

var
  UniversalTransferDocumentSellerTitleInfoForm: TUniversalTransferDocumentSellerTitleInfoForm;

implementation

{$R *.lfm}

{ TUniversalTransferDocumentSellerTitleInfoForm }

procedure TUniversalTransferDocumentSellerTitleInfoForm.FormCreate(
  Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
end;

procedure TUniversalTransferDocumentSellerTitleInfoForm.FillInvoiceTable(
  ATableInfo: TInvoiceTable);
var
  Itm: TExtendedInvoiceItem;
  CD: TCustomsDeclaration;
  AI: TAdditionalInfo;
begin
  if not Assigned(ATableInfo) then Exit;
  rxData.CloseOpen;

  for Itm in ATableInfo.Items do
  begin
    rxData.Append;
    rxDataProduct.AsString:=Itm.Product;
    rxDataUnitName.AsString:=Itm.UnitName + ' ('+ Itm.Unt + ')';
    rxDataQuantity.AsString:=Itm.Quantity;
    rxDataPrice.AsString:=Itm.Price;
    rxDataExcise.AsString:=Itm.Excise;
    rxDataTaxRate.AsString:=TaxRateToStr(Itm.TaxRate);
    rxDataSubtotalWithVatExcluded.AsString:=Itm.Subtotal;
    rxDataVat.AsString:=Itm.Vat;
    rxDataSubtotal.AsString:=Itm.Subtotal;

    for CD in Itm.CustomsDeclarations do
      rxDataCustomsDeclaration.AsString:=CD.CountryCode + ' ' + CD.DeclarationNumber;

    rxDataItemMark.AsString:=ItemMarkToStr(Itm.ItemMark);
    rxDataAdditionalProperty.AsString:=Itm.AdditionalProperty;
    rxDataItemVendorCode.AsString:=Itm.ItemVendorCode;
    rxDataItemToRelease.AsString:=Itm.ItemToRelease;
    rxDataItemAccountCredit.AsString:=Itm.ItemAccountCredit;
    rxDataItemAccountDebit.AsString:=Itm.ItemAccountDebit;

    for AI in Itm.AdditionalInfo do
      rxDataAdditionalInfo.AsString:=rxDataAdditionalInfo.AsString + AI.Id + ':' + AI.Value + ';';
    rxData.Post;
  end;
end;

procedure TUniversalTransferDocumentSellerTitleInfoForm.FillInvoiceTable(
  ATableInfo: TInvoiceItems);
var
  Itm:TInvoiceItem;
  AI:TAdditionalInfo;
  CD:TCustomsDeclaration;
begin
  if not Assigned(ATableInfo) then Exit;
  rxData.CloseOpen;

  for Itm in ATableInfo do
  begin
    rxData.Append;
    rxDataProduct.AsString:=Itm.Product;
    rxDataUnitName.AsString:=Itm.UnitName + ' ('+ Itm.Unt + ')';
    rxDataQuantity.AsString:=Itm.Quantity;
    rxDataPrice.AsString:=Itm.Price;
    rxDataExcise.AsString:=Itm.Excise;
    rxDataTaxRate.AsString:=TaxRateToStr(Itm.TaxRate);
    rxDataSubtotalWithVatExcluded.AsString:=Itm.Subtotal;
    rxDataVat.AsString:=Itm.Vat;
    rxDataSubtotal.AsString:=Itm.Subtotal;

    rxDataCustomsDeclaration.AsString:=Itm.CustomsDeclarationNumbers.Text;
    for CD in Itm.CustomsDeclarations do
      rxDataCustomsDeclaration.AsString:=rxDataCustomsDeclaration.AsString + CD.CountryCode + ' ' + CD.DeclarationNumber;

    //rxDataItemMark.AsString:=ItemMarkToStr(Itm.ItemMark);
//    rxDataAdditionalProperty.AsString:=Itm.AdditionalProperty;
//    rxDataItemVendorCode.AsString:=Itm.ItemVendorCode;
//    rxDataItemToRelease.AsString:=Itm.ItemToRelease;
//    rxDataItemAccountCredit.AsString:=Itm.ItemAccountCredit;
//    rxDataItemAccountDebit.AsString:=Itm.ItemAccountDebit;

    rxDataAdditionalInfo.AsString:=Itm.AdditionalInfo;
    for AI in Itm.AdditionalInfos do
      rxDataAdditionalInfo.AsString:=rxDataAdditionalInfo.AsString + AI.Id + ':' + AI.Value + ';';

    //property CountriesOfOrigin:TDocumentStrings read FCountriesOfOrigin; //5
    //property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write FSubtotalWithVatExcluded;//9
    //property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo;//12
    //property CustomsDeclarations:TCustomsDeclarations read FCustomsDeclarations; //13

    rxData.Post;
  end;
end;

procedure TUniversalTransferDocumentSellerTitleInfoForm.FillTorg12Table(
  ATableInfo: TTorg12Items);
var
  Itm:TTorg12Item;
begin
  if not Assigned(ATableInfo) then Exit;
  rxData.CloseOpen;

  for Itm in ATableInfo do
  begin
    rxData.Append;
    rxDataProduct.AsString:=Itm.Name;
    rxDataUnitName.AsString:=Itm.UnitName + ' ('+ Itm.UnitCode + ')';
    rxDataQuantity.AsString:=Itm.Quantity;
    rxDataPrice.AsString:=Itm.Price;
//    rxDataExcise.AsString:=Itm.Excise;
    rxDataTaxRate.AsString:=Itm.TaxRate;
    rxDataSubtotalWithVatExcluded.AsString:=Itm.Subtotal;
    rxDataVat.AsString:=Itm.Vat;
    rxDataSubtotal.AsString:=Itm.Subtotal;

//    for CD in Itm.CustomsDeclarations do
//      rxDataCustomsDeclaration.AsString:=CD.CountryCode + ' ' + CD.DeclarationNumber;

//    rxDataItemMark.AsString:=ItemMarkToStr(Itm.ItemMark);
//    rxDataAdditionalProperty.AsString:=Itm.AdditionalProperty;
//    rxDataItemVendorCode.AsString:=Itm.ItemVendorCode;
//    rxDataItemToRelease.AsString:=Itm.ItemToRelease;
//    rxDataItemAccountCredit.AsString:=Itm.ItemAccountCredit;
//    rxDataItemAccountDebit.AsString:=Itm.ItemAccountDebit;

    rxDataAdditionalInfo.AsString:=Itm.AdditionalInfo;
    rxData.Post;
  end;
end;

procedure TUniversalTransferDocumentSellerTitleInfoForm.OpenInfo(
  AInfo: TUniversalTransferDocumentSellerTitleInfo);
var
  Sig: TExtendedSigner;
  PD: TPaymentDocumentInfo;
  AI: TAdditionalInfo;
begin
  if not Assigned(AInfo) then exit;

  edtFunctionType.Text:=FunctionTypeToStr(AInfo.FunctionType);
  edtDocumentName.Text:=AInfo.DocumentName;
  edtDocumentDate.Text:=AInfo.DocumentDate;
  edtDocumentNumber.Text:=AInfo.DocumentNumber;
  edtSellerOrgName.Text:=AInfo.Seller.OrgName;
  edtBuyerOrgName.Text:=AInfo.Buyer.OrgName;

  if AInfo.Shipper.SameAsSeller then
    edtShipperOrgName.Text:='Он же (продавец) : ' + AInfo.Seller.OrgName
  else
    edtShipperOrgName.Text:=AInfo.Shipper.OrgInfo.OrgName;

  edtConsigneeOrgName.Text:=AInfo.Consignee.OrgName;

  edtSigners.Text:='';
  for Sig in AInfo.Signers do
    edtSigners.Text:=edtSigners.Text +Sig.BoxId + ' ';

  edtPaymentDocuments.Text:='';
  for PD in AInfo.PaymentDocuments do
    edtPaymentDocuments.Text:=edtPaymentDocuments.Text + '№ '+ PD.DocumentNumber + ' от ' + PD.DocumentDate;

  FillInvoiceTable(AInfo.InvoiceTable);

  edtCurrency.Text:=AInfo.Currency + '('+AInfo.CurrencyRate + ')';

  edtRevisionDate.Text:=AInfo.RevisionDate;
  edtRevisionNumber.Text:=AInfo.RevisionNumber;

  aiAdditionalInfo.Text:='';
  for AI in AInfo.AdditionalInfoId.AdditionalInfo do
    aiAdditionalInfo.Text:=aiAdditionalInfo.Text + AI.Id+':'+AI.Value+';';

  edtTransferInfo.Text:=AInfo.TransferInfo.CreatedThingInfo + ' ' + AInfo.TransferInfo.CreatedThingTransferDate + ' ...';

  edtDocumentCreator.Text:=AInfo.DocumentCreator;
  edtDocumentCreatorBase.Text:=AInfo.DocumentCreatorBase;

  edtGovernmentContractInfo.Text:=AInfo.GovernmentContractInfo;
end;

procedure TUniversalTransferDocumentSellerTitleInfoForm.OpenInfo(
  AInfo: TInvoiceInfo);
var
  PD:TPaymentDocumentInfo;
begin
  Caption:='Счёт-фактура';
  if not Assigned(AInfo) then exit;
  edtFunctionType.Text:='';
  edtDocumentName.Text:='';
  edtDocumentDate.Text:=AInfo.InvoiceDate;
  edtDocumentNumber.Text:=AInfo.InvoiceNumber;
  edtSellerOrgName.Text:=AInfo.Seller.OrgInfo.Name;
  edtBuyerOrgName.Text:=AInfo.Buyer.OrgInfo.Name;
  if AInfo.Shipper.SameAsSellerOrBuyer then
    edtShipperOrgName.Text:='Он же (продавец) : ' + AInfo.Seller.OrgInfo.Name
  else
    edtShipperOrgName.Text:=AInfo.Shipper.OrgInfo.Name;

  edtConsigneeOrgName.Text:=AInfo.Consignee.OrgInfo.Name;

  edtSigners.Text:=AInfo.Signer.SignerDetails.JobTitle + AInfo.Signer.SignerDetails.FirstName + AInfo.Signer.SignerDetails.Surname;

  edtPaymentDocuments.Text:='';
  for PD in AInfo.PaymentDocuments do
    edtPaymentDocuments.Text:=edtPaymentDocuments.Text + '№ '+ PD.DocumentNumber + ' от ' + PD.DocumentDate;

  FillInvoiceTable(AInfo.Items);
(*  property Currency:string read FCurrency write FCurrency; //10;
  property TotalWithVatExcluded:string read FTotalWithVatExcluded write FTotalWithVatExcluded; //11;
  property Vat:string read FVat write FVat; //12;
  property Total:string read FTotal write FTotal; //13;
  property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo; //14;
  property InvoiceRevisionDate:string read FInvoiceRevisionDate write FInvoiceRevisionDate; //15;
  property InvoiceRevisionNumber:string read FInvoiceRevisionNumber write FInvoiceRevisionNumber; //16;
  property AdditionalInfos:TAdditionalInfos read FAdditionalInfos; //17
  property Version:TInvoiceFormatVersion read FVersion write FVersion default DefaultInvoiceFormatVersion; //18




  edtCurrency.Text:=AInfo.Currency + '('+AInfo.CurrencyRate + ')';

  edtRevisionDate.Text:=AInfo.RevisionDate;
  edtRevisionNumber.Text:=AInfo.RevisionNumber;

  aiAdditionalInfo.Text:='';
  for AI in AInfo.AdditionalInfoId.AdditionalInfo do
    aiAdditionalInfo.Text:=aiAdditionalInfo.Text + AI.Id+':'+AI.Value+';';

  edtTransferInfo.Text:=AInfo.TransferInfo.CreatedThingInfo + ' ' + AInfo.TransferInfo.CreatedThingTransferDate + ' ...';

  edtDocumentCreator.Text:=AInfo.DocumentCreator;
  edtDocumentCreatorBase.Text:=AInfo.DocumentCreatorBase;

  edtGovernmentContractInfo.Text:=AInfo.GovernmentContractInfo;
*)
end;

procedure TUniversalTransferDocumentSellerTitleInfoForm.OpenInfo(
  AInfo: TTorg12SellerTitleInfo);
begin
  if not Assigned(AInfo) then exit;

  edtFunctionType.Text:=''; //FunctionTypeToStr(AInfo.FunctionType);
  //edtDocumentName.Text:=AInfo.DocumentNumber;
  edtDocumentDate.Text:=AInfo.DocumentDate;
  edtDocumentNumber.Text:=AInfo.DocumentNumber;
  //edtSellerOrgName.Text:=AInfo.SellerDocflowParticipant.OrgName;
  //edtBuyerOrgName.Text:=AInfo.Buyer.OrgName;

  edtShipperOrgName.Text:=AInfo.Shipper.Name;
  edtConsigneeOrgName.Text:=AInfo.Consignee.Name;

  edtSigners.Text:=AInfo.Signer.SignerDetails.FirstName;

  edtPaymentDocuments.Text:='';
//  for PD in AInfo.PaymentDocuments do
//    edtPaymentDocuments.Text:=edtPaymentDocuments.Text + '№ '+ PD.DocumentNumber + ' от ' + PD.DocumentDate;

  FillTorg12Table(AInfo.Items);

//  edtCurrency.Text:=AInfo.Currency + '('+AInfo.CurrencyRate + ')';

//  edtRevisionDate.Text:=AInfo.RevisionDate;
//  edtRevisionNumber.Text:=AInfo.RevisionNumber;

  aiAdditionalInfo.Text:='';
//  for AI in AInfo.AdditionalInfoId.AdditionalInfo do
    //aiAdditionalInfo.Text:=aiAdditionalInfo.Text + AI.Id+':'+AI.Value+';';

//  edtTransferInfo.Text:=AInfo.TransferInfo.CreatedThingInfo + ' ' + AInfo.TransferInfo.CreatedThingTransferDate + ' ...';

//  edtDocumentCreator.Text:=AInfo.DocumentCreator;
//  edtDocumentCreatorBase.Text:=AInfo.DocumentCreatorBase;

//  edtGovernmentContractInfo.Text:=AInfo.GovernmentContractInfo;
end;

end.

