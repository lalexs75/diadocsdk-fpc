{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018 Lagunov Aleksey alexs75@yandex.ru

  base on docs from http://api-docs.diadoc.ru

  This library is free software; you can redistribute it and/or modify it
  under the terms of the GNU Library General Public License as published by
  the Free Software Foundation; either version 2 of the License, or (at your
  option) any later version with the following modification:

  As a special exception, the copyright holders of this library give you
  permission to link this library with independent modules to produce an
  executable, regardless of the license terms of these independent modules,and
  to copy and distribute the resulting executable under terms of your choice,
  provided that you also meet, for each linked independent module, the terms
  and conditions of the license of that module. An independent module is a
  module which is not derived from or based on this library. If you modify
  this library, you may extend this exception to your version of the library,
  but you are not obligated to do so. If you do not wish to do so, delete this
  exception statement from your version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License
  for more details.

  You should have received a copy of the GNU Library General Public License
  along with this library; if not, write to the Free Software Foundation,
  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
}

unit DiadocTypes_Torg12Info;

{$I diadoc_define.inc}

interface

//import "Invoicing/Signer.proto";
//import "Invoicing/Official.proto";
//import "Invoicing/OrganizationInfo.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_Signer,
  DiadocTypes_Official,
  DiadocTypes_OrganizationInfo;

