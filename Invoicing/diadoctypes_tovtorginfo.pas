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

unit DiadocTypes_TovTorgInfo;

{$I diadoc_define.inc}

interface

//import "Invoicing/InvoiceInfo.proto";
//import "Invoicing/ExtendedSigner.proto";
//import "Invoicing/ExtendedOrganizationInfo.proto";
//import "Invoicing/UniversalTransferDocumentInfo.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_InvoiceInfo,
  DiadocTypes_ExtendedSigner,
  DiadocTypes_ExtendedOrganizationInfo,
  DiadocTypes_UniversalTransferDocumentInfo;

type
  {  GroundInfo  }
  //message GroundInfo {
  //	required string Name = 1; // НаимОсн
  //	optional string Number = 2; // НомОсн
  //	optional string Date = 3; // ДатаОсн
  //	optional string Info = 4; // ДопСвОсн
  //}

  { TGroundInfo }

  TGroundInfo = class(TSerializationObject)
  private
    FDate: string;
    FInfo: string;
    FName: string;
    FNumber: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Name:string read FName write FName;//1;
    property Number:string read FNumber write FNumber;//2;
    property Date:string read FDate write FDate;//3;
    property Info:string read FInfo write FInfo;//4;
  end;
  TGroundInfos = specialize GSerializationObjectList<TGroundInfo>;

  {  TTovTorgTransferInfo  }
  //message TovTorgTransferInfo {
  //	required string OperationInfo = 1; // Содержание операции // СодОпер
  //	optional string TransferDate = 2; // Дата отгрузки // ДатаОтпуск
  //	optional string Attachment = 3; // Приложение, сертификаты и прочее // КолПрил
  //	repeated Waybill Waybills = 4; // Транспортная накладная //ТранНакл
  //	optional Employee Employee = 5; // Работник организации продавца // СвЛицОтпГруз.РабОргПрод
  //	optional OtherIssuer OtherIssuer = 6; // Иное лицо // СвЛицОтпГруз.ИнЛицо
  //	repeated AdditionalInfo AdditionalInfos = 7; // Информационное поле документа // ИнфПолФХЖ3
  //}
  TTovTorgTransferInfo = class(TSerializationObject)
  private
    FAdditionalInfos: TAdditionalInfos;
    FAttachment: string;
    FEmployee: TEmployee;
    FOperationInfo: string;
    FOtherIssuer: TOtherIssuer;
    FTransferDate: string;
    FWaybills: TWaybills;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property OperationInfo:string read FOperationInfo write FOperationInfo;//1;
    property TransferDate:string read FTransferDate write FTransferDate;//2;
    property Attachment:string read FAttachment write FAttachment;//3;
    property Waybills:TWaybills read FWaybills;//4;
    property Employee:TEmployee read FEmployee;//5;
    property OtherIssuer:TOtherIssuer read FOtherIssuer; //6;
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos; //7;
  end;


  {  TovTorgItem  }
  //message TovTorgItem {
  //	optional string Product = 1; // наименование товара // НаимТов
  //	optional string Feature = 2; // характеристика товара // ХарактерТов
  //	optional string Sort = 3; // сорт товара // СортТов
  //	optional string VendorCode = 4; // артикул товара
  //	optional string ProductCode = 5; // Код товара // КодТов
  //	optional string UnitName = 6; // наименование единицы измерения товара. Пользователь заполняет, если ОКЕИ_Тов=’0000’// НаимЕдИзм
  //	required string Unit = 7; // единицы измерения товара (код) // ОКЕИ_Тов
  //	optional string PackageType = 8; // вид упаковки товара // ВидУпак
  //	optional string QuantityInPack = 9; // количество мест в 1 упаковке // Место;
  //	optional string Quantity = 10; // количество единиц товара // КолМест;
  //	optional string Gross = 11; // масса брутто // брутто
  //	required string Net = 12; // масса нетто, количество передано (отпущено) // НеттоПередано
  //	optional string ItemToRelease = 13; // Количество надлежит отпустить // НадлОтп
  //	optional string Price = 14; // цена за единицу товара // ЦенаТов
  //	optional string SubtotalWithVatExcluded = 15; // сумма без учета налога // СтБезНДС
  //	optional TaxRate TaxRate = 16 [default = Percent_18]; // ставка налога // НалСт
  //	optional string Vat = 17; // сумма налога // СумНДС
  //	required string Subtotal = 18; // сумма всего // СтУчНДС
  //	optional string ItemAccountDebit = 19; // Корреспондирующие счета: дебет // КорСчДеб
  //	optional string ItemAccountCredit = 20; // Корреспондирующие счета: кредит // КорСчКред
  //	repeated AdditionalInfo AdditionalInfos = 21; // Информационное поле документа // ИнфПолФХЖ2
  //}
  TTovTorgItem = class(TSerializationObject)
  private
    FAdditionalInfos: TAdditionalInfos;
    FFeature: string;
    FGross: string;
    FItemAccountCredit: string;
    FItemAccountDebit: string;
    FItemToRelease: string;
    FNet: string;
    FPackageType: string;
    FPrice: string;
    FProduct: string;
    FProductCode: string;
    FQuantity: string;
    FQuantityInPack: string;
    FSort: string;
    FSubtotal: string;
    FSubtotalWithVatExcluded: string;
    FTaxRate: TTaxRate;
    FUnitName: string;
    FUnt: string;
    FVat: string;
    FVendorCode: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Product:string read FProduct write FProduct;//1;
    property Feature:string read FFeature write FFeature;//2;
    property Sort:string read FSort write FSort;//3;
    property VendorCode:string read FVendorCode write FVendorCode;//4;
    property ProductCode:string read FProductCode write FProductCode;//5;
    property UnitName:string read FUnitName write FUnitName;//6;
    property Unt:string read FUnt write FUnt;//7;
    property PackageType:string read FPackageType write FPackageType;//8
    property QuantityInPack:string read FQuantityInPack write FQuantityInPack;//9
    property Quantity:string read FQuantity write FQuantity;//10
    property Gross:string read FGross write FGross;//11
    property Net:string read FNet write FNet;//12;
    property ItemToRelease:string read FItemToRelease write FItemToRelease;//13;
    property Price:string read FPrice write FPrice;//14;
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write FSubtotalWithVatExcluded;//15;
    property TaxRate:TTaxRate read FTaxRate write FTaxRate default Percent_18;//16
    property Vat:string read FVat write FVat;//17
    property Subtotal:string read FSubtotal write FSubtotal;//18
    property ItemAccountDebit:string read FItemAccountDebit write FItemAccountDebit;//19
    property ItemAccountCredit:string read FItemAccountCredit write FItemAccountCredit;//20;
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos;//21;
  end;
  TTovTorgItems = specialize GSerializationObjectList<TTovTorgItem>;

  {  TTovTorgTable  }
  //message TovTorgTable {
  //	repeated TovTorgItem Items = 1; // информация о товарах // СвТов
  //	optional string TotalQuantity = 2; // Количество мест всего по документу // КолМестВс
  //	optional string TotalGross = 3; // Масса брутто всего по документу // БруттоВС
  //	optional string TotalNet = 4; // Масса нетто всего по документу // НеттоВс
  //	optional string TotalWithVatExcluded = 5; // Сумма без учета налога // СтТовБезНДСВс
  //	optional string TotalVat = 6; // Сумма НДС - всего по документу // СумНДСВс
  //	optional string Total = 7; // Сумма всего // СтУчНДСВс
  //}
  TTovTorgTable = class(TSerializationObject)
  private
    FItems: TTovTorgItems;
    FTotal: string;
    FTotalGross: string;
    FTotalNet: string;
    FTotalQuantity: string;
    FTotalVat: string;
    FTotalWithVatExcluded: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Items:TTovTorgItems read FItems;//1;
    property TotalQuantity:string read FTotalQuantity write FTotalQuantity;//2
    property TotalGross:string read FTotalGross write FTotalGross;//3;
    property TotalNet:string read FTotalNet write FTotalNet;//4;
    property TotalWithVatExcluded:string read FTotalWithVatExcluded write FTotalWithVatExcluded;//5;
    property TotalVat:string read FTotalVat write FTotalVat;//6
    property Total:string read FTotal write FTotal;//7;
  end;

  {  TTovTorgBuyerTitleInfo  }
  //message TovTorgBuyerTitleInfo {
  //	required string DocumentCreator = 1; // Наименование экономического субъекта - составителя файла обмена информации покупателя // Документ.НаимЭконСубСост
  //	optional string DocumentCreatorBase = 2; // Основание, по которому экономический субъект является составителем файла обмена информации покупателя // ОснДоверОргСост
  //	optional string OperationCode = 3; // Вид операции // СодФХЖ4.ВидОперации
  //	required string OperationContent = 4; // Содержание операции // СодОпер
  //	optional string AcceptanceDate = 5; // Дата принятия товаров (результатов выполненных работ), имущественных прав (подтверждения факта оказания услуг) // ДатаПолуч
  //	optional Employee Employee = 6; // работник организации покупателя // СвЛицПолГруз.РабОргПок
  //	optional OtherIssuer OtherIssuer = 7; // Иное Лицо // СвЛицПолГруз.ИнЛицо
  //	optional AdditionalInfoId AdditionalInfoId = 8; // Информационное поле факта хозяйственной жизни (4) // ИнфПолФХЖ4
  //	repeated Signers.ExtendedSigner Signers = 9; // Подписант // Документ.Подписант
  //}
  TTovTorgBuyerTitleInfo = class(TSerializationObject)
  private
    FAcceptanceDate: string;
    FAdditionalInfoId: TAdditionalInfoId;
    FDocumentCreator: string;
    FDocumentCreatorBase: string;
    FEmployee: TEmployee;
    FOperationCode: string;
    FOperationContent: string;
    FOtherIssuer: TOtherIssuer;
    FSigners: TExtendedSigners;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property DocumentCreator:string read FDocumentCreator write FDocumentCreator;//1;
    property DocumentCreatorBase:string read FDocumentCreatorBase write FDocumentCreatorBase;//2;
    property OperationCode:string read FOperationCode write FOperationCode;//3
    property OperationContent:string read FOperationContent write FOperationContent;//4
    property AcceptanceDate:string read FAcceptanceDate write FAcceptanceDate;//5
    property Employee:TEmployee read FEmployee;//6;
    property OtherIssuer:TOtherIssuer read FOtherIssuer;// 7
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId; //8;
    property Signers:TExtendedSigners read FSigners;//9;
  end;


  {  TTovTorgSellerTitleInfo  }
  //message TovTorgSellerTitleInfo {
  //	required Organizations.ExtendedOrganizationInfo Seller = 1; // Продавец // СодФХЖ1.Продавец
  //	required Organizations.ExtendedOrganizationInfo Buyer = 2; // Покупатель // СодФХЖ1.Покупатель
  //	optional Organizations.ExtendedOrganizationInfo Shipper = 3; // Грузоотправитель // СодФХЖ1.ГрузОтпр
  //	optional Organizations.ExtendedOrganizationInfo Consignee = 4; // Грузополучатель // СодФХЖ1.ГрузПолуч
  //	optional Organizations.ExtendedOrganizationInfo Carrier = 5; // Перевозчик // СодФХЖ1.Перевозчик
  //	repeated Signers.ExtendedSigner Signers = 6; // Подписант // Документ.Подписант
  //	repeated GroundInfo Grounds = 7; // Основание // Основание
  //	required string Currency = 8; // Валюта (код) // КодОКВ
  //	optional string CurrencyRate = 9; // Курс валюты // КурсВал
  //	required string DocumentDate = 10; // Дата составления документа о передаче товара // ИдентДок.ДатаДокПТ
  //	optional string DocumentNumber = 11; // Номер документа о передаче товара // ИдентДок.НомДокПТ
  //	optional string RevisionDate = 12; // Дата исправления документа о передаче товара// ИспрДокПТ.ДатаИспрДокПТ
  //	optional string RevisionNumber = 13; // Номер исправления документа о передаче товара // ИспрДокПт.НомИспрДокПТ
  //	required TovTorgTransferInfo TransferInfo = 14; // Сведения о факте передачи (об отпуске груза) // СодФХЖ3
  //	required string DocumentCreator = 15; // Составитель файла информации продавца // НаимЭконСубСост
  //	optional string DocumentCreatorBase = 16; // Основание, по которому экономический субъект является составителем файла //ОснДоверОргСост
  //	optional string OperationType = 17; // Вид операции // ВидОперации
  //	optional string GovernmentContractInfo = 18; // ИдГосКон
  //	optional TovTorgTable Table = 19; // Сведения об ассортименте, количестве, стоимости и другой информации о товарных позициях // СодФХЖ2
  //	optional AdditionalInfoId AdditionalInfoId = 20; // Информационное поле документа // ИнфПолФХЖ1
  //	required string DocumentName = 21; // Наименование первичного документа, определенное организацией // НаимДок.НаимДокОпр
  //}
  TTovTorgSellerTitleInfo = class(TSerializationObject)
  private
    FAdditionalInfoId: TAdditionalInfoId;
    FBuyer: TExtendedOrganizationInfo;
    FCarrier: TExtendedOrganizationInfo;
    FConsignee: TExtendedOrganizationInfo;
    FCurrency: string;
    FCurrencyRate: string;
    FDocumentCreator: string;
    FDocumentCreatorBase: string;
    FDocumentDate: string;
    FDocumentName: string;
    FDocumentNumber: string;
    FGovernmentContractInfo: string;
    FGrounds: TGroundInfos;
    FOperationType: string;
    FRevisionDate: string;
    FRevisionNumber: string;
    FSeller: TExtendedOrganizationInfo;
    FShipper: TExtendedOrganizationInfo;
    FSigners: TExtendedSigners;
    FTable: TTovTorgTable;
    FTransferInfo: TTovTorgTransferInfo;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Seller:TExtendedOrganizationInfo read FSeller;//1;
    property Buyer:TExtendedOrganizationInfo read FBuyer; //2
    property Shipper:TExtendedOrganizationInfo read FShipper; //3
    property Consignee:TExtendedOrganizationInfo read FConsignee; //4
    property Carrier:TExtendedOrganizationInfo read FCarrier; //5;
    property Signers:TExtendedSigners read FSigners; //6
    property Grounds:TGroundInfos read FGrounds;//7
    property Currency:string read FCurrency write FCurrency;//8
    property CurrencyRate:string read FCurrencyRate write FCurrencyRate;//9
    property DocumentDate:string read FDocumentDate write FDocumentDate;//10;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//11;
    property RevisionDate:string read FRevisionDate write FRevisionDate;//12
    property RevisionNumber:string read FRevisionNumber write FRevisionNumber;//13;
    property TransferInfo:TTovTorgTransferInfo read FTransferInfo;//14
    property DocumentCreator:string read FDocumentCreator write FDocumentCreator;//15
    property DocumentCreatorBase:string read FDocumentCreatorBase write FDocumentCreatorBase;//16
    property OperationType:string read FOperationType write FOperationType;//17;
    property GovernmentContractInfo:string read FGovernmentContractInfo write FGovernmentContractInfo;//18;
    property Table:TTovTorgTable read FTable; //19;
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;//20
    property DocumentName:string read FDocumentName write FDocumentName;//21
  end;

