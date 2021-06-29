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

unit XmlTorg12_DEFAULT_utd820_05_01_02_hyphen_ind0;

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
type

  {  Forward declarations  }
  TUniversalTransferDocumentWithHyphens = class;
  TUniversalTransferDocumentWithHyphens_Sellers = class;
  TUniversalTransferDocumentWithHyphens_Buyers = class;
  TUniversalTransferDocumentWithHyphens_Shippers = class;
  TUniversalTransferDocumentWithHyphens_Shippers_Shipper = class;
  TUniversalTransferDocumentWithHyphens_Consignees = class;
  TUniversalTransferDocumentWithHyphens_Signers = class;
  TUniversalTransferDocumentWithHyphens_PaymentDocuments = class;
  TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc = class;
  TUniversalTransferDocumentWithHyphens_DocumentShipments = class;
  TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment = class;
  TInvoiceTable = class;
  TInvoiceTable_Item = class;
  TInvoiceTable_Item_CustomsDeclarations = class;
  TInvoiceTable_Item_AdditionalInfos = class;
  TInvoiceTable_Item_ItemTracingInfos = class;
  TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo = class;
  TInvoiceTable_Item_ItemIdentificationNumbers = class;
  TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber = class;
  TTransferInfo = class;
  TTransferInfo_TransferBases = class;
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
  TEmployee = class;
  TOtherIssuer = class;
  TWaybills = class;
  TWaybills_Waybill = class;
  TTransferBase = class;
  TTransferBase820 = class;

  {  Generic classes for collections  }
  TUniversalTransferDocumentWithHyphensList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens>;
  TUniversalTransferDocumentWithHyphens_SellersList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens_Sellers>;
  TUniversalTransferDocumentWithHyphens_BuyersList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens_Buyers>;
  TUniversalTransferDocumentWithHyphens_ShippersList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens_Shippers>;
  TUniversalTransferDocumentWithHyphens_Shippers_ShipperList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens_Shippers_Shipper>;
  TUniversalTransferDocumentWithHyphens_ConsigneesList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens_Consignees>;
  TUniversalTransferDocumentWithHyphens_SignersList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens_Signers>;
  TUniversalTransferDocumentWithHyphens_PaymentDocumentsList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens_PaymentDocuments>;
  TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProcList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc>;
  TUniversalTransferDocumentWithHyphens_DocumentShipmentsList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens_DocumentShipments>;
  TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipmentList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment>;
  TInvoiceTableList = specialize GXMLSerializationObjectList<TInvoiceTable>;
  TInvoiceTable_ItemList = specialize GXMLSerializationObjectList<TInvoiceTable_Item>;
  TInvoiceTable_Item_CustomsDeclarationsList = specialize GXMLSerializationObjectList<TInvoiceTable_Item_CustomsDeclarations>;
  TInvoiceTable_Item_AdditionalInfosList = specialize GXMLSerializationObjectList<TInvoiceTable_Item_AdditionalInfos>;
  TInvoiceTable_Item_ItemTracingInfosList = specialize GXMLSerializationObjectList<TInvoiceTable_Item_ItemTracingInfos>;
  TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfoList = specialize GXMLSerializationObjectList<TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo>;
  TInvoiceTable_Item_ItemIdentificationNumbersList = specialize GXMLSerializationObjectList<TInvoiceTable_Item_ItemIdentificationNumbers>;
  TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumberList = specialize GXMLSerializationObjectList<TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber>;
  TTransferInfoList = specialize GXMLSerializationObjectList<TTransferInfo>;
  TTransferInfo_TransferBasesList = specialize GXMLSerializationObjectList<TTransferInfo_TransferBases>;
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
  TEmployeeList = specialize GXMLSerializationObjectList<TEmployee>;
  TOtherIssuerList = specialize GXMLSerializationObjectList<TOtherIssuer>;
  TWaybillsList = specialize GXMLSerializationObjectList<TWaybills>;
  TWaybills_WaybillList = specialize GXMLSerializationObjectList<TWaybills_Waybill>;
  TTransferBaseList = specialize GXMLSerializationObjectList<TTransferBase>;
  TTransferBase820List = specialize GXMLSerializationObjectList<TTransferBase820>;

  {  TUniversalTransferDocumentWithHyphens  }
  TUniversalTransferDocumentWithHyphens = class(TXmlSerializationObject)
  private
    FSellers:TUniversalTransferDocumentWithHyphens_Sellers;
    FBuyers:TUniversalTransferDocumentWithHyphens_Buyers;
    FShippers:TUniversalTransferDocumentWithHyphens_Shippers;
    FConsignees:TUniversalTransferDocumentWithHyphens_Consignees;
    FSigners:TUniversalTransferDocumentWithHyphens_Signers;
    FPaymentDocuments:TUniversalTransferDocumentWithHyphens_PaymentDocuments;
    FAdditionalInfoId:TAdditionalInfoId;
    FTable:TInvoiceTable;
    FTransferInfo:TTransferInfo;
    FFactorInfo:TExtendedOrganizationInfoWithHyphens;
    FMainAssignMonetaryClaim:TTransferBase820;
    FSellerInfoCircumPublicProc:TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc;
    FDocumentShipments:TUniversalTransferDocumentWithHyphens_DocumentShipments;
    FFunction1:String;
    FApprovedStructureAdditionalInfoFields:Tstring14f;
    FSenderFnsParticipantId:String;
    FRecipientFnsParticipantId:String;
    FDocumentName:Tstring255;
    FDocumentDate:Tdate1;
    FDocumentNumber:Tstring1000;
    FCurrency:Tokv;
    FCurrencyRate:Double;
    FRevisionDate:Tdate1;
    FHyphenRevisionDate:String;
    FRevisionNumber:Int64;
    FHyphenRevisionNumber:String;
    FDocumentCreator:Tstring1000;
    FDocumentCreatorBase:Tstring120;
    FGovernmentContractInfo:String;
    FCircumFormatInvoice:String;
    procedure SetFunction1( AValue:String);
    procedure SetApprovedStructureAdditionalInfoFields( AValue:Tstring14f);
    procedure SetSenderFnsParticipantId( AValue:String);
    procedure SetRecipientFnsParticipantId( AValue:String);
    procedure SetDocumentName( AValue:Tstring255);
    procedure SetDocumentDate( AValue:Tdate1);
    procedure SetDocumentNumber( AValue:Tstring1000);
    procedure SetCurrency( AValue:Tokv);
    procedure SetCurrencyRate( AValue:Double);
    procedure SetRevisionDate( AValue:Tdate1);
    procedure SetHyphenRevisionDate( AValue:String);
    procedure SetRevisionNumber( AValue:Int64);
    procedure SetHyphenRevisionNumber( AValue:String);
    procedure SetDocumentCreator( AValue:Tstring1000);
    procedure SetDocumentCreatorBase( AValue:Tstring120);
    procedure SetGovernmentContractInfo( AValue:String);
    procedure SetCircumFormatInvoice( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
    function RootNodeName:string; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Sellers:TUniversalTransferDocumentWithHyphens_Sellers read FSellers;
    property Buyers:TUniversalTransferDocumentWithHyphens_Buyers read FBuyers;
    property Shippers:TUniversalTransferDocumentWithHyphens_Shippers read FShippers;
    property Consignees:TUniversalTransferDocumentWithHyphens_Consignees read FConsignees;
    property Signers:TUniversalTransferDocumentWithHyphens_Signers read FSigners;
    property PaymentDocuments:TUniversalTransferDocumentWithHyphens_PaymentDocuments read FPaymentDocuments;
    //ИнфПолФХЖ1 - Информационное поле документа
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;
    property Table:TInvoiceTable read FTable;
    property TransferInfo:TTransferInfo read FTransferInfo;
    //СвФактор - Сведения о факторе
    property FactorInfo:TExtendedOrganizationInfoWithHyphens read FFactorInfo;
    //ОснУстДенТреб - Основание уступки денежного требования
    property MainAssignMonetaryClaim:TTransferBase820 read FMainAssignMonetaryClaim;
    //ИнфПродГосЗакКазн - Информация продавца об обстоятельствах закупок для
    //государственных и муниципальных нужд
    property SellerInfoCircumPublicProc:TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc read FSellerInfoCircumPublicProc;
    property DocumentShipments:TUniversalTransferDocumentWithHyphens_DocumentShipments read FDocumentShipments;
    //Функция - Функция документа
    property Function1:String read FFunction1 write SetFunction1;
    //СоглСтрДопИнф - Информация о наличии согласованной структуры дополнительных
    //информационных полей
    property ApprovedStructureAdditionalInfoFields:Tstring14f read FApprovedStructureAdditionalInfoFields write SetApprovedStructureAdditionalInfoFields;
    //ИдОтпр - идентификатор участника ЭДО.Если не указан, то в атрибут ИдОтпр подставится идентификатор первой организации, указанной в элементе Sellers
    property SenderFnsParticipantId:String read FSenderFnsParticipantId write SetSenderFnsParticipantId;
    //ИдПол - идентификатор участника ЭДОЕсли не указан, то в атрибут ИдПол подставится идентификатор первой организации, указанной в элементе Buyers
    property RecipientFnsParticipantId:String read FRecipientFnsParticipantId write SetRecipientFnsParticipantId;
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
    //ДатаИспрСчФ - дата ИСФ (обязательно при формировании
    //исправления УПД/СФ)
    property RevisionDate:Tdate1 read FRevisionDate write SetRevisionDate;
    //ДефДатаИспрСчФ - обязателен, если отсутствует ДатаИспрСчФ
    property HyphenRevisionDate:String read FHyphenRevisionDate write SetHyphenRevisionDate;
    //НомИспрСчФ - номер ИСФ (обязательно при формировании
    //исправления УПД/СФ)
    property RevisionNumber:Int64 read FRevisionNumber write SetRevisionNumber;
    //ДефНомИспрСчФ - обязателен, если отсутствует НомИспрСчФ
    property HyphenRevisionNumber:String read FHyphenRevisionNumber write SetHyphenRevisionNumber;
    //НаимЭконСубСост - Составитель файла обмена счета-фактуры (информации продавца)
    property DocumentCreator:Tstring1000 read FDocumentCreator write SetDocumentCreator;
    //ОснДоверОргСост - Основание, по которому экономический субъект является
    //составителем файла обмена счета-фактуры
    property DocumentCreatorBase:Tstring120 read FDocumentCreatorBase write SetDocumentCreatorBase;
    //ИдГосКон
    property GovernmentContractInfo:String read FGovernmentContractInfo write SetGovernmentContractInfo;
    //ОбстФормСЧФ - Обстоятельства формирования счета-фактуры
    //1 - счет-фактура, выставляемый при реализации товаров;
    //2 - счет-фактура, выставляемый при получении оплаты;
    //3 - счет-фактура, применяемый в случае реализации комиссионером
    //4 - товары переданы от Комитента (Принципала) Комиссионеру (Агенту, действующему от собственного имени) для дальнейшей реализации
    //5 - товары переданы от Комиссионера (Агента, действующего от собственного имени) Комитенту (Принципалу) при возврате товаров
    //6 - товары переданы от Комиссионера (Агента, действующего от собственного имени) Комитенту (Принципалу) при закупке товара
    //7 - товары переданы от Комитента (Принципала) Комиссионеру (Агенту, действующему от собственного имени) при возврате товаров
    //8 - возврат товара от Покупателя Продавцу
    property CircumFormatInvoice:String read FCircumFormatInvoice write SetCircumFormatInvoice;
  end;

  {  TUniversalTransferDocumentWithHyphens_Sellers  }
  TUniversalTransferDocumentWithHyphens_Sellers = class(TXmlSerializationObject)
  private
    FSeller:TExtendedOrganizationInfoWithHyphensList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СвПрод - сведения о продавце
    property Seller:TExtendedOrganizationInfoWithHyphensList read FSeller;
  end;

  {  TUniversalTransferDocumentWithHyphens_Buyers  }
  TUniversalTransferDocumentWithHyphens_Buyers = class(TXmlSerializationObject)
  private
    FBuyer:TExtendedOrganizationInfoWithHyphensList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СвПокуп - сведения о покупателе
    property Buyer:TExtendedOrganizationInfoWithHyphensList read FBuyer;
  end;

  {  TUniversalTransferDocumentWithHyphens_Shippers  }
  TUniversalTransferDocumentWithHyphens_Shippers = class(TXmlSerializationObject)
  private
    FShipper:TUniversalTransferDocumentWithHyphens_Shippers_ShipperList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ГрузОт - грузоотправитель
    property Shipper:TUniversalTransferDocumentWithHyphens_Shippers_ShipperList read FShipper;
  end;

  {  TUniversalTransferDocumentWithHyphens_Shippers_Shipper  }
  TUniversalTransferDocumentWithHyphens_Shippers_Shipper = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TExtendedOrganizationDetailsWithHyphens;
    FOrganizationReference:TExtendedOrganizationReference;
    FSameAsSeller:String;
    procedure SetSameAsSeller( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetailsWithHyphens read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference read FOrganizationReference;
    //ОнЖе - совпадает с продавцом
    property SameAsSeller:String read FSameAsSeller write SetSameAsSeller;
  end;

  {  TUniversalTransferDocumentWithHyphens_Consignees  }
  TUniversalTransferDocumentWithHyphens_Consignees = class(TXmlSerializationObject)
  private
    FConsignee:TExtendedOrganizationInfoWithHyphensList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ГрузПолуч - грузополучатель
    property Consignee:TExtendedOrganizationInfoWithHyphensList read FConsignee;
  end;

  {  TUniversalTransferDocumentWithHyphens_Signers  }
  TUniversalTransferDocumentWithHyphens_Signers = class(TXmlSerializationObject)
  private
    FSignerReference:TSignerReference;
    FSignerDetails:TExtendedSignerDetails_SellerTitle;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property SignerReference:TSignerReference read FSignerReference;
    property SignerDetails:TExtendedSignerDetails_SellerTitle read FSignerDetails;
  end;

  {  TUniversalTransferDocumentWithHyphens_PaymentDocuments  }
  TUniversalTransferDocumentWithHyphens_PaymentDocuments = class(TXmlSerializationObject)
  private
    FDocument:TPaymentDocumentInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СвПРД - платежно-расчетные документы
    property Document:TPaymentDocumentInfoList read FDocument;
  end;

  {  TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc  }
  TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc = class(TXmlSerializationObject)
  private
    FDateStateContract:Tdate1;
    FNumberStateContract:Tstring100;
    FPersonalAccountSeller:String;
    FSellerBudjetClassCode:Tstring20f;
    FSellerTargetCode:Tstring20f;
    FSellerTreasuryCode:String;
    FSellerTreasuryName:Tstring2000;
    procedure SetDateStateContract( AValue:Tdate1);
    procedure SetNumberStateContract( AValue:Tstring100);
    procedure SetPersonalAccountSeller( AValue:String);
    procedure SetSellerBudjetClassCode( AValue:Tstring20f);
    procedure SetSellerTargetCode( AValue:Tstring20f);
    procedure SetSellerTreasuryCode( AValue:String);
    procedure SetSellerTreasuryName( AValue:Tstring2000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ДатаГосКонт - Дата государственного контракта
    property DateStateContract:Tdate1 read FDateStateContract write SetDateStateContract;
    //НомерГосКонт - Номер государственного контракта
    property NumberStateContract:Tstring100 read FNumberStateContract write SetNumberStateContract;
    //ЛицСчетПрод - Номер лицевого счета продавца
    property PersonalAccountSeller:String read FPersonalAccountSeller write SetPersonalAccountSeller;
    //КодПродБюджКласс - Код бюджетной классификации продавца
    property SellerBudjetClassCode:Tstring20f read FSellerBudjetClassCode write SetSellerBudjetClassCode;
    //КодЦелиПрод - Код цели продавца
    property SellerTargetCode:Tstring20f read FSellerTargetCode write SetSellerTargetCode;
    //КодКазначПрод - Код территориального органа Федерального казначейства
    //продавца
    property SellerTreasuryCode:String read FSellerTreasuryCode write SetSellerTreasuryCode;
    //НаимКазначПрод - Наименование территориального органа Федерального
    //казначейства продавца
    property SellerTreasuryName:Tstring2000 read FSellerTreasuryName write SetSellerTreasuryName;
  end;

  {  TUniversalTransferDocumentWithHyphens_DocumentShipments  }
  TUniversalTransferDocumentWithHyphens_DocumentShipments = class(TXmlSerializationObject)
  private
    FDocumentShipment:TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipmentList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ДокПодтвОтгр - Реквизиты документа, подтверждающего отгрузку
    //товаров
    property DocumentShipment:TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipmentList read FDocumentShipment;
  end;

  {  TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment  }
  TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment = class(TXmlSerializationObject)
  private
    FName:Tstring255;
    FNumber:Tstring255;
    FDate:Tdate1;
    procedure SetName( AValue:Tstring255);
    procedure SetNumber( AValue:Tstring255);
    procedure SetDate( AValue:Tdate1);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //НаимДокОтгр - Наименование документа об отгрузке
    property Name:Tstring255 read FName write SetName;
    //НомДокОтгр - Номер документа об отгрузке
    property Number:Tstring255 read FNumber write SetNumber;
    //ДатаДокОтгр - Дата документа об отгрузке
    property Date:Tdate1 read FDate write SetDate;
  end;

  {  TInvoiceTable  }
  //ТаблСчФакт - Сведения таблицы счет фактуры
  TInvoiceTable = class(TXmlSerializationObject)
  private
    FItem:TInvoiceTable_ItemList;
    FTotalWithVatExcluded:Double;
    FVat:Double;
    FWithoutVat:String;
    FHyphenVat:String;
    FTotal:Double;
    FHyphenTotal:String;
    FTotalNet:Double;
    procedure SetTotalWithVatExcluded( AValue:Double);
    procedure SetVat( AValue:Double);
    procedure SetWithoutVat( AValue:String);
    procedure SetHyphenVat( AValue:String);
    procedure SetTotal( AValue:Double);
    procedure SetHyphenTotal( AValue:String);
    procedure SetTotalNet( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СведТов - информация о товарах
    property Item:TInvoiceTable_ItemList read FItem;
    //СтТовБезНДСВсего - Сумма без учета налога
    property TotalWithVatExcluded:Double read FTotalWithVatExcluded write SetTotalWithVatExcluded;
    //СумНалВсего - Сумма налога всего
    property Vat:Double read FVat write SetVat;
    //Без НДС. Указывается, если для суммы налога всего не требуется НДС
    property WithoutVat:String read FWithoutVat write SetWithoutVat;
    //ДефНДС. Указывается, если для товара не требуется НДС, визуализируется как прочерк
    property HyphenVat:String read FHyphenVat write SetHyphenVat;
    //СтТовУчНалВсего - Сумма всего
    property Total:Double read FTotal write SetTotal;
    //ДефСтТовУчНалВсего - если не заполнен СтТовУчНалВсего
    property HyphenTotal:String read FHyphenTotal write SetHyphenTotal;
    //НеттоВс - Нетто всего
    property TotalNet:Double read FTotalNet write SetTotalNet;
  end;

  {  TInvoiceTable_Item  }
  TInvoiceTable_Item = class(TXmlSerializationObject)
  private
    FCustomsDeclarations:TInvoiceTable_Item_CustomsDeclarations;
    FAdditionalInfos:TInvoiceTable_Item_AdditionalInfos;
    FItemTracingInfos:TInvoiceTable_Item_ItemTracingInfos;
    FItemIdentificationNumbers:TInvoiceTable_Item_ItemIdentificationNumbers;
    FProduct:Tstring1000;
    FUnit1:Tokei;
    FHyphenUnit:String;
    FUnitName:Tstring255;
    FQuantity:Double;
    FPrice:Double;
    FExcise:Double;
    FTaxRate:TTaxRateWithTwentyPercentAndTaxedByAgent;
    FSubtotalWithVatExcluded:Double;
    FVat:Double;
    FWithoutVat:String;
    FHyphenVat:String;
    FSubtotal:Double;
    FHyphenSubtotal:String;
    FItemMark:Int64;
    FAdditionalProperty:String;
    FItemVendorCode:Tstring255;
    FItemToRelease:Double;
    FItemCharact:Tstring1000;
    FItemArticle:Tstring50;
    FItemKind:Tstring10;
    FCatalogCode:String;
    FItemTypeCode:Tstring10;
    procedure SetProduct( AValue:Tstring1000);
    procedure SetUnit1( AValue:Tokei);
    procedure SetHyphenUnit( AValue:String);
    procedure SetUnitName( AValue:Tstring255);
    procedure SetQuantity( AValue:Double);
    procedure SetPrice( AValue:Double);
    procedure SetExcise( AValue:Double);
    procedure SetTaxRate( AValue:TTaxRateWithTwentyPercentAndTaxedByAgent);
    procedure SetSubtotalWithVatExcluded( AValue:Double);
    procedure SetVat( AValue:Double);
    procedure SetWithoutVat( AValue:String);
    procedure SetHyphenVat( AValue:String);
    procedure SetSubtotal( AValue:Double);
    procedure SetHyphenSubtotal( AValue:String);
    procedure SetItemMark( AValue:Int64);
    procedure SetAdditionalProperty( AValue:String);
    procedure SetItemVendorCode( AValue:Tstring255);
    procedure SetItemToRelease( AValue:Double);
    procedure SetItemCharact( AValue:Tstring1000);
    procedure SetItemArticle( AValue:Tstring50);
    procedure SetItemKind( AValue:Tstring10);
    procedure SetCatalogCode( AValue:String);
    procedure SetItemTypeCode( AValue:Tstring10);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property CustomsDeclarations:TInvoiceTable_Item_CustomsDeclarations read FCustomsDeclarations;
    property AdditionalInfos:TInvoiceTable_Item_AdditionalInfos read FAdditionalInfos;
    property ItemTracingInfos:TInvoiceTable_Item_ItemTracingInfos read FItemTracingInfos;
    property ItemIdentificationNumbers:TInvoiceTable_Item_ItemIdentificationNumbers read FItemIdentificationNumbers;
    //НаимТов - наименование товара
    property Product:Tstring1000 read FProduct write SetProduct;
    //ОКЕИ_Тов - единицы измерения товара (код)
    property Unit1:Tokei read FUnit1 write SetUnit1;
    //ДефОКЕИ_Тов - если отсутствует ОКЕИ_Тов
    property HyphenUnit:String read FHyphenUnit write SetHyphenUnit;
    //НаимЕдИзм - наименование единицы измерения товара.Пользователь заполняет, если Unit=ОКЕИ_Тов='0000'.
    property UnitName:Tstring255 read FUnitName write SetUnitName;
    //КолТов - количество единиц товара
    property Quantity:Double read FQuantity write SetQuantity;
    //ЦенаТов - цена за единицу товара
    property Price:Double read FPrice write SetPrice;
    //СумАкциз - акциз
    property Excise:Double read FExcise write SetExcise;
    //НалСт - ставка налога
    property TaxRate:TTaxRateWithTwentyPercentAndTaxedByAgent read FTaxRate write SetTaxRate;
    //СтТовБезНДС - сумма без учета налога
    property SubtotalWithVatExcluded:Double read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;
    //СумНал - сумма налога
    property Vat:Double read FVat write SetVat;
    //Без НДС. Указывается, если для товара не требуется НДС
    property WithoutVat:String read FWithoutVat write SetWithoutVat;
    //ДефНДС. Указывается, если для товара не требуется НДС, визуализируется как прочерк
    property HyphenVat:String read FHyphenVat write SetHyphenVat;
    //СтТовУчНал - сумма всего
    property Subtotal:Double read FSubtotal write SetSubtotal;
    //ДефСтТовУчНал - если не заполнен СтТовУчНал
    property HyphenSubtotal:String read FHyphenSubtotal write SetHyphenSubtotal;
    //ПрТовРаб - Признак товар-работа-услуга
    //1 - имущество;
    //2 - работа;
    //3 - услуга;
    //4 – имущественные права;
    //5 - иное
    property ItemMark:Int64 read FItemMark write SetItemMark;
    //ДопПризн - Дополнительная информация о признаке
    property AdditionalProperty:String read FAdditionalProperty write SetAdditionalProperty;
    //КодТов - Характеристика/код/артикул/сорт товара
    property ItemVendorCode:Tstring255 read FItemVendorCode write SetItemVendorCode;
    //НадлОтп - Количество надлежит отпустить
    property ItemToRelease:Double read FItemToRelease write SetItemToRelease;
    //ХарактерТов - Характеристика/описание товара
    property ItemCharact:Tstring1000 read FItemCharact write SetItemCharact;
    //АртикулТов - Артикул товара
    property ItemArticle:Tstring50 read FItemArticle write SetItemArticle;
    //СортТов - Сорт товара
    property ItemKind:Tstring10 read FItemKind write SetItemKind;
    //КодКат - Код каталога
    property CatalogCode:String read FCatalogCode write SetCatalogCode;
    //КодВидТов - Код вида товара
    property ItemTypeCode:Tstring10 read FItemTypeCode write SetItemTypeCode;
  end;

  {  TInvoiceTable_Item_CustomsDeclarations  }
  TInvoiceTable_Item_CustomsDeclarations = class(TXmlSerializationObject)
  private
    FCustomsDeclaration:TCustomsDeclarationWithHyphensList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Цифровой код страны происхождения товара (Графа 10
    //счета-фактуры)
    property CustomsDeclaration:TCustomsDeclarationWithHyphensList read FCustomsDeclaration;
  end;

  {  TInvoiceTable_Item_AdditionalInfos  }
  TInvoiceTable_Item_AdditionalInfos = class(TXmlSerializationObject)
  private
    FAdditionalInfo:TAdditionalInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Информационное поле факта хозяйственной жизни 1
    property AdditionalInfo:TAdditionalInfoList read FAdditionalInfo;
  end;

  {  TInvoiceTable_Item_ItemTracingInfos  }
  TInvoiceTable_Item_ItemTracingInfos = class(TXmlSerializationObject)
  private
    FItemTracingInfo:TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //СведПрослеж - Сведения о товаре, подлежащем
    //прослеживаемости
    property ItemTracingInfo:TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfoList read FItemTracingInfo;
  end;

  {  TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo  }
  TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo = class(TXmlSerializationObject)
  private
    FRegNumberUnit:Tstring29;
    FUnit1:Tokei;
    FQuantity:Double;
    FItemAddInfo:Tstring255;
    procedure SetRegNumberUnit( AValue:Tstring29);
    procedure SetUnit1( AValue:Tokei);
    procedure SetQuantity( AValue:Double);
    procedure SetItemAddInfo( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //НомТовПрослеж - Регистрационный номер партии
    //товара
    property RegNumberUnit:Tstring29 read FRegNumberUnit write SetRegNumberUnit;
    //ЕдИзмПрослеж - Единица количественного учета
    //товара, используемая в целях осуществления прослеживаемости
    property Unit1:Tokei read FUnit1 write SetUnit1;
    //КолВЕдПрослеж - Количество товара в единицах
    //измерения прослеживаемого товара
    property Quantity:Double read FQuantity write SetQuantity;
    //ДопПрослеж - Дополнительный показатель для
    //идентификации товаров, подлежащих прослеживаемости
    property ItemAddInfo:Tstring255 read FItemAddInfo write SetItemAddInfo;
  end;

  {  TInvoiceTable_Item_ItemIdentificationNumbers  }
  TInvoiceTable_Item_ItemIdentificationNumbers = class(TXmlSerializationObject)
  private
    FItemIdentificationNumber:TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumberList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //НомСредИдентТов - Номер средств идентификации товаров
    property ItemIdentificationNumber:TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumberList read FItemIdentificationNumber;
  end;

  {  TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber  }
  TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber = class(TXmlSerializationObject)
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

  {  TTransferInfo  }
  TTransferInfo = class(TXmlSerializationObject)
  private
    FTransferBases:TTransferInfo_TransferBases;
    FWaybills:TWaybills;
    FAdditionalInfoId:TAdditionalInfoId;
    FCarrier:TExtendedOrganizationInfoWithHyphens;
    FEmployee:TEmployee;
    FOtherIssuer:TOtherIssuer;
    FOperationInfo:Tstring255;
    FOperationType:Tstring255;
    FTransferDate:Tdate1;
    FTransferStartDate:Tdate1;
    FTransferEndDate:Tdate1;
    FTransferTextInfo:Tstring1000;
    FCreatedThingTransferDate:Tdate1;
    FCreatedThingInfo:Tstring1000;
    procedure SetOperationInfo( AValue:Tstring255);
    procedure SetOperationType( AValue:Tstring255);
    procedure SetTransferDate( AValue:Tdate1);
    procedure SetTransferStartDate( AValue:Tdate1);
    procedure SetTransferEndDate( AValue:Tdate1);
    procedure SetTransferTextInfo( AValue:Tstring1000);
    procedure SetCreatedThingTransferDate( AValue:Tdate1);
    procedure SetCreatedThingInfo( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property TransferBases:TTransferInfo_TransferBases read FTransferBases;
    //ТранНакл - Транспортная накладная
    property Waybills:TWaybills read FWaybills;
    //ИнфПолФХЖ3 - Информационное поле документа
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;
    //Перевозчик
    property Carrier:TExtendedOrganizationInfoWithHyphens read FCarrier;
    //РабОргПрод
    property Employee:TEmployee read FEmployee;
    //ИнЛицо
    property OtherIssuer:TOtherIssuer read FOtherIssuer;
    //СодОпер - Содержание операции
    property OperationInfo:Tstring255 read FOperationInfo write SetOperationInfo;
    //ВидОпер - Вид операции
    property OperationType:Tstring255 read FOperationType write SetOperationType;
    //ДатаПер - Дата отгрузки
    property TransferDate:Tdate1 read FTransferDate write SetTransferDate;
    //ДатаНач - Дата начала периода оказания услуг (выполнения работ, поставки товаров)
    property TransferStartDate:Tdate1 read FTransferStartDate write SetTransferStartDate;
    //ДатаОкон - Дата окончания периода оказания услуг (выполнения работ, поставки товаров)
    property TransferEndDate:Tdate1 read FTransferEndDate write SetTransferEndDate;
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
    FTransferBase:TTransferBase820List;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ОснПер - Основание отгрузки
    property TransferBase:TTransferBase820List read FTransferBase;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
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
    constructor Create;
    destructor Destroy; override;
  published
    //ИдентОсн - Идентификатор документа – основания
    property BaseDocumentId:Tstring255 read FBaseDocumentId write SetBaseDocumentId;
  end;

implementation

  {  TUniversalTransferDocumentWithHyphens  }
procedure TUniversalTransferDocumentWithHyphens.SetFunction1(AValue: String);
begin
  CheckLockupValue('Function1', AValue);
  FFunction1:=AValue;
  ModifiedProperty('Function1');
end;

procedure TUniversalTransferDocumentWithHyphens.SetApprovedStructureAdditionalInfoFields(AValue: Tstring14f);
begin
  CheckStrMinSize('ApprovedStructureAdditionalInfoFields', AValue);
  CheckStrMaxSize('ApprovedStructureAdditionalInfoFields', AValue);
  FApprovedStructureAdditionalInfoFields:=AValue;
  ModifiedProperty('ApprovedStructureAdditionalInfoFields');
end;

procedure TUniversalTransferDocumentWithHyphens.SetSenderFnsParticipantId(AValue: String);
begin
  CheckStrMinSize('SenderFnsParticipantId', AValue);
  CheckStrMaxSize('SenderFnsParticipantId', AValue);
  FSenderFnsParticipantId:=AValue;
  ModifiedProperty('SenderFnsParticipantId');
end;

procedure TUniversalTransferDocumentWithHyphens.SetRecipientFnsParticipantId(AValue: String);
begin
  CheckStrMinSize('RecipientFnsParticipantId', AValue);
  CheckStrMaxSize('RecipientFnsParticipantId', AValue);
  FRecipientFnsParticipantId:=AValue;
  ModifiedProperty('RecipientFnsParticipantId');
end;

procedure TUniversalTransferDocumentWithHyphens.SetDocumentName(AValue: Tstring255);
begin
  CheckStrMinSize('DocumentName', AValue);
  CheckStrMaxSize('DocumentName', AValue);
  FDocumentName:=AValue;
  ModifiedProperty('DocumentName');
end;

procedure TUniversalTransferDocumentWithHyphens.SetDocumentDate(AValue: Tdate1);
begin
  CheckStrMinSize('DocumentDate', AValue);
  CheckStrMaxSize('DocumentDate', AValue);
  FDocumentDate:=AValue;
  ModifiedProperty('DocumentDate');
end;

procedure TUniversalTransferDocumentWithHyphens.SetDocumentNumber(AValue: Tstring1000);
begin
  CheckStrMinSize('DocumentNumber', AValue);
  CheckStrMaxSize('DocumentNumber', AValue);
  FDocumentNumber:=AValue;
  ModifiedProperty('DocumentNumber');
end;

procedure TUniversalTransferDocumentWithHyphens.SetCurrency(AValue: Tokv);
begin
  CheckStrMinSize('Currency', AValue);
  CheckStrMaxSize('Currency', AValue);
  FCurrency:=AValue;
  ModifiedProperty('Currency');
end;

procedure TUniversalTransferDocumentWithHyphens.SetCurrencyRate(AValue: Double);
begin
  FCurrencyRate:=AValue;
  ModifiedProperty('CurrencyRate');
end;

procedure TUniversalTransferDocumentWithHyphens.SetRevisionDate(AValue: Tdate1);
begin
  CheckStrMinSize('RevisionDate', AValue);
  CheckStrMaxSize('RevisionDate', AValue);
  FRevisionDate:=AValue;
  ModifiedProperty('RevisionDate');
end;

procedure TUniversalTransferDocumentWithHyphens.SetHyphenRevisionDate(AValue: String);
begin
  CheckLockupValue('HyphenRevisionDate', AValue);
  CheckFixedValue('HyphenRevisionDate', AValue);
  FHyphenRevisionDate:=AValue;
  ModifiedProperty('HyphenRevisionDate');
end;

procedure TUniversalTransferDocumentWithHyphens.SetRevisionNumber(AValue: Int64);
begin
  FRevisionNumber:=AValue;
  ModifiedProperty('RevisionNumber');
end;

procedure TUniversalTransferDocumentWithHyphens.SetHyphenRevisionNumber(AValue: String);
begin
  CheckLockupValue('HyphenRevisionNumber', AValue);
  CheckFixedValue('HyphenRevisionNumber', AValue);
  FHyphenRevisionNumber:=AValue;
  ModifiedProperty('HyphenRevisionNumber');
end;

procedure TUniversalTransferDocumentWithHyphens.SetDocumentCreator(AValue: Tstring1000);
begin
  CheckStrMinSize('DocumentCreator', AValue);
  CheckStrMaxSize('DocumentCreator', AValue);
  FDocumentCreator:=AValue;
  ModifiedProperty('DocumentCreator');
end;

procedure TUniversalTransferDocumentWithHyphens.SetDocumentCreatorBase(AValue: Tstring120);
begin
  CheckStrMinSize('DocumentCreatorBase', AValue);
  CheckStrMaxSize('DocumentCreatorBase', AValue);
  FDocumentCreatorBase:=AValue;
  ModifiedProperty('DocumentCreatorBase');
end;

procedure TUniversalTransferDocumentWithHyphens.SetGovernmentContractInfo(AValue: String);
begin
  CheckStrMinSize('GovernmentContractInfo', AValue);
  CheckStrMaxSize('GovernmentContractInfo', AValue);
  FGovernmentContractInfo:=AValue;
  ModifiedProperty('GovernmentContractInfo');
end;

procedure TUniversalTransferDocumentWithHyphens.SetCircumFormatInvoice(AValue: String);
begin
  CheckLockupValue('CircumFormatInvoice', AValue);
  CheckStrMinSize('CircumFormatInvoice', AValue);
  CheckStrMaxSize('CircumFormatInvoice', AValue);
  FCircumFormatInvoice:=AValue;
  ModifiedProperty('CircumFormatInvoice');
end;

procedure TUniversalTransferDocumentWithHyphens.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Sellers', 'Sellers', [], '', -1, -1);
  P:=RegisterProperty('Buyers', 'Buyers', [], '', -1, -1);
  P:=RegisterProperty('Shippers', 'Shippers', [], '', -1, -1);
  P:=RegisterProperty('Consignees', 'Consignees', [], '', -1, -1);
  P:=RegisterProperty('Signers', 'Signers', [], '', -1, -1);
  P:=RegisterProperty('PaymentDocuments', 'PaymentDocuments', [], '', -1, -1);
  P:=RegisterProperty('AdditionalInfoId', 'AdditionalInfoId', [], '', -1, -1);
  P:=RegisterProperty('Table', 'Table', [], '', -1, -1);
  P:=RegisterProperty('TransferInfo', 'TransferInfo', [], '', -1, -1);
  P:=RegisterProperty('FactorInfo', 'FactorInfo', [], '', -1, -1);
  P:=RegisterProperty('MainAssignMonetaryClaim', 'MainAssignMonetaryClaim', [], '', -1, -1);
  P:=RegisterProperty('SellerInfoCircumPublicProc', 'SellerInfoCircumPublicProc', [], '', -1, -1);
  P:=RegisterProperty('DocumentShipments', 'DocumentShipments', [], '', -1, -1);
  P:=RegisterProperty('Function1', 'Function', [xsaRequared], '', -1, -1);
    P.ValidList.Add('СЧФ');
    P.ValidList.Add('ДОП');
    P.ValidList.Add('СЧФДОП');
    P.ValidList.Add('СвРК');
    P.ValidList.Add('СвЗК');
  P:=RegisterProperty('ApprovedStructureAdditionalInfoFields', 'ApprovedStructureAdditionalInfoFields', [], '', 14, 14);
  P:=RegisterProperty('SenderFnsParticipantId', 'SenderFnsParticipantId', [], '', 4, 46);
  P:=RegisterProperty('RecipientFnsParticipantId', 'RecipientFnsParticipantId', [], '', 4, 46);
  P:=RegisterProperty('DocumentName', 'DocumentName', [], '', 1, 255);
  P:=RegisterProperty('DocumentDate', 'DocumentDate', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('DocumentNumber', 'DocumentNumber', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('Currency', 'Currency', [xsaRequared], '', 3, 3);
  P:=RegisterProperty('CurrencyRate', 'CurrencyRate', [], '', -1, -1);
    P.TotalDigits := 10;
    P.FractionDigits := 4;
  P:=RegisterProperty('RevisionDate', 'RevisionDate', [], '', 10, 10);
  P:=RegisterProperty('HyphenRevisionDate', 'HyphenRevisionDate', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
  P:=RegisterProperty('RevisionNumber', 'RevisionNumber', [], '', -1, -1);
    P.TotalDigits := 3;
    P.FractionDigits := 0;
  P:=RegisterProperty('HyphenRevisionNumber', 'HyphenRevisionNumber', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
  P:=RegisterProperty('DocumentCreator', 'DocumentCreator', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('DocumentCreatorBase', 'DocumentCreatorBase', [], '', 1, 120);
  P:=RegisterProperty('GovernmentContractInfo', 'GovernmentContractInfo', [], '', 20, 25);
  P:=RegisterProperty('CircumFormatInvoice', 'CircumFormatInvoice', [], '', 1, 1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
    P.ValidList.Add('5');
    P.ValidList.Add('6');
    P.ValidList.Add('7');
    P.ValidList.Add('8');
end;

procedure TUniversalTransferDocumentWithHyphens.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSellers:=TUniversalTransferDocumentWithHyphens_Sellers.Create;
  FBuyers:=TUniversalTransferDocumentWithHyphens_Buyers.Create;
  FShippers:=TUniversalTransferDocumentWithHyphens_Shippers.Create;
  FConsignees:=TUniversalTransferDocumentWithHyphens_Consignees.Create;
  FSigners:=TUniversalTransferDocumentWithHyphens_Signers.Create;
  FPaymentDocuments:=TUniversalTransferDocumentWithHyphens_PaymentDocuments.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FTable:=TInvoiceTable.Create;
  FTransferInfo:=TTransferInfo.Create;
  FFactorInfo:=TExtendedOrganizationInfoWithHyphens.Create;
  FMainAssignMonetaryClaim:=TTransferBase820.Create;
  FSellerInfoCircumPublicProc:=TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.Create;
  FDocumentShipments:=TUniversalTransferDocumentWithHyphens_DocumentShipments.Create;
end;

destructor TUniversalTransferDocumentWithHyphens.Destroy;
begin
  FSellers.Free;
  FBuyers.Free;
  FShippers.Free;
  FConsignees.Free;
  FSigners.Free;
  FPaymentDocuments.Free;
  FAdditionalInfoId.Free;
  FTable.Free;
  FTransferInfo.Free;
  FFactorInfo.Free;
  FMainAssignMonetaryClaim.Free;
  FSellerInfoCircumPublicProc.Free;
  FDocumentShipments.Free;
  inherited Destroy;
end;

function TUniversalTransferDocumentWithHyphens.RootNodeName:string;
begin
  Result:='UniversalTransferDocumentWithHyphens';
end;

constructor TUniversalTransferDocumentWithHyphens.Create;
begin
  inherited Create;
  HyphenRevisionDate:='false';
  HyphenRevisionNumber:='false';
end;

  {  TUniversalTransferDocumentWithHyphens_Sellers  }
procedure TUniversalTransferDocumentWithHyphens_Sellers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Seller', 'Seller', [], '', -1, -1);
end;

procedure TUniversalTransferDocumentWithHyphens_Sellers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSeller:=TExtendedOrganizationInfoWithHyphensList.Create;
end;

destructor TUniversalTransferDocumentWithHyphens_Sellers.Destroy;
begin
  FSeller.Free;
  inherited Destroy;
end;

constructor TUniversalTransferDocumentWithHyphens_Sellers.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentWithHyphens_Buyers  }
procedure TUniversalTransferDocumentWithHyphens_Buyers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Buyer', 'Buyer', [], '', -1, -1);
end;

procedure TUniversalTransferDocumentWithHyphens_Buyers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FBuyer:=TExtendedOrganizationInfoWithHyphensList.Create;
end;

destructor TUniversalTransferDocumentWithHyphens_Buyers.Destroy;
begin
  FBuyer.Free;
  inherited Destroy;
end;

constructor TUniversalTransferDocumentWithHyphens_Buyers.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentWithHyphens_Shippers  }
procedure TUniversalTransferDocumentWithHyphens_Shippers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Shipper', 'Shipper', [], '', -1, -1);
end;

procedure TUniversalTransferDocumentWithHyphens_Shippers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FShipper:=TUniversalTransferDocumentWithHyphens_Shippers_ShipperList.Create;
end;

destructor TUniversalTransferDocumentWithHyphens_Shippers.Destroy;
begin
  FShipper.Free;
  inherited Destroy;
end;

constructor TUniversalTransferDocumentWithHyphens_Shippers.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentWithHyphens_Shippers_Shipper  }
procedure TUniversalTransferDocumentWithHyphens_Shippers_Shipper.SetSameAsSeller(AValue: String);
begin
  CheckLockupValue('SameAsSeller', AValue);
  CheckFixedValue('SameAsSeller', AValue);
  FSameAsSeller:=AValue;
  ModifiedProperty('SameAsSeller');
end;

procedure TUniversalTransferDocumentWithHyphens_Shippers_Shipper.InternalRegisterPropertys;
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

procedure TUniversalTransferDocumentWithHyphens_Shippers_Shipper.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TExtendedOrganizationDetailsWithHyphens.Create;
  FOrganizationReference:=TExtendedOrganizationReference.Create;
end;

destructor TUniversalTransferDocumentWithHyphens_Shippers_Shipper.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

constructor TUniversalTransferDocumentWithHyphens_Shippers_Shipper.Create;
begin
  inherited Create;
  SameAsSeller:='false';
end;

  {  TUniversalTransferDocumentWithHyphens_Consignees  }
procedure TUniversalTransferDocumentWithHyphens_Consignees.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Consignee', 'Consignee', [], '', -1, -1);
end;

procedure TUniversalTransferDocumentWithHyphens_Consignees.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FConsignee:=TExtendedOrganizationInfoWithHyphensList.Create;
end;

destructor TUniversalTransferDocumentWithHyphens_Consignees.Destroy;
begin
  FConsignee.Free;
  inherited Destroy;
end;

constructor TUniversalTransferDocumentWithHyphens_Consignees.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentWithHyphens_Signers  }
procedure TUniversalTransferDocumentWithHyphens_Signers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerReference', 'SignerReference', [], '', -1, -1);
  P:=RegisterProperty('SignerDetails', 'SignerDetails', [], '', -1, -1);
end;

procedure TUniversalTransferDocumentWithHyphens_Signers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSignerReference:=TSignerReference.Create;
  FSignerDetails:=TExtendedSignerDetails_SellerTitle.Create;
end;

destructor TUniversalTransferDocumentWithHyphens_Signers.Destroy;
begin
  FSignerReference.Free;
  FSignerDetails.Free;
  inherited Destroy;
end;

constructor TUniversalTransferDocumentWithHyphens_Signers.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentWithHyphens_PaymentDocuments  }
procedure TUniversalTransferDocumentWithHyphens_PaymentDocuments.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Document', 'Document', [], '', -1, -1);
end;

procedure TUniversalTransferDocumentWithHyphens_PaymentDocuments.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FDocument:=TPaymentDocumentInfoList.Create;
end;

destructor TUniversalTransferDocumentWithHyphens_PaymentDocuments.Destroy;
begin
  FDocument.Free;
  inherited Destroy;
end;

constructor TUniversalTransferDocumentWithHyphens_PaymentDocuments.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc  }
procedure TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.SetDateStateContract(AValue: Tdate1);
begin
  CheckStrMinSize('DateStateContract', AValue);
  CheckStrMaxSize('DateStateContract', AValue);
  FDateStateContract:=AValue;
  ModifiedProperty('DateStateContract');
end;

procedure TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.SetNumberStateContract(AValue: Tstring100);
begin
  CheckStrMinSize('NumberStateContract', AValue);
  CheckStrMaxSize('NumberStateContract', AValue);
  FNumberStateContract:=AValue;
  ModifiedProperty('NumberStateContract');
end;

procedure TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.SetPersonalAccountSeller(AValue: String);
begin
  CheckStrMinSize('PersonalAccountSeller', AValue);
  CheckStrMaxSize('PersonalAccountSeller', AValue);
  FPersonalAccountSeller:=AValue;
  ModifiedProperty('PersonalAccountSeller');
end;

procedure TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.SetSellerBudjetClassCode(AValue: Tstring20f);
begin
  CheckStrMinSize('SellerBudjetClassCode', AValue);
  CheckStrMaxSize('SellerBudjetClassCode', AValue);
  FSellerBudjetClassCode:=AValue;
  ModifiedProperty('SellerBudjetClassCode');
end;

procedure TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.SetSellerTargetCode(AValue: Tstring20f);
begin
  CheckStrMinSize('SellerTargetCode', AValue);
  CheckStrMaxSize('SellerTargetCode', AValue);
  FSellerTargetCode:=AValue;
  ModifiedProperty('SellerTargetCode');
end;

procedure TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.SetSellerTreasuryCode(AValue: String);
begin
  CheckStrMinSize('SellerTreasuryCode', AValue);
  CheckStrMaxSize('SellerTreasuryCode', AValue);
  FSellerTreasuryCode:=AValue;
  ModifiedProperty('SellerTreasuryCode');
end;

procedure TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.SetSellerTreasuryName(AValue: Tstring2000);
begin
  CheckStrMinSize('SellerTreasuryName', AValue);
  CheckStrMaxSize('SellerTreasuryName', AValue);
  FSellerTreasuryName:=AValue;
  ModifiedProperty('SellerTreasuryName');
end;

procedure TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('DateStateContract', 'DateStateContract', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('NumberStateContract', 'NumberStateContract', [xsaRequared], '', 1, 100);
  P:=RegisterProperty('PersonalAccountSeller', 'PersonalAccountSeller', [], '', 11, 11);
  P:=RegisterProperty('SellerBudjetClassCode', 'SellerBudjetClassCode', [], '', 20, 20);
  P:=RegisterProperty('SellerTargetCode', 'SellerTargetCode', [], '', 20, 20);
  P:=RegisterProperty('SellerTreasuryCode', 'SellerTreasuryCode', [], '', 1, 4);
  P:=RegisterProperty('SellerTreasuryName', 'SellerTreasuryName', [], '', 1, 2000);
end;

procedure TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.Destroy;
begin
  inherited Destroy;
end;

constructor TUniversalTransferDocumentWithHyphens_SellerInfoCircumPublicProc.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentWithHyphens_DocumentShipments  }
procedure TUniversalTransferDocumentWithHyphens_DocumentShipments.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('DocumentShipment', 'DocumentShipment', [], '', -1, -1);
end;

procedure TUniversalTransferDocumentWithHyphens_DocumentShipments.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FDocumentShipment:=TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipmentList.Create;
end;

destructor TUniversalTransferDocumentWithHyphens_DocumentShipments.Destroy;
begin
  FDocumentShipment.Free;
  inherited Destroy;
end;

constructor TUniversalTransferDocumentWithHyphens_DocumentShipments.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment  }
procedure TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment.SetName(AValue: Tstring255);
begin
  CheckStrMinSize('Name', AValue);
  CheckStrMaxSize('Name', AValue);
  FName:=AValue;
  ModifiedProperty('Name');
end;

procedure TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment.SetNumber(AValue: Tstring255);
begin
  CheckStrMinSize('Number', AValue);
  CheckStrMaxSize('Number', AValue);
  FNumber:=AValue;
  ModifiedProperty('Number');
end;

procedure TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment.SetDate(AValue: Tdate1);
begin
  CheckStrMinSize('Date', AValue);
  CheckStrMaxSize('Date', AValue);
  FDate:=AValue;
  ModifiedProperty('Date');
end;

procedure TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Name', 'Name', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('Number', 'Number', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('Date', 'Date', [], '', 10, 10);
end;

procedure TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment.Destroy;
begin
  inherited Destroy;
end;

constructor TUniversalTransferDocumentWithHyphens_DocumentShipments_DocumentShipment.Create;
begin
  inherited Create;
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

procedure TInvoiceTable.SetWithoutVat(AValue: String);
begin
  CheckLockupValue('WithoutVat', AValue);
  CheckFixedValue('WithoutVat', AValue);
  FWithoutVat:=AValue;
  ModifiedProperty('WithoutVat');
end;

procedure TInvoiceTable.SetHyphenVat(AValue: String);
begin
  CheckLockupValue('HyphenVat', AValue);
  CheckFixedValue('HyphenVat', AValue);
  FHyphenVat:=AValue;
  ModifiedProperty('HyphenVat');
end;

procedure TInvoiceTable.SetTotal(AValue: Double);
begin
  FTotal:=AValue;
  ModifiedProperty('Total');
end;

procedure TInvoiceTable.SetHyphenTotal(AValue: String);
begin
  CheckLockupValue('HyphenTotal', AValue);
  CheckFixedValue('HyphenTotal', AValue);
  FHyphenTotal:=AValue;
  ModifiedProperty('HyphenTotal');
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
  P:=RegisterProperty('WithoutVat', 'WithoutVat', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
  P:=RegisterProperty('HyphenVat', 'HyphenVat', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
  P:=RegisterProperty('Total', 'Total', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('HyphenTotal', 'HyphenTotal', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
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

constructor TInvoiceTable.Create;
begin
  inherited Create;
  WithoutVat:='false';
  HyphenVat:='false';
  HyphenTotal:='false';
end;

  {  TInvoiceTable_Item  }
procedure TInvoiceTable_Item.SetProduct(AValue: Tstring1000);
begin
  CheckStrMinSize('Product', AValue);
  CheckStrMaxSize('Product', AValue);
  FProduct:=AValue;
  ModifiedProperty('Product');
end;

procedure TInvoiceTable_Item.SetUnit1(AValue: Tokei);
begin
  CheckStrMinSize('Unit1', AValue);
  CheckStrMaxSize('Unit1', AValue);
  FUnit1:=AValue;
  ModifiedProperty('Unit1');
end;

procedure TInvoiceTable_Item.SetHyphenUnit(AValue: String);
begin
  CheckLockupValue('HyphenUnit', AValue);
  CheckFixedValue('HyphenUnit', AValue);
  FHyphenUnit:=AValue;
  ModifiedProperty('HyphenUnit');
end;

procedure TInvoiceTable_Item.SetUnitName(AValue: Tstring255);
begin
  CheckStrMinSize('UnitName', AValue);
  CheckStrMaxSize('UnitName', AValue);
  FUnitName:=AValue;
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

procedure TInvoiceTable_Item.SetTaxRate(AValue: TTaxRateWithTwentyPercentAndTaxedByAgent);
begin
  CheckLockupValue('TaxRate', AValue);
  FTaxRate:=AValue;
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

procedure TInvoiceTable_Item.SetWithoutVat(AValue: String);
begin
  CheckLockupValue('WithoutVat', AValue);
  CheckFixedValue('WithoutVat', AValue);
  FWithoutVat:=AValue;
  ModifiedProperty('WithoutVat');
end;

procedure TInvoiceTable_Item.SetHyphenVat(AValue: String);
begin
  CheckLockupValue('HyphenVat', AValue);
  CheckFixedValue('HyphenVat', AValue);
  FHyphenVat:=AValue;
  ModifiedProperty('HyphenVat');
end;

procedure TInvoiceTable_Item.SetSubtotal(AValue: Double);
begin
  FSubtotal:=AValue;
  ModifiedProperty('Subtotal');
end;

procedure TInvoiceTable_Item.SetHyphenSubtotal(AValue: String);
begin
  CheckLockupValue('HyphenSubtotal', AValue);
  CheckFixedValue('HyphenSubtotal', AValue);
  FHyphenSubtotal:=AValue;
  ModifiedProperty('HyphenSubtotal');
end;

procedure TInvoiceTable_Item.SetItemMark(AValue: Int64);
begin
  CheckLockupValue('ItemMark', AValue);
  FItemMark:=AValue;
  ModifiedProperty('ItemMark');
end;

procedure TInvoiceTable_Item.SetAdditionalProperty(AValue: String);
begin
  CheckStrMinSize('AdditionalProperty', AValue);
  CheckStrMaxSize('AdditionalProperty', AValue);
  FAdditionalProperty:=AValue;
  ModifiedProperty('AdditionalProperty');
end;

procedure TInvoiceTable_Item.SetItemVendorCode(AValue: Tstring255);
begin
  CheckStrMinSize('ItemVendorCode', AValue);
  CheckStrMaxSize('ItemVendorCode', AValue);
  FItemVendorCode:=AValue;
  ModifiedProperty('ItemVendorCode');
end;

procedure TInvoiceTable_Item.SetItemToRelease(AValue: Double);
begin
  FItemToRelease:=AValue;
  ModifiedProperty('ItemToRelease');
end;

procedure TInvoiceTable_Item.SetItemCharact(AValue: Tstring1000);
begin
  CheckStrMinSize('ItemCharact', AValue);
  CheckStrMaxSize('ItemCharact', AValue);
  FItemCharact:=AValue;
  ModifiedProperty('ItemCharact');
end;

procedure TInvoiceTable_Item.SetItemArticle(AValue: Tstring50);
begin
  CheckStrMinSize('ItemArticle', AValue);
  CheckStrMaxSize('ItemArticle', AValue);
  FItemArticle:=AValue;
  ModifiedProperty('ItemArticle');
end;

procedure TInvoiceTable_Item.SetItemKind(AValue: Tstring10);
begin
  CheckStrMinSize('ItemKind', AValue);
  CheckStrMaxSize('ItemKind', AValue);
  FItemKind:=AValue;
  ModifiedProperty('ItemKind');
end;

procedure TInvoiceTable_Item.SetCatalogCode(AValue: String);
begin
  CheckStrMinSize('CatalogCode', AValue);
  CheckStrMaxSize('CatalogCode', AValue);
  FCatalogCode:=AValue;
  ModifiedProperty('CatalogCode');
end;

procedure TInvoiceTable_Item.SetItemTypeCode(AValue: Tstring10);
begin
  CheckStrMinSize('ItemTypeCode', AValue);
  CheckStrMaxSize('ItemTypeCode', AValue);
  FItemTypeCode:=AValue;
  ModifiedProperty('ItemTypeCode');
end;

procedure TInvoiceTable_Item.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CustomsDeclarations', 'CustomsDeclarations', [], '', -1, -1);
  P:=RegisterProperty('AdditionalInfos', 'AdditionalInfos', [], '', -1, -1);
  P:=RegisterProperty('ItemTracingInfos', 'ItemTracingInfos', [], '', -1, -1);
  P:=RegisterProperty('ItemIdentificationNumbers', 'ItemIdentificationNumbers', [], '', -1, -1);
  P:=RegisterProperty('Product', 'Product', [], '', 1, 1000);
  P:=RegisterProperty('Unit1', 'Unit', [], '', 3, 4);
  P:=RegisterProperty('HyphenUnit', 'HyphenUnit', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
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
    P.ValidList.Add('20%');
    P.ValidList.Add('10/110');
    P.ValidList.Add('18/118');
    P.ValidList.Add('20/120');
    P.ValidList.Add('НДС исчисляется налоговым агентом');
  P:=RegisterProperty('SubtotalWithVatExcluded', 'SubtotalWithVatExcluded', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('Vat', 'Vat', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('WithoutVat', 'WithoutVat', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
  P:=RegisterProperty('HyphenVat', 'HyphenVat', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
  P:=RegisterProperty('Subtotal', 'Subtotal', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('HyphenSubtotal', 'HyphenSubtotal', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
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
  P:=RegisterProperty('ItemCharact', 'ItemCharact', [], '', 1, 1000);
  P:=RegisterProperty('ItemArticle', 'ItemArticle', [], '', 1, 50);
  P:=RegisterProperty('ItemKind', 'ItemKind', [], '', 1, 10);
  P:=RegisterProperty('CatalogCode', 'CatalogCode', [], '', 27, 27);
  P:=RegisterProperty('ItemTypeCode', 'ItemTypeCode', [], '', 1, 10);
end;

procedure TInvoiceTable_Item.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FCustomsDeclarations:=TInvoiceTable_Item_CustomsDeclarations.Create;
  FAdditionalInfos:=TInvoiceTable_Item_AdditionalInfos.Create;
  FItemTracingInfos:=TInvoiceTable_Item_ItemTracingInfos.Create;
  FItemIdentificationNumbers:=TInvoiceTable_Item_ItemIdentificationNumbers.Create;
end;

destructor TInvoiceTable_Item.Destroy;
begin
  FCustomsDeclarations.Free;
  FAdditionalInfos.Free;
  FItemTracingInfos.Free;
  FItemIdentificationNumbers.Free;
  inherited Destroy;
end;

constructor TInvoiceTable_Item.Create;
begin
  inherited Create;
  HyphenUnit:='false';
  WithoutVat:='false';
  HyphenVat:='false';
  HyphenSubtotal:='false';
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
  FCustomsDeclaration:=TCustomsDeclarationWithHyphensList.Create;
end;

destructor TInvoiceTable_Item_CustomsDeclarations.Destroy;
begin
  FCustomsDeclaration.Free;
  inherited Destroy;
end;

constructor TInvoiceTable_Item_CustomsDeclarations.Create;
begin
  inherited Create;
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

constructor TInvoiceTable_Item_AdditionalInfos.Create;
begin
  inherited Create;
end;

  {  TInvoiceTable_Item_ItemTracingInfos  }
procedure TInvoiceTable_Item_ItemTracingInfos.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ItemTracingInfo', 'ItemTracingInfo', [], '', -1, -1);
end;

procedure TInvoiceTable_Item_ItemTracingInfos.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItemTracingInfo:=TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfoList.Create;
end;

destructor TInvoiceTable_Item_ItemTracingInfos.Destroy;
begin
  FItemTracingInfo.Free;
  inherited Destroy;
end;

constructor TInvoiceTable_Item_ItemTracingInfos.Create;
begin
  inherited Create;
end;

  {  TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo  }
procedure TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo.SetRegNumberUnit(AValue: Tstring29);
begin
  CheckStrMinSize('RegNumberUnit', AValue);
  CheckStrMaxSize('RegNumberUnit', AValue);
  FRegNumberUnit:=AValue;
  ModifiedProperty('RegNumberUnit');
end;

procedure TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo.SetUnit1(AValue: Tokei);
begin
  CheckStrMinSize('Unit1', AValue);
  CheckStrMaxSize('Unit1', AValue);
  FUnit1:=AValue;
  ModifiedProperty('Unit1');
end;

procedure TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo.SetQuantity(AValue: Double);
begin
  FQuantity:=AValue;
  ModifiedProperty('Quantity');
end;

procedure TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo.SetItemAddInfo(AValue: Tstring255);
begin
  CheckStrMinSize('ItemAddInfo', AValue);
  CheckStrMaxSize('ItemAddInfo', AValue);
  FItemAddInfo:=AValue;
  ModifiedProperty('ItemAddInfo');
end;

procedure TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('RegNumberUnit', 'RegNumberUnit', [xsaRequared], '', 1, 29);
  P:=RegisterProperty('Unit1', 'Unit', [xsaRequared], '', 3, 4);
  P:=RegisterProperty('Quantity', 'Quantity', [xsaRequared], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
  P:=RegisterProperty('ItemAddInfo', 'ItemAddInfo', [], '', 1, 255);
end;

procedure TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo.Destroy;
begin
  inherited Destroy;
end;

constructor TInvoiceTable_Item_ItemTracingInfos_ItemTracingInfo.Create;
begin
  inherited Create;
end;

  {  TInvoiceTable_Item_ItemIdentificationNumbers  }
procedure TInvoiceTable_Item_ItemIdentificationNumbers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ItemIdentificationNumber', 'ItemIdentificationNumber', [], '', -1, -1);
end;

procedure TInvoiceTable_Item_ItemIdentificationNumbers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItemIdentificationNumber:=TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumberList.Create;
end;

destructor TInvoiceTable_Item_ItemIdentificationNumbers.Destroy;
begin
  FItemIdentificationNumber.Free;
  inherited Destroy;
end;

constructor TInvoiceTable_Item_ItemIdentificationNumbers.Create;
begin
  inherited Create;
end;

  {  TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber  }
procedure TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber.SetUnit1(AValue: TXSDStringArray);
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

procedure TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber.SetPackageId(AValue: TXSDStringArray);
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

procedure TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber.SetTransPackageId(AValue: Tstring255);
begin
  CheckStrMinSize('TransPackageId', AValue);
  CheckStrMaxSize('TransPackageId', AValue);
  FTransPackageId:=AValue;
  ModifiedProperty('TransPackageId');
end;

procedure TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Unit1', 'Unit', [xsaSimpleObject], '', 1, 255);
  P:=RegisterProperty('PackageId', 'PackageId', [xsaSimpleObject], '', 1, 255);
  P:=RegisterProperty('TransPackageId', 'TransPackageId', [], '', 1, 255);
end;

procedure TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber.Destroy;
begin
  inherited Destroy;
end;

constructor TInvoiceTable_Item_ItemIdentificationNumbers_ItemIdentificationNumber.Create;
begin
  inherited Create;
end;

  {  TTransferInfo  }
procedure TTransferInfo.SetOperationInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OperationInfo', AValue);
  CheckStrMaxSize('OperationInfo', AValue);
  FOperationInfo:=AValue;
  ModifiedProperty('OperationInfo');
end;

procedure TTransferInfo.SetOperationType(AValue: Tstring255);
begin
  CheckStrMinSize('OperationType', AValue);
  CheckStrMaxSize('OperationType', AValue);
  FOperationType:=AValue;
  ModifiedProperty('OperationType');
end;

procedure TTransferInfo.SetTransferDate(AValue: Tdate1);
begin
  CheckStrMinSize('TransferDate', AValue);
  CheckStrMaxSize('TransferDate', AValue);
  FTransferDate:=AValue;
  ModifiedProperty('TransferDate');
end;

procedure TTransferInfo.SetTransferStartDate(AValue: Tdate1);
begin
  CheckStrMinSize('TransferStartDate', AValue);
  CheckStrMaxSize('TransferStartDate', AValue);
  FTransferStartDate:=AValue;
  ModifiedProperty('TransferStartDate');
end;

procedure TTransferInfo.SetTransferEndDate(AValue: Tdate1);
begin
  CheckStrMinSize('TransferEndDate', AValue);
  CheckStrMaxSize('TransferEndDate', AValue);
  FTransferEndDate:=AValue;
  ModifiedProperty('TransferEndDate');
end;

procedure TTransferInfo.SetTransferTextInfo(AValue: Tstring1000);
begin
  CheckStrMinSize('TransferTextInfo', AValue);
  CheckStrMaxSize('TransferTextInfo', AValue);
  FTransferTextInfo:=AValue;
  ModifiedProperty('TransferTextInfo');
end;

procedure TTransferInfo.SetCreatedThingTransferDate(AValue: Tdate1);
begin
  CheckStrMinSize('CreatedThingTransferDate', AValue);
  CheckStrMaxSize('CreatedThingTransferDate', AValue);
  FCreatedThingTransferDate:=AValue;
  ModifiedProperty('CreatedThingTransferDate');
end;

procedure TTransferInfo.SetCreatedThingInfo(AValue: Tstring1000);
begin
  CheckStrMinSize('CreatedThingInfo', AValue);
  CheckStrMaxSize('CreatedThingInfo', AValue);
  FCreatedThingInfo:=AValue;
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
  P:=RegisterProperty('TransferStartDate', 'TransferStartDate', [], '', 10, 10);
  P:=RegisterProperty('TransferEndDate', 'TransferEndDate', [], '', 10, 10);
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
  FCarrier:=TExtendedOrganizationInfoWithHyphens.Create;
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

constructor TTransferInfo.Create;
begin
  inherited Create;
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
  FTransferBase:=TTransferBase820List.Create;
end;

destructor TTransferInfo_TransferBases.Destroy;
begin
  FTransferBase.Free;
  inherited Destroy;
end;

constructor TTransferInfo_TransferBases.Create;
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

  {  TEmployee  }
procedure TEmployee.SetPosition(AValue: Tstring128z);
begin
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TEmployee.SetEmployeeInfo(AValue: Tstring255);
begin
  CheckStrMinSize('EmployeeInfo', AValue);
  CheckStrMaxSize('EmployeeInfo', AValue);
  FEmployeeInfo:=AValue;
  ModifiedProperty('EmployeeInfo');
end;

procedure TEmployee.SetEmployeeBase(AValue: Tstring120);
begin
  CheckStrMinSize('EmployeeBase', AValue);
  CheckStrMaxSize('EmployeeBase', AValue);
  FEmployeeBase:=AValue;
  ModifiedProperty('EmployeeBase');
end;

procedure TEmployee.SetLastName(AValue: Tstring60);
begin
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TEmployee.SetFirstName(AValue: Tstring60);
begin
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TEmployee.SetMiddleName(AValue: Tstring60);
begin
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  FMiddleName:=AValue;
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

constructor TEmployee.Create;
begin
  inherited Create;
end;

  {  TOtherIssuer  }
procedure TOtherIssuer.SetPosition(AValue: Tstring128z);
begin
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TOtherIssuer.SetEmployeeInfo(AValue: Tstring255);
begin
  CheckStrMinSize('EmployeeInfo', AValue);
  CheckStrMaxSize('EmployeeInfo', AValue);
  FEmployeeInfo:=AValue;
  ModifiedProperty('EmployeeInfo');
end;

procedure TOtherIssuer.SetEmployeeBase(AValue: Tstring120);
begin
  CheckStrMinSize('EmployeeBase', AValue);
  CheckStrMaxSize('EmployeeBase', AValue);
  FEmployeeBase:=AValue;
  ModifiedProperty('EmployeeBase');
end;

procedure TOtherIssuer.SetOrganizationName(AValue: Tstring128z);
begin
  CheckStrMinSize('OrganizationName', AValue);
  CheckStrMaxSize('OrganizationName', AValue);
  FOrganizationName:=AValue;
  ModifiedProperty('OrganizationName');
end;

procedure TOtherIssuer.SetOrganizationBase(AValue: Tstring120);
begin
  CheckStrMinSize('OrganizationBase', AValue);
  CheckStrMaxSize('OrganizationBase', AValue);
  FOrganizationBase:=AValue;
  ModifiedProperty('OrganizationBase');
end;

procedure TOtherIssuer.SetLastName(AValue: Tstring60);
begin
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TOtherIssuer.SetFirstName(AValue: Tstring60);
begin
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TOtherIssuer.SetMiddleName(AValue: Tstring60);
begin
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  FMiddleName:=AValue;
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

constructor TOtherIssuer.Create;
begin
  inherited Create;
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

constructor TWaybills.Create;
begin
  inherited Create;
end;

  {  TWaybills_Waybill  }
procedure TWaybills_Waybill.SetTransferDocumentNumber(AValue: Tstring255);
begin
  CheckStrMinSize('TransferDocumentNumber', AValue);
  CheckStrMaxSize('TransferDocumentNumber', AValue);
  FTransferDocumentNumber:=AValue;
  ModifiedProperty('TransferDocumentNumber');
end;

procedure TWaybills_Waybill.SetTransferDocumentDate(AValue: Tdate1);
begin
  CheckStrMinSize('TransferDocumentDate', AValue);
  CheckStrMaxSize('TransferDocumentDate', AValue);
  FTransferDocumentDate:=AValue;
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

constructor TWaybills_Waybill.Create;
begin
  inherited Create;
end;

  {  TTransferBase  }
procedure TTransferBase.SetBaseDocumentName(AValue: Tstring255);
begin
  CheckStrMinSize('BaseDocumentName', AValue);
  CheckStrMaxSize('BaseDocumentName', AValue);
  FBaseDocumentName:=AValue;
  ModifiedProperty('BaseDocumentName');
end;

procedure TTransferBase.SetBaseDocumentNumber(AValue: Tstring255);
begin
  CheckStrMinSize('BaseDocumentNumber', AValue);
  CheckStrMaxSize('BaseDocumentNumber', AValue);
  FBaseDocumentNumber:=AValue;
  ModifiedProperty('BaseDocumentNumber');
end;

procedure TTransferBase.SetBaseDocumentDate(AValue: Tdate1);
begin
  CheckStrMinSize('BaseDocumentDate', AValue);
  CheckStrMaxSize('BaseDocumentDate', AValue);
  FBaseDocumentDate:=AValue;
  ModifiedProperty('BaseDocumentDate');
end;

procedure TTransferBase.SetBaseDocumentInfo(AValue: Tstring1000);
begin
  CheckStrMinSize('BaseDocumentInfo', AValue);
  CheckStrMaxSize('BaseDocumentInfo', AValue);
  FBaseDocumentInfo:=AValue;
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

constructor TTransferBase.Create;
begin
  inherited Create;
end;

  {  TTransferBase820  }
procedure TTransferBase820.SetBaseDocumentId(AValue: Tstring255);
begin
  CheckStrMinSize('BaseDocumentId', AValue);
  CheckStrMaxSize('BaseDocumentId', AValue);
  FBaseDocumentId:=AValue;
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

constructor TTransferBase820.Create;
begin
  inherited Create;
end;

end.