type
  {  TGrounds  }
  // Документ-основание
  //message Grounds {
  //	optional string DocumentName = 1;										// имя документа
  //	optional string DocumentNumber = 2;										// номер документа
  //	optional string DocumentDate = 3;										// дата документа
  //	optional string AdditionalInfo = 4;										// дополнительные сведения
  //}
  TGrounds = class(TSerializationObject)
  private
    FAdditionalInfo: string;
    FDocumentDate: string;
    FDocumentName: string;
    FDocumentNumber: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property DocumentName:string read FDocumentName write FDocumentName; //1;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber; //2;
    property DocumentDate:string read FDocumentDate write FDocumentDate; //3;
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo; //4;
  end;


  {  TTorg12Item  }
  //message Torg12Item {
  //	required string Name = 1;												// наименование
  //	optional string Feature = 2;											// характеристика
  //	optional string Sort = 3;												// сорт товара
  //	optional string NomenclatureArticle = 4;								// артикул
  //	optional string Code = 5;												// код товара
  //	optional string UnitCode = 6;											// код единицы измерения
  //	required string UnitName = 7;											// наименование единицы измерения
  //	optional string ParcelType = 8;											// вид упаковки
  //	optional string ParcelCapacity = 9;										// количество в одном месте
  //	optional string ParcelsQuantity = 10;									// количество мест
  //	optional string GrossQuantity = 11;										// брутто
  //	required string Quantity = 12;										// нетто // количество (масса)
  //	optional string Price = 13;												// цена
  //	required string TaxRate = 14;											// ставка налога
  //	optional string SubtotalWithVatExcluded = 15;							// сумма без учета налога
  //	optional string Vat = 16;												// сумма налога
  //	required string Subtotal = 17;											// сумма всего
  //	optional string AdditionalInfo = 18;									// информационное поле сведений о товаре
  //}
  TTorg12Item = class(TSerializationObject)
  private
    FAdditionalInfo: string;
    FCode: string;
    FFeature: string;
    FGrossQuantity: string;
    FName: string;
    FNomenclatureArticle: string;
    FParcelCapacity: string;
    FParcelsQuantity: string;
    FParcelType: string;
    FPrice: string;
    FQuantity: string;
    FSort: string;
    FSubtotal: string;
    FSubtotalWithVatExcluded: string;
    FTaxRate: string;
    FUnitCode: string;
    FUnitName: string;
    Fv: string;
    FVat: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Name:string read FName write FName; //1;
    property Feature:string read FFeature write FFeature; //2;
    property Sort:string read FSort write FSort; //3;
    property NomenclatureArticle:string read FNomenclatureArticle write FNomenclatureArticle; //4;
    property Code:string read FCode write FCode; //5;
    property UnitCode:string read FUnitCode write FUnitCode; //6;
    property UnitName:string read FUnitName write FUnitName; //7;
    property ParcelType:string read FParcelType write Fv; //8;
    property ParcelCapacity:string read FParcelCapacity write FParcelCapacity; //9;
    property ParcelsQuantity:string read FParcelsQuantity write FParcelsQuantity; //10;
    property GrossQuantity:string read FGrossQuantity write FGrossQuantity; //11;
    property Quantity:string read FQuantity write FQuantity; //12;
    property Price:string read FPrice write FPrice; //13;
    property TaxRate:string read FTaxRate write FTaxRate; //14;
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write FSubtotalWithVatExcluded; //15;
    property Vat:string read FVat write FVat; //16;
    property Subtotal:string read FSubtotal write FSubtotal; //17;
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo; //18;
  end;
  TTorg12Items = specialize GSerializationObjectList<TTorg12Item>;

  {  TTorg12BuyerTitleInfo  }
  // Со стороны покупателя
  //message Torg12BuyerTitleInfo {
  //	required string ShipmentReceiptDate = 1;								// дата получения груза
  //	optional Attorney Attorney = 2;											// сведения по доверенности
  //	optional Official AcceptedBy = 3;										// лицо, принявшее груз
  //	optional Official ReceivedBy = 4;										// лицо, получившее груз
  //	required Signer Signer = 5;												// подписант
  //	optional string AdditionalInfo = 6;										// дополнительная информация
  //}
  TTorg12BuyerTitleInfo = class(TSerializationObject)
  private
    FAcceptedBy: TOfficial;
    FAdditionalInfo: string;
    FAttorney: TAttorney;
    FReceivedBy: TOfficial;
    FShipmentReceiptDate: string;
    FSigner: TSigner;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property ShipmentReceiptDate:string read FShipmentReceiptDate write FShipmentReceiptDate; //1;
    property Attorney:TAttorney read FAttorney;//2;
    property AcceptedBy:TOfficial read FAcceptedBy;//3;
    property ReceivedBy:TOfficial read FReceivedBy;//4;
    property Signer:TSigner read FSigner;//5;
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo; //6;
  end;

  {  TTorg12SellerTitleInfo  }
  // Со стороны продавца
  //message Torg12SellerTitleInfo {
  //	required string DocumentDate = 1;			     // дата товарной накладной
  //	optional string DocumentNumber = 2;			     // номер товарной накладной
  //	required DocflowParticipant SellerDocflowParticipant = 3;    // участник документооборота, отпустивший товар
  //	required DocflowParticipant BuyerDocflowParticipant = 4;     // участник документооборота, которому отпущен товар
  //	optional OrganizationInfo Shipper = 5;									// грузоотправитель
  //	optional OrganizationInfo Consignee = 6;								// грузополучатель
  //	optional OrganizationInfo Supplier = 7;									// поставщик
  //	optional OrganizationInfo Payer = 8;									// плательщик
  //	optional Grounds Grounds = 9;											// основание
  //	optional string WaybillDate = 10;										// дата составления транспортной накладной
  //	optional string WaybillNumber = 11;										// номер транспортной накладной
  //	optional string OperationCode = 12;										// код вида операции
  //	repeated Torg12Item Items = 13;											// табличные сведения товарной накладной
  //	optional string ParcelsQuantityTotal = 14;								// количество мест, штук - всего по накладной
  //	optional string ParcelsQuantityTotalInWords = 15;						// количество мест, штук - всего по накладной, прописью
  //	optional string GrossQuantityTotal = 16;								// брутто - всего по накладной
  //	optional string GrossQuantityTotalInWords = 17;							// брутто - всего по накладной, прописью
  //	optional string NetQuantityTotal = 18;									// нетто - всего по накладной
  //	optional string NetQuantityTotalInWords = 19;							// нетто - всего по накладной, прописью
  //	optional string QuantityTotal = 20;										// количество (масса нетто) - всего по накладной
  //	optional string TotalWithVatExcluded = 21;								// сумма без учета НДС - всего по накладной
  //	optional string Vat = 22;												// сумма НДС - всего по накладной
  //	required string Total = 23;												// сумма с учетом НДС - всего по накладной
  //	optional string TotalInWords = 24;										// сумма с учетом НДС - всего по накладной, прописью
  //	optional string SupplyDate = 25;										// дата отпуска
  //	optional Official SupplyAllowedBy = 26;									// отпуск разрешил
  //	optional Official SupplyPerformedBy = 27;								// отпуск произвел
  //	optional Official ChiefAccountant = 28;									// главный бухгалтер
  //	required Signer Signer = 29;											// подписант
  //	optional string AdditionalInfo = 30;									// дополнительные сведения
  //	optional string AttachmentSheetsQuantity = 31;							// приложение, количество листов
  //}
  TTorg12SellerTitleInfo = class(TSerializationObject)
  private
    FAdditionalInfo: string;
    FAttachmentSheetsQuantity: string;
    FBuyerDocflowParticipant: TDocflowParticipant;
    FChiefAccountant: TOfficial;
    FConsignee: TOrganizationInfo;
    FDocumentDate: string;
    FDocumentNumber: string;
    FGrossQuantityTotal: string;
    FGrossQuantityTotalInWords: string;
    FGrounds: TGrounds;
    FItems: TTorg12Items;
    FNetQuantityTotal: string;
    FNetQuantityTotalInWords: string;
    FOperationCode: string;
    FParcelsQuantityTotal: string;
    FParcelsQuantityTotalInWords: string;
    FPayer: TOrganizationInfo;
    FQuantityTotal: string;
    FSellerDocflowParticipant: TDocflowParticipant;
    FShipper: TOrganizationInfo;
    FSigner: TSigner;
    FSupplier: TOrganizationInfo;
    FSupplyAllowedBy: TOfficial;
    FSupplyDate: string;
    FSupplyPerformedBy: TOfficial;
    FTotal: string;
    FTotalInWords: string;
    FTotalWithVatExcluded: string;
    FVat: string;
    FWaybillDate: string;
    FWaybillNumber: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property DocumentDate:string read FDocumentDate write FDocumentDate; //1;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber; //2;
    property SellerDocflowParticipant:TDocflowParticipant read FSellerDocflowParticipant;//3;
    property BuyerDocflowParticipant:TDocflowParticipant read FBuyerDocflowParticipant;//4;
    property Shipper:TOrganizationInfo read FShipper;//5;
    property Consignee:TOrganizationInfo read FConsignee;//6;
    property Supplier:TOrganizationInfo read FSupplier;//7;
    property Payer:TOrganizationInfo read FPayer;//8;
    property Grounds:TGrounds read FGrounds;//9;
    property WaybillDate:string read FWaybillDate write FWaybillDate; //10;
    property WaybillNumber:string read FWaybillNumber write FWaybillNumber; //11;
    property OperationCode:string read FOperationCode write FOperationCode; //12;
    property Items:TTorg12Items read FItems;//13;
    property ParcelsQuantityTotal:string read FParcelsQuantityTotal write FParcelsQuantityTotal; //14;
    property ParcelsQuantityTotalInWords:string read FParcelsQuantityTotalInWords write FParcelsQuantityTotalInWords; //15;
    property GrossQuantityTotal:string read FGrossQuantityTotal write FGrossQuantityTotal; //16;
    property GrossQuantityTotalInWords:string read FGrossQuantityTotalInWords write FGrossQuantityTotalInWords; //17;
    property NetQuantityTotal:string read FNetQuantityTotal write FNetQuantityTotal; //18;
    property NetQuantityTotalInWords:string read FNetQuantityTotalInWords write FNetQuantityTotalInWords; //19;
    property QuantityTotal:string read FQuantityTotal write FQuantityTotal; //20;
    property TotalWithVatExcluded:string read FTotalWithVatExcluded write FTotalWithVatExcluded; //21;
    property Vat:string read FVat write FVat; //22;
    property Total:string read FTotal write FTotal; //23;
    property TotalInWords:string read FTotalInWords write FTotalInWords; //24;
    property SupplyDate:string read FSupplyDate write FSupplyDate; //25;
    property SupplyAllowedBy:TOfficial read FSupplyAllowedBy;//26;
    property SupplyPerformedBy:TOfficial read FSupplyPerformedBy;//27;
    property ChiefAccountant:TOfficial read FChiefAccountant;//28;
    property Signer:TSigner read FSigner; //29;
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo; //30;
    property AttachmentSheetsQuantity:string read FAttachmentSheetsQuantity write FAttachmentSheetsQuantity; //31;
  end;


