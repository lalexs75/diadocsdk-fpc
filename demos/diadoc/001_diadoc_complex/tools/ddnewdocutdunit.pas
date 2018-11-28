unit ddNewDocUTDUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DiadocTypes_UniversalTransferDocumentInfo;

function NewUniversalTransferDocumentSellerTitleInfo:TUniversalTransferDocumentSellerTitleInfo;
implementation

function NewUniversalTransferDocumentSellerTitleInfo: TUniversalTransferDocumentSellerTitleInfo;
begin
  Result:=TUniversalTransferDocumentSellerTitleInfo.Create;

  D.FunctionType:TFunctionType read FFunctionType write FFunctionType; //1;
  property DocumentName:string read FDocumentName write FDocumentName;//2;
  property DocumentDate:string read FDocumentDate write FDocumentDate;//3;
  property DocumentNumber:string read FDocumentNumber write FDocumentNumber; //4;
  property Seller:TExtendedOrganizationInfo read FSeller; //5;
  property Buyer:TExtendedOrganizationInfo read FBuyer; //6;
  property Shipper:TShipper read FShipper; //7;
  property Consignee:TExtendedOrganizationInfo read FConsignee; //8;
  property Signers:TExtendedSigners read FSigners; // = 9;
  property PaymentDocuments:TPaymentDocumentInfos read FPaymentDocuments;//10;
  property InvoiceTable:TInvoiceTable read FInvoiceTable; //11
  property Currency:string read FCurrency write FCurrency;//12;
  property CurrencyRate:string read FCurrencyRate write FCurrencyRate; //13;
  property RevisionDate:string read FRevisionDate write FRevisionDate; //14;
  property RevisionNumber:string read FRevisionNumber write FRevisionNumber; //15;
  property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId; //16
  property TransferInfo:TTransferInfo read FTransferInfo; //17;
  property DocumentCreator:string read FDocumentCreator write FDocumentCreator;//18;
  property DocumentCreatorBase:string read FDocumentCreatorBase write FDocumentCreatorBase;//19;
  property GovernmentContractInfo:string read FGovernmentContractInfo write FGovernmentContractInfo;//20
end;

end.

