{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2019 Lagunov Aleksey alexs75@yandex.ru

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

{ Структуры данных базируются на информации http://api-docs.diadoc.ru/ru/latest/DataStructures.html }

unit DiadocTypes_UniversalTransferDocumentInfo;

{$I diadoc_define.inc}

interface

(*
import "Invoicing/InvoiceInfo.proto";
import "Invoicing/ExtendedSigner.proto";
import "Invoicing/ExtendedOrganizationInfo.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_InvoiceInfo,
  DiadocTypes_ExtendedSigner,
  DiadocTypes_ExtendedOrganizationInfo;

type
  TItemMark = (
    NotSpecified = 0,   // не указано
    Prop = 1,           // имущество
    Job = 2,            // работа
    Service = 3,        // услуга
    PropertyRights = 4, // имущественные права
    Other = 5           // иное
  );

  TFunctionType = (
    Invoice = 0,         // СЧФ
    Basic = 1,           // ДОП
    InvoiceAndBasic = 2  // СЧФДОП
  );


  { TExtendedInvoiceCorrectionItem }
  //message ExtendedInvoiceCorrectionItem {
  //	required string Product = 1;                                 // наименование товара // НаимТов
  //	required CorrectableInvoiceItemFields OriginalValues = 2;    // значения до изменения
  //	required CorrectableInvoiceItemFields CorrectedValues = 3;   // значения после изменения
  //	optional InvoiceItemAmountsDiff AmountsInc = 4;              // суммы к увеличению
  //	optional InvoiceItemAmountsDiff AmountsDec = 5;              // суммы к уменьшению
  //	optional string ItemAccountDebit = 6;                        // Корреспондирующие счета: дебет // КорСчДебет
  //	optional string ItemAccountCredit = 7;                       // Корреспондирующие счета: кредит // КорСчКредит
  //	repeated AdditionalInfo AdditionalInfo = 8;                  // информационное поле документа // ИнфПолФХЖ2
  //}
  TExtendedInvoiceCorrectionItem = class(TSerializationObject) //message ExtendedInvoiceCorrectionItem
  private
    FAdditionalInfo: TAdditionalInfos;
    FAmountsDec: TInvoiceItemAmountsDiff;
    FAmountsInc: TInvoiceItemAmountsDiff;
    FCorrectedValues: TCorrectableInvoiceItemFields;
    FItemAccountCredit: string;
    FItemAccountDebit: string;
    FOriginalValues: TCorrectableInvoiceItemFields;
    FProduct: string;
    procedure SetItemAccountCredit(AValue: string);
    procedure SetItemAccountDebit(AValue: string);
    procedure SetProduct(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Product:string read FProduct write SetProduct; //1
    property OriginalValues:TCorrectableInvoiceItemFields read FOriginalValues; //2
    property CorrectedValues:TCorrectableInvoiceItemFields read FCorrectedValues; //3
    property AmountsInc:TInvoiceItemAmountsDiff read FAmountsInc; //4
    property AmountsDec:TInvoiceItemAmountsDiff read FAmountsDec; //5
    property ItemAccountDebit:string read FItemAccountDebit write SetItemAccountDebit; //6
    property ItemAccountCredit:string read FItemAccountCredit write SetItemAccountCredit; //7
    property AdditionalInfo:TAdditionalInfos read FAdditionalInfo;//8
  end;
  TExtendedInvoiceCorrectionItems = specialize GSerializationObjectList<TExtendedInvoiceCorrectionItem>;


  {  TInvoiceCorrectionTable  }

  //message InvoiceCorrectionTable {
  //	repeated ExtendedInvoiceCorrectionItem Items = 1;            // информация о товарах // СведТов
  //	optional InvoiceTotalsDiff TotalsInc = 2;                    // суммы к увеличению // ВсегоУвел
  //	optional InvoiceTotalsDiff TotalsDec = 3;                    // суммы к уменьшению // ВсегоУм
  //}
  TInvoiceCorrectionTable = class(TSerializationObject) //message InvoiceCorrectionTable
  private
    FItems: TExtendedInvoiceCorrectionItems;
    FTotalsDec: TInvoiceTotalsDiff;
    FTotalsInc: TInvoiceTotalsDiff;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Items:TExtendedInvoiceCorrectionItems read FItems; //1;
    property TotalsInc:TInvoiceTotalsDiff read FTotalsInc; //2;
    property TotalsDec:TInvoiceTotalsDiff read FTotalsDec; //3;
  end;


  {  TCorrectionBase  }
  //message CorrectionBase {
  //	required string BaseDocumentName = 1;                        // Наименование документа - основания // НаимОсн
  //	optional string BaseDocumentNumber = 2;                      // Номер документа - основания // НомОсн
  //	optional string BaseDocumentDate = 3;                        // Дата документа - основания, обязателен при НаимОсн отличном от значения "Отсутствует" // ДатаОсн
  //	optional string AdditionalInfo = 4;                          // Дополнительные сведения // ДопСвОсн
  //}
  TCorrectionBase = class(TSerializationObject) //message CorrectionBase
  private
    FAdditionalInfo: string;
    FBaseDocumentDate: string;
    FBaseDocumentName: string;
    FBaseDocumentNumber: string;
    procedure SetAdditionalInfo(AValue: string);
    procedure SetBaseDocumentDate(AValue: string);
    procedure SetBaseDocumentName(AValue: string);
    procedure SetBaseDocumentNumber(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BaseDocumentName:string read FBaseDocumentName write SetBaseDocumentName;//1
    property BaseDocumentNumber:string read FBaseDocumentNumber write SetBaseDocumentNumber;//2
    property BaseDocumentDate:string read FBaseDocumentDate write SetBaseDocumentDate;//3
    property AdditionalInfo:string read FAdditionalInfo write SetAdditionalInfo;//4
  end;
  TCorrectionBases = specialize GSerializationObjectList<TCorrectionBase>;


  {  TEventContent  }
  //message EventContent {
  //	optional string CostChangeInfo = 1;                          // Иные сведения об изменении стоимости  // ИныеСвИзмСтоим
  //	required string TransferDocDetails = 2;                      // Реквизиты передаточных документов, к которым относится корректировка // ПередатДокум
  //	required string OperationContent = 3;                        // Содержание операции // СодОпер
  //	optional string NotificationDate = 4;                        // Дата направления на согласование // ДатаНапр
  //	repeated CorrectionBase CorrectionBase = 5;                  // Основание корректировки // ОснКор
  //}
  TEventContent = class(TSerializationObject) //message EventContent
  private
    FCorrectionBase: TCorrectionBases;
    FCostChangeInfo: string;
    FNotificationDate: string;
    FOperationContent: string;
    FTransferDocDetails: string;
    procedure SetCostChangeInfo(AValue: string);
    procedure SetNotificationDate(AValue: string);
    procedure SetOperationContent(AValue: string);
    procedure SetTransferDocDetails(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property CostChangeInfo:string read FCostChangeInfo write SetCostChangeInfo;//1;
    property TransferDocDetails:string read FTransferDocDetails write SetTransferDocDetails;//2;
    property OperationContent:string read FOperationContent write SetOperationContent;//3;
    property NotificationDate:string read FNotificationDate write SetNotificationDate;//4;
    property CorrectionBase:TCorrectionBases read FCorrectionBase; //5
  end;


  {  TInvoiceRevisionInfo  }

  //message InvoiceRevisionInfo {
  //	required string InvoiceRevisionDate = 1;                     // ДатаИспрСчФ (заполняется, если КСФ/ИКСФ формируется на исправленный СФ)
  //	required string InvoiceRevisionNumber = 2;                   // НомИспрСчФ (заполняется, если КСФ/ИКСФ формируется на исправленный СФ)
  //}
  TInvoiceRevisionInfo = class(TSerializationObject) //message InvoiceRevisionInfo
  private
    FInvoiceRevisionDate: string;
    FInvoiceRevisionNumber: string;
    procedure SetInvoiceRevisionDate(AValue: string);
    procedure SetInvoiceRevisionNumber(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InvoiceRevisionDate:string read FInvoiceRevisionDate write SetInvoiceRevisionDate;//1
    property InvoiceRevisionNumber:string read FInvoiceRevisionNumber write SetInvoiceRevisionNumber;//2;
  end;
  TInvoiceRevisionInfos = specialize GSerializationObjectList<TInvoiceRevisionInfo>;

  {  TInvoiceForCorrectionInfo  }
  //message InvoiceForCorrectionInfo {
  //	required string InvoiceDate = 1;                             // ДатаСчФ
  //	required string InvoiceNumber = 2;                           // НомерСчФ
  //	repeated InvoiceRevisionInfo InvoiceRevisions = 3;           // С учетом исправления // ИспрСчФ
  //}
  TInvoiceForCorrectionInfo = class(TSerializationObject) //message InvoiceForCorrectionInfo
  private
    FInvoiceDate: string;
    FInvoiceNumber: string;
    FInvoiceRevisions: TInvoiceRevisionInfos;
    procedure SetInvoiceDate(AValue: string);
    procedure SetInvoiceNumber(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InvoiceDate:string read FInvoiceDate write SetInvoiceDate; //1
    property InvoiceNumber:string read FInvoiceNumber write SetInvoiceNumber; //2
    property InvoiceRevisions:TInvoiceRevisionInfos read FInvoiceRevisions; //3
  end;
  TInvoiceForCorrectionInfos = specialize GSerializationObjectList<TInvoiceForCorrectionInfo>;

  {  TAdditionalInfoId  }

  //message AdditionalInfoId {
  //	optional string InfoFileId = 1;             // Идентификатор файла информационного поля // ИдФайлИнфПол
  //	repeated AdditionalInfo AdditionalInfo = 2; // Текстовая информация // ТекстИнф
  //}
  TAdditionalInfoId = class(TSerializationObject) //message AdditionalInfoId
  private
    FAdditionalInfo: TAdditionalInfos;
    FInfoFileId: string;
    procedure SetInfoFileId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InfoFileId:string read FInfoFileId write SetInfoFileId;//1;
    property AdditionalInfo:TAdditionalInfos read FAdditionalInfo; //2;
  end;

  {  TUniversalCorrectionDocumentSellerTitleInfo  }

  //message UniversalCorrectionDocumentSellerTitleInfo {
  //	required FunctionType Function = 1;                          // Функция документа // Функция
  //	optional string DocumentName = 2;                            // Наименование первичного документа, определенное организацией // НаимДокОпр
  //	required string DocumentDate  = 3;                           // дата УКД // ДатаКСчФ
  //	required string DocumentNumber  = 4;                         // номер УКД // НомерКСчФ
  //	repeated InvoiceForCorrectionInfo Invoices = 5;              // Счет-фактура (первичный документ), к которому составлен корректировочный счет-фактура // СчФ
  //	required Organizations.ExtendedOrganizationInfo Seller = 6;  // продавец // СвПрод
  //	required Organizations.ExtendedOrganizationInfo Buyer = 7;   // покупатель // СвПокуп
  //	repeated Signers.ExtendedSigner Signers = 8;                 // Подписант // Подписант
  //	required EventContent EventContent = 9;                      // Содержание события // СодФХЖ3
  //	required InvoiceCorrectionTable InvoiceCorrectionTable = 10; // Сведения таблицы корректировочного счета-фактуры // ТаблКСчФ
  //	required string Currency = 11;                               // валюта (код) // КодОКВ
  //	optional string CurrencyRate = 12;                           // Курс валюты // КурсВал
  //	optional string CorrectionRevisionDate = 13;                 // ДатаИспрКСчФ, обязателен, если формируется исправление // ДатаИспрКСчФ
  //	optional string CorrectionRevisionNumber = 14;               // НомИспрКСчФ, обязателен, если формируется исправление // НомИспрКСчФ
  //	optional AdditionalInfoId AdditionalInfoId = 15;             // информационное поле документа // ИнфПолФХЖ1
  //	required string DocumentCreator = 16;                        // Наименование экономического субъекта-составителя файла обмена счета-фактуры (информации продавца) // НаимЭконСубСост
  //	optional string DocumentCreatorBase = 17;                    // Основание, по которому экономический субъект является составителем файла обмена счета-фактуры //ОснДоверОргСост
  //	optional string GovernmentContractInfo = 18;                 // Идентификатор государственного контракта // ИдГосКон
  //}
  TUniversalCorrectionDocumentSellerTitleInfo = class(TSerializationObject) //message UniversalCorrectionDocumentSellerTitleInfo
  private
    FAdditionalInfoId: TAdditionalInfoId;
    FBuyer: TExtendedOrganizationInfo;
    FCorrectionRevisionDate: string;
    FCorrectionRevisionNumber: string;
    FCurrency: string;
    FCurrencyRate: string;
    FDocumentCreator: string;
    FDocumentCreatorBase: string;
    FDocumentDate: string;
    FDocumentName: string;
    FDocumentNumber: string;
    FEventContent: TEventContent;
    FFunctionType: TFunctionType;
    FGovernmentContractInfo: string;
    FInvoiceCorrectionTable: TInvoiceCorrectionTable;
    FInvoices: TInvoiceForCorrectionInfos;
    FSeller: TExtendedOrganizationInfo;
    FSigners: TExtendedSigners;
    procedure SetCorrectionRevisionDate(AValue: string);
    procedure SetCorrectionRevisionNumber(AValue: string);
    procedure SetCurrency(AValue: string);
    procedure SetCurrencyRate(AValue: string);
    procedure SetDocumentCreator(AValue: string);
    procedure SetDocumentCreatorBase(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentName(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFunctionType(AValue: TFunctionType);
    procedure SetGovernmentContractInfo(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FunctionType:TFunctionType read FFunctionType write SetFunctionType;//1
    property DocumentName:string read FDocumentName write SetDocumentName;//2;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//3;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;//4;
    property Invoices:TInvoiceForCorrectionInfos read FInvoices; //5;
    property Seller:TExtendedOrganizationInfo read FSeller; //6;
    property Buyer:TExtendedOrganizationInfo read FBuyer; //7;
    property Signers:TExtendedSigners read FSigners; //8;
    property EventContent:TEventContent read FEventContent; //9;
    property InvoiceCorrectionTable:TInvoiceCorrectionTable read FInvoiceCorrectionTable; //10;
    property Currency:string read FCurrency write SetCurrency;//11;
    property CurrencyRate:string read FCurrencyRate write SetCurrencyRate;//12;
    property CorrectionRevisionDate:string read FCorrectionRevisionDate write SetCorrectionRevisionDate;//13;
    property CorrectionRevisionNumber:string read FCorrectionRevisionNumber write SetCorrectionRevisionNumber;//14;
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId; //15;
    property DocumentCreator:string read FDocumentCreator write SetDocumentCreator;//16;
    property DocumentCreatorBase:string read FDocumentCreatorBase write SetDocumentCreatorBase;//17;
    property GovernmentContractInfo:string read FGovernmentContractInfo write SetGovernmentContractInfo; //18;
  end;


  {  TEmployee  }
  //message Employee {
  //	required string EmployeePosition = 1;   // Должность // Должность
  //	optional string EmployeeInfo = 2;       // Иные сведения, идентифицирующие физическое лицо // ИныеСвед
  //	optional string EmployeeBase = 3;       // Основание полномочий предстваителя // ОснПолн
  //	required string TransferSurname = 4;    // Фамилия //Фамилия
  //	required string TransferFirstName = 5;  // Имя //Имя
  //	optional string TransferPatronymic = 6; // Отчество //Отчество
  //}
  TEmployee = class(TSerializationObject) //message Employee
  private
    FEmployeeBase: string;
    FEmployeeInfo: string;
    FEmployeePosition: string;
    FTransferFirstName: string;
    FTransferPatronymic: string;
    FTransferSurname: string;
    procedure SetEmployeeBase(AValue: string);
    procedure SetEmployeeInfo(AValue: string);
    procedure SetEmployeePosition(AValue: string);
    procedure SetTransferFirstName(AValue: string);
    procedure SetTransferPatronymic(AValue: string);
    procedure SetTransferSurname(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property EmployeePosition:string read FEmployeePosition write SetEmployeePosition; //1;
    property EmployeeInfo:string read FEmployeeInfo write SetEmployeeInfo; //2;
    property EmployeeBase:string read FEmployeeBase write SetEmployeeBase; //3;
    property TransferSurname:string read FTransferSurname write SetTransferSurname; //4;
    property TransferFirstName:string read FTransferFirstName write SetTransferFirstName; //5;
    property TransferPatronymic:string read FTransferPatronymic write SetTransferPatronymic; //6;
  end;


  {  TOtherIssuer  }
  //message OtherIssuer {
  //	optional string TransferEmployeePosition = 1; // Должность предстваителя организации // Должность //если заполнено 0 формируется структура «ПредОргПер», если не заполнено – «ФЛПер»
  //	optional string TransferEmployeeInfo = 2;     // Иные сведения, идентифицирующие физическое лицо // ИныеСвед
  //	optional string TransferOrganizationName = 3; // Наименование организации, которой доверена передача // НаимОргПер
  //	optional string TransferOrganizationBase = 4; // Основание, по которому организации доверена передача // ОснДоверОргПер
  //	optional string TransferEmployeeBase = 5;     // Основание полномочий предстваителя // ОснПолнПредПер (ОснДоверФЛ)
  //	required string TransferSurname = 6;    // Фамилия //Фамилия
  //	required string TransferFirstName = 7;  // Имя //Имя
  //	optional string TransferPatronymic = 8; // Отчество //Отчество
  //}
  TOtherIssuer = class(TSerializationObject) //message OtherIssuer
  private
    FTransferEmployeeBase: string;
    FTransferEmployeeInfo: string;
    FTransferEmployeePosition: string;
    FTransferFirstName: string;
    FTransferOrganizationBase: string;
    FTransferOrganizationName: string;
    FTransferPatronymic: string;
    FTransferSurname: string;
    procedure SetTransferEmployeeBase(AValue: string);
    procedure SetTransferEmployeeInfo(AValue: string);
    procedure SetTransferEmployeePosition(AValue: string);
    procedure SetTransferFirstName(AValue: string);
    procedure SetTransferOrganizationBase(AValue: string);
    procedure SetTransferOrganizationName(AValue: string);
    procedure SetTransferPatronymic(AValue: string);
    procedure SetTransferSurname(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TransferEmployeePosition:string read FTransferEmployeePosition write SetTransferEmployeePosition;//1;
    property TransferEmployeeInfo:string read FTransferEmployeeInfo write SetTransferEmployeeInfo;//2;
    property TransferOrganizationName:string read FTransferOrganizationName write SetTransferOrganizationName;//3;
    property TransferOrganizationBase:string read FTransferOrganizationBase write SetTransferOrganizationBase;//4;
    property TransferEmployeeBase:string read FTransferEmployeeBase write SetTransferEmployeeBase;//5;
    property TransferSurname:string read FTransferSurname write SetTransferSurname;//6;
    property TransferFirstName:string read FTransferFirstName write SetTransferFirstName;//7;
    property TransferPatronymic:string read FTransferPatronymic write SetTransferPatronymic;//8;
  end;


  {  TWaybill  }
  //message  Waybill {
  //	required  string TransferDocumentNumber = 1; // Номер транспортной накладной // НомерТранНакл
  //	required  string TransferDocumentDate = 2;   // Дата траспортной накладной // ДатаТранНакл
  //}
  TWaybill = class(TSerializationObject) //message Waybill
  private
    FTransferDocumentDate: string;
    FTransferDocumentNumber: string;
    procedure SetTransferDocumentDate(AValue: string);
    procedure SetTransferDocumentNumber(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TransferDocumentNumber:string read FTransferDocumentNumber write SetTransferDocumentNumber;//1;
    property TransferDocumentDate:string read FTransferDocumentDate write SetTransferDocumentDate;//2;
  end;
  TWaybills = specialize GSerializationObjectList<TWaybill>;


  {  TTransferBase  }
  //message TransferBase {
  //	required string BaseDocumentName = 1;   // Наименование документа-основания отгрузки //НаимОсн
  //	optional string BaseDocumentNumber = 2; // Номер документа-основания отгрузки //НомОсн
  //	optional string BaseDocumentDate = 3;   // Дата документа-основания отгрузки //ДатаОсн
  //	optional string BaseDocumentInfo = 4;   // Дополнительные сведения документа-основания отгрузки //ДопСвОсн
  //}
  TTransferBase = class(TSerializationObject) //message TransferBase
  private
    FBaseDocumentDate: string;
    FBaseDocumentInfo: string;
    FBaseDocumentName: string;
    FBaseDocumentNumber: string;
    procedure SetBaseDocumentDate(AValue: string);
    procedure SetBaseDocumentInfo(AValue: string);
    procedure SetBaseDocumentName(AValue: string);
    procedure SetBaseDocumentNumber(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BaseDocumentName:string read FBaseDocumentName write SetBaseDocumentName;//1;
    property BaseDocumentNumber:string read FBaseDocumentNumber write SetBaseDocumentNumber;//2;
    property BaseDocumentDate:string read FBaseDocumentDate write SetBaseDocumentDate;//3;
    property BaseDocumentInfo:string read FBaseDocumentInfo write SetBaseDocumentInfo;//4;
  end;
  TTransferBases = specialize GSerializationObjectList<TTransferBase>;

  {  TTransferInfo  }

  //message TransferInfo {
  //	required string OperationInfo = 1;               // Содержание операции // СодОпер
  //	optional string OperationType = 2;               // Вид операции // ВидОпер
  //	optional string TransferDate = 3;                // Дата отгрузки // ДатаПер
  //	repeated TransferBase TransferBase = 4;          // Основание отгрузки //ОснПер
  //	optional string TransferTextInfo = 5;            // Сведения о транспортировке и грузе // СвТранГруз
  //	repeated Waybill Waybill = 6;                    // Транспортная накладная //ТранНакл
  //	optional Organizations.ExtendedOrganizationInfo Carrier = 7; // Перевозчик // Перевозчик
  //	optional Employee Employee = 8;                  // Работник организации продавца //РабОргПрод
  //	optional OtherIssuer  OtherIssuer = 9;           // Иное лицо //ИнЛицо
  //	optional string CreatedThingTransferDate = 10;   // Дата передачи вещи, изготовленной по договору //ДатаПерВещ
  //	optional string CreatedThingInfo = 11;           // Сведения о передаче, изготовленной по договору //СвПерВещ
  //	optional AdditionalInfoId AdditionalInfoId = 12; // Информационное поле документа // ИнфПолФХЖ3
  //}
  TTransferInfo = class(TSerializationObject) //message TransferInfo
  private
    FAdditionalInfoId: TAdditionalInfoId;
    FCarrier: TExtendedOrganizationInfo;
    FCreatedThingInfo: string;
    FCreatedThingTransferDate: string;
    FEmployee: TEmployee;
    FOperationInfo: string;
    FOperationType: string;
    FOtherIssuer: TOtherIssuer;
    FTransferBase: TTransferBases;
    FTransferDate: string;
    FTransferTextInfo: string;
    FWaybill: TWaybills;
    procedure SetCreatedThingInfo(AValue: string);
    procedure SetCreatedThingTransferDate(AValue: string);
    procedure SetOperationInfo(AValue: string);
    procedure SetOperationType(AValue: string);
    procedure SetTransferDate(AValue: string);
    procedure SetTransferTextInfo(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property OperationInfo:string read FOperationInfo write SetOperationInfo;//1;
    property OperationType:string read FOperationType write SetOperationType;//2;
    property TransferDate:string read FTransferDate write SetTransferDate;//3;
    property TransferBase:TTransferBases read FTransferBase; //4;
    property TransferTextInfo:string read FTransferTextInfo write SetTransferTextInfo;//5;
    property Waybill:TWaybills read FWaybill; //6;
    property Carrier:TExtendedOrganizationInfo read FCarrier; //7;
    property Employee:TEmployee read FEmployee; //8;
    property OtherIssuer:TOtherIssuer read FOtherIssuer;//9;
    property CreatedThingTransferDate:string read FCreatedThingTransferDate write SetCreatedThingTransferDate;//10;
    property CreatedThingInfo:string read FCreatedThingInfo write SetCreatedThingInfo;//11;
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId; //12;
  end;

  {  TExtendedInvoiceItem  }
  //message ExtendedInvoiceItem {
  //	required string Product = 1;  // наименование товара // НаимТов
  //	optional string Unit = 2;     // единицы измерения товара (код) // ОКЕИ_Тов
  //	optional string UnitName = 3; // наименование единицы измерения товара. Пользователь заполняет, если ОКЕИ_Тов=’0000’               // НаимЕдИзм
  //	optional string Quantity = 4; // количество единиц товара // КолТов
  //	optional string Price = 5;    // цена за единицу товара // ЦенаТов
  //	optional string Excise = 6;   // акциз // СумАкциз
  //	required TaxRate TaxRate = 7; // ставка налога // НалСт
  //	optional string SubtotalWithVatExcluded = 8; // сумма без учета налога // СтТовБезНДС
  //	optional string Vat = 9;       // сумма налога // СумНал
  //	required string Subtotal = 10; // сумма всего // СтТовУчНал
  //	repeated CustomsDeclaration CustomsDeclarations = 11; // номера таможенных деклараций // СвТД
  //	optional ItemMark ItemMark = 12;             // Признак товар-работа-услуга // ПрТовРаб
  //	optional string AdditionalProperty = 13;     // Дополнительная информация о признаке //ДопПризн
  //	optional string ItemVendorCode = 14;         // Характеристика/код/артикул/сорт товара // КодТов
  //	optional string ItemToRelease = 15;          // Количество надлежит отпустить // НадлОтп
  //	optional string ItemAccountDebit = 16;       // Корреспондирующие счета: дебет // КорСчДебет
  //	optional string ItemAccountCredit = 17;      // Корреспондирующие счета: кредит // КорСчКредит
  //	repeated AdditionalInfo AdditionalInfo = 18; // информационное поле документа // ИнфПолФХЖ2
  //}
  TExtendedInvoiceItem = class(TSerializationObject) //message ExtendedInvoiceItem
  private
    FAdditionalInfo: TAdditionalInfos;
    FAdditionalProperty: string;
    FCustomsDeclarations: TCustomsDeclarations;
    FExcise: string;
    FFItemMark: TItemMark;
    FItemAccountCredit: string;
    FItemAccountDebit: string;
    FItemMark: TItemMark;
    FItemToRelease: string;
    FItemVendorCode: string;
    FPrice: string;
    FProduct: string;
    FQuantity: string;
    FSubtotal: string;
    FSubtotalWithVatExcluded: string;
    FTaxRate: TTaxRate;
    FUnitName: string;
    FUnt: string;
    FVat: string;
    procedure SetAdditionalProperty(AValue: string);
    procedure SetExcise(AValue: string);
    procedure SetItemAccountCredit(AValue: string);
    procedure SetItemAccountDebit(AValue: string);
    procedure SetItemMark(AValue: TItemMark);
    procedure SetItemToRelease(AValue: string);
    procedure SetItemVendorCode(AValue: string);
    procedure SetPrice(AValue: string);
    procedure SetProduct(AValue: string);
    procedure SetQuantity(AValue: string);
    procedure SetSubtotal(AValue: string);
    procedure SetSubtotalWithVatExcluded(AValue: string);
    procedure SetTaxRate(AValue: TTaxRate);
    procedure SetUnitName(AValue: string);
    procedure SetUnt(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Product:string read FProduct write SetProduct;//1;
    property Unt:string read FUnt write SetUnt;//2;
    property UnitName:string read FUnitName write SetUnitName;//3;
    property Quantity:string read FQuantity write SetQuantity;//4;
    property Price:string read FPrice write SetPrice;//5;
    property Excise:string read FExcise write SetExcise;//6;
    property TaxRate:TTaxRate read FTaxRate write SetTaxRate; //7;
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;//8;
    property Vat:string read FVat write SetVat;//9;
    property Subtotal:string read FSubtotal write SetSubtotal;//10;
    property CustomsDeclarations:TCustomsDeclarations read FCustomsDeclarations; //11;
    property ItemMark:TItemMark read FItemMark write SetItemMark; //12;
    property AdditionalProperty:string read FAdditionalProperty write SetAdditionalProperty;//13;
    property ItemVendorCode:string read FItemVendorCode write SetItemVendorCode;//14;
    property ItemToRelease:string read FItemToRelease write SetItemToRelease;//15;
    property ItemAccountDebit:string read FItemAccountDebit write SetItemAccountDebit;//16;
    property ItemAccountCredit:string read FItemAccountCredit write SetItemAccountCredit;//17;
    property AdditionalInfo:TAdditionalInfos read FAdditionalInfo;//18;
  end;
  TExtendedInvoiceItems = specialize GSerializationObjectList<TExtendedInvoiceItem>;

  {  TUniversalTransferDocumentBuyerTitleInfo  }
  //message UniversalTransferDocumentBuyerTitleInfo {
  //	required string DocumentCreator = 1; // НаимЭконСубСост - Наименование экономического субъекта - составителя файла обмена информации покупателя
  //	optional string DocumentCreatorBase = 2; // ОснДоверОргСост - Основание, по которому экономический субъект является составителем файла обмена информации покупателя
  //	optional string OperationCode = 3; // ВидОперации - ВидОперации
  //	required string OperationContent = 4; // СодОпер - Содержание операции
  //	optional string AcceptanceDate = 5; // ДатаПрин - Дата принятия товаров (результатов выполненных работ), имущественных прав (подтверждения факта оказания услуг)
  //	optional Employee Employee = 6; // РабОргПок - работник организации покупателя
  //	optional OtherIssuer OtherIssuer = 7; // ИнЛицо - Иное Лицо
  //	optional AdditionalInfoId AdditionalInfoId = 8; // ИнфПолФХЖ4
  //	repeated Signers.ExtendedSigner Signers = 9; // Подписант
  //}
  TUniversalTransferDocumentBuyerTitleInfo = class(TSerializationObject) //message UniversalTransferDocumentBuyerTitleInfo
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
    procedure SetAcceptanceDate(AValue: string);
    procedure SetDocumentCreator(AValue: string);
    procedure SetDocumentCreatorBase(AValue: string);
    procedure SetOperationCode(AValue: string);
    procedure SetOperationContent(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentCreator:string read FDocumentCreator write SetDocumentCreator;//1;
    property DocumentCreatorBase:string read FDocumentCreatorBase write SetDocumentCreatorBase;//2;
    property OperationCode:string read FOperationCode write SetOperationCode;//3;
    property OperationContent:string read FOperationContent write SetOperationContent;//4;
    property AcceptanceDate:string read FAcceptanceDate write SetAcceptanceDate;//5;
    property Employee:TEmployee read FEmployee; //6;
    property OtherIssuer:TOtherIssuer read FOtherIssuer;//7;
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId; //8;
    property Signers:TExtendedSigners read FSigners; //9;
  end;


  {  TInvoiceTable  }

  //message InvoiceTable {
  //	repeated ExtendedInvoiceItem Items = 1;   // информация о товарах // СведТов
  //	optional string TotalWithVatExcluded = 2; // Сумма без учета налога // СтТовБезНДСВсего
  //	required string Vat = 3;                  // Сумма налога // СумНалВсего
  //	required string Total = 4;                // Сумма всего // СтТовУчНалВсего
  //	optional string TotalNet = 5;             // Нетто всего // НеттоВс}
  //}
  TInvoiceTable = class(TSerializationObject) //message InvoiceTable
  private
    FItems: TExtendedInvoiceItems;
    FTotal: string;
    FTotalNet: string;
    FTotalWithVatExcluded: string;
    FVat: string;
    procedure SetTotal(AValue: string);
    procedure SetTotalNet(AValue: string);
    procedure SetTotalWithVatExcluded(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Items:TExtendedInvoiceItems read FItems; //1;
    property TotalWithVatExcluded:string read FTotalWithVatExcluded write SetTotalWithVatExcluded;//2;
    property Vat:string read FVat write SetVat;//3;
    property Total:string read FTotal write SetTotal;//4;
    property TotalNet:string read FTotalNet write SetTotalNet;//5;
  end;


  {  TShipper  }
  //message Shipper {
  //	optional bool SameAsSeller = 1; // совпадает с продавцом // ОнЖе
  //	optional Organizations.ExtendedOrganizationInfo OrgInfo = 2; // реквизиты организации // ГрузОтпр
  //}
  TShipper = class(TSerializationObject) //message Shipper
  private
    FOrgInfo: TExtendedOrganizationInfo;
    FSameAsSeller: Boolean;
    procedure SetSameAsSeller(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SameAsSeller:Boolean read FSameAsSeller write SetSameAsSeller; //1;
    property OrgInfo:TExtendedOrganizationInfo read FOrgInfo; //2;
  end;


  {  TUniversalTransferDocumentSellerTitleInfo  }

  //message UniversalTransferDocumentSellerTitleInfo {
  //	required FunctionType Function = 1;  // Функция документа // Функция
  //	optional string DocumentName = 2;    // Наименование первичного документа, определенное организацией // НаимДокОпр
  //	required string DocumentDate  = 3;   // дата УПД // ДатаСчФ
  //	required string DocumentNumber  = 4; // номер УПД // НомерСчФ
  //	required Organizations.ExtendedOrganizationInfo Seller = 5;    // продавец // СвПрод
  //	required Organizations.ExtendedOrganizationInfo Buyer = 6;     // покупатель //СвПокуп
  //	optional Shipper Shipper = 7;                                  // грузоотправитель //ГрузОт
  //	optional Organizations.ExtendedOrganizationInfo Consignee = 8; // грузополучатель //ГрузПолуч
  //	repeated Signers.ExtendedSigner Signers = 9;        // подписант // Подписант
  //	repeated PaymentDocumentInfo PaymentDocuments = 10; // платежно-расчетные документы // СвПРД
  //	optional InvoiceTable InvoiceTable = 11;            // Сведения таблицы счет фактуры // ТаблСчФакт
  //	required string Currency = 12;                      // валюта (код) // КодОКВ
  //	optional string CurrencyRate = 13;                  // Курс валюты // КурсВал
  //	optional string RevisionDate = 14;                  // дата ИСФ (обязательно при формировании UniversalTransferDocumentSellerTitleRevision) // ДатаИспрСчФ
  //	optional string RevisionNumber = 15;                // номер ИСФ (обязательно при формировании UniversalTransferDocumentSellerTitleRevision) // НомИспрСчФ
  //	optional AdditionalInfoId AdditionalInfoId = 16;    // информационное поле документа // ИнфПолФХЖ1
  //	optional TransferInfo TransferInfo = 17;            // Сведения о передаче (сдаче) // СвПер
  //	required string DocumentCreator = 18;               // Составитель файла обмена счета-фактуры (информации продавца) // НаимЭконСубСост
  //	optional string DocumentCreatorBase = 19;           // Основание, по которому экономический субъект является составителем файла обмена счета-фактуры //ОснДоверОргСост
  //	optional string GovernmentContractInfo = 20;        // ИдГосКон
  //}
  TUniversalTransferDocumentSellerTitleInfo = class(TSerializationObject) //message UniversalTransferDocumentSellerTitleInfo
  private
    FAdditionalInfoId: TAdditionalInfoId;
    FBuyer: TExtendedOrganizationInfo;
    FConsignee: TExtendedOrganizationInfo;
    FCurrency: string;
    FCurrencyRate: string;
    FDocumentCreator: string;
    FDocumentCreatorBase: string;
    FDocumentDate: string;
    FDocumentName: string;
    FDocumentNumber: string;
    FFunctionType: TFunctionType;
    FGovernmentContractInfo: string;
    FInvoiceTable: TInvoiceTable;
    FPaymentDocuments: TPaymentDocumentInfos;
    FRevisionDate: string;
    FRevisionNumber: string;
    FSeller: TExtendedOrganizationInfo;
    FShipper: TShipper;
    FSigners: TExtendedSigners;
    FTransferInfo: TTransferInfo;
    procedure SetCurrency(AValue: string);
    procedure SetCurrencyRate(AValue: string);
    procedure SetDocumentCreator(AValue: string);
    procedure SetDocumentCreatorBase(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentName(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFunctionType(AValue: TFunctionType);
    procedure SetGovernmentContractInfo(AValue: string);
    procedure SetRevisionDate(AValue: string);
    procedure SetRevisionNumber(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FunctionType:TFunctionType read FFunctionType write SetFunctionType; //1;
    property DocumentName:string read FDocumentName write SetDocumentName;//2;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//3;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber; //4;
    property Seller:TExtendedOrganizationInfo read FSeller; //5;
    property Buyer:TExtendedOrganizationInfo read FBuyer; //6;
    property Shipper:TShipper read FShipper; //7;
    property Consignee:TExtendedOrganizationInfo read FConsignee; //8;
    property Signers:TExtendedSigners read FSigners; // = 9;
    property PaymentDocuments:TPaymentDocumentInfos read FPaymentDocuments;//10;
    property InvoiceTable:TInvoiceTable read FInvoiceTable; //11
    property Currency:string read FCurrency write SetCurrency;//12;
    property CurrencyRate:string read FCurrencyRate write SetCurrencyRate; //13;
    property RevisionDate:string read FRevisionDate write SetRevisionDate; //14;
    property RevisionNumber:string read FRevisionNumber write SetRevisionNumber; //15;
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId; //16
    property TransferInfo:TTransferInfo read FTransferInfo; //17;
    property DocumentCreator:string read FDocumentCreator write SetDocumentCreator;//18;
    property DocumentCreatorBase:string read FDocumentCreatorBase write SetDocumentCreatorBase;//19;
    property GovernmentContractInfo:string read FGovernmentContractInfo write SetGovernmentContractInfo;//20
  end;

function ItemMarkToStr(AItemMark:TItemMark):string;
function FunctionTypeToStr(AFunctionType:TFunctionType):string;
implementation
uses diadoc_consts;

function ItemMarkToStr(AItemMark:TItemMark):string;
begin
  case AItemMark of
    NotSpecified    : Result:=sItemMarkNotSpecified;
    Prop            : Result:=sItemMarkProp;
    Job             : Result:=sItemMarkJob;
    Service         : Result:=sItemMarkService;
    PropertyRights  : Result:=sItemMarkPropertyRights;
  else
    //Other = 5           // иное
    Result:=sItemMarkOther;
  end;
end;

function FunctionTypeToStr(AFunctionType:TFunctionType):string;
begin
  case AFunctionType of
    Invoice          : Result:=sFunctionTypeInvoice;
    Basic            : Result:=sFunctionTypeBasic;
    InvoiceAndBasic  : Result:=sFunctionTypeInvoiceAndBasic;
  end;
end;

{ TShipper }

procedure TShipper.SetSameAsSeller(AValue: Boolean);
begin
  FSameAsSeller:=AValue;
  Modified(1);
end;

procedure TShipper.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SameAsSeller', 1);
  RegisterProp('OrgInfo', 2);
end;

procedure TShipper.InternalInit;
begin
  inherited InternalInit;
  FOrgInfo:=TExtendedOrganizationInfo.Create;
end;

destructor TShipper.Destroy;
begin
  FreeAndNil(FOrgInfo);
  inherited Destroy;
end;

{ TInvoiceTable }

procedure TInvoiceTable.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(4);
end;

procedure TInvoiceTable.SetTotalNet(AValue: string);
begin
  if FTotalNet=AValue then Exit;
  FTotalNet:=AValue;
  Modified(5);
end;

procedure TInvoiceTable.SetTotalWithVatExcluded(AValue: string);
begin
  if FTotalWithVatExcluded=AValue then Exit;
  FTotalWithVatExcluded:=AValue;
  Modified(2);
end;

procedure TInvoiceTable.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(3);
end;

procedure TInvoiceTable.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Items', 1);
  RegisterProp('TotalWithVatExcluded', 2);
  RegisterProp('Vat', 3, true);
  RegisterProp('Total', 4, true);
  RegisterProp('TotalNet', 5);
end;

procedure TInvoiceTable.InternalInit;
begin
  inherited InternalInit;
  FItems:=TExtendedInvoiceItems.Create;
end;

destructor TInvoiceTable.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

{ TExtendedInvoiceItem }

procedure TExtendedInvoiceItem.SetAdditionalProperty(AValue: string);
begin
  if FAdditionalProperty=AValue then Exit;
  FAdditionalProperty:=AValue;
  Modified(13);
end;

procedure TExtendedInvoiceItem.SetExcise(AValue: string);
begin
  if FExcise=AValue then Exit;
  FExcise:=AValue;
  Modified(6);
end;

procedure TExtendedInvoiceItem.SetItemAccountCredit(AValue: string);
begin
  if FItemAccountCredit=AValue then Exit;
  FItemAccountCredit:=AValue;
  Modified(17);
end;

procedure TExtendedInvoiceItem.SetItemAccountDebit(AValue: string);
begin
  if FItemAccountDebit=AValue then Exit;
  FItemAccountDebit:=AValue;
  Modified(16);
end;

procedure TExtendedInvoiceItem.SetItemMark(AValue: TItemMark);
begin
  if FItemMark=AValue then Exit;
  FItemMark:=AValue;
  Modified(12);
end;

procedure TExtendedInvoiceItem.SetItemToRelease(AValue: string);
begin
  if FItemToRelease=AValue then Exit;
  FItemToRelease:=AValue;
  Modified(15);
end;

procedure TExtendedInvoiceItem.SetItemVendorCode(AValue: string);
begin
  if FItemVendorCode=AValue then Exit;
  FItemVendorCode:=AValue;
  Modified(14);
end;

procedure TExtendedInvoiceItem.SetPrice(AValue: string);
begin
  if FPrice=AValue then Exit;
  FPrice:=AValue;
  Modified(5);
end;

procedure TExtendedInvoiceItem.SetProduct(AValue: string);
begin
  if FProduct=AValue then Exit;
  FProduct:=AValue;
  Modified(1);
end;

procedure TExtendedInvoiceItem.SetQuantity(AValue: string);
begin
  if FQuantity=AValue then Exit;
  FQuantity:=AValue;
  Modified(4);
end;

procedure TExtendedInvoiceItem.SetSubtotal(AValue: string);
begin
  if FSubtotal=AValue then Exit;
  FSubtotal:=AValue;
  Modified(10);
end;

procedure TExtendedInvoiceItem.SetSubtotalWithVatExcluded(AValue: string);
begin
  if FSubtotalWithVatExcluded=AValue then Exit;
  FSubtotalWithVatExcluded:=AValue;
  Modified(8);
end;

procedure TExtendedInvoiceItem.SetTaxRate(AValue: TTaxRate);
begin
  if FTaxRate=AValue then Exit;
  FTaxRate:=AValue;
  Modified(7);
end;

procedure TExtendedInvoiceItem.SetUnitName(AValue: string);
begin
  if FUnitName=AValue then Exit;
  FUnitName:=AValue;
  Modified(3);
end;

procedure TExtendedInvoiceItem.SetUnt(AValue: string);
begin
  if FUnt=AValue then Exit;
  FUnt:=AValue;
  Modified(2);
end;

procedure TExtendedInvoiceItem.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(9);
end;

procedure TExtendedInvoiceItem.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Product', 1, true);
  RegisterProp('Unt', 2);
  RegisterProp('UnitName', 3);
  RegisterProp('Quantity', 4);
  RegisterProp('Price', 5);
  RegisterProp('Excise', 6);
  RegisterProp('TaxRate', 7, true);
  RegisterProp('SubtotalWithVatExcluded', 8);
  RegisterProp('Vat', 9);
  RegisterProp('Subtotal', 10, true);
  RegisterProp('CustomsDeclarations', 11);
  RegisterProp('ItemMark', 12);
  RegisterProp('AdditionalProperty', 13);
  RegisterProp('ItemVendorCode', 14);
  RegisterProp('ItemToRelease', 15);
  RegisterProp('ItemAccountDebit', 16);
  RegisterProp('ItemAccountCredit', 17);
  RegisterProp('AdditionalInfo', 18);
end;
procedure TExtendedInvoiceItem.InternalInit;
begin
  inherited InternalInit;
  FCustomsDeclarations:=TCustomsDeclarations.Create;
  FAdditionalInfo:=TAdditionalInfos.Create;
end;

destructor TExtendedInvoiceItem.Destroy;
begin
  FreeAndNil(FCustomsDeclarations);
  FreeAndNil(FAdditionalInfo);
  inherited Destroy;
end;

{ TTransferInfo }

procedure TTransferInfo.SetCreatedThingInfo(AValue: string);
begin
  if FCreatedThingInfo=AValue then Exit;
  FCreatedThingInfo:=AValue;
  Modified(11);
end;

procedure TTransferInfo.SetCreatedThingTransferDate(AValue: string);
begin
  if FCreatedThingTransferDate=AValue then Exit;
  FCreatedThingTransferDate:=AValue;
  Modified(10);
end;

procedure TTransferInfo.SetOperationInfo(AValue: string);
begin
  if FOperationInfo=AValue then Exit;
  FOperationInfo:=AValue;
  Modified(1);
end;

procedure TTransferInfo.SetOperationType(AValue: string);
begin
  if FOperationType=AValue then Exit;
  FOperationType:=AValue;
  Modified(2);
end;

procedure TTransferInfo.SetTransferDate(AValue: string);
begin
  if FTransferDate=AValue then Exit;
  FTransferDate:=AValue;
  Modified(3);
end;

procedure TTransferInfo.SetTransferTextInfo(AValue: string);
begin
  if FTransferTextInfo=AValue then Exit;
  FTransferTextInfo:=AValue;
  Modified(5);
end;

procedure TTransferInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('OperationInfo', 1, true);
  RegisterProp('OperationType', 2);
  RegisterProp('TransferDate', 3);
  RegisterProp('TransferBase', 4);
  RegisterProp('TransferTextInfo', 5);
  RegisterProp('Waybill', 6);
  RegisterProp('Carrier', 7);
  RegisterProp('Employee', 8);
  RegisterProp('OtherIssuer', 9);
  RegisterProp('CreatedThingTransferDate', 10);
  RegisterProp('CreatedThingInfo', 11);
  RegisterProp('AdditionalInfoId', 12);
end;

procedure TTransferInfo.InternalInit;
begin
  inherited InternalInit;
  FTransferBase:=TTransferBases.Create;
  FWaybill:=TWaybills.Create;
  FCarrier:=TExtendedOrganizationInfo.Create;
  FEmployee:=TEmployee.Create;
  FOtherIssuer:=TOtherIssuer.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
end;

destructor TTransferInfo.Destroy;
begin
  FreeAndNil(FTransferBase);
  FreeAndNil(FWaybill);
  FreeAndNil(FCarrier);
  FreeAndNil(FEmployee);
  FreeAndNil(FOtherIssuer);
  FreeAndNil(FAdditionalInfoId);
  inherited Destroy;
end;

{ TTransferBase }

procedure TTransferBase.SetBaseDocumentDate(AValue: string);
begin
  if FBaseDocumentDate=AValue then Exit;
  FBaseDocumentDate:=AValue;
  Modified(3);
end;

procedure TTransferBase.SetBaseDocumentInfo(AValue: string);
begin
  if FBaseDocumentInfo=AValue then Exit;
  FBaseDocumentInfo:=AValue;
  Modified(4);
end;

procedure TTransferBase.SetBaseDocumentName(AValue: string);
begin
  if FBaseDocumentName=AValue then Exit;
  FBaseDocumentName:=AValue;
  Modified(1);
end;

procedure TTransferBase.SetBaseDocumentNumber(AValue: string);
begin
  if FBaseDocumentNumber=AValue then Exit;
  FBaseDocumentNumber:=AValue;
  Modified(2);
end;

procedure TTransferBase.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BaseDocumentName', 1, true);
  RegisterProp('BaseDocumentNumber', 2);
  RegisterProp('BaseDocumentDate', 3);
  RegisterProp('BaseDocumentInfo', 4);
end;

procedure TTransferBase.InternalInit;
begin
  inherited InternalInit;
end;

destructor TTransferBase.Destroy;
begin
  inherited Destroy;
end;

{ TWaybill }

procedure TWaybill.SetTransferDocumentDate(AValue: string);
begin
  if FTransferDocumentDate=AValue then Exit;
  FTransferDocumentDate:=AValue;
  Modified(2);
end;

procedure TWaybill.SetTransferDocumentNumber(AValue: string);
begin
  if FTransferDocumentNumber=AValue then Exit;
  FTransferDocumentNumber:=AValue;
  Modified(1);
end;

procedure TWaybill.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TransferDocumentNumber', 1, true);
  RegisterProp('TransferDocumentDate', 2, true);
end;

procedure TWaybill.InternalInit;
begin
  inherited InternalInit;
end;

destructor TWaybill.Destroy;
begin
  inherited Destroy;
end;

{ TOtherIssuer }

procedure TOtherIssuer.SetTransferEmployeeBase(AValue: string);
begin
  if FTransferEmployeeBase=AValue then Exit;
  FTransferEmployeeBase:=AValue;
  Modified(5);
end;

procedure TOtherIssuer.SetTransferEmployeeInfo(AValue: string);
begin
  if FTransferEmployeeInfo=AValue then Exit;
  FTransferEmployeeInfo:=AValue;
  Modified(2);
end;

procedure TOtherIssuer.SetTransferEmployeePosition(AValue: string);
begin
  if FTransferEmployeePosition=AValue then Exit;
  FTransferEmployeePosition:=AValue;
  Modified(1);
end;

procedure TOtherIssuer.SetTransferFirstName(AValue: string);
begin
  if FTransferFirstName=AValue then Exit;
  FTransferFirstName:=AValue;
  Modified(7);
end;

procedure TOtherIssuer.SetTransferOrganizationBase(AValue: string);
begin
  if FTransferOrganizationBase=AValue then Exit;
  FTransferOrganizationBase:=AValue;
  Modified(4);
end;

procedure TOtherIssuer.SetTransferOrganizationName(AValue: string);
begin
  if FTransferOrganizationName=AValue then Exit;
  FTransferOrganizationName:=AValue;
  Modified(3);
end;

procedure TOtherIssuer.SetTransferPatronymic(AValue: string);
begin
  if FTransferPatronymic=AValue then Exit;
  FTransferPatronymic:=AValue;
  Modified(8);
end;

procedure TOtherIssuer.SetTransferSurname(AValue: string);
begin
  if FTransferSurname=AValue then Exit;
  FTransferSurname:=AValue;
  Modified(6);
end;

procedure TOtherIssuer.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TransferEmployeePosition', 1);
  RegisterProp('TransferEmployeeInfo', 2);
  RegisterProp('TransferOrganizationName', 3);
  RegisterProp('TransferOrganizationBase', 4);
  RegisterProp('TransferEmployeeBase', 5);
  RegisterProp('TransferSurname', 6, true);
  RegisterProp('TransferFirstName', 7, true);
  RegisterProp('TransferPatronymic', 8);
end;

procedure TOtherIssuer.InternalInit;
begin
  inherited InternalInit;
end;

destructor TOtherIssuer.Destroy;
begin
  inherited Destroy;
end;

{ TEmployee }

procedure TEmployee.SetEmployeeBase(AValue: string);
begin
  if FEmployeeBase=AValue then Exit;
  FEmployeeBase:=AValue;
  Modified(3);
end;

procedure TEmployee.SetEmployeeInfo(AValue: string);
begin
  if FEmployeeInfo=AValue then Exit;
  FEmployeeInfo:=AValue;
  Modified(2);
end;

procedure TEmployee.SetEmployeePosition(AValue: string);
begin
  if FEmployeePosition=AValue then Exit;
  FEmployeePosition:=AValue;
  Modified(1);
end;

procedure TEmployee.SetTransferFirstName(AValue: string);
begin
  if FTransferFirstName=AValue then Exit;
  FTransferFirstName:=AValue;
  Modified(5);
end;

procedure TEmployee.SetTransferPatronymic(AValue: string);
begin
  if FTransferPatronymic=AValue then Exit;
  FTransferPatronymic:=AValue;
  Modified(6);
end;

procedure TEmployee.SetTransferSurname(AValue: string);
begin
  if FTransferSurname=AValue then Exit;
  FTransferSurname:=AValue;
  Modified(4);
end;

procedure TEmployee.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('EmployeePosition', 1, true);
  RegisterProp('EmployeeInfo', 2);
  RegisterProp('EmployeeBase', 3);
  RegisterProp('TransferSurname', 4, true);
  RegisterProp('TransferFirstName', 5, true);
  RegisterProp('TransferPatronymic', 6);
end;

procedure TEmployee.InternalInit;
begin
  inherited InternalInit;
end;

destructor TEmployee.Destroy;
begin
  inherited Destroy;
end;

{ TUniversalTransferDocumentBuyerTitleInfo }

procedure TUniversalTransferDocumentBuyerTitleInfo.SetAcceptanceDate(
  AValue: string);
begin
  if FAcceptanceDate=AValue then Exit;
  FAcceptanceDate:=AValue;
  Modified(5);
end;

procedure TUniversalTransferDocumentBuyerTitleInfo.SetDocumentCreator(
  AValue: string);
begin
  if FDocumentCreator=AValue then Exit;
  FDocumentCreator:=AValue;
  Modified(1);
end;

procedure TUniversalTransferDocumentBuyerTitleInfo.SetDocumentCreatorBase(
  AValue: string);
begin
  if FDocumentCreatorBase=AValue then Exit;
  FDocumentCreatorBase:=AValue;
  Modified(2);
end;

procedure TUniversalTransferDocumentBuyerTitleInfo.SetOperationCode(
  AValue: string);
begin
  if FOperationCode=AValue then Exit;
  FOperationCode:=AValue;
  Modified(3);
end;

procedure TUniversalTransferDocumentBuyerTitleInfo.SetOperationContent(
  AValue: string);
begin
  if FOperationContent=AValue then Exit;
  FOperationContent:=AValue;
  Modified(4);
end;

procedure TUniversalTransferDocumentBuyerTitleInfo.InternalRegisterProperty;
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

procedure TUniversalTransferDocumentBuyerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FEmployee:=TEmployee.Create;
  FOtherIssuer:=TOtherIssuer.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FSigners:=TExtendedSigners.Create;
end;

destructor TUniversalTransferDocumentBuyerTitleInfo.Destroy;
begin
  FreeAndNil(FEmployee);
  FreeAndNil(FOtherIssuer);
  FreeAndNil(FAdditionalInfoId);
  FreeAndNil(FSigners);
  inherited Destroy;
end;

{ TAdditionalInfoId }

procedure TAdditionalInfoId.SetInfoFileId(AValue: string);
begin
  if FInfoFileId=AValue then Exit;
  FInfoFileId:=AValue;
  Modified(1);
end;

procedure TAdditionalInfoId.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InfoFileId', 1);
  RegisterProp('AdditionalInfo', 2);
end;

procedure TAdditionalInfoId.InternalInit;
begin
  inherited InternalInit;
  FAdditionalInfo:=TAdditionalInfos.Create;
end;

destructor TAdditionalInfoId.Destroy;
begin
  FAdditionalInfo.Free;
  inherited Destroy;
end;

{ TUniversalCorrectionDocumentSellerTitleInfo }

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetCorrectionRevisionDate(
  AValue: string);
begin
  if FCorrectionRevisionDate=AValue then Exit;
  FCorrectionRevisionDate:=AValue;
  Modified(13);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetCorrectionRevisionNumber
  (AValue: string);
begin
  if FCorrectionRevisionNumber=AValue then Exit;
  FCorrectionRevisionNumber:=AValue;
  Modified(14);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetCurrency(AValue: string
  );
begin
  if FCurrency=AValue then Exit;
  FCurrency:=AValue;
  Modified(11);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetCurrencyRate(
  AValue: string);
begin
  if FCurrencyRate=AValue then Exit;
  FCurrencyRate:=AValue;
  Modified(12);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetDocumentCreator(
  AValue: string);
begin
  if FDocumentCreator=AValue then Exit;
  FDocumentCreator:=AValue;
  Modified(16);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetDocumentCreatorBase(
  AValue: string);
begin
  if FDocumentCreatorBase=AValue then Exit;
  FDocumentCreatorBase:=AValue;
  Modified(17);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetDocumentDate(
  AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(3);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetDocumentName(
  AValue: string);
begin
  if FDocumentName=AValue then Exit;
  FDocumentName:=AValue;
  Modified(2);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetDocumentNumber(
  AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(4);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetFunctionType(
  AValue: TFunctionType);
begin
  FFunctionType:=AValue;
  Modified(1);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.SetGovernmentContractInfo(
  AValue: string);
begin
  if FGovernmentContractInfo=AValue then Exit;
  FGovernmentContractInfo:=AValue;
  Modified(18);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FunctionType', 1, true);
  RegisterProp('DocumentName', 2);
  RegisterProp('DocumentDate', 3, true);
  RegisterProp('DocumentNumber', 4, true);
  RegisterProp('Invoices', 5);
  RegisterProp('Seller', 6, true);
  RegisterProp('Buyer', 7, true);
  RegisterProp('Signers', 8);
  RegisterProp('EventContent', 9, true);
  RegisterProp('InvoiceCorrectionTable', 10, true);
  RegisterProp('Currency', 11, true);
  RegisterProp('CurrencyRate', 12);
  RegisterProp('CorrectionRevisionDate', 13);
  RegisterProp('CorrectionRevisionNumber', 14);
  RegisterProp('AdditionalInfoId', 15);
  RegisterProp('DocumentCreator', 16, true);
  RegisterProp('DocumentCreatorBase', 17);
  RegisterProp('GovernmentContractInfo', 18);
end;

procedure TUniversalCorrectionDocumentSellerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FInvoices:=TInvoiceForCorrectionInfos.Create;
  FSeller:=TExtendedOrganizationInfo.Create;
  FBuyer:=TExtendedOrganizationInfo.Create;
  FSigners:=TExtendedSigners.Create;
  FEventContent:=TEventContent.Create;
  FInvoiceCorrectionTable:=TInvoiceCorrectionTable.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
end;

destructor TUniversalCorrectionDocumentSellerTitleInfo.Destroy;
begin
  FreeAndNil(FInvoices);
  FreeAndNil(FSeller);
  FreeAndNil(FBuyer);
  FreeAndNil(FSigners);
  FreeAndNil(FEventContent);
  FreeAndNil(FInvoiceCorrectionTable);
  FreeAndNil(FAdditionalInfoId);
  inherited Destroy;
end;

{ TInvoiceForCorrectionInfo }

procedure TInvoiceForCorrectionInfo.SetInvoiceDate(AValue: string);
begin
  if FInvoiceDate=AValue then Exit;
  FInvoiceDate:=AValue;
  Modified(1);
end;

procedure TInvoiceForCorrectionInfo.SetInvoiceNumber(AValue: string);
begin
  if FInvoiceNumber=AValue then Exit;
  FInvoiceNumber:=AValue;
  Modified(2);
end;

procedure TInvoiceForCorrectionInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InvoiceDate', 1, true);
  RegisterProp('InvoiceNumber', 2, true);
  RegisterProp('InvoiceRevisions', 3);
end;

procedure TInvoiceForCorrectionInfo.InternalInit;
begin
  inherited InternalInit;
  FInvoiceRevisions:=TInvoiceRevisionInfos.Create;
end;

destructor TInvoiceForCorrectionInfo.Destroy;
begin
  FreeAndNil(FInvoiceRevisions);
  inherited Destroy;
end;

{ TInvoiceRevisionInfo }

procedure TInvoiceRevisionInfo.SetInvoiceRevisionDate(AValue: string);
begin
  if FInvoiceRevisionDate=AValue then Exit;
  FInvoiceRevisionDate:=AValue;
  Modified(1);
end;

procedure TInvoiceRevisionInfo.SetInvoiceRevisionNumber(AValue: string);
begin
  if FInvoiceRevisionNumber=AValue then Exit;
  FInvoiceRevisionNumber:=AValue;
  Modified(2);
end;

procedure TInvoiceRevisionInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InvoiceRevisionDate', 1, true);
  RegisterProp('InvoiceRevisionNumber', 2, true);
end;

procedure TInvoiceRevisionInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TInvoiceRevisionInfo.Destroy;
begin
  inherited Destroy;
end;

{ TEventContent }

procedure TEventContent.SetCostChangeInfo(AValue: string);
begin
  if FCostChangeInfo=AValue then Exit;
  FCostChangeInfo:=AValue;
  Modified(1);
end;

procedure TEventContent.SetNotificationDate(AValue: string);
begin
  if FNotificationDate=AValue then Exit;
  FNotificationDate:=AValue;
  Modified(4);
end;

procedure TEventContent.SetOperationContent(AValue: string);
begin
  if FOperationContent=AValue then Exit;
  FOperationContent:=AValue;
  Modified(3);
end;

procedure TEventContent.SetTransferDocDetails(AValue: string);
begin
  if FTransferDocDetails=AValue then Exit;
  FTransferDocDetails:=AValue;
  Modified(2);
end;

procedure TEventContent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('CostChangeInfo', 1);
  RegisterProp('TransferDocDetails', 2, true);
  RegisterProp('OperationContent', 3, true);
  RegisterProp('NotificationDate', 4);
  RegisterProp('CorrectionBase', 5);
end;

procedure TEventContent.InternalInit;
begin
  inherited InternalInit;
  FCorrectionBase:=TCorrectionBases.Create;
end;

destructor TEventContent.Destroy;
begin
  FreeAndNil(FCorrectionBase);
  inherited Destroy;
end;

{ TCorrectionBase }

procedure TCorrectionBase.SetAdditionalInfo(AValue: string);
begin
  if FAdditionalInfo=AValue then Exit;
  FAdditionalInfo:=AValue;
  Modified(4);
end;

procedure TCorrectionBase.SetBaseDocumentDate(AValue: string);
begin
  if FBaseDocumentDate=AValue then Exit;
  FBaseDocumentDate:=AValue;
  Modified(3);
end;

procedure TCorrectionBase.SetBaseDocumentName(AValue: string);
begin
  if FBaseDocumentName=AValue then Exit;
  FBaseDocumentName:=AValue;
  Modified(1);
end;

procedure TCorrectionBase.SetBaseDocumentNumber(AValue: string);
begin
  if FBaseDocumentNumber=AValue then Exit;
  FBaseDocumentNumber:=AValue;
  Modified(2);
end;

procedure TCorrectionBase.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BaseDocumentName', 1, true);
  RegisterProp('BaseDocumentNumber', 2);
  RegisterProp('BaseDocumentDate', 3);
  RegisterProp('AdditionalInfo', 4);
end;

procedure TCorrectionBase.InternalInit;
begin
  inherited InternalInit;
end;

destructor TCorrectionBase.Destroy;
begin
  inherited Destroy;
end;

{ TInvoiceCorrectionTable }

procedure TInvoiceCorrectionTable.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Items', 1);
  RegisterProp('TotalsInc', 2);
  RegisterProp('TotalsDec', 3);
end;

procedure TInvoiceCorrectionTable.InternalInit;
begin
  inherited InternalInit;
  FItems:=TExtendedInvoiceCorrectionItems.Create;
  FTotalsInc:=TInvoiceTotalsDiff.Create;
  FTotalsDec:=TInvoiceTotalsDiff.Create;
end;

destructor TInvoiceCorrectionTable.Destroy;
begin
  FreeAndNil(FItems);
  FreeAndNil(FTotalsInc);
  FreeAndNil(FTotalsDec);
  inherited Destroy;
end;

{ TUniversalTransferDocumentSellerTitleInfo }

procedure TUniversalTransferDocumentSellerTitleInfo.SetCurrency(AValue: string);
begin
  if FCurrency=AValue then Exit;
  FCurrency:=AValue;
  Modified(12);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.SetCurrencyRate(
  AValue: string);
begin
  if FCurrencyRate=AValue then Exit;
  FCurrencyRate:=AValue;
  Modified(13);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.SetDocumentCreator(
  AValue: string);
begin
  if FDocumentCreator=AValue then Exit;
  FDocumentCreator:=AValue;
  Modified(18);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.SetDocumentCreatorBase(
  AValue: string);
begin
  if FDocumentCreatorBase=AValue then Exit;
  FDocumentCreatorBase:=AValue;
  Modified(19);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.SetDocumentDate(
  AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(3);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.SetDocumentName(
  AValue: string);
begin
  if FDocumentName=AValue then Exit;
  FDocumentName:=AValue;
  Modified(2);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.SetDocumentNumber(
  AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(4);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.SetFunctionType(
  AValue: TFunctionType);
begin
  FFunctionType:=AValue;
  Modified(1);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.SetGovernmentContractInfo(
  AValue: string);
begin
  if FGovernmentContractInfo=AValue then Exit;
  FGovernmentContractInfo:=AValue;
  Modified(20);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.SetRevisionDate(
  AValue: string);
begin
  if FRevisionDate=AValue then Exit;
  FRevisionDate:=AValue;
  Modified(14);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.SetRevisionNumber(
  AValue: string);
begin
  if FRevisionNumber=AValue then Exit;
  FRevisionNumber:=AValue;
  Modified(15);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FunctionType', 1, true);
  RegisterProp('DocumentName', 2);
  RegisterProp('DocumentDate', 3, true);
  RegisterProp('DocumentNumber', 4, true);
  RegisterProp('Seller', 5, true);
  RegisterProp('Buyer', 6, true);
  RegisterProp('Shipper', 7);
  RegisterProp('Consignee', 8);
  RegisterProp('Signers', 9);
  RegisterProp('PaymentDocuments', 10);
  RegisterProp('InvoiceTable', 11);
  RegisterProp('Currency', 12, true);
  RegisterProp('CurrencyRate', 13);
  RegisterProp('RevisionDate', 14);
  RegisterProp('RevisionNumber', 15);
  RegisterProp('AdditionalInfoId', 16);
  RegisterProp('TransferInfo', 17);
  RegisterProp('DocumentCreator', 18, true);
  RegisterProp('DocumentCreatorBase', 19);
  RegisterProp('GovernmentContractInfo', 20);
end;

procedure TUniversalTransferDocumentSellerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FSeller:=TExtendedOrganizationInfo.Create;
  FBuyer:=TExtendedOrganizationInfo.Create;
  FShipper:=TShipper.Create;
  FConsignee:=TExtendedOrganizationInfo.Create;
  FSigners:=TExtendedSigners.Create;
  FPaymentDocuments:=TPaymentDocumentInfos.Create;
  FInvoiceTable:=TInvoiceTable.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FTransferInfo:=TTransferInfo.Create;
end;

destructor TUniversalTransferDocumentSellerTitleInfo.Destroy;
begin
  FreeAndNil(FSeller);
  FreeAndNil(FBuyer);
  FreeAndNil(FShipper);
  FreeAndNil(FConsignee);
  FreeAndNil(FSigners);
  FreeAndNil(FPaymentDocuments);
  FreeAndNil(FInvoiceTable);
  FreeAndNil(FAdditionalInfoId);
  FreeAndNil(FTransferInfo);
  inherited Destroy;
end;

{ TExtendedInvoiceCorrectionItem }

procedure TExtendedInvoiceCorrectionItem.SetItemAccountCredit(AValue: string);
begin
  if FItemAccountCredit=AValue then Exit;
  FItemAccountCredit:=AValue;
  Modified(7);
end;

procedure TExtendedInvoiceCorrectionItem.SetItemAccountDebit(AValue: string);
begin
  if FItemAccountDebit=AValue then Exit;
  FItemAccountDebit:=AValue;
  Modified(6);
end;

procedure TExtendedInvoiceCorrectionItem.SetProduct(AValue: string);
begin
  if FProduct=AValue then Exit;
  FProduct:=AValue;
  Modified(1);
end;

procedure TExtendedInvoiceCorrectionItem.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Product', 1, true);
  RegisterProp('OriginalValues', 2, true);
  RegisterProp('CorrectedValues', 3, true);
  RegisterProp('AmountsInc', 4);
  RegisterProp('AmountsDec', 5);
  RegisterProp('ItemAccountDebit', 6);
  RegisterProp('ItemAccountCredit', 7);
  RegisterProp('AdditionalInfo', 8);
end;

procedure TExtendedInvoiceCorrectionItem.InternalInit;
begin
  inherited InternalInit;
  FOriginalValues:=TCorrectableInvoiceItemFields.Create;
  FCorrectedValues:=TCorrectableInvoiceItemFields.Create;
  FAmountsInc:=TInvoiceItemAmountsDiff.Create;
  FAmountsDec:=TInvoiceItemAmountsDiff.Create;
  FAdditionalInfo:=TAdditionalInfos.Create;
end;

destructor TExtendedInvoiceCorrectionItem.Destroy;
begin
  FreeAndNil(FOriginalValues);
  FreeAndNil(FCorrectedValues);
  FreeAndNil(FAmountsInc);
  FreeAndNil(FAmountsDec);
  FreeAndNil(FAdditionalInfo);
  inherited Destroy;
end;

end.