implementation

{ TTorg12SellerTitleInfo }

procedure TTorg12SellerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FSellerDocflowParticipant:=TDocflowParticipant.Create;
  FBuyerDocflowParticipant:=TDocflowParticipant.Create;
  FShipper:=TOrganizationInfo.Create;
  FConsignee:=TOrganizationInfo.Create;
  FSupplier:=TOrganizationInfo.Create;
  FPayer:=TOrganizationInfo.Create;
  FGrounds:=TGrounds.Create;
  FItems:=TTorg12Items.Create;
  FSupplyAllowedBy:=TOfficial.Create;
  FSupplyPerformedBy:=TOfficial.Create;
  FChiefAccountant:=TOfficial.Create;
  FSigner:=TSigner.Create;
end;

procedure TTorg12SellerTitleInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentDate', 1);
  RegisterProp('DocumentNumber', 2);
  RegisterProp('SellerDocflowParticipant', 3);
  RegisterProp('BuyerDocflowParticipant', 4);
  RegisterProp('Shipper', 5);
  RegisterProp('Consignee', 6);
  RegisterProp('Supplier', 7);
  RegisterProp('Payer', 8);
  RegisterProp('Grounds', 9);
  RegisterProp('WaybillDate', 10);
  RegisterProp('WaybillNumber', 11);
  RegisterProp('OperationCode', 12);
  RegisterProp('Items', 13);
  RegisterProp('ParcelsQuantityTotal', 14);
  RegisterProp('ParcelsQuantityTotalInWords', 15);
  RegisterProp('GrossQuantityTotal', 16);
  RegisterProp('GrossQuantityTotalInWords', 17);
  RegisterProp('NetQuantityTotal', 18);
  RegisterProp('NetQuantityTotalInWords', 19);
  RegisterProp('QuantityTotal', 20);
  RegisterProp('TotalWithVatExcluded', 21);
  RegisterProp('Vat', 22);
  RegisterProp('Total', 23);
  RegisterProp('TotalInWords', 24);
  RegisterProp('SupplyDate', 25);
  RegisterProp('SupplyAllowedBy', 26);
  RegisterProp('SupplyPerformedBy', 27);
  RegisterProp('ChiefAccountant', 28);
  RegisterProp('Signer', 29);
  RegisterProp('AdditionalInfo', 30);
  RegisterProp('AttachmentSheetsQuantity', 31);
