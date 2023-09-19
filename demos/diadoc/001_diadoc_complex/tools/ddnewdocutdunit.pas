{
  Комплексный пример работы с ДИАДОК

  Copyright (C) 2018-2023 Lagunov Aleksey alexs75@yandex.ru

  Этот исходный код является свободно-распространяемым программынм обеспечением.
  Вы можете распространять и (или) модифицировать его при условии соблюдения
  условий лицензии GPL2, опублиованной Фондом свободного програмного обеспечения
  (FSF).

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
  MA 02111-1307, USA.
}

unit ddNewDocUTDUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DiadocTypes_UniversalTransferDocumentInfo,
  DiadocTypes_ExtendedSigner;

function NewUniversalTransferDocumentSellerTitleInfo:TUniversalTransferDocumentSellerTitleInfo;
implementation
uses DiadocTypes_ExtendedOrganizationInfo, DiadocTypes_InvoiceInfo;

function NewUniversalTransferDocumentSellerTitleInfo: TUniversalTransferDocumentSellerTitleInfo;
var
  Signer: TExtendedSigner;
  T: TExtendedInvoiceItem;
begin
  Result:=TUniversalTransferDocumentSellerTitleInfo.Create;

  Result.FunctionType:=TFunctionType.Invoice;
  Result.DocumentName:='УПД';
  Result.DocumentDate:='01.12.2018';
  Result.DocumentNumber:='1';

  Result.Seller.BoxId:='';
  Result.Seller.OrgName:='ООО "Василёк"';
  Result.Seller.Inn:='2635024103';
  Result.Seller.Kpp:='262350001';
  Result.Seller.Address.RussianAddress.Apartment:='1';
  Result.Seller.Address.RussianAddress.ZipCode:='356236';
  Result.Seller.Address.RussianAddress.Region:='26';
  Result.Seller.Address.RussianAddress.Territory:='Ставропольский край';
  Result.Seller.Address.RussianAddress.City:='Ставрополь';
  Result.Seller.Address.RussianAddress.Locality:='Ставрополь';
  Result.Seller.Address.RussianAddress.Street:='Мира';
  Result.Seller.Address.RussianAddress.Building:='1';
  Result.Seller.Address.RussianAddress.Block:='a';
  //Result.Seller.FnsParticipantId:='2634'
  Result.Seller.OrgType:=TOrgType.LegalEntity;
  Result.Seller.Okopf:='';
  Result.Seller.Okpo:='';
  Result.Seller.Okdp:='';
  Result.Seller.Phone:='1234567890';
  Result.Seller.Email:='aa@aa.aa';
  //Result.Seller.CorrespondentAccount:='12345678901234567890';
  //Result.Seller.BankAccountNumber:='';
  //Result.Seller.BankName:string read FBankName write FBankName; //15;
  //Result.Seller.BankId:string read FBankId write FBankId; //16;
  //Result.Seller.Department:string read FDepartment write FDepartment; //17;
  //Result.Seller.OrganizationAdditionalInfo:string read FOrganizationAdditionalInfo write FOrganizationAdditionalInfo; //18;
  //Result.Seller.OrganizationOrPersonInfo:string read FOrganizationOrPersonInfo write FOrganizationOrPersonInfo; //19;
  //Result.Seller.IndividualEntityRegistrationCertificate:string read FIndividualEntityRegistrationCertificate write FIndividualEntityRegistrationCertificate; //20;
  //Result.Seller.Country:=''

  Result.Buyer.BoxId:='';
  Result.Buyer.OrgName:='ООО "Василёк"';
  Result.Buyer.Inn:='2635024103';
  Result.Buyer.Kpp:='262350001';
  Result.Buyer.Address.RussianAddress.Apartment:='1';
  Result.Buyer.Address.RussianAddress.ZipCode:='356236';
  Result.Buyer.Address.RussianAddress.Region:='26';
  Result.Buyer.Address.RussianAddress.Territory:='Ставропольский край';
  Result.Buyer.Address.RussianAddress.City:='Ставрополь';
  Result.Buyer.Address.RussianAddress.Locality:='Ставрополь';
  Result.Buyer.Address.RussianAddress.Street:='Мира';
  Result.Buyer.Address.RussianAddress.Building:='1';
  Result.Buyer.Address.RussianAddress.Block:='a';
  //Result.Buyer.FnsParticipantId:='2634'
  Result.Buyer.OrgType:=TOrgType.LegalEntity;
  Result.Buyer.Okopf:='';
  Result.Buyer.Okpo:='';
  Result.Buyer.Okdp:='';
  Result.Buyer.Phone:='1234567890';
  Result.Buyer.Email:='aa@aa.aa';
  //Result.Buyer.CorrespondentAccount:='12345678901234567890';
  //Result.Buyer.BankAccountNumber:='';
  //Result.Buyer.BankName:string read FBankName write FBankName; //15;
  //Result.Buyer.BankId:string read FBankId write FBankId; //16;
  //Result.Buyer.Department:string read FDepartment write FDepartment; //17;
  //Result.Buyer.OrganizationAdditionalInfo:string read FOrganizationAdditionalInfo write FOrganizationAdditionalInfo; //18;
  //Result.Buyer.OrganizationOrPersonInfo:string read FOrganizationOrPersonInfo write FOrganizationOrPersonInfo; //19;
  //Result.Buyer.IndividualEntityRegistrationCertificate:string read FIndividualEntityRegistrationCertificate write FIndividualEntityRegistrationCertificate; //20;
  //Result.Buyer.Country:=''


  Result.Shipper.SameAsSeller:=true;
  Result.Shipper.OrgInfo.Clear;

  Result.Consignee.BoxId:='';
  Result.Consignee.OrgName:='ООО "Василёк"';
  Result.Consignee.Inn:='2635024103';
  Result.Consignee.Kpp:='262350001';
  Result.Consignee.Address.RussianAddress.Apartment:='1';
  Result.Consignee.Address.RussianAddress.ZipCode:='356236';
  Result.Consignee.Address.RussianAddress.Region:='26';
  Result.Consignee.Address.RussianAddress.Territory:='Ставропольский край';
  Result.Consignee.Address.RussianAddress.City:='Ставрополь';
  Result.Consignee.Address.RussianAddress.Locality:='Ставрополь';
  Result.Consignee.Address.RussianAddress.Street:='Мира';
  Result.Consignee.Address.RussianAddress.Building:='1';
  Result.Consignee.Address.RussianAddress.Block:='a';
  //Result.Consignee.FnsParticipantId:='2634'
  Result.Consignee.OrgType:=TOrgType.LegalEntity;
  Result.Consignee.Okopf:='';
  Result.Consignee.Okpo:='';
  Result.Consignee.Okdp:='';
  Result.Consignee.Phone:='1234567890';
  Result.Consignee.Email:='aa@aa.aa';
  //Result.Consignee.CorrespondentAccount:='12345678901234567890';
  //Result.Consignee.BankAccountNumber:='';
  //Result.Consignee.BankName:string read FBankName write FBankName; //15;
  //Result.Consignee.BankId:string read FBankId write FBankId; //16;
  //Result.Consignee.Department:string read FDepartment write FDepartment; //17;
  //Result.Consignee.OrganizationAdditionalInfo:string read FOrganizationAdditionalInfo write FOrganizationAdditionalInfo; //18;
  //Result.Consignee.OrganizationOrPersonInfo:string read FOrganizationOrPersonInfo write FOrganizationOrPersonInfo; //19;
  //Result.Consignee.IndividualEntityRegistrationCertificate:string read FIndividualEntityRegistrationCertificate write FIndividualEntityRegistrationCertificate; //20;
  //Result.Consignee.Country:=''


  //Result.Signers.AddItem;
  //Result.PaymentDocuments

  Result.InvoiceTable.TotalWithVatExcluded:='100';
  Result.InvoiceTable.Vat:='18';
  Result.InvoiceTable.Total:='118';
  Result.InvoiceTable.TotalNet:='20';
  T:=Result.InvoiceTable.Items.AddItem;
  T.Product:='Грабли';
  T.Unt:='796';
  T.UnitName:='шт';
  T.Quantity:='1';
  T.Price:='100';
  //T.Excise:='';
  T.TaxRate:=TTaxRate.Fraction_18_118;
  T.SubtotalWithVatExcluded:='100';
  T.Vat:='18';
  T.Subtotal:='118';
  //T.CustomsDeclarations
  T.ItemMark:=TItemMark.NotSpecified;
  T.AdditionalProperty:='';
  T.ItemVendorCode:='123-321-123';
  T.ItemToRelease:='1';
  //T.ItemAccountDebit
  //T.ItemAccountCredit
  //T.AdditionalInfo


  Result.Currency:='643';
  //Result.CurrencyRate:='';
  Result.RevisionDate:='';
  Result.RevisionNumber:='';
  Result.AdditionalInfoId.Clear;
  Result.TransferInfo.Clear;
  Result.DocumentCreator:='Иванов И.И.';
  Result.DocumentCreatorBase:='продавец';
  Result.GovernmentContractInfo:='';
end;

end.

