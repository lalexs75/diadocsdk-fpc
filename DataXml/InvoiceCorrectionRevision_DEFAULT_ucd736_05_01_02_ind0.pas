{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2021 Lagunov Aleksey alexs75@yandex.ru

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

unit InvoiceCorrectionRevision_DEFAULT_ucd736_05_01_02_ind0;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject, AbstractSerializationObjects;

type
  Tstring3f = String;
  Tstring4f = String;
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
  Tstring40 = String;
  Tstring50 = String;
  Tstring60 = String;
  Tstring100 = String;
  Tstring100z = String;
  Tstring120 = String;
  Tstring128 = String;
  Tstring128z = String;
  Tstring200 = String;
  Tstring255 = String;
  Tstring256 = String;
  Tstring500 = String;
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
  //Время в формате ЧЧ.ММ.СС
  Ttime1 = String;
  //Дата и время в формате ДД.ММ.ГГГГ ЧЧ.ММ.СС (01.01.1800 - 31.12.2099)
  Tdatetime1 = String;
  //Идентификационный номер налогоплательщика - физического лица
  Tinnindividual = String;
  //Идентификационный номер налогоплательщика - юридического лица
  Tinnlegalentity = String;
  TTaxRate = String;
  TTaxRate_Torg2 = String;
  TTaxRateWithTaxedByAgent = String;
  TTaxRateWithTwentyPercentAndTaxedByAgent = String;
  TTaxRateWithTwentyPercent = String;
  //1 - Сведения о юридическом лице, состоящем на учете в налоговых органах // СвЮЛУч
  //2 - Сведения об индивидуальном предпринимателе// СвИП
  //3 - Сведения об иностранном лице, не состоящем на учете в налоговых органах // СвЮлНеУч, СвИнНеУч
  //4 - Сведения о физическом лице // СвФл
  TOrganizationType = String;
  Tinteger10 = Int64;
  Tinteger6 = Int64;
  Tinteger12 = Int64;
  Tinteger12z = Int64;
  TCommonRevisionNumber = Int64;
  TQuantityInc = Double;
  TQuantityDec = Double;
type

  {  Forward declarations  }
  TUniversalCorrectionDocument = class;
  TUniversalCorrectionDocument_Invoices = class;
  TUniversalCorrectionDocument_Signers = class;
  TInvoiceForCorrectionInfo = class;
  TInvoiceForCorrectionInfo_Revision = class;
  TInvoiceCorrectionTable = class;
  TInvoiceCorrectionTable_Items = class;
  TExtendedInvoiceCorrectionItem = class;
  TExtendedInvoiceCorrectionItem_TaxRate = class;
  TExtendedInvoiceCorrectionItem_UnitName = class;
  TExtendedInvoiceCorrectionItem_Unit = class;
  TExtendedInvoiceCorrectionItem_Quantity = class;
  TExtendedInvoiceCorrectionItem_Price = class;
  TExtendedInvoiceCorrectionItem_Excise = class;
  TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded = class;
  TExtendedInvoiceCorrectionItem_Vat = class;
  TExtendedInvoiceCorrectionItem_WithoutVat = class;
  TExtendedInvoiceCorrectionItem_Subtotal = class;
  TExtendedInvoiceCorrectionItem_ItemTracingInfos = class;
  TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo = class;
  TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff = class;
  TExtendedInvoiceCorrectionItem_AdditionalInfos = class;
  TItemIdentificationNumbers = class;
  TItemIdentificationNumbers_ItemIdentificationNumber = class;
  TEventContent = class;
  TDocType = class;
  TAdditionalInfoId = class;
  TAdditionalInfoId736 = class;
  TAdditionalInfo = class;
  TCustomsDeclaration = class;
  TCustomsDeclarationWithHyphens = class;
  TInvoiceTotalsDiff = class;
  TInvoiceTotalsDiff736 = class;
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
  TExtendedOrganizationInfo_ForeignAddress1000 = class;
  TExtendedOrganizationInfo_Torg2 = class;
  TExtendedOrganizationDetails_ManualFilling = class;
  TExtendedOrganizationDetails_ForeignAddress1000 = class;
  TExtendedOrganizationDetails_ManualFilling_Torg2 = class;
  TExtendedOrganizationReference = class;
  TExtendedOrganizationDetails = class;
  TExtendedOrganizationDetails_Torg2 = class;
  TExtendedOrganizationInfoWithHyphens = class;
  TExtendedOrganizationDetailsWithHyphens = class;
  TAddress = class;
  TAddress_ForeignAddress1000 = class;
  TRussianAddress = class;
  TForeignAddress = class;
  TForeignAddress1000 = class;
  TSignerInfo = class;
  TSignerDetails = class;
  TSignerReferenceInfo = class;
  TSignerReference = class;
  TExtendedSignerDetailsBase = class;
  TExtendedSignerDetailsBase736 = class;
  TExtendedSignerDetails = class;
  TExtendedSignerDetails736 = class;
  TExtendedSignerDetails_SellerTitle = class;
  TExtendedSignerDetails_BuyerTitle = class;
  TExtendedSignerDetails_BuyerTitle820 = class;
  TExtendedSignerDetails_CorrectionSellerTitle = class;
  TExtendedSignerDetails_CorrectionBuyerTitle = class;
  TExtendedSignerDetails_CorrectionBuyerTitle736 = class;
  TExtendedSignerDetails_551_552 = class;
  TExtendedSignerDetails_Torg2Buyer = class;
  TExtendedSignerDetails_Torg2AdditionalInfo = class;

  {  Generic classes for collections  }
  TUniversalCorrectionDocumentList = specialize GXMLSerializationObjectList<TUniversalCorrectionDocument>;
  TUniversalCorrectionDocument_InvoicesList = specialize GXMLSerializationObjectList<TUniversalCorrectionDocument_Invoices>;
  TUniversalCorrectionDocument_SignersList = specialize GXMLSerializationObjectList<TUniversalCorrectionDocument_Signers>;
  TInvoiceForCorrectionInfoList = specialize GXMLSerializationObjectList<TInvoiceForCorrectionInfo>;
  TInvoiceForCorrectionInfo_RevisionList = specialize GXMLSerializationObjectList<TInvoiceForCorrectionInfo_Revision>;
  TInvoiceCorrectionTableList = specialize GXMLSerializationObjectList<TInvoiceCorrectionTable>;
  TInvoiceCorrectionTable_ItemsList = specialize GXMLSerializationObjectList<TInvoiceCorrectionTable_Items>;
  TExtendedInvoiceCorrectionItemList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem>;
  TExtendedInvoiceCorrectionItem_TaxRateList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_TaxRate>;
  TExtendedInvoiceCorrectionItem_UnitNameList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_UnitName>;
  TExtendedInvoiceCorrectionItem_UnitList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_Unit>;
  TExtendedInvoiceCorrectionItem_QuantityList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_Quantity>;
  TExtendedInvoiceCorrectionItem_PriceList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_Price>;
  TExtendedInvoiceCorrectionItem_ExciseList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_Excise>;
  TExtendedInvoiceCorrectionItem_SubtotalWithVatExcludedList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded>;
  TExtendedInvoiceCorrectionItem_VatList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_Vat>;
  TExtendedInvoiceCorrectionItem_WithoutVatList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_WithoutVat>;
  TExtendedInvoiceCorrectionItem_SubtotalList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_Subtotal>;
  TExtendedInvoiceCorrectionItem_ItemTracingInfosList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_ItemTracingInfos>;
  TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfoList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo>;
  TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiffList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff>;
  TExtendedInvoiceCorrectionItem_AdditionalInfosList = specialize GXMLSerializationObjectList<TExtendedInvoiceCorrectionItem_AdditionalInfos>;
  TItemIdentificationNumbersList = specialize GXMLSerializationObjectList<TItemIdentificationNumbers>;
  TItemIdentificationNumbers_ItemIdentificationNumberList = specialize GXMLSerializationObjectList<TItemIdentificationNumbers_ItemIdentificationNumber>;
  TEventContentList = specialize GXMLSerializationObjectList<TEventContent>;
  TDocTypeList = specialize GXMLSerializationObjectList<TDocType>;
  TAdditionalInfoIdList = specialize GXMLSerializationObjectList<TAdditionalInfoId>;
  TAdditionalInfoId736List = specialize GXMLSerializationObjectList<TAdditionalInfoId736>;
  TAdditionalInfoList = specialize GXMLSerializationObjectList<TAdditionalInfo>;
  TCustomsDeclarationList = specialize GXMLSerializationObjectList<TCustomsDeclaration>;
  TCustomsDeclarationWithHyphensList = specialize GXMLSerializationObjectList<TCustomsDeclarationWithHyphens>;
  TInvoiceTotalsDiffList = specialize GXMLSerializationObjectList<TInvoiceTotalsDiff>;
  TInvoiceTotalsDiff736List = specialize GXMLSerializationObjectList<TInvoiceTotalsDiff736>;
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
  TExtendedOrganizationInfo_ForeignAddress1000List = specialize GXMLSerializationObjectList<TExtendedOrganizationInfo_ForeignAddress1000>;
  TExtendedOrganizationInfo_Torg2List = specialize GXMLSerializationObjectList<TExtendedOrganizationInfo_Torg2>;
  TExtendedOrganizationDetails_ManualFillingList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_ManualFilling>;
  TExtendedOrganizationDetails_ForeignAddress1000List = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_ForeignAddress1000>;
  TExtendedOrganizationDetails_ManualFilling_Torg2List = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_ManualFilling_Torg2>;
  TExtendedOrganizationReferenceList = specialize GXMLSerializationObjectList<TExtendedOrganizationReference>;
  TExtendedOrganizationDetailsList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails>;
  TExtendedOrganizationDetails_Torg2List = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_Torg2>;
  TExtendedOrganizationInfoWithHyphensList = specialize GXMLSerializationObjectList<TExtendedOrganizationInfoWithHyphens>;
  TExtendedOrganizationDetailsWithHyphensList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetailsWithHyphens>;
  TAddressList = specialize GXMLSerializationObjectList<TAddress>;
  TAddress_ForeignAddress1000List = specialize GXMLSerializationObjectList<TAddress_ForeignAddress1000>;
  TRussianAddressList = specialize GXMLSerializationObjectList<TRussianAddress>;
  TForeignAddressList = specialize GXMLSerializationObjectList<TForeignAddress>;
  TForeignAddress1000List = specialize GXMLSerializationObjectList<TForeignAddress1000>;
  TSignerInfoList = specialize GXMLSerializationObjectList<TSignerInfo>;
  TSignerDetailsList = specialize GXMLSerializationObjectList<TSignerDetails>;
  TSignerReferenceInfoList = specialize GXMLSerializationObjectList<TSignerReferenceInfo>;
  TSignerReferenceList = specialize GXMLSerializationObjectList<TSignerReference>;
  TExtendedSignerDetailsBaseList = specialize GXMLSerializationObjectList<TExtendedSignerDetailsBase>;
  TExtendedSignerDetailsBase736List = specialize GXMLSerializationObjectList<TExtendedSignerDetailsBase736>;
  TExtendedSignerDetailsList = specialize GXMLSerializationObjectList<TExtendedSignerDetails>;
  TExtendedSignerDetails736List = specialize GXMLSerializationObjectList<TExtendedSignerDetails736>;
  TExtendedSignerDetails_SellerTitleList = specialize GXMLSerializationObjectList<TExtendedSignerDetails_SellerTitle>;
  TExtendedSignerDetails_BuyerTitleList = specialize GXMLSerializationObjectList<TExtendedSignerDetails_BuyerTitle>;
  TExtendedSignerDetails_BuyerTitle820List = specialize GXMLSerializationObjectList<TExtendedSignerDetails_BuyerTitle820>;
  TExtendedSignerDetails_CorrectionSellerTitleList = specialize GXMLSerializationObjectList<TExtendedSignerDetails_CorrectionSellerTitle>;
  TExtendedSignerDetails_CorrectionBuyerTitleList = specialize GXMLSerializationObjectList<TExtendedSignerDetails_CorrectionBuyerTitle>;
  TExtendedSignerDetails_CorrectionBuyerTitle736List = specialize GXMLSerializationObjectList<TExtendedSignerDetails_CorrectionBuyerTitle736>;
  TExtendedSignerDetails_551_552List = specialize GXMLSerializationObjectList<TExtendedSignerDetails_551_552>;
  TExtendedSignerDetails_Torg2BuyerList = specialize GXMLSerializationObjectList<TExtendedSignerDetails_Torg2Buyer>;
  TExtendedSignerDetails_Torg2AdditionalInfoList = specialize GXMLSerializationObjectList<TExtendedSignerDetails_Torg2AdditionalInfo>;

  {  TUniversalCorrectionDocument  }
  TUniversalCorrectionDocument = class(TXmlSerializationObject)
  private
    FInvoices:TUniversalCorrectionDocument_Invoices;
    FSeller:TExtendedOrganizationInfo_ForeignAddress1000;
    FBuyer:TExtendedOrganizationInfo_ForeignAddress1000;
    FTable:TInvoiceCorrectionTable;
    FEventContent:TEventContent;
    FAdditionalInfoId:TAdditionalInfoId736;
    FSigners:TUniversalCorrectionDocument_Signers;
    FFunction1:String;
    FDocumentName:Tstring255;
    FDocumentDate:Tdate1;
    FDocumentNumber:Tstring1000;
    FCurrency:Tokv;
    FCurrencyName:String;
    FCurrencyRate:Double;
    FCorrectionRevisionDate:Tdate1;
    FCorrectionRevisionNumber:Int64;
    FDocumentCreator:Tstring1000;
    FDocumentCreatorBase:Tstring120;
    FGovernmentContractInfo:String;
    procedure SetFunction1( AValue:String);
    procedure SetDocumentName( AValue:Tstring255);
    procedure SetDocumentDate( AValue:Tdate1);
    procedure SetDocumentNumber( AValue:Tstring1000);
    procedure SetCurrency( AValue:Tokv);
    procedure SetCurrencyName( AValue:String);
    procedure SetCurrencyRate( AValue:Double);
    procedure SetCorrectionRevisionDate( AValue:Tdate1);
    procedure SetCorrectionRevisionNumber( AValue:Int64);
    procedure SetDocumentCreator( AValue:Tstring1000);
    procedure SetDocumentCreatorBase( AValue:Tstring120);
    procedure SetGovernmentContractInfo( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
    function RootNodeName:string; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Invoices:TUniversalCorrectionDocument_Invoices read FInvoices;
    //СвПрод - продавец
    property Seller:TExtendedOrganizationInfo_ForeignAddress1000 read FSeller;
    //СвПокуп - покупатель
    property Buyer:TExtendedOrganizationInfo_ForeignAddress1000 read FBuyer;
    //ТаблКСчФ - Сведения таблицы корректировочного счета-фактуры с дополнительной информацией
    property Table:TInvoiceCorrectionTable read FTable;
    //СодФХЖ3 - Содержание события
    property EventContent:TEventContent read FEventContent;
    //ИнфПолФХЖ1 - информационное поле документа
    property AdditionalInfoId:TAdditionalInfoId736 read FAdditionalInfoId;
    property Signers:TUniversalCorrectionDocument_Signers read FSigners;
    //Функция - функция документаКСЧФ - корректировочный счет-фактура, применяемый при расчетах по налогу на добавленную стоимость;
    //КСЧФДИС - корректировочный счет-фактура, применяемый при расчетах по налогу на добавленную стоимость, и документ об изменении стоимости отгруженных товаров (выполненных работ, оказанных услуг), переданных имущественных прав;
    //ДИС - документ об изменении стоимости отгруженных товаров (выполненных работ, оказанных услуг), переданных имущественных прав;
    property Function1:String read FFunction1 write SetFunction1;
    //НаимДокОпр - Наименование первичного документа, определенное организацией
    property DocumentName:Tstring255 read FDocumentName write SetDocumentName;
    //ДатаКСчФ - дата УКД
    property DocumentDate:Tdate1 read FDocumentDate write SetDocumentDate;
    //НомерКСчФ - номер УКД
    property DocumentNumber:Tstring1000 read FDocumentNumber write SetDocumentNumber;
    //КодОКВ - валюта (код)
    property Currency:Tokv read FCurrency write SetCurrency;
    //НАимОКВ - наименование валютыДля формирования НаимОКВ по коду валюты принимает значение - 1Если формировать НаимОКВ не нужно - принимает значение 0
    property CurrencyName:String read FCurrencyName write SetCurrencyName;
    //КурсВал - Курс валюты
    property CurrencyRate:Double read FCurrencyRate write SetCurrencyRate;
    //ДатаИспрКСчФ - ДатаИспрКСчФ, обязателен, если формируется исправление
    property CorrectionRevisionDate:Tdate1 read FCorrectionRevisionDate write SetCorrectionRevisionDate;
    //НомИспрКСчФ - НомИспрКСчФ, обязателен, если формируется исправление
    property CorrectionRevisionNumber:Int64 read FCorrectionRevisionNumber write SetCorrectionRevisionNumber;
    //НаимЭконСубСост - Наименование экономического субъекта-составителя файла обмена счета-фактуры с дополнительной информацией (информации продавца)
    property DocumentCreator:Tstring1000 read FDocumentCreator write SetDocumentCreator;
    //ОснДоверОргСост - Основание, по которому экономический субъект является составителем файла обмена счета-фактуры с дополнительной информацией
    property DocumentCreatorBase:Tstring120 read FDocumentCreatorBase write SetDocumentCreatorBase;
    //ИдГосКон - Идентификатор государственного контракта
    property GovernmentContractInfo:String read FGovernmentContractInfo write SetGovernmentContractInfo;
  end;

  {  TUniversalCorrectionDocument_Invoices  }
  TUniversalCorrectionDocument_Invoices = class(TXmlSerializationObject)
  private
    FInvoice:TInvoiceForCorrectionInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СчФ - Счет-фактура (первичный документ), к которому составлен корректировочный счет-фактура
    property Invoice:TInvoiceForCorrectionInfoList read FInvoice;
  end;

  {  TUniversalCorrectionDocument_Signers  }
  TUniversalCorrectionDocument_Signers = class(TXmlSerializationObject)
  private
    FSignerReference:TSignerReference;
    FSignerDetails:TExtendedSignerDetails_CorrectionSellerTitle;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property SignerReference:TSignerReference read FSignerReference;
    property SignerDetails:TExtendedSignerDetails_CorrectionSellerTitle read FSignerDetails;
  end;

  {  TInvoiceForCorrectionInfo  }
  TInvoiceForCorrectionInfo = class(TXmlSerializationObject)
  private
    FRevision:TInvoiceForCorrectionInfo_RevisionList;
    FDate:Tdate1;
    FNumber:Tstring1000;
    procedure SetDate( AValue:Tdate1);
    procedure SetNumber( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ИспрСчФ - с учетом исправления
    property Revision:TInvoiceForCorrectionInfo_RevisionList read FRevision;
    //ДатаСчФ
    property Date:Tdate1 read FDate write SetDate;
    //НомерСчФ
    property Number:Tstring1000 read FNumber write SetNumber;
  end;

  {  TInvoiceForCorrectionInfo_Revision  }
  TInvoiceForCorrectionInfo_Revision = class(TXmlSerializationObject)
  private
    FDate:Tdate1;
    FNumber:Int64;
    procedure SetDate( AValue:Tdate1);
    procedure SetNumber( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ДатаИспрСчФ (заполняется, если КСФ/ИКСФ формируется на исправленный СФ)
    property Date:Tdate1 read FDate write SetDate;
    //НомИспрСчФ (заполняется, если КСФ/ИКСФ формируется на исправленный СФ)
    property Number:Int64 read FNumber write SetNumber;
  end;

  {  TInvoiceCorrectionTable  }
  TInvoiceCorrectionTable = class(TXmlSerializationObject)
  private
    FItems:TInvoiceCorrectionTable_Items;
    FTotalsInc:TInvoiceTotalsDiff736;
    FTotalsDec:TInvoiceTotalsDiff736;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Items:TInvoiceCorrectionTable_Items read FItems;
    //ВсегоУвел - суммы к увеличению
    property TotalsInc:TInvoiceTotalsDiff736 read FTotalsInc;
    //ВсегоУм - суммы к уменьшению
    property TotalsDec:TInvoiceTotalsDiff736 read FTotalsDec;
  end;

  {  TInvoiceCorrectionTable_Items  }
  TInvoiceCorrectionTable_Items = class(TXmlSerializationObject)
  private
    FItem:TExtendedInvoiceCorrectionItemList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СведТов - информация о товарах
    property Item:TExtendedInvoiceCorrectionItemList read FItem;
  end;

  {  TExtendedInvoiceCorrectionItem  }
  TExtendedInvoiceCorrectionItem = class(TXmlSerializationObject)
  private
    FTaxRate:TExtendedInvoiceCorrectionItem_TaxRate;
    FUnitName:TExtendedInvoiceCorrectionItem_UnitName;
    FUnit1:TExtendedInvoiceCorrectionItem_Unit;
    FQuantity:TExtendedInvoiceCorrectionItem_Quantity;
    FPrice:TExtendedInvoiceCorrectionItem_Price;
    FExcise:TExtendedInvoiceCorrectionItem_Excise;
    FSubtotalWithVatExcluded:TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded;
    FVat:TExtendedInvoiceCorrectionItem_Vat;
    FWithoutVat:TExtendedInvoiceCorrectionItem_WithoutVat;
    FSubtotal:TExtendedInvoiceCorrectionItem_Subtotal;
    FItemTracingInfos:TExtendedInvoiceCorrectionItem_ItemTracingInfos;
    FOriginalItemIdentificationNumbers:TItemIdentificationNumbers;
    FCorrectedItemIdentificationNumbers:TItemIdentificationNumbers;
    FAdditionalInfos:TExtendedInvoiceCorrectionItem_AdditionalInfos;
    FProduct:Tstring1000;
    FItemCharact:Tstring1000;
    FItemKind:Tstring10;
    FItemArticle:Tstring50;
    FItemVendorCode:Tstring255;
    FItemTypeCode:Tstring10;
    FOriginalNumber:Tinteger6;
    procedure SetProduct( AValue:Tstring1000);
    procedure SetItemCharact( AValue:Tstring1000);
    procedure SetItemKind( AValue:Tstring10);
    procedure SetItemArticle( AValue:Tstring50);
    procedure SetItemVendorCode( AValue:Tstring255);
    procedure SetItemTypeCode( AValue:Tstring10);
    procedure SetOriginalNumber( AValue:Tinteger6);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ставка налога
    property TaxRate:TExtendedInvoiceCorrectionItem_TaxRate read FTaxRate;
    //Наименование единицы измерения товараПользователь заполняет, если Unit заполнен
    property UnitName:TExtendedInvoiceCorrectionItem_UnitName read FUnitName;
    //Единицы измерения товара (код)
    property Unit1:TExtendedInvoiceCorrectionItem_Unit read FUnit1;
    //Количество единиц товара
    property Quantity:TExtendedInvoiceCorrectionItem_Quantity read FQuantity;
    //Цена за единицу товара
    property Price:TExtendedInvoiceCorrectionItem_Price read FPrice;
    //Акциз
    property Excise:TExtendedInvoiceCorrectionItem_Excise read FExcise;
    //Сумма без учета налога
    property SubtotalWithVatExcluded:TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded read FSubtotalWithVatExcluded;
    //Сумма налога
    property Vat:TExtendedInvoiceCorrectionItem_Vat read FVat;
    //Если заполнено - формирует для суммы налога элемент БезНДСИгнорирует заполненные значения в элементе Vat
    property WithoutVat:TExtendedInvoiceCorrectionItem_WithoutVat read FWithoutVat;
    //Сумма с учетом налога
    property Subtotal:TExtendedInvoiceCorrectionItem_Subtotal read FSubtotal;
    property ItemTracingInfos:TExtendedInvoiceCorrectionItem_ItemTracingInfos read FItemTracingInfos;
    //НомСредИдентТовДо - Номер средства идентификации товаров до изменения
    property OriginalItemIdentificationNumbers:TItemIdentificationNumbers read FOriginalItemIdentificationNumbers;
    //НомСредИдентТовПосле - Номер средства идентификации товаров после изменения
    property CorrectedItemIdentificationNumbers:TItemIdentificationNumbers read FCorrectedItemIdentificationNumbers;
    //ИнфПолФХЖ2 - информационное поле документа
    property AdditionalInfos:TExtendedInvoiceCorrectionItem_AdditionalInfos read FAdditionalInfos;
    //НаимТов - наименование товара
    property Product:Tstring1000 read FProduct write SetProduct;
    //ХарактерТов - Характеристика/описание товара
    property ItemCharact:Tstring1000 read FItemCharact write SetItemCharact;
    //СортТов - Сорт товара
    property ItemKind:Tstring10 read FItemKind write SetItemKind;
    //АртикулТов - Артикул товара
    property ItemArticle:Tstring50 read FItemArticle write SetItemArticle;
    //КодТов - Характеристика/код/артикул/сорт товара
    property ItemVendorCode:Tstring255 read FItemVendorCode write SetItemVendorCode;
    //КодВидТов - Код вида товара
    property ItemTypeCode:Tstring10 read FItemTypeCode write SetItemTypeCode;
    //ПорНомТовВСЧФ - Порядковый номер товара в корректируемом документе
    property OriginalNumber:Tinteger6 read FOriginalNumber write SetOriginalNumber;
  end;

  {  TExtendedInvoiceCorrectionItem_TaxRate  }
  TExtendedInvoiceCorrectionItem_TaxRate = class(TXmlSerializationObject)
  private
    FOriginalValue:TTaxRateWithTwentyPercentAndTaxedByAgent;
    FCorrectedValue:TTaxRateWithTwentyPercentAndTaxedByAgent;
    procedure SetOriginalValue( AValue:TTaxRateWithTwentyPercentAndTaxedByAgent);
    procedure SetCorrectedValue( AValue:TTaxRateWithTwentyPercentAndTaxedByAgent);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //НалСтДо
    property OriginalValue:TTaxRateWithTwentyPercentAndTaxedByAgent read FOriginalValue write SetOriginalValue;
    //НалСтПосле
    property CorrectedValue:TTaxRateWithTwentyPercentAndTaxedByAgent read FCorrectedValue write SetCorrectedValue;
  end;

  {  TExtendedInvoiceCorrectionItem_UnitName  }
  TExtendedInvoiceCorrectionItem_UnitName = class(TXmlSerializationObject)
  private
    FOriginalValue:Tstring255;
    FCorrectedValue:Tstring255;
    procedure SetOriginalValue( AValue:Tstring255);
    procedure SetCorrectedValue( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //НаимЕдИзмДо
    property OriginalValue:Tstring255 read FOriginalValue write SetOriginalValue;
    //НаимЕдИзмПосле
    property CorrectedValue:Tstring255 read FCorrectedValue write SetCorrectedValue;
  end;

  {  TExtendedInvoiceCorrectionItem_Unit  }
  TExtendedInvoiceCorrectionItem_Unit = class(TXmlSerializationObject)
  private
    FOriginalValue:String;
    FCorrectedValue:String;
    procedure SetOriginalValue( AValue:String);
    procedure SetCorrectedValue( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОКЕИ_ТовДо
    property OriginalValue:String read FOriginalValue write SetOriginalValue;
    //ОКЕИ_ТовПосле
    property CorrectedValue:String read FCorrectedValue write SetCorrectedValue;
  end;

  {  TExtendedInvoiceCorrectionItem_Quantity  }
  TExtendedInvoiceCorrectionItem_Quantity = class(TXmlSerializationObject)
  private
    FOriginalValue:Double;
    FCorrectedValue:Double;
    procedure SetOriginalValue( AValue:Double);
    procedure SetCorrectedValue( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КолТовДо
    property OriginalValue:Double read FOriginalValue write SetOriginalValue;
    //КолТовПосле
    property CorrectedValue:Double read FCorrectedValue write SetCorrectedValue;
  end;

  {  TExtendedInvoiceCorrectionItem_Price  }
  TExtendedInvoiceCorrectionItem_Price = class(TXmlSerializationObject)
  private
    FOriginalValue:Double;
    FCorrectedValue:Double;
    procedure SetOriginalValue( AValue:Double);
    procedure SetCorrectedValue( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ЦенаТовДо
    property OriginalValue:Double read FOriginalValue write SetOriginalValue;
    //ЦенаТовПосле
    property CorrectedValue:Double read FCorrectedValue write SetCorrectedValue;
  end;

  {  TExtendedInvoiceCorrectionItem_Excise  }
  TExtendedInvoiceCorrectionItem_Excise = class(TXmlSerializationObject)
  private
    FAmountsInc:Double;
    FAmountsDec:Double;
    FOriginalValue:Double;
    FCorrectedValue:Double;
    procedure SetAmountsInc( AValue:Double);
    procedure SetAmountsDec( AValue:Double);
    procedure SetOriginalValue( AValue:Double);
    procedure SetCorrectedValue( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //АкцизРазн/СумУвел
    property AmountsInc:Double read FAmountsInc write SetAmountsInc;
    //АкцизРазн/СумУм
    property AmountsDec:Double read FAmountsDec write SetAmountsDec;
    //АкцизДо
    property OriginalValue:Double read FOriginalValue write SetOriginalValue;
    //АкцизПосле
    property CorrectedValue:Double read FCorrectedValue write SetCorrectedValue;
  end;

  {  TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded  }
  TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded = class(TXmlSerializationObject)
  private
    FAmountsInc:Double;
    FAmountsDec:Double;
    FOriginalValue:Double;
    FCorrectedValue:Double;
    procedure SetAmountsInc( AValue:Double);
    procedure SetAmountsDec( AValue:Double);
    procedure SetOriginalValue( AValue:Double);
    procedure SetCorrectedValue( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СтоимУвел
    property AmountsInc:Double read FAmountsInc write SetAmountsInc;
    //СтоимУм
    property AmountsDec:Double read FAmountsDec write SetAmountsDec;
    //СтоимДоИзм
    property OriginalValue:Double read FOriginalValue write SetOriginalValue;
    //СтоимПослеИзм
    property CorrectedValue:Double read FCorrectedValue write SetCorrectedValue;
  end;

  {  TExtendedInvoiceCorrectionItem_Vat  }
  TExtendedInvoiceCorrectionItem_Vat = class(TXmlSerializationObject)
  private
    FAmountsInc:Double;
    FAmountsDec:Double;
    FOriginalValue:Double;
    FCorrectedValue:Double;
    procedure SetAmountsInc( AValue:Double);
    procedure SetAmountsDec( AValue:Double);
    procedure SetOriginalValue( AValue:Double);
    procedure SetCorrectedValue( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СумУвел
    property AmountsInc:Double read FAmountsInc write SetAmountsInc;
    //СумУм
    property AmountsDec:Double read FAmountsDec write SetAmountsDec;
    //СумНалДо
    property OriginalValue:Double read FOriginalValue write SetOriginalValue;
    //СумНалПосле
    property CorrectedValue:Double read FCorrectedValue write SetCorrectedValue;
  end;

  {  TExtendedInvoiceCorrectionItem_WithoutVat  }
  TExtendedInvoiceCorrectionItem_WithoutVat = class(TXmlSerializationObject)
  private
    FOriginalValue:String;
    FCorrectedValue:String;
    procedure SetOriginalValue( AValue:String);
    procedure SetCorrectedValue( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СтоимДоИзм
    property OriginalValue:String read FOriginalValue write SetOriginalValue;
    //СтоимПослеИзм
    property CorrectedValue:String read FCorrectedValue write SetCorrectedValue;
  end;

  {  TExtendedInvoiceCorrectionItem_Subtotal  }
  TExtendedInvoiceCorrectionItem_Subtotal = class(TXmlSerializationObject)
  private
    FAmountsInc:Double;
    FAmountsDec:Double;
    FOriginalValue:Double;
    FCorrectedValue:Double;
    procedure SetAmountsInc( AValue:Double);
    procedure SetAmountsDec( AValue:Double);
    procedure SetOriginalValue( AValue:Double);
    procedure SetCorrectedValue( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СтоимУвел
    property AmountsInc:Double read FAmountsInc write SetAmountsInc;
    //СтоимУм
    property AmountsDec:Double read FAmountsDec write SetAmountsDec;
    //СтоимДоИзм
    property OriginalValue:Double read FOriginalValue write SetOriginalValue;
    //СтоимПослеИзм
    property CorrectedValue:Double read FCorrectedValue write SetCorrectedValue;
  end;

  {  TExtendedInvoiceCorrectionItem_ItemTracingInfos  }
  TExtendedInvoiceCorrectionItem_ItemTracingInfos = class(TXmlSerializationObject)
  private
    FItemTracingInfo:TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СведПрослеж - Сведения о товаре, подлежащем
    //прослеживаемости
    property ItemTracingInfo:TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfoList read FItemTracingInfo;
  end;

  {  TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo  }
  TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo = class(TXmlSerializationObject)
  private
    FQuantityDiff:TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff;
    FRegNumberUnit:Tstring29;
    FUnit1:Tokei;
    FItemAddInfo:Tstring255;
    procedure SetRegNumberUnit( AValue:Tstring29);
    procedure SetUnit1( AValue:Tokei);
    procedure SetItemAddInfo( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ИзмКолЕдПТ - Изменения в количестве товара в единицах измерения прослеживаемого товара
    property QuantityDiff:TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff read FQuantityDiff;
    //НомТовПрослеж - Регистрационный номер партии
    //товара
    property RegNumberUnit:Tstring29 read FRegNumberUnit write SetRegNumberUnit;
    //ЕдИзмПрослеж - Единица количественного учета
    //товара, используемая в целях осуществления прослеживаемости
    property Unit1:Tokei read FUnit1 write SetUnit1;
    //ДопПрослеж - Дополнительный показатель для
    //идентификации товаров, подлежащих прослеживаемости
    property ItemAddInfo:Tstring255 read FItemAddInfo write SetItemAddInfo;
  end;

  {  TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff  }
  TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff = class(TXmlSerializationObject)
  private
    FQuantityInc:TQuantityInc;
    FQuantityDec:TQuantityDec;
    FOriginalQuantity:Double;
    FCorrectedQuantity:Double;
    procedure SetQuantityInc( AValue:TQuantityInc);
    procedure SetQuantityDec( AValue:TQuantityDec);
    procedure SetOriginalQuantity( AValue:Double);
    procedure SetCorrectedQuantity( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КолТовЕдПТУвел - Количество товара в единицах измерения прослеживаемого товара, увеличение
    property QuantityInc:TQuantityInc read FQuantityInc write SetQuantityInc;
    //КолТовЕдПТУм - Количество товара в единицах измерения прослеживаемого товара, уменьшение
    property QuantityDec:TQuantityDec read FQuantityDec write SetQuantityDec;
    //КолТовЕдПТДо - Количество товара в единицах измерения прослеживаемого товара до изменения
    property OriginalQuantity:Double read FOriginalQuantity write SetOriginalQuantity;
    //КолТовЕдПТПосле - Количество товара в единицах измерения прослеживаемого товара после изменения
    property CorrectedQuantity:Double read FCorrectedQuantity write SetCorrectedQuantity;
  end;

  {  TExtendedInvoiceCorrectionItem_AdditionalInfos  }
  TExtendedInvoiceCorrectionItem_AdditionalInfos = class(TXmlSerializationObject)
  private
    FAdditionalInfo:TAdditionalInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property AdditionalInfo:TAdditionalInfoList read FAdditionalInfo;
  end;

  {  TItemIdentificationNumbers  }
  TItemIdentificationNumbers = class(TXmlSerializationObject)
  private
    FItemIdentificationNumber:TItemIdentificationNumbers_ItemIdentificationNumberList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Номер средства идентификации товаров
    property ItemIdentificationNumber:TItemIdentificationNumbers_ItemIdentificationNumberList read FItemIdentificationNumber;
  end;

  {  TItemIdentificationNumbers_ItemIdentificationNumber  }
  TItemIdentificationNumbers_ItemIdentificationNumber = class(TXmlSerializationObject)
  private
    FUnit1:TXSDStringArray;
    FPackageId:TXSDStringArray;
    FTransPackageId:Tstring255;
    procedure SetUnit1( AValue:TXSDStringArray);
    procedure SetPackageId( AValue:TXSDStringArray);
    procedure SetTransPackageId( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КИЗ - Контрольный идентификационный знак
    property Unit1:TXSDStringArray read FUnit1 write SetUnit1;
    //НомУпак - Уникальный идентификатор вторичной
    //(потребительской)/третичной (заводской, транспортной)
    //упаковки
    property PackageId:TXSDStringArray read FPackageId write SetPackageId;
    //ИдентТрансУпак - Уникальный идентификатор
    //транспортной упаковки
    property TransPackageId:Tstring255 read FTransPackageId write SetTransPackageId;
  end;

  {  TEventContent  }
  TEventContent = class(TXmlSerializationObject)
  private
    FTransferDocDetails:TDocTypeList;
    FCorrectionBase:TDocTypeList;
    FCostChangeInfo:Tstring2000;
    FOperationContent:Tstring255;
    FNotificationDate:Tdate1;
    procedure SetCostChangeInfo( AValue:Tstring2000);
    procedure SetOperationContent( AValue:Tstring255);
    procedure SetNotificationDate( AValue:Tdate1);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Реквизиты передаточных (отгрузочных) документов, к которым относится корректировка
    property TransferDocDetails:TDocTypeList read FTransferDocDetails;
    //Реквизиты документов, являющихся основанием корректировки
    property CorrectionBase:TDocTypeList read FCorrectionBase;
    //ИныеСвИзмСтоим - Иные сведения об изменении стоимости
    property CostChangeInfo:Tstring2000 read FCostChangeInfo write SetCostChangeInfo;
    //СодОпер - Содержание операции
    property OperationContent:Tstring255 read FOperationContent write SetOperationContent;
    //ДатаНапр - Дата направления на согласование
    property NotificationDate:Tdate1 read FNotificationDate write SetNotificationDate;
  end;

  {  TDocType  }
  TDocType = class(TXmlSerializationObject)
  private
    FBaseDocumentName:Tstring255;
    FBaseDocumentNumber:Tstring255;
    FBaseDocumentDate:Tdate1;
    FAdditionalInfo:Tstring1000;
    FBaseIdFile:Tstring255;
    procedure SetBaseDocumentName( AValue:Tstring255);
    procedure SetBaseDocumentNumber( AValue:Tstring255);
    procedure SetBaseDocumentDate( AValue:Tdate1);
    procedure SetAdditionalInfo( AValue:Tstring1000);
    procedure SetBaseIdFile( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //НаимОсн - Наименование документа - основания
    property BaseDocumentName:Tstring255 read FBaseDocumentName write SetBaseDocumentName;
    //НомОсн - Номер документа - основания
    property BaseDocumentNumber:Tstring255 read FBaseDocumentNumber write SetBaseDocumentNumber;
    //ДатаОсн - Дата документа - основания, обязателен при НаимОсн отличном от значения "Отсутствует"
    property BaseDocumentDate:Tdate1 read FBaseDocumentDate write SetBaseDocumentDate;
    //ДопСвОсн - Дополнительные сведения
    property AdditionalInfo:Tstring1000 read FAdditionalInfo write SetAdditionalInfo;
    //Идентификатор файла основания
    property BaseIdFile:Tstring255 read FBaseIdFile write SetBaseIdFile;
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
    constructor Create;
    destructor Destroy; override;
  published
    //ТекстИнф - текстовая информация
    property AdditionalInfo:TAdditionalInfoList read FAdditionalInfo;
    //ИдФайлИнфПол (GUID) - идентификатор файла информационного поля
    property InfoFileId:String read FInfoFileId write SetInfoFileId;
  end;

  {  TAdditionalInfoId736  }
  TAdditionalInfoId736 = class(TXmlSerializationObject)
  private
    FAdditionalInfo:TAdditionalInfoList;
    FInfoFileId:String;
    procedure SetInfoFileId( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ТекстИнф - текстовая информация
    property AdditionalInfo:TAdditionalInfoList read FAdditionalInfo;
    //ИдФайлИнфПол (GUID) - идентификатор файла информационного поля
    property InfoFileId:String read FInfoFileId write SetInfoFileId;
  end;

  {  TAdditionalInfo  }
  TAdditionalInfo = class(TXmlSerializationObject)
  private
    FId:Tstring50;
    FValue:Tstring2000;
    procedure SetId( AValue:Tstring50);
    procedure SetValue( AValue:Tstring2000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Идентиф - идентификатор (наименование)
    property Id:Tstring50 read FId write SetId;
    //Значен - значение
    property Value:Tstring2000 read FValue write SetValue;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
    destructor Destroy; override;
  published
    //сумма без учета налога
    property TotalWithVatExcluded:Double read FTotalWithVatExcluded write SetTotalWithVatExcluded;
    //сумма налога
    property Vat:Double read FVat write SetVat;
    //сумма всего
    property Total:Double read FTotal write SetTotal;
  end;

  {  TInvoiceTotalsDiff736  }
  TInvoiceTotalsDiff736 = class(TXmlSerializationObject)
  private
    FTotalWithVatExcluded:Double;
    FVat:Double;
    FWithoutVat:String;
    FTotal:Double;
    procedure SetTotalWithVatExcluded( AValue:Double);
    procedure SetVat( AValue:Double);
    procedure SetWithoutVat( AValue:String);
    procedure SetTotal( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //сумма без учета налога
    property TotalWithVatExcluded:Double read FTotalWithVatExcluded write SetTotalWithVatExcluded;
    //сумма налога
    property Vat:Double read FVat write SetVat;
    //Если заполнено - формирует для суммы налога элемент БезНДСИгнорирует заполненное значение в элементе Vat
    property WithoutVat:String read FWithoutVat write SetWithoutVat;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetails read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference read FOrganizationReference;
  end;

  {  TExtendedOrganizationInfo_ForeignAddress1000  }
  TExtendedOrganizationInfo_ForeignAddress1000 = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TExtendedOrganizationDetails_ForeignAddress1000;
    FOrganizationReference:TExtendedOrganizationReference;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetails_ForeignAddress1000 read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference read FOrganizationReference;
  end;

  {  TExtendedOrganizationInfo_Torg2  }
  TExtendedOrganizationInfo_Torg2 = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TExtendedOrganizationDetails_Torg2;
    FOrganizationReference:TExtendedOrganizationReference;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetails_Torg2 read FOrganizationDetails;
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
    constructor Create;
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

  {  TExtendedOrganizationDetails_ForeignAddress1000  }
  TExtendedOrganizationDetails_ForeignAddress1000 = class(TExtendedOrganizationDetails_ManualFilling)
  private
    FAddress:TAddress_ForeignAddress1000;
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
    constructor Create;
    destructor Destroy; override;
  published
    //Адрес
    property Address:TAddress_ForeignAddress1000 read FAddress;
    //НаимОрг - название организации
    property OrgName:Tstring1000 read FOrgName write SetOrgName;
    //ИНН ФЛ-ИНН - ИНН
    property Inn:Tstring60 read FInn write SetInn;
    //КПП
    property Kpp:Tstring1000 read FKpp write SetKpp;
    //идентификатор участника ЭДО
    property FnsParticipantId:Tstring1000 read FFnsParticipantId write SetFnsParticipantId;
  end;

  {  TExtendedOrganizationDetails_ManualFilling_Torg2  }
  TExtendedOrganizationDetails_ManualFilling_Torg2 = class(TXmlSerializationObject)
  private
    FOrgType:TOrganizationType;
    FOkpo:String;
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
    procedure SetOkpo( AValue:String);
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
    constructor Create;
    destructor Destroy; override;
  published
    //СвИП - СвЮЛУч - СвИнНеУч
    property OrgType:TOrganizationType read FOrgType write SetOrgType;
    //ОКПО - код в общероссийском классификаторе предприятий и организаций
    property Okpo:String read FOkpo write SetOkpo;
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
    FBoxId:Tstring100;
    procedure SetBoxId( AValue:Tstring100);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property BoxId:Tstring100 read FBoxId write SetBoxId;
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
    constructor Create;
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

  {  TExtendedOrganizationDetails_Torg2  }
  TExtendedOrganizationDetails_Torg2 = class(TExtendedOrganizationDetails_ManualFilling_Torg2)
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
    destructor Destroy; override;
  published
    property RussianAddress:TRussianAddress read FRussianAddress;
    property ForeignAddress:TForeignAddress read FForeignAddress;
    property AddressCode:Tstring36 read FAddressCode write SetAddressCode;
  end;

  {  TAddress_ForeignAddress1000  }
  TAddress_ForeignAddress1000 = class(TXmlSerializationObject)
  private
    FRussianAddress:TRussianAddress;
    FForeignAddress:TForeignAddress1000;
    FAddressCode:Tstring36;
    procedure SetAddressCode( AValue:Tstring36);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property RussianAddress:TRussianAddress read FRussianAddress;
    property ForeignAddress:TForeignAddress1000 read FForeignAddress;
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
    constructor Create;
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
    constructor Create;
    destructor Destroy; override;
  published
    //страна (код)
    property Country:Tstring60 read FCountry write SetCountry;
    //текст адреса
    property Address:Tstring255 read FAddress write SetAddress;
  end;

  {  TForeignAddress1000  }
  TForeignAddress1000 = class(TXmlSerializationObject)
  private
    FCountry:Tstring60;
    FAddress:Tstring1000;
    procedure SetCountry( AValue:Tstring60);
    procedure SetAddress( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //страна (код)
    property Country:Tstring60 read FCountry write SetCountry;
    //текст адреса
    property Address:Tstring1000 read FAddress write SetAddress;
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
    constructor Create;
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
    constructor Create;
    destructor Destroy; override;
  published
    property LastName:String read FLastName write SetLastName;
    property FirstName:String read FFirstName write SetFirstName;
    property MiddleName:String read FMiddleName write SetMiddleName;
    //Обязательно для титула покупателя
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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

  {  TExtendedSignerDetailsBase736  }
  TExtendedSignerDetailsBase736 = class(TXmlSerializationObject)
  private
    FLastName:Tstring60;
    FFirstName:Tstring60;
    FMiddleName:Tstring60;
    FPosition:Tstring128;
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
    procedure SetPosition( AValue:Tstring128);
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
    constructor Create;
    destructor Destroy; override;
  published
    property LastName:Tstring60 read FLastName write SetLastName;
    property FirstName:Tstring60 read FFirstName write SetFirstName;
    property MiddleName:Tstring60 read FMiddleName write SetMiddleName;
    //Должность
    property Position:Tstring128 read FPosition write SetPosition;
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
    FSignerStatus:Int64;
    procedure SetSignerStatus( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Статус1 - работник организации продавца товаров (работ, услуг, имущественных прав) ИЛИ работник организации покупателя;
    //2 - работник организации - составителя информации продавца ИЛИ работник организации – составителя информации покупателя;
    //3 - работник иной уполномоченной организации;
    //4 - уполномоченное физическое лицо, в том числе индивидуальный предприниматель.
    property SignerStatus:Int64 read FSignerStatus write SetSignerStatus;
  end;

  {  TExtendedSignerDetails736  }
  TExtendedSignerDetails736 = class(TExtendedSignerDetailsBase736)
  private
    FSignerStatus:Int64;
    procedure SetSignerStatus( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Статус3 - работник иной уполномоченной организации;
    //4 - уполномоченное физическое лицо, в том числе индивидуальный предприниматель;
    //5 - работник организации – покупателя;
    //6 - работник организации – составителя файла обмена информации покупателя, если составитель файла обмена информации покупателя не является покупателем.
    property SignerStatus:Int64 read FSignerStatus write SetSignerStatus;
  end;

  {  TExtendedSignerDetails_SellerTitle  }
  TExtendedSignerDetails_SellerTitle = class(TExtendedSignerDetails)
  private
    FSignerPowers:Int64;
    procedure SetSignerPowers( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий0 - лицо, ответственное за подписание счетов-фактур
    //1 - лицо, совершившее сделку, операцию
    //2 - лицо, совершившее сделку, операцию и ответственное за ее оформление
    //3 - лицо, ответственное за оформление свершившегося события
    //4 - лицо, совершившее сделку, операцию и ответственное за подписание счетов-фактур
    //5 - лицо, совершившее сделку, операцию и ответственное за её оформление и за подписание счетов-фактур
    //6 - лицо, ответственное за оформление свершившегося события и за подписание счетов-фактур
    property SignerPowers:Int64 read FSignerPowers write SetSignerPowers;
  end;

  {  TExtendedSignerDetails_BuyerTitle  }
  TExtendedSignerDetails_BuyerTitle = class(TExtendedSignerDetails)
  private
    FSignerPowers:Int64;
    procedure SetSignerPowers( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий1 - лицо, совершившее сделку, операцию
    //2 - лицо, совершившее сделку, операцию и ответственное за ее оформление
    //3 - лицо, ответственное за оформление свершившегося события
    property SignerPowers:Int64 read FSignerPowers write SetSignerPowers;
  end;

  {  TExtendedSignerDetails_BuyerTitle820  }
  TExtendedSignerDetails_BuyerTitle820 = class(TExtendedSignerDetailsBase)
  private
    FSignerPowers:Int64;
    FSignerStatus:Int64;
    procedure SetSignerPowers( AValue:Int64);
    procedure SetSignerStatus( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий1 - лицо, совершившее сделку, операцию
    //2 - лицо, совершившее сделку, операцию и ответственное за ее оформление
    //3 - лицо, ответственное за оформление свершившегося события
    property SignerPowers:Int64 read FSignerPowers write SetSignerPowers;
    //Статус3 - работник иной уполномоченной организации;
    //4 - уполномоченное физическое лицо, в том числе индивидуальный предприниматель;
    //5 - работник организации – покупателя;
    //6 - работник организации – составителя файла обмена информации покупателя, если составитель файла обмена информации покупателя не является покупателем.
    property SignerStatus:Int64 read FSignerStatus write SetSignerStatus;
  end;

  {  TExtendedSignerDetails_CorrectionSellerTitle  }
  TExtendedSignerDetails_CorrectionSellerTitle = class(TExtendedSignerDetails)
  private
    FSignerPowers:Int64;
    procedure SetSignerPowers( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий0 - лицо, ответственное за подписание счетов-фактур;
    //3 – лицо, ответственное за оформление свершившегося события;
    //6 - лицо, совершившее сделку, операцию и ответственное за подписание счетов-фактур
    property SignerPowers:Int64 read FSignerPowers write SetSignerPowers;
  end;

  {  TExtendedSignerDetails_CorrectionBuyerTitle  }
  TExtendedSignerDetails_CorrectionBuyerTitle = class(TExtendedSignerDetails)
  private
    FSignerPowers:Int64;
    procedure SetSignerPowers( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий3 – лицо, ответственное за оформление свершившегося события;
    property SignerPowers:Int64 read FSignerPowers write SetSignerPowers;
  end;

  {  TExtendedSignerDetails_CorrectionBuyerTitle736  }
  TExtendedSignerDetails_CorrectionBuyerTitle736 = class(TExtendedSignerDetails736)
  private
    FSignerPowers:Int64;
    procedure SetSignerPowers( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий0 - лицо, ответственное за подписание счетов-фактур;
    //3 – лицо, ответственное за оформление свершившегося события;
    //6 - лицо, совершившее сделку, операцию и ответственное за подписание счетов-фактур;
    //29 - лицо с иными полномочиями
    property SignerPowers:Int64 read FSignerPowers write SetSignerPowers;
  end;

  {  TExtendedSignerDetails_551_552  }
  TExtendedSignerDetails_551_552 = class(TExtendedSignerDetails)
  private
    FSignerPowers:Int64;
    procedure SetSignerPowers( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий1 - лицо, совершившее сделку, операцию;
    //2 – лицо, совершившее сделку, операцию и ответственное за ее оформление;
    //3 – лицо, ответственное за оформление свершившегося события
    property SignerPowers:Int64 read FSignerPowers write SetSignerPowers;
  end;

  {  TExtendedSignerDetails_Torg2Buyer  }
  TExtendedSignerDetails_Torg2Buyer = class(TExtendedSignerDetailsBase)
  private
    FSignerPowers:Int64;
    FSignerStatus:Int64;
    procedure SetSignerPowers( AValue:Int64);
    procedure SetSignerStatus( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий1 - лицо, принявшее ценности
    //2 - лицо, принявшее ценности и ответственное за оформление события (операции)
    //3 - лицо, ответственное за оформление события (операции)
    //7 - председатель комиссии
    //8 - член комиссии
    property SignerPowers:Int64 read FSignerPowers write SetSignerPowers;
    //Статус3 - работник иной уполномоченной организации;
    //4 - уполномоченное физическое лицо, в том числе индивидуальный предприниматель;
    //5 - работник организации – покупателя;
    //6 - работник организации – составителя файла обмена информации покупателя, если составитель файла обмена информации покупателя не является покупателем.
    property SignerStatus:Int64 read FSignerStatus write SetSignerStatus;
  end;

  {  TExtendedSignerDetails_Torg2AdditionalInfo  }
  TExtendedSignerDetails_Torg2AdditionalInfo = class(TExtendedSignerDetailsBase)
  private
    FSignerPowers:Int64;
    FSignerStatus:Int64;
    procedure SetSignerPowers( AValue:Int64);
    procedure SetSignerStatus( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОблПолн - Область полномочий21 - лицо, в полномочия которого входит утверждение документа, оформляющего событие (факт хозяйственной жизни)
    //22 - лицо, в полномочия которого входит подтверждение оформленного события (факта хозяйственной жизни)
    //23 - лицо, в полномочия которого входит согласование документа, оформляющего событие (факт хозяйственной жизни)
    //29 - лицо с иными полномочиями
    property SignerPowers:Int64 read FSignerPowers write SetSignerPowers;
    //Статус1 - работник организации - продавца
    //3 - работник иной уполномоченной организации
    //4 - уполномоченное физическое лицо (в том числе индивидуальный предприниматель)
    //5 - работник организации-покупателя
    //6 - работник организации - составителя файла обмена информации покупателя
    property SignerStatus:Int64 read FSignerStatus write SetSignerStatus;
  end;

implementation

  {  TUniversalCorrectionDocument  }
procedure TUniversalCorrectionDocument.SetFunction1(AValue: String);
begin
  CheckLockupValue('Function1', AValue);
  FFunction1:=AValue;
  ModifiedProperty('Function1');
end;

procedure TUniversalCorrectionDocument.SetDocumentName(AValue: Tstring255);
begin
  CheckStrMinSize('DocumentName', AValue);
  CheckStrMaxSize('DocumentName', AValue);
  FDocumentName:=AValue;
  ModifiedProperty('DocumentName');
end;

procedure TUniversalCorrectionDocument.SetDocumentDate(AValue: Tdate1);
begin
  CheckStrMinSize('DocumentDate', AValue);
  CheckStrMaxSize('DocumentDate', AValue);
  FDocumentDate:=AValue;
  ModifiedProperty('DocumentDate');
end;

procedure TUniversalCorrectionDocument.SetDocumentNumber(AValue: Tstring1000);
begin
  CheckStrMinSize('DocumentNumber', AValue);
  CheckStrMaxSize('DocumentNumber', AValue);
  FDocumentNumber:=AValue;
  ModifiedProperty('DocumentNumber');
end;

procedure TUniversalCorrectionDocument.SetCurrency(AValue: Tokv);
begin
  CheckStrMinSize('Currency', AValue);
  CheckStrMaxSize('Currency', AValue);
  FCurrency:=AValue;
  ModifiedProperty('Currency');
end;

procedure TUniversalCorrectionDocument.SetCurrencyName(AValue: String);
begin
  CheckLockupValue('CurrencyName', AValue);
  FCurrencyName:=AValue;
  ModifiedProperty('CurrencyName');
end;

procedure TUniversalCorrectionDocument.SetCurrencyRate(AValue: Double);
begin
  FCurrencyRate:=AValue;
  ModifiedProperty('CurrencyRate');
end;

procedure TUniversalCorrectionDocument.SetCorrectionRevisionDate(AValue: Tdate1);
begin
  CheckStrMinSize('CorrectionRevisionDate', AValue);
  CheckStrMaxSize('CorrectionRevisionDate', AValue);
  FCorrectionRevisionDate:=AValue;
  ModifiedProperty('CorrectionRevisionDate');
end;

procedure TUniversalCorrectionDocument.SetCorrectionRevisionNumber(AValue: Int64);
begin
  FCorrectionRevisionNumber:=AValue;
  ModifiedProperty('CorrectionRevisionNumber');
end;

procedure TUniversalCorrectionDocument.SetDocumentCreator(AValue: Tstring1000);
begin
  CheckStrMinSize('DocumentCreator', AValue);
  CheckStrMaxSize('DocumentCreator', AValue);
  FDocumentCreator:=AValue;
  ModifiedProperty('DocumentCreator');
end;

procedure TUniversalCorrectionDocument.SetDocumentCreatorBase(AValue: Tstring120);
begin
  CheckStrMinSize('DocumentCreatorBase', AValue);
  CheckStrMaxSize('DocumentCreatorBase', AValue);
  FDocumentCreatorBase:=AValue;
  ModifiedProperty('DocumentCreatorBase');
end;

procedure TUniversalCorrectionDocument.SetGovernmentContractInfo(AValue: String);
begin
  CheckStrMinSize('GovernmentContractInfo', AValue);
  CheckStrMaxSize('GovernmentContractInfo', AValue);
  FGovernmentContractInfo:=AValue;
  ModifiedProperty('GovernmentContractInfo');
end;

procedure TUniversalCorrectionDocument.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Invoices', 'Invoices', [], '', -1, -1);
  P:=RegisterProperty('Seller', 'Seller', [], '', -1, -1);
  P:=RegisterProperty('Buyer', 'Buyer', [], '', -1, -1);
  P:=RegisterProperty('Table', 'Table', [], '', -1, -1);
  P:=RegisterProperty('EventContent', 'EventContent', [], '', -1, -1);
  P:=RegisterProperty('AdditionalInfoId', 'AdditionalInfoId', [], '', -1, -1);
  P:=RegisterProperty('Signers', 'Signers', [], '', -1, -1);
  P:=RegisterProperty('Function1', 'Function', [xsaRequared], '', -1, -1);
    P.ValidList.Add('КСЧФ');
    P.ValidList.Add('КСЧФДИС');
    P.ValidList.Add('ДИС');
    P.ValidList.Add('СвИСРК');
    P.ValidList.Add('СвИСЗК');
  P:=RegisterProperty('DocumentName', 'DocumentName', [], '', 1, 255);
  P:=RegisterProperty('DocumentDate', 'DocumentDate', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('DocumentNumber', 'DocumentNumber', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('Currency', 'Currency', [xsaRequared], '', 3, 3);
  P:=RegisterProperty('CurrencyName', 'CurrencyName', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('0');
  P:=RegisterProperty('CurrencyRate', 'CurrencyRate', [], '', -1, -1);
    P.TotalDigits := 10;
    P.FractionDigits := 4;
  P:=RegisterProperty('CorrectionRevisionDate', 'CorrectionRevisionDate', [], '', 10, 10);
  P:=RegisterProperty('CorrectionRevisionNumber', 'CorrectionRevisionNumber', [], '', -1, -1);
    P.TotalDigits := 3;
    P.FractionDigits := 0;
  P:=RegisterProperty('DocumentCreator', 'DocumentCreator', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('DocumentCreatorBase', 'DocumentCreatorBase', [], '', 1, 120);
  P:=RegisterProperty('GovernmentContractInfo', 'GovernmentContractInfo', [], '', 20, 25);
end;

procedure TUniversalCorrectionDocument.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FInvoices:=TUniversalCorrectionDocument_Invoices.Create;
  FSeller:=TExtendedOrganizationInfo_ForeignAddress1000.Create;
  FBuyer:=TExtendedOrganizationInfo_ForeignAddress1000.Create;
  FTable:=TInvoiceCorrectionTable.Create;
  FEventContent:=TEventContent.Create;
  FAdditionalInfoId:=TAdditionalInfoId736.Create;
  FSigners:=TUniversalCorrectionDocument_Signers.Create;
end;

destructor TUniversalCorrectionDocument.Destroy;
begin
  FInvoices.Free;
  FSeller.Free;
  FBuyer.Free;
  FTable.Free;
  FEventContent.Free;
  FAdditionalInfoId.Free;
  FSigners.Free;
  inherited Destroy;
end;

function TUniversalCorrectionDocument.RootNodeName:string;
begin
  Result:='UniversalCorrectionDocument';
end;

constructor TUniversalCorrectionDocument.Create;
begin
  inherited Create;
end;

  {  TUniversalCorrectionDocument_Invoices  }
procedure TUniversalCorrectionDocument_Invoices.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Invoice', 'Invoice', [], '', -1, -1);
end;

procedure TUniversalCorrectionDocument_Invoices.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FInvoice:=TInvoiceForCorrectionInfoList.Create;
end;

destructor TUniversalCorrectionDocument_Invoices.Destroy;
begin
  FInvoice.Free;
  inherited Destroy;
end;

constructor TUniversalCorrectionDocument_Invoices.Create;
begin
  inherited Create;
end;

  {  TUniversalCorrectionDocument_Signers  }
procedure TUniversalCorrectionDocument_Signers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerReference', 'SignerReference', [], '', -1, -1);
  P:=RegisterProperty('SignerDetails', 'SignerDetails', [], '', -1, -1);
end;

procedure TUniversalCorrectionDocument_Signers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSignerReference:=TSignerReference.Create;
  FSignerDetails:=TExtendedSignerDetails_CorrectionSellerTitle.Create;
end;

destructor TUniversalCorrectionDocument_Signers.Destroy;
begin
  FSignerReference.Free;
  FSignerDetails.Free;
  inherited Destroy;
end;

constructor TUniversalCorrectionDocument_Signers.Create;
begin
  inherited Create;
end;

  {  TInvoiceForCorrectionInfo  }
procedure TInvoiceForCorrectionInfo.SetDate(AValue: Tdate1);
begin
  CheckStrMinSize('Date', AValue);
  CheckStrMaxSize('Date', AValue);
  FDate:=AValue;
  ModifiedProperty('Date');
end;

procedure TInvoiceForCorrectionInfo.SetNumber(AValue: Tstring1000);
begin
  CheckStrMinSize('Number', AValue);
  CheckStrMaxSize('Number', AValue);
  FNumber:=AValue;
  ModifiedProperty('Number');
end;

procedure TInvoiceForCorrectionInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Revision', 'Revision', [], '', -1, -1);
  P:=RegisterProperty('Date', 'Date', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('Number', 'Number', [xsaRequared], '', 1, 1000);
end;

procedure TInvoiceForCorrectionInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FRevision:=TInvoiceForCorrectionInfo_RevisionList.Create;
end;

destructor TInvoiceForCorrectionInfo.Destroy;
begin
  FRevision.Free;
  inherited Destroy;
end;

constructor TInvoiceForCorrectionInfo.Create;
begin
  inherited Create;
end;

  {  TInvoiceForCorrectionInfo_Revision  }
procedure TInvoiceForCorrectionInfo_Revision.SetDate(AValue: Tdate1);
begin
  CheckStrMinSize('Date', AValue);
  CheckStrMaxSize('Date', AValue);
  FDate:=AValue;
  ModifiedProperty('Date');
end;

procedure TInvoiceForCorrectionInfo_Revision.SetNumber(AValue: Int64);
begin
  FNumber:=AValue;
  ModifiedProperty('Number');
end;

procedure TInvoiceForCorrectionInfo_Revision.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Date', 'Date', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('Number', 'Number', [xsaRequared], '', -1, -1);
    P.TotalDigits := 3;
    P.FractionDigits := 0;
end;

procedure TInvoiceForCorrectionInfo_Revision.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInvoiceForCorrectionInfo_Revision.Destroy;
begin
  inherited Destroy;
end;

constructor TInvoiceForCorrectionInfo_Revision.Create;
begin
  inherited Create;
end;

  {  TInvoiceCorrectionTable  }
procedure TInvoiceCorrectionTable.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Items', 'Items', [], '', -1, -1);
  P:=RegisterProperty('TotalsInc', 'TotalsInc', [], '', -1, -1);
  P:=RegisterProperty('TotalsDec', 'TotalsDec', [], '', -1, -1);
end;

procedure TInvoiceCorrectionTable.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItems:=TInvoiceCorrectionTable_Items.Create;
  FTotalsInc:=TInvoiceTotalsDiff736.Create;
  FTotalsDec:=TInvoiceTotalsDiff736.Create;
end;

destructor TInvoiceCorrectionTable.Destroy;
begin
  FItems.Free;
  FTotalsInc.Free;
  FTotalsDec.Free;
  inherited Destroy;
end;

constructor TInvoiceCorrectionTable.Create;
begin
  inherited Create;
end;

  {  TInvoiceCorrectionTable_Items  }
procedure TInvoiceCorrectionTable_Items.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Item', 'Item', [], '', -1, -1);
end;

procedure TInvoiceCorrectionTable_Items.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItem:=TExtendedInvoiceCorrectionItemList.Create;
end;

destructor TInvoiceCorrectionTable_Items.Destroy;
begin
  FItem.Free;
  inherited Destroy;
end;

constructor TInvoiceCorrectionTable_Items.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem  }
procedure TExtendedInvoiceCorrectionItem.SetProduct(AValue: Tstring1000);
begin
  CheckStrMinSize('Product', AValue);
  CheckStrMaxSize('Product', AValue);
  FProduct:=AValue;
  ModifiedProperty('Product');
end;

procedure TExtendedInvoiceCorrectionItem.SetItemCharact(AValue: Tstring1000);
begin
  CheckStrMinSize('ItemCharact', AValue);
  CheckStrMaxSize('ItemCharact', AValue);
  FItemCharact:=AValue;
  ModifiedProperty('ItemCharact');
end;

procedure TExtendedInvoiceCorrectionItem.SetItemKind(AValue: Tstring10);
begin
  CheckStrMinSize('ItemKind', AValue);
  CheckStrMaxSize('ItemKind', AValue);
  FItemKind:=AValue;
  ModifiedProperty('ItemKind');
end;

procedure TExtendedInvoiceCorrectionItem.SetItemArticle(AValue: Tstring50);
begin
  CheckStrMinSize('ItemArticle', AValue);
  CheckStrMaxSize('ItemArticle', AValue);
  FItemArticle:=AValue;
  ModifiedProperty('ItemArticle');
end;

procedure TExtendedInvoiceCorrectionItem.SetItemVendorCode(AValue: Tstring255);
begin
  CheckStrMinSize('ItemVendorCode', AValue);
  CheckStrMaxSize('ItemVendorCode', AValue);
  FItemVendorCode:=AValue;
  ModifiedProperty('ItemVendorCode');
end;

procedure TExtendedInvoiceCorrectionItem.SetItemTypeCode(AValue: Tstring10);
begin
  CheckStrMinSize('ItemTypeCode', AValue);
  CheckStrMaxSize('ItemTypeCode', AValue);
  FItemTypeCode:=AValue;
  ModifiedProperty('ItemTypeCode');
end;

procedure TExtendedInvoiceCorrectionItem.SetOriginalNumber(AValue: Tinteger6);
begin
  FOriginalNumber:=AValue;
  ModifiedProperty('OriginalNumber');
end;

procedure TExtendedInvoiceCorrectionItem.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TaxRate', 'TaxRate', [], '', -1, -1);
  P:=RegisterProperty('UnitName', 'UnitName', [], '', -1, -1);
  P:=RegisterProperty('Unit1', 'Unit', [], '', -1, -1);
  P:=RegisterProperty('Quantity', 'Quantity', [], '', -1, -1);
  P:=RegisterProperty('Price', 'Price', [], '', -1, -1);
  P:=RegisterProperty('Excise', 'Excise', [], '', -1, -1);
  P:=RegisterProperty('SubtotalWithVatExcluded', 'SubtotalWithVatExcluded', [], '', -1, -1);
  P:=RegisterProperty('Vat', 'Vat', [], '', -1, -1);
  P:=RegisterProperty('WithoutVat', 'WithoutVat', [], '', -1, -1);
  P:=RegisterProperty('Subtotal', 'Subtotal', [], '', -1, -1);
  P:=RegisterProperty('ItemTracingInfos', 'ItemTracingInfos', [], '', -1, -1);
  P:=RegisterProperty('OriginalItemIdentificationNumbers', 'OriginalItemIdentificationNumbers', [], '', -1, -1);
  P:=RegisterProperty('CorrectedItemIdentificationNumbers', 'CorrectedItemIdentificationNumbers', [], '', -1, -1);
  P:=RegisterProperty('AdditionalInfos', 'AdditionalInfos', [], '', -1, -1);
  P:=RegisterProperty('Product', 'Product', [], '', 1, 1000);
  P:=RegisterProperty('ItemCharact', 'ItemCharact', [], '', 1, 1000);
  P:=RegisterProperty('ItemKind', 'ItemKind', [], '', 1, 10);
  P:=RegisterProperty('ItemArticle', 'ItemArticle', [], '', 1, 50);
  P:=RegisterProperty('ItemVendorCode', 'ItemVendorCode', [], '', 1, 255);
  P:=RegisterProperty('ItemTypeCode', 'ItemTypeCode', [], '', 1, 10);
  P:=RegisterProperty('OriginalNumber', 'OriginalNumber', [], '', -1, -1);
    P.TotalDigits := 6;
    P.FractionDigits := 0;
end;

procedure TExtendedInvoiceCorrectionItem.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FTaxRate:=TExtendedInvoiceCorrectionItem_TaxRate.Create;
  FUnitName:=TExtendedInvoiceCorrectionItem_UnitName.Create;
  FUnit1:=TExtendedInvoiceCorrectionItem_Unit.Create;
  FQuantity:=TExtendedInvoiceCorrectionItem_Quantity.Create;
  FPrice:=TExtendedInvoiceCorrectionItem_Price.Create;
  FExcise:=TExtendedInvoiceCorrectionItem_Excise.Create;
  FSubtotalWithVatExcluded:=TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded.Create;
  FVat:=TExtendedInvoiceCorrectionItem_Vat.Create;
  FWithoutVat:=TExtendedInvoiceCorrectionItem_WithoutVat.Create;
  FSubtotal:=TExtendedInvoiceCorrectionItem_Subtotal.Create;
  FItemTracingInfos:=TExtendedInvoiceCorrectionItem_ItemTracingInfos.Create;
  FOriginalItemIdentificationNumbers:=TItemIdentificationNumbers.Create;
  FCorrectedItemIdentificationNumbers:=TItemIdentificationNumbers.Create;
  FAdditionalInfos:=TExtendedInvoiceCorrectionItem_AdditionalInfos.Create;
end;

destructor TExtendedInvoiceCorrectionItem.Destroy;
begin
  FTaxRate.Free;
  FUnitName.Free;
  FUnit1.Free;
  FQuantity.Free;
  FPrice.Free;
  FExcise.Free;
  FSubtotalWithVatExcluded.Free;
  FVat.Free;
  FWithoutVat.Free;
  FSubtotal.Free;
  FItemTracingInfos.Free;
  FOriginalItemIdentificationNumbers.Free;
  FCorrectedItemIdentificationNumbers.Free;
  FAdditionalInfos.Free;
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_TaxRate  }
procedure TExtendedInvoiceCorrectionItem_TaxRate.SetOriginalValue(AValue: TTaxRateWithTwentyPercentAndTaxedByAgent);
begin
  CheckLockupValue('OriginalValue', AValue);
  FOriginalValue:=AValue;
  ModifiedProperty('OriginalValue');
end;

procedure TExtendedInvoiceCorrectionItem_TaxRate.SetCorrectedValue(AValue: TTaxRateWithTwentyPercentAndTaxedByAgent);
begin
  CheckLockupValue('CorrectedValue', AValue);
  FCorrectedValue:=AValue;
  ModifiedProperty('CorrectedValue');
end;

procedure TExtendedInvoiceCorrectionItem_TaxRate.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OriginalValue', 'OriginalValue', [xsaRequared], '', -1, -1);
    P.ValidList.Add('без НДС');
    P.ValidList.Add('0%');
    P.ValidList.Add('10%');
    P.ValidList.Add('18%');
    P.ValidList.Add('20%');
    P.ValidList.Add('10/110');
    P.ValidList.Add('18/118');
    P.ValidList.Add('20/120');
    P.ValidList.Add('НДС исчисляется налоговым агентом');
  P:=RegisterProperty('CorrectedValue', 'CorrectedValue', [xsaRequared], '', -1, -1);
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

procedure TExtendedInvoiceCorrectionItem_TaxRate.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_TaxRate.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_TaxRate.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_UnitName  }
procedure TExtendedInvoiceCorrectionItem_UnitName.SetOriginalValue(AValue: Tstring255);
begin
  CheckStrMinSize('OriginalValue', AValue);
  CheckStrMaxSize('OriginalValue', AValue);
  FOriginalValue:=AValue;
  ModifiedProperty('OriginalValue');
end;

procedure TExtendedInvoiceCorrectionItem_UnitName.SetCorrectedValue(AValue: Tstring255);
begin
  CheckStrMinSize('CorrectedValue', AValue);
  CheckStrMaxSize('CorrectedValue', AValue);
  FCorrectedValue:=AValue;
  ModifiedProperty('CorrectedValue');
end;

procedure TExtendedInvoiceCorrectionItem_UnitName.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OriginalValue', 'OriginalValue', [], '', 1, 255);
  P:=RegisterProperty('CorrectedValue', 'CorrectedValue', [], '', 1, 255);
end;

procedure TExtendedInvoiceCorrectionItem_UnitName.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_UnitName.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_UnitName.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_Unit  }
procedure TExtendedInvoiceCorrectionItem_Unit.SetOriginalValue(AValue: String);
begin
  FOriginalValue:=AValue;
  ModifiedProperty('OriginalValue');
end;

procedure TExtendedInvoiceCorrectionItem_Unit.SetCorrectedValue(AValue: String);
begin
  FCorrectedValue:=AValue;
  ModifiedProperty('CorrectedValue');
end;

procedure TExtendedInvoiceCorrectionItem_Unit.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OriginalValue', 'OriginalValue', [], '', -1, -1);
  P:=RegisterProperty('CorrectedValue', 'CorrectedValue', [], '', -1, -1);
end;

procedure TExtendedInvoiceCorrectionItem_Unit.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_Unit.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_Unit.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_Quantity  }
procedure TExtendedInvoiceCorrectionItem_Quantity.SetOriginalValue(AValue: Double);
begin
  FOriginalValue:=AValue;
  ModifiedProperty('OriginalValue');
end;

procedure TExtendedInvoiceCorrectionItem_Quantity.SetCorrectedValue(AValue: Double);
begin
  FCorrectedValue:=AValue;
  ModifiedProperty('CorrectedValue');
end;

procedure TExtendedInvoiceCorrectionItem_Quantity.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OriginalValue', 'OriginalValue', [], '', -1, -1);
  P:=RegisterProperty('CorrectedValue', 'CorrectedValue', [], '', -1, -1);
end;

procedure TExtendedInvoiceCorrectionItem_Quantity.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_Quantity.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_Quantity.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_Price  }
procedure TExtendedInvoiceCorrectionItem_Price.SetOriginalValue(AValue: Double);
begin
  FOriginalValue:=AValue;
  ModifiedProperty('OriginalValue');
end;

procedure TExtendedInvoiceCorrectionItem_Price.SetCorrectedValue(AValue: Double);
begin
  FCorrectedValue:=AValue;
  ModifiedProperty('CorrectedValue');
end;

procedure TExtendedInvoiceCorrectionItem_Price.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OriginalValue', 'OriginalValue', [], '', -1, -1);
  P:=RegisterProperty('CorrectedValue', 'CorrectedValue', [], '', -1, -1);
end;

procedure TExtendedInvoiceCorrectionItem_Price.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_Price.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_Price.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_Excise  }
procedure TExtendedInvoiceCorrectionItem_Excise.SetAmountsInc(AValue: Double);
begin
  FAmountsInc:=AValue;
  ModifiedProperty('AmountsInc');
end;

procedure TExtendedInvoiceCorrectionItem_Excise.SetAmountsDec(AValue: Double);
begin
  FAmountsDec:=AValue;
  ModifiedProperty('AmountsDec');
end;

procedure TExtendedInvoiceCorrectionItem_Excise.SetOriginalValue(AValue: Double);
begin
  FOriginalValue:=AValue;
  ModifiedProperty('OriginalValue');
end;

procedure TExtendedInvoiceCorrectionItem_Excise.SetCorrectedValue(AValue: Double);
begin
  FCorrectedValue:=AValue;
  ModifiedProperty('CorrectedValue');
end;

procedure TExtendedInvoiceCorrectionItem_Excise.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AmountsInc', 'AmountsInc', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('AmountsDec', 'AmountsDec', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('OriginalValue', 'OriginalValue', [], '', -1, -1);
  P:=RegisterProperty('CorrectedValue', 'CorrectedValue', [], '', -1, -1);
end;

procedure TExtendedInvoiceCorrectionItem_Excise.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_Excise.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_Excise.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded  }
procedure TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded.SetAmountsInc(AValue: Double);
begin
  FAmountsInc:=AValue;
  ModifiedProperty('AmountsInc');
end;

procedure TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded.SetAmountsDec(AValue: Double);
begin
  FAmountsDec:=AValue;
  ModifiedProperty('AmountsDec');
end;

procedure TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded.SetOriginalValue(AValue: Double);
begin
  FOriginalValue:=AValue;
  ModifiedProperty('OriginalValue');
end;

procedure TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded.SetCorrectedValue(AValue: Double);
begin
  FCorrectedValue:=AValue;
  ModifiedProperty('CorrectedValue');
end;

procedure TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AmountsInc', 'AmountsInc', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('AmountsDec', 'AmountsDec', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('OriginalValue', 'OriginalValue', [], '', -1, -1);
  P:=RegisterProperty('CorrectedValue', 'CorrectedValue', [], '', -1, -1);
end;

procedure TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_SubtotalWithVatExcluded.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_Vat  }
procedure TExtendedInvoiceCorrectionItem_Vat.SetAmountsInc(AValue: Double);
begin
  FAmountsInc:=AValue;
  ModifiedProperty('AmountsInc');
end;

procedure TExtendedInvoiceCorrectionItem_Vat.SetAmountsDec(AValue: Double);
begin
  FAmountsDec:=AValue;
  ModifiedProperty('AmountsDec');
end;

procedure TExtendedInvoiceCorrectionItem_Vat.SetOriginalValue(AValue: Double);
begin
  FOriginalValue:=AValue;
  ModifiedProperty('OriginalValue');
end;

procedure TExtendedInvoiceCorrectionItem_Vat.SetCorrectedValue(AValue: Double);
begin
  FCorrectedValue:=AValue;
  ModifiedProperty('CorrectedValue');
end;

procedure TExtendedInvoiceCorrectionItem_Vat.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AmountsInc', 'AmountsInc', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('AmountsDec', 'AmountsDec', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('OriginalValue', 'OriginalValue', [], '', -1, -1);
  P:=RegisterProperty('CorrectedValue', 'CorrectedValue', [], '', -1, -1);
end;

procedure TExtendedInvoiceCorrectionItem_Vat.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_Vat.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_Vat.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_WithoutVat  }
procedure TExtendedInvoiceCorrectionItem_WithoutVat.SetOriginalValue(AValue: String);
begin
  CheckLockupValue('OriginalValue', AValue);
  FOriginalValue:=AValue;
  ModifiedProperty('OriginalValue');
end;

procedure TExtendedInvoiceCorrectionItem_WithoutVat.SetCorrectedValue(AValue: String);
begin
  CheckLockupValue('CorrectedValue', AValue);
  FCorrectedValue:=AValue;
  ModifiedProperty('CorrectedValue');
end;

procedure TExtendedInvoiceCorrectionItem_WithoutVat.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OriginalValue', 'OriginalValue', [], '', -1, -1);
    P.ValidList.Add('true');
  P:=RegisterProperty('CorrectedValue', 'CorrectedValue', [], '', -1, -1);
    P.ValidList.Add('true');
end;

procedure TExtendedInvoiceCorrectionItem_WithoutVat.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_WithoutVat.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_WithoutVat.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_Subtotal  }
procedure TExtendedInvoiceCorrectionItem_Subtotal.SetAmountsInc(AValue: Double);
begin
  FAmountsInc:=AValue;
  ModifiedProperty('AmountsInc');
end;

procedure TExtendedInvoiceCorrectionItem_Subtotal.SetAmountsDec(AValue: Double);
begin
  FAmountsDec:=AValue;
  ModifiedProperty('AmountsDec');
end;

procedure TExtendedInvoiceCorrectionItem_Subtotal.SetOriginalValue(AValue: Double);
begin
  FOriginalValue:=AValue;
  ModifiedProperty('OriginalValue');
end;

procedure TExtendedInvoiceCorrectionItem_Subtotal.SetCorrectedValue(AValue: Double);
begin
  FCorrectedValue:=AValue;
  ModifiedProperty('CorrectedValue');
end;

procedure TExtendedInvoiceCorrectionItem_Subtotal.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AmountsInc', 'AmountsInc', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('AmountsDec', 'AmountsDec', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('OriginalValue', 'OriginalValue', [], '', -1, -1);
  P:=RegisterProperty('CorrectedValue', 'CorrectedValue', [], '', -1, -1);
end;

procedure TExtendedInvoiceCorrectionItem_Subtotal.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_Subtotal.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_Subtotal.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_ItemTracingInfos  }
procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ItemTracingInfo', 'ItemTracingInfo', [], '', -1, -1);
end;

procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItemTracingInfo:=TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfoList.Create;
end;

destructor TExtendedInvoiceCorrectionItem_ItemTracingInfos.Destroy;
begin
  FItemTracingInfo.Free;
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_ItemTracingInfos.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo  }
procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo.SetRegNumberUnit(AValue: Tstring29);
begin
  CheckStrMinSize('RegNumberUnit', AValue);
  CheckStrMaxSize('RegNumberUnit', AValue);
  FRegNumberUnit:=AValue;
  ModifiedProperty('RegNumberUnit');
end;

procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo.SetUnit1(AValue: Tokei);
begin
  CheckStrMinSize('Unit1', AValue);
  CheckStrMaxSize('Unit1', AValue);
  FUnit1:=AValue;
  ModifiedProperty('Unit1');
end;

procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo.SetItemAddInfo(AValue: Tstring255);
begin
  CheckStrMinSize('ItemAddInfo', AValue);
  CheckStrMaxSize('ItemAddInfo', AValue);
  FItemAddInfo:=AValue;
  ModifiedProperty('ItemAddInfo');
end;

procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('QuantityDiff', 'QuantityDiff', [], '', -1, -1);
  P:=RegisterProperty('RegNumberUnit', 'RegNumberUnit', [xsaRequared], '', 1, 29);
  P:=RegisterProperty('Unit1', 'Unit', [xsaRequared], '', 3, 4);
  P:=RegisterProperty('ItemAddInfo', 'ItemAddInfo', [], '', 1, 255);
end;

procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FQuantityDiff:=TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff.Create;
end;

destructor TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo.Destroy;
begin
  FQuantityDiff.Free;
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff  }
procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff.SetQuantityInc(AValue: TQuantityInc);
begin
  FQuantityInc:=AValue;
  ModifiedProperty('QuantityInc');
end;

procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff.SetQuantityDec(AValue: TQuantityDec);
begin
  FQuantityDec:=AValue;
  ModifiedProperty('QuantityDec');
end;

procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff.SetOriginalQuantity(AValue: Double);
begin
  FOriginalQuantity:=AValue;
  ModifiedProperty('OriginalQuantity');
end;

procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff.SetCorrectedQuantity(AValue: Double);
begin
  FCorrectedQuantity:=AValue;
  ModifiedProperty('CorrectedQuantity');
end;

procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('QuantityInc', 'QuantityInc', [xsaSimpleObject], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
  P:=RegisterProperty('QuantityDec', 'QuantityDec', [xsaSimpleObject], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
  P:=RegisterProperty('OriginalQuantity', 'OriginalQuantity', [xsaRequared], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
  P:=RegisterProperty('CorrectedQuantity', 'CorrectedQuantity', [xsaRequared], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
end;

procedure TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_ItemTracingInfos_ItemTracingInfo_QuantityDiff.Create;
begin
  inherited Create;
end;

  {  TExtendedInvoiceCorrectionItem_AdditionalInfos  }
procedure TExtendedInvoiceCorrectionItem_AdditionalInfos.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', -1, -1);
end;

procedure TExtendedInvoiceCorrectionItem_AdditionalInfos.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAdditionalInfo:=TAdditionalInfoList.Create;
end;

destructor TExtendedInvoiceCorrectionItem_AdditionalInfos.Destroy;
begin
  FAdditionalInfo.Free;
  inherited Destroy;
end;

constructor TExtendedInvoiceCorrectionItem_AdditionalInfos.Create;
begin
  inherited Create;
end;

  {  TItemIdentificationNumbers  }
procedure TItemIdentificationNumbers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ItemIdentificationNumber', 'ItemIdentificationNumber', [], '', -1, -1);
end;

procedure TItemIdentificationNumbers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItemIdentificationNumber:=TItemIdentificationNumbers_ItemIdentificationNumberList.Create;
end;

destructor TItemIdentificationNumbers.Destroy;
begin
  FItemIdentificationNumber.Free;
  inherited Destroy;
end;

constructor TItemIdentificationNumbers.Create;
begin
  inherited Create;
end;

  {  TItemIdentificationNumbers_ItemIdentificationNumber  }
procedure TItemIdentificationNumbers_ItemIdentificationNumber.SetUnit1(AValue: TXSDStringArray);
var
  V:Tstring255;
begin
  for V in AValue do
  begin
    CheckStrMinSize('Unit1', V);
    CheckStrMaxSize('Unit1', V);
  end;
  FUnit1:=AValue;
  ModifiedProperty('Unit1');
end;

procedure TItemIdentificationNumbers_ItemIdentificationNumber.SetPackageId(AValue: TXSDStringArray);
var
  V:Tstring255;
begin
  for V in AValue do
  begin
    CheckStrMinSize('PackageId', V);
    CheckStrMaxSize('PackageId', V);
  end;
  FPackageId:=AValue;
  ModifiedProperty('PackageId');
end;

procedure TItemIdentificationNumbers_ItemIdentificationNumber.SetTransPackageId(AValue: Tstring255);
begin
  CheckStrMinSize('TransPackageId', AValue);
  CheckStrMaxSize('TransPackageId', AValue);
  FTransPackageId:=AValue;
  ModifiedProperty('TransPackageId');
end;

procedure TItemIdentificationNumbers_ItemIdentificationNumber.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Unit1', 'Unit', [xsaSimpleObject], '', 1, 255);
  P:=RegisterProperty('PackageId', 'PackageId', [xsaSimpleObject], '', 1, 255);
  P:=RegisterProperty('TransPackageId', 'TransPackageId', [], '', 1, 255);
end;

procedure TItemIdentificationNumbers_ItemIdentificationNumber.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TItemIdentificationNumbers_ItemIdentificationNumber.Destroy;
begin
  inherited Destroy;
end;

constructor TItemIdentificationNumbers_ItemIdentificationNumber.Create;
begin
  inherited Create;
end;

  {  TEventContent  }
procedure TEventContent.SetCostChangeInfo(AValue: Tstring2000);
begin
  CheckStrMinSize('CostChangeInfo', AValue);
  CheckStrMaxSize('CostChangeInfo', AValue);
  FCostChangeInfo:=AValue;
  ModifiedProperty('CostChangeInfo');
end;

procedure TEventContent.SetOperationContent(AValue: Tstring255);
begin
  CheckStrMinSize('OperationContent', AValue);
  CheckStrMaxSize('OperationContent', AValue);
  FOperationContent:=AValue;
  ModifiedProperty('OperationContent');
end;

procedure TEventContent.SetNotificationDate(AValue: Tdate1);
begin
  CheckStrMinSize('NotificationDate', AValue);
  CheckStrMaxSize('NotificationDate', AValue);
  FNotificationDate:=AValue;
  ModifiedProperty('NotificationDate');
end;

procedure TEventContent.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TransferDocDetails', 'TransferDocDetails', [], '', -1, -1);
  P:=RegisterProperty('CorrectionBase', 'CorrectionBase', [], '', -1, -1);
  P:=RegisterProperty('CostChangeInfo', 'CostChangeInfo', [], '', 1, 2000);
  P:=RegisterProperty('OperationContent', 'OperationContent', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('NotificationDate', 'NotificationDate', [], '', 10, 10);
end;

procedure TEventContent.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FTransferDocDetails:=TDocTypeList.Create;
  FCorrectionBase:=TDocTypeList.Create;
end;

destructor TEventContent.Destroy;
begin
  FTransferDocDetails.Free;
  FCorrectionBase.Free;
  inherited Destroy;
end;

constructor TEventContent.Create;
begin
  inherited Create;
end;

  {  TDocType  }
procedure TDocType.SetBaseDocumentName(AValue: Tstring255);
begin
  CheckStrMinSize('BaseDocumentName', AValue);
  CheckStrMaxSize('BaseDocumentName', AValue);
  FBaseDocumentName:=AValue;
  ModifiedProperty('BaseDocumentName');
end;

procedure TDocType.SetBaseDocumentNumber(AValue: Tstring255);
begin
  CheckStrMinSize('BaseDocumentNumber', AValue);
  CheckStrMaxSize('BaseDocumentNumber', AValue);
  FBaseDocumentNumber:=AValue;
  ModifiedProperty('BaseDocumentNumber');
end;

procedure TDocType.SetBaseDocumentDate(AValue: Tdate1);
begin
  CheckStrMinSize('BaseDocumentDate', AValue);
  CheckStrMaxSize('BaseDocumentDate', AValue);
  FBaseDocumentDate:=AValue;
  ModifiedProperty('BaseDocumentDate');
end;

procedure TDocType.SetAdditionalInfo(AValue: Tstring1000);
begin
  CheckStrMinSize('AdditionalInfo', AValue);
  CheckStrMaxSize('AdditionalInfo', AValue);
  FAdditionalInfo:=AValue;
  ModifiedProperty('AdditionalInfo');
end;

procedure TDocType.SetBaseIdFile(AValue: Tstring255);
begin
  CheckStrMinSize('BaseIdFile', AValue);
  CheckStrMaxSize('BaseIdFile', AValue);
  FBaseIdFile:=AValue;
  ModifiedProperty('BaseIdFile');
end;

procedure TDocType.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BaseDocumentName', 'BaseDocumentName', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('BaseDocumentNumber', 'BaseDocumentNumber', [], '', 1, 255);
  P:=RegisterProperty('BaseDocumentDate', 'BaseDocumentDate', [], '', 10, 10);
  P:=RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', 1, 1000);
  P:=RegisterProperty('BaseIdFile', 'BaseIdFile', [], '', 1, 255);
end;

procedure TDocType.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TDocType.Destroy;
begin
  inherited Destroy;
end;

constructor TDocType.Create;
begin
  inherited Create;
end;

  {  TAdditionalInfoId  }
procedure TAdditionalInfoId.SetInfoFileId(AValue: String);
begin
  CheckStrMinSize('InfoFileId', AValue);
  CheckStrMaxSize('InfoFileId', AValue);
  FInfoFileId:=AValue;
  ModifiedProperty('InfoFileId');
end;

procedure TAdditionalInfoId.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', -1, -1);
  P:=RegisterProperty('InfoFileId', 'InfoFileId', [], '', 36, 36);
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

constructor TAdditionalInfoId.Create;
begin
  inherited Create;
end;

  {  TAdditionalInfoId736  }
procedure TAdditionalInfoId736.SetInfoFileId(AValue: String);
begin
  CheckStrMinSize('InfoFileId', AValue);
  CheckStrMaxSize('InfoFileId', AValue);
  FInfoFileId:=AValue;
  ModifiedProperty('InfoFileId');
end;

procedure TAdditionalInfoId736.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', -1, -1);
  P:=RegisterProperty('InfoFileId', 'InfoFileId', [], '', 36, 36);
end;

procedure TAdditionalInfoId736.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAdditionalInfo:=TAdditionalInfoList.Create;
end;

destructor TAdditionalInfoId736.Destroy;
begin
  FAdditionalInfo.Free;
  inherited Destroy;
end;

constructor TAdditionalInfoId736.Create;
begin
  inherited Create;
end;

  {  TAdditionalInfo  }
procedure TAdditionalInfo.SetId(AValue: Tstring50);
begin
  CheckStrMinSize('Id', AValue);
  CheckStrMaxSize('Id', AValue);
  FId:=AValue;
  ModifiedProperty('Id');
end;

procedure TAdditionalInfo.SetValue(AValue: Tstring2000);
begin
  CheckStrMinSize('Value', AValue);
  CheckStrMaxSize('Value', AValue);
  FValue:=AValue;
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

constructor TAdditionalInfo.Create;
begin
  inherited Create;
end;

  {  TCustomsDeclaration  }
procedure TCustomsDeclaration.SetCountry(AValue: Tstring1000);
begin
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TCustomsDeclaration.SetDeclarationNumber(AValue: Tstring1000);
begin
  CheckStrMinSize('DeclarationNumber', AValue);
  CheckStrMaxSize('DeclarationNumber', AValue);
  FDeclarationNumber:=AValue;
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

constructor TCustomsDeclaration.Create;
begin
  inherited Create;
end;

  {  TCustomsDeclarationWithHyphens  }
procedure TCustomsDeclarationWithHyphens.SetCountry(AValue: Tstring1000);
begin
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TCustomsDeclarationWithHyphens.SetHyphenCountry(AValue: String);
begin
  CheckLockupValue('HyphenCountry', AValue);
  CheckFixedValue('HyphenCountry', AValue);
  FHyphenCountry:=AValue;
  ModifiedProperty('HyphenCountry');
end;

procedure TCustomsDeclarationWithHyphens.SetDeclarationNumber(AValue: Tstring1000);
begin
  CheckStrMinSize('DeclarationNumber', AValue);
  CheckStrMaxSize('DeclarationNumber', AValue);
  FDeclarationNumber:=AValue;
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

constructor TCustomsDeclarationWithHyphens.Create;
begin
  inherited Create;
  HyphenCountry:='false';
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

constructor TInvoiceTotalsDiff.Create;
begin
  inherited Create;
end;

  {  TInvoiceTotalsDiff736  }
procedure TInvoiceTotalsDiff736.SetTotalWithVatExcluded(AValue: Double);
begin
  FTotalWithVatExcluded:=AValue;
  ModifiedProperty('TotalWithVatExcluded');
end;

procedure TInvoiceTotalsDiff736.SetVat(AValue: Double);
begin
  FVat:=AValue;
  ModifiedProperty('Vat');
end;

procedure TInvoiceTotalsDiff736.SetWithoutVat(AValue: String);
begin
  CheckLockupValue('WithoutVat', AValue);
  FWithoutVat:=AValue;
  ModifiedProperty('WithoutVat');
end;

procedure TInvoiceTotalsDiff736.SetTotal(AValue: Double);
begin
  FTotal:=AValue;
  ModifiedProperty('Total');
end;

procedure TInvoiceTotalsDiff736.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TotalWithVatExcluded', 'TotalWithVatExcluded', [xsaRequared], '', -1, -1);
  P:=RegisterProperty('Vat', 'Vat', [], '', -1, -1);
  P:=RegisterProperty('WithoutVat', 'WithoutVat', [], '', -1, -1);
    P.ValidList.Add('true');
  P:=RegisterProperty('Total', 'Total', [], '', -1, -1);
end;

procedure TInvoiceTotalsDiff736.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInvoiceTotalsDiff736.Destroy;
begin
  inherited Destroy;
end;

constructor TInvoiceTotalsDiff736.Create;
begin
  inherited Create;
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

constructor TInvoiceItemAmountsDiff.Create;
begin
  inherited Create;
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

constructor TCorrectableInvoiceItemFields_WithoutTaxRate.Create;
begin
  inherited Create;
end;

  {  TCorrectableInvoiceItemFields  }
procedure TCorrectableInvoiceItemFields.SetTaxRate(AValue: TTaxRate);
begin
  CheckLockupValue('TaxRate', AValue);
  FTaxRate:=AValue;
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

constructor TCorrectableInvoiceItemFields.Create;
begin
  inherited Create;
end;

  {  TCorrectableInvoiceItemFields_WithTwentyPercent  }
procedure TCorrectableInvoiceItemFields_WithTwentyPercent.SetTaxRate(AValue: TTaxRateWithTwentyPercent);
begin
  CheckLockupValue('TaxRate', AValue);
  FTaxRate:=AValue;
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

constructor TCorrectableInvoiceItemFields_WithTwentyPercent.Create;
begin
  inherited Create;
end;

  {  TCorrectableInvoiceItemFields_WithTaxedByAgent  }
procedure TCorrectableInvoiceItemFields_WithTaxedByAgent.SetTaxRate(AValue: TTaxRateWithTaxedByAgent);
begin
  CheckLockupValue('TaxRate', AValue);
  FTaxRate:=AValue;
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

constructor TCorrectableInvoiceItemFields_WithTaxedByAgent.Create;
begin
  inherited Create;
end;

  {  TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent  }
procedure TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent.SetTaxRate(AValue: TTaxRateWithTwentyPercentAndTaxedByAgent);
begin
  CheckLockupValue('TaxRate', AValue);
  FTaxRate:=AValue;
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

constructor TCorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent.Create;
begin
  inherited Create;
end;

  {  TAttorney  }
procedure TAttorney.SetDate(AValue: Tdate1);
begin
  CheckStrMinSize('Date', AValue);
  CheckStrMaxSize('Date', AValue);
  FDate:=AValue;
  ModifiedProperty('Date');
end;

procedure TAttorney.SetNumber(AValue: Tstring255);
begin
  CheckStrMinSize('Number', AValue);
  CheckStrMaxSize('Number', AValue);
  FNumber:=AValue;
  ModifiedProperty('Number');
end;

procedure TAttorney.SetIssuerOrganizationName(AValue: Tstring1000);
begin
  CheckStrMinSize('IssuerOrganizationName', AValue);
  CheckStrMaxSize('IssuerOrganizationName', AValue);
  FIssuerOrganizationName:=AValue;
  ModifiedProperty('IssuerOrganizationName');
end;

procedure TAttorney.SetIssuerAdditionalInfo(AValue: Tstring1000);
begin
  CheckStrMinSize('IssuerAdditionalInfo', AValue);
  CheckStrMaxSize('IssuerAdditionalInfo', AValue);
  FIssuerAdditionalInfo:=AValue;
  ModifiedProperty('IssuerAdditionalInfo');
end;

procedure TAttorney.SetRecipientAdditionalInfo(AValue: Tstring1000);
begin
  CheckStrMinSize('RecipientAdditionalInfo', AValue);
  CheckStrMaxSize('RecipientAdditionalInfo', AValue);
  FRecipientAdditionalInfo:=AValue;
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

constructor TAttorney.Create;
begin
  inherited Create;
end;

  {  TOfficial  }
procedure TOfficial.SetLastName(AValue: Tstring60);
begin
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TOfficial.SetFirstName(AValue: Tstring60);
begin
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TOfficial.SetMiddleName(AValue: Tstring60);
begin
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TOfficial.SetPosition(AValue: Tstring128z);
begin
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  FPosition:=AValue;
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

constructor TOfficial.Create;
begin
  inherited Create;
end;

  {  TAcceptanceCertificateSignatureInfo  }
procedure TAcceptanceCertificateSignatureInfo.SetSignatureDate(AValue: Tdate1);
begin
  CheckStrMinSize('SignatureDate', AValue);
  CheckStrMaxSize('SignatureDate', AValue);
  FSignatureDate:=AValue;
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

constructor TAcceptanceCertificateSignatureInfo.Create;
begin
  inherited Create;
end;

  {  TPaymentDocumentInfo  }
procedure TPaymentDocumentInfo.SetDate(AValue: Tdate1);
begin
  CheckStrMinSize('Date', AValue);
  CheckStrMaxSize('Date', AValue);
  FDate:=AValue;
  ModifiedProperty('Date');
end;

procedure TPaymentDocumentInfo.SetNumber(AValue: Tstring30);
begin
  CheckStrMinSize('Number', AValue);
  CheckStrMaxSize('Number', AValue);
  FNumber:=AValue;
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

constructor TPaymentDocumentInfo.Create;
begin
  inherited Create;
end;

  {  TGroundInfo  }
procedure TGroundInfo.SetName(AValue: Tstring255);
begin
  CheckStrMinSize('Name', AValue);
  CheckStrMaxSize('Name', AValue);
  FName:=AValue;
  ModifiedProperty('Name');
end;

procedure TGroundInfo.SetNumber(AValue: Tstring255);
begin
  CheckStrMinSize('Number', AValue);
  CheckStrMaxSize('Number', AValue);
  FNumber:=AValue;
  ModifiedProperty('Number');
end;

procedure TGroundInfo.SetDate(AValue: Tdate1);
begin
  CheckStrMinSize('Date', AValue);
  CheckStrMaxSize('Date', AValue);
  FDate:=AValue;
  ModifiedProperty('Date');
end;

procedure TGroundInfo.SetInfo(AValue: Tstring1000);
begin
  CheckStrMinSize('Info', AValue);
  CheckStrMaxSize('Info', AValue);
  FInfo:=AValue;
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

constructor TGroundInfo.Create;
begin
  inherited Create;
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

constructor TExtendedOrganizationInfo.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationInfo_ForeignAddress1000  }
procedure TExtendedOrganizationInfo_ForeignAddress1000.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrganizationDetails', 'OrganizationDetails', [], '', -1, -1);
  P:=RegisterProperty('OrganizationReference', 'OrganizationReference', [], '', -1, -1);
end;

procedure TExtendedOrganizationInfo_ForeignAddress1000.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TExtendedOrganizationDetails_ForeignAddress1000.Create;
  FOrganizationReference:=TExtendedOrganizationReference.Create;
end;

destructor TExtendedOrganizationInfo_ForeignAddress1000.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

constructor TExtendedOrganizationInfo_ForeignAddress1000.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationInfo_Torg2  }
procedure TExtendedOrganizationInfo_Torg2.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrganizationDetails', 'OrganizationDetails', [], '', -1, -1);
  P:=RegisterProperty('OrganizationReference', 'OrganizationReference', [], '', -1, -1);
end;

procedure TExtendedOrganizationInfo_Torg2.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TExtendedOrganizationDetails_Torg2.Create;
  FOrganizationReference:=TExtendedOrganizationReference.Create;
end;

destructor TExtendedOrganizationInfo_Torg2.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

constructor TExtendedOrganizationInfo_Torg2.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationDetails_ManualFilling  }
procedure TExtendedOrganizationDetails_ManualFilling.SetOrgType(AValue: TOrganizationType);
begin
  CheckLockupValue('OrgType', AValue);
  FOrgType:=AValue;
  ModifiedProperty('OrgType');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOkopf(AValue: String);
begin
  FOkopf:=AValue;
  ModifiedProperty('Okopf');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOkpo(AValue: String);
begin
  CheckStrMinSize('Okpo', AValue);
  CheckStrMaxSize('Okpo', AValue);
  FOkpo:=AValue;
  ModifiedProperty('Okpo');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOkdp(AValue: String);
begin
  CheckStrMinSize('Okdp', AValue);
  CheckStrMaxSize('Okdp', AValue);
  FOkdp:=AValue;
  ModifiedProperty('Okdp');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetPhone(AValue: Tstring255);
begin
  CheckStrMinSize('Phone', AValue);
  CheckStrMaxSize('Phone', AValue);
  FPhone:=AValue;
  ModifiedProperty('Phone');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetEmail(AValue: Tstring255);
begin
  CheckStrMinSize('Email', AValue);
  CheckStrMaxSize('Email', AValue);
  FEmail:=AValue;
  ModifiedProperty('Email');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetCorrespondentAccount(AValue: Tstring20);
begin
  CheckStrMinSize('CorrespondentAccount', AValue);
  CheckStrMaxSize('CorrespondentAccount', AValue);
  FCorrespondentAccount:=AValue;
  ModifiedProperty('CorrespondentAccount');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetBankAccountNumber(AValue: Tstring20);
begin
  CheckStrMinSize('BankAccountNumber', AValue);
  CheckStrMaxSize('BankAccountNumber', AValue);
  FBankAccountNumber:=AValue;
  ModifiedProperty('BankAccountNumber');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetBankName(AValue: Tstring1000);
begin
  CheckStrMinSize('BankName', AValue);
  CheckStrMaxSize('BankName', AValue);
  FBankName:=AValue;
  ModifiedProperty('BankName');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetBankId(AValue: String);
begin
  CheckStrMinSize('BankId', AValue);
  CheckStrMaxSize('BankId', AValue);
  FBankId:=AValue;
  ModifiedProperty('BankId');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetDepartment(AValue: Tstring1000);
begin
  CheckStrMinSize('Department', AValue);
  CheckStrMaxSize('Department', AValue);
  FDepartment:=AValue;
  ModifiedProperty('Department');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOrganizationAdditionalInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OrganizationAdditionalInfo', AValue);
  CheckStrMaxSize('OrganizationAdditionalInfo', AValue);
  FOrganizationAdditionalInfo:=AValue;
  ModifiedProperty('OrganizationAdditionalInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOrganizationOrPersonInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OrganizationOrPersonInfo', AValue);
  CheckStrMaxSize('OrganizationOrPersonInfo', AValue);
  FOrganizationOrPersonInfo:=AValue;
  ModifiedProperty('OrganizationOrPersonInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetIndividualEntityRegistrationCertificate(AValue: Tstring100);
begin
  CheckStrMinSize('IndividualEntityRegistrationCertificate', AValue);
  CheckStrMaxSize('IndividualEntityRegistrationCertificate', AValue);
  FIndividualEntityRegistrationCertificate:=AValue;
  ModifiedProperty('IndividualEntityRegistrationCertificate');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetLegalEntityId(AValue: Tstring255);
begin
  CheckStrMinSize('LegalEntityId', AValue);
  CheckStrMaxSize('LegalEntityId', AValue);
  FLegalEntityId:=AValue;
  ModifiedProperty('LegalEntityId');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetShortOrgName(AValue: Tstring255);
begin
  CheckStrMinSize('ShortOrgName', AValue);
  CheckStrMaxSize('ShortOrgName', AValue);
  FShortOrgName:=AValue;
  ModifiedProperty('ShortOrgName');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetCountry(AValue: Tstring255);
begin
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  FCountry:=AValue;
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

constructor TExtendedOrganizationDetails_ManualFilling.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationDetails_ForeignAddress1000  }
procedure TExtendedOrganizationDetails_ForeignAddress1000.SetOrgName(AValue: Tstring1000);
begin
  CheckStrMinSize('OrgName', AValue);
  CheckStrMaxSize('OrgName', AValue);
  FOrgName:=AValue;
  ModifiedProperty('OrgName');
end;

procedure TExtendedOrganizationDetails_ForeignAddress1000.SetInn(AValue: Tstring60);
begin
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TExtendedOrganizationDetails_ForeignAddress1000.SetKpp(AValue: Tstring1000);
begin
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  FKpp:=AValue;
  ModifiedProperty('Kpp');
end;

procedure TExtendedOrganizationDetails_ForeignAddress1000.SetFnsParticipantId(AValue: Tstring1000);
begin
  CheckStrMinSize('FnsParticipantId', AValue);
  CheckStrMaxSize('FnsParticipantId', AValue);
  FFnsParticipantId:=AValue;
  ModifiedProperty('FnsParticipantId');
end;

procedure TExtendedOrganizationDetails_ForeignAddress1000.InternalRegisterPropertys;
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

procedure TExtendedOrganizationDetails_ForeignAddress1000.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAddress:=TAddress_ForeignAddress1000.Create;
end;

destructor TExtendedOrganizationDetails_ForeignAddress1000.Destroy;
begin
  FAddress.Free;
  inherited Destroy;
end;

constructor TExtendedOrganizationDetails_ForeignAddress1000.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationDetails_ManualFilling_Torg2  }
procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetOrgType(AValue: TOrganizationType);
begin
  CheckLockupValue('OrgType', AValue);
  FOrgType:=AValue;
  ModifiedProperty('OrgType');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetOkpo(AValue: String);
begin
  CheckStrMinSize('Okpo', AValue);
  CheckStrMaxSize('Okpo', AValue);
  FOkpo:=AValue;
  ModifiedProperty('Okpo');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetPhone(AValue: Tstring255);
begin
  CheckStrMinSize('Phone', AValue);
  CheckStrMaxSize('Phone', AValue);
  FPhone:=AValue;
  ModifiedProperty('Phone');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetEmail(AValue: Tstring255);
begin
  CheckStrMinSize('Email', AValue);
  CheckStrMaxSize('Email', AValue);
  FEmail:=AValue;
  ModifiedProperty('Email');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetCorrespondentAccount(AValue: Tstring20);
begin
  CheckStrMinSize('CorrespondentAccount', AValue);
  CheckStrMaxSize('CorrespondentAccount', AValue);
  FCorrespondentAccount:=AValue;
  ModifiedProperty('CorrespondentAccount');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetBankAccountNumber(AValue: Tstring20);
begin
  CheckStrMinSize('BankAccountNumber', AValue);
  CheckStrMaxSize('BankAccountNumber', AValue);
  FBankAccountNumber:=AValue;
  ModifiedProperty('BankAccountNumber');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetBankName(AValue: Tstring1000);
begin
  CheckStrMinSize('BankName', AValue);
  CheckStrMaxSize('BankName', AValue);
  FBankName:=AValue;
  ModifiedProperty('BankName');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetBankId(AValue: String);
begin
  CheckStrMinSize('BankId', AValue);
  CheckStrMaxSize('BankId', AValue);
  FBankId:=AValue;
  ModifiedProperty('BankId');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetDepartment(AValue: Tstring1000);
begin
  CheckStrMinSize('Department', AValue);
  CheckStrMaxSize('Department', AValue);
  FDepartment:=AValue;
  ModifiedProperty('Department');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetOrganizationAdditionalInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OrganizationAdditionalInfo', AValue);
  CheckStrMaxSize('OrganizationAdditionalInfo', AValue);
  FOrganizationAdditionalInfo:=AValue;
  ModifiedProperty('OrganizationAdditionalInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetOrganizationOrPersonInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OrganizationOrPersonInfo', AValue);
  CheckStrMaxSize('OrganizationOrPersonInfo', AValue);
  FOrganizationOrPersonInfo:=AValue;
  ModifiedProperty('OrganizationOrPersonInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetIndividualEntityRegistrationCertificate(AValue: Tstring100);
begin
  CheckStrMinSize('IndividualEntityRegistrationCertificate', AValue);
  CheckStrMaxSize('IndividualEntityRegistrationCertificate', AValue);
  FIndividualEntityRegistrationCertificate:=AValue;
  ModifiedProperty('IndividualEntityRegistrationCertificate');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetLegalEntityId(AValue: Tstring255);
begin
  CheckStrMinSize('LegalEntityId', AValue);
  CheckStrMaxSize('LegalEntityId', AValue);
  FLegalEntityId:=AValue;
  ModifiedProperty('LegalEntityId');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetShortOrgName(AValue: Tstring255);
begin
  CheckStrMinSize('ShortOrgName', AValue);
  CheckStrMaxSize('ShortOrgName', AValue);
  FShortOrgName:=AValue;
  ModifiedProperty('ShortOrgName');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.SetCountry(AValue: Tstring255);
begin
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrgType', 'OrgType', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
  P:=RegisterProperty('Okpo', 'Okpo', [], '', 1, 10);
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

procedure TExtendedOrganizationDetails_ManualFilling_Torg2.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationDetails_ManualFilling_Torg2.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedOrganizationDetails_ManualFilling_Torg2.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationReference  }
procedure TExtendedOrganizationReference.SetBoxId(AValue: Tstring100);
begin
  CheckStrMinSize('BoxId', AValue);
  CheckStrMaxSize('BoxId', AValue);
  FBoxId:=AValue;
  ModifiedProperty('BoxId');
end;

procedure TExtendedOrganizationReference.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BoxId', 'BoxId', [xsaRequared], '', 1, 100);
end;

procedure TExtendedOrganizationReference.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationReference.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedOrganizationReference.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationDetails  }
procedure TExtendedOrganizationDetails.SetOrgName(AValue: Tstring1000);
begin
  CheckStrMinSize('OrgName', AValue);
  CheckStrMaxSize('OrgName', AValue);
  FOrgName:=AValue;
  ModifiedProperty('OrgName');
end;

procedure TExtendedOrganizationDetails.SetInn(AValue: Tstring60);
begin
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TExtendedOrganizationDetails.SetKpp(AValue: Tstring1000);
begin
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  FKpp:=AValue;
  ModifiedProperty('Kpp');
end;

procedure TExtendedOrganizationDetails.SetFnsParticipantId(AValue: Tstring1000);
begin
  CheckStrMinSize('FnsParticipantId', AValue);
  CheckStrMaxSize('FnsParticipantId', AValue);
  FFnsParticipantId:=AValue;
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

constructor TExtendedOrganizationDetails.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationDetails_Torg2  }
procedure TExtendedOrganizationDetails_Torg2.SetOrgName(AValue: Tstring1000);
begin
  CheckStrMinSize('OrgName', AValue);
  CheckStrMaxSize('OrgName', AValue);
  FOrgName:=AValue;
  ModifiedProperty('OrgName');
end;

procedure TExtendedOrganizationDetails_Torg2.SetInn(AValue: Tstring60);
begin
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TExtendedOrganizationDetails_Torg2.SetKpp(AValue: Tstring1000);
begin
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  FKpp:=AValue;
  ModifiedProperty('Kpp');
end;

procedure TExtendedOrganizationDetails_Torg2.SetFnsParticipantId(AValue: Tstring1000);
begin
  CheckStrMinSize('FnsParticipantId', AValue);
  CheckStrMaxSize('FnsParticipantId', AValue);
  FFnsParticipantId:=AValue;
  ModifiedProperty('FnsParticipantId');
end;

procedure TExtendedOrganizationDetails_Torg2.InternalRegisterPropertys;
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

procedure TExtendedOrganizationDetails_Torg2.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAddress:=TAddress.Create;
end;

destructor TExtendedOrganizationDetails_Torg2.Destroy;
begin
  FAddress.Free;
  inherited Destroy;
end;

constructor TExtendedOrganizationDetails_Torg2.Create;
begin
  inherited Create;
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

constructor TExtendedOrganizationInfoWithHyphens.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationDetailsWithHyphens  }
procedure TExtendedOrganizationDetailsWithHyphens.SetHyphenInn(AValue: String);
begin
  CheckLockupValue('HyphenInn', AValue);
  CheckFixedValue('HyphenInn', AValue);
  FHyphenInn:=AValue;
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

constructor TExtendedOrganizationDetailsWithHyphens.Create;
begin
  inherited Create;
  HyphenInn:='false';
end;

  {  TAddress  }
procedure TAddress.SetAddressCode(AValue: Tstring36);
begin
  CheckStrMinSize('AddressCode', AValue);
  CheckStrMaxSize('AddressCode', AValue);
  FAddressCode:=AValue;
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

constructor TAddress.Create;
begin
  inherited Create;
end;

  {  TAddress_ForeignAddress1000  }
procedure TAddress_ForeignAddress1000.SetAddressCode(AValue: Tstring36);
begin
  CheckStrMinSize('AddressCode', AValue);
  CheckStrMaxSize('AddressCode', AValue);
  FAddressCode:=AValue;
  ModifiedProperty('AddressCode');
end;

procedure TAddress_ForeignAddress1000.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('RussianAddress', 'RussianAddress', [], '', -1, -1);
  P:=RegisterProperty('ForeignAddress', 'ForeignAddress', [], '', -1, -1);
  P:=RegisterProperty('AddressCode', 'AddressCode', [xsaSimpleObject], '', 1, 36);
end;

procedure TAddress_ForeignAddress1000.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FRussianAddress:=TRussianAddress.Create;
  FForeignAddress:=TForeignAddress1000.Create;
end;

destructor TAddress_ForeignAddress1000.Destroy;
begin
  FRussianAddress.Free;
  FForeignAddress.Free;
  inherited Destroy;
end;

constructor TAddress_ForeignAddress1000.Create;
begin
  inherited Create;
end;

  {  TRussianAddress  }
procedure TRussianAddress.SetZipCode(AValue: String);
begin
  CheckStrMinSize('ZipCode', AValue);
  CheckStrMaxSize('ZipCode', AValue);
  FZipCode:=AValue;
  ModifiedProperty('ZipCode');
end;

procedure TRussianAddress.SetRegion(AValue: Tstring50);
begin
  CheckStrMinSize('Region', AValue);
  CheckStrMaxSize('Region', AValue);
  FRegion:=AValue;
  ModifiedProperty('Region');
end;

procedure TRussianAddress.SetTerritory(AValue: Tstring50);
begin
  CheckStrMinSize('Territory', AValue);
  CheckStrMaxSize('Territory', AValue);
  FTerritory:=AValue;
  ModifiedProperty('Territory');
end;

procedure TRussianAddress.SetCity(AValue: Tstring50);
begin
  CheckStrMinSize('City', AValue);
  CheckStrMaxSize('City', AValue);
  FCity:=AValue;
  ModifiedProperty('City');
end;

procedure TRussianAddress.SetLocality(AValue: Tstring50);
begin
  CheckStrMinSize('Locality', AValue);
  CheckStrMaxSize('Locality', AValue);
  FLocality:=AValue;
  ModifiedProperty('Locality');
end;

procedure TRussianAddress.SetStreet(AValue: Tstring50);
begin
  CheckStrMinSize('Street', AValue);
  CheckStrMaxSize('Street', AValue);
  FStreet:=AValue;
  ModifiedProperty('Street');
end;

procedure TRussianAddress.SetBuilding(AValue: Tstring20);
begin
  CheckStrMinSize('Building', AValue);
  CheckStrMaxSize('Building', AValue);
  FBuilding:=AValue;
  ModifiedProperty('Building');
end;

procedure TRussianAddress.SetBlock(AValue: Tstring20);
begin
  CheckStrMinSize('Block', AValue);
  CheckStrMaxSize('Block', AValue);
  FBlock:=AValue;
  ModifiedProperty('Block');
end;

procedure TRussianAddress.SetApartment(AValue: Tstring20);
begin
  CheckStrMinSize('Apartment', AValue);
  CheckStrMaxSize('Apartment', AValue);
  FApartment:=AValue;
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

constructor TRussianAddress.Create;
begin
  inherited Create;
end;

  {  TForeignAddress  }
procedure TForeignAddress.SetCountry(AValue: Tstring60);
begin
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TForeignAddress.SetAddress(AValue: Tstring255);
begin
  CheckStrMinSize('Address', AValue);
  CheckStrMaxSize('Address', AValue);
  FAddress:=AValue;
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

constructor TForeignAddress.Create;
begin
  inherited Create;
end;

  {  TForeignAddress1000  }
procedure TForeignAddress1000.SetCountry(AValue: Tstring60);
begin
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TForeignAddress1000.SetAddress(AValue: Tstring1000);
begin
  CheckStrMinSize('Address', AValue);
  CheckStrMaxSize('Address', AValue);
  FAddress:=AValue;
  ModifiedProperty('Address');
end;

procedure TForeignAddress1000.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Country', 'Country', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('Address', 'Address', [xsaRequared], '', 1, 1000);
end;

procedure TForeignAddress1000.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TForeignAddress1000.Destroy;
begin
  inherited Destroy;
end;

constructor TForeignAddress1000.Create;
begin
  inherited Create;
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

constructor TSignerInfo.Create;
begin
  inherited Create;
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

constructor TSignerDetails.Create;
begin
  inherited Create;
end;

  {  TSignerReferenceInfo  }
procedure TSignerReferenceInfo.SetCertificateBytes(AValue: String);
begin
  FCertificateBytes:=AValue;
  ModifiedProperty('CertificateBytes');
end;

procedure TSignerReferenceInfo.SetCertificateThumbprint(AValue: Tstring100);
begin
  CheckStrMinSize('CertificateThumbprint', AValue);
  CheckStrMaxSize('CertificateThumbprint', AValue);
  FCertificateThumbprint:=AValue;
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

constructor TSignerReferenceInfo.Create;
begin
  inherited Create;
end;

  {  TSignerReference  }
procedure TSignerReference.SetBoxId(AValue: Tstring100);
begin
  CheckStrMinSize('BoxId', AValue);
  CheckStrMaxSize('BoxId', AValue);
  FBoxId:=AValue;
  ModifiedProperty('BoxId');
end;

procedure TSignerReference.SetCertificateBytes(AValue: String);
begin
  FCertificateBytes:=AValue;
  ModifiedProperty('CertificateBytes');
end;

procedure TSignerReference.SetCertificateThumbprint(AValue: Tstring100);
begin
  CheckStrMinSize('CertificateThumbprint', AValue);
  CheckStrMaxSize('CertificateThumbprint', AValue);
  FCertificateThumbprint:=AValue;
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

constructor TSignerReference.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetailsBase  }
procedure TExtendedSignerDetailsBase.SetLastName(AValue: Tstring60);
begin
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TExtendedSignerDetailsBase.SetFirstName(AValue: Tstring60);
begin
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TExtendedSignerDetailsBase.SetMiddleName(AValue: Tstring60);
begin
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TExtendedSignerDetailsBase.SetPosition(AValue: Tstring128z);
begin
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TExtendedSignerDetailsBase.SetInn(AValue: String);
begin
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TExtendedSignerDetailsBase.SetRegistrationCertificate(AValue: Tstring100);
begin
  CheckStrMinSize('RegistrationCertificate', AValue);
  CheckStrMaxSize('RegistrationCertificate', AValue);
  FRegistrationCertificate:=AValue;
  ModifiedProperty('RegistrationCertificate');
end;

procedure TExtendedSignerDetailsBase.SetSignerType(AValue: String);
begin
  CheckLockupValue('SignerType', AValue);
  FSignerType:=AValue;
  ModifiedProperty('SignerType');
end;

procedure TExtendedSignerDetailsBase.SetSignerOrganizationName(AValue: Tstring1000);
begin
  CheckStrMinSize('SignerOrganizationName', AValue);
  CheckStrMaxSize('SignerOrganizationName', AValue);
  FSignerOrganizationName:=AValue;
  ModifiedProperty('SignerOrganizationName');
end;

procedure TExtendedSignerDetailsBase.SetSignerInfo(AValue: Tstring255);
begin
  CheckStrMinSize('SignerInfo', AValue);
  CheckStrMaxSize('SignerInfo', AValue);
  FSignerInfo:=AValue;
  ModifiedProperty('SignerInfo');
end;

procedure TExtendedSignerDetailsBase.SetSignerPowersBase(AValue: Tstring255);
begin
  CheckStrMinSize('SignerPowersBase', AValue);
  CheckStrMaxSize('SignerPowersBase', AValue);
  FSignerPowersBase:=AValue;
  ModifiedProperty('SignerPowersBase');
end;

procedure TExtendedSignerDetailsBase.SetSignerOrgPowersBase(AValue: Tstring255);
begin
  CheckStrMinSize('SignerOrgPowersBase', AValue);
  CheckStrMaxSize('SignerOrgPowersBase', AValue);
  FSignerOrgPowersBase:=AValue;
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

constructor TExtendedSignerDetailsBase.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetailsBase736  }
procedure TExtendedSignerDetailsBase736.SetLastName(AValue: Tstring60);
begin
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TExtendedSignerDetailsBase736.SetFirstName(AValue: Tstring60);
begin
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TExtendedSignerDetailsBase736.SetMiddleName(AValue: Tstring60);
begin
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TExtendedSignerDetailsBase736.SetPosition(AValue: Tstring128);
begin
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TExtendedSignerDetailsBase736.SetInn(AValue: String);
begin
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TExtendedSignerDetailsBase736.SetRegistrationCertificate(AValue: Tstring100);
begin
  CheckStrMinSize('RegistrationCertificate', AValue);
  CheckStrMaxSize('RegistrationCertificate', AValue);
  FRegistrationCertificate:=AValue;
  ModifiedProperty('RegistrationCertificate');
end;

procedure TExtendedSignerDetailsBase736.SetSignerType(AValue: String);
begin
  CheckLockupValue('SignerType', AValue);
  FSignerType:=AValue;
  ModifiedProperty('SignerType');
end;

procedure TExtendedSignerDetailsBase736.SetSignerOrganizationName(AValue: Tstring1000);
begin
  CheckStrMinSize('SignerOrganizationName', AValue);
  CheckStrMaxSize('SignerOrganizationName', AValue);
  FSignerOrganizationName:=AValue;
  ModifiedProperty('SignerOrganizationName');
end;

procedure TExtendedSignerDetailsBase736.SetSignerInfo(AValue: Tstring255);
begin
  CheckStrMinSize('SignerInfo', AValue);
  CheckStrMaxSize('SignerInfo', AValue);
  FSignerInfo:=AValue;
  ModifiedProperty('SignerInfo');
end;

procedure TExtendedSignerDetailsBase736.SetSignerPowersBase(AValue: Tstring255);
begin
  CheckStrMinSize('SignerPowersBase', AValue);
  CheckStrMaxSize('SignerPowersBase', AValue);
  FSignerPowersBase:=AValue;
  ModifiedProperty('SignerPowersBase');
end;

procedure TExtendedSignerDetailsBase736.SetSignerOrgPowersBase(AValue: Tstring255);
begin
  CheckStrMinSize('SignerOrgPowersBase', AValue);
  CheckStrMaxSize('SignerOrgPowersBase', AValue);
  FSignerOrgPowersBase:=AValue;
  ModifiedProperty('SignerOrgPowersBase');
end;

procedure TExtendedSignerDetailsBase736.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 60);
  P:=RegisterProperty('Position', 'Position', [], '', 1, 128);
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

procedure TExtendedSignerDetailsBase736.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetailsBase736.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedSignerDetailsBase736.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails  }
procedure TExtendedSignerDetails.SetSignerStatus(AValue: Int64);
begin
  CheckLockupValue('SignerStatus', AValue);
  FSignerStatus:=AValue;
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

constructor TExtendedSignerDetails.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails736  }
procedure TExtendedSignerDetails736.SetSignerStatus(AValue: Int64);
begin
  CheckLockupValue('SignerStatus', AValue);
  FSignerStatus:=AValue;
  ModifiedProperty('SignerStatus');
end;

procedure TExtendedSignerDetails736.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerStatus', 'SignerStatus', [xsaRequared], '', -1, -1);
    P.ValidList.Add('3');
    P.ValidList.Add('4');
    P.ValidList.Add('5');
    P.ValidList.Add('6');
end;

procedure TExtendedSignerDetails736.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails736.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedSignerDetails736.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails_SellerTitle  }
procedure TExtendedSignerDetails_SellerTitle.SetSignerPowers(AValue: Int64);
begin
  CheckLockupValue('SignerPowers', AValue);
  FSignerPowers:=AValue;
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

constructor TExtendedSignerDetails_SellerTitle.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails_BuyerTitle  }
procedure TExtendedSignerDetails_BuyerTitle.SetSignerPowers(AValue: Int64);
begin
  CheckLockupValue('SignerPowers', AValue);
  FSignerPowers:=AValue;
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

constructor TExtendedSignerDetails_BuyerTitle.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails_BuyerTitle820  }
procedure TExtendedSignerDetails_BuyerTitle820.SetSignerPowers(AValue: Int64);
begin
  CheckLockupValue('SignerPowers', AValue);
  FSignerPowers:=AValue;
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_BuyerTitle820.SetSignerStatus(AValue: Int64);
begin
  CheckLockupValue('SignerStatus', AValue);
  FSignerStatus:=AValue;
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

constructor TExtendedSignerDetails_BuyerTitle820.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails_CorrectionSellerTitle  }
procedure TExtendedSignerDetails_CorrectionSellerTitle.SetSignerPowers(AValue: Int64);
begin
  CheckLockupValue('SignerPowers', AValue);
  FSignerPowers:=AValue;
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

constructor TExtendedSignerDetails_CorrectionSellerTitle.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails_CorrectionBuyerTitle  }
procedure TExtendedSignerDetails_CorrectionBuyerTitle.SetSignerPowers(AValue: Int64);
begin
  CheckLockupValue('SignerPowers', AValue);
  FSignerPowers:=AValue;
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

constructor TExtendedSignerDetails_CorrectionBuyerTitle.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails_CorrectionBuyerTitle736  }
procedure TExtendedSignerDetails_CorrectionBuyerTitle736.SetSignerPowers(AValue: Int64);
begin
  CheckLockupValue('SignerPowers', AValue);
  FSignerPowers:=AValue;
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_CorrectionBuyerTitle736.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerPowers', 'SignerPowers', [xsaRequared], '', -1, -1);
    P.ValidList.Add('0');
    P.ValidList.Add('3');
    P.ValidList.Add('6');
    P.ValidList.Add('29');
end;

procedure TExtendedSignerDetails_CorrectionBuyerTitle736.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails_CorrectionBuyerTitle736.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedSignerDetails_CorrectionBuyerTitle736.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails_551_552  }
procedure TExtendedSignerDetails_551_552.SetSignerPowers(AValue: Int64);
begin
  CheckLockupValue('SignerPowers', AValue);
  FSignerPowers:=AValue;
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

constructor TExtendedSignerDetails_551_552.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails_Torg2Buyer  }
procedure TExtendedSignerDetails_Torg2Buyer.SetSignerPowers(AValue: Int64);
begin
  CheckLockupValue('SignerPowers', AValue);
  FSignerPowers:=AValue;
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_Torg2Buyer.SetSignerStatus(AValue: Int64);
begin
  CheckLockupValue('SignerStatus', AValue);
  FSignerStatus:=AValue;
  ModifiedProperty('SignerStatus');
end;

procedure TExtendedSignerDetails_Torg2Buyer.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerPowers', 'SignerPowers', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('7');
    P.ValidList.Add('8');
  P:=RegisterProperty('SignerStatus', 'SignerStatus', [xsaRequared], '', -1, -1);
    P.ValidList.Add('3');
    P.ValidList.Add('4');
    P.ValidList.Add('5');
    P.ValidList.Add('6');
end;

procedure TExtendedSignerDetails_Torg2Buyer.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails_Torg2Buyer.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedSignerDetails_Torg2Buyer.Create;
begin
  inherited Create;
end;

  {  TExtendedSignerDetails_Torg2AdditionalInfo  }
procedure TExtendedSignerDetails_Torg2AdditionalInfo.SetSignerPowers(AValue: Int64);
begin
  CheckLockupValue('SignerPowers', AValue);
  FSignerPowers:=AValue;
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_Torg2AdditionalInfo.SetSignerStatus(AValue: Int64);
begin
  CheckLockupValue('SignerStatus', AValue);
  FSignerStatus:=AValue;
  ModifiedProperty('SignerStatus');
end;

procedure TExtendedSignerDetails_Torg2AdditionalInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerPowers', 'SignerPowers', [xsaRequared], '', -1, -1);
    P.ValidList.Add('21');
    P.ValidList.Add('22');
    P.ValidList.Add('23');
    P.ValidList.Add('29');
  P:=RegisterProperty('SignerStatus', 'SignerStatus', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
    P.ValidList.Add('5');
    P.ValidList.Add('6');
end;

procedure TExtendedSignerDetails_Torg2AdditionalInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails_Torg2AdditionalInfo.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedSignerDetails_Torg2AdditionalInfo.Create;
begin
  inherited Create;
end;

end.