end;

destructor TTorg12SellerTitleInfo.Destroy;
begin
  inherited Destroy;
  FreeAndNil(FSellerDocflowParticipant);
  FreeAndNil(FBuyerDocflowParticipant);
  FreeAndNil(FShipper);
  FreeAndNil(FConsignee);
  FreeAndNil(FSupplier);
  FreeAndNil(FPayer);
  FreeAndNil(FGrounds);
  FreeAndNil(FItems);
  FreeAndNil(FSupplyAllowedBy);
  FreeAndNil(FSupplyPerformedBy);
  FreeAndNil(FChiefAccountant);
  FreeAndNil(FSigner);
end;

{ TTorg12BuyerTitleInfo }

procedure TTorg12BuyerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FAttorney:=TAttorney.Create;
  FAcceptedBy:=TOfficial.Create;
  FReceivedBy:=TOfficial.Create;
  FSigner:=TSigner.Create;
end;

procedure TTorg12BuyerTitleInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ShipmentReceiptDate', 1);
  RegisterProp('Attorney', 2);
  RegisterProp('AcceptedBy', 3);
  RegisterProp('ReceivedBy', 4);
  RegisterProp('Signer', 5);
  RegisterProp('AdditionalInfo', 6);
end;

destructor TTorg12BuyerTitleInfo.Destroy;
begin
  FreeAndNil(FAttorney);
  FreeAndNil(FAcceptedBy);
  FreeAndNil(FReceivedBy);
  FreeAndNil(FSigner);
  inherited Destroy;
end;

{ TTorg12Item }

procedure TTorg12Item.InternalInit;
begin
  inherited InternalInit;
end;

procedure TTorg12Item.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1);
  RegisterProp('Feature', 2);
  RegisterProp('Sort', 3);
  RegisterProp('NomenclatureArticle', 4);
  RegisterProp('Code', 5);
  RegisterProp('UnitCode', 6);
  RegisterProp('UnitName', 7);
  RegisterProp('ParcelType', 8);
  RegisterProp('ParcelCapacity', 9);
  RegisterProp('ParcelsQuantity', 10);
  RegisterProp('GrossQuantity', 11);
  RegisterProp('Quantity', 12);
  RegisterProp('Price', 13);
  RegisterProp('TaxRate', 14);
  RegisterProp('SubtotalWithVatExcluded', 15);
  RegisterProp('Vat', 16);
  RegisterProp('Subtotal', 17);
  RegisterProp('AdditionalInfo', 18);
end;

destructor TTorg12Item.Destroy;
begin
  inherited Destroy;
end;

{ TGrounds }

procedure TGrounds.InternalInit;
begin
  inherited InternalInit;
end;

procedure TGrounds.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentName', 1);
  RegisterProp('DocumentNumber', 2);
  RegisterProp('DocumentDate', 3);
  RegisterProp('AdditionalInfo', 4);
end;

destructor TGrounds.Destroy;
begin
  inherited Destroy;
end;

end.