implementation

{ TTovTorgSellerTitleInfo }

procedure TTovTorgSellerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FSeller:=TExtendedOrganizationInfo.Create;
  FBuyer:=TExtendedOrganizationInfo.Create;
  FShipper:=TExtendedOrganizationInfo.Create;
  FConsignee:=TExtendedOrganizationInfo.Create;
  FCarrier:=TExtendedOrganizationInfo.Create;
  FSigners:=TExtendedSigners.Create;
  FGrounds:=TGroundInfos.Create;
  FTransferInfo:=TTovTorgTransferInfo.Create;
  FTable:=TTovTorgTable.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
end;

procedure TTovTorgSellerTitleInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Seller', 1, true);
  RegisterProp('Buyer', 2, true);
  RegisterProp('Shipper', 3);
  RegisterProp('Consignee', 4);
  RegisterProp('Carrier', 5);
  RegisterProp('Signers', 6);
  RegisterProp('Grounds', 7);
  RegisterProp('Currency', 8, true);
  RegisterProp('CurrencyRate', 9);
  RegisterProp('DocumentDate', 10, true);
  RegisterProp('DocumentNumber', 11);
  RegisterProp('RevisionDate', 12);
  RegisterProp('RevisionNumber', 13);
  RegisterProp('TransferInfo', 14, true);
  RegisterProp('DocumentCreator', 15, true);
  RegisterProp('DocumentCreatorBase', 16);
  RegisterProp('OperationType', 17);
  RegisterProp('GovernmentContractInfo', 18);
  RegisterProp('Table', 19);
  RegisterProp('AdditionalInfoId', 20);
  RegisterProp('DocumentName', 21, true);
