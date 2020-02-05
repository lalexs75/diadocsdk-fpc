{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2020 Lagunov Aleksey alexs75@yandex.ru

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

unit DiadocTypes_AcceptanceCertificate552Info;

{$I diadoc_define.inc}

interface

//import "Invoicing/InvoiceInfo.proto";
//import "Invoicing/ExtendedSigner.proto";
//import "Invoicing/ExtendedOrganizationInfo.proto";
//import "Invoicing/UniversalTransferDocumentInfo.proto";
//import "Invoicing/TovTorgInfo.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_InvoiceInfo,
  DiadocTypes_ExtendedSigner,
  DiadocTypes_ExtendedOrganizationInfo,
  DiadocTypes_UniversalTransferDocumentInfo,
  DiadocTypes_TovTorgInfo;

type
  {  TAcceptanceCertificate552BuyerTitleInfo  }
  //message AcceptanceCertificate552BuyerTitleInfo {
  //	repeated Signers.ExtendedSigner Signers = 1; // Подписант // Документ.Подписант
  //	required string DocumentCreator = 2; // Составитель файла информации продавца // НаимЭконСубСост
  //	optional string DocumentCreatorBase = 3; // Основание, по которому экономический субъект является составителем файла //ОснДоверОргСост
  //	optional string OperationType = 4; // Вид операции // ВидОперации
  //	required string OperationContent = 6; // Содержание операции // СодОпер
  //	optional string AcceptanceDate = 7; // Дата приемки результатов работ // ДатаПрием
  //	optional string CreatedThingAcceptDate = 8; // Дата получения вещи, изготовленной  по договору подряда // СвПолВещи.ДатаПол
  //	optional string CreatedThingInfo = 9; // Сведения о получении // СвПолВещи.СвПол
  //	optional AdditionalInfoId AdditionalInfoId = 10; // Информационное поле документа // ИнфПолФХЖ3
  //}
  TAcceptanceCertificate552BuyerTitleInfo = class(TSerializationObject)
  private
    FAcceptanceDate: string;
    FAdditionalInfoId: TAdditionalInfoId;
    FCreatedThingAcceptDate: string;
    FCreatedThingInfo: string;
    FDocumentCreator: string;
    FDocumentCreatorBase: string;
    FOperationContent: string;
    FOperationType: string;
    FSigners: TExtendedSigners;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Signers:TExtendedSigners read FSigners;//1;
    property DocumentCreator:string read FDocumentCreator write FDocumentCreator;//2;
    property DocumentCreatorBase:string read FDocumentCreatorBase write FDocumentCreatorBase;//3;
    property OperationType:string read FOperationType write FOperationType;//4;
    property OperationContent:string read FOperationContent write FOperationContent;//6;
    property AcceptanceDate:string read FAcceptanceDate write FAcceptanceDate;//7;
    property CreatedThingAcceptDate:string read FCreatedThingAcceptDate write FCreatedThingAcceptDate;//8;
    property CreatedThingInfo:string read FCreatedThingInfo write FCreatedThingInfo;//9;
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;//10;
  end;


  {  TAcceptanceCertificate552WorkItem  }
  //message AcceptanceCertificate552WorkItem {
  //	optional string Name = 1; // наименование // НаимРабот
  //	optional string Description = 2; // описание работы // Описание
  //	optional string UnitCode = 3; // код единицы измерения // ОКЕИ
  //	optional string UnitName = 4; // наименование единицы измерения // НаимЕдИзм
  //	optional string Price = 5; // цена // Цена
  //	optional string Quantity = 6; // количество // Количество
  //	optional string SubtotalWithVatExcluded = 7; // сумма без учета НДС // СтоимБезНДС
  //	optional string Vat = 8; // сумма НДС // СумНДС
  //	optional string Subtotal = 9; // сумма с учетом НДС // СтоимУчНДС
  //	repeated AdditionalInfo AdditionalInfos = 10; // информационное поле сведений о работе (услуге) // ИнфПолеОписРабот
  //	optional TaxRate TaxRate = 11 [default = Percent_18]; // ставка налога // НалСт
  //	optional string ItemAccountDebit = 12; // Корреспондирующие счета: дебет // КоррСчДебет
  //	optional string ItemAccountCredit = 13; // Корреспондирующие счета: кредит // КоррСчКредит
  //}
  TAcceptanceCertificate552WorkItem = class(TSerializationObject)
  private
    FAdditionalInfos: TAdditionalInfos;
    FDescription: string;
    FItemAccountCredit: string;
    FItemAccountDebit: string;
    FName: string;
    FPrice: string;
    FQuantity: string;
    FSubtotal: string;
    FSubtotalWithVatExcluded: string;
    FTaxRate: TTaxRate;
    FUnitCode: string;
    FUnitName: string;
    FVat: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Name:string read FName write FName;//1;
    property Description:string read FDescription write FDescription;//2;
    property UnitCode:string read FUnitCode write FUnitCode;//3;
    property UnitName:string read FUnitName write FUnitName;//4;
    property Price:string read FPrice write FPrice;//5;
    property Quantity:string read FQuantity write FQuantity;//6;
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write FSubtotalWithVatExcluded;//7;
    property Vat:string read FVat write FVat;//8;
    property Subtotal:string read FSubtotal write FSubtotal;//9;
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos;//10;
    property TaxRate:TTaxRate read FTaxRate write FTaxRate default Percent_18;//11
    property ItemAccountDebit:string read FItemAccountDebit write FItemAccountDebit;//12;
    property ItemAccountCredit:string read FItemAccountCredit write FItemAccountCredit;//13;
  end;
  TAcceptanceCertificate552WorkItems = specialize GSerializationObjectList<TAcceptanceCertificate552WorkItem>;

  {  TAcceptanceCertificate552WorkDescription  }
  //message AcceptanceCertificate552WorkDescription {
  //	optional string StartingDate = 1; // начало периода выполнения работ // НачРабот
  //	optional string CompletionDate = 2; // окончание периода выполнения работ // КонРабот
  //	optional string TotalWithVatExcluded = 3; // сумма без учета НДС - итого // СтБезНДСИт
  //	optional string TotalVat = 4; // сумма НДС - итого // СумНДСИт
  //	required string Total = 5; // сумма с учетом НДС - итого // СтУчНДСИт
  //	repeated AcceptanceCertificate552WorkItem Items = 6; // сведения о произведенной работе // Работа
  //}
  TAcceptanceCertificate552WorkDescription = class(TSerializationObject)
  private
    FCompletionDate: string;
    FItems: TAcceptanceCertificate552WorkItems;
    FStartingDate: string;
    FTotal: string;
    FTotalVat: string;
    FTotalWithVatExcluded: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property StartingDate:string read FStartingDate write FStartingDate;//1;
    property CompletionDate:string read FCompletionDate write FCompletionDate;//2;
    property TotalWithVatExcluded:string read FTotalWithVatExcluded write FTotalWithVatExcluded;//3;
    property TotalVat:string read FTotalVat write FTotalVat;//4;
    property Total:string read FTotal write FTotal;//5;
    property Items:TAcceptanceCertificate552WorkItems read FItems;//6;
  end;
  TAcceptanceCertificate552WorkDescriptions = specialize GSerializationObjectList<TAcceptanceCertificate552WorkDescription>;

  {  TAcceptanceCertificate552TransferInfo  }
  //message AcceptanceCertificate552TransferInfo {
  //	required string OperationInfo = 1; // Содержание операции // СодОпер
  //	optional string TransferDate = 2; // Дата передачи результатов работ // ДатаПер
  //	optional string CreatedThingTransferDate = 3; // Дата передачи вещи, изготовленной по договору подряда // СвПерВещи.ДатаПерВещ
  //	optional string CreatedThingInfo = 4; // Сведения о передаче // СвПерВещи.СвПерВещ
  //	repeated AdditionalInfo AdditionalInfos = 5; // Информационное поле документа // ИнфПолФХЖ2
  //}
  TAcceptanceCertificate552TransferInfo = class(TSerializationObject)
  private
    FAdditionalInfos: TAdditionalInfos;
    FCreatedThingInfo: string;
    FCreatedThingTransferDate: string;
    FOperationInfo: string;
    FTransferDate: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property OperationInfo:string read FOperationInfo write FOperationInfo;//1;
    property TransferDate:string read FTransferDate write FTransferDate;//2;
    property CreatedThingTransferDate:string read FCreatedThingTransferDate write FCreatedThingTransferDate;//3;
    property CreatedThingInfo:string read FCreatedThingInfo write FCreatedThingInfo;//4;
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos; //5;
  end;


  {  TAcceptanceCertificate552SellerTitleInfo  }
  //message AcceptanceCertificate552SellerTitleInfo {
  //	required Organizations.ExtendedOrganizationInfo Seller = 1; // Исполнитель (продавец услуг) // Исполнитель
  //	required Organizations.ExtendedOrganizationInfo Buyer = 2; // Заказчик (покупатель услуг) // Заказчик
  //	repeated Signers.ExtendedSigner Signers = 3; // Подписант // Документ.Подписант
  //	repeated GroundInfo Grounds = 4; // Основание // Основание
  //	required string Currency = 5; // Валюта (код) // КодОКВ
  //	optional string CurrencyRate = 6; // Курс валюты // КурсВал
  //	repeated AcceptanceCertificate552WorkDescription Works = 7; // описание выполненных работ // ОписРабот
  //	required string DocumentDate = 8; // Дата составления документа о передаче товара // ИдентДок.ДатаДокПРУ
  //	optional string DocumentNumber = 9; // Номер документа о передаче товара // ИдентДок.НомДокПРУ
  //	optional string RevisionDate = 10; // Дата исправления документа // ИспрДокПРУ.ДатаИспрДокПРУ
  //	optional string RevisionNumber = 11; // Номер исправления документа // ИспрДокПРУ.НомИспрДокПРУ
  //	required string DocumentCreator = 12; // Составитель файла информации продавца // НаимЭконСубСост
  //	optional string DocumentCreatorBase = 13; // Основание, по которому экономический субъект является составителем файла //ОснДоверОргСост
  //	optional string OperationType = 14; // Вид операции // ВидОперации
  //	optional string OperationTitle = 15; // Заголовок содержания операции // ЗагСодОпер
  //	optional string GovernmentContractInfo = 16; // Идентификатор государственного контракта // ИдГосКон
  //	optional AdditionalInfoId AdditionalInfoId = 17; // Информационное поле документа // ИнфПолФХЖ1
  //	required string DocumentName = 18; // Наименование первичного документа, определенное организацией // НаимДок.НаимДокОпр
  //	required AcceptanceCertificate552TransferInfo TransferInfo = 19; // Содержание факта хозяйственной жизни - сведения о передаче результатов работ (о предъявлении оказанных услуг) // СодФХЖ2
  //}
  TAcceptanceCertificate552SellerTitleInfo = class(TSerializationObject)
  private
    FAdditionalInfoId: TAdditionalInfoId;
    FBuyer: TExtendedOrganizationInfo;
    FCurrency: string;
    FCurrencyRate: string;
    FDocumentCreator: string;
    FDocumentCreatorBase: string;
    FDocumentDate: string;
    FDocumentName: string;
    FDocumentNumber: string;
    FGovernmentContractInfo: string;
    FGrounds: TGroundInfos;
    FOperationTitle: string;
    FOperationType: string;
    FRevisionDate: string;
    FRevisionNumber: string;
    FSeller: TExtendedOrganizationInfo;
    FSigners: TExtendedSigners;
    FTransferInfo: TAcceptanceCertificate552TransferInfo;
    FWorks: TAcceptanceCertificate552WorkDescriptions;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Seller:TExtendedOrganizationInfo read FSeller;//1;
    property Buyer:TExtendedOrganizationInfo read FBuyer;//2;
    property Signers:TExtendedSigners read FSigners;//3;
    property Grounds:TGroundInfos read FGrounds;//4;
    property Currency:string read FCurrency write FCurrency;//5;
    property CurrencyRate:string read FCurrencyRate write FCurrencyRate;//6;
    property Works:TAcceptanceCertificate552WorkDescriptions read FWorks;//7;
    property DocumentDate:string read FDocumentDate write FDocumentDate;//8;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//9;
    property RevisionDate:string read FRevisionDate write FRevisionDate;//10;
    property RevisionNumber:string read FRevisionNumber write FRevisionNumber;//11;
    property DocumentCreator:string read FDocumentCreator write FDocumentCreator;//12;
    property DocumentCreatorBase:string read FDocumentCreatorBase write FDocumentCreatorBase;//13;
    property OperationType:string read FOperationType write FOperationType;//14;
    property OperationTitle:string read FOperationTitle write FOperationTitle;//15;
    property GovernmentContractInfo:string read FGovernmentContractInfo write FGovernmentContractInfo;//16;
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;//17;
    property DocumentName:string read FDocumentName write FDocumentName;//18;
    property TransferInfo:TAcceptanceCertificate552TransferInfo read FTransferInfo;//19;
  end;

implementation

{ TAcceptanceCertificate552SellerTitleInfo }

procedure TAcceptanceCertificate552SellerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FSeller:=TExtendedOrganizationInfo.Create;
  FBuyer:=TExtendedOrganizationInfo.Create;
  FSigners:=TExtendedSigners.Create;
  FGrounds:=TGroundInfos.Create;
  FWorks:=TAcceptanceCertificate552WorkDescriptions.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FTransferInfo:=TAcceptanceCertificate552TransferInfo.Create;
end;

procedure TAcceptanceCertificate552SellerTitleInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Seller', 1, true);
  RegisterProp('Buyer', 2, true);
  RegisterProp('Signers', 3);
  RegisterProp('Grounds', 4);
  RegisterProp('Currency', 5, true);
  RegisterProp('CurrencyRate', 6);
  RegisterProp('Works', 7);
  RegisterProp('DocumentDate', 8, true);
  RegisterProp('DocumentNumber', 9);
  RegisterProp('RevisionDate', 10);
  RegisterProp('RevisionNumber', 11);
  RegisterProp('DocumentCreator', 12, true);
  RegisterProp('DocumentCreatorBase', 13);
  RegisterProp('OperationType', 14);
  RegisterProp('OperationTitle', 15);
  RegisterProp('GovernmentContractInfo', 16);
  RegisterProp('AdditionalInfoId', 17);
  RegisterProp('DocumentName', 18, true);
  RegisterProp('TransferInfo', 19, true);
end;

destructor TAcceptanceCertificate552SellerTitleInfo.Destroy;
begin
  FreeAndNil(FSeller);
  FreeAndNil(FBuyer);
  FreeAndNil(FSigners);
  FreeAndNil(FGrounds);
  FreeAndNil(FWorks);
  FreeAndNil(FAdditionalInfoId);
  FreeAndNil(FTransferInfo);
  inherited Destroy;
end;

{ TAcceptanceCertificate552TransferInfo }

procedure TAcceptanceCertificate552TransferInfo.InternalInit;
begin
  inherited InternalInit;
  FAdditionalInfos:=TAdditionalInfos.Create;
end;

procedure TAcceptanceCertificate552TransferInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('OperationInfo', 1, true);
  RegisterProp('TransferDate', 2);
  RegisterProp('CreatedThingTransferDate', 3);
  RegisterProp('CreatedThingInfo', 4);
  RegisterProp('AdditionalInfos', 5);
end;

destructor TAcceptanceCertificate552TransferInfo.Destroy;
begin
  FreeAndNil(FAdditionalInfos);
  inherited Destroy;
end;

{ TAcceptanceCertificate552WorkDescription }

procedure TAcceptanceCertificate552WorkDescription.InternalInit;
begin
  inherited InternalInit;
  FItems:=TAcceptanceCertificate552WorkItems.Create;
end;

procedure TAcceptanceCertificate552WorkDescription.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('StartingDate', 1);
  RegisterProp('CompletionDate', 2);
  RegisterProp('TotalWithVatExcluded', 3);
  RegisterProp('TotalVat', 4);
  RegisterProp('Total', 5);
  RegisterProp('Items', 6);
end;

destructor TAcceptanceCertificate552WorkDescription.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

{ TAcceptanceCertificate552WorkItem }

procedure TAcceptanceCertificate552WorkItem.InternalInit;
begin
  inherited InternalInit;
  FAdditionalInfos:=TAdditionalInfos.Create;
  FTaxRate:=Percent_18;
end;

procedure TAcceptanceCertificate552WorkItem.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1);
  RegisterProp('Description', 2);
  RegisterProp('UnitCode', 3);
  RegisterProp('UnitName', 4);
  RegisterProp('Price', 5);
  RegisterProp('Quantity', 6);
  RegisterProp('SubtotalWithVatExcluded', 7);
  RegisterProp('Vat', 8);
  RegisterProp('Subtotal', 9);
  RegisterProp('AdditionalInfos', 10);
  RegisterProp('TaxRate', 11);
  RegisterProp('ItemAccountDebit', 12);
  RegisterProp('ItemAccountCredit', 13);
end;

destructor TAcceptanceCertificate552WorkItem.Destroy;
begin
  FreeAndNil(FAdditionalInfos);
  inherited Destroy;
end;

{ TAcceptanceCertificate552BuyerTitleInfo }

procedure TAcceptanceCertificate552BuyerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FSigners:=TExtendedSigners.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
end;

procedure TAcceptanceCertificate552BuyerTitleInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Signers', 1);
  RegisterProp('DocumentCreator', 2, true);
  RegisterProp('DocumentCreatorBase', 3);
  RegisterProp('OperationType', 4);
  RegisterProp('OperationContent', 6, true);
  RegisterProp('AcceptanceDate', 7);
  RegisterProp('CreatedThingAcceptDate', 8);
  RegisterProp('CreatedThingInfo', 9);
  RegisterProp('AdditionalInfoId', 10);
end;

destructor TAcceptanceCertificate552BuyerTitleInfo.Destroy;
begin
  FreeAndNil(FSigners);
  FreeAndNil(FAdditionalInfoId);
  inherited Destroy;
end;

end.

