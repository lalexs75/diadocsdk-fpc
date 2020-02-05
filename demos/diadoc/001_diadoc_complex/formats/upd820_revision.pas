{ Комплексный пример работы с ДИАДОК

  Copyright (C) 2018-2020 Lagunov Aleksey alexs75@yandex.ru

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

unit upd820_revision;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DiadocAPI;

procedure ShowUniversalTransferDocumentRevision(ADiadocAPI:TDiadocAPI; FBoxId:string; AStream:TStream);
implementation
uses Forms, diadoc_utils,
  UniversalTransferDocumentSellerTitleInfoUnit,
  UniversalTransferDocumentRevision_SCHFDOP_utd820_05_01_01_hyphen_ind0;

procedure FillInvoiceTable820(ATableInfo:TInvoiceTable);
var
  Itm:TInvoiceTable_Item;
  CD:TCustomsDeclarationWithHyphens;
  AI:TAdditionalInfo;
begin
  if not Assigned(ATableInfo) then Exit;
  with UniversalTransferDocumentSellerTitleInfoForm do
  begin
    rxData.CloseOpen;

    for Itm in ATableInfo.Item do
    begin
      rxData.Append;
      rxDataProduct.AsString:=Itm.Product;
      rxDataUnitName.AsString:=Itm.UnitName + ' ('+ Itm.Unit1 + ')';
      rxDataQuantity.AsString:=FloatToStr(Itm.Quantity);
      rxDataPrice.AsString:=FloatToStr(Itm.Price);
      rxDataExcise.AsString:=FloatToStr(Itm.Excise);
      rxDataTaxRate.AsString:=Itm.TaxRate;
      rxDataSubtotalWithVatExcluded.AsString:=FloatToStr(Itm.Subtotal);
      rxDataVat.AsString:=FloatToStr(Itm.Vat);
      rxDataSubtotal.AsString:=FloatToStr(Itm.Subtotal);

      for CD in Itm.CustomsDeclarations.CustomsDeclaration do
        rxDataCustomsDeclaration.AsString:=CD.Country + ' ' + CD.DeclarationNumber;

      rxDataItemMark.AsString:=IntToStr(Itm.ItemMark); //ItemMarkToStr(Itm.ItemMark);
      rxDataAdditionalProperty.AsString:=Itm.AdditionalProperty;
      rxDataItemVendorCode.AsString:=Itm.ItemVendorCode;
      rxDataItemToRelease.AsString:=FloatToStr(Itm.ItemToRelease);
      //rxDataItemAccountCredit.AsString:=Itm.ItemAccountCredit;
      //rxDataItemAccountDebit.AsString:=Itm.ItemAccountDebit;

      for AI in Itm.AdditionalInfos.AdditionalInfo do
        rxDataAdditionalInfo.AsString:=rxDataAdditionalInfo.AsString + AI.Id + ':' + AI.Value + ';';
      rxData.Post;
    end;
  end;
end;

procedure ShowInfo820(AInfo:TUniversalTransferDocumentWithHyphens);
var
  PD:TPaymentDocumentInfo;
  AI:TAdditionalInfo;
begin
  UniversalTransferDocumentSellerTitleInfoForm:=TUniversalTransferDocumentSellerTitleInfoForm.Create(Application);


  UniversalTransferDocumentSellerTitleInfoForm.edtFunctionType.Text:=AInfo.Function1;
  UniversalTransferDocumentSellerTitleInfoForm.edtDocumentName.Text:=AInfo.DocumentName;
  UniversalTransferDocumentSellerTitleInfoForm.edtDocumentDate.Text:=AInfo.DocumentDate;
  UniversalTransferDocumentSellerTitleInfoForm.edtDocumentNumber.Text:=AInfo.DocumentNumber;
  if AInfo.Sellers.Seller.Count>0 then
    UniversalTransferDocumentSellerTitleInfoForm.edtSellerOrgName.Text:=AInfo.Sellers.Seller[0].OrganizationDetails.OrgName;

  if AInfo.Buyers.Buyer.Count>0 then
    UniversalTransferDocumentSellerTitleInfoForm.edtBuyerOrgName.Text:=AInfo.Buyers.Buyer[0].OrganizationDetails.OrgName;

  if AInfo.Shippers.Shipper.Count > 0 then
  begin
    if AInfo.Shippers.Shipper[0].SameAsSeller = 'true' then
      UniversalTransferDocumentSellerTitleInfoForm.edtShipperOrgName.Text:='Он же (продавец) : ' + AInfo.Sellers.Seller[0].OrganizationDetails.OrgName
    else
      UniversalTransferDocumentSellerTitleInfoForm.edtShipperOrgName.Text:=AInfo.Shippers.Shipper[0].OrganizationDetails.OrgName;
  end;

  if AInfo.Consignees.Consignee.Count > 0 then
    UniversalTransferDocumentSellerTitleInfoForm.edtConsigneeOrgName.Text:=AInfo.Consignees.Consignee[0].OrganizationDetails.OrgName;

  //edtSigners.Text:='';
  //for Sig in AInfo.Signers do
  //  edtSigners.Text:=edtSigners.Text +Sig.BoxId + ' ';
  UniversalTransferDocumentSellerTitleInfoForm.edtSigners.Text:=AInfo.Signers.SignerDetails.FirstName; // +Sig.BoxId + ' ';

  UniversalTransferDocumentSellerTitleInfoForm.edtPaymentDocuments.Text:='';
  for PD in AInfo.PaymentDocuments.Document do
    UniversalTransferDocumentSellerTitleInfoForm.edtPaymentDocuments.Text:=UniversalTransferDocumentSellerTitleInfoForm.edtPaymentDocuments.Text + '№ '+ PD.Number + ' от ' + PD.Date;

  FillInvoiceTable820(AInfo.Table);
  UniversalTransferDocumentSellerTitleInfoForm.edtCurrency.Text:=AInfo.Currency + '('+FloatToStr(AInfo.CurrencyRate) + ')';

  UniversalTransferDocumentSellerTitleInfoForm.edtRevisionDate.Text:=AInfo.RevisionDate;
  UniversalTransferDocumentSellerTitleInfoForm.edtRevisionNumber.Text:=IntToStr(AInfo.RevisionNumber);

  UniversalTransferDocumentSellerTitleInfoForm.aiAdditionalInfo.Text:='';
  for AI in AInfo.AdditionalInfoId.AdditionalInfo do
    UniversalTransferDocumentSellerTitleInfoForm.aiAdditionalInfo.Text:=UniversalTransferDocumentSellerTitleInfoForm.aiAdditionalInfo.Text + AI.Id+':'+AI.Value+';';

  UniversalTransferDocumentSellerTitleInfoForm.edtTransferInfo.Text:=AInfo.TransferInfo.CreatedThingInfo + ' ' + AInfo.TransferInfo.CreatedThingTransferDate + ' ...';

  UniversalTransferDocumentSellerTitleInfoForm.edtDocumentCreator.Text:=AInfo.DocumentCreator;
  UniversalTransferDocumentSellerTitleInfoForm.edtDocumentCreatorBase.Text:=AInfo.DocumentCreatorBase;

  UniversalTransferDocumentSellerTitleInfoForm.edtGovernmentContractInfo.Text:=AInfo.GovernmentContractInfo;

  UniversalTransferDocumentSellerTitleInfoForm.ShowModal;
  UniversalTransferDocumentSellerTitleInfoForm.Free;
end;

procedure ShowUniversalTransferDocumentRevision(ADiadocAPI: TDiadocAPI;
  FBoxId: string; AStream: TStream);
var
  RDocType, RDocFunct, RDocVers: string;
  M1: TMemoryStream;
  U2: TUniversalTransferDocumentWithHyphens;
begin
  if not Assigned(AStream) then Exit;

  DocumentParams(AStream, RDocType, RDocFunct, RDocVers);
  M1:=ADiadocAPI.ParseTitleXml(FBoxId, RDocType, RDocFunct, RDocVers, 0, AStream);

  if Assigned(M1) then
  begin
    M1.Position:=0;
    U2:=TUniversalTransferDocumentWithHyphens.Create;
    U2.LoadFromStream(M1);
    ShowInfo820(U2);
    U2.Free;
    M1.Free;
  end;

  FreeAndNil(AStream);
end;

end.