end;

destructor TTovTorgSellerTitleInfo.Destroy;
begin
  FreeAndNil(FSeller);
  FreeAndNil(FBuyer);
  FreeAndNil(FShipper);
  FreeAndNil(FConsignee);
  FreeAndNil(FCarrier);
  FreeAndNil(FSigners);
  FreeAndNil(FGrounds);
  FreeAndNil(FTransferInfo);
  FreeAndNil(FTable);
  FreeAndNil(FAdditionalInfoId);
  inherited Destroy;
end;

{ TTovTorgBuyerTitleInfo }

procedure TTovTorgBuyerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FEmployee:=TEmployee.Create;
  FOtherIssuer:=TOtherIssuer.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FSigners:=TExtendedSigners.Create;
end;

procedure TTovTorgBuyerTitleInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentCreator', 1, true);
  RegisterProp('DocumentCreatorBase', 2);
  RegisterProp('OperationCode', 3);
  RegisterProp('OperationContent', 4, true);
  RegisterProp('AcceptanceDate', 5);
  RegisterProp('Employee', 6);
  RegisterProp('OtherIssuer', 7);
  RegisterProp('AdditionalInfoId', 8);
  RegisterProp('Signers', 9);
end;

destructor TTovTorgBuyerTitleInfo.Destroy;
begin
  FreeAndNil(FEmployee);
  FreeAndNil(FOtherIssuer);
  FreeAndNil(FAdditionalInfoId);
  FreeAndNil(FSigners);
  inherited Destroy;
