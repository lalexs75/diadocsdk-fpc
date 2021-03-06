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
{ Структуры данных базируются на информации http://api-docs.diadoc.ru/ru/latest/DataStructures.html }

unit XmlTorg12_DEFAULT_utd_05_01_02_ind0;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject, AbstractSerializationObjects;

type
  Tstring8 = String;
  Tstring10 = String;
  Tstring14f = String;
  Tstring20 = String;
  Tstring20f = String;
  Tstring24 = String;
  Tstring27f = String;
  Tstring29 = String;
  Tstring30 = String;
  Tstring36 = String;
  Tstring50 = String;
  Tstring60 = String;
  Tstring100 = String;
  Tstring100z = String;
  Tstring120 = String;
  Tstring128 = String;
  Tstring128z = String;
  Tstring255 = String;
  Tstring256 = String;
  Tstring1000 = String;
  Tstring1000z = String;
  Tstring2000 = String;
  Tstring2000z = String;
  Tinn = String;
  Tguid = String;
  //Код из Общероссийского классификатора единиц измерения
  Tokei = String;
  //Код из Общероссийского классификатора валют
  Tokv = String;
  //Дата в формате ДД.ММ.ГГГГ (01.01.1800 - 31.12.2099)
  Tdate1 = String;
  TTaxRate = String;
  TTaxRateWithTaxedByAgent = String;
  TTaxRateWithTwentyPercentAndTaxedByAgent = String;
  TTaxRateWithTwentyPercent = String;
  //1 - Сведения о юридическом лице, состоящем на учете в налоговых органах // СвЮЛУч
  //2 - Сведения об индивидуальном предпринимателе// СвИП
  //3 - Сведения об иностранном лице, не состоящем на учете в налоговых органах // СвЮлНеУч, СвИнНеУч
  //4 - Сведения о физическом лице // СвФл
  TOrganizationType = String;
type

  {  Forward declarations  }
  TUniversalTransferDocument = class;
  TUniversalTransferDocument_Shipper = class;
  TUniversalTransferDocument_Signers = class;
  TUniversalTransferDocument_PaymentDocuments = class;
  TInvoiceTable = class;
  TInvoiceTable_Item = class;
  TInvoiceTable_Item_CustomsDeclarations = class;
  TInvoiceTable_Item_AdditionalInfos = class;
  TTransferInfo = class;
  TTransferInfo_TransferBases = class;
  TAdditionalInfoId = class;
  TAdditionalInfo = class;
  TCustomsDeclaration = class;
  TCustomsDeclarationWithHyphens = class;
  TInvoiceTotalsDiff = class;
  TInvoiceItemAmountsDiff = class;
  TCorrectableInvoiceItemFields_WithoutTaxRate = class;
  TCorrectableInvoiceItemFields = class;
  TCorrectableInvoiceItemFields_WithTwentyPercent = class;
  TCorrectableInvoiceItemFields_WithTaxedByAgent = class;
  TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent = class;
  TAttorney = class;
  TOfficial = class;
  TAcceptanceCertificateSignatureInfo = class;
  TPaymentDocumentInfo = class;
  TGroundInfo = class;
  TExtendedOrganizationInfo = class;
  TExtendedOrganizationDetails_ManualFilling = class;
  TExtendedOrganizationReference = class;
  TExtendedOrganizationDetails = class;
  TExtendedOrganizationInfoWithHyphens = class;
  TExtendedOrganizationDetailsWithHyphens = class;
  TAddress = class;
  TRussianAddress = class;
  TForeignAddress = class;
  TSignerInfo = class;
  TSignerDetails = class;
  TSignerReferenceInfo = class;
  TSignerReference = class;
  TExtendedSignerDetailsBase = class;
  TExtendedSignerDetails = class;
  TExtendedSignerDetails_SellerTitle = class;
  TExtendedSignerDetails_BuyerTitle = class;
  TExtendedSignerDetails_BuyerTitle820 = class;
  TExtendedSignerDetails_CorrectionSellerTitle = class;
  TExtendedSignerDetails_CorrectionBuyerTitle = class;
  TExtendedSignerDetails_551_552 = class;
  TEmployee = class;
  TOtherIssuer = class;
  TWaybills = class;
  TWaybills_Waybill = class;
  TTransferBase = class;
  TTransferBase820 = class;

  {  Generic classes for collections  }
  TUniversalTransferDocumentList = specialize GXMLSerializationObjectList<TUniversalTransferDocument>;
  TUniversalTransferDocument_ShipperList = specialize GXMLSerializationObjectList<TUniversalTransferDocument_Shipper>;
  TUniversalTransferDocument_SignersList = specialize GXMLSerializationObjectList<TUniversalTransferDocument_Signers>;
  TUniversalTransferDocument_PaymentDocumentsList = specialize GXMLSerializationObjectList<TUniversalTransferDocument_PaymentDocuments>;
  TInvoiceTableList = specialize GXMLSerializationObjectList<TInvoiceTable>;
  TInvoiceTable_ItemList = specialize GXMLSerializationObjectList<TInvoiceTable_Item>;
  TInvoiceTable_Item_CustomsDeclarationsList = specialize GXMLSerializationObjectList<TInvoiceTable_Item_CustomsDeclarations>;
  TInvoiceTable_Item_AdditionalInfosList = specialize GXMLSerializationObjectList<TInvoiceTable_Item_AdditionalInfos>;
  TTransferInfoList = specialize GXMLSerializationObjectList<TTransferInfo>;
  TTransferInfo_TransferBasesList = specialize GXMLSerializationObjectList<TTransferInfo_TransferBases>;
  TAdditionalInfoIdList = specialize GXMLSerializationObjectList<TAdditionalInfoId>;
  TAdditionalInfoList = specialize GXMLSerializationObjectList<TAdditionalInfo>;
  TCustomsDeclarationList = specialize GXMLSerializationObjectList<TCustomsDeclaration>;
  TCustomsDeclarationWithHyphensList = specialize GXMLSerializationObjectList<TCustomsDeclarationWithHyphens>;
  TInvoiceTotalsDiffList = specialize GXMLSerializationObjectList<TInvoiceTotalsDiff>;
  TInvoiceItemAmountsDiffList = specialize GXMLSerializationObjectList<TInvoiceItemAmountsDiff>;
  TCorrectableInvoiceItemFields_WithoutTaxRateList = specialize GXMLSerializationObjectList<TCorrectableInvoiceItemFields_WithoutTaxRate>;
  TCorrectableInvoiceItemFieldsList = specialize GXMLSerializationObjectList<TCorrectableInvoiceItemFields>;
  TCorrectableInvoiceItemFields_WithTwentyPercentList = specialize GXMLSerializationObjectList<TCorrectableInvoiceItemFields_WithTwentyPercent>;
  TCorrectableInvoiceItemFields_WithTaxedByAgentList = specialize GXMLSerializationObjectList<TCorrectableInvoiceItemFields_WithTaxedByAgent>;
  TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgentList = specialize GXMLSerializationObjectList<TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent>;
  TAttorneyList = specialize GXMLSerializationObjectList<TAttorney>;
  TOfficialList = specialize GXMLSerializationObjectList<TOfficial>;
  TAcceptanceCertificateSignatureInfoList = specialize GXMLSerializationObjectList<TAcceptanceCertificateSignatureInfo>;
  TPaymentDocumentInfoList = specialize GXMLSerializationObjectList<TPaymentDocumentInfo>;
  TGroundInfoList = specialize GXMLSerializationObjectList<TGroundInfo>;
  TExtendedOrganizationInfoList = specialize GXMLSerializationObjectList<TExtendedOrganizationInfo>;
  TExtendedOrganizationDetails_ManualFillingList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_ManualFilling>;
  TExtendedOrganizationReferenceList = specialize GXMLSerializationObjectList<TExtendedOrganizationReference>;
  TExtendedOrganizationDetailsList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails>;
  TExtendedOrganizationInfoWithHyphensList = specialize GXMLSerializationObjectList<TExtendedOrganizationInfoWithHyphens>;
  TExtendedOrganizationDetailsWithHyphensList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetailsWithHyphens>;
  TAddressList = specialize GXMLSerializationObjectList<TAddress>;
  TRussianAddressList = specialize GXMLSerializationObjectList<TRussianAddress>;
  TForeignAddressList = specialize GXMLSerializationObjectList<TForeignAddress>;
  TSignerInfoList = specialize GXMLSerializationObjectList<TSignerInfo>;
  TSignerDetailsList = specialize GXMLSerializationObjectList<TSignerDetails>;
  TSignerReferenceInfoList = specialize GXMLSerializationObjectList<TSignerReferenceInfo>;
  TSignerReferenceList = specialize GXMLSerializationObjectList<TSignerReference>;
  TExtendedSignerDetailsBaseList = specialize GXMLSerializationObjectList<TExtendedSignerDetailsBase>;
  TExtendedSignerDetailsList = specialize GXMLSerializationObjectList<TExtendedSignerDetails>;
  TExtendedSignerDetails_SellerTitleList = specialize GXMLSerializationObjectList<TExtendedSignerDetails_SellerTitle>;
  TExtendedSignerDetails_BuyerTitleList = specialize GXMLSerializationObjectList<TExtendedSignerDetails_BuyerTitle>;
  TExtendedSignerDetails_BuyerTitle820List = specialize GXMLSerializationObjectList<TExtendedSignerDetails_BuyerTitle820>;
  TExtendedSignerDetails_CorrectionSellerTitleList = specialize GXMLSerializationObjectList<TExtendedSignerDetails_CorrectionSellerTitle>;
  TExtendedSignerDetails_CorrectionBuyerTitleList = specialize GXMLSerializationObjectList<TExtendedSignerDetails_CorrectionBuyerTitle>;
  TExtendedSignerDetails_551_552List = specialize GXMLSerializationObjectList<TExtendedSignerDetails_551_552>;
  TEmployeeList = specialize GXMLSerializationObjectList<TEmployee>;
  TOtherIssuerList = specialize GXMLSerializationObjectList<TOtherIssuer>;
  TWaybillsList = specialize GXMLSerializationObjectList<TWaybills>;
  TWaybills_WaybillList = specialize GXMLSerializationObjectList<TWaybills_Waybill>;
  TTransferBaseList = specialize GXMLSerializationObjectList<TTransferBase>;
  TTransferBase820List = specialize GXMLSerializationObjectList<TTransferBase820>;

  {  TUniversalTransferDocument  }
  TUniversalTransferDocument = class(TXmlSerializationObject)
  private
    FSeller:TExtendedOrganizationInfo;
    FBuyer:TExtendedOrganizationInfo;
    FShipper:TUniversalTransferDocument_Shipper;
    FConsignee:TExtendedOrganizationInfo;
    FSigners:TUniversalTransferDocument_Signers;
    FPaymentDocuments:TUniversalTransferDocument_PaymentDocuments;
    FAdditionalInfoId:TAdditionalInfoId;
    FTable:TInvoiceTable;
    FTransferInfo:TTransferInfo;
    FFunction1:String;
    FDocumentName:Tstring255;
    FDocumentDate:Tdate1;
    FDocumentNumber:Tstring1000;
    FCurrency:Tokv;
    FCurrencyRate:Double;
    FRevisionDate:Tdate1;
    FRevisionNumber:Longint;
    FDocumentCreator:Tstring1000;
    FDocumentCreatorBase:Tstring120;
    FGovernmentContractInfo:Tstring255;
    procedure SetFunction1( AValue:String);
    procedure SetDocumentName( AValue:Tstring255);
    procedure SetDocumentDate( AValue:Tdate1);
    procedure SetDocumentNumber( AValue:Tstring1000);
    procedure SetCurrency( AValue:Tokv);
    procedure SetCurrencyRate( AValue:Double);
    procedure SetRevisionDate( AValue:Tdate1);
    procedure SetRevisionNumber( AValue:Longint);
    procedure SetDocumentCreator( AValue:Tstring1000);
    procedure SetDocumentCreatorBase( AValue:Tstring120);
    procedure SetGovernmentContractInfo( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
    function RootNodeName:string; override;
  public
    destructor Destroy; override;
  published
    //СвПрод - сведения о продавеце
    property Seller:TExtendedOrganizationInfo read FSeller;
    //СвПокуп - сведения о покупателе
    property Buyer:TExtendedOrganizationInfo read FBuyer;
    property Shipper:TUniversalTransferDocument_Shipper read FShipper;
    //ГрузПолуч - грузополучатель
    property Consignee:TExtendedOrganizationInfo read FConsignee;
    property Signers:TUniversalTransferDocument_Signers read FSigners;
    property PaymentDocuments:TUniversalTransferDocument_PaymentDocuments read FPaymentDocuments;
    //ИнфПолФХЖ1 - Информационное поле документа
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;
    property Table:TInvoiceTable read FTable;
    property TransferInfo:TTransferInfo read FTransferInfo;
    //Функция - Функция документа
    property Function1:String read FFunction1 write SetFunction1;
    //НаимДокОпр - Наименование первичного документа, определенное организацией
    property DocumentName:Tstring255 read FDocumentName write SetDocumentName;
    //ДатаСчФ - дата УПД
    property DocumentDate:Tdate1 read FDocumentDate write SetDocumentDate;
    //НомерСчФ - номер УПД
    property DocumentNumber:Tstring1000 read FDocumentNumber write SetDocumentNumber;
    //КодОКВ - валюта (код)
    property Currency:Tokv read FCurrency write SetCurrency;
    //КурсВал - Курс валюты
    property CurrencyRate:Double read FCurrencyRate write SetCurrencyRate;
    //ДатаИспрСчФ - дата ИСФ (обязательно при формировании UniversalTransferDocumentSellerTitleRevision)
    property RevisionDate:Tdate1 read FRevisionDate write SetRevisionDate;
    //НомИспрСчФ - номер ИСФ (обязательно при формировании UniversalTransferDocumentSellerTitleRevision)
    property RevisionNumber:Longint read FRevisionNumber write SetRevisionNumber;
    //НаимЭконСубСост - Составитель файла обмена счета-фактуры (информации продавца)
    property DocumentCreator:Tstring1000 read FDocumentCreator write SetDocumentCreator;
    //ОснДоверОргСост - Основание, по которому экономический субъект является составителем файла обмена счета-фактуры
    property DocumentCreatorBase:Tstring120 read FDocumentCreatorBase write SetDocumentCreatorBase;
    //ИдГосКон
    property GovernmentContractInfo:Tstring255 read FGovernmentContractInfo write SetGovernmentContractInfo;
  end;

  {  TUniversalTransferDocument_Shipper  }
  TUniversalTransferDocument_Shipper = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TExtendedOrganizationDetails;
    FOrganizationReference:TExtendedOrganizationReference;
    FSameAsSeller:String;
    procedure SetSameAsSeller( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetails read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference read FOrganizationReference;
    //ОнЖе - совпадает с продавцом
    property SameAsSeller:String read FSameAsSeller write SetSameAsSeller;
  end;

  {  TUniversalTransferDocument_Signers  }
  TUniversalTransferDocument_Signers = class(TXmlSerializationObject)
  private
    FSignerReference:TSignerReference;
    FSignerDetails:TExtendedSignerDetails_SellerTitle;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property SignerReference:TSignerReference read FSignerReference;
    property SignerDetails:TExtendedSignerDetails_SellerTitle read FSignerDetails;
  end;

  {  TUniversalTransferDocument_PaymentDocuments  }
  TUniversalTransferDocument_PaymentDocuments = class(TXmlSerializationObject)
  private
    FDocument:TPaymentDocumentInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //СвПРД - платежно-расчетные документы
    property Document:TPaymentDocumentInfoList read FDocument;
  end;

  {  TInvoiceTable  }
  //ТаблСчФакт - Сведения таблицы счет фактуры
  TInvoiceTable = class(TXmlSerializationObject)
  private
    FItem:TInvoiceTable_ItemList;
    FTotalWithVatExcluded:Double;
    FVat:Double;
    FTotal:Double;
    FTotalNet:Double;
    procedure SetTotalWithVatExcluded( AValue:Double);
    procedure SetVat( AValue:Double);
    procedure SetTotal( AValue:Double);
    procedure SetTotalNet( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Item:TInvoiceTable_ItemList read FItem;
    //СтТовБезНДСВсего - Сумма без учета налога
    property TotalWithVatExcluded:Double read FTotalWithVatExcluded write SetTotalWithVatExcluded;
    //СумНалВсего - Сумма налога всего
    property Vat:Double read FVat write SetVat;
    //СтТовУчНалВсего - Сумма всего
    property Total:Double read FTotal write SetTotal;
    //НеттоВс - Нетто всего
    property TotalNet:Double read FTotalNet write SetTotalNet;
  end;

  {  TInvoiceTable_Item  }
  TInvoiceTable_Item = class(TXmlSerializationObject)
  private
    FCustomsDeclarations:TInvoiceTable_Item_CustomsDeclarations;
    FAdditionalInfos:TInvoiceTable_Item_AdditionalInfos;
    FProduct:Tstring1000;
    FUnit1:Tokei;
    FUnitName:Tstring255;
    FQuantity:Double;
    FPrice:Double;
    FExcise:Double;
    FTaxRate:TTaxRate;
    FSubtotalWithVatExcluded:Double;
    FVat:Double;
    FSubtotal:Double;
    FItemMark:Longint;
    FAdditionalProperty:String;
    FItemVendorCode:Tstring255;
    FItemToRelease:Double;
    FItemAccountDebit:String;
    FItemAccountCredit:String;
    procedure SetProduct( AValue:Tstring1000);
    procedure SetUnit1( AValue:Tokei);
    procedure SetUnitName( AValue:Tstring255);
    procedure SetQuantity( AValue:Double);
    procedure SetPrice( AValue:Double);
    procedure SetExcise( AValue:Double);
    procedure SetTaxRate( AValue:TTaxRate);
    procedure SetSubtotalWithVatExcluded( AValue:Double);
    procedure SetVat( AValue:Double);
    procedure SetSubtotal( AValue:Double);
    procedure SetItemMark( AValue:Longint);
    procedure SetAdditionalProperty( AValue:String);
    procedure SetItemVendorCode( AValue:Tstring255);
    procedure SetItemToRelease( AValue:Double);
    procedure SetItemAccountDebit( AValue:String);
    procedure SetItemAccountCredit( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property CustomsDeclarations:TInvoiceTable_Item_CustomsDeclarations read FCustomsDeclarations;
    property AdditionalInfos:TInvoiceTable_Item_AdditionalInfos read FAdditionalInfos;
    //НаимТов - наименование товара
    property Product:Tstring1000 read FProduct write SetProduct;
    //ОКЕИ_Тов - единицы измерения товара (код)
    property Unit1:Tokei read FUnit1 write SetUnit1;
    //НаимЕдИзм - наименование единицы измерения товара.Пользователь заполняет, если Unit=ОКЕИ_Тов='0000'.
    property UnitName:Tstring255 read FUnitName write SetUnitName;
    //КолТов - количество единиц товара
    property Quantity:Double read FQuantity write SetQuantity;
    //ЦенаТов - цена за единицу товара
    property Price:Double read FPrice write SetPrice;
    //СумАкциз - акциз
    property Excise:Double read FExcise write SetExcise;
    //НалСт - ставка налога
    property TaxRate:TTaxRate read FTaxRate write SetTaxRate;
    //СтТовБезНДС - сумма без учета налога
    property SubtotalWithVatExcluded:Double read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;
    //СумНал - сумма налога
    property Vat:Double read FVat write SetVat;
    //СтТовУчНал - сумма всего
    property Subtotal:Double read FSubtotal write SetSubtotal;
    //ПрТовРаб - Признак товар-работа-услуга
    //1 - имущество;
    //2- работа;
    //3- услуга;
    //4 – имущественные права;
    //5 - иное
    property ItemMark:Longint read FItemMark write SetItemMark;
    //ДопПризн - Дополнительная информация о признаке
    property AdditionalProperty:String read FAdditionalProperty write SetAdditionalProperty;
    //КодТов - Характеристика/код/артикул/сорт товара
    property ItemVendorCode:Tstring255 read FItemVendorCode write SetItemVendorCode;
    //НадлОтп - Количество надлежит отпустить
    property ItemToRelease:Double read FItemToRelease write SetItemToRelease;
    //КорСчДебет - Корреспондирующие счета: дебет
    property ItemAccountDebit:String read FItemAccountDebit write SetItemAccountDebit;
    //КорСчКредит - Корреспондирующие счета: кредит
    property ItemAccountCredit:String read FItemAccountCredit write SetItemAccountCredit;
  end;

  {  TInvoiceTable_Item_CustomsDeclarations  }
  TInvoiceTable_Item_CustomsDeclarations = class(TXmlSerializationObject)
  private
    FCustomsDeclaration:TCustomsDeclarationList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property CustomsDeclaration:TCustomsDeclarationList read FCustomsDeclaration;
  end;

  {  TInvoiceTable_Item_AdditionalInfos  }
  TInvoiceTable_Item_AdditionalInfos = class(TXmlSerializationObject)
  private
    FAdditionalInfo:TAdditionalInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property AdditionalInfo:TAdditionalInfoList read FAdditionalInfo;
  end;

  {  TTransferInfo  }
  TTransferInfo = class(TXmlSerializationObject)
  private
    FTransferBases:TTransferInfo_TransferBases;
    FWaybills:TWaybills;
    FAdditionalInfoId:TAdditionalInfoId;
    FCarrier:TExtendedOrganizationInfo;
    FEmployee:TEmployee;
    FOtherIssuer:TOtherIssuer;
    FOperationInfo:Tstring255;
    FOperationType:Tstring255;
    FTransferDate:Tdate1;
    FTransferTextInfo:Tstring1000;
    FCreatedThingTransferDate:Tdate1;
    FCreatedThingInfo:Tstring1000;
    procedure SetOperationInfo( AValue:Tstring255);
    procedure SetOperationType( AValue:Tstring255);
    procedure SetTransferDate( AValue:Tdate1);
    procedure SetTransferTextInfo( AValue:Tstring1000);
    procedure SetCreatedThingTransferDate( AValue:Tdate1);
    procedure SetCreatedThingInfo( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property TransferBases:TTransferInfo_TransferBases read FTransferBases;
    //ТранНакл - Транспортная накладная
    property Waybills:TWaybills read FWaybills;
    //ИнфПолФХЖ3 - Информационное поле документа
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;
    //Перевозчик
    property Carrier:TExtendedOrganizationInfo read FCarrier;
    //РабОргПок
    property Employee:TEmployee read FEmployee;
    //ИнЛицо
    property OtherIssuer:TOtherIssuer read FOtherIssuer;
    //СодОпер - Содержание операции
    property OperationInfo:Tstring255 read FOperationInfo write SetOperationInfo;
    //ВидОпер - Вид операции
    property OperationType:Tstring255 read FOperationType write SetOperationType;
    //ДатаПер - Дата отгрузки
    property TransferDate:Tdate1 read FTransferDate write SetTransferDate;
    //СвТранГруз - Сведения о транспортировке и грузе
    property TransferTextInfo:Tstring1000 read FTransferTextInfo write SetTransferTextInfo;
    //ДатаПерВещ - Дата передачи вещи, изготовленной по договору
    property CreatedThingTransferDate:Tdate1 read FCreatedThingTransferDate write SetCreatedThingTransferDate;
    //СвПерВещ - Сведения о передаче, изготовленной по договору
    property CreatedThingInfo:Tstring1000 read FCreatedThingInfo write SetCreatedThingInfo;
  end;

  {  TTransferInfo_TransferBases  }
  TTransferInfo_TransferBases = class(TXmlSerializationObject)
  private
    FTransferBase:TTransferBaseList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ОснПер - Основание отгрузки
    property TransferBase:TTransferBaseList read FTransferBase;
  end;

  {  TAdditionalInfoId  }
  TAdditionalInfoId = class(TXmlSerializationObject)
  private
    FAdditionalInfo:TAdditionalInfoList;
    FInfoFileId:String;
    procedure SetInfoFileId( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ТекстИнф - Текстовая информация
    property AdditionalInfo:TAdditionalInfoList read FAdditionalInfo;
    property InfoFileId:String read FInfoFileId write SetInfoFileId;
  end;

  {  TAdditionalInfo  }
  TAdditionalInfo = class(TXmlSerializationObject)
  private
    FId:String;
    FValue:String;
    procedure SetId( AValue:String);
    procedure SetValue( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Id:String read FId write SetId;
    property Value:String read FValue write SetValue;
  end;

  {  TCustomsDeclaration  }
  TCustomsDeclaration = class(TXmlSerializationObject)
  private
    FCountry:Tstring1000;
    FDeclarationNumber:Tstring1000;
    procedure SetCountry( AValue:Tstring1000);
    procedure SetDeclarationNumber( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //КодПроисх - Код страны происхождения товара по Общероссийскому классификатору стран мира (ОКСМ) или
    //980 - Евросоюз,
    //981 - ЕАЭС
    property Country:Tstring1000 read FCountry write SetCountry;
    //Номер таможенной декларации
    property DeclarationNumber:Tstring1000 read FDeclarationNumber write SetDeclarationNumber;
  end;

  {  TCustomsDeclarationWithHyphens  }
  TCustomsDeclarationWithHyphens = class(TXmlSerializationObject)
  private
    FCountry:Tstring1000;
    FHyphenCountry:String;
    FDeclarationNumber:Tstring1000;
    procedure SetCountry( AValue:Tstring1000);
    procedure SetHyphenCountry( AValue:String);
    procedure SetDeclarationNumber( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //КодПроисх - Код страны происхождения товара по Общероссийскому классификатору стран мира (ОКСМ) или
    //980 - Евросоюз,
    //981 - ЕАЭС
    property Country:Tstring1000 read FCountry write SetCountry;
    //ДефКодПроисх - обязателен, если отсутствует КодПроисх
    property HyphenCountry:String read FHyphenCountry write SetHyphenCountry;
    //Номер таможенной декларации
    property DeclarationNumber:Tstring1000 read FDeclarationNumber write SetDeclarationNumber;
  end;

  {  TInvoiceTotalsDiff  }
  TInvoiceTotalsDiff = class(TXmlSerializationObject)
  private
    FTotalWithVatExcluded:Double;
    FVat:Double;
    FTotal:Double;
    procedure SetTotalWithVatExcluded( AValue:Double);
    procedure SetVat( AValue:Double);
    procedure SetTotal( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //сумма без учета налога
    property TotalWithVatExcluded:Double read FTotalWithVatExcluded write SetTotalWithVatExcluded;
    //сумма налога
    property Vat:Double read FVat write SetVat;
    //сумма всего
    property Total:Double read FTotal write SetTotal;
  end;

  {  TInvoiceItemAmountsDiff  }
  TInvoiceItemAmountsDiff = class(TXmlSerializationObject)
  private
    FExcise:Double;
    FSubtotalWithVatExcluded:Double;
    FVat:Double;
    FSubtotal:Double;
    procedure SetExcise( AValue:Double);
    procedure SetSubtotalWithVatExcluded( AValue:Double);
    procedure SetVat( AValue:Double);
    procedure SetSubtotal( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //акциз
    property Excise:Double read FExcise write SetExcise;
    //сумма без учета налога
    property SubtotalWithVatExcluded:Double read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;
    //сумма налога
    property Vat:Double read FVat write SetVat;
    //сумма с учетом налога
    property Subtotal:Double read FSubtotal write SetSubtotal;
  end;

  {  TCorrectableInvoiceItemFields_WithoutTaxRate  }
  TCorrectableInvoiceItemFields_WithoutTaxRate = class(TXmlSerializationObject)
  private
    FUnit1:String;
    FQuantity:Double;
    FPrice:Double;
    FExcise:Double;
    FSubtotalWithVatExcluded:Double;
    FVat:Double;
    FSubtotal:Double;
    procedure SetUnit1( AValue:String);
    procedure SetQuantity( AValue:Double);
    procedure SetPrice( AValue:Double);
    procedure SetExcise( AValue:Double);
    procedure SetSubtotalWithVatExcluded( AValue:Double);
    procedure SetVat( AValue:Double);
    procedure SetSubtotal( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //единицы измерения товара (код)
    property Unit1:String read FUnit1 write SetUnit1;
    //количество единиц товара
    property Quantity:Double read FQuantity write SetQuantity;
    //цена за единицу товара
    property Price:Double read FPrice write SetPrice;
    //акциз
    property Excise:Double read FExcise write SetExcise;
    //сумма без учета налога
    property SubtotalWithVatExcluded:Double read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;
    //сумма налога
    property Vat:Double read FVat write SetVat;
    //сумма с учетом налога
    property Subtotal:Double read FSubtotal write SetSubtotal;
  end;

  {  TCorrectableInvoiceItemFields  }
  TCorrectableInvoiceItemFields = class(TCorrectableInvoiceItemFields_WithoutTaxRate)
  private
    FTaxRate:TTaxRate;
    procedure SetTaxRate( AValue:TTaxRate);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ставка налога
    property TaxRate:TTaxRate read FTaxRate write SetTaxRate;
  end;

  {  TCorrectableInvoiceItemFields_WithTwentyPercent  }
  TCorrectableInvoiceItemFields_WithTwentyPercent = class(TCorrectableInvoiceItemFields_WithoutTaxRate)
  private
    FTaxRate:TTaxRateWithTwentyPercent;
    procedure SetTaxRate( AValue:TTaxRateWithTwentyPercent);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ставка налога
    property TaxRate:TTaxRateWithTwentyPercent read FTaxRate write SetTaxRate;
  end;

  {  TCorrectableInvoiceItemFields_WithTaxedByAgent  }
  TCorrectableInvoiceItemFields_WithTaxedByAgent = class(TCorrectableInvoiceItemFields_WithoutTaxRate)
  private
    FTaxRate:TTaxRateWithTaxedByAgent;
    procedure SetTaxRate( AValue:TTaxRateWithTaxedByAgent);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ставка налога
    property TaxRate:TTaxRateWithTaxedByAgent read FTaxRate write SetTaxRate;
  end;

  {  TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent  }
  TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent = class(TCorrectableInvoiceItemFields_WithoutTaxRate)
  private
    FTaxRate:TTaxRateWithTwentyPercentAndTaxedByAgent;
    procedure SetTaxRate( AValue:TTaxRateWithTwentyPercentAndTaxedByAgent);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ставка налога
    property TaxRate:TTaxRateWithTwentyPercentAndTaxedByAgent read FTaxRate write SetTaxRate;
  end;

  {  TAttorney  }
  TAttorney = class(TXmlSerializationObject)
  private
    FIssuerPerson:TOfficial;
    FRecipientPerson:TOfficial;
    FDate:Tdate1;
    FNumber:Tstring255;
    FIssuerOrganizationName:Tstring1000;
    FIssuerAdditionalInfo:Tstring1000;
    FRecipientAdditionalInfo:Tstring1000;
    procedure SetDate( AValue:Tdate1);
    procedure SetNumber( AValue:Tstring255);
    procedure SetIssuerOrganizationName( AValue:Tstring1000);
    procedure SetIssuerAdditionalInfo( AValue:Tstring1000);
    procedure SetRecipientAdditionalInfo( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //Лицо, выдавшее доверенность
    property IssuerPerson:TOfficial read FIssuerPerson;
    //Лицо, получившее доверенность
    property RecipientPerson:TOfficial read FRecipientPerson;
    //Дата выдачи доверенности
    property Date:Tdate1 read FDate write SetDate;
    //Номер доверенности
    property Number:Tstring255 read FNumber write SetNumber;
    //Организация, представитель которой выдал доверенность
    property IssuerOrganizationName:Tstring1000 read FIssuerOrganizationName write SetIssuerOrganizationName;
    //Дополнительная информация о выдавшем доверенность
    property IssuerAdditionalInfo:Tstring1000 read FIssuerAdditionalInfo write SetIssuerAdditionalInfo;
    //Дополнительная информация о получившем доверенность
    property RecipientAdditionalInfo:Tstring1000 read FRecipientAdditionalInfo write SetRecipientAdditionalInfo;
  end;

  {  TOfficial  }
  TOfficial = class(TXmlSerializationObject)
  private
    FLastName:Tstring60;
    FFirstName:Tstring60;
    FMiddleName:Tstring60;
    FPosition:Tstring128z;
    procedure SetLastName( AValue:Tstring60);
    procedure SetFirstName( AValue:Tstring60);
    procedure SetMiddleName( AValue:Tstring60);
    procedure SetPosition( AValue:Tstring128z);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property LastName:Tstring60 read FLastName write SetLastName;
    property FirstName:Tstring60 read FFirstName write SetFirstName;
    property MiddleName:Tstring60 read FMiddleName write SetMiddleName;
    property Position:Tstring128z read FPosition write SetPosition;
  end;

  {  TAcceptanceCertificateSignatureInfo  }
  TAcceptanceCertificateSignatureInfo = class(TXmlSerializationObject)
  private
    FOfficial:TOfficial;
    FAttorney:TAttorney;
    FSignatureDate:Tdate1;
    procedure SetSignatureDate( AValue:Tdate1);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //лицо, подписывающее со стороны исполнителя / заказчика
    property Official:TOfficial read FOfficial;
    //сведения о доверенности подписывающего со стороны исполнителя / заказчика
    property Attorney:TAttorney read FAttorney;
    //дата подписи акта исполнителем / заказчиком
    property SignatureDate:Tdate1 read FSignatureDate write SetSignatureDate;
  end;

  {  TPaymentDocumentInfo  }
  TPaymentDocumentInfo = class(TXmlSerializationObject)
  private
    FDate:Tdate1;
    FNumber:Tstring30;
    FTotal:Double;
    procedure SetDate( AValue:Tdate1);
    procedure SetNumber( AValue:Tstring30);
    procedure SetTotal( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ДатаПРД - Дата составления платежно-расчетного документа
    property Date:Tdate1 read FDate write SetDate;
    //НомерПРД - Номер платежно-расчетного документа
    property Number:Tstring30 read FNumber write SetNumber;
    //СуммаПРД - Сумма платежно-расчетного документа
    property Total:Double read FTotal write SetTotal;
  end;

  {  TGroundInfo  }
  TGroundInfo = class(TXmlSerializationObject)
  private
    FName:Tstring255;
    FNumber:Tstring255;
    FDate:Tdate1;
    FInfo:Tstring1000;
    procedure SetName( AValue:Tstring255);
    procedure SetNumber( AValue:Tstring255);
    procedure SetDate( AValue:Tdate1);
    procedure SetInfo( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //НаимОсн - Наименование документа-основания
    property Name:Tstring255 read FName write SetName;
    //НомОсн - Номер документа-основания
    property Number:Tstring255 read FNumber write SetNumber;
    //ДатаОсн - Дата документа-основания
    property Date:Tdate1 read FDate write SetDate;
    //ДопСвОсн - Дополнительные сведения документа-основания
    property Info:Tstring1000 read FInfo write SetInfo;
  end;

  {  TExtendedOrganizationInfo  }
  TExtendedOrganizationInfo = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TExtendedOrganizationDetails;
    FOrganizationReference:TExtendedOrganizationReference;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetails read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference read FOrganizationReference;
  end;

  {  TExtendedOrganizationDetails_ManualFilling  }
  TExtendedOrganizationDetails_ManualFilling = class(TXmlSerializationObject)
  private
    FOrgType:TOrganizationType;
    FOkopf:String;
    FOkpo:String;
    FOkdp:String;
    FPhone:Tstring255;
    FEmail:Tstring255;
    FCorrespondentAccount:Tstring20;
    FBankAccountNumber:Tstring20;
    FBankName:Tstring1000;
    FBankId:String;
    FDepartment:Tstring1000;
    FOrganizationAdditionalInfo:Tstring255;
    FOrganizationOrPersonInfo:Tstring255;
    FIndividualEntityRegistrationCertificate:Tstring100;
    FLegalEntityId:Tstring255;
    FShortOrgName:Tstring255;
    FCountry:Tstring255;
    procedure SetOrgType( AValue:TOrganizationType);
    procedure SetOkopf( AValue:String);
    procedure SetOkpo( AValue:String);
    procedure SetOkdp( AValue:String);
    procedure SetPhone( AValue:Tstring255);
    procedure SetEmail( AValue:Tstring255);
    procedure SetCorrespondentAccount( AValue:Tstring20);
    procedure SetBankAccountNumber( AValue:Tstring20);
    procedure SetBankName( AValue:Tstring1000);
    procedure SetBankId( AValue:String);
    procedure SetDepartment( AValue:Tstring1000);
    procedure SetOrganizationAdditionalInfo( AValue:Tstring255);
    procedure SetOrganizationOrPersonInfo( AValue:Tstring255);
    procedure SetIndividualEntityRegistrationCertificate( AValue:Tstring100);
    procedure SetLegalEntityId( AValue:Tstring255);
    procedure SetShortOrgName( AValue:Tstring255);
    procedure SetCountry( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //СвИП - СвЮЛУч - СвИнНеУч
    property OrgType:TOrganizationType read FOrgType write SetOrgType;
    //ОКОПФ - Код организационно-правовой формы по ОКОПФ
    property Okopf:String read FOkopf write SetOkopf;
    //ОКПО - код в общероссийском классификаторе предприятий и организаций
    property Okpo:String read FOkpo write SetOkpo;
    //ОКДП - код основного вида деятельности по ОКДП
    property Okdp:String read FOkdp write SetOkdp;
    //Тлф - Номер контактного телефона/факс
    property Phone:Tstring255 read FPhone write SetPhone;
    //ЭлПочта - Адрес электронной почты
    property Email:Tstring255 read FEmail write SetEmail;
    //КорСчет - Корреспондентский счёт
    property CorrespondentAccount:Tstring20 read FCorrespondentAccount write SetCorrespondentAccount;
    //НомерСчета - номер банковского счета
    property BankAccountNumber:Tstring20 read FBankAccountNumber write SetBankAccountNumber;
    //НаимБанк - название банка
    property BankName:Tstring1000 read FBankName write SetBankName;
    //БИК
    property BankId:String read FBankId write SetBankId;
    //СтруктПодр - структурное подразделение
    property Department:Tstring1000 read FDepartment write SetDepartment;
    //ИнфДляУчаст - Информация для участника
    property OrganizationAdditionalInfo:Tstring255 read FOrganizationAdditionalInfo write SetOrganizationAdditionalInfo;
    //ИныеСвед - Иные сведения, идентифицирующие ФЛ или ЮЛ
    property OrganizationOrPersonInfo:Tstring255 read FOrganizationOrPersonInfo write SetOrganizationOrPersonInfo;
    //СвГосРегИп - Реквизиты свидетельства о государственной регистрации ИП
    property IndividualEntityRegistrationCertificate:Tstring100 read FIndividualEntityRegistrationCertificate write SetIndividualEntityRegistrationCertificate;
    //Идентиф - Идентификатор ЮЛ, нужен для автоматизированной обработки
    property LegalEntityId:Tstring255 read FLegalEntityId write SetLegalEntityId;
    //КраткНазв - Краткое название
    property ShortOrgName:Tstring255 read FShortOrgName write SetShortOrgName;
    //Страна
    property Country:Tstring255 read FCountry write SetCountry;
  end;

  {  TExtendedOrganizationReference  }
  TExtendedOrganizationReference = class(TExtendedOrganizationDetails_ManualFilling)
  private
    FBoxId:Tguid;
    procedure SetBoxId( AValue:Tguid);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property BoxId:Tguid read FBoxId write SetBoxId;
  end;

  {  TExtendedOrganizationDetails  }
  TExtendedOrganizationDetails = class(TExtendedOrganizationDetails_ManualFilling)
  private
    FAddress:TAddress;
    FOrgName:Tstring1000;
    FInn:Tstring60;
    FKpp:Tstring1000;
    FFnsParticipantId:Tstring1000;
    procedure SetOrgName( AValue:Tstring1000);
    procedure SetInn( AValue:Tstring60);
    procedure SetKpp( AValue:Tstring1000);
    procedure SetFnsParticipantId( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //Адрес
    property Address:TAddress read FAddress;
    //НаимОрг - название организации
    property OrgName:Tstring1000 read FOrgName write SetOrgName;
    //ИНН ФЛ-ИНН - ИНН
    property Inn:Tstring60 read FInn write SetInn;
    //КПП
    property Kpp:Tstring1000 read FKpp write SetKpp;
    //идентификатор участника ЭДО
    property FnsParticipantId:Tstring1000 read FFnsParticipantId write SetFnsParticipantId;
  end;

  {  TExtendedOrganizationInfoWithHyphens  }
  TExtendedOrganizationInfoWithHyphens = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TExtendedOrganizationDetailsWithHyphens;
    FOrganizationReference:TExtendedOrganizationReference;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetailsWithHyphens read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference read FOrganizationReference;
  end;

  {  TExtendedOrganizationDetailsWithHyphens  }
  TExtendedOrganizationDetailsWithHyphens = class(TExtendedOrganizationDetails)
  private
    FHyphenInn:String;
    procedure SetHyphenInn( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ДефИННФЛ, ДефИННЮЛ
    property HyphenInn:String read FHyphenInn write SetHyphenInn;
  end;

  {  TAddress  }
  TAddress = class(TXmlSerializationObject)
  private
    FRussianAddress:TRussianAddress;
    FForeignAddress:TForeignAddress;
    FAddressCode:Tstring36;
    procedure SetAddressCode( AValue:Tstring36);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property RussianAddress:TRussianAddress read FRussianAddress;
    property ForeignAddress:TForeignAddress read FForeignAddress;
    property AddressCode:Tstring36 read FAddressCode write SetAddressCode;
  end;

  {  TRussianAddress  }
  TRussianAddress = class(TXmlSerializationObject)
  private
    FZipCode:String;
    FRegion:Tstring50;
    FTerritory:Tstring50;
    FCity:Tstring50;
    FLocality:Tstring50;
    FStreet:Tstring50;
    FBuilding:Tstring20;
    FBlock:Tstring20;
    FApartment:Tstring20;
    procedure SetZipCode( AValue:String);
    procedure SetRegion( AValue:Tstring50);
    procedure SetTerritory( AValue:Tstring50);
    procedure SetCity( AValue:Tstring50);
    procedure SetLocality( AValue:Tstring50);
    procedure SetStreet( AValue:Tstring50);
    procedure SetBuilding( AValue:Tstring20);
    procedure SetBlock( AValue:Tstring20);
    procedure SetApartment( AValue:Tstring20);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //индекс
    property ZipCode:String read FZipCode write SetZipCode;
    //регион (код)
    property Region:Tstring50 read FRegion write SetRegion;
    //район
    property Territory:Tstring50 read FTerritory write SetTerritory;
    //город
    property City:Tstring50 read FCity write SetCity;
    //населенный пункт
    property Locality:Tstring50 read FLocality write SetLocality;
    //улица
    property Street:Tstring50 read FStreet write SetStreet;
    //дом
    property Building:Tstring20 read FBuilding write SetBuilding;
    //корпус
    property Block:Tstring20 read FBlock write SetBlock;
    //квартира
    property Apartment:Tstring20 read FApartment write SetApartment;
  end;

  {  TForeignAddress  }
  TForeignAddress = class(TXmlSerializationObject)
  private
    FCountry:Tstring60;
    FAddress:Tstring255;
    procedure SetCountry( AValue:Tstring60);
    procedure SetAddress( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //страна (код)
    property Country:Tstring60 read FCountry write SetCountry;
    //текст адреса
    property Address:Tstring255 read FAddress write SetAddress;
  end;

  {  TSignerInfo  }
  TSignerInfo = class(TXmlSerializationObject)
  private
    FSignerDetails:TSignerDetails;
    FSignerReference:TSignerReferenceInfo;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property SignerDetails:TSignerDetails read FSignerDetails;
    property SignerReference:TSignerReferenceInfo read FSignerReference;
  end;

  {  TSignerDetails  }
  TSignerDetails = class(TXmlSerializationObject)
  private
    FLastName:String;
    FFirstName:String;
    FMiddleName:String;
    FPosition:String;
    FInn:String;
    FSoleProprietorRegistrationCertificate:String;
    procedure SetLastName( AValue:String);
    procedure SetFirstName( AValue:String);
    procedure SetMiddleName( AValue:String);
    procedure SetPosition( AValue:String);
    procedure SetInn( AValue:String);
    procedure SetSoleProprietorRegistrationCertificate( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property LastName:String read FLastName write SetLastName;
    property FirstName:String read FFirstName write SetFirstName;
    property MiddleName:String read FMiddleName write SetMiddleName;
    property Position:String read FPosition write SetPosition;
    property Inn:String read FInn write SetInn;
    property SoleProprietorRegistrationCertificate:String read FSoleProprietorRegistrationCertificate write SetSoleProprietorRegistrationCertificate;
  end;

  {  TSignerReferenceInfo  }
  TSignerReferenceInfo = class(TXmlSerializationObject)
  private
    FCertificateBytes:String;
    FCertificateThumbprint:Tstring100;
    procedure SetCertificateBytes( AValue:String);
    procedure SetCertificateThumbprint( AValue:Tstring100);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //X.509 сертификат подписанта (DER-кодировка) в формате BASE64Одно из полей CertificateBytes или CertificateThumbprint обязательно для заполнения
    property CertificateBytes:String read FCertificateBytes write SetCertificateBytes;
    //Отпечаток сертификата подписантаОдно из полей CertificateBytes или CertificateThumbprint обязательно для заполнения
    property CertificateThumbprint:Tstring100 read FCertificateThumbprint write SetCertificateThumbprint;
  end;

  {  TSignerReference  }
  TSignerReference = class(TXmlSerializationObject)
  private
    FBoxId:Tstring100;
    FCertificateBytes:String;
    FCertificateThumbprint:Tstring100;
    procedure SetBoxId( AValue:Tstring100);
    procedure SetCertificateBytes( AValue:String);
    procedure SetCertificateThumbprint( AValue:Tstring100);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //Идентификатор ящика подписанта для заполнения SignerDetails
    property BoxId:Tstring100 read FBoxId write SetBoxId;
    //X.509 сертификат подписанта (DER-кодировка) в формате BASE64Одно из полей CertificateBytes или CertificateThumbprint обязательно для заполнения
    property CertificateBytes:String read FCertificateBytes write SetCertificateBytes;
    //Отпечаток сертификата подписантаОдно из полей CertificateBytes или CertificateThumbprint обязательно для заполнения
    property CertificateThumbprint:Tstring100 read FCertificateThumbprint write SetCertificateThumbprint;
  end;

  {  TExtendedSignerDetailsBase  }
  TExtendedSignerDetailsBase = class(TXmlSerializationObject)
  private
    FLastName:Tstring60;
    FFirstName:Tstring60;
    FMiddleName:Tstring60;
    FPosition:Tstring128z;
    FInn:String;
    FRegistrationCertificate:Tstring100;
    FSignerType:String;
    FSignerOrganizationName:Tstring1000;
    FSignerInfo:Tstring255;
    FSignerPowersBase:Tstring255;
    FSignerOrgPowersBase:Tstring255;
    procedure SetLastName( AValue:Tstring60);
    procedure SetFirstName( AValue:Tstring60);
    procedure SetMiddleName( AValue:Tstring60);
    procedure SetPosition( AValue:Tstring128z);
    procedure SetInn( AValue:String);
    procedure SetRegistrationCertificate( AValue:Tstring100);
    procedure SetSignerType( AValue:String);
    procedure SetSignerOrganizationName( AValue:Tstring1000);
    procedure SetSignerInfo( AValue:Tstring255);
    procedure SetSignerPowersBase( AValue:Tstring255);
    procedure SetSignerOrgPowersBase( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property LastName:Tstring60 read FLastName write SetLastName;
    property FirstName:Tstring60 read FFirstName write SetFirstName;
    property MiddleName:Tstring60 read FMiddleName write SetMiddleName;
    //Должность
    property Position:Tstring128z read FPosition write SetPosition;
    //ИННОбязательно для SignerType=1 (ЮЛ) и SignerType=2 (ИП)Опционально для SignerType=3 (ФЛ)
    property Inn:String read FInn write SetInn;
    //СвГосРегИП - Реквизиты свидетельства о государственной регистрации индивидуального предпринимателя
    property RegistrationCertificate:Tstring100 read FRegistrationCertificate write SetRegistrationCertificate;
    //1 – Представитель юридического лица (ЮЛ)
    //2 - Индивидуальный предприниматель (ИП)
    //3 - Физическое лицо (ФЛ)
    property SignerType:String read FSignerType write SetSignerType;
    //НаимОрг
    property SignerOrganizationName:Tstring1000 read FSignerOrganizationName write SetSignerOrganizationName;
    //ИныеСвед - Иные сведения, идентифицирующие физическое лицо
    property SignerInfo:Tstring255 read FSignerInfo write SetSignerInfo;
    //ОснПолн - Основание полномочий (доверия)
    property SignerPowersBase:Tstring255 read FSignerPowersBase write SetSignerPowersBase;
    //ОснПолнОрг - Основание полномочий (доверия) организации
    property SignerOrgPowersBase:Tstring255 read FSignerOrgPowersBase write SetSignerOrgPowersBase;
  end;

  {  TExtendedSignerDetails  }
  TExtendedSignerDetails = class(TExtendedSignerDetailsBase)
  private
    FSignerStatus:Longint;
    procedure SetSignerStatus( AValue:Longint);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //Статус1 - работник организации продавца товаров (работ, услуг, имущественных прав) ИЛИ работник организации покупателя;
    //2 - работник организации - составителя информации продавца ИЛИ работник организации – составителя информации покупателя;
    //3 - работник иной уполномоченной организации;
    //4 - уполномоченное физическое лицо, в том числе индивидуальный предприниматель.
    property SignerStatus:Longint read FSignerStatus write SetSignerStatus;
  end;

  {  TExtendedSignerDetails_SellerTitle  }
  TExtendedSignerDetails_SellerTitle = class(TExtendedSignerDetails)
  private
    FSignerPowers:Longint;
    procedure SetSignerPowers( AValue:Longint);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий0 - лицо, ответственное за подписание счетов-фактур
    //1 - лицо, совершившее сделку, операцию
    //2 - лицо, совершившее сделку, операцию и ответственное за ее оформление
    //3 - лицо, ответственное за оформление свершившегося события
    //4 - лицо, совершившее сделку, операцию и ответственное за подписание счетов-фактур
    //5 - лицо, совершившее сделку, операцию и ответственное за её оформление и за подписание счетов-фактур
    //6 - лицо, ответственное за оформление свершившегося события и за подписание счетов-фактур
    property SignerPowers:Longint read FSignerPowers write SetSignerPowers;
  end;

  {  TExtendedSignerDetails_BuyerTitle  }
  TExtendedSignerDetails_BuyerTitle = class(TExtendedSignerDetails)
  private
    FSignerPowers:Longint;
    procedure SetSignerPowers( AValue:Longint);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий1 - лицо, совершившее сделку, операцию
    //2 - лицо, совершившее сделку, операцию и ответственное за ее оформление
    //3 - лицо, ответственное за оформление свершившегося события
    property SignerPowers:Longint read FSignerPowers write SetSignerPowers;
  end;

  {  TExtendedSignerDetails_BuyerTitle820  }
  TExtendedSignerDetails_BuyerTitle820 = class(TExtendedSignerDetailsBase)
  private
    FSignerPowers:Longint;
    FSignerStatus:Longint;
    procedure SetSignerPowers( AValue:Longint);
    procedure SetSignerStatus( AValue:Longint);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий1 - лицо, совершившее сделку, операцию
    //2 - лицо, совершившее сделку, операцию и ответственное за ее оформление
    //3 - лицо, ответственное за оформление свершившегося события
    property SignerPowers:Longint read FSignerPowers write SetSignerPowers;
    //Статус3 - работник иной уполномоченной организации;
    //4 - уполномоченное физическое лицо, в том числе индивидуальный предприниматель;
    //5 - работник организации – покупателя;
    //6 - работник организации – составителя файла обмена информации покупателя, если составитель файла обмена информации покупателя не является покупателем.
    property SignerStatus:Longint read FSignerStatus write SetSignerStatus;
  end;

  {  TExtendedSignerDetails_CorrectionSellerTitle  }
  TExtendedSignerDetails_CorrectionSellerTitle = class(TExtendedSignerDetails)
  private
    FSignerPowers:Longint;
    procedure SetSignerPowers( AValue:Longint);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий0 - лицо, ответственное за подписание счетов-фактур;
    //3 – лицо, ответственное за оформление свершившегося события;
    //6 - лицо, совершившее сделку, операцию и ответственное за подписание счетов-фактур
    property SignerPowers:Longint read FSignerPowers write SetSignerPowers;
  end;

  {  TExtendedSignerDetails_CorrectionBuyerTitle  }
  TExtendedSignerDetails_CorrectionBuyerTitle = class(TExtendedSignerDetails)
  private
    FSignerPowers:Longint;
    procedure SetSignerPowers( AValue:Longint);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий3 – лицо, ответственное за оформление свершившегося события;
    property SignerPowers:Longint read FSignerPowers write SetSignerPowers;
  end;

  {  TExtendedSignerDetails_551_552  }
  TExtendedSignerDetails_551_552 = class(TExtendedSignerDetails)
  private
    FSignerPowers:Longint;
    procedure SetSignerPowers( AValue:Longint);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий1 - лицо, совершившее сделку, операцию;
    //2 – лицо, совершившее сделку, операцию и ответственное за ее оформление;
    //3 – лицо, ответственное за оформление свершившегося события
    property SignerPowers:Longint read FSignerPowers write SetSignerPowers;
  end;

  {  TEmployee  }
  TEmployee = class(TXmlSerializationObject)
  private
    FPosition:Tstring128z;
    FEmployeeInfo:Tstring255;
    FEmployeeBase:Tstring120;
    FLastName:Tstring60;
    FFirstName:Tstring60;
    FMiddleName:Tstring60;
    procedure SetPosition( AValue:Tstring128z);
    procedure SetEmployeeInfo( AValue:Tstring255);
    procedure SetEmployeeBase( AValue:Tstring120);
    procedure SetLastName( AValue:Tstring60);
    procedure SetFirstName( AValue:Tstring60);
    procedure SetMiddleName( AValue:Tstring60);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //Должность
    property Position:Tstring128z read FPosition write SetPosition;
    //ИныеСвед - Иные сведения, идентифицирующие физическое лицо
    property EmployeeInfo:Tstring255 read FEmployeeInfo write SetEmployeeInfo;
    //ОснПолн - Основание полномочий предстваителя
    property EmployeeBase:Tstring120 read FEmployeeBase write SetEmployeeBase;
    property LastName:Tstring60 read FLastName write SetLastName;
    property FirstName:Tstring60 read FFirstName write SetFirstName;
    property MiddleName:Tstring60 read FMiddleName write SetMiddleName;
  end;

  {  TOtherIssuer  }
  TOtherIssuer = class(TXmlSerializationObject)
  private
    FPosition:Tstring128z;
    FEmployeeInfo:Tstring255;
    FEmployeeBase:Tstring120;
    FOrganizationName:Tstring128z;
    FOrganizationBase:Tstring120;
    FLastName:Tstring60;
    FFirstName:Tstring60;
    FMiddleName:Tstring60;
    procedure SetPosition( AValue:Tstring128z);
    procedure SetEmployeeInfo( AValue:Tstring255);
    procedure SetEmployeeBase( AValue:Tstring120);
    procedure SetOrganizationName( AValue:Tstring128z);
    procedure SetOrganizationBase( AValue:Tstring120);
    procedure SetLastName( AValue:Tstring60);
    procedure SetFirstName( AValue:Tstring60);
    procedure SetMiddleName( AValue:Tstring60);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //Должность представителя организацииЕсли заполнено - формируется структура "ПредОргПер".Если не заполнено – формируется структура "ФЛПер".
    property Position:Tstring128z read FPosition write SetPosition;
    //ИныеСвед - Иные сведения, идентифицирующие физическое лицо
    property EmployeeInfo:Tstring255 read FEmployeeInfo write SetEmployeeInfo;
    //ОснПолнПредПер (ОснДоверФЛ) - Основание полномочий представителя
    property EmployeeBase:Tstring120 read FEmployeeBase write SetEmployeeBase;
    //НаимОргПер - Наименование организации, которой доверена передача
    property OrganizationName:Tstring128z read FOrganizationName write SetOrganizationName;
    //ОснДоверОргПер - Основание, по которому организации доверена передача
    property OrganizationBase:Tstring120 read FOrganizationBase write SetOrganizationBase;
    property LastName:Tstring60 read FLastName write SetLastName;
    property FirstName:Tstring60 read FFirstName write SetFirstName;
    property MiddleName:Tstring60 read FMiddleName write SetMiddleName;
  end;

  {  TWaybills  }
  TWaybills = class(TXmlSerializationObject)
  private
    FWaybill:TWaybills_WaybillList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Waybill:TWaybills_WaybillList read FWaybill;
  end;

  {  TWaybills_Waybill  }
  TWaybills_Waybill = class(TXmlSerializationObject)
  private
    FTransferDocumentNumber:Tstring255;
    FTransferDocumentDate:Tdate1;
    procedure SetTransferDocumentNumber( AValue:Tstring255);
    procedure SetTransferDocumentDate( AValue:Tdate1);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //НомерТранНакл - Номер транспортной накладной
    property TransferDocumentNumber:Tstring255 read FTransferDocumentNumber write SetTransferDocumentNumber;
    //ДатаТранНакл - Дата транспортной накладной
    property TransferDocumentDate:Tdate1 read FTransferDocumentDate write SetTransferDocumentDate;
  end;

  {  TTransferBase  }
  TTransferBase = class(TXmlSerializationObject)
  private
    FBaseDocumentName:Tstring255;
    FBaseDocumentNumber:Tstring255;
    FBaseDocumentDate:Tdate1;
    FBaseDocumentInfo:Tstring1000;
    procedure SetBaseDocumentName( AValue:Tstring255);
    procedure SetBaseDocumentNumber( AValue:Tstring255);
    procedure SetBaseDocumentDate( AValue:Tdate1);
    procedure SetBaseDocumentInfo( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //НаимОсн - Наименование документа-основания отгрузки
    property BaseDocumentName:Tstring255 read FBaseDocumentName write SetBaseDocumentName;
    //НомОсн - Номер документа-основания отгрузки
    property BaseDocumentNumber:Tstring255 read FBaseDocumentNumber write SetBaseDocumentNumber;
    //ДатаОсн - Дата документа-основания отгрузки
    property BaseDocumentDate:Tdate1 read FBaseDocumentDate write SetBaseDocumentDate;
    //ДопСвОсн - Дополнительные сведения документа-основания отгрузки
    property BaseDocumentInfo:Tstring1000 read FBaseDocumentInfo write SetBaseDocumentInfo;
  end;

  {  TTransferBase820  }
  TTransferBase820 = class(TTransferBase)
  private
    FBaseDocumentId:Tstring255;
    procedure SetBaseDocumentId( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //ИдентОсн - Идентификатор документа – основания
    property BaseDocumentId:Tstring255 read FBaseDocumentId write SetBaseDocumentId;
  end;

implementation

  {  TUniversalTransferDocument  }
procedure TUniversalTransferDocument.SetFunction1(AValue: String);
begin
  FFunction1:=AValue;
  CheckLockupValue('Function1', AValue);
  ModifiedProperty('Function1');
end;

procedure TUniversalTransferDocument.SetDocumentName(AValue: Tstring255);
begin
  FDocumentName:=AValue;
  CheckStrMinSize('DocumentName', AValue);
  CheckStrMaxSize('DocumentName', AValue);
  ModifiedProperty('DocumentName');
end;

procedure TUniversalTransferDocument.SetDocumentDate(AValue: Tdate1);
begin
  FDocumentDate:=AValue;
  CheckStrMinSize('DocumentDate', AValue);
  CheckStrMaxSize('DocumentDate', AValue);
  ModifiedProperty('DocumentDate');
end;

procedure TUniversalTransferDocument.SetDocumentNumber(AValue: Tstring1000);
begin
  FDocumentNumber:=AValue;
  CheckStrMinSize('DocumentNumber', AValue);
  CheckStrMaxSize('DocumentNumber', AValue);
  ModifiedProperty('DocumentNumber');
end;

procedure TUniversalTransferDocument.SetCurrency(AValue: Tokv);
begin
  FCurrency:=AValue;
  CheckStrMinSize('Currency', AValue);
  CheckStrMaxSize('Currency', AValue);
  ModifiedProperty('Currency');
end;

procedure TUniversalTransferDocument.SetCurrencyRate(AValue: Double);
begin
  FCurrencyRate:=AValue;
  ModifiedProperty('CurrencyRate');
end;

procedure TUniversalTransferDocument.SetRevisionDate(AValue: Tdate1);
begin
  FRevisionDate:=AValue;
  CheckStrMinSize('RevisionDate', AValue);
  CheckStrMaxSize('RevisionDate', AValue);
  ModifiedProperty('RevisionDate');
end;

procedure TUniversalTransferDocument.SetRevisionNumber(AValue: Longint);
begin
  FRevisionNumber:=AValue;
  ModifiedProperty('RevisionNumber');
end;

procedure TUniversalTransferDocument.SetDocumentCreator(AValue: Tstring1000);
begin
  FDocumentCreator:=AValue;
  CheckStrMinSize('DocumentCreator', AValue);
  CheckStrMaxSize('DocumentCreator', AValue);
  ModifiedProperty('DocumentCreator');
end;

procedure TUniversalTransferDocument.SetDocumentCreatorBase(AValue: Tstring120);
begin
  FDocumentCreatorBase:=AValue;
  CheckStrMinSize('DocumentCreatorBase', AValue);
  CheckStrMaxSize('DocumentCreatorBase', AValue);
  ModifiedProperty('DocumentCreatorBase');
end;

procedure TUniversalTransferDocument.SetGovernmentContractInfo(AValue: Tstring255);
begin
  FGovernmentContractInfo:=AValue;
  CheckStrMinSize('GovernmentContractInfo', AValue);
  CheckStrMaxSize('GovernmentContractInfo', AValue);
  ModifiedProperty('GovernmentContractInfo');
end;

procedure TUniversalTransferDocument.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Seller', 'Seller', [], '', -1, -1);
  P:=RegisterProperty('Buyer', 'Buyer', [], '', -1, -1);
  P:=RegisterProperty('Shipper', 'Shipper', [], '', -1, -1);
  P:=RegisterProperty('Consignee', 'Consignee', [], '', -1, -1);
  P:=RegisterProperty('Signers', 'Signers', [], '', -1, -1);
  P:=RegisterProperty('PaymentDocuments', 'PaymentDocuments', [], '', -1, -1);
  P:=RegisterProperty('AdditionalInfoId', 'AdditionalInfoId', [], '', -1, -1);
  P:=RegisterProperty('Table', 'Table', [], '', -1, -1);
  P:=RegisterProperty('TransferInfo', 'TransferInfo', [], '', -1, -1);
  P:=RegisterProperty('Function1', 'Function', [xsaRequared], '', -1, -1);
    P.ValidList.Add('СЧФ');
    P.ValidList.Add('ДОП');
    P.ValidList.Add('СЧФДОП');
  P:=RegisterProperty('DocumentName', 'DocumentName', [], '', 1, 255);
  P:=RegisterProperty('DocumentDate', 'DocumentDate', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('DocumentNumber', 'DocumentNumber', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('Currency', 'Currency', [xsaRequared], '', 3, 3);
  P:=RegisterProperty('CurrencyRate', 'CurrencyRate', [], '', -1, -1);
    P.TotalDigits := 10;
    P.FractionDigits := 4;
  P:=RegisterProperty('RevisionDate', 'RevisionDate', [], '', 10, 10);
  P:=RegisterProperty('RevisionNumber', 'RevisionNumber', [], '', -1, -1);
    P.TotalDigits := 3;
    P.FractionDigits := 0;
  P:=RegisterProperty('DocumentCreator', 'DocumentCreator', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('DocumentCreatorBase', 'DocumentCreatorBase', [], '', 1, 120);
  P:=RegisterProperty('GovernmentContractInfo', 'GovernmentContractInfo', [], '', 1, 255);
end;

procedure TUniversalTransferDocument.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSeller:=TExtendedOrganizationInfo.Create;
  FBuyer:=TExtendedOrganizationInfo.Create;
  FShipper:=TUniversalTransferDocument_Shipper.Create;
  FConsignee:=TExtendedOrganizationInfo.Create;
  FSigners:=TUniversalTransferDocument_Signers.Create;
  FPaymentDocuments:=TUniversalTransferDocument_PaymentDocuments.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FTable:=TInvoiceTable.Create;
  FTransferInfo:=TTransferInfo.Create;
end;

destructor TUniversalTransferDocument.Destroy;
begin
  FSeller.Free;
  FBuyer.Free;
  FShipper.Free;
  FConsignee.Free;
  FSigners.Free;
  FPaymentDocuments.Free;
  FAdditionalInfoId.Free;
  FTable.Free;
  FTransferInfo.Free;
  inherited Destroy;
end;

function TUniversalTransferDocument.RootNodeName:string;
begin
  Result:='UniversalTransferDocument';
end;

  {  TUniversalTransferDocument_Shipper  }
procedure TUniversalTransferDocument_Shipper.SetSameAsSeller(AValue: String);
begin
  FSameAsSeller:=AValue;
  CheckLockupValue('SameAsSeller', AValue);
  ModifiedProperty('SameAsSeller');
end;

procedure TUniversalTransferDocument_Shipper.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrganizationDetails', 'OrganizationDetails', [], '', -1, -1);
  P:=RegisterProperty('OrganizationReference', 'OrganizationReference', [], '', -1, -1);
  P:=RegisterProperty('SameAsSeller', 'SameAsSeller', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
end;

procedure TUniversalTransferDocument_Shipper.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TExtendedOrganizationDetails.Create;
  FOrganizationReference:=TExtendedOrganizationReference.Create;
end;

destructor TUniversalTransferDocument_Shipper.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

  {  TUniversalTransferDocument_Signers  }
procedure TUniversalTransferDocument_Signers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerReference', 'SignerReference', [], '', -1, -1);
  P:=RegisterProperty('SignerDetails', 'SignerDetails', [], '', -1, -1);
end;

procedure TUniversalTransferDocument_Signers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSignerReference:=TSignerReference.Create;
  FSignerDetails:=TExtendedSignerDetails_SellerTitle.Create;
end;

destructor TUniversalTransferDocument_Signers.Destroy;
begin
  FSignerReference.Free;
  FSignerDetails.Free;
  inherited Destroy;
end;

  {  TUniversalTransferDocument_PaymentDocuments  }
procedure TUniversalTransferDocument_PaymentDocuments.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Document', 'Document', [], '', -1, -1);
end;

procedure TUniversalTransferDocument_PaymentDocuments.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FDocument:=TPaymentDocumentInfoList.Create;
end;

destructor TUniversalTransferDocument_PaymentDocuments.Destroy;
begin
  FDocument.Free;
  inherited Destroy;
end;

  {  TInvoiceTable  }
procedure TInvoiceTable.SetTotalWithVatExcluded(AValue: Double);
begin
  FTotalWithVatExcluded:=AValue;
  ModifiedProperty('TotalWithVatExcluded');
end;

procedure TInvoiceTable.SetVat(AValue: Double);
begin
  FVat:=AValue;
  ModifiedProperty('Vat');
end;

procedure TInvoiceTable.SetTotal(AValue: Double);
begin
  FTotal:=AValue;
  ModifiedProperty('Total');
end;

procedure TInvoiceTable.SetTotalNet(AValue: Double);
begin
  FTotalNet:=AValue;
  ModifiedProperty('TotalNet');
end;

procedure TInvoiceTable.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Item', 'Item', [], '', -1, -1);
  P:=RegisterProperty('TotalWithVatExcluded', 'TotalWithVatExcluded', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('Vat', 'Vat', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('Total', 'Total', [xsaRequared], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('TotalNet', 'TotalNet', [], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
end;

procedure TInvoiceTable.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItem:=TInvoiceTable_ItemList.Create;
end;

destructor TInvoiceTable.Destroy;
begin
  FItem.Free;
  inherited Destroy;
end;

  {  TInvoiceTable_Item  }
procedure TInvoiceTable_Item.SetProduct(AValue: Tstring1000);
begin
  FProduct:=AValue;
  CheckStrMinSize('Product', AValue);
  CheckStrMaxSize('Product', AValue);
  ModifiedProperty('Product');
end;

procedure TInvoiceTable_Item.SetUnit1(AValue: Tokei);
begin
  FUnit1:=AValue;
  CheckStrMinSize('Unit1', AValue);
  CheckStrMaxSize('Unit1', AValue);
  ModifiedProperty('Unit1');
end;

procedure TInvoiceTable_Item.SetUnitName(AValue: Tstring255);
begin
  FUnitName:=AValue;
  CheckStrMinSize('UnitName', AValue);
  CheckStrMaxSize('UnitName', AValue);
  ModifiedProperty('UnitName');
end;

procedure TInvoiceTable_Item.SetQuantity(AValue: Double);
begin
  FQuantity:=AValue;
  ModifiedProperty('Quantity');
end;

procedure TInvoiceTable_Item.SetPrice(AValue: Double);
begin
  FPrice:=AValue;
  ModifiedProperty('Price');
end;

procedure TInvoiceTable_Item.SetExcise(AValue: Double);
begin
  FExcise:=AValue;
  ModifiedProperty('Excise');
end;

procedure TInvoiceTable_Item.SetTaxRate(AValue: TTaxRate);
begin
  FTaxRate:=AValue;
  CheckLockupValue('TaxRate', AValue);
  ModifiedProperty('TaxRate');
end;

procedure TInvoiceTable_Item.SetSubtotalWithVatExcluded(AValue: Double);
begin
  FSubtotalWithVatExcluded:=AValue;
  ModifiedProperty('SubtotalWithVatExcluded');
end;

procedure TInvoiceTable_Item.SetVat(AValue: Double);
begin
  FVat:=AValue;
  ModifiedProperty('Vat');
end;

procedure TInvoiceTable_Item.SetSubtotal(AValue: Double);
begin
  FSubtotal:=AValue;
  ModifiedProperty('Subtotal');
end;

procedure TInvoiceTable_Item.SetItemMark(AValue: Longint);
begin
  FItemMark:=AValue;
  CheckLockupValue('ItemMark', AValue);
  ModifiedProperty('ItemMark');
end;

procedure TInvoiceTable_Item.SetAdditionalProperty(AValue: String);
begin
  FAdditionalProperty:=AValue;
  CheckStrMinSize('AdditionalProperty', AValue);
  CheckStrMaxSize('AdditionalProperty', AValue);
  ModifiedProperty('AdditionalProperty');
end;

procedure TInvoiceTable_Item.SetItemVendorCode(AValue: Tstring255);
begin
  FItemVendorCode:=AValue;
  CheckStrMinSize('ItemVendorCode', AValue);
  CheckStrMaxSize('ItemVendorCode', AValue);
  ModifiedProperty('ItemVendorCode');
end;

procedure TInvoiceTable_Item.SetItemToRelease(AValue: Double);
begin
  FItemToRelease:=AValue;
  ModifiedProperty('ItemToRelease');
end;

procedure TInvoiceTable_Item.SetItemAccountDebit(AValue: String);
begin
  FItemAccountDebit:=AValue;
  CheckStrMinSize('ItemAccountDebit', AValue);
  CheckStrMaxSize('ItemAccountDebit', AValue);
  ModifiedProperty('ItemAccountDebit');
end;

procedure TInvoiceTable_Item.SetItemAccountCredit(AValue: String);
begin
  FItemAccountCredit:=AValue;
  CheckStrMinSize('ItemAccountCredit', AValue);
  CheckStrMaxSize('ItemAccountCredit', AValue);
  ModifiedProperty('ItemAccountCredit');
end;

procedure TInvoiceTable_Item.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CustomsDeclarations', 'CustomsDeclarations', [], '', -1, -1);
  P:=RegisterProperty('AdditionalInfos', 'AdditionalInfos', [], '', -1, -1);
  P:=RegisterProperty('Product', 'Product', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('Unit1', 'Unit', [], '', 3, 4);
  P:=RegisterProperty('UnitName', 'UnitName', [], '', 1, 255);
  P:=RegisterProperty('Quantity', 'Quantity', [], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
  P:=RegisterProperty('Price', 'Price', [], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
  P:=RegisterProperty('Excise', 'Excise', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('TaxRate', 'TaxRate', [xsaRequared], '', -1, -1);
    P.ValidList.Add('без НДС');
    P.ValidList.Add('0%');
    P.ValidList.Add('10%');
    P.ValidList.Add('18%');
    P.ValidList.Add('10/110');
    P.ValidList.Add('18/118');
  P:=RegisterProperty('SubtotalWithVatExcluded', 'SubtotalWithVatExcluded', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('Vat', 'Vat', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('Subtotal', 'Subtotal', [xsaRequared], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('ItemMark', 'ItemMark', [], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
    P.ValidList.Add('5');
  P:=RegisterProperty('AdditionalProperty', 'AdditionalProperty', [], '', 1, 4);
  P:=RegisterProperty('ItemVendorCode', 'ItemVendorCode', [], '', 1, 255);
  P:=RegisterProperty('ItemToRelease', 'ItemToRelease', [], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
  P:=RegisterProperty('ItemAccountDebit', 'ItemAccountDebit', [], '', 9, 9);
  P:=RegisterProperty('ItemAccountCredit', 'ItemAccountCredit', [], '', 9, 9);
end;

procedure TInvoiceTable_Item.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FCustomsDeclarations:=TInvoiceTable_Item_CustomsDeclarations.Create;
  FAdditionalInfos:=TInvoiceTable_Item_AdditionalInfos.Create;
end;

destructor TInvoiceTable_Item.Destroy;
begin
  FCustomsDeclarations.Free;
  FAdditionalInfos.Free;
  inherited Destroy;
end;

  {  TInvoiceTable_Item_CustomsDeclarations  }
procedure TInvoiceTable_Item_CustomsDeclarations.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CustomsDeclaration', 'CustomsDeclaration', [], '', -1, -1);
end;

procedure TInvoiceTable_Item_CustomsDeclarations.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FCustomsDeclaration:=TCustomsDeclarationList.Create;
end;

destructor TInvoiceTable_Item_CustomsDeclarations.Destroy;
begin
  FCustomsDeclaration.Free;
  inherited Destroy;
end;

  {  TInvoiceTable_Item_AdditionalInfos  }
procedure TInvoiceTable_Item_AdditionalInfos.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', -1, -1);
end;

procedure TInvoiceTable_Item_AdditionalInfos.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAdditionalInfo:=TAdditionalInfoList.Create;
end;

destructor TInvoiceTable_Item_AdditionalInfos.Destroy;
begin
  FAdditionalInfo.Free;
  inherited Destroy;
end;

  {  TTransferInfo  }
procedure TTransferInfo.SetOperationInfo(AValue: Tstring255);
begin
  FOperationInfo:=AValue;
  CheckStrMinSize('OperationInfo', AValue);
  CheckStrMaxSize('OperationInfo', AValue);
  ModifiedProperty('OperationInfo');
end;

procedure TTransferInfo.SetOperationType(AValue: Tstring255);
begin
  FOperationType:=AValue;
  CheckStrMinSize('OperationType', AValue);
  CheckStrMaxSize('OperationType', AValue);
  ModifiedProperty('OperationType');
end;

procedure TTransferInfo.SetTransferDate(AValue: Tdate1);
begin
  FTransferDate:=AValue;
  CheckStrMinSize('TransferDate', AValue);
  CheckStrMaxSize('TransferDate', AValue);
  ModifiedProperty('TransferDate');
end;

procedure TTransferInfo.SetTransferTextInfo(AValue: Tstring1000);
begin
  FTransferTextInfo:=AValue;
  CheckStrMinSize('TransferTextInfo', AValue);
  CheckStrMaxSize('TransferTextInfo', AValue);
  ModifiedProperty('TransferTextInfo');
end;

procedure TTransferInfo.SetCreatedThingTransferDate(AValue: Tdate1);
begin
  FCreatedThingTransferDate:=AValue;
  CheckStrMinSize('CreatedThingTransferDate', AValue);
  CheckStrMaxSize('CreatedThingTransferDate', AValue);
  ModifiedProperty('CreatedThingTransferDate');
end;

procedure TTransferInfo.SetCreatedThingInfo(AValue: Tstring1000);
begin
  FCreatedThingInfo:=AValue;
  CheckStrMinSize('CreatedThingInfo', AValue);
  CheckStrMaxSize('CreatedThingInfo', AValue);
  ModifiedProperty('CreatedThingInfo');
end;

procedure TTransferInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TransferBases', 'TransferBases', [], '', -1, -1);
  P:=RegisterProperty('Waybills', 'Waybills', [], '', -1, -1);
  P:=RegisterProperty('AdditionalInfoId', 'AdditionalInfoId', [], '', -1, -1);
  P:=RegisterProperty('Carrier', 'Carrier', [], '', -1, -1);
  P:=RegisterProperty('Employee', 'Employee', [], '', -1, -1);
  P:=RegisterProperty('OtherIssuer', 'OtherIssuer', [], '', -1, -1);
  P:=RegisterProperty('OperationInfo', 'OperationInfo', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('OperationType', 'OperationType', [], '', 1, 255);
  P:=RegisterProperty('TransferDate', 'TransferDate', [], '', 10, 10);
  P:=RegisterProperty('TransferTextInfo', 'TransferTextInfo', [], '', 1, 1000);
  P:=RegisterProperty('CreatedThingTransferDate', 'CreatedThingTransferDate', [], '', 10, 10);
  P:=RegisterProperty('CreatedThingInfo', 'CreatedThingInfo', [], '', 1, 1000);
end;

procedure TTransferInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FTransferBases:=TTransferInfo_TransferBases.Create;
  FWaybills:=TWaybills.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FCarrier:=TExtendedOrganizationInfo.Create;
  FEmployee:=TEmployee.Create;
  FOtherIssuer:=TOtherIssuer.Create;
end;

destructor TTransferInfo.Destroy;
begin
  FTransferBases.Free;
  FWaybills.Free;
  FAdditionalInfoId.Free;
  FCarrier.Free;
  FEmployee.Free;
  FOtherIssuer.Free;
  inherited Destroy;
end;

  {  TTransferInfo_TransferBases  }
procedure TTransferInfo_TransferBases.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TransferBase', 'TransferBase', [], '', -1, -1);
end;

procedure TTransferInfo_TransferBases.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FTransferBase:=TTransferBaseList.Create;
end;

destructor TTransferInfo_TransferBases.Destroy;
begin
  FTransferBase.Free;
  inherited Destroy;
end;

  {  TAdditionalInfoId  }
procedure TAdditionalInfoId.SetInfoFileId(AValue: String);
begin
  FInfoFileId:=AValue;
  CheckStrMaxSize('InfoFileId', AValue);
  ModifiedProperty('InfoFileId');
end;

procedure TAdditionalInfoId.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', -1, -1);
  P:=RegisterProperty('InfoFileId', 'InfoFileId', [], '', -1, 36);
end;

procedure TAdditionalInfoId.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAdditionalInfo:=TAdditionalInfoList.Create;
end;

destructor TAdditionalInfoId.Destroy;
begin
  FAdditionalInfo.Free;
  inherited Destroy;
end;

  {  TAdditionalInfo  }
procedure TAdditionalInfo.SetId(AValue: String);
begin
  FId:=AValue;
  CheckStrMinSize('Id', AValue);
  CheckStrMaxSize('Id', AValue);
  ModifiedProperty('Id');
end;

procedure TAdditionalInfo.SetValue(AValue: String);
begin
  FValue:=AValue;
  CheckStrMinSize('Value', AValue);
  CheckStrMaxSize('Value', AValue);
  ModifiedProperty('Value');
end;

procedure TAdditionalInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Id', 'Id', [xsaRequared], '', 1, 50);
  P:=RegisterProperty('Value', 'Value', [xsaRequared], '', 1, 2000);
end;

procedure TAdditionalInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TAdditionalInfo.Destroy;
begin
  inherited Destroy;
end;

  {  TCustomsDeclaration  }
procedure TCustomsDeclaration.SetCountry(AValue: Tstring1000);
begin
  FCountry:=AValue;
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  ModifiedProperty('Country');
end;

procedure TCustomsDeclaration.SetDeclarationNumber(AValue: Tstring1000);
begin
  FDeclarationNumber:=AValue;
  CheckStrMinSize('DeclarationNumber', AValue);
  CheckStrMaxSize('DeclarationNumber', AValue);
  ModifiedProperty('DeclarationNumber');
end;

procedure TCustomsDeclaration.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Country', 'Country', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('DeclarationNumber', 'DeclarationNumber', [xsaRequared], '', 1, 1000);
end;

procedure TCustomsDeclaration.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TCustomsDeclaration.Destroy;
begin
  inherited Destroy;
end;

  {  TCustomsDeclarationWithHyphens  }
procedure TCustomsDeclarationWithHyphens.SetCountry(AValue: Tstring1000);
begin
  FCountry:=AValue;
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  ModifiedProperty('Country');
end;

procedure TCustomsDeclarationWithHyphens.SetHyphenCountry(AValue: String);
begin
  FHyphenCountry:=AValue;
  CheckLockupValue('HyphenCountry', AValue);
  ModifiedProperty('HyphenCountry');
end;

procedure TCustomsDeclarationWithHyphens.SetDeclarationNumber(AValue: Tstring1000);
begin
  FDeclarationNumber:=AValue;
  CheckStrMinSize('DeclarationNumber', AValue);
  CheckStrMaxSize('DeclarationNumber', AValue);
  ModifiedProperty('DeclarationNumber');
end;

procedure TCustomsDeclarationWithHyphens.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Country', 'Country', [], '', 1, 1000);
  P:=RegisterProperty('HyphenCountry', 'HyphenCountry', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
  P:=RegisterProperty('DeclarationNumber', 'DeclarationNumber', [], '', 1, 1000);
end;

procedure TCustomsDeclarationWithHyphens.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TCustomsDeclarationWithHyphens.Destroy;
begin
  inherited Destroy;
end;

  {  TInvoiceTotalsDiff  }
procedure TInvoiceTotalsDiff.SetTotalWithVatExcluded(AValue: Double);
begin
  FTotalWithVatExcluded:=AValue;
  ModifiedProperty('TotalWithVatExcluded');
end;

procedure TInvoiceTotalsDiff.SetVat(AValue: Double);
begin
  FVat:=AValue;
  ModifiedProperty('Vat');
end;

procedure TInvoiceTotalsDiff.SetTotal(AValue: Double);
begin
  FTotal:=AValue;
  ModifiedProperty('Total');
end;

procedure TInvoiceTotalsDiff.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TotalWithVatExcluded', 'TotalWithVatExcluded', [], '', -1, -1);
  P:=RegisterProperty('Vat', 'Vat', [], '', -1, -1);
  P:=RegisterProperty('Total', 'Total', [xsaRequared], '', -1, -1);
end;

procedure TInvoiceTotalsDiff.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInvoiceTotalsDiff.Destroy;
begin
  inherited Destroy;
end;

  {  TInvoiceItemAmountsDiff  }
procedure TInvoiceItemAmountsDiff.SetExcise(AValue: Double);
begin
  FExcise:=AValue;
  ModifiedProperty('Excise');
end;

procedure TInvoiceItemAmountsDiff.SetSubtotalWithVatExcluded(AValue: Double);
begin
  FSubtotalWithVatExcluded:=AValue;
  ModifiedProperty('SubtotalWithVatExcluded');
end;

procedure TInvoiceItemAmountsDiff.SetVat(AValue: Double);
begin
  FVat:=AValue;
  ModifiedProperty('Vat');
end;

procedure TInvoiceItemAmountsDiff.SetSubtotal(AValue: Double);
begin
  FSubtotal:=AValue;
  ModifiedProperty('Subtotal');
end;

procedure TInvoiceItemAmountsDiff.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Excise', 'Excise', [], '', -1, -1);
  P:=RegisterProperty('SubtotalWithVatExcluded', 'SubtotalWithVatExcluded', [], '', -1, -1);
  P:=RegisterProperty('Vat', 'Vat', [], '', -1, -1);
  P:=RegisterProperty('Subtotal', 'Subtotal', [], '', -1, -1);
end;

procedure TInvoiceItemAmountsDiff.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInvoiceItemAmountsDiff.Destroy;
begin
  inherited Destroy;
end;

  {  TCorrectableInvoiceItemFields_WithoutTaxRate  }
procedure TCorrectableInvoiceItemFields_WithoutTaxRate.SetUnit1(AValue: String);
begin
  FUnit1:=AValue;
  ModifiedProperty('Unit1');
end;

procedure TCorrectableInvoiceItemFields_WithoutTaxRate.SetQuantity(AValue: Double);
begin
  FQuantity:=AValue;
  ModifiedProperty('Quantity');
end;

procedure TCorrectableInvoiceItemFields_WithoutTaxRate.SetPrice(AValue: Double);
begin
  FPrice:=AValue;
  ModifiedProperty('Price');
end;

procedure TCorrectableInvoiceItemFields_WithoutTaxRate.SetExcise(AValue: Double);
begin
  FExcise:=AValue;
  ModifiedProperty('Excise');
end;

procedure TCorrectableInvoiceItemFields_WithoutTaxRate.SetSubtotalWithVatExcluded(AValue: Double);
begin
  FSubtotalWithVatExcluded:=AValue;
  ModifiedProperty('SubtotalWithVatExcluded');
end;

procedure TCorrectableInvoiceItemFields_WithoutTaxRate.SetVat(AValue: Double);
begin
  FVat:=AValue;
  ModifiedProperty('Vat');
end;

procedure TCorrectableInvoiceItemFields_WithoutTaxRate.SetSubtotal(AValue: Double);
begin
  FSubtotal:=AValue;
  ModifiedProperty('Subtotal');
end;

procedure TCorrectableInvoiceItemFields_WithoutTaxRate.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Unit1', 'Unit', [], '', -1, -1);
  P:=RegisterProperty('Quantity', 'Quantity', [], '', -1, -1);
  P:=RegisterProperty('Price', 'Price', [], '', -1, -1);
  P:=RegisterProperty('Excise', 'Excise', [], '', -1, -1);
  P:=RegisterProperty('SubtotalWithVatExcluded', 'SubtotalWithVatExcluded', [], '', -1, -1);
  P:=RegisterProperty('Vat', 'Vat', [], '', -1, -1);
  P:=RegisterProperty('Subtotal', 'Subtotal', [xsaRequared], '', -1, -1);
end;

procedure TCorrectableInvoiceItemFields_WithoutTaxRate.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TCorrectableInvoiceItemFields_WithoutTaxRate.Destroy;
begin
  inherited Destroy;
end;

  {  TCorrectableInvoiceItemFields  }
procedure TCorrectableInvoiceItemFields.SetTaxRate(AValue: TTaxRate);
begin
  FTaxRate:=AValue;
  CheckLockupValue('TaxRate', AValue);
  ModifiedProperty('TaxRate');
end;

procedure TCorrectableInvoiceItemFields.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TaxRate', 'TaxRate', [xsaRequared], '', -1, -1);
    P.ValidList.Add('без НДС');
    P.ValidList.Add('0%');
    P.ValidList.Add('10%');
    P.ValidList.Add('18%');
    P.ValidList.Add('10/110');
    P.ValidList.Add('18/118');
end;

procedure TCorrectableInvoiceItemFields.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TCorrectableInvoiceItemFields.Destroy;
begin
  inherited Destroy;
end;

  {  TCorrectableInvoiceItemFields_WithTwentyPercent  }
procedure TCorrectableInvoiceItemFields_WithTwentyPercent.SetTaxRate(AValue: TTaxRateWithTwentyPercent);
begin
  FTaxRate:=AValue;
  CheckLockupValue('TaxRate', AValue);
  ModifiedProperty('TaxRate');
end;

procedure TCorrectableInvoiceItemFields_WithTwentyPercent.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TaxRate', 'TaxRate', [xsaRequared], '', -1, -1);
    P.ValidList.Add('без НДС');
    P.ValidList.Add('0%');
    P.ValidList.Add('10%');
    P.ValidList.Add('18%');
    P.ValidList.Add('20%');
    P.ValidList.Add('10/110');
    P.ValidList.Add('18/118');
    P.ValidList.Add('20/120');
end;

procedure TCorrectableInvoiceItemFields_WithTwentyPercent.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TCorrectableInvoiceItemFields_WithTwentyPercent.Destroy;
begin
  inherited Destroy;
end;

  {  TCorrectableInvoiceItemFields_WithTaxedByAgent  }
procedure TCorrectableInvoiceItemFields_WithTaxedByAgent.SetTaxRate(AValue: TTaxRateWithTaxedByAgent);
begin
  FTaxRate:=AValue;
  CheckLockupValue('TaxRate', AValue);
  ModifiedProperty('TaxRate');
end;

procedure TCorrectableInvoiceItemFields_WithTaxedByAgent.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TaxRate', 'TaxRate', [xsaRequared], '', -1, -1);
    P.ValidList.Add('без НДС');
    P.ValidList.Add('0%');
    P.ValidList.Add('10%');
    P.ValidList.Add('18%');
    P.ValidList.Add('10/110');
    P.ValidList.Add('18/118');
    P.ValidList.Add('НДС исчисляется налоговым агентом');
end;

procedure TCorrectableInvoiceItemFields_WithTaxedByAgent.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TCorrectableInvoiceItemFields_WithTaxedByAgent.Destroy;
begin
  inherited Destroy;
end;

  {  TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent  }
procedure TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent.SetTaxRate(AValue: TTaxRateWithTwentyPercentAndTaxedByAgent);
begin
  FTaxRate:=AValue;
  CheckLockupValue('TaxRate', AValue);
  ModifiedProperty('TaxRate');
end;

procedure TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TaxRate', 'TaxRate', [xsaRequared], '', -1, -1);
    P.ValidList.Add('без НДС');
    P.ValidList.Add('0%');
    P.ValidList.Add('10%');
    P.ValidList.Add('18%');
    P.ValidList.Add('20%');
    P.ValidList.Add('10/110');
    P.ValidList.Add('18/118');
    P.ValidList.Add('20/120');
    P.ValidList.Add('НДС исчисляется налоговым агентом');
end;

procedure TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent.Destroy;
begin
  inherited Destroy;
end;

  {  TAttorney  }
procedure TAttorney.SetDate(AValue: Tdate1);
begin
  FDate:=AValue;
  CheckStrMinSize('Date', AValue);
  CheckStrMaxSize('Date', AValue);
  ModifiedProperty('Date');
end;

procedure TAttorney.SetNumber(AValue: Tstring255);
begin
  FNumber:=AValue;
  CheckStrMinSize('Number', AValue);
  CheckStrMaxSize('Number', AValue);
  ModifiedProperty('Number');
end;

procedure TAttorney.SetIssuerOrganizationName(AValue: Tstring1000);
begin
  FIssuerOrganizationName:=AValue;
  CheckStrMinSize('IssuerOrganizationName', AValue);
  CheckStrMaxSize('IssuerOrganizationName', AValue);
  ModifiedProperty('IssuerOrganizationName');
end;

procedure TAttorney.SetIssuerAdditionalInfo(AValue: Tstring1000);
begin
  FIssuerAdditionalInfo:=AValue;
  CheckStrMinSize('IssuerAdditionalInfo', AValue);
  CheckStrMaxSize('IssuerAdditionalInfo', AValue);
  ModifiedProperty('IssuerAdditionalInfo');
end;

procedure TAttorney.SetRecipientAdditionalInfo(AValue: Tstring1000);
begin
  FRecipientAdditionalInfo:=AValue;
  CheckStrMinSize('RecipientAdditionalInfo', AValue);
  CheckStrMaxSize('RecipientAdditionalInfo', AValue);
  ModifiedProperty('RecipientAdditionalInfo');
end;

procedure TAttorney.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('IssuerPerson', 'IssuerPerson', [], '', -1, -1);
  P:=RegisterProperty('RecipientPerson', 'RecipientPerson', [], '', -1, -1);
  P:=RegisterProperty('Date', 'Date', [], '', 10, 10);
  P:=RegisterProperty('Number', 'Number', [], '', 1, 255);
  P:=RegisterProperty('IssuerOrganizationName', 'IssuerOrganizationName', [], '', 1, 1000);
  P:=RegisterProperty('IssuerAdditionalInfo', 'IssuerAdditionalInfo', [], '', 1, 1000);
  P:=RegisterProperty('RecipientAdditionalInfo', 'RecipientAdditionalInfo', [], '', 1, 1000);
end;

procedure TAttorney.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FIssuerPerson:=TOfficial.Create;
  FRecipientPerson:=TOfficial.Create;
end;

destructor TAttorney.Destroy;
begin
  FIssuerPerson.Free;
  FRecipientPerson.Free;
  inherited Destroy;
end;

  {  TOfficial  }
procedure TOfficial.SetLastName(AValue: Tstring60);
begin
  FLastName:=AValue;
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  ModifiedProperty('LastName');
end;

procedure TOfficial.SetFirstName(AValue: Tstring60);
begin
  FFirstName:=AValue;
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  ModifiedProperty('FirstName');
end;

procedure TOfficial.SetMiddleName(AValue: Tstring60);
begin
  FMiddleName:=AValue;
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  ModifiedProperty('MiddleName');
end;

procedure TOfficial.SetPosition(AValue: Tstring128z);
begin
  FPosition:=AValue;
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  ModifiedProperty('Position');
end;

procedure TOfficial.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 60);
  P:=RegisterProperty('Position', 'Position', [], '', 0, 128);
end;

procedure TOfficial.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TOfficial.Destroy;
begin
  inherited Destroy;
end;

  {  TAcceptanceCertificateSignatureInfo  }
procedure TAcceptanceCertificateSignatureInfo.SetSignatureDate(AValue: Tdate1);
begin
  FSignatureDate:=AValue;
  CheckStrMinSize('SignatureDate', AValue);
  CheckStrMaxSize('SignatureDate', AValue);
  ModifiedProperty('SignatureDate');
end;

procedure TAcceptanceCertificateSignatureInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Official', 'Official', [], '', -1, -1);
  P:=RegisterProperty('Attorney', 'Attorney', [], '', -1, -1);
  P:=RegisterProperty('SignatureDate', 'SignatureDate', [], '', 10, 10);
end;

procedure TAcceptanceCertificateSignatureInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOfficial:=TOfficial.Create;
  FAttorney:=TAttorney.Create;
end;

destructor TAcceptanceCertificateSignatureInfo.Destroy;
begin
  FOfficial.Free;
  FAttorney.Free;
  inherited Destroy;
end;

  {  TPaymentDocumentInfo  }
procedure TPaymentDocumentInfo.SetDate(AValue: Tdate1);
begin
  FDate:=AValue;
  CheckStrMinSize('Date', AValue);
  CheckStrMaxSize('Date', AValue);
  ModifiedProperty('Date');
end;

procedure TPaymentDocumentInfo.SetNumber(AValue: Tstring30);
begin
  FNumber:=AValue;
  CheckStrMinSize('Number', AValue);
  CheckStrMaxSize('Number', AValue);
  ModifiedProperty('Number');
end;

procedure TPaymentDocumentInfo.SetTotal(AValue: Double);
begin
  FTotal:=AValue;
  ModifiedProperty('Total');
end;

procedure TPaymentDocumentInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Date', 'Date', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('Number', 'Number', [xsaRequared], '', 1, 30);
  P:=RegisterProperty('Total', 'Total', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
end;

procedure TPaymentDocumentInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TPaymentDocumentInfo.Destroy;
begin
  inherited Destroy;
end;

  {  TGroundInfo  }
procedure TGroundInfo.SetName(AValue: Tstring255);
begin
  FName:=AValue;
  CheckStrMinSize('Name', AValue);
  CheckStrMaxSize('Name', AValue);
  ModifiedProperty('Name');
end;

procedure TGroundInfo.SetNumber(AValue: Tstring255);
begin
  FNumber:=AValue;
  CheckStrMinSize('Number', AValue);
  CheckStrMaxSize('Number', AValue);
  ModifiedProperty('Number');
end;

procedure TGroundInfo.SetDate(AValue: Tdate1);
begin
  FDate:=AValue;
  CheckStrMinSize('Date', AValue);
  CheckStrMaxSize('Date', AValue);
  ModifiedProperty('Date');
end;

procedure TGroundInfo.SetInfo(AValue: Tstring1000);
begin
  FInfo:=AValue;
  CheckStrMinSize('Info', AValue);
  CheckStrMaxSize('Info', AValue);
  ModifiedProperty('Info');
end;

procedure TGroundInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Name', 'Name', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('Number', 'Number', [], '', 1, 255);
  P:=RegisterProperty('Date', 'Date', [], '', 10, 10);
  P:=RegisterProperty('Info', 'Info', [], '', 1, 1000);
end;

procedure TGroundInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TGroundInfo.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedOrganizationInfo  }
procedure TExtendedOrganizationInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrganizationDetails', 'OrganizationDetails', [], '', -1, -1);
  P:=RegisterProperty('OrganizationReference', 'OrganizationReference', [], '', -1, -1);
end;

procedure TExtendedOrganizationInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TExtendedOrganizationDetails.Create;
  FOrganizationReference:=TExtendedOrganizationReference.Create;
end;

destructor TExtendedOrganizationInfo.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

  {  TExtendedOrganizationDetails_ManualFilling  }
procedure TExtendedOrganizationDetails_ManualFilling.SetOrgType(AValue: TOrganizationType);
begin
  FOrgType:=AValue;
  CheckLockupValue('OrgType', AValue);
  ModifiedProperty('OrgType');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOkopf(AValue: String);
begin
  FOkopf:=AValue;
  ModifiedProperty('Okopf');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOkpo(AValue: String);
begin
  FOkpo:=AValue;
  CheckStrMinSize('Okpo', AValue);
  CheckStrMaxSize('Okpo', AValue);
  ModifiedProperty('Okpo');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOkdp(AValue: String);
begin
  FOkdp:=AValue;
  CheckStrMinSize('Okdp', AValue);
  CheckStrMaxSize('Okdp', AValue);
  ModifiedProperty('Okdp');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetPhone(AValue: Tstring255);
begin
  FPhone:=AValue;
  CheckStrMinSize('Phone', AValue);
  CheckStrMaxSize('Phone', AValue);
  ModifiedProperty('Phone');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetEmail(AValue: Tstring255);
begin
  FEmail:=AValue;
  CheckStrMinSize('Email', AValue);
  CheckStrMaxSize('Email', AValue);
  ModifiedProperty('Email');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetCorrespondentAccount(AValue: Tstring20);
begin
  FCorrespondentAccount:=AValue;
  CheckStrMinSize('CorrespondentAccount', AValue);
  CheckStrMaxSize('CorrespondentAccount', AValue);
  ModifiedProperty('CorrespondentAccount');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetBankAccountNumber(AValue: Tstring20);
begin
  FBankAccountNumber:=AValue;
  CheckStrMinSize('BankAccountNumber', AValue);
  CheckStrMaxSize('BankAccountNumber', AValue);
  ModifiedProperty('BankAccountNumber');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetBankName(AValue: Tstring1000);
begin
  FBankName:=AValue;
  CheckStrMinSize('BankName', AValue);
  CheckStrMaxSize('BankName', AValue);
  ModifiedProperty('BankName');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetBankId(AValue: String);
begin
  FBankId:=AValue;
  CheckStrMinSize('BankId', AValue);
  CheckStrMaxSize('BankId', AValue);
  ModifiedProperty('BankId');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetDepartment(AValue: Tstring1000);
begin
  FDepartment:=AValue;
  CheckStrMinSize('Department', AValue);
  CheckStrMaxSize('Department', AValue);
  ModifiedProperty('Department');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOrganizationAdditionalInfo(AValue: Tstring255);
begin
  FOrganizationAdditionalInfo:=AValue;
  CheckStrMinSize('OrganizationAdditionalInfo', AValue);
  CheckStrMaxSize('OrganizationAdditionalInfo', AValue);
  ModifiedProperty('OrganizationAdditionalInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOrganizationOrPersonInfo(AValue: Tstring255);
begin
  FOrganizationOrPersonInfo:=AValue;
  CheckStrMinSize('OrganizationOrPersonInfo', AValue);
  CheckStrMaxSize('OrganizationOrPersonInfo', AValue);
  ModifiedProperty('OrganizationOrPersonInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetIndividualEntityRegistrationCertificate(AValue: Tstring100);
begin
  FIndividualEntityRegistrationCertificate:=AValue;
  CheckStrMinSize('IndividualEntityRegistrationCertificate', AValue);
  CheckStrMaxSize('IndividualEntityRegistrationCertificate', AValue);
  ModifiedProperty('IndividualEntityRegistrationCertificate');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetLegalEntityId(AValue: Tstring255);
begin
  FLegalEntityId:=AValue;
  CheckStrMinSize('LegalEntityId', AValue);
  CheckStrMaxSize('LegalEntityId', AValue);
  ModifiedProperty('LegalEntityId');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetShortOrgName(AValue: Tstring255);
begin
  FShortOrgName:=AValue;
  CheckStrMinSize('ShortOrgName', AValue);
  CheckStrMaxSize('ShortOrgName', AValue);
  ModifiedProperty('ShortOrgName');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetCountry(AValue: Tstring255);
begin
  FCountry:=AValue;
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  ModifiedProperty('Country');
end;

procedure TExtendedOrganizationDetails_ManualFilling.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrgType', 'OrgType', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
  P:=RegisterProperty('Okopf', 'Okopf', [], '', -1, -1);
  P:=RegisterProperty('Okpo', 'Okpo', [], '', 1, 10);
  P:=RegisterProperty('Okdp', 'Okdp', [], '', 1, 7);
  P:=RegisterProperty('Phone', 'Phone', [], '', 1, 255);
  P:=RegisterProperty('Email', 'Email', [], '', 1, 255);
  P:=RegisterProperty('CorrespondentAccount', 'CorrespondentAccount', [], '', 1, 20);
  P:=RegisterProperty('BankAccountNumber', 'BankAccountNumber', [], '', 1, 20);
  P:=RegisterProperty('BankName', 'BankName', [], '', 1, 1000);
  P:=RegisterProperty('BankId', 'BankId', [], '', 9, 9);
  P:=RegisterProperty('Department', 'Department', [], '', 1, 1000);
  P:=RegisterProperty('OrganizationAdditionalInfo', 'OrganizationAdditionalInfo', [], '', 1, 255);
  P:=RegisterProperty('OrganizationOrPersonInfo', 'OrganizationOrPersonInfo', [], '', 1, 255);
  P:=RegisterProperty('IndividualEntityRegistrationCertificate', 'IndividualEntityRegistrationCertificate', [], '', 1, 100);
  P:=RegisterProperty('LegalEntityId', 'LegalEntityId', [], '', 1, 255);
  P:=RegisterProperty('ShortOrgName', 'ShortOrgName', [], '', 1, 255);
  P:=RegisterProperty('Country', 'Country', [], '', 1, 255);
end;

procedure TExtendedOrganizationDetails_ManualFilling.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationDetails_ManualFilling.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedOrganizationReference  }
procedure TExtendedOrganizationReference.SetBoxId(AValue: Tguid);
begin
  FBoxId:=AValue;
  ModifiedProperty('BoxId');
end;

procedure TExtendedOrganizationReference.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BoxId', 'BoxId', [xsaRequared], '', -1, -1);
end;

procedure TExtendedOrganizationReference.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationReference.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedOrganizationDetails  }
procedure TExtendedOrganizationDetails.SetOrgName(AValue: Tstring1000);
begin
  FOrgName:=AValue;
  CheckStrMinSize('OrgName', AValue);
  CheckStrMaxSize('OrgName', AValue);
  ModifiedProperty('OrgName');
end;

procedure TExtendedOrganizationDetails.SetInn(AValue: Tstring60);
begin
  FInn:=AValue;
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  ModifiedProperty('Inn');
end;

procedure TExtendedOrganizationDetails.SetKpp(AValue: Tstring1000);
begin
  FKpp:=AValue;
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  ModifiedProperty('Kpp');
end;

procedure TExtendedOrganizationDetails.SetFnsParticipantId(AValue: Tstring1000);
begin
  FFnsParticipantId:=AValue;
  CheckStrMinSize('FnsParticipantId', AValue);
  CheckStrMaxSize('FnsParticipantId', AValue);
  ModifiedProperty('FnsParticipantId');
end;

procedure TExtendedOrganizationDetails.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Address', 'Address', [], '', -1, -1);
  P:=RegisterProperty('OrgName', 'OrgName', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('Inn', 'Inn', [], '', 1, 60);
  P:=RegisterProperty('Kpp', 'Kpp', [], '', 1, 1000);
  P:=RegisterProperty('FnsParticipantId', 'FnsParticipantId', [], '', 1, 1000);
end;

procedure TExtendedOrganizationDetails.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAddress:=TAddress.Create;
end;

destructor TExtendedOrganizationDetails.Destroy;
begin
  FAddress.Free;
  inherited Destroy;
end;

  {  TExtendedOrganizationInfoWithHyphens  }
procedure TExtendedOrganizationInfoWithHyphens.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrganizationDetails', 'OrganizationDetails', [], '', -1, -1);
  P:=RegisterProperty('OrganizationReference', 'OrganizationReference', [], '', -1, -1);
end;

procedure TExtendedOrganizationInfoWithHyphens.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TExtendedOrganizationDetailsWithHyphens.Create;
  FOrganizationReference:=TExtendedOrganizationReference.Create;
end;

destructor TExtendedOrganizationInfoWithHyphens.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

  {  TExtendedOrganizationDetailsWithHyphens  }
procedure TExtendedOrganizationDetailsWithHyphens.SetHyphenInn(AValue: String);
begin
  FHyphenInn:=AValue;
  CheckLockupValue('HyphenInn', AValue);
  ModifiedProperty('HyphenInn');
end;

procedure TExtendedOrganizationDetailsWithHyphens.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('HyphenInn', 'HyphenInn', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
end;

procedure TExtendedOrganizationDetailsWithHyphens.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationDetailsWithHyphens.Destroy;
begin
  inherited Destroy;
end;

  {  TAddress  }
procedure TAddress.SetAddressCode(AValue: Tstring36);
begin
  FAddressCode:=AValue;
  CheckStrMinSize('AddressCode', AValue);
  CheckStrMaxSize('AddressCode', AValue);
  ModifiedProperty('AddressCode');
end;

procedure TAddress.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('RussianAddress', 'RussianAddress', [], '', -1, -1);
  P:=RegisterProperty('ForeignAddress', 'ForeignAddress', [], '', -1, -1);
  P:=RegisterProperty('AddressCode', 'AddressCode', [xsaSimpleObject], '', 1, 36);
end;

procedure TAddress.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FRussianAddress:=TRussianAddress.Create;
  FForeignAddress:=TForeignAddress.Create;
end;

destructor TAddress.Destroy;
begin
  FRussianAddress.Free;
  FForeignAddress.Free;
  inherited Destroy;
end;

  {  TRussianAddress  }
procedure TRussianAddress.SetZipCode(AValue: String);
begin
  FZipCode:=AValue;
  CheckStrMinSize('ZipCode', AValue);
  CheckStrMaxSize('ZipCode', AValue);
  ModifiedProperty('ZipCode');
end;

procedure TRussianAddress.SetRegion(AValue: Tstring50);
begin
  FRegion:=AValue;
  CheckStrMinSize('Region', AValue);
  CheckStrMaxSize('Region', AValue);
  ModifiedProperty('Region');
end;

procedure TRussianAddress.SetTerritory(AValue: Tstring50);
begin
  FTerritory:=AValue;
  CheckStrMinSize('Territory', AValue);
  CheckStrMaxSize('Territory', AValue);
  ModifiedProperty('Territory');
end;

procedure TRussianAddress.SetCity(AValue: Tstring50);
begin
  FCity:=AValue;
  CheckStrMinSize('City', AValue);
  CheckStrMaxSize('City', AValue);
  ModifiedProperty('City');
end;

procedure TRussianAddress.SetLocality(AValue: Tstring50);
begin
  FLocality:=AValue;
  CheckStrMinSize('Locality', AValue);
  CheckStrMaxSize('Locality', AValue);
  ModifiedProperty('Locality');
end;

procedure TRussianAddress.SetStreet(AValue: Tstring50);
begin
  FStreet:=AValue;
  CheckStrMinSize('Street', AValue);
  CheckStrMaxSize('Street', AValue);
  ModifiedProperty('Street');
end;

procedure TRussianAddress.SetBuilding(AValue: Tstring20);
begin
  FBuilding:=AValue;
  CheckStrMinSize('Building', AValue);
  CheckStrMaxSize('Building', AValue);
  ModifiedProperty('Building');
end;

procedure TRussianAddress.SetBlock(AValue: Tstring20);
begin
  FBlock:=AValue;
  CheckStrMinSize('Block', AValue);
  CheckStrMaxSize('Block', AValue);
  ModifiedProperty('Block');
end;

procedure TRussianAddress.SetApartment(AValue: Tstring20);
begin
  FApartment:=AValue;
  CheckStrMinSize('Apartment', AValue);
  CheckStrMaxSize('Apartment', AValue);
  ModifiedProperty('Apartment');
end;

procedure TRussianAddress.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ZipCode', 'ZipCode', [], '', 6, 6);
  P:=RegisterProperty('Region', 'Region', [xsaRequared], '', 1, 50);
  P:=RegisterProperty('Territory', 'Territory', [], '', 1, 50);
  P:=RegisterProperty('City', 'City', [], '', 1, 50);
  P:=RegisterProperty('Locality', 'Locality', [], '', 1, 50);
  P:=RegisterProperty('Street', 'Street', [], '', 1, 50);
  P:=RegisterProperty('Building', 'Building', [], '', 1, 20);
  P:=RegisterProperty('Block', 'Block', [], '', 1, 20);
  P:=RegisterProperty('Apartment', 'Apartment', [], '', 1, 20);
end;

procedure TRussianAddress.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TRussianAddress.Destroy;
begin
  inherited Destroy;
end;

  {  TForeignAddress  }
procedure TForeignAddress.SetCountry(AValue: Tstring60);
begin
  FCountry:=AValue;
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  ModifiedProperty('Country');
end;

procedure TForeignAddress.SetAddress(AValue: Tstring255);
begin
  FAddress:=AValue;
  CheckStrMinSize('Address', AValue);
  CheckStrMaxSize('Address', AValue);
  ModifiedProperty('Address');
end;

procedure TForeignAddress.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Country', 'Country', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('Address', 'Address', [xsaRequared], '', 1, 255);
end;

procedure TForeignAddress.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TForeignAddress.Destroy;
begin
  inherited Destroy;
end;

  {  TSignerInfo  }
procedure TSignerInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerDetails', 'SignerDetails', [], '', -1, -1);
  P:=RegisterProperty('SignerReference', 'SignerReference', [], '', -1, -1);
end;

procedure TSignerInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSignerDetails:=TSignerDetails.Create;
  FSignerReference:=TSignerReferenceInfo.Create;
end;

destructor TSignerInfo.Destroy;
begin
  FSignerDetails.Free;
  FSignerReference.Free;
  inherited Destroy;
end;

  {  TSignerDetails  }
procedure TSignerDetails.SetLastName(AValue: String);
begin
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TSignerDetails.SetFirstName(AValue: String);
begin
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TSignerDetails.SetMiddleName(AValue: String);
begin
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TSignerDetails.SetPosition(AValue: String);
begin
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TSignerDetails.SetInn(AValue: String);
begin
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TSignerDetails.SetSoleProprietorRegistrationCertificate(AValue: String);
begin
  FSoleProprietorRegistrationCertificate:=AValue;
  ModifiedProperty('SoleProprietorRegistrationCertificate');
end;

procedure TSignerDetails.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', -1, -1);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', -1, -1);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', -1, -1);
  P:=RegisterProperty('Position', 'Position', [], '', -1, -1);
  P:=RegisterProperty('Inn', 'Inn', [xsaRequared], '', -1, -1);
  P:=RegisterProperty('SoleProprietorRegistrationCertificate', 'SoleProprietorRegistrationCertificate', [], '', -1, -1);
end;

procedure TSignerDetails.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TSignerDetails.Destroy;
begin
  inherited Destroy;
end;

  {  TSignerReferenceInfo  }
procedure TSignerReferenceInfo.SetCertificateBytes(AValue: String);
begin
  FCertificateBytes:=AValue;
  ModifiedProperty('CertificateBytes');
end;

procedure TSignerReferenceInfo.SetCertificateThumbprint(AValue: Tstring100);
begin
  FCertificateThumbprint:=AValue;
  CheckStrMinSize('CertificateThumbprint', AValue);
  CheckStrMaxSize('CertificateThumbprint', AValue);
  ModifiedProperty('CertificateThumbprint');
end;

procedure TSignerReferenceInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CertificateBytes', 'CertificateBytes', [], '', -1, -1);
  P:=RegisterProperty('CertificateThumbprint', 'CertificateThumbprint', [], '', 1, 100);
end;

procedure TSignerReferenceInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TSignerReferenceInfo.Destroy;
begin
  inherited Destroy;
end;

  {  TSignerReference  }
procedure TSignerReference.SetBoxId(AValue: Tstring100);
begin
  FBoxId:=AValue;
  CheckStrMinSize('BoxId', AValue);
  CheckStrMaxSize('BoxId', AValue);
  ModifiedProperty('BoxId');
end;

procedure TSignerReference.SetCertificateBytes(AValue: String);
begin
  FCertificateBytes:=AValue;
  ModifiedProperty('CertificateBytes');
end;

procedure TSignerReference.SetCertificateThumbprint(AValue: Tstring100);
begin
  FCertificateThumbprint:=AValue;
  CheckStrMinSize('CertificateThumbprint', AValue);
  CheckStrMaxSize('CertificateThumbprint', AValue);
  ModifiedProperty('CertificateThumbprint');
end;

procedure TSignerReference.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BoxId', 'BoxId', [xsaRequared], '', 1, 100);
  P:=RegisterProperty('CertificateBytes', 'CertificateBytes', [], '', -1, -1);
  P:=RegisterProperty('CertificateThumbprint', 'CertificateThumbprint', [], '', 1, 100);
end;

procedure TSignerReference.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TSignerReference.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedSignerDetailsBase  }
procedure TExtendedSignerDetailsBase.SetLastName(AValue: Tstring60);
begin
  FLastName:=AValue;
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  ModifiedProperty('LastName');
end;

procedure TExtendedSignerDetailsBase.SetFirstName(AValue: Tstring60);
begin
  FFirstName:=AValue;
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  ModifiedProperty('FirstName');
end;

procedure TExtendedSignerDetailsBase.SetMiddleName(AValue: Tstring60);
begin
  FMiddleName:=AValue;
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  ModifiedProperty('MiddleName');
end;

procedure TExtendedSignerDetailsBase.SetPosition(AValue: Tstring128z);
begin
  FPosition:=AValue;
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  ModifiedProperty('Position');
end;

procedure TExtendedSignerDetailsBase.SetInn(AValue: String);
begin
  FInn:=AValue;
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  ModifiedProperty('Inn');
end;

procedure TExtendedSignerDetailsBase.SetRegistrationCertificate(AValue: Tstring100);
begin
  FRegistrationCertificate:=AValue;
  CheckStrMinSize('RegistrationCertificate', AValue);
  CheckStrMaxSize('RegistrationCertificate', AValue);
  ModifiedProperty('RegistrationCertificate');
end;

procedure TExtendedSignerDetailsBase.SetSignerType(AValue: String);
begin
  FSignerType:=AValue;
  CheckLockupValue('SignerType', AValue);
  ModifiedProperty('SignerType');
end;

procedure TExtendedSignerDetailsBase.SetSignerOrganizationName(AValue: Tstring1000);
begin
  FSignerOrganizationName:=AValue;
  CheckStrMinSize('SignerOrganizationName', AValue);
  CheckStrMaxSize('SignerOrganizationName', AValue);
  ModifiedProperty('SignerOrganizationName');
end;

procedure TExtendedSignerDetailsBase.SetSignerInfo(AValue: Tstring255);
begin
  FSignerInfo:=AValue;
  CheckStrMinSize('SignerInfo', AValue);
  CheckStrMaxSize('SignerInfo', AValue);
  ModifiedProperty('SignerInfo');
end;

procedure TExtendedSignerDetailsBase.SetSignerPowersBase(AValue: Tstring255);
begin
  FSignerPowersBase:=AValue;
  CheckStrMinSize('SignerPowersBase', AValue);
  CheckStrMaxSize('SignerPowersBase', AValue);
  ModifiedProperty('SignerPowersBase');
end;

procedure TExtendedSignerDetailsBase.SetSignerOrgPowersBase(AValue: Tstring255);
begin
  FSignerOrgPowersBase:=AValue;
  CheckStrMinSize('SignerOrgPowersBase', AValue);
  CheckStrMaxSize('SignerOrgPowersBase', AValue);
  ModifiedProperty('SignerOrgPowersBase');
end;

procedure TExtendedSignerDetailsBase.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 60);
  P:=RegisterProperty('Position', 'Position', [], '', 0, 128);
  P:=RegisterProperty('Inn', 'Inn', [], '', 10, 12);
  P:=RegisterProperty('RegistrationCertificate', 'RegistrationCertificate', [], '', 1, 100);
  P:=RegisterProperty('SignerType', 'SignerType', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
  P:=RegisterProperty('SignerOrganizationName', 'SignerOrganizationName', [], '', 1, 1000);
  P:=RegisterProperty('SignerInfo', 'SignerInfo', [], '', 1, 255);
  P:=RegisterProperty('SignerPowersBase', 'SignerPowersBase', [], '', 1, 255);
  P:=RegisterProperty('SignerOrgPowersBase', 'SignerOrgPowersBase', [], '', 1, 255);
end;

procedure TExtendedSignerDetailsBase.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetailsBase.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedSignerDetails  }
procedure TExtendedSignerDetails.SetSignerStatus(AValue: Longint);
begin
  FSignerStatus:=AValue;
  CheckLockupValue('SignerStatus', AValue);
  ModifiedProperty('SignerStatus');
end;

procedure TExtendedSignerDetails.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerStatus', 'SignerStatus', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
end;

procedure TExtendedSignerDetails.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedSignerDetails_SellerTitle  }
procedure TExtendedSignerDetails_SellerTitle.SetSignerPowers(AValue: Longint);
begin
  FSignerPowers:=AValue;
  CheckLockupValue('SignerPowers', AValue);
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_SellerTitle.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerPowers', 'SignerPowers', [xsaRequared], '', -1, -1);
    P.ValidList.Add('0');
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
    P.ValidList.Add('5');
    P.ValidList.Add('6');
end;

procedure TExtendedSignerDetails_SellerTitle.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails_SellerTitle.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedSignerDetails_BuyerTitle  }
procedure TExtendedSignerDetails_BuyerTitle.SetSignerPowers(AValue: Longint);
begin
  FSignerPowers:=AValue;
  CheckLockupValue('SignerPowers', AValue);
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_BuyerTitle.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerPowers', 'SignerPowers', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
end;

procedure TExtendedSignerDetails_BuyerTitle.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails_BuyerTitle.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedSignerDetails_BuyerTitle820  }
procedure TExtendedSignerDetails_BuyerTitle820.SetSignerPowers(AValue: Longint);
begin
  FSignerPowers:=AValue;
  CheckLockupValue('SignerPowers', AValue);
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_BuyerTitle820.SetSignerStatus(AValue: Longint);
begin
  FSignerStatus:=AValue;
  CheckLockupValue('SignerStatus', AValue);
  ModifiedProperty('SignerStatus');
end;

procedure TExtendedSignerDetails_BuyerTitle820.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerPowers', 'SignerPowers', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
  P:=RegisterProperty('SignerStatus', 'SignerStatus', [xsaRequared], '', -1, -1);
    P.ValidList.Add('3');
    P.ValidList.Add('4');
    P.ValidList.Add('5');
    P.ValidList.Add('6');
end;

procedure TExtendedSignerDetails_BuyerTitle820.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails_BuyerTitle820.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedSignerDetails_CorrectionSellerTitle  }
procedure TExtendedSignerDetails_CorrectionSellerTitle.SetSignerPowers(AValue: Longint);
begin
  FSignerPowers:=AValue;
  CheckLockupValue('SignerPowers', AValue);
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_CorrectionSellerTitle.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerPowers', 'SignerPowers', [xsaRequared], '', -1, -1);
    P.ValidList.Add('0');
    P.ValidList.Add('3');
    P.ValidList.Add('6');
end;

procedure TExtendedSignerDetails_CorrectionSellerTitle.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails_CorrectionSellerTitle.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedSignerDetails_CorrectionBuyerTitle  }
procedure TExtendedSignerDetails_CorrectionBuyerTitle.SetSignerPowers(AValue: Longint);
begin
  FSignerPowers:=AValue;
  CheckLockupValue('SignerPowers', AValue);
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_CorrectionBuyerTitle.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerPowers', 'SignerPowers', [xsaRequared], '', -1, -1);
    P.ValidList.Add('3');
end;

procedure TExtendedSignerDetails_CorrectionBuyerTitle.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails_CorrectionBuyerTitle.Destroy;
begin
  inherited Destroy;
end;

  {  TExtendedSignerDetails_551_552  }
procedure TExtendedSignerDetails_551_552.SetSignerPowers(AValue: Longint);
begin
  FSignerPowers:=AValue;
  CheckLockupValue('SignerPowers', AValue);
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_551_552.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerPowers', 'SignerPowers', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
end;

procedure TExtendedSignerDetails_551_552.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails_551_552.Destroy;
begin
  inherited Destroy;
end;

  {  TEmployee  }
procedure TEmployee.SetPosition(AValue: Tstring128z);
begin
  FPosition:=AValue;
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  ModifiedProperty('Position');
end;

procedure TEmployee.SetEmployeeInfo(AValue: Tstring255);
begin
  FEmployeeInfo:=AValue;
  CheckStrMinSize('EmployeeInfo', AValue);
  CheckStrMaxSize('EmployeeInfo', AValue);
  ModifiedProperty('EmployeeInfo');
end;

procedure TEmployee.SetEmployeeBase(AValue: Tstring120);
begin
  FEmployeeBase:=AValue;
  CheckStrMinSize('EmployeeBase', AValue);
  CheckStrMaxSize('EmployeeBase', AValue);
  ModifiedProperty('EmployeeBase');
end;

procedure TEmployee.SetLastName(AValue: Tstring60);
begin
  FLastName:=AValue;
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  ModifiedProperty('LastName');
end;

procedure TEmployee.SetFirstName(AValue: Tstring60);
begin
  FFirstName:=AValue;
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  ModifiedProperty('FirstName');
end;

procedure TEmployee.SetMiddleName(AValue: Tstring60);
begin
  FMiddleName:=AValue;
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  ModifiedProperty('MiddleName');
end;

procedure TEmployee.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Position', 'Position', [xsaRequared], '', 0, 128);
  P:=RegisterProperty('EmployeeInfo', 'EmployeeInfo', [], '', 1, 255);
  P:=RegisterProperty('EmployeeBase', 'EmployeeBase', [], '', 1, 120);
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 60);
end;

procedure TEmployee.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TEmployee.Destroy;
begin
  inherited Destroy;
end;

  {  TOtherIssuer  }
procedure TOtherIssuer.SetPosition(AValue: Tstring128z);
begin
  FPosition:=AValue;
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  ModifiedProperty('Position');
end;

procedure TOtherIssuer.SetEmployeeInfo(AValue: Tstring255);
begin
  FEmployeeInfo:=AValue;
  CheckStrMinSize('EmployeeInfo', AValue);
  CheckStrMaxSize('EmployeeInfo', AValue);
  ModifiedProperty('EmployeeInfo');
end;

procedure TOtherIssuer.SetEmployeeBase(AValue: Tstring120);
begin
  FEmployeeBase:=AValue;
  CheckStrMinSize('EmployeeBase', AValue);
  CheckStrMaxSize('EmployeeBase', AValue);
  ModifiedProperty('EmployeeBase');
end;

procedure TOtherIssuer.SetOrganizationName(AValue: Tstring128z);
begin
  FOrganizationName:=AValue;
  CheckStrMinSize('OrganizationName', AValue);
  CheckStrMaxSize('OrganizationName', AValue);
  ModifiedProperty('OrganizationName');
end;

procedure TOtherIssuer.SetOrganizationBase(AValue: Tstring120);
begin
  FOrganizationBase:=AValue;
  CheckStrMinSize('OrganizationBase', AValue);
  CheckStrMaxSize('OrganizationBase', AValue);
  ModifiedProperty('OrganizationBase');
end;

procedure TOtherIssuer.SetLastName(AValue: Tstring60);
begin
  FLastName:=AValue;
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  ModifiedProperty('LastName');
end;

procedure TOtherIssuer.SetFirstName(AValue: Tstring60);
begin
  FFirstName:=AValue;
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  ModifiedProperty('FirstName');
end;

procedure TOtherIssuer.SetMiddleName(AValue: Tstring60);
begin
  FMiddleName:=AValue;
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  ModifiedProperty('MiddleName');
end;

procedure TOtherIssuer.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Position', 'Position', [], '', 0, 128);
  P:=RegisterProperty('EmployeeInfo', 'EmployeeInfo', [], '', 1, 255);
  P:=RegisterProperty('EmployeeBase', 'EmployeeBase', [], '', 1, 120);
  P:=RegisterProperty('OrganizationName', 'OrganizationName', [], '', 0, 128);
  P:=RegisterProperty('OrganizationBase', 'OrganizationBase', [], '', 1, 120);
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 60);
end;

procedure TOtherIssuer.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TOtherIssuer.Destroy;
begin
  inherited Destroy;
end;

  {  TWaybills  }
procedure TWaybills.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Waybill', 'Waybill', [], '', -1, -1);
end;

procedure TWaybills.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FWaybill:=TWaybills_WaybillList.Create;
end;

destructor TWaybills.Destroy;
begin
  FWaybill.Free;
  inherited Destroy;
end;

  {  TWaybills_Waybill  }
procedure TWaybills_Waybill.SetTransferDocumentNumber(AValue: Tstring255);
begin
  FTransferDocumentNumber:=AValue;
  CheckStrMinSize('TransferDocumentNumber', AValue);
  CheckStrMaxSize('TransferDocumentNumber', AValue);
  ModifiedProperty('TransferDocumentNumber');
end;

procedure TWaybills_Waybill.SetTransferDocumentDate(AValue: Tdate1);
begin
  FTransferDocumentDate:=AValue;
  CheckStrMinSize('TransferDocumentDate', AValue);
  CheckStrMaxSize('TransferDocumentDate', AValue);
  ModifiedProperty('TransferDocumentDate');
end;

procedure TWaybills_Waybill.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TransferDocumentNumber', 'TransferDocumentNumber', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('TransferDocumentDate', 'TransferDocumentDate', [xsaRequared], '', 10, 10);
end;

procedure TWaybills_Waybill.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TWaybills_Waybill.Destroy;
begin
  inherited Destroy;
end;

  {  TTransferBase  }
procedure TTransferBase.SetBaseDocumentName(AValue: Tstring255);
begin
  FBaseDocumentName:=AValue;
  CheckStrMinSize('BaseDocumentName', AValue);
  CheckStrMaxSize('BaseDocumentName', AValue);
  ModifiedProperty('BaseDocumentName');
end;

procedure TTransferBase.SetBaseDocumentNumber(AValue: Tstring255);
begin
  FBaseDocumentNumber:=AValue;
  CheckStrMinSize('BaseDocumentNumber', AValue);
  CheckStrMaxSize('BaseDocumentNumber', AValue);
  ModifiedProperty('BaseDocumentNumber');
end;

procedure TTransferBase.SetBaseDocumentDate(AValue: Tdate1);
begin
  FBaseDocumentDate:=AValue;
  CheckStrMinSize('BaseDocumentDate', AValue);
  CheckStrMaxSize('BaseDocumentDate', AValue);
  ModifiedProperty('BaseDocumentDate');
end;

procedure TTransferBase.SetBaseDocumentInfo(AValue: Tstring1000);
begin
  FBaseDocumentInfo:=AValue;
  CheckStrMinSize('BaseDocumentInfo', AValue);
  CheckStrMaxSize('BaseDocumentInfo', AValue);
  ModifiedProperty('BaseDocumentInfo');
end;

procedure TTransferBase.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BaseDocumentName', 'BaseDocumentName', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('BaseDocumentNumber', 'BaseDocumentNumber', [], '', 1, 255);
  P:=RegisterProperty('BaseDocumentDate', 'BaseDocumentDate', [], '', 10, 10);
  P:=RegisterProperty('BaseDocumentInfo', 'BaseDocumentInfo', [], '', 1, 1000);
end;

procedure TTransferBase.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TTransferBase.Destroy;
begin
  inherited Destroy;
end;

  {  TTransferBase820  }
procedure TTransferBase820.SetBaseDocumentId(AValue: Tstring255);
begin
  FBaseDocumentId:=AValue;
  CheckStrMinSize('BaseDocumentId', AValue);
  CheckStrMaxSize('BaseDocumentId', AValue);
  ModifiedProperty('BaseDocumentId');
end;

procedure TTransferBase820.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BaseDocumentId', 'BaseDocumentId', [], '', 1, 255);
end;

procedure TTransferBase820.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TTransferBase820.Destroy;
begin
  inherited Destroy;
end;

end.