end;

{ TTovTorgTable }

procedure TTovTorgTable.InternalInit;
begin
  inherited InternalInit;
  FItems:=TTovTorgItems.Create;
end;

procedure TTovTorgTable.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Items', 1);
  RegisterProp('TotalQuantity', 2);
  RegisterProp('TotalGross', 3);
  RegisterProp('TotalNet', 4);
  RegisterProp('TotalWithVatExcluded', 5);
  RegisterProp('TotalVat', 6);
  RegisterProp('Total', 7);
end;

destructor TTovTorgTable.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

{ TovTorgItem }

procedure TTovTorgItem.InternalInit;
begin
  inherited InternalInit;
  FAdditionalInfos:=TAdditionalInfos.Create;
  FTaxRate:=Percent_18;
end;

procedure TTovTorgItem.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Product', 1);
  RegisterProp('Feature', 2);
  RegisterProp('Sort', 3);
  RegisterProp('VendorCode', 4);
  RegisterProp('ProductCode', 5);
  RegisterProp('UnitName', 6);
  RegisterProp('Unt', 7, true);
  RegisterProp('PackageType', 8);
  RegisterProp('QuantityInPack', 9);
  RegisterProp('Quantity', 10);
  RegisterProp('Gross', 11);
  RegisterProp('Net', 12, true);
  RegisterProp('ItemToRelease', 13);
  RegisterProp('Price', 14);
  RegisterProp('SubtotalWithVatExcluded', 15);
  RegisterProp('TaxRate', 16);
  RegisterProp('Vat', 17);
  RegisterProp('Subtotal', 18, true);
  RegisterProp('ItemAccountDebit', 19);
  RegisterProp('ItemAccountCredit', 20);
  RegisterProp('AdditionalInfos', 21);
end;

destructor TTovTorgItem.Destroy;
begin
  FreeAndNil(FAdditionalInfos);
  inherited Destroy;
end;

{ TTovTorgTransferInfo }

procedure TTovTorgTransferInfo.InternalInit;
begin
  inherited InternalInit;
  FWaybills:=TWaybills.Create;
  FEmployee:=TEmployee.Create;
  FOtherIssuer:=TOtherIssuer.Create;
  FAdditionalInfos:=TAdditionalInfos.Create;
end;

procedure TTovTorgTransferInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('OperationInfo', 1, true);
  RegisterProp('TransferDate', 2);
  RegisterProp('Attachment', 3);
  RegisterProp('Waybills', 4);
  RegisterProp('Employee', 5);
  RegisterProp('OtherIssuer', 6);
  RegisterProp('AdditionalInfos', 7);
end;

destructor TTovTorgTransferInfo.Destroy;
begin
  FreeAndNil(FWaybills);
  FreeAndNil(FEmployee);
  FreeAndNil(FOtherIssuer);
  FreeAndNil(FAdditionalInfos);
  inherited Destroy;
end;

{ TGroundInfo }

procedure TGroundInfo.InternalInit;
begin
  inherited InternalInit;
end;

procedure TGroundInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1, true);
  RegisterProp('Number', 2 );
  RegisterProp('Date', 3);
  RegisterProp('Info', 4);
end;

destructor TGroundInfo.Destroy;
begin
  inherited Destroy;
end;

end.

