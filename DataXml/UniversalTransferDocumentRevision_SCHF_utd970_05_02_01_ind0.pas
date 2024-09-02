{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2024 Lagunov Aleksey alexs75@yandex.ru

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

unit UniversalTransferDocumentRevision_SCHF_utd970_05_02_01_ind0;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject, AbstractSerializationObjects;

type
  Tstring1f = String;
  Tstring2 = String;
  Tstring3f = String;
  Tstring3 = String;
  Tstring4f = String;
  Tstring4 = String;
  Tstring5f = String;
  Tstring8 = String;
  Tstring9f = String;
  Tstring10 = String;
  Tstring11f = String;
  Tstring13f = String;
  Tstring14f = String;
  Tstring16 = String;
  Tstring20 = String;
  Tstring20f = String;
  Tstring24 = String;
  Tstring27f = String;
  Tstring29 = String;
  Tstring30 = String;
  Tstring36 = String;
  Tstring40 = String;
  Tstring50 = String;
  Tstring55 = String;
  Tstring60 = String;
  Tstring100 = String;
  Tstring100z = String;
  Tstring120 = String;
  Tstring128 = String;
  Tstring128z = String;
  Tstring200 = String;
  Tstring255z = String;
  Tstring255 = String;
  Tstring256 = String;
  Tstring500 = String;
  Tstring510 = String;
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
  //Код товара по ОКДП 2
  Tokpd = String;
  //ОГРН - ОГРНИП
  Togrn = String;
  //Код причины постановки на учет (КПП) - 5 и 6 знаки от 0-9 и A-Z
  Tkpp = String;
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
  TTaxRateUtd970 = String;
  //1 - Сведения о юридическом лице, состоящем на учете в налоговых органах // СвЮЛУч
  //2 - Сведения об индивидуальном предпринимателе// СвИП
  //3 - Сведения об иностранном лице, не состоящем на учете в налоговых органах // СвЮлНеУч, СвИнНеУч
  //4 - Сведения о физическом лице // СвФл
  TOrganizationType = String;
  //1 - Сведения об индивидуальном предпринимателе// СвИП
  //2 - Сведения о юридическом лице, состоящем на учете в налоговых органах // СвЮЛУч
  //3 - Сведения о физическом лице // СвФл
  //4 - Сведения об иностранном лице, не состоящем на учете в налоговых органах // СвИнНеУч
  TOrganizationType_DatabaseOrder = String;
  TIncludeIdentificationNumbers = Int64;
type

  {  Forward declarations  }
  TUniversalTransferDocument = class;
  TMetaData = class;
  TSellers = class;
  TBuyers = class;
  TShippers = class;
  TShipper = class;
  TConsignees = class;
  TPaymentDocuments = class;
  TSellerInfoCircumPublicProc = class;
  TDocumentShipments = class;
  TCommitmentTypes = class;
  TCommitmentType = class;
  TAccompanyingDocuments = class;
  TInvoiceTable = class;
  TItem = class;
  TCustomsDeclarations = class;
  TCustomsDeclaration = class;
  TAdditionalInfos = class;
  TItemTracingInfos = class;
  TItemTracingInfo = class;
  TItemIdentificationNumbers = class;
  TItemIdentificationNumber = class;
  TAccompanyingDocuments = class;
  TDepreciationInfo = class;
  TStateSystemItemInfos = class;
  TStateSystemItemInfo = class;
  TTransferInfo = class;
  TTransferBases = class;
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
  TPaymentDocumentInfoUtd970 = class;
  TGroundInfo = class;
  TExtendedOrganizationInfo = class;
  TExtendedOrganizationInfo_ForeignAddress1000 = class;
  TExtendedOrganizationInfo_Torg2 = class;
  TExtendedOrganizationInfoWithHyphens = class;
  TExtendedOrganizationInfo_ReconciliationAct = class;
  TExtendedOrganizationDetails_ManualFilling_ReconciliationAct = class;
  TExtendedOrganizationInfoUtd970 = class;
  TExtendedOrganizationDetails_ManualFilling_Utd970 = class;
  TExtendedOrganizationDetails_ManualFilling = class;
  TExtendedOrganizationDetails_ForeignAddress1000 = class;
  TExtendedOrganizationDetails_ManualFilling_Torg2 = class;
  TExtendedOrganizationReference = class;
  TExtendedOrganizationDetails = class;
  TExtendedOrganizationDetails_Torg2 = class;
  TExtendedOrganizationDetails_ReconciliationAct = class;
  TExtendedOrganizationReference_ReconciliationAct = class;
  TExtendedOrganizationDetailsUtd970 = class;
  TExtendedOrganizationReferenceUtd970 = class;
  TPhones = class;
  TEmails = class;
  TExtendedOrganizationDetailsWithHyphens = class;
  TAddress = class;
  TAddress_ForeignAddress1000 = class;
  TAddressUtd970 = class;
  TRussianAddress = class;
  TRussianAddressUtd970 = class;
  TForeignAddress = class;
  TForeignAddressUtd970 = class;
  TForeignAddress1000 = class;
  TGarAddress = class;
  TBuildings = class;
  TAddressElement = class;
  TEmployee = class;
  TOtherIssuer = class;
  TEmployeeUtd970 = class;
  TOtherIssuerUtd970 = class;
  TDocumentRequisitesType = class;
  TIdentificationDetails = class;
  TSigners = class;
  TSigner = class;
  TPosition = class;
  TSignerAdditionalInfo = class;
  TCertificate = class;
  TPowerOfAttorney = class;
  TElectronic = class;
  TStorage = class;
  TFullId = class;
  TManual = class;
  TPaper = class;
  TFio = class;
  TWaybills = class;
  TWaybill = class;
  TTransferBase = class;
  TTransferBase820 = class;

  {  Generic classes for collections  }
  TUniversalTransferDocumentList = specialize GXMLSerializationObjectList<TUniversalTransferDocument>;
  TMetaDataList = specialize GXMLSerializationObjectList<TMetaData>;
  TSellersList = specialize GXMLSerializationObjectList<TSellers>;
  TBuyersList = specialize GXMLSerializationObjectList<TBuyers>;
  TShippersList = specialize GXMLSerializationObjectList<TShippers>;
  TShipperList = specialize GXMLSerializationObjectList<TShipper>;
  TConsigneesList = specialize GXMLSerializationObjectList<TConsignees>;
  TPaymentDocumentsList = specialize GXMLSerializationObjectList<TPaymentDocuments>;
  TSellerInfoCircumPublicProcList = specialize GXMLSerializationObjectList<TSellerInfoCircumPublicProc>;
  TDocumentShipmentsList = specialize GXMLSerializationObjectList<TDocumentShipments>;
  TCommitmentTypesList = specialize GXMLSerializationObjectList<TCommitmentTypes>;
  TCommitmentTypeList = specialize GXMLSerializationObjectList<TCommitmentType>;
  TAccompanyingDocumentsList = specialize GXMLSerializationObjectList<TAccompanyingDocuments>;
  TInvoiceTableList = specialize GXMLSerializationObjectList<TInvoiceTable>;
  TItemList = specialize GXMLSerializationObjectList<TItem>;
  TCustomsDeclarationsList = specialize GXMLSerializationObjectList<TCustomsDeclarations>;
  TCustomsDeclarationList = specialize GXMLSerializationObjectList<TCustomsDeclaration>;
  TAdditionalInfosList = specialize GXMLSerializationObjectList<TAdditionalInfos>;
  TItemTracingInfosList = specialize GXMLSerializationObjectList<TItemTracingInfos>;
  TItemTracingInfoList = specialize GXMLSerializationObjectList<TItemTracingInfo>;
  TItemIdentificationNumbersList = specialize GXMLSerializationObjectList<TItemIdentificationNumbers>;
  TItemIdentificationNumberList = specialize GXMLSerializationObjectList<TItemIdentificationNumber>;
  TAccompanyingDocumentsList = specialize GXMLSerializationObjectList<TAccompanyingDocuments>;
  TDepreciationInfoList = specialize GXMLSerializationObjectList<TDepreciationInfo>;
  TStateSystemItemInfosList = specialize GXMLSerializationObjectList<TStateSystemItemInfos>;
  TStateSystemItemInfoList = specialize GXMLSerializationObjectList<TStateSystemItemInfo>;
  TTransferInfoList = specialize GXMLSerializationObjectList<TTransferInfo>;
  TTransferBasesList = specialize GXMLSerializationObjectList<TTransferBases>;
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
  TPaymentDocumentInfoUtd970List = specialize GXMLSerializationObjectList<TPaymentDocumentInfoUtd970>;
  TGroundInfoList = specialize GXMLSerializationObjectList<TGroundInfo>;
  TExtendedOrganizationInfoList = specialize GXMLSerializationObjectList<TExtendedOrganizationInfo>;
  TExtendedOrganizationInfo_ForeignAddress1000List = specialize GXMLSerializationObjectList<TExtendedOrganizationInfo_ForeignAddress1000>;
  TExtendedOrganizationInfo_Torg2List = specialize GXMLSerializationObjectList<TExtendedOrganizationInfo_Torg2>;
  TExtendedOrganizationInfoWithHyphensList = specialize GXMLSerializationObjectList<TExtendedOrganizationInfoWithHyphens>;
  TExtendedOrganizationInfo_ReconciliationActList = specialize GXMLSerializationObjectList<TExtendedOrganizationInfo_ReconciliationAct>;
  TExtendedOrganizationDetails_ManualFilling_ReconciliationActList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_ManualFilling_ReconciliationAct>;
  TExtendedOrganizationInfoUtd970List = specialize GXMLSerializationObjectList<TExtendedOrganizationInfoUtd970>;
  TExtendedOrganizationDetails_ManualFilling_Utd970List = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_ManualFilling_Utd970>;
  TExtendedOrganizationDetails_ManualFillingList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_ManualFilling>;
  TExtendedOrganizationDetails_ForeignAddress1000List = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_ForeignAddress1000>;
  TExtendedOrganizationDetails_ManualFilling_Torg2List = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_ManualFilling_Torg2>;
  TExtendedOrganizationReferenceList = specialize GXMLSerializationObjectList<TExtendedOrganizationReference>;
  TExtendedOrganizationDetailsList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails>;
  TExtendedOrganizationDetails_Torg2List = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_Torg2>;
  TExtendedOrganizationDetails_ReconciliationActList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetails_ReconciliationAct>;
  TExtendedOrganizationReference_ReconciliationActList = specialize GXMLSerializationObjectList<TExtendedOrganizationReference_ReconciliationAct>;
  TExtendedOrganizationDetailsUtd970List = specialize GXMLSerializationObjectList<TExtendedOrganizationDetailsUtd970>;
  TExtendedOrganizationReferenceUtd970List = specialize GXMLSerializationObjectList<TExtendedOrganizationReferenceUtd970>;
  TPhonesList = specialize GXMLSerializationObjectList<TPhones>;
  TEmailsList = specialize GXMLSerializationObjectList<TEmails>;
  TExtendedOrganizationDetailsWithHyphensList = specialize GXMLSerializationObjectList<TExtendedOrganizationDetailsWithHyphens>;
  TAddressList = specialize GXMLSerializationObjectList<TAddress>;
  TAddress_ForeignAddress1000List = specialize GXMLSerializationObjectList<TAddress_ForeignAddress1000>;
  TAddressUtd970List = specialize GXMLSerializationObjectList<TAddressUtd970>;
  TRussianAddressList = specialize GXMLSerializationObjectList<TRussianAddress>;
  TRussianAddressUtd970List = specialize GXMLSerializationObjectList<TRussianAddressUtd970>;
  TForeignAddressList = specialize GXMLSerializationObjectList<TForeignAddress>;
  TForeignAddressUtd970List = specialize GXMLSerializationObjectList<TForeignAddressUtd970>;
  TForeignAddress1000List = specialize GXMLSerializationObjectList<TForeignAddress1000>;
  TGarAddressList = specialize GXMLSerializationObjectList<TGarAddress>;
  TBuildingsList = specialize GXMLSerializationObjectList<TBuildings>;
  TAddressElementList = specialize GXMLSerializationObjectList<TAddressElement>;
  TEmployeeList = specialize GXMLSerializationObjectList<TEmployee>;
  TOtherIssuerList = specialize GXMLSerializationObjectList<TOtherIssuer>;
  TEmployeeUtd970List = specialize GXMLSerializationObjectList<TEmployeeUtd970>;
  TOtherIssuerUtd970List = specialize GXMLSerializationObjectList<TOtherIssuerUtd970>;
  TDocumentRequisitesTypeList = specialize GXMLSerializationObjectList<TDocumentRequisitesType>;
  TIdentificationDetailsList = specialize GXMLSerializationObjectList<TIdentificationDetails>;
  TSignersList = specialize GXMLSerializationObjectList<TSigners>;
  TSignerList = specialize GXMLSerializationObjectList<TSigner>;
  TPositionList = specialize GXMLSerializationObjectList<TPosition>;
  TSignerAdditionalInfoList = specialize GXMLSerializationObjectList<TSignerAdditionalInfo>;
  TCertificateList = specialize GXMLSerializationObjectList<TCertificate>;
  TPowerOfAttorneyList = specialize GXMLSerializationObjectList<TPowerOfAttorney>;
  TElectronicList = specialize GXMLSerializationObjectList<TElectronic>;
  TStorageList = specialize GXMLSerializationObjectList<TStorage>;
  TFullIdList = specialize GXMLSerializationObjectList<TFullId>;
  TManualList = specialize GXMLSerializationObjectList<TManual>;
  TPaperList = specialize GXMLSerializationObjectList<TPaper>;
  TFioList = specialize GXMLSerializationObjectList<TFio>;
  TWaybillsList = specialize GXMLSerializationObjectList<TWaybills>;
  TWaybillList = specialize GXMLSerializationObjectList<TWaybill>;
  TTransferBaseList = specialize GXMLSerializationObjectList<TTransferBase>;
  TTransferBase820List = specialize GXMLSerializationObjectList<TTransferBase820>;

  {  TUniversalTransferDocument  }
  TUniversalTransferDocument = class(TXmlSerializationObject)
  private
    FMetaData:UniversalTransferDocument_MetaData;
    FSellers:UniversalTransferDocument_Sellers;
    FBuyers:UniversalTransferDocument_Buyers;
    FShippers:UniversalTransferDocument_Shippers;
    FConsignees:UniversalTransferDocument_Consignees;
    FSigners:TSigners;
    FPaymentDocuments:UniversalTransferDocument_PaymentDocuments;
    FAdditionalInfoId:TAdditionalInfoId;
    FTable:TInvoiceTable;
    FTransferInfo:TTransferInfo;
    FFactorInfo:TExtendedOrganizationInfoUtd970;
    FMainAssignMonetaryClaim:TDocumentRequisitesType;
    FSellerInfoCircumPublicProc:UniversalTransferDocument_SellerInfoCircumPublicProc;
    FDocumentShipments:UniversalTransferDocument_DocumentShipments;
    FDocumentCreatorBase:TDocumentRequisitesType;
    FCommitmentTypes:UniversalTransferDocument_CommitmentTypes;
    FAccompanyingDocuments:UniversalTransferDocument_AccompanyingDocuments;
    FFunction1:String;
    FUid:Tstring1000;
    FApprovedStructureAdditionalInfoFields:Tstring14f;
    FSenderFnsParticipantId:String;
    FRecipientFnsParticipantId:String;
    FDocumentName:Tstring255;
    FDocumentDate:Tdate1;
    FDocumentNumber:Tstring1000;
    FFileIdSeller:Tstring255;
    FFileIdBuyer:Tstring255;
    FCurrency:Tokv;
    FCurrencyRate:Double;
    FRevisionDate:Tdate1;
    FRevisionNumber:Int64;
    FDocumentCreator:Tstring1000;
    FGovernmentContractInfo:String;
    FCircumFormat:String;
    procedure SetFunction1( AValue:String);
    procedure SetUid( AValue:Tstring1000);
    procedure SetApprovedStructureAdditionalInfoFields( AValue:Tstring14f);
    procedure SetSenderFnsParticipantId( AValue:String);
    procedure SetRecipientFnsParticipantId( AValue:String);
    procedure SetDocumentName( AValue:Tstring255);
    procedure SetDocumentDate( AValue:Tdate1);
    procedure SetDocumentNumber( AValue:Tstring1000);
    procedure SetFileIdSeller( AValue:Tstring255);
    procedure SetFileIdBuyer( AValue:Tstring255);
    procedure SetCurrency( AValue:Tokv);
    procedure SetCurrencyRate( AValue:Double);
    procedure SetRevisionDate( AValue:Tdate1);
    procedure SetRevisionNumber( AValue:Int64);
    procedure SetDocumentCreator( AValue:Tstring1000);
    procedure SetGovernmentContractInfo( AValue:String);
    procedure SetCircumFormat( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
    function RootNodeName:string; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property MetaData:UniversalTransferDocument_MetaData read FMetaData;
    property Sellers:UniversalTransferDocument_Sellers read FSellers;
    property Buyers:UniversalTransferDocument_Buyers read FBuyers;
    property Shippers:UniversalTransferDocument_Shippers read FShippers;
    property Consignees:UniversalTransferDocument_Consignees read FConsignees;
    property Signers:TSigners read FSigners;
    property PaymentDocuments:UniversalTransferDocument_PaymentDocuments read FPaymentDocuments;
    //ИнфПолФХЖ1 - Информационное поле документа
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;
    property Table:TInvoiceTable read FTable;
    property TransferInfo:TTransferInfo read FTransferInfo;
    //СвФактор - Сведения о факторе
    property FactorInfo:TExtendedOrganizationInfoUtd970 read FFactorInfo;
    //ОснУстДенТреб - Основание уступки денежного требования
    property MainAssignMonetaryClaim:TDocumentRequisitesType read FMainAssignMonetaryClaim;
    //ИнфПродЗаГосКазн - Информация продавца об обстоятельствах закупок для
    //государственных и муниципальных нужд
    property SellerInfoCircumPublicProc:UniversalTransferDocument_SellerInfoCircumPublicProc read FSellerInfoCircumPublicProc;
    property DocumentShipments:UniversalTransferDocument_DocumentShipments read FDocumentShipments;
    //ОснДоверОргСост - Основание, по которому экономический субъект является
    //составителем файла обмена счета-фактуры
    property DocumentCreatorBase:TDocumentRequisitesType read FDocumentCreatorBase;
    property CommitmentTypes:UniversalTransferDocument_CommitmentTypes read FCommitmentTypes;
    property AccompanyingDocuments:UniversalTransferDocument_AccompanyingDocuments read FAccompanyingDocuments;
    //Функция - Функция документа
    property Function1:String read FFunction1 write SetFunction1;
    //УИД - Уникальный идентификатор документа
    property Uid:Tstring1000 read FUid write SetUid;
    //СоглСтрДопИнф - Информация о наличии согласованной структуры дополнительных
    //информационных полей
    property ApprovedStructureAdditionalInfoFields:Tstring14f read FApprovedStructureAdditionalInfoFields write SetApprovedStructureAdditionalInfoFields;
    //Идентификатор участника ЭДОЕсли не указан, то для формирования атрибута ИдФайл будет использован идентификатор первой организации, указанной в элементе Sellers
    property SenderFnsParticipantId:String read FSenderFnsParticipantId write SetSenderFnsParticipantId;
    //Идентификатор участника ЭДОЕсли не указан, то для формирования атрибута ИдФайл будет использован идентификатор первой организации, указанной в элементе Buyers
    property RecipientFnsParticipantId:String read FRecipientFnsParticipantId write SetRecipientFnsParticipantId;
    //НаимДокОпр - Наименование первичного документа, определенное организацией
    property DocumentName:Tstring255 read FDocumentName write SetDocumentName;
    //ДатаДок - дата УПД
    property DocumentDate:Tdate1 read FDocumentDate write SetDocumentDate;
    //НомерДок - номер УПД
    property DocumentNumber:Tstring1000 read FDocumentNumber write SetDocumentNumber;
    //ИмяФайлИспрПрод - Имя файла обмена (информации продавца) исправляемого документа
    property FileIdSeller:Tstring255 read FFileIdSeller write SetFileIdSeller;
    //ИмяФайлИспрПок - Имя файла обмена (информации покупателя) исправляемого
    //документа
    property FileIdBuyer:Tstring255 read FFileIdBuyer write SetFileIdBuyer;
    //КодОКВ - валюта (код)
    property Currency:Tokv read FCurrency write SetCurrency;
    //КурсВал - Курс валюты
    property CurrencyRate:Double read FCurrencyRate write SetCurrencyRate;
    //ДатаИспр - дата ИСФ
    property RevisionDate:Tdate1 read FRevisionDate write SetRevisionDate;
    //НомИспр - номер ИСФ
    property RevisionNumber:Int64 read FRevisionNumber write SetRevisionNumber;
    //НаимЭконСубСост - Наименование экономического субъекта – составителя файла обмена
    //счета-фактуры (информации продавца)
    property DocumentCreator:Tstring1000 read FDocumentCreator write SetDocumentCreator;
    //ИдГосКон
    property GovernmentContractInfo:String read FGovernmentContractInfo write SetGovernmentContractInfo;
    //СпОбстФСЧФ/СпОбстФСЧФДОП/СпОбстФДОП - Специальные обстоятельства формирования документа
    property CircumFormat:String read FCircumFormat write SetCircumFormat;
  end;

  {  TMetaData  }
  TMetaData = class(TXmlSerializationObject)
  private
    FIncludeIdentificationNumbers:TXSDInt64Array;
    procedure SetIncludeIdentificationNumbers( AValue:TXSDInt64Array);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Типы товаров, подлежащих маркировке (используется для корректного заполнения данных о маркировке в ИдФайл)0 - товары, подлежащие маркировке (значение по умолчанию)1 - алкогольная продукция, подлежащая маркировке2 - табачная продукция, сырье, никотинсодержащая продукция и никотиновое сырьеНа основании переданных типов будут сформированы соответствующие признаки в ИдФайл о наличии в документе товаров, подлежащих маркировке
    property IncludeIdentificationNumbers:TXSDInt64Array read FIncludeIdentificationNumbers write SetIncludeIdentificationNumbers;
  end;

  {  TSellers  }
  TSellers = class(TXmlSerializationObject)
  private
    FSeller:TExtendedOrganizationInfoUtd970List;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //СвПрод - сведения о продавце
    property Seller:TExtendedOrganizationInfoUtd970List read FSeller;
  end;

  {  TBuyers  }
  TBuyers = class(TXmlSerializationObject)
  private
    FBuyer:TExtendedOrganizationInfoUtd970List;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //СвПокуп - сведения о покупателе
    property Buyer:TExtendedOrganizationInfoUtd970List read FBuyer;
  end;

  {  TShippers  }
  TShippers = class(TXmlSerializationObject)
  private
    FShipper:TXSDShippers_ShipperArray;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ГрузОт - грузоотправитель
    property Shipper:TXSDShippers_ShipperArray read FShipper;
  end;

  {  TShipper  }
  TShipper = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TExtendedOrganizationDetailsUtd970;
    FOrganizationReference:TExtendedOrganizationReferenceUtd970;
    FSameAsSeller:String;
    procedure SetSameAsSeller( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetailsUtd970 read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReferenceUtd970 read FOrganizationReference;
    //ОнЖе - совпадает с продавцом
    property SameAsSeller:String read FSameAsSeller write SetSameAsSeller;
  end;

  {  TConsignees  }
  TConsignees = class(TXmlSerializationObject)
  private
    FConsignee:TExtendedOrganizationInfoUtd970List;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ГрузПолуч - грузополучатель
    property Consignee:TExtendedOrganizationInfoUtd970List read FConsignee;
  end;

  {  TPaymentDocuments  }
  TPaymentDocuments = class(TXmlSerializationObject)
  private
    FDocument:TPaymentDocumentInfoUtd970List;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //СвПРД - платежно-расчетные документы
    property Document:TPaymentDocumentInfoUtd970List read FDocument;
  end;

  {  TSellerInfoCircumPublicProc  }
  TSellerInfoCircumPublicProc = class(TXmlSerializationObject)
  private
    FDateStateContract:Tdate1;
    FNumberStateContract:Tstring100;
    FPersonalAccountSeller:Tstring11f;
    FSellerBudjetClassCode:Tstring20f;
    FSellerTargetCode:Tstring20f;
    FSellerTreasuryCode:Tstring4;
    FSellerTreasuryName:Tstring2000;
    procedure SetDateStateContract( AValue:Tdate1);
    procedure SetNumberStateContract( AValue:Tstring100);
    procedure SetPersonalAccountSeller( AValue:Tstring11f);
    procedure SetSellerBudjetClassCode( AValue:Tstring20f);
    procedure SetSellerTargetCode( AValue:Tstring20f);
    procedure SetSellerTreasuryCode( AValue:Tstring4);
    procedure SetSellerTreasuryName( AValue:Tstring2000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ДатаГосКонт - Дата государственного контракта
    property DateStateContract:Tdate1 read FDateStateContract write SetDateStateContract;
    //НомерГосКонт - Номер государственного контракта
    property NumberStateContract:Tstring100 read FNumberStateContract write SetNumberStateContract;
    //ЛицСчетПрод - Номер лицевого счета продавца
    property PersonalAccountSeller:Tstring11f read FPersonalAccountSeller write SetPersonalAccountSeller;
    //КодПродБюджКласс - Код бюджетной классификации продавца
    property SellerBudjetClassCode:Tstring20f read FSellerBudjetClassCode write SetSellerBudjetClassCode;
    //КодЦелиПрод - Код цели продавца
    property SellerTargetCode:Tstring20f read FSellerTargetCode write SetSellerTargetCode;
    //КодКазначПрод - Код территориального органа Федерального казначейства
    //продавца
    property SellerTreasuryCode:Tstring4 read FSellerTreasuryCode write SetSellerTreasuryCode;
    //НаимКазначПрод - Наименование территориального органа Федерального
    //казначейства продавца
    property SellerTreasuryName:Tstring2000 read FSellerTreasuryName write SetSellerTreasuryName;
  end;

  {  TDocumentShipments  }
  TDocumentShipments = class(TXmlSerializationObject)
  private
    FDocumentShipment:TDocumentRequisitesTypeList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ДокПодтвОтгрНом - Реквизиты документа, подтверждающего отгрузку
    //товаров
    property DocumentShipment:TDocumentRequisitesTypeList read FDocumentShipment;
  end;

  {  TCommitmentTypes  }
  TCommitmentTypes = class(TXmlSerializationObject)
  private
    FCommitmentType:TXSDCommitmentTypes_CommitmentTypeArray;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ВидОбяз - Вид обязательств
    property CommitmentType:TXSDCommitmentTypes_CommitmentTypeArray read FCommitmentType;
  end;

  {  TCommitmentType  }
  TCommitmentType = class(TXmlSerializationObject)
  private
    FCommitmentTypeCode:Tstring255;
    FCommitmentTypeName:Tstring255;
    procedure SetCommitmentTypeCode( AValue:Tstring255);
    procedure SetCommitmentTypeName( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //КодВидОбяз - Код вида обязательств
    property CommitmentTypeCode:Tstring255 read FCommitmentTypeCode write SetCommitmentTypeCode;
    //НаимВидОбяз - Наименование вида обязательств
    property CommitmentTypeName:Tstring255 read FCommitmentTypeName write SetCommitmentTypeName;
  end;

  {  TAccompanyingDocuments  }
  TAccompanyingDocuments = class(TXmlSerializationObject)
  private
    FAccompanyingDocument:TDocumentRequisitesTypeList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //СопрДокФХЖ - Сведения о сопроводительных документах, уточняющих
    //обстоятельства факт хозяйственной жизни
    property AccompanyingDocument:TDocumentRequisitesTypeList read FAccompanyingDocument;
  end;

  {  TInvoiceTable  }
  //ТаблСчФакт - Сведения таблицы счет фактуры
  TInvoiceTable = class(TXmlSerializationObject)
  private
    FItem:TXSDInvoiceTable_ItemArray;
    FTotalWithVatExcluded:Double;
    FVat:Double;
    FWithoutVat:String;
    FTotal:Double;
    FTotalNet:Double;
    procedure SetTotalWithVatExcluded( AValue:Double);
    procedure SetVat( AValue:Double);
    procedure SetWithoutVat( AValue:String);
    procedure SetTotal( AValue:Double);
    procedure SetTotalNet( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //СведТов - информация о товарах
    property Item:TXSDInvoiceTable_ItemArray read FItem;
    //СтТовБезНДСВсего - Сумма без учета налога
    property TotalWithVatExcluded:Double read FTotalWithVatExcluded write SetTotalWithVatExcluded;
    //СумНалВсего - Сумма налога всего
    property Vat:Double read FVat write SetVat;
    //Без НДС. Указывается, если для суммы налога всего не требуется НДС
    property WithoutVat:String read FWithoutVat write SetWithoutVat;
    //СтТовУчНалВсего - Сумма всего
    property Total:Double read FTotal write SetTotal;
    //КолНеттоВс - Количество (масса нетто/количество) - всего по документу
    property TotalNet:Double read FTotalNet write SetTotalNet;
  end;

  {  TItem  }
  TItem = class(TXmlSerializationObject)
  private
    FCustomsDeclarations:Item_CustomsDeclarations;
    FAdditionalInfos:Item_AdditionalInfos;
    FItemTracingInfos:Item_ItemTracingInfos;
    FItemIdentificationNumbers:Item_ItemIdentificationNumbers;
    FAccompanyingDocuments:Item_AccompanyingDocuments;
    FDepreciationInfo:Item_DepreciationInfo;
    FStateSystemItemInfos:Item_StateSystemItemInfos;
    FProduct:Tstring2000;
    FUnit1:Tokei;
    FUnitName:Tstring255;
    FQuantity:Double;
    FPrice:Double;
    FExcise:Double;
    FTaxRate:TTaxRateUtd970;
    FSubtotalWithVatExcluded:Double;
    FVat:Double;
    FWithoutVat:String;
    FRestoredVat:Double;
    FWithoutRestoredVat:String;
    FSubtotal:Double;
    FItemMark:Int64;
    FAdditionalProperty:Tstring4;
    FItemVendorCode:Tstring100;
    FItemToRelease:Double;
    FItemCharact:Tstring1000;
    FItemArticle:Tstring50;
    FItemKind:Tstring10;
    FItemSeries:Tstring50;
    FGtin:Tstring14f;
    FCatalogCode:Tstring27f;
    FItemTypeCode:Tstring10;
    FProductTypeCode:Int64;
    FOkpd:Tokpd;
    FItemAdditionalInfo:Tstring5f;
    procedure SetProduct( AValue:Tstring2000);
    procedure SetUnit1( AValue:Tokei);
    procedure SetUnitName( AValue:Tstring255);
    procedure SetQuantity( AValue:Double);
    procedure SetPrice( AValue:Double);
    procedure SetExcise( AValue:Double);
    procedure SetTaxRate( AValue:TTaxRateUtd970);
    procedure SetSubtotalWithVatExcluded( AValue:Double);
    procedure SetVat( AValue:Double);
    procedure SetWithoutVat( AValue:String);
    procedure SetRestoredVat( AValue:Double);
    procedure SetWithoutRestoredVat( AValue:String);
    procedure SetSubtotal( AValue:Double);
    procedure SetItemMark( AValue:Int64);
    procedure SetAdditionalProperty( AValue:Tstring4);
    procedure SetItemVendorCode( AValue:Tstring100);
    procedure SetItemToRelease( AValue:Double);
    procedure SetItemCharact( AValue:Tstring1000);
    procedure SetItemArticle( AValue:Tstring50);
    procedure SetItemKind( AValue:Tstring10);
    procedure SetItemSeries( AValue:Tstring50);
    procedure SetGtin( AValue:Tstring14f);
    procedure SetCatalogCode( AValue:Tstring27f);
    procedure SetItemTypeCode( AValue:Tstring10);
    procedure SetProductTypeCode( AValue:Int64);
    procedure SetOkpd( AValue:Tokpd);
    procedure SetItemAdditionalInfo( AValue:Tstring5f);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property CustomsDeclarations:Item_CustomsDeclarations read FCustomsDeclarations;
    property AdditionalInfos:Item_AdditionalInfos read FAdditionalInfos;
    property ItemTracingInfos:Item_ItemTracingInfos read FItemTracingInfos;
    property ItemIdentificationNumbers:Item_ItemIdentificationNumbers read FItemIdentificationNumbers;
    property AccompanyingDocuments:Item_AccompanyingDocuments read FAccompanyingDocuments;
    property DepreciationInfo:Item_DepreciationInfo read FDepreciationInfo;
    property StateSystemItemInfos:Item_StateSystemItemInfos read FStateSystemItemInfos;
    //НаимТов - наименование товара
    property Product:Tstring2000 read FProduct write SetProduct;
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
    property TaxRate:TTaxRateUtd970 read FTaxRate write SetTaxRate;
    //СтТовБезНДС - Стоимость товаров (работ, услуг), имущественных прав без
    //налога - всего (графа 5 счета-фактуры)
    property SubtotalWithVatExcluded:Double read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;
    //СумНал - сумма налога
    property Vat:Double read FVat write SetVat;
    //Без НДС. Указывается, если для товара не требуется НДС
    property WithoutVat:String read FWithoutVat write SetWithoutVat;
    //СумНалВосст - Сумма налога, восстановленного при передаче имущества, нематериальных активов и имущественных прав в качестве вклада в уставный капитал
    property RestoredVat:Double read FRestoredVat write SetRestoredVat;
    //Без НДС. Указывается, если для товара не требуется НДС
    property WithoutRestoredVat:String read FWithoutRestoredVat write SetWithoutRestoredVat;
    //СтТовУчНал - сумма всего
    property Subtotal:Double read FSubtotal write SetSubtotal;
    //ПрТовРаб - Признак товар-работа-услуга
    //1 - имущество;
    //2 - работа;
    //3 - услуга;
    //4 – имущественные права;
    //5 - иное
    property ItemMark:Int64 read FItemMark write SetItemMark;
    //ДопПризн - Дополнительная информация о признаке
    property AdditionalProperty:Tstring4 read FAdditionalProperty write SetAdditionalProperty;
    //КодТов - Код товара (в том числе графа 1а счета-фактуры)
    property ItemVendorCode:Tstring100 read FItemVendorCode write SetItemVendorCode;
    //НадлОтп - Количество надлежит отпустить
    property ItemToRelease:Double read FItemToRelease write SetItemToRelease;
    //ХарактерТов - Характеристика/описание товара
    property ItemCharact:Tstring1000 read FItemCharact write SetItemCharact;
    //АртикулТов - Артикул товара
    property ItemArticle:Tstring50 read FItemArticle write SetItemArticle;
    //СортТов - Сорт товара
    property ItemKind:Tstring10 read FItemKind write SetItemKind;
    //СерияТов - Серия товара
    property ItemSeries:Tstring50 read FItemSeries write SetItemSeries;
    //ГТИН - Глобальный идентификационный номер товарной продукции
    property Gtin:Tstring14f read FGtin write SetGtin;
    //КодКат - Код каталога
    property CatalogCode:Tstring27f read FCatalogCode write SetCatalogCode;
    //КодВидТов - Код вида товара
    property ItemTypeCode:Tstring10 read FItemTypeCode write SetItemTypeCode;
    //КодВидПр - Код вида продукции
    property ProductTypeCode:Int64 read FProductTypeCode write SetProductTypeCode;
    //КодТовОКДП2 - Код товара по ОКДП 2
    property Okpd:Tokpd read FOkpd write SetOkpd;
    //ДопИнфПВидО - Дополнительная информация к продукции по видам операций
    property ItemAdditionalInfo:Tstring5f read FItemAdditionalInfo write SetItemAdditionalInfo;
  end;

  {  TCustomsDeclarations  }
  TCustomsDeclarations = class(TXmlSerializationObject)
  private
    FCustomsDeclaration:TXSDCustomsDeclarations_CustomsDeclarationArray;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //СвДТ - Сведения о декларации на товары
    property CustomsDeclaration:TXSDCustomsDeclarations_CustomsDeclarationArray read FCustomsDeclaration;
  end;

  {  TCustomsDeclaration  }
  TCustomsDeclaration = class(TXmlSerializationObject)
  private
    FCountry:String;
    FDeclarationNumber:Tstring1000;
    procedure SetCountry( AValue:String);
    procedure SetDeclarationNumber( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //КодПроисх - Код страны происхождения товара по Общероссийскому
    //классификатору стран мира (ОКСМ) или
    //980 - Евросоюз,
    //981 - ЕАЭС
    property Country:String read FCountry write SetCountry;
    //НомерДТ - Регистрационный номер декларации на
    //товары (графа 11 счета-фактуры)
    property DeclarationNumber:Tstring1000 read FDeclarationNumber write SetDeclarationNumber;
  end;

  {  TAdditionalInfos  }
  TAdditionalInfos = class(TXmlSerializationObject)
  private
    FAdditionalInfo:TAdditionalInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Информационное поле факта хозяйственной жизни 1
    property AdditionalInfo:TAdditionalInfoList read FAdditionalInfo;
  end;

  {  TItemTracingInfos  }
  TItemTracingInfos = class(TXmlSerializationObject)
  private
    FItemTracingInfo:TXSDItemTracingInfos_ItemTracingInfoArray;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //СведПрослеж - Сведения о товаре, подлежащем
    //прослеживаемости
    property ItemTracingInfo:TXSDItemTracingInfos_ItemTracingInfoArray read FItemTracingInfo;
  end;

  {  TItemTracingInfo  }
  TItemTracingInfo = class(TXmlSerializationObject)
  private
    FRegNumberUnit:String;
    FUnit1:Tokei;
    FQuantity:Double;
    FPriceWithVatExcluded:Int64;
    FItemAddInfo:Tstring255;
    procedure SetRegNumberUnit( AValue:String);
    procedure SetUnit1( AValue:Tokei);
    procedure SetQuantity( AValue:Double);
    procedure SetPriceWithVatExcluded( AValue:Int64);
    procedure SetItemAddInfo( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //НомТовПрослеж - Регистрационный номер партии товаров (графа 11 счета-фактуры)
    property RegNumberUnit:String read FRegNumberUnit write SetRegNumberUnit;
    //ЕдИзмПрослеж - Единица количественного учета
    //товара, используемая в целях осуществления прослеживаемости
    property Unit1:Tokei read FUnit1 write SetUnit1;
    //КолВЕдПрослеж - Количество товара в единицах
    //измерения прослеживаемого товара
    property Quantity:Double read FQuantity write SetQuantity;
    //СтТовБезНДСПрослеж - Стоимость товара, подлежащего
    //прослеживаемости, без налога на добавленную стоимость, в рублях
    //(графа 14 счета-фактуры)
    property PriceWithVatExcluded:Int64 read FPriceWithVatExcluded write SetPriceWithVatExcluded;
    //ДопИнфПрослеж - Дополнительный показатель для
    //идентификации товаров, подлежащих прослеживаемости
    property ItemAddInfo:Tstring255 read FItemAddInfo write SetItemAddInfo;
  end;

  {  TItemIdentificationNumbers  }
  TItemIdentificationNumbers = class(TXmlSerializationObject)
  private
    FItemIdentificationNumber:TXSDItemIdentificationNumbers_ItemIdentificationNumberArray;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //НомСредИдентТов - Номер средств идентификации товаров
    property ItemIdentificationNumber:TXSDItemIdentificationNumbers_ItemIdentificationNumberArray read FItemIdentificationNumber;
  end;

  {  TItemIdentificationNumber  }
  TItemIdentificationNumber = class(TXmlSerializationObject)
  private
    FUnit1:Tstring255;
    FPackageId:Tstring255;
    FTransPackageId:Tstring255;
    FQuantityMark:Int64;
    FBatchMarkCode:Tstring55;
    procedure SetUnit1( AValue:Tstring255);
    procedure SetPackageId( AValue:Tstring255);
    procedure SetTransPackageId( AValue:Tstring255);
    procedure SetQuantityMark( AValue:Int64);
    procedure SetBatchMarkCode( AValue:Tstring55);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //КИЗ - Контрольный идентификационный знак
    property Unit1:Tstring255 read FUnit1 write SetUnit1;
    //НомУпак - Уникальный идентификатор вторичной
    //(потребительской)/третичной (заводской, транспортной)
    //упаковки
    property PackageId:Tstring255 read FPackageId write SetPackageId;
    //ИдентТрансУпак - Уникальный идентификатор
    //транспортной упаковки
    property TransPackageId:Tstring255 read FTransPackageId write SetTransPackageId;
    //КолВедМарк - Количество товара в единицах
    //измерения маркированного товара средствами идентификации
    property QuantityMark:Int64 read FQuantityMark write SetQuantityMark;
    //ПрПартМарк - Производственная партия (КОД)
    property BatchMarkCode:Tstring55 read FBatchMarkCode write SetBatchMarkCode;
  end;

  {  TAccompanyingDocuments  }
  TAccompanyingDocuments = class(TXmlSerializationObject)
  private
    FAccompanyingDocument:TDocumentRequisitesTypeList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //СопрДокТов - Сведения о сопроводительных документах по
    //товару (работам, услугам и имущественным правам)
    property AccompanyingDocument:TDocumentRequisitesTypeList read FAccompanyingDocument;
  end;

  {  TDepreciationInfo  }
  TDepreciationInfo = class(TXmlSerializationObject)
  private
    FDepreciationGroup:Tstring2;
    FOkof:Tstring16;
    FUsefulPeriod:Tstring3;
    FActualPeriod:Int64;
    procedure SetDepreciationGroup( AValue:Tstring2);
    procedure SetOkof( AValue:Tstring16);
    procedure SetUsefulPeriod( AValue:Tstring3);
    procedure SetActualPeriod( AValue:Int64);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //АмГруппа - Амортизационная группа
    property DepreciationGroup:Tstring2 read FDepreciationGroup write SetDepreciationGroup;
    //КодОКОФ - Код вида основных фондов
    property Okof:Tstring16 read FOkof write SetOkof;
    //СрПолИспОС - Установленный продавцом (передающей стороной)
    //срок полезного использования, бывшего в употреблении основного средства
    property UsefulPeriod:Tstring3 read FUsefulPeriod write SetUsefulPeriod;
    //ФактСрокИсп - Фактический срок полезного использования
    //продавцом (передающей стороной) бывшего в употреблении объекта основных
    //средств
    property ActualPeriod:Int64 read FActualPeriod write SetActualPeriod;
  end;

  {  TStateSystemItemInfos  }
  TStateSystemItemInfos = class(TXmlSerializationObject)
  private
    FStateSystemItemInfo:TXSDStateSystemItemInfos_StateSystemItemInfoArray;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //СвГосСист - Дополнительные сведения о товаре, подлежащем
    //идентификации и учету в государственной информационной системе
    property StateSystemItemInfo:TXSDStateSystemItemInfos_StateSystemItemInfoArray read FStateSystemItemInfo;
  end;

  {  TStateSystemItemInfo  }
  TStateSystemItemInfo = class(TXmlSerializationObject)
  private
    FStateSystemId:TXSDStringArray;
    FStateSystemName:Tstring255;
    FAccountingUnit:Tstring255;
    FOtherInfo:Tstring1000;
    procedure SetStateSystemId( AValue:TXSDStringArray);
    procedure SetStateSystemName( AValue:Tstring255);
    procedure SetAccountingUnit( AValue:Tstring255);
    procedure SetOtherInfo( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ИдНомУчетЕд - Идентификационный номер учетной
    //единицы в государственной информационной системе
    property StateSystemId:TXSDStringArray read FStateSystemId write SetStateSystemId;
    //НаимГосСист - Наименование государственной
    //информационной системы
    property StateSystemName:Tstring255 read FStateSystemName write SetStateSystemName;
    //УчетЕд - Учетная единица в государственной
    //информационной системе
    property AccountingUnit:Tstring255 read FAccountingUnit write SetAccountingUnit;
    //ИнаяИнф - Иная информация о товаре, подлежащем
    //учету в государственной информационной системе
    property OtherInfo:Tstring1000 read FOtherInfo write SetOtherInfo;
  end;

  {  TTransferInfo  }
  TTransferInfo = class(TXmlSerializationObject)
  private
    FTransferBases:TransferInfo_TransferBases;
    FAdditionalInfoId:TAdditionalInfoId;
    FEmployee:TEmployeeUtd970;
    FOtherIssuer:TOtherIssuerUtd970;
    FCreatedThingTransferDocument:TDocumentRequisitesType;
    FOperationInfo:Tstring255;
    FOperationType:Tstring255;
    FTransferDate:Tdate1;
    FTransferStartDate:Tdate1;
    FTransferEndDate:Tdate1;
    FTransferTextInfo:Tstring1000;
    FInkoterms:Tstring3f;
    FVersionInkoterms:Tstring4f;
    FCreatedThingTransferDate:Tdate1;
    FCreatedThingInfo:Tstring1000;
    procedure SetOperationInfo( AValue:Tstring255);
    procedure SetOperationType( AValue:Tstring255);
    procedure SetTransferDate( AValue:Tdate1);
    procedure SetTransferStartDate( AValue:Tdate1);
    procedure SetTransferEndDate( AValue:Tdate1);
    procedure SetTransferTextInfo( AValue:Tstring1000);
    procedure SetInkoterms( AValue:Tstring3f);
    procedure SetVersionInkoterms( AValue:Tstring4f);
    procedure SetCreatedThingTransferDate( AValue:Tdate1);
    procedure SetCreatedThingInfo( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property TransferBases:TransferInfo_TransferBases read FTransferBases;
    //ИнфПолФХЖ3 - Информационное поле документа
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;
    //РабОргПрод - Работник организации продавца
    property Employee:TEmployeeUtd970 read FEmployee;
    //ИнЛицо - Иное лицо
    property OtherIssuer:TOtherIssuerUtd970 read FOtherIssuer;
    //ДокПерВещ - Документ, подтверждающий передачу
    property CreatedThingTransferDocument:TDocumentRequisitesType read FCreatedThingTransferDocument;
    //СодОпер - Содержание операции
    property OperationInfo:Tstring255 read FOperationInfo write SetOperationInfo;
    //ВидОпер - Вид операции
    property OperationType:Tstring255 read FOperationType write SetOperationType;
    //ДатаПер - Дата отгрузки
    property TransferDate:Tdate1 read FTransferDate write SetTransferDate;
    //ДатаНачПер - Дата начала периода оказания услуг (выполнения работ, поставки товаров)
    property TransferStartDate:Tdate1 read FTransferStartDate write SetTransferStartDate;
    //ДатаОконПер - Дата окончания периода оказания услуг (выполнения работ, поставки
    //товаров)
    property TransferEndDate:Tdate1 read FTransferEndDate write SetTransferEndDate;
    //СвТран- Сведения о транспортировке
    property TransferTextInfo:Tstring1000 read FTransferTextInfo write SetTransferTextInfo;
    //Инкотермс - Значение в соответствии с международными правилами толкования торговых
    //терминов (далее – международные правила)
    property Inkoterms:Tstring3f read FInkoterms write SetInkoterms;
    //ВерИнкотермс - Версия международных правил
    property VersionInkoterms:Tstring4f read FVersionInkoterms write SetVersionInkoterms;
    //ДатаПерВещ - Дата передачи вещи, изготовленной по договору
    property CreatedThingTransferDate:Tdate1 read FCreatedThingTransferDate write SetCreatedThingTransferDate;
    //СвПерВещ - Сведения о передаче
    property CreatedThingInfo:Tstring1000 read FCreatedThingInfo write SetCreatedThingInfo;
  end;

  {  TTransferBases  }
  TTransferBases = class(TXmlSerializationObject)
  private
    FTransferBase:TDocumentRequisitesTypeList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ОснПер - Основание отгрузки
    property TransferBase:TDocumentRequisitesTypeList read FTransferBase;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
    destructor Destroy; override;
  published
    //ДатаПРД - Дата составления платежно-расчетного документа
    property Date:Tdate1 read FDate write SetDate;
    //НомерПРД - Номер платежно-расчетного документа
    property Number:Tstring30 read FNumber write SetNumber;
    //СуммаПРД - Сумма платежно-расчетного документа
    property Total:Double read FTotal write SetTotal;
  end;

  {  TPaymentDocumentInfoUtd970  }
  TPaymentDocumentInfoUtd970 = class(TXmlSerializationObject)
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetails_Torg2 read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference read FOrganizationReference;
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
    constructor Create; override;
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetailsWithHyphens read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference read FOrganizationReference;
  end;

  {  TExtendedOrganizationInfo_ReconciliationAct  }
  TExtendedOrganizationInfo_ReconciliationAct = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TExtendedOrganizationDetails_ReconciliationAct;
    FOrganizationReference:TExtendedOrganizationReference_ReconciliationAct;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetails_ReconciliationAct read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference_ReconciliationAct read FOrganizationReference;
  end;

  {  TExtendedOrganizationDetails_ManualFilling_ReconciliationAct  }
  TExtendedOrganizationDetails_ManualFilling_ReconciliationAct = class(TXmlSerializationObject)
  private
    FOkpo:Tstring10;
    FShortOrgName:Tstring255;
    FDepartment:Tstring1000;
    FLegalEntityId:Tstring255;
    FOrganizationOrPersonInfo:Tstring255;
    FOrganizationAdditionalInfo:Tstring255;
    FPhone:Tstring255;
    FEmail:Tstring255;
    FOtherContactInfo:Tstring255;
    procedure SetOkpo( AValue:Tstring10);
    procedure SetShortOrgName( AValue:Tstring255);
    procedure SetDepartment( AValue:Tstring1000);
    procedure SetLegalEntityId( AValue:Tstring255);
    procedure SetOrganizationOrPersonInfo( AValue:Tstring255);
    procedure SetOrganizationAdditionalInfo( AValue:Tstring255);
    procedure SetPhone( AValue:Tstring255);
    procedure SetEmail( AValue:Tstring255);
    procedure SetOtherContactInfo( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ОКПО - Код в общероссийском классификаторе предприятий и организаций
    property Okpo:Tstring10 read FOkpo write SetOkpo;
    //КраткНазв - Краткое название
    property ShortOrgName:Tstring255 read FShortOrgName write SetShortOrgName;
    //СтруктПодр - Структурное подразделение
    property Department:Tstring1000 read FDepartment write SetDepartment;
    //Идентиф - Идентификатор иностранной организации
    property LegalEntityId:Tstring255 read FLegalEntityId write SetLegalEntityId;
    //ИныеСвед - Иные сведения, идентифицирующие ФЛ или ЮЛ
    property OrganizationOrPersonInfo:Tstring255 read FOrganizationOrPersonInfo write SetOrganizationOrPersonInfo;
    //ИнфДляУчаст - Информация для участника
    property OrganizationAdditionalInfo:Tstring255 read FOrganizationAdditionalInfo write SetOrganizationAdditionalInfo;
    //Тлф - Номер контактного телефона/факс
    property Phone:Tstring255 read FPhone write SetPhone;
    //ЭлПочта - Адрес электронной почты
    property Email:Tstring255 read FEmail write SetEmail;
    //ИнКонт - Иные контактные данные
    property OtherContactInfo:Tstring255 read FOtherContactInfo write SetOtherContactInfo;
  end;

  {  TExtendedOrganizationInfoUtd970  }
  TExtendedOrganizationInfoUtd970 = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TExtendedOrganizationDetailsUtd970;
    FOrganizationReference:TExtendedOrganizationReferenceUtd970;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetailsUtd970 read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReferenceUtd970 read FOrganizationReference;
  end;

  {  TExtendedOrganizationDetails_ManualFilling_Utd970  }
  TExtendedOrganizationDetails_ManualFilling_Utd970 = class(TXmlSerializationObject)
  private
    FPhones:ExtendedOrganizationDetails_ManualFilling_Utd970_Phones;
    FEmails:ExtendedOrganizationDetails_ManualFilling_Utd970_Emails;
    FOkpo:Tstring10;
    FOkopf:String;
    FFullNameOkopf:String;
    FDepartment:Tstring500;
    FOrganizationAdditionalInfo:Tstring255;
    FShortOrgName:Tstring510;
    FOgrn:Togrn;
    FOgrnDate:Tdate1;
    FIndividualEntityRegistrationCertificate:Tstring100;
    FPersonStatusId:String;
    FOtherContactInfo:Tstring255;
    FCorrespondentAccount:Tstring20;
    FBankAccountNumber:Tstring20;
    FBankName:Tstring1000;
    FBankId:Tstring9f;
    procedure SetOkpo( AValue:Tstring10);
    procedure SetOkopf( AValue:String);
    procedure SetFullNameOkopf( AValue:String);
    procedure SetDepartment( AValue:Tstring500);
    procedure SetOrganizationAdditionalInfo( AValue:Tstring255);
    procedure SetShortOrgName( AValue:Tstring510);
    procedure SetOgrn( AValue:Togrn);
    procedure SetOgrnDate( AValue:Tdate1);
    procedure SetIndividualEntityRegistrationCertificate( AValue:Tstring100);
    procedure SetPersonStatusId( AValue:String);
    procedure SetOtherContactInfo( AValue:Tstring255);
    procedure SetCorrespondentAccount( AValue:Tstring20);
    procedure SetBankAccountNumber( AValue:Tstring20);
    procedure SetBankName( AValue:Tstring1000);
    procedure SetBankId( AValue:Tstring9f);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Phones:ExtendedOrganizationDetails_ManualFilling_Utd970_Phones read FPhones;
    property Emails:ExtendedOrganizationDetails_ManualFilling_Utd970_Emails read FEmails;
    //ОКПО - Код в общероссийском классификаторе предприятий и организаций
    property Okpo:Tstring10 read FOkpo write SetOkpo;
    //КодОПФ - Код по Общероссийскому классификатору организационно-правовых форм об организационно-правовой форме
    property Okopf:String read FOkopf write SetOkopf;
    //ПолнНаимОПФ - Полное наименование организационно-правовой формы
    property FullNameOkopf:String read FFullNameOkopf write SetFullNameOkopf;
    //СтруктПодр - Структурное подразделение
    property Department:Tstring500 read FDepartment write SetDepartment;
    //ИнфДляУчаст - Информация для участника
    property OrganizationAdditionalInfo:Tstring255 read FOrganizationAdditionalInfo write SetOrganizationAdditionalInfo;
    //СокрНаим - Сокращенное наименование
    property ShortOrgName:Tstring510 read FShortOrgName write SetShortOrgName;
    //ОГРН - ОГРНИП
    property Ogrn:Togrn read FOgrn write SetOgrn;
    //ДатаОГРНИП - Дата присвоения основного государственного регистрационного номера индивидуального предпринимателя
    property OgrnDate:Tdate1 read FOgrnDate write SetOgrnDate;
    //СвГосРегИп - Реквизиты свидетельства о государственной регистрации ИП
    property IndividualEntityRegistrationCertificate:Tstring100 read FIndividualEntityRegistrationCertificate write SetIndividualEntityRegistrationCertificate;
    //ИдСтатЛ - Идентификация статуса лица
    //0 - лицо, являющееся покупателем при розничной продаже
    //1 - иное
    property PersonStatusId:String read FPersonStatusId write SetPersonStatusId;
    //ИнКонт - Иные контактные данные
    property OtherContactInfo:Tstring255 read FOtherContactInfo write SetOtherContactInfo;
    //КорСчет - Корреспондентский счёт
    property CorrespondentAccount:Tstring20 read FCorrespondentAccount write SetCorrespondentAccount;
    //НомерСчета - номер банковского счета
    property BankAccountNumber:Tstring20 read FBankAccountNumber write SetBankAccountNumber;
    //НаимБанк - название банка
    property BankName:Tstring1000 read FBankName write SetBankName;
    //БИК
    property BankId:Tstring9f read FBankId write SetBankId;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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

  {  TExtendedOrganizationDetails_ReconciliationAct  }
  TExtendedOrganizationDetails_ReconciliationAct = class(TExtendedOrganizationDetails_ManualFilling_ReconciliationAct)
  private
    FOrgName:Tstring1000;
    FInn:Tstring60;
    FKpp:Tstring1000;
    FFnsParticipantId:Tstring1000;
    FOrgType:TOrganizationType_DatabaseOrder;
    FOgrn:String;
    procedure SetOrgName( AValue:Tstring1000);
    procedure SetInn( AValue:Tstring60);
    procedure SetKpp( AValue:Tstring1000);
    procedure SetFnsParticipantId( AValue:Tstring1000);
    procedure SetOrgType( AValue:TOrganizationType_DatabaseOrder);
    procedure SetOgrn( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //НаимОрг - название организации
    property OrgName:Tstring1000 read FOrgName write SetOrgName;
    //ИННЮЛ - ИННФЛ
    property Inn:Tstring60 read FInn write SetInn;
    //КПП
    property Kpp:Tstring1000 read FKpp write SetKpp;
    //Идентификатор участника ЭДО
    property FnsParticipantId:Tstring1000 read FFnsParticipantId write SetFnsParticipantId;
    //СвИП - СвЮЛУч - СвФЛ - СвИнНеУч
    property OrgType:TOrganizationType_DatabaseOrder read FOrgType write SetOrgType;
    property Ogrn:String read FOgrn write SetOgrn;
  end;

  {  TExtendedOrganizationReference_ReconciliationAct  }
  TExtendedOrganizationReference_ReconciliationAct = class(TExtendedOrganizationDetails_ManualFilling_ReconciliationAct)
  private
    FBoxId:Tguid;
    procedure SetBoxId( AValue:Tguid);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Идентификатор ящика организации
    property BoxId:Tguid read FBoxId write SetBoxId;
  end;

  {  TExtendedOrganizationDetailsUtd970  }
  TExtendedOrganizationDetailsUtd970 = class(TExtendedOrganizationDetails_ManualFilling_Utd970)
  private
    FAddress:TAddressUtd970;
    FOrgName:Tstring1000;
    FInn:Tinn;
    FKpp:Tkpp;
    FFnsParticipantId:Tstring1000;
    FOrgType:TOrganizationType_DatabaseOrder;
    FStatusId:String;
    FLegalEntityId:Tstring255;
    FCountry:String;
    FOrganizationOrPersonInfo:Tstring255;
    procedure SetOrgName( AValue:Tstring1000);
    procedure SetInn( AValue:Tinn);
    procedure SetKpp( AValue:Tkpp);
    procedure SetFnsParticipantId( AValue:Tstring1000);
    procedure SetOrgType( AValue:TOrganizationType_DatabaseOrder);
    procedure SetStatusId( AValue:String);
    procedure SetLegalEntityId( AValue:Tstring255);
    procedure SetCountry( AValue:String);
    procedure SetOrganizationOrPersonInfo( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Адрес
    property Address:TAddressUtd970 read FAddress;
    //НаимОрг/Наим - название организации/Наименование иностранной организации полное/Фамилия, имя, отчество (при наличии) иностранного гражданина
    property OrgName:Tstring1000 read FOrgName write SetOrgName;
    //ИНН ФЛ-ИНН - ИНН
    property Inn:Tinn read FInn write SetInn;
    //КПП
    property Kpp:Tkpp read FKpp write SetKpp;
    //идентификатор участника ЭДО
    property FnsParticipantId:Tstring1000 read FFnsParticipantId write SetFnsParticipantId;
    //СвИП - СвЮЛУч - СвФЛУч - СвИнНеУч
    property OrgType:TOrganizationType_DatabaseOrder read FOrgType write SetOrgType;
    //ИдСтат - Идентификация статусаПри значении 'LegalEntity' в конечный файл значение 'ИО'При значении 'PhysicalPerson' в конечный файл значение 'ИГ'
    property StatusId:String read FStatusId write SetStatusId;
    //Идентиф - Идентификатор иностранной организации
    property LegalEntityId:Tstring255 read FLegalEntityId write SetLegalEntityId;
    //КодСтр - Код страныНаимСтран будет заполнен автоматически
    property Country:String read FCountry write SetCountry;
    //ИныеСвед - Иные сведения, идентифицирующие ФЛ или ЮЛ
    property OrganizationOrPersonInfo:Tstring255 read FOrganizationOrPersonInfo write SetOrganizationOrPersonInfo;
  end;

  {  TExtendedOrganizationReferenceUtd970  }
  TExtendedOrganizationReferenceUtd970 = class(TExtendedOrganizationDetails_ManualFilling_Utd970)
  private
    FBoxId:Tguid;
    procedure SetBoxId( AValue:Tguid);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Идентификатор ящика организации
    property BoxId:Tguid read FBoxId write SetBoxId;
  end;

  {  TPhones  }
  TPhones = class(TXmlSerializationObject)
  private
    FPhone:TXSDStringArray;
    procedure SetPhone( AValue:TXSDStringArray);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Тлф - Номер контактного телефона/факс
    property Phone:TXSDStringArray read FPhone write SetPhone;
  end;

  {  TEmails  }
  TEmails = class(TXmlSerializationObject)
  private
    FEmail:TXSDStringArray;
    procedure SetEmail( AValue:TXSDStringArray);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ЭлПочта - Адрес электронной почты
    property Email:TXSDStringArray read FEmail write SetEmail;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
    destructor Destroy; override;
  published
    property RussianAddress:TRussianAddress read FRussianAddress;
    property ForeignAddress:TForeignAddress1000 read FForeignAddress;
    property AddressCode:Tstring36 read FAddressCode write SetAddressCode;
  end;

  {  TAddressUtd970  }
  TAddressUtd970 = class(TXmlSerializationObject)
  private
    FRussianAddress:TRussianAddressUtd970;
    FGarAddress:TGarAddress;
    FForeignAddress:TForeignAddressUtd970;
    FGln:Tstring13f;
    procedure SetGln( AValue:Tstring13f);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property RussianAddress:TRussianAddressUtd970 read FRussianAddress;
    property GarAddress:TGarAddress read FGarAddress;
    property ForeignAddress:TForeignAddressUtd970 read FForeignAddress;
    //ГЛНМеста - Глобальный номер места нахождения (GLN места)
    property Gln:Tstring13f read FGln write SetGln;
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
    constructor Create; override;
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

  {  TRussianAddressUtd970  }
  TRussianAddressUtd970 = class(TXmlSerializationObject)
  private
    FZipCode:String;
    FRegion:String;
    FTerritory:Tstring255;
    FCity:Tstring255;
    FLocality:Tstring255;
    FStreet:Tstring255;
    FBuilding:Tstring50;
    FBlock:Tstring50;
    FApartment:Tstring50;
    FOtherInfo:Tstring1000;
    procedure SetZipCode( AValue:String);
    procedure SetRegion( AValue:String);
    procedure SetTerritory( AValue:Tstring255);
    procedure SetCity( AValue:Tstring255);
    procedure SetLocality( AValue:Tstring255);
    procedure SetStreet( AValue:Tstring255);
    procedure SetBuilding( AValue:Tstring50);
    procedure SetBlock( AValue:Tstring50);
    procedure SetApartment( AValue:Tstring50);
    procedure SetOtherInfo( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Индекс
    property ZipCode:String read FZipCode write SetZipCode;
    //КодРегион - Код субъекта Российской ФедерацииНаимРегион будет заполнен автоматически
    property Region:String read FRegion write SetRegion;
    //Район
    property Territory:Tstring255 read FTerritory write SetTerritory;
    //Город
    property City:Tstring255 read FCity write SetCity;
    //Населенный пункт
    property Locality:Tstring255 read FLocality write SetLocality;
    //Улица
    property Street:Tstring255 read FStreet write SetStreet;
    //Дом
    property Building:Tstring50 read FBuilding write SetBuilding;
    //Корпус
    property Block:Tstring50 read FBlock write SetBlock;
    //Квартира
    property Apartment:Tstring50 read FApartment write SetApartment;
    //Иные сведения об адресе в Российской Федерации
    property OtherInfo:Tstring1000 read FOtherInfo write SetOtherInfo;
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
    constructor Create; override;
    destructor Destroy; override;
  published
    //страна (код)
    property Country:Tstring60 read FCountry write SetCountry;
    //текст адреса
    property Address:Tstring255 read FAddress write SetAddress;
  end;

  {  TForeignAddressUtd970  }
  TForeignAddressUtd970 = class(TXmlSerializationObject)
  private
    FCountry:String;
    FAddress:Tstring1000;
    procedure SetCountry( AValue:String);
    procedure SetAddress( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //КодСтр - Код страныНаимСтран будет заполнен автоматически
    property Country:String read FCountry write SetCountry;
    //текст адреса
    property Address:Tstring1000 read FAddress write SetAddress;
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
    constructor Create; override;
    destructor Destroy; override;
  published
    //страна (код)
    property Country:Tstring60 read FCountry write SetCountry;
    //текст адреса
    property Address:Tstring1000 read FAddress write SetAddress;
  end;

  {  TGarAddress  }
  TGarAddress = class(TXmlSerializationObject)
  private
    FMunicipalTerritory:TAddressElement;
    FUrbanSettlement:TAddressElement;
    FLocality:TAddressElement;
    FElementPlanningStructure:TAddressElement;
    FElementRoadNetwork:TAddressElement;
    FBuildings:GarAddress_Buildings;
    FRoomBuilding:TAddressElement;
    FRoomApartment:TAddressElement;
    FAddressCode:Tstring36;
    FZipCode:String;
    FRegion:String;
    FLandPlot:Tstring50;
    procedure SetAddressCode( AValue:Tstring36);
    procedure SetZipCode( AValue:String);
    procedure SetRegion( AValue:String);
    procedure SetLandPlot( AValue:Tstring50);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //МуниципРайон - Муниципальный район/городской округ/внутригородская территория города федерального значения/муниципальный округ/федеральная территория
    property MunicipalTerritory:TAddressElement read FMunicipalTerritory;
    //ГородСелПоселен - Городское поселение/сельское поселение/межселенная территория в составе муниципального района/внутригородской район городского округа
    property UrbanSettlement:TAddressElement read FUrbanSettlement;
    //НаселенПункт - Населенный пункт (город, деревня, село и прочее)
    property Locality:TAddressElement read FLocality;
    //ЭлПланСтруктур - Элемент планировочной структуры
    property ElementPlanningStructure:TAddressElement read FElementPlanningStructure;
    //ЭлУлДорСети - Элемент улично-дорожной сети
    property ElementRoadNetwork:TAddressElement read FElementRoadNetwork;
    property Buildings:GarAddress_Buildings read FBuildings;
    //ПомещЗдания - Помещение в пределах здания (строения), сооружения/ машино-место
    property RoomBuilding:TAddressElement read FRoomBuilding;
    //ПомещКвартиры - Помещение в пределах квартиры
    property RoomApartment:TAddressElement read FRoomApartment;
    //ИдНом - Уникальный номер адреса объекта адресации в государственном адресном реестре
    property AddressCode:Tstring36 read FAddressCode write SetAddressCode;
    //Индекс
    property ZipCode:String read FZipCode write SetZipCode;
    //КодРегион - Код субъекта Российской ФедерацииНаимРегион будет заполнен автоматически
    property Region:String read FRegion write SetRegion;
    //Земельный участок (номер)
    property LandPlot:Tstring50 read FLandPlot write SetLandPlot;
  end;

  {  TBuildings  }
  TBuildings = class(TXmlSerializationObject)
  private
    FBuilding:TAddressElementList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Здание - Здание (строение), сооружение/ объект незавершенного строительства
    property Building:TAddressElementList read FBuilding;
  end;

  {  TAddressElement  }
  //Сведения об адресном элементе
  TAddressElement = class(TXmlSerializationObject)
  private
    FType1:Tstring50;
    FNameOrNumber:Tstring255;
    procedure SetType1( AValue:Tstring50);
    procedure SetNameOrNumber( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Вид(код)/Тип
    property Type1:Tstring50 read FType1 write SetType1;
    //Наим/Номер
    property NameOrNumber:Tstring255 read FNameOrNumber write SetNameOrNumber;
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
    constructor Create; override;
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
    constructor Create; override;
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

  {  TEmployeeUtd970  }
  TEmployeeUtd970 = class(TXmlSerializationObject)
  private
    FPosition:Tstring255;
    FEmployeeInfo:Tstring255;
    FLastName:Tstring60;
    FFirstName:Tstring60;
    FMiddleName:Tstring60;
    procedure SetPosition( AValue:Tstring255);
    procedure SetEmployeeInfo( AValue:Tstring255);
    procedure SetLastName( AValue:Tstring60);
    procedure SetFirstName( AValue:Tstring60);
    procedure SetMiddleName( AValue:Tstring60);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Должность
    property Position:Tstring255 read FPosition write SetPosition;
    //ИныеСвед - Иные сведения, идентифицирующие физическое лицо
    property EmployeeInfo:Tstring255 read FEmployeeInfo write SetEmployeeInfo;
    //Фамилия
    property LastName:Tstring60 read FLastName write SetLastName;
    //Имя
    property FirstName:Tstring60 read FFirstName write SetFirstName;
    //Отчество
    property MiddleName:Tstring60 read FMiddleName write SetMiddleName;
  end;

  {  TOtherIssuerUtd970  }
  TOtherIssuerUtd970 = class(TXmlSerializationObject)
  private
    FEmployeeBase:TDocumentRequisitesType;
    FOrganizationBase:TDocumentRequisitesType;
    FPosition:Tstring255;
    FEmployeeInfo:Tstring255;
    FInn:Tinn;
    FOrganizationName:Tstring255;
    FLastName:Tstring60;
    FFirstName:Tstring60;
    FMiddleName:Tstring60;
    procedure SetPosition( AValue:Tstring255);
    procedure SetEmployeeInfo( AValue:Tstring255);
    procedure SetInn( AValue:Tinn);
    procedure SetOrganizationName( AValue:Tstring255);
    procedure SetLastName( AValue:Tstring60);
    procedure SetFirstName( AValue:Tstring60);
    procedure SetMiddleName( AValue:Tstring60);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ОснПолнПредПер/ОснПолнПредПрин (ОснДоверФЛ) - Основание полномочий представителя
    property EmployeeBase:TDocumentRequisitesType read FEmployeeBase;
    //ОснДоверОргПер/ОснДоверОргПрин - Основание, по которому организации доверена отгрузка/принятие товаров
    property OrganizationBase:TDocumentRequisitesType read FOrganizationBase;
    //Должность представителя организацииЕсли заполнено - формируется структура "ПредОргПер/ПредОргПрин"Если не заполнено – формируется структура "ФЛПер/ФЛПрин"
    property Position:Tstring255 read FPosition write SetPosition;
    //ИныеСвед - Иные сведения, идентифицирующие физическое лицо
    property EmployeeInfo:Tstring255 read FEmployeeInfo write SetEmployeeInfo;
    //ИННЮЛПер/ИННОргПрин (ИННФЛПер/ИННФЛПрин)
    property Inn:Tinn read FInn write SetInn;
    //НаимОргПер/НаимОргПрин - Наименование организации
    property OrganizationName:Tstring255 read FOrganizationName write SetOrganizationName;
    //Фамилия
    property LastName:Tstring60 read FLastName write SetLastName;
    //Имя
    property FirstName:Tstring60 read FFirstName write SetFirstName;
    //Отчество
    property MiddleName:Tstring60 read FMiddleName write SetMiddleName;
  end;

  {  TDocumentRequisitesType  }
  TDocumentRequisitesType = class(TXmlSerializationObject)
  private
    FIdentificationDetails:TIdentificationDetailsList;
    FDocumentName:Tstring255;
    FDocumentNumber:Tstring255;
    FDocumentDate:Tdate1;
    FFileId:Tstring255;
    FId:Tstring255;
    FSystemId:Tstring500;
    FSystemUrl:Tstring255;
    FAdditionalInfo:Tstring2000;
    procedure SetDocumentName( AValue:Tstring255);
    procedure SetDocumentNumber( AValue:Tstring255);
    procedure SetDocumentDate( AValue:Tdate1);
    procedure SetFileId( AValue:Tstring255);
    procedure SetId( AValue:Tstring255);
    procedure SetSystemId( AValue:Tstring500);
    procedure SetSystemUrl( AValue:Tstring255);
    procedure SetAdditionalInfo( AValue:Tstring2000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //РеквИдРекСост - Идентифицирующие реквизиты экономических субъектов, составивших (сформировавших) документ
    property IdentificationDetails:TIdentificationDetailsList read FIdentificationDetails;
    //РеквНаимДок - Наименование документа
    property DocumentName:Tstring255 read FDocumentName write SetDocumentName;
    //РеквНомерДок - Номер документа
    property DocumentNumber:Tstring255 read FDocumentNumber write SetDocumentNumber;
    //РеквДатаДок - Дата документа
    property DocumentDate:Tdate1 read FDocumentDate write SetDocumentDate;
    //РеквИдФайлДок - Идентификатор файла обмена документа, подписанного первой стороной
    property FileId:Tstring255 read FFileId write SetFileId;
    //РеквИдДок - Идентификатор документа
    property Id:Tstring255 read FId write SetId;
    //РИдСистХранД - Идентифицирующая информация об информационной системе, в которой осуществляется хранение документа, необходимая для запроса информации из информационной системы
    property SystemId:Tstring500 read FSystemId write SetSystemId;
    //РеквУРЛСистДок - Сведения в формате URL об информационной системе, которая предоставляет техническую возможность получения информации о документе
    property SystemUrl:Tstring255 read FSystemUrl write SetSystemUrl;
    //РеквДопСведДок - Дополнительные сведения
    property AdditionalInfo:Tstring2000 read FAdditionalInfo write SetAdditionalInfo;
  end;

  {  TIdentificationDetails  }
  //Если заполнен Inn - пытается сформировать ИННЮЛ (ИННФЛ)Если не заполнен Inn, но заполнен ShortNameExecutiveAuthority - пытается сформировать НаимОИВЕсли не заполнены Inn и ShortNameExecutiveAuthority - пытается сформировать ДаннИно
  TIdentificationDetails = class(TXmlSerializationObject)
  private
    FInn:Tinn;
    FShortNameExecutiveAuthority:Tstring255;
    FStatusId:String;
    FCountry:String;
    FOrgName:Tstring1000;
    FLegalEntityId:Tstring255;
    FOrganizationOrPersonInfo:Tstring255;
    procedure SetInn( AValue:Tinn);
    procedure SetShortNameExecutiveAuthority( AValue:Tstring255);
    procedure SetStatusId( AValue:String);
    procedure SetCountry( AValue:String);
    procedure SetOrgName( AValue:Tstring1000);
    procedure SetLegalEntityId( AValue:Tstring255);
    procedure SetOrganizationOrPersonInfo( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ИННЮЛ (ИННФЛ)
    property Inn:Tinn read FInn write SetInn;
    //НаимОИВ - Краткое наименование органа исполнительной власти (специализированной уполномоченной организации), выдавшего документ
    property ShortNameExecutiveAuthority:Tstring255 read FShortNameExecutiveAuthority write SetShortNameExecutiveAuthority;
    //ИдСтат - Идентификация статусаПри значении 'LegalEntity' в конечный файл значение 'ИО'При значении 'PhysicalPerson' в конечный файл значение 'ИГ'
    property StatusId:String read FStatusId write SetStatusId;
    //КодСтр - Код страныНаимСтран будет заполнен автоматически
    property Country:String read FCountry write SetCountry;
    //Наим - Наименование иностранной организации полное/Фамилия, имя, отчество (при наличии) иностранного гражданина
    property OrgName:Tstring1000 read FOrgName write SetOrgName;
    //Идентиф - Идентификатор иностранной организации (иностранного гражданина)
    property LegalEntityId:Tstring255 read FLegalEntityId write SetLegalEntityId;
    //ИныеСвед - Иные сведения для однозначной идентификации иностранной организации (иностранного гражданина)
    property OrganizationOrPersonInfo:Tstring255 read FOrganizationOrPersonInfo write SetOrganizationOrPersonInfo;
  end;

  {  TSigners  }
  TSigners = class(TXmlSerializationObject)
  private
    FSigner:TSignerList;
    FBoxId:Tguid;
    procedure SetBoxId( AValue:Tguid);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Signer:TSignerList read FSigner;
    //Идентификатор ящика организации
    property BoxId:Tguid read FBoxId write SetBoxId;
  end;

  {  TSigner  }
  TSigner = class(TXmlSerializationObject)
  private
    FCertificate:TCertificate;
    FFio:TFio;
    FPosition:Signer_Position;
    FSignerAdditionalInfo:Signer_SignerAdditionalInfo;
    FPowerOfAttorney:TPowerOfAttorney;
    FSignerStatus:String;
    FSignatureType:String;
    FSigningDate:Tdate1;
    FSignerPowersConfirmationMethod:String;
    procedure SetSignerStatus( AValue:String);
    procedure SetSignatureType( AValue:String);
    procedure SetSigningDate( AValue:Tdate1);
    procedure SetSignerPowersConfirmationMethod( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Certificate:TCertificate read FCertificate;
    property Fio:TFio read FFio;
    //ДолжностьОдин из элементов является обязательным
    property Position:Signer_Position read FPosition;
    //Используется для типов @970 и @405 форматов. Для остальных - игнорируетсяДопСведПодп - Дополнительные сведения о подписанте
    property SignerAdditionalInfo:Signer_SignerAdditionalInfo read FSignerAdditionalInfo;
    property PowerOfAttorney:TPowerOfAttorney read FPowerOfAttorney;
    //Используется для типов @405 и @691 форматов. Для остальных - игнорируетсяСтатПодп - Статус подписанта
    property SignerStatus:String read FSignerStatus write SetSignerStatus;
    //ТипПодпис - Тип подписи
    property SignatureType:String read FSignatureType write SetSignatureType;
    //Используется для типов @970 формата. Для остальных - игнорируетсяДатаПодДок - Дата подписания документа
    property SigningDate:Tdate1 read FSigningDate write SetSigningDate;
    //Используется для типов @970 и @405 форматов. Для остальных - игнорируетсяСпосПодтПолном - Способ подтверждения полномочий представителя на подписание документа
    property SignerPowersConfirmationMethod:String read FSignerPowersConfirmationMethod write SetSignerPowersConfirmationMethod;
  end;

  {  TPosition  }
  TPosition = class(TXmlSerializationObject)
  private
    FPositionSource:String;
    procedure SetPositionSource( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Автоматическое заполнение должности из настроек сотрудника указанных в сервисе
    property PositionSource:String read FPositionSource write SetPositionSource;
  end;

  {  TSignerAdditionalInfo  }
  TSignerAdditionalInfo = class(TXmlSerializationObject)
  private
    FSignerAdditionalInfoSource:String;
    procedure SetSignerAdditionalInfoSource( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Автоматическое заполнение дополнительных сведений из настроек указанных в сервисе
    property SignerAdditionalInfoSource:String read FSignerAdditionalInfoSource write SetSignerAdditionalInfoSource;
  end;

  {  TCertificate  }
  TCertificate = class(TXmlSerializationObject)
  private
    FCertificateThumbprint:Tstring100;
    FCertificateBytes:String;
    procedure SetCertificateThumbprint( AValue:Tstring100);
    procedure SetCertificateBytes( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property CertificateThumbprint:Tstring100 read FCertificateThumbprint write SetCertificateThumbprint;
    property CertificateBytes:String read FCertificateBytes write SetCertificateBytes;
  end;

  {  TPowerOfAttorney  }
  TPowerOfAttorney = class(TXmlSerializationObject)
  private
    FElectronic:TElectronic;
    FPaper:TPaper;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Электронная доверенность
    property Electronic:TElectronic read FElectronic;
    //Бумажная доверенности
    property Paper:TPaper read FPaper;
  end;

  {  TElectronic  }
  TElectronic = class(TXmlSerializationObject)
  private
    FStorage:TStorage;
    FManual:TManual;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Автоматическое заполнение информации по доверенности на основе номера и ИНН
    property Storage:TStorage read FStorage;
    //Ручное заполнение данных доверенности
    property Manual:TManual read FManual;
  end;

  {  TStorage  }
  TStorage = class(TXmlSerializationObject)
  private
    FFullId:Storage_FullId;
    FUseDefault:String;
    procedure SetUseDefault( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property FullId:Storage_FullId read FFullId;
    //Автоматическое заполнение информации на основе доверенности, используемой сотрудником по умолчанию
    property UseDefault:String read FUseDefault write SetUseDefault;
  end;

  {  TFullId  }
  TFullId = class(TXmlSerializationObject)
  private
    FRegistrationNumber:Tguid;
    FIssuerInn:Tinn;
    procedure SetRegistrationNumber( AValue:Tguid);
    procedure SetIssuerInn( AValue:Tinn);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Номер доверенности
    property RegistrationNumber:Tguid read FRegistrationNumber write SetRegistrationNumber;
    //ИНН организации, выдавшей доверенность
    property IssuerInn:Tinn read FIssuerInn write SetIssuerInn;
  end;

  {  TManual  }
  TManual = class(TXmlSerializationObject)
  private
    FRegistrationNumber:Tguid;
    FRegistrationDate:Tdate1;
    FInternalNumber:Tstring50;
    FInternalDate:Tdate1;
    FSystemId:Tstring500;
    FSystemUrl:Tstring500;
    procedure SetRegistrationNumber( AValue:Tguid);
    procedure SetRegistrationDate( AValue:Tdate1);
    procedure SetInternalNumber( AValue:Tstring50);
    procedure SetInternalDate( AValue:Tdate1);
    procedure SetSystemId( AValue:Tstring500);
    procedure SetSystemUrl( AValue:Tstring500);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Номер доверенности
    property RegistrationNumber:Tguid read FRegistrationNumber write SetRegistrationNumber;
    //Дата совершения (выдачи) доверенности
    property RegistrationDate:Tdate1 read FRegistrationDate write SetRegistrationDate;
    //Внутренний регистрационный номер доверенности
    property InternalNumber:Tstring50 read FInternalNumber write SetInternalNumber;
    //Дата внутренней регистрации доверенности
    property InternalDate:Tdate1 read FInternalDate write SetInternalDate;
    //Идентифицирующая информация об информационной системе, в которой осуществляется хранение доверенности
    property SystemId:Tstring500 read FSystemId write SetSystemId;
    //Используется для типов @970 формата. Для остальных - игнорируетсяСведения в формате URL об информационной системе, которая предоставляет техническую возможность получения информации о доверенности
    property SystemUrl:Tstring500 read FSystemUrl write SetSystemUrl;
  end;

  {  TPaper  }
  //Сведения о доверенности, используемой для подтверждения полномочий на бумажном носителе
  TPaper = class(TXmlSerializationObject)
  private
    FPerson:TFio;
    FInternalNumber:Tstring50;
    FRegistrationDate:Tdate1;
    FIssuerInfo:Tstring1000;
    procedure SetInternalNumber( AValue:Tstring50);
    procedure SetRegistrationDate( AValue:Tdate1);
    procedure SetIssuerInfo( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Фамилия, имя, отчество (при наличии) лица, подписавшего доверенность
    property Person:TFio read FPerson;
    //Внутренний регистрационный номер доверенности
    property InternalNumber:Tstring50 read FInternalNumber write SetInternalNumber;
    //Дата совершения (выдачи) доверенности
    property RegistrationDate:Tdate1 read FRegistrationDate write SetRegistrationDate;
    //Сведения о доверителе
    property IssuerInfo:Tstring1000 read FIssuerInfo write SetIssuerInfo;
  end;

  {  TFio  }
  TFio = class(TXmlSerializationObject)
  private
    FLastName:Tstring60;
    FFirstName:Tstring60;
    FMiddleName:Tstring60;
    procedure SetLastName( AValue:Tstring60);
    procedure SetFirstName( AValue:Tstring60);
    procedure SetMiddleName( AValue:Tstring60);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Фамилия
    property LastName:Tstring60 read FLastName write SetLastName;
    //Имя
    property FirstName:Tstring60 read FFirstName write SetFirstName;
    //Отчество
    property MiddleName:Tstring60 read FMiddleName write SetMiddleName;
  end;

  {  TWaybills  }
  TWaybills = class(TXmlSerializationObject)
  private
    FWaybill:TXSDWaybills_WaybillArray;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Waybill:TXSDWaybills_WaybillArray read FWaybill;
  end;

  {  TWaybill  }
  TWaybill = class(TXmlSerializationObject)
  private
    FTransferDocumentNumber:Tstring255;
    FTransferDocumentDate:Tdate1;
    procedure SetTransferDocumentNumber( AValue:Tstring255);
    procedure SetTransferDocumentDate( AValue:Tdate1);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
    destructor Destroy; override;
  published
    //ИдентОсн - Идентификатор документа – основания
    property BaseDocumentId:Tstring255 read FBaseDocumentId write SetBaseDocumentId;
  end;

implementation

  {  TUniversalTransferDocument  }
procedure TUniversalTransferDocument.SetFunction1(AValue: String);
begin
  CheckLockupValue('Function1', AValue);
  FFunction1:=AValue;
  ModifiedProperty('Function1');
end;

procedure TUniversalTransferDocument.SetUid(AValue: Tstring1000);
begin
  CheckStrMinSize('Uid', AValue);
  CheckStrMaxSize('Uid', AValue);
  FUid:=AValue;
  ModifiedProperty('Uid');
end;

procedure TUniversalTransferDocument.SetApprovedStructureAdditionalInfoFields(AValue: Tstring14f);
begin
  CheckStrMinSize('ApprovedStructureAdditionalInfoFields', AValue);
  CheckStrMaxSize('ApprovedStructureAdditionalInfoFields', AValue);
  FApprovedStructureAdditionalInfoFields:=AValue;
  ModifiedProperty('ApprovedStructureAdditionalInfoFields');
end;

procedure TUniversalTransferDocument.SetSenderFnsParticipantId(AValue: String);
begin
  CheckStrMinSize('SenderFnsParticipantId', AValue);
  CheckStrMaxSize('SenderFnsParticipantId', AValue);
  FSenderFnsParticipantId:=AValue;
  ModifiedProperty('SenderFnsParticipantId');
end;

procedure TUniversalTransferDocument.SetRecipientFnsParticipantId(AValue: String);
begin
  CheckStrMinSize('RecipientFnsParticipantId', AValue);
  CheckStrMaxSize('RecipientFnsParticipantId', AValue);
  FRecipientFnsParticipantId:=AValue;
  ModifiedProperty('RecipientFnsParticipantId');
end;

procedure TUniversalTransferDocument.SetDocumentName(AValue: Tstring255);
begin
  CheckStrMinSize('DocumentName', AValue);
  CheckStrMaxSize('DocumentName', AValue);
  FDocumentName:=AValue;
  ModifiedProperty('DocumentName');
end;

procedure TUniversalTransferDocument.SetDocumentDate(AValue: Tdate1);
begin
  CheckStrMinSize('DocumentDate', AValue);
  CheckStrMaxSize('DocumentDate', AValue);
  FDocumentDate:=AValue;
  ModifiedProperty('DocumentDate');
end;

procedure TUniversalTransferDocument.SetDocumentNumber(AValue: Tstring1000);
begin
  CheckStrMinSize('DocumentNumber', AValue);
  CheckStrMaxSize('DocumentNumber', AValue);
  FDocumentNumber:=AValue;
  ModifiedProperty('DocumentNumber');
end;

procedure TUniversalTransferDocument.SetFileIdSeller(AValue: Tstring255);
begin
  CheckStrMinSize('FileIdSeller', AValue);
  CheckStrMaxSize('FileIdSeller', AValue);
  FFileIdSeller:=AValue;
  ModifiedProperty('FileIdSeller');
end;

procedure TUniversalTransferDocument.SetFileIdBuyer(AValue: Tstring255);
begin
  CheckStrMinSize('FileIdBuyer', AValue);
  CheckStrMaxSize('FileIdBuyer', AValue);
  FFileIdBuyer:=AValue;
  ModifiedProperty('FileIdBuyer');
end;

procedure TUniversalTransferDocument.SetCurrency(AValue: Tokv);
begin
  CheckStrMinSize('Currency', AValue);
  CheckStrMaxSize('Currency', AValue);
  FCurrency:=AValue;
  ModifiedProperty('Currency');
end;

procedure TUniversalTransferDocument.SetCurrencyRate(AValue: Double);
begin
  FCurrencyRate:=AValue;
  ModifiedProperty('CurrencyRate');
end;

procedure TUniversalTransferDocument.SetRevisionDate(AValue: Tdate1);
begin
  CheckStrMinSize('RevisionDate', AValue);
  CheckStrMaxSize('RevisionDate', AValue);
  FRevisionDate:=AValue;
  ModifiedProperty('RevisionDate');
end;

procedure TUniversalTransferDocument.SetRevisionNumber(AValue: Int64);
begin
  FRevisionNumber:=AValue;
  ModifiedProperty('RevisionNumber');
end;

procedure TUniversalTransferDocument.SetDocumentCreator(AValue: Tstring1000);
begin
  CheckStrMinSize('DocumentCreator', AValue);
  CheckStrMaxSize('DocumentCreator', AValue);
  FDocumentCreator:=AValue;
  ModifiedProperty('DocumentCreator');
end;

procedure TUniversalTransferDocument.SetGovernmentContractInfo(AValue: String);
begin
  CheckStrMinSize('GovernmentContractInfo', AValue);
  CheckStrMaxSize('GovernmentContractInfo', AValue);
  FGovernmentContractInfo:=AValue;
  ModifiedProperty('GovernmentContractInfo');
end;

procedure TUniversalTransferDocument.SetCircumFormat(AValue: String);
begin
  CheckStrMinSize('CircumFormat', AValue);
  CheckStrMaxSize('CircumFormat', AValue);
  FCircumFormat:=AValue;
  ModifiedProperty('CircumFormat');
end;

procedure TUniversalTransferDocument.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('MetaData', 'MetaData', [], '', -1, -1);
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
  P:=RegisterProperty('DocumentCreatorBase', 'DocumentCreatorBase', [], '', -1, -1);
  P:=RegisterProperty('CommitmentTypes', 'CommitmentTypes', [], '', -1, -1);
  P:=RegisterProperty('AccompanyingDocuments', 'AccompanyingDocuments', [], '', -1, -1);
  P:=RegisterProperty('Function1', 'Function', [xsaRequared], '', -1, -1);
    P.ValidList.Add('СЧФ');
    P.ValidList.Add('ДОП');
    P.ValidList.Add('СЧФДОП');
    P.ValidList.Add('СвРК');
    P.ValidList.Add('СвЗК');
  P:=RegisterProperty('Uid', 'Uid', [], '', 1, 1000);
  P:=RegisterProperty('ApprovedStructureAdditionalInfoFields', 'ApprovedStructureAdditionalInfoFields', [], '', 14, 14);
  P:=RegisterProperty('SenderFnsParticipantId', 'SenderFnsParticipantId', [], '', 4, 46);
  P:=RegisterProperty('RecipientFnsParticipantId', 'RecipientFnsParticipantId', [], '', 4, 46);
  P:=RegisterProperty('DocumentName', 'DocumentName', [], '', 1, 255);
  P:=RegisterProperty('DocumentDate', 'DocumentDate', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('DocumentNumber', 'DocumentNumber', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('FileIdSeller', 'FileIdSeller', [], '', 1, 255);
  P:=RegisterProperty('FileIdBuyer', 'FileIdBuyer', [], '', 1, 255);
  P:=RegisterProperty('Currency', 'Currency', [xsaRequared], '', 3, 3);
  P:=RegisterProperty('CurrencyRate', 'CurrencyRate', [], '', -1, -1);
    P.TotalDigits := 10;
    P.FractionDigits := 4;
  P:=RegisterProperty('RevisionDate', 'RevisionDate', [], '', 10, 10);
  P:=RegisterProperty('RevisionNumber', 'RevisionNumber', [], '', -1, -1);
    P.TotalDigits := 3;
    P.FractionDigits := 0;
  P:=RegisterProperty('DocumentCreator', 'DocumentCreator', [], '', 1, 1000);
  P:=RegisterProperty('GovernmentContractInfo', 'GovernmentContractInfo', [], '', 20, 25);
  P:=RegisterProperty('CircumFormat', 'CircumFormat', [], '', 1, 5);
end;

procedure TUniversalTransferDocument.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FMetaData:=UniversalTransferDocument_MetaData.Create;
  FSellers:=UniversalTransferDocument_Sellers.Create;
  FBuyers:=UniversalTransferDocument_Buyers.Create;
  FShippers:=UniversalTransferDocument_Shippers.Create;
  FConsignees:=UniversalTransferDocument_Consignees.Create;
  FSigners:=TSigners.Create;
  FPaymentDocuments:=UniversalTransferDocument_PaymentDocuments.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FTable:=TInvoiceTable.Create;
  FTransferInfo:=TTransferInfo.Create;
  FFactorInfo:=TExtendedOrganizationInfoUtd970.Create;
  FMainAssignMonetaryClaim:=TDocumentRequisitesType.Create;
  FSellerInfoCircumPublicProc:=UniversalTransferDocument_SellerInfoCircumPublicProc.Create;
  FDocumentShipments:=UniversalTransferDocument_DocumentShipments.Create;
  FDocumentCreatorBase:=TDocumentRequisitesType.Create;
  FCommitmentTypes:=UniversalTransferDocument_CommitmentTypes.Create;
  FAccompanyingDocuments:=UniversalTransferDocument_AccompanyingDocuments.Create;
end;

destructor TUniversalTransferDocument.Destroy;
begin
  FMetaData.Free;
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
  FDocumentCreatorBase.Free;
  FCommitmentTypes.Free;
  FAccompanyingDocuments.Free;
  inherited Destroy;
end;

function TUniversalTransferDocument.RootNodeName:string;
begin
  Result:='UniversalTransferDocument';
end;

constructor TUniversalTransferDocument.Create;
begin
  inherited Create;
end;

  {  TMetaData  }
procedure TMetaData.SetIncludeIdentificationNumbers(AValue: TXSDInt64Array);
var
  V:TIncludeIdentificationNumbers;
begin
  for V in AValue do
  begin
  end;
  FIncludeIdentificationNumbers:=AValue;
  ModifiedProperty('IncludeIdentificationNumbers');
end;

procedure TMetaData.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('IncludeIdentificationNumbers', 'IncludeIdentificationNumbers', [xsaSimpleObject], '', -1, -1);
    P.TotalDigits := 3;
    P.FractionDigits := 0;
end;

procedure TMetaData.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TMetaData.Destroy;
begin
  inherited Destroy;
end;

constructor TMetaData.Create;
begin
  inherited Create;
end;

  {  TSellers  }
procedure TSellers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Seller', 'Seller', [], '', -1, -1);
end;

procedure TSellers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSeller:=TExtendedOrganizationInfoUtd970List.Create;
end;

destructor TSellers.Destroy;
begin
  FSeller.Free;
  inherited Destroy;
end;

constructor TSellers.Create;
begin
  inherited Create;
end;

  {  TBuyers  }
procedure TBuyers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Buyer', 'Buyer', [], '', -1, -1);
end;

procedure TBuyers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FBuyer:=TExtendedOrganizationInfoUtd970List.Create;
end;

destructor TBuyers.Destroy;
begin
  FBuyer.Free;
  inherited Destroy;
end;

constructor TBuyers.Create;
begin
  inherited Create;
end;

  {  TShippers  }
procedure TShippers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Shipper', 'Shipper', [], '', -1, -1);
end;

procedure TShippers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FShipper:=TXSDShippers_ShipperArray.Create;
end;

destructor TShippers.Destroy;
begin
  FShipper.Free;
  inherited Destroy;
end;

constructor TShippers.Create;
begin
  inherited Create;
end;

  {  TShipper  }
procedure TShipper.SetSameAsSeller(AValue: String);
begin
  CheckLockupValue('SameAsSeller', AValue);
  FSameAsSeller:=AValue;
  ModifiedProperty('SameAsSeller');
end;

procedure TShipper.InternalRegisterPropertys;
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

procedure TShipper.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TExtendedOrganizationDetailsUtd970.Create;
  FOrganizationReference:=TExtendedOrganizationReferenceUtd970.Create;
end;

destructor TShipper.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

constructor TShipper.Create;
begin
  inherited Create;
  SameAsSeller:='false';
end;

  {  TConsignees  }
procedure TConsignees.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Consignee', 'Consignee', [], '', -1, -1);
end;

procedure TConsignees.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FConsignee:=TExtendedOrganizationInfoUtd970List.Create;
end;

destructor TConsignees.Destroy;
begin
  FConsignee.Free;
  inherited Destroy;
end;

constructor TConsignees.Create;
begin
  inherited Create;
end;

  {  TPaymentDocuments  }
procedure TPaymentDocuments.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Document', 'Document', [], '', -1, -1);
end;

procedure TPaymentDocuments.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FDocument:=TPaymentDocumentInfoUtd970List.Create;
end;

destructor TPaymentDocuments.Destroy;
begin
  FDocument.Free;
  inherited Destroy;
end;

constructor TPaymentDocuments.Create;
begin
  inherited Create;
end;

  {  TSellerInfoCircumPublicProc  }
procedure TSellerInfoCircumPublicProc.SetDateStateContract(AValue: Tdate1);
begin
  CheckStrMinSize('DateStateContract', AValue);
  CheckStrMaxSize('DateStateContract', AValue);
  FDateStateContract:=AValue;
  ModifiedProperty('DateStateContract');
end;

procedure TSellerInfoCircumPublicProc.SetNumberStateContract(AValue: Tstring100);
begin
  CheckStrMinSize('NumberStateContract', AValue);
  CheckStrMaxSize('NumberStateContract', AValue);
  FNumberStateContract:=AValue;
  ModifiedProperty('NumberStateContract');
end;

procedure TSellerInfoCircumPublicProc.SetPersonalAccountSeller(AValue: Tstring11f);
begin
  CheckStrMinSize('PersonalAccountSeller', AValue);
  CheckStrMaxSize('PersonalAccountSeller', AValue);
  FPersonalAccountSeller:=AValue;
  ModifiedProperty('PersonalAccountSeller');
end;

procedure TSellerInfoCircumPublicProc.SetSellerBudjetClassCode(AValue: Tstring20f);
begin
  CheckStrMinSize('SellerBudjetClassCode', AValue);
  CheckStrMaxSize('SellerBudjetClassCode', AValue);
  FSellerBudjetClassCode:=AValue;
  ModifiedProperty('SellerBudjetClassCode');
end;

procedure TSellerInfoCircumPublicProc.SetSellerTargetCode(AValue: Tstring20f);
begin
  CheckStrMinSize('SellerTargetCode', AValue);
  CheckStrMaxSize('SellerTargetCode', AValue);
  FSellerTargetCode:=AValue;
  ModifiedProperty('SellerTargetCode');
end;

procedure TSellerInfoCircumPublicProc.SetSellerTreasuryCode(AValue: Tstring4);
begin
  CheckStrMinSize('SellerTreasuryCode', AValue);
  CheckStrMaxSize('SellerTreasuryCode', AValue);
  FSellerTreasuryCode:=AValue;
  ModifiedProperty('SellerTreasuryCode');
end;

procedure TSellerInfoCircumPublicProc.SetSellerTreasuryName(AValue: Tstring2000);
begin
  CheckStrMinSize('SellerTreasuryName', AValue);
  CheckStrMaxSize('SellerTreasuryName', AValue);
  FSellerTreasuryName:=AValue;
  ModifiedProperty('SellerTreasuryName');
end;

procedure TSellerInfoCircumPublicProc.InternalRegisterPropertys;
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

procedure TSellerInfoCircumPublicProc.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TSellerInfoCircumPublicProc.Destroy;
begin
  inherited Destroy;
end;

constructor TSellerInfoCircumPublicProc.Create;
begin
  inherited Create;
end;

  {  TDocumentShipments  }
procedure TDocumentShipments.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('DocumentShipment', 'DocumentShipment', [], '', -1, -1);
end;

procedure TDocumentShipments.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FDocumentShipment:=TDocumentRequisitesTypeList.Create;
end;

destructor TDocumentShipments.Destroy;
begin
  FDocumentShipment.Free;
  inherited Destroy;
end;

constructor TDocumentShipments.Create;
begin
  inherited Create;
end;

  {  TCommitmentTypes  }
procedure TCommitmentTypes.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CommitmentType', 'CommitmentType', [], '', -1, -1);
end;

procedure TCommitmentTypes.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FCommitmentType:=TXSDCommitmentTypes_CommitmentTypeArray.Create;
end;

destructor TCommitmentTypes.Destroy;
begin
  FCommitmentType.Free;
  inherited Destroy;
end;

constructor TCommitmentTypes.Create;
begin
  inherited Create;
end;

  {  TCommitmentType  }
procedure TCommitmentType.SetCommitmentTypeCode(AValue: Tstring255);
begin
  CheckStrMinSize('CommitmentTypeCode', AValue);
  CheckStrMaxSize('CommitmentTypeCode', AValue);
  FCommitmentTypeCode:=AValue;
  ModifiedProperty('CommitmentTypeCode');
end;

procedure TCommitmentType.SetCommitmentTypeName(AValue: Tstring255);
begin
  CheckStrMinSize('CommitmentTypeName', AValue);
  CheckStrMaxSize('CommitmentTypeName', AValue);
  FCommitmentTypeName:=AValue;
  ModifiedProperty('CommitmentTypeName');
end;

procedure TCommitmentType.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CommitmentTypeCode', 'CommitmentTypeCode', [], '', 1, 255);
  P:=RegisterProperty('CommitmentTypeName', 'CommitmentTypeName', [], '', 1, 255);
end;

procedure TCommitmentType.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TCommitmentType.Destroy;
begin
  inherited Destroy;
end;

constructor TCommitmentType.Create;
begin
  inherited Create;
end;

  {  TAccompanyingDocuments  }
procedure TAccompanyingDocuments.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AccompanyingDocument', 'AccompanyingDocument', [], '', -1, -1);
end;

procedure TAccompanyingDocuments.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAccompanyingDocument:=TDocumentRequisitesTypeList.Create;
end;

destructor TAccompanyingDocuments.Destroy;
begin
  FAccompanyingDocument.Free;
  inherited Destroy;
end;

constructor TAccompanyingDocuments.Create;
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
  FWithoutVat:=AValue;
  ModifiedProperty('WithoutVat');
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
  P:=RegisterProperty('WithoutVat', 'WithoutVat', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
  P:=RegisterProperty('Total', 'Total', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('TotalNet', 'TotalNet', [], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
end;

procedure TInvoiceTable.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItem:=TXSDInvoiceTable_ItemArray.Create;
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
end;

  {  TItem  }
procedure TItem.SetProduct(AValue: Tstring2000);
begin
  CheckStrMinSize('Product', AValue);
  CheckStrMaxSize('Product', AValue);
  FProduct:=AValue;
  ModifiedProperty('Product');
end;

procedure TItem.SetUnit1(AValue: Tokei);
begin
  CheckStrMinSize('Unit1', AValue);
  CheckStrMaxSize('Unit1', AValue);
  FUnit1:=AValue;
  ModifiedProperty('Unit1');
end;

procedure TItem.SetUnitName(AValue: Tstring255);
begin
  CheckStrMinSize('UnitName', AValue);
  CheckStrMaxSize('UnitName', AValue);
  FUnitName:=AValue;
  ModifiedProperty('UnitName');
end;

procedure TItem.SetQuantity(AValue: Double);
begin
  FQuantity:=AValue;
  ModifiedProperty('Quantity');
end;

procedure TItem.SetPrice(AValue: Double);
begin
  FPrice:=AValue;
  ModifiedProperty('Price');
end;

procedure TItem.SetExcise(AValue: Double);
begin
  FExcise:=AValue;
  ModifiedProperty('Excise');
end;

procedure TItem.SetTaxRate(AValue: TTaxRateUtd970);
begin
  CheckLockupValue('TaxRate', AValue);
  FTaxRate:=AValue;
  ModifiedProperty('TaxRate');
end;

procedure TItem.SetSubtotalWithVatExcluded(AValue: Double);
begin
  FSubtotalWithVatExcluded:=AValue;
  ModifiedProperty('SubtotalWithVatExcluded');
end;

procedure TItem.SetVat(AValue: Double);
begin
  FVat:=AValue;
  ModifiedProperty('Vat');
end;

procedure TItem.SetWithoutVat(AValue: String);
begin
  CheckLockupValue('WithoutVat', AValue);
  FWithoutVat:=AValue;
  ModifiedProperty('WithoutVat');
end;

procedure TItem.SetRestoredVat(AValue: Double);
begin
  FRestoredVat:=AValue;
  ModifiedProperty('RestoredVat');
end;

procedure TItem.SetWithoutRestoredVat(AValue: String);
begin
  CheckLockupValue('WithoutRestoredVat', AValue);
  FWithoutRestoredVat:=AValue;
  ModifiedProperty('WithoutRestoredVat');
end;

procedure TItem.SetSubtotal(AValue: Double);
begin
  FSubtotal:=AValue;
  ModifiedProperty('Subtotal');
end;

procedure TItem.SetItemMark(AValue: Int64);
begin
  CheckLockupValue('ItemMark', AValue);
  FItemMark:=AValue;
  ModifiedProperty('ItemMark');
end;

procedure TItem.SetAdditionalProperty(AValue: Tstring4);
begin
  CheckStrMinSize('AdditionalProperty', AValue);
  CheckStrMaxSize('AdditionalProperty', AValue);
  FAdditionalProperty:=AValue;
  ModifiedProperty('AdditionalProperty');
end;

procedure TItem.SetItemVendorCode(AValue: Tstring100);
begin
  CheckStrMinSize('ItemVendorCode', AValue);
  CheckStrMaxSize('ItemVendorCode', AValue);
  FItemVendorCode:=AValue;
  ModifiedProperty('ItemVendorCode');
end;

procedure TItem.SetItemToRelease(AValue: Double);
begin
  FItemToRelease:=AValue;
  ModifiedProperty('ItemToRelease');
end;

procedure TItem.SetItemCharact(AValue: Tstring1000);
begin
  CheckStrMinSize('ItemCharact', AValue);
  CheckStrMaxSize('ItemCharact', AValue);
  FItemCharact:=AValue;
  ModifiedProperty('ItemCharact');
end;

procedure TItem.SetItemArticle(AValue: Tstring50);
begin
  CheckStrMinSize('ItemArticle', AValue);
  CheckStrMaxSize('ItemArticle', AValue);
  FItemArticle:=AValue;
  ModifiedProperty('ItemArticle');
end;

procedure TItem.SetItemKind(AValue: Tstring10);
begin
  CheckStrMinSize('ItemKind', AValue);
  CheckStrMaxSize('ItemKind', AValue);
  FItemKind:=AValue;
  ModifiedProperty('ItemKind');
end;

procedure TItem.SetItemSeries(AValue: Tstring50);
begin
  CheckStrMinSize('ItemSeries', AValue);
  CheckStrMaxSize('ItemSeries', AValue);
  FItemSeries:=AValue;
  ModifiedProperty('ItemSeries');
end;

procedure TItem.SetGtin(AValue: Tstring14f);
begin
  CheckStrMinSize('Gtin', AValue);
  CheckStrMaxSize('Gtin', AValue);
  FGtin:=AValue;
  ModifiedProperty('Gtin');
end;

procedure TItem.SetCatalogCode(AValue: Tstring27f);
begin
  CheckStrMinSize('CatalogCode', AValue);
  CheckStrMaxSize('CatalogCode', AValue);
  FCatalogCode:=AValue;
  ModifiedProperty('CatalogCode');
end;

procedure TItem.SetItemTypeCode(AValue: Tstring10);
begin
  CheckStrMinSize('ItemTypeCode', AValue);
  CheckStrMaxSize('ItemTypeCode', AValue);
  FItemTypeCode:=AValue;
  ModifiedProperty('ItemTypeCode');
end;

procedure TItem.SetProductTypeCode(AValue: Int64);
begin
  FProductTypeCode:=AValue;
  ModifiedProperty('ProductTypeCode');
end;

procedure TItem.SetOkpd(AValue: Tokpd);
begin
  CheckStrMinSize('Okpd', AValue);
  CheckStrMaxSize('Okpd', AValue);
  FOkpd:=AValue;
  ModifiedProperty('Okpd');
end;

procedure TItem.SetItemAdditionalInfo(AValue: Tstring5f);
begin
  CheckStrMinSize('ItemAdditionalInfo', AValue);
  CheckStrMaxSize('ItemAdditionalInfo', AValue);
  FItemAdditionalInfo:=AValue;
  ModifiedProperty('ItemAdditionalInfo');
end;

procedure TItem.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CustomsDeclarations', 'CustomsDeclarations', [], '', -1, -1);
  P:=RegisterProperty('AdditionalInfos', 'AdditionalInfos', [], '', -1, -1);
  P:=RegisterProperty('ItemTracingInfos', 'ItemTracingInfos', [], '', -1, -1);
  P:=RegisterProperty('ItemIdentificationNumbers', 'ItemIdentificationNumbers', [], '', -1, -1);
  P:=RegisterProperty('AccompanyingDocuments', 'AccompanyingDocuments', [], '', -1, -1);
  P:=RegisterProperty('DepreciationInfo', 'DepreciationInfo', [], '', -1, -1);
  P:=RegisterProperty('StateSystemItemInfos', 'StateSystemItemInfos', [], '', -1, -1);
  P:=RegisterProperty('Product', 'Product', [], '', 1, 2000);
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
    P.ValidList.Add('NoVat');
    P.ValidList.Add('ZeroPercent');
    P.ValidList.Add('TenPercent');
    P.ValidList.Add('TwentyPercent');
    P.ValidList.Add('TenFraction');
    P.ValidList.Add('TwentyFraction');
    P.ValidList.Add('TaxedByAgent');
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
  P:=RegisterProperty('RestoredVat', 'RestoredVat', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('WithoutRestoredVat', 'WithoutRestoredVat', [], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
    P.DefaultValue:='false';
  P:=RegisterProperty('Subtotal', 'Subtotal', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
  P:=RegisterProperty('ItemMark', 'ItemMark', [], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
    P.ValidList.Add('5');
  P:=RegisterProperty('AdditionalProperty', 'AdditionalProperty', [], '', 1, 4);
  P:=RegisterProperty('ItemVendorCode', 'ItemVendorCode', [], '', 1, 100);
  P:=RegisterProperty('ItemToRelease', 'ItemToRelease', [], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
  P:=RegisterProperty('ItemCharact', 'ItemCharact', [], '', 1, 1000);
  P:=RegisterProperty('ItemArticle', 'ItemArticle', [], '', 1, 50);
  P:=RegisterProperty('ItemKind', 'ItemKind', [], '', 1, 10);
  P:=RegisterProperty('ItemSeries', 'ItemSeries', [], '', 1, 50);
  P:=RegisterProperty('Gtin', 'Gtin', [], '', 14, 14);
  P:=RegisterProperty('CatalogCode', 'CatalogCode', [], '', 27, 27);
  P:=RegisterProperty('ItemTypeCode', 'ItemTypeCode', [], '', 1, 10);
  P:=RegisterProperty('ProductTypeCode', 'ProductTypeCode', [], '', -1, -1);
    P.TotalDigits := 3;
    P.FractionDigits := 0;
  P:=RegisterProperty('Okpd', 'Okpd', [], '', 2, 12);
  P:=RegisterProperty('ItemAdditionalInfo', 'ItemAdditionalInfo', [], '', 5, 5);
end;

procedure TItem.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FCustomsDeclarations:=Item_CustomsDeclarations.Create;
  FAdditionalInfos:=Item_AdditionalInfos.Create;
  FItemTracingInfos:=Item_ItemTracingInfos.Create;
  FItemIdentificationNumbers:=Item_ItemIdentificationNumbers.Create;
  FAccompanyingDocuments:=Item_AccompanyingDocuments.Create;
  FDepreciationInfo:=Item_DepreciationInfo.Create;
  FStateSystemItemInfos:=Item_StateSystemItemInfos.Create;
end;

destructor TItem.Destroy;
begin
  FCustomsDeclarations.Free;
  FAdditionalInfos.Free;
  FItemTracingInfos.Free;
  FItemIdentificationNumbers.Free;
  FAccompanyingDocuments.Free;
  FDepreciationInfo.Free;
  FStateSystemItemInfos.Free;
  inherited Destroy;
end;

constructor TItem.Create;
begin
  inherited Create;
  WithoutVat:='false';
  WithoutRestoredVat:='false';
end;

  {  TCustomsDeclarations  }
procedure TCustomsDeclarations.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CustomsDeclaration', 'CustomsDeclaration', [], '', -1, -1);
end;

procedure TCustomsDeclarations.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FCustomsDeclaration:=TXSDCustomsDeclarations_CustomsDeclarationArray.Create;
end;

destructor TCustomsDeclarations.Destroy;
begin
  FCustomsDeclaration.Free;
  inherited Destroy;
end;

constructor TCustomsDeclarations.Create;
begin
  inherited Create;
end;

  {  TCustomsDeclaration  }
procedure TCustomsDeclaration.SetCountry(AValue: String);
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
  P:=RegisterProperty('Country', 'Country', [], '', 3, 3);
  P:=RegisterProperty('DeclarationNumber', 'DeclarationNumber', [], '', 1, 1000);
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

  {  TAdditionalInfos  }
procedure TAdditionalInfos.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', -1, -1);
end;

procedure TAdditionalInfos.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAdditionalInfo:=TAdditionalInfoList.Create;
end;

destructor TAdditionalInfos.Destroy;
begin
  FAdditionalInfo.Free;
  inherited Destroy;
end;

constructor TAdditionalInfos.Create;
begin
  inherited Create;
end;

  {  TItemTracingInfos  }
procedure TItemTracingInfos.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ItemTracingInfo', 'ItemTracingInfo', [], '', -1, -1);
end;

procedure TItemTracingInfos.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItemTracingInfo:=TXSDItemTracingInfos_ItemTracingInfoArray.Create;
end;

destructor TItemTracingInfos.Destroy;
begin
  FItemTracingInfo.Free;
  inherited Destroy;
end;

constructor TItemTracingInfos.Create;
begin
  inherited Create;
end;

  {  TItemTracingInfo  }
procedure TItemTracingInfo.SetRegNumberUnit(AValue: String);
begin
  CheckStrMinSize('RegNumberUnit', AValue);
  CheckStrMaxSize('RegNumberUnit', AValue);
  FRegNumberUnit:=AValue;
  ModifiedProperty('RegNumberUnit');
end;

procedure TItemTracingInfo.SetUnit1(AValue: Tokei);
begin
  CheckStrMinSize('Unit1', AValue);
  CheckStrMaxSize('Unit1', AValue);
  FUnit1:=AValue;
  ModifiedProperty('Unit1');
end;

procedure TItemTracingInfo.SetQuantity(AValue: Double);
begin
  FQuantity:=AValue;
  ModifiedProperty('Quantity');
end;

procedure TItemTracingInfo.SetPriceWithVatExcluded(AValue: Int64);
begin
  FPriceWithVatExcluded:=AValue;
  ModifiedProperty('PriceWithVatExcluded');
end;

procedure TItemTracingInfo.SetItemAddInfo(AValue: Tstring255);
begin
  CheckStrMinSize('ItemAddInfo', AValue);
  CheckStrMaxSize('ItemAddInfo', AValue);
  FItemAddInfo:=AValue;
  ModifiedProperty('ItemAddInfo');
end;

procedure TItemTracingInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('RegNumberUnit', 'RegNumberUnit', [xsaRequared], '', 27, 29);
  P:=RegisterProperty('Unit1', 'Unit', [xsaRequared], '', 3, 4);
  P:=RegisterProperty('Quantity', 'Quantity', [xsaRequared], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 11;
  P:=RegisterProperty('PriceWithVatExcluded', 'PriceWithVatExcluded', [xsaRequared], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 0;
  P:=RegisterProperty('ItemAddInfo', 'ItemAddInfo', [], '', 1, 255);
end;

procedure TItemTracingInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TItemTracingInfo.Destroy;
begin
  inherited Destroy;
end;

constructor TItemTracingInfo.Create;
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
  FItemIdentificationNumber:=TXSDItemIdentificationNumbers_ItemIdentificationNumberArray.Create;
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

  {  TItemIdentificationNumber  }
procedure TItemIdentificationNumber.SetUnit1(AValue: Tstring255);
begin
  CheckStrMinSize('Unit1', AValue);
  CheckStrMaxSize('Unit1', AValue);
  FUnit1:=AValue;
  ModifiedProperty('Unit1');
end;

procedure TItemIdentificationNumber.SetPackageId(AValue: Tstring255);
begin
  CheckStrMinSize('PackageId', AValue);
  CheckStrMaxSize('PackageId', AValue);
  FPackageId:=AValue;
  ModifiedProperty('PackageId');
end;

procedure TItemIdentificationNumber.SetTransPackageId(AValue: Tstring255);
begin
  CheckStrMinSize('TransPackageId', AValue);
  CheckStrMaxSize('TransPackageId', AValue);
  FTransPackageId:=AValue;
  ModifiedProperty('TransPackageId');
end;

procedure TItemIdentificationNumber.SetQuantityMark(AValue: Int64);
begin
  FQuantityMark:=AValue;
  ModifiedProperty('QuantityMark');
end;

procedure TItemIdentificationNumber.SetBatchMarkCode(AValue: Tstring55);
begin
  CheckStrMinSize('BatchMarkCode', AValue);
  CheckStrMaxSize('BatchMarkCode', AValue);
  FBatchMarkCode:=AValue;
  ModifiedProperty('BatchMarkCode');
end;

procedure TItemIdentificationNumber.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Unit1', 'Unit', [xsaSimpleObject], '', 1, 255);
  P:=RegisterProperty('PackageId', 'PackageId', [xsaSimpleObject], '', 1, 255);
  P:=RegisterProperty('TransPackageId', 'TransPackageId', [], '', 1, 255);
  P:=RegisterProperty('QuantityMark', 'QuantityMark', [], '', -1, -1);
    P.TotalDigits := 26;
    P.FractionDigits := 0;
  P:=RegisterProperty('BatchMarkCode', 'BatchMarkCode', [], '', 1, 55);
end;

procedure TItemIdentificationNumber.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TItemIdentificationNumber.Destroy;
begin
  inherited Destroy;
end;

constructor TItemIdentificationNumber.Create;
begin
  inherited Create;
end;

  {  TAccompanyingDocuments  }
procedure TAccompanyingDocuments.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('AccompanyingDocument', 'AccompanyingDocument', [], '', -1, -1);
end;

procedure TAccompanyingDocuments.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAccompanyingDocument:=TDocumentRequisitesTypeList.Create;
end;

destructor TAccompanyingDocuments.Destroy;
begin
  FAccompanyingDocument.Free;
  inherited Destroy;
end;

constructor TAccompanyingDocuments.Create;
begin
  inherited Create;
end;

  {  TDepreciationInfo  }
procedure TDepreciationInfo.SetDepreciationGroup(AValue: Tstring2);
begin
  CheckStrMinSize('DepreciationGroup', AValue);
  CheckStrMaxSize('DepreciationGroup', AValue);
  FDepreciationGroup:=AValue;
  ModifiedProperty('DepreciationGroup');
end;

procedure TDepreciationInfo.SetOkof(AValue: Tstring16);
begin
  CheckStrMinSize('Okof', AValue);
  CheckStrMaxSize('Okof', AValue);
  FOkof:=AValue;
  ModifiedProperty('Okof');
end;

procedure TDepreciationInfo.SetUsefulPeriod(AValue: Tstring3);
begin
  CheckStrMinSize('UsefulPeriod', AValue);
  CheckStrMaxSize('UsefulPeriod', AValue);
  FUsefulPeriod:=AValue;
  ModifiedProperty('UsefulPeriod');
end;

procedure TDepreciationInfo.SetActualPeriod(AValue: Int64);
begin
  FActualPeriod:=AValue;
  ModifiedProperty('ActualPeriod');
end;

procedure TDepreciationInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('DepreciationGroup', 'DepreciationGroup', [xsaRequared], '', 1, 2);
  P:=RegisterProperty('Okof', 'Okof', [xsaRequared], '', 1, 16);
  P:=RegisterProperty('UsefulPeriod', 'UsefulPeriod', [xsaRequared], '', 1, 3);
  P:=RegisterProperty('ActualPeriod', 'ActualPeriod', [xsaRequared], '', -1, -1);
    P.TotalDigits := 3;
    P.FractionDigits := 0;
end;

procedure TDepreciationInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TDepreciationInfo.Destroy;
begin
  inherited Destroy;
end;

constructor TDepreciationInfo.Create;
begin
  inherited Create;
end;

  {  TStateSystemItemInfos  }
procedure TStateSystemItemInfos.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('StateSystemItemInfo', 'StateSystemItemInfo', [], '', -1, -1);
end;

procedure TStateSystemItemInfos.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FStateSystemItemInfo:=TXSDStateSystemItemInfos_StateSystemItemInfoArray.Create;
end;

destructor TStateSystemItemInfos.Destroy;
begin
  FStateSystemItemInfo.Free;
  inherited Destroy;
end;

constructor TStateSystemItemInfos.Create;
begin
  inherited Create;
end;

  {  TStateSystemItemInfo  }
procedure TStateSystemItemInfo.SetStateSystemId(AValue: TXSDStringArray);
var
  V:Tstring255;
begin
  for V in AValue do
  begin
    CheckStrMinSize('StateSystemId', V);
    CheckStrMaxSize('StateSystemId', V);
  end;
  FStateSystemId:=AValue;
  ModifiedProperty('StateSystemId');
end;

procedure TStateSystemItemInfo.SetStateSystemName(AValue: Tstring255);
begin
  CheckStrMinSize('StateSystemName', AValue);
  CheckStrMaxSize('StateSystemName', AValue);
  FStateSystemName:=AValue;
  ModifiedProperty('StateSystemName');
end;

procedure TStateSystemItemInfo.SetAccountingUnit(AValue: Tstring255);
begin
  CheckStrMinSize('AccountingUnit', AValue);
  CheckStrMaxSize('AccountingUnit', AValue);
  FAccountingUnit:=AValue;
  ModifiedProperty('AccountingUnit');
end;

procedure TStateSystemItemInfo.SetOtherInfo(AValue: Tstring1000);
begin
  CheckStrMinSize('OtherInfo', AValue);
  CheckStrMaxSize('OtherInfo', AValue);
  FOtherInfo:=AValue;
  ModifiedProperty('OtherInfo');
end;

procedure TStateSystemItemInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('StateSystemId', 'StateSystemId', [xsaSimpleObject], '', 1, 255);
  P:=RegisterProperty('StateSystemName', 'StateSystemName', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('AccountingUnit', 'AccountingUnit', [], '', 1, 255);
  P:=RegisterProperty('OtherInfo', 'OtherInfo', [], '', 1, 1000);
end;

procedure TStateSystemItemInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TStateSystemItemInfo.Destroy;
begin
  inherited Destroy;
end;

constructor TStateSystemItemInfo.Create;
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

procedure TTransferInfo.SetInkoterms(AValue: Tstring3f);
begin
  CheckStrMinSize('Inkoterms', AValue);
  CheckStrMaxSize('Inkoterms', AValue);
  FInkoterms:=AValue;
  ModifiedProperty('Inkoterms');
end;

procedure TTransferInfo.SetVersionInkoterms(AValue: Tstring4f);
begin
  CheckStrMinSize('VersionInkoterms', AValue);
  CheckStrMaxSize('VersionInkoterms', AValue);
  FVersionInkoterms:=AValue;
  ModifiedProperty('VersionInkoterms');
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
  P:=RegisterProperty('AdditionalInfoId', 'AdditionalInfoId', [], '', -1, -1);
  P:=RegisterProperty('Employee', 'Employee', [], '', -1, -1);
  P:=RegisterProperty('OtherIssuer', 'OtherIssuer', [], '', -1, -1);
  P:=RegisterProperty('CreatedThingTransferDocument', 'CreatedThingTransferDocument', [], '', -1, -1);
  P:=RegisterProperty('OperationInfo', 'OperationInfo', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('OperationType', 'OperationType', [], '', 1, 255);
  P:=RegisterProperty('TransferDate', 'TransferDate', [], '', 10, 10);
  P:=RegisterProperty('TransferStartDate', 'TransferStartDate', [], '', 10, 10);
  P:=RegisterProperty('TransferEndDate', 'TransferEndDate', [], '', 10, 10);
  P:=RegisterProperty('TransferTextInfo', 'TransferTextInfo', [], '', 1, 1000);
  P:=RegisterProperty('Inkoterms', 'Inkoterms', [], '', 3, 3);
  P:=RegisterProperty('VersionInkoterms', 'VersionInkoterms', [], '', 4, 4);
  P:=RegisterProperty('CreatedThingTransferDate', 'CreatedThingTransferDate', [], '', 10, 10);
  P:=RegisterProperty('CreatedThingInfo', 'CreatedThingInfo', [], '', 1, 1000);
end;

procedure TTransferInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FTransferBases:=TransferInfo_TransferBases.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FEmployee:=TEmployeeUtd970.Create;
  FOtherIssuer:=TOtherIssuerUtd970.Create;
  FCreatedThingTransferDocument:=TDocumentRequisitesType.Create;
end;

destructor TTransferInfo.Destroy;
begin
  FTransferBases.Free;
  FAdditionalInfoId.Free;
  FEmployee.Free;
  FOtherIssuer.Free;
  FCreatedThingTransferDocument.Free;
  inherited Destroy;
end;

constructor TTransferInfo.Create;
begin
  inherited Create;
end;

  {  TTransferBases  }
procedure TTransferBases.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TransferBase', 'TransferBase', [], '', -1, -1);
end;

procedure TTransferBases.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FTransferBase:=TDocumentRequisitesTypeList.Create;
end;

destructor TTransferBases.Destroy;
begin
  FTransferBase.Free;
  inherited Destroy;
end;

constructor TTransferBases.Create;
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

  {  TPaymentDocumentInfoUtd970  }
procedure TPaymentDocumentInfoUtd970.SetDate(AValue: Tdate1);
begin
  CheckStrMinSize('Date', AValue);
  CheckStrMaxSize('Date', AValue);
  FDate:=AValue;
  ModifiedProperty('Date');
end;

procedure TPaymentDocumentInfoUtd970.SetNumber(AValue: Tstring30);
begin
  CheckStrMinSize('Number', AValue);
  CheckStrMaxSize('Number', AValue);
  FNumber:=AValue;
  ModifiedProperty('Number');
end;

procedure TPaymentDocumentInfoUtd970.SetTotal(AValue: Double);
begin
  FTotal:=AValue;
  ModifiedProperty('Total');
end;

procedure TPaymentDocumentInfoUtd970.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Date', 'Date', [], '', 10, 10);
  P:=RegisterProperty('Number', 'Number', [], '', 1, 30);
  P:=RegisterProperty('Total', 'Total', [], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
end;

procedure TPaymentDocumentInfoUtd970.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TPaymentDocumentInfoUtd970.Destroy;
begin
  inherited Destroy;
end;

constructor TPaymentDocumentInfoUtd970.Create;
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

  {  TExtendedOrganizationInfo_ReconciliationAct  }
procedure TExtendedOrganizationInfo_ReconciliationAct.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrganizationDetails', 'OrganizationDetails', [], '', -1, -1);
  P:=RegisterProperty('OrganizationReference', 'OrganizationReference', [], '', -1, -1);
end;

procedure TExtendedOrganizationInfo_ReconciliationAct.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TExtendedOrganizationDetails_ReconciliationAct.Create;
  FOrganizationReference:=TExtendedOrganizationReference_ReconciliationAct.Create;
end;

destructor TExtendedOrganizationInfo_ReconciliationAct.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

constructor TExtendedOrganizationInfo_ReconciliationAct.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationDetails_ManualFilling_ReconciliationAct  }
procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.SetOkpo(AValue: Tstring10);
begin
  CheckStrMinSize('Okpo', AValue);
  CheckStrMaxSize('Okpo', AValue);
  FOkpo:=AValue;
  ModifiedProperty('Okpo');
end;

procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.SetShortOrgName(AValue: Tstring255);
begin
  CheckStrMinSize('ShortOrgName', AValue);
  CheckStrMaxSize('ShortOrgName', AValue);
  FShortOrgName:=AValue;
  ModifiedProperty('ShortOrgName');
end;

procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.SetDepartment(AValue: Tstring1000);
begin
  CheckStrMinSize('Department', AValue);
  CheckStrMaxSize('Department', AValue);
  FDepartment:=AValue;
  ModifiedProperty('Department');
end;

procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.SetLegalEntityId(AValue: Tstring255);
begin
  CheckStrMinSize('LegalEntityId', AValue);
  CheckStrMaxSize('LegalEntityId', AValue);
  FLegalEntityId:=AValue;
  ModifiedProperty('LegalEntityId');
end;

procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.SetOrganizationOrPersonInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OrganizationOrPersonInfo', AValue);
  CheckStrMaxSize('OrganizationOrPersonInfo', AValue);
  FOrganizationOrPersonInfo:=AValue;
  ModifiedProperty('OrganizationOrPersonInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.SetOrganizationAdditionalInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OrganizationAdditionalInfo', AValue);
  CheckStrMaxSize('OrganizationAdditionalInfo', AValue);
  FOrganizationAdditionalInfo:=AValue;
  ModifiedProperty('OrganizationAdditionalInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.SetPhone(AValue: Tstring255);
begin
  CheckStrMinSize('Phone', AValue);
  CheckStrMaxSize('Phone', AValue);
  FPhone:=AValue;
  ModifiedProperty('Phone');
end;

procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.SetEmail(AValue: Tstring255);
begin
  CheckStrMinSize('Email', AValue);
  CheckStrMaxSize('Email', AValue);
  FEmail:=AValue;
  ModifiedProperty('Email');
end;

procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.SetOtherContactInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OtherContactInfo', AValue);
  CheckStrMaxSize('OtherContactInfo', AValue);
  FOtherContactInfo:=AValue;
  ModifiedProperty('OtherContactInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Okpo', 'Okpo', [], '', 1, 10);
  P:=RegisterProperty('ShortOrgName', 'ShortOrgName', [], '', 1, 255);
  P:=RegisterProperty('Department', 'Department', [], '', 1, 1000);
  P:=RegisterProperty('LegalEntityId', 'LegalEntityId', [], '', 1, 255);
  P:=RegisterProperty('OrganizationOrPersonInfo', 'OrganizationOrPersonInfo', [], '', 1, 255);
  P:=RegisterProperty('OrganizationAdditionalInfo', 'OrganizationAdditionalInfo', [], '', 1, 255);
  P:=RegisterProperty('Phone', 'Phone', [], '', 1, 255);
  P:=RegisterProperty('Email', 'Email', [], '', 1, 255);
  P:=RegisterProperty('OtherContactInfo', 'OtherContactInfo', [], '', 1, 255);
end;

procedure TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedOrganizationDetails_ManualFilling_ReconciliationAct.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationInfoUtd970  }
procedure TExtendedOrganizationInfoUtd970.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrganizationDetails', 'OrganizationDetails', [], '', -1, -1);
  P:=RegisterProperty('OrganizationReference', 'OrganizationReference', [], '', -1, -1);
end;

procedure TExtendedOrganizationInfoUtd970.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TExtendedOrganizationDetailsUtd970.Create;
  FOrganizationReference:=TExtendedOrganizationReferenceUtd970.Create;
end;

destructor TExtendedOrganizationInfoUtd970.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

constructor TExtendedOrganizationInfoUtd970.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationDetails_ManualFilling_Utd970  }
procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetOkpo(AValue: Tstring10);
begin
  CheckStrMinSize('Okpo', AValue);
  CheckStrMaxSize('Okpo', AValue);
  FOkpo:=AValue;
  ModifiedProperty('Okpo');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetOkopf(AValue: String);
begin
  CheckStrMinSize('Okopf', AValue);
  CheckStrMaxSize('Okopf', AValue);
  FOkopf:=AValue;
  ModifiedProperty('Okopf');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetFullNameOkopf(AValue: String);
begin
  CheckStrMinSize('FullNameOkopf', AValue);
  CheckStrMaxSize('FullNameOkopf', AValue);
  FFullNameOkopf:=AValue;
  ModifiedProperty('FullNameOkopf');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetDepartment(AValue: Tstring500);
begin
  CheckStrMinSize('Department', AValue);
  CheckStrMaxSize('Department', AValue);
  FDepartment:=AValue;
  ModifiedProperty('Department');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetOrganizationAdditionalInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OrganizationAdditionalInfo', AValue);
  CheckStrMaxSize('OrganizationAdditionalInfo', AValue);
  FOrganizationAdditionalInfo:=AValue;
  ModifiedProperty('OrganizationAdditionalInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetShortOrgName(AValue: Tstring510);
begin
  CheckStrMinSize('ShortOrgName', AValue);
  CheckStrMaxSize('ShortOrgName', AValue);
  FShortOrgName:=AValue;
  ModifiedProperty('ShortOrgName');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetOgrn(AValue: Togrn);
begin
  CheckStrMinSize('Ogrn', AValue);
  CheckStrMaxSize('Ogrn', AValue);
  FOgrn:=AValue;
  ModifiedProperty('Ogrn');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetOgrnDate(AValue: Tdate1);
begin
  CheckStrMinSize('OgrnDate', AValue);
  CheckStrMaxSize('OgrnDate', AValue);
  FOgrnDate:=AValue;
  ModifiedProperty('OgrnDate');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetIndividualEntityRegistrationCertificate(AValue: Tstring100);
begin
  CheckStrMinSize('IndividualEntityRegistrationCertificate', AValue);
  CheckStrMaxSize('IndividualEntityRegistrationCertificate', AValue);
  FIndividualEntityRegistrationCertificate:=AValue;
  ModifiedProperty('IndividualEntityRegistrationCertificate');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetPersonStatusId(AValue: String);
begin
  CheckLockupValue('PersonStatusId', AValue);
  CheckStrMinSize('PersonStatusId', AValue);
  CheckStrMaxSize('PersonStatusId', AValue);
  FPersonStatusId:=AValue;
  ModifiedProperty('PersonStatusId');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetOtherContactInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OtherContactInfo', AValue);
  CheckStrMaxSize('OtherContactInfo', AValue);
  FOtherContactInfo:=AValue;
  ModifiedProperty('OtherContactInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetCorrespondentAccount(AValue: Tstring20);
begin
  CheckStrMinSize('CorrespondentAccount', AValue);
  CheckStrMaxSize('CorrespondentAccount', AValue);
  FCorrespondentAccount:=AValue;
  ModifiedProperty('CorrespondentAccount');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetBankAccountNumber(AValue: Tstring20);
begin
  CheckStrMinSize('BankAccountNumber', AValue);
  CheckStrMaxSize('BankAccountNumber', AValue);
  FBankAccountNumber:=AValue;
  ModifiedProperty('BankAccountNumber');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetBankName(AValue: Tstring1000);
begin
  CheckStrMinSize('BankName', AValue);
  CheckStrMaxSize('BankName', AValue);
  FBankName:=AValue;
  ModifiedProperty('BankName');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.SetBankId(AValue: Tstring9f);
begin
  CheckStrMinSize('BankId', AValue);
  CheckStrMaxSize('BankId', AValue);
  FBankId:=AValue;
  ModifiedProperty('BankId');
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Phones', 'Phones', [], '', -1, -1);
  P:=RegisterProperty('Emails', 'Emails', [], '', -1, -1);
  P:=RegisterProperty('Okpo', 'Okpo', [], '', 1, 10);
  P:=RegisterProperty('Okopf', 'Okopf', [], '', 2, 5);
  P:=RegisterProperty('FullNameOkopf', 'FullNameOkopf', [], '', 4, 255);
  P:=RegisterProperty('Department', 'Department', [], '', 1, 500);
  P:=RegisterProperty('OrganizationAdditionalInfo', 'OrganizationAdditionalInfo', [], '', 1, 255);
  P:=RegisterProperty('ShortOrgName', 'ShortOrgName', [], '', 1, 510);
  P:=RegisterProperty('Ogrn', 'Ogrn', [], '', 13, 15);
  P:=RegisterProperty('OgrnDate', 'OgrnDate', [], '', 10, 10);
  P:=RegisterProperty('IndividualEntityRegistrationCertificate', 'IndividualEntityRegistrationCertificate', [], '', 1, 100);
  P:=RegisterProperty('PersonStatusId', 'PersonStatusId', [], '', 1, 1);
    P.ValidList.Add('0');
    P.ValidList.Add('1');
  P:=RegisterProperty('OtherContactInfo', 'OtherContactInfo', [], '', 1, 255);
  P:=RegisterProperty('CorrespondentAccount', 'CorrespondentAccount', [], '', 1, 20);
  P:=RegisterProperty('BankAccountNumber', 'BankAccountNumber', [], '', 1, 20);
  P:=RegisterProperty('BankName', 'BankName', [], '', 1, 1000);
  P:=RegisterProperty('BankId', 'BankId', [], '', 9, 9);
end;

procedure TExtendedOrganizationDetails_ManualFilling_Utd970.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FPhones:=ExtendedOrganizationDetails_ManualFilling_Utd970_Phones.Create;
  FEmails:=ExtendedOrganizationDetails_ManualFilling_Utd970_Emails.Create;
end;

destructor TExtendedOrganizationDetails_ManualFilling_Utd970.Destroy;
begin
  FPhones.Free;
  FEmails.Free;
  inherited Destroy;
end;

constructor TExtendedOrganizationDetails_ManualFilling_Utd970.Create;
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

  {  TExtendedOrganizationDetails_ReconciliationAct  }
procedure TExtendedOrganizationDetails_ReconciliationAct.SetOrgName(AValue: Tstring1000);
begin
  CheckStrMinSize('OrgName', AValue);
  CheckStrMaxSize('OrgName', AValue);
  FOrgName:=AValue;
  ModifiedProperty('OrgName');
end;

procedure TExtendedOrganizationDetails_ReconciliationAct.SetInn(AValue: Tstring60);
begin
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TExtendedOrganizationDetails_ReconciliationAct.SetKpp(AValue: Tstring1000);
begin
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  FKpp:=AValue;
  ModifiedProperty('Kpp');
end;

procedure TExtendedOrganizationDetails_ReconciliationAct.SetFnsParticipantId(AValue: Tstring1000);
begin
  CheckStrMinSize('FnsParticipantId', AValue);
  CheckStrMaxSize('FnsParticipantId', AValue);
  FFnsParticipantId:=AValue;
  ModifiedProperty('FnsParticipantId');
end;

procedure TExtendedOrganizationDetails_ReconciliationAct.SetOrgType(AValue: TOrganizationType_DatabaseOrder);
begin
  CheckLockupValue('OrgType', AValue);
  FOrgType:=AValue;
  ModifiedProperty('OrgType');
end;

procedure TExtendedOrganizationDetails_ReconciliationAct.SetOgrn(AValue: String);
begin
  CheckStrMinSize('Ogrn', AValue);
  CheckStrMaxSize('Ogrn', AValue);
  FOgrn:=AValue;
  ModifiedProperty('Ogrn');
end;

procedure TExtendedOrganizationDetails_ReconciliationAct.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrgName', 'OrgName', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('Inn', 'Inn', [], '', 1, 60);
  P:=RegisterProperty('Kpp', 'Kpp', [], '', 1, 1000);
  P:=RegisterProperty('FnsParticipantId', 'FnsParticipantId', [], '', 1, 1000);
  P:=RegisterProperty('OrgType', 'OrgType', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
  P:=RegisterProperty('Ogrn', 'Ogrn', [], '', 13, 15);
end;

procedure TExtendedOrganizationDetails_ReconciliationAct.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationDetails_ReconciliationAct.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedOrganizationDetails_ReconciliationAct.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationReference_ReconciliationAct  }
procedure TExtendedOrganizationReference_ReconciliationAct.SetBoxId(AValue: Tguid);
begin
  FBoxId:=AValue;
  ModifiedProperty('BoxId');
end;

procedure TExtendedOrganizationReference_ReconciliationAct.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BoxId', 'BoxId', [xsaRequared], '', -1, -1);
end;

procedure TExtendedOrganizationReference_ReconciliationAct.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationReference_ReconciliationAct.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedOrganizationReference_ReconciliationAct.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationDetailsUtd970  }
procedure TExtendedOrganizationDetailsUtd970.SetOrgName(AValue: Tstring1000);
begin
  CheckStrMinSize('OrgName', AValue);
  CheckStrMaxSize('OrgName', AValue);
  FOrgName:=AValue;
  ModifiedProperty('OrgName');
end;

procedure TExtendedOrganizationDetailsUtd970.SetInn(AValue: Tinn);
begin
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TExtendedOrganizationDetailsUtd970.SetKpp(AValue: Tkpp);
begin
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  FKpp:=AValue;
  ModifiedProperty('Kpp');
end;

procedure TExtendedOrganizationDetailsUtd970.SetFnsParticipantId(AValue: Tstring1000);
begin
  CheckStrMinSize('FnsParticipantId', AValue);
  CheckStrMaxSize('FnsParticipantId', AValue);
  FFnsParticipantId:=AValue;
  ModifiedProperty('FnsParticipantId');
end;

procedure TExtendedOrganizationDetailsUtd970.SetOrgType(AValue: TOrganizationType_DatabaseOrder);
begin
  CheckLockupValue('OrgType', AValue);
  FOrgType:=AValue;
  ModifiedProperty('OrgType');
end;

procedure TExtendedOrganizationDetailsUtd970.SetStatusId(AValue: String);
begin
  CheckLockupValue('StatusId', AValue);
  FStatusId:=AValue;
  ModifiedProperty('StatusId');
end;

procedure TExtendedOrganizationDetailsUtd970.SetLegalEntityId(AValue: Tstring255);
begin
  CheckStrMinSize('LegalEntityId', AValue);
  CheckStrMaxSize('LegalEntityId', AValue);
  FLegalEntityId:=AValue;
  ModifiedProperty('LegalEntityId');
end;

procedure TExtendedOrganizationDetailsUtd970.SetCountry(AValue: String);
begin
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TExtendedOrganizationDetailsUtd970.SetOrganizationOrPersonInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OrganizationOrPersonInfo', AValue);
  CheckStrMaxSize('OrganizationOrPersonInfo', AValue);
  FOrganizationOrPersonInfo:=AValue;
  ModifiedProperty('OrganizationOrPersonInfo');
end;

procedure TExtendedOrganizationDetailsUtd970.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Address', 'Address', [], '', -1, -1);
  P:=RegisterProperty('OrgName', 'OrgName', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('Inn', 'Inn', [], '', 10, 12);
  P:=RegisterProperty('Kpp', 'Kpp', [], '', 9, 9);
  P:=RegisterProperty('FnsParticipantId', 'FnsParticipantId', [], '', 1, 1000);
  P:=RegisterProperty('OrgType', 'OrgType', [xsaRequared], '', -1, -1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
  P:=RegisterProperty('StatusId', 'StatusId', [], '', -1, -1);
    P.ValidList.Add('LegalEntity');
    P.ValidList.Add('PhysicalPerson');
  P:=RegisterProperty('LegalEntityId', 'LegalEntityId', [], '', 1, 255);
  P:=RegisterProperty('Country', 'Country', [], '', 3, 3);
  P:=RegisterProperty('OrganizationOrPersonInfo', 'OrganizationOrPersonInfo', [], '', 1, 255);
end;

procedure TExtendedOrganizationDetailsUtd970.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAddress:=TAddressUtd970.Create;
end;

destructor TExtendedOrganizationDetailsUtd970.Destroy;
begin
  FAddress.Free;
  inherited Destroy;
end;

constructor TExtendedOrganizationDetailsUtd970.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationReferenceUtd970  }
procedure TExtendedOrganizationReferenceUtd970.SetBoxId(AValue: Tguid);
begin
  FBoxId:=AValue;
  ModifiedProperty('BoxId');
end;

procedure TExtendedOrganizationReferenceUtd970.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BoxId', 'BoxId', [xsaRequared], '', -1, -1);
end;

procedure TExtendedOrganizationReferenceUtd970.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationReferenceUtd970.Destroy;
begin
  inherited Destroy;
end;

constructor TExtendedOrganizationReferenceUtd970.Create;
begin
  inherited Create;
end;

  {  TPhones  }
procedure TPhones.SetPhone(AValue: TXSDStringArray);
var
  V:Tstring255;
begin
  for V in AValue do
  begin
    CheckStrMinSize('Phone', V);
    CheckStrMaxSize('Phone', V);
  end;
  FPhone:=AValue;
  ModifiedProperty('Phone');
end;

procedure TPhones.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Phone', 'Phone', [xsaSimpleObject], '', 1, 255);
end;

procedure TPhones.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TPhones.Destroy;
begin
  inherited Destroy;
end;

constructor TPhones.Create;
begin
  inherited Create;
end;

  {  TEmails  }
procedure TEmails.SetEmail(AValue: TXSDStringArray);
var
  V:Tstring255;
begin
  for V in AValue do
  begin
    CheckStrMinSize('Email', V);
    CheckStrMaxSize('Email', V);
  end;
  FEmail:=AValue;
  ModifiedProperty('Email');
end;

procedure TEmails.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Email', 'Email', [xsaSimpleObject], '', 1, 255);
end;

procedure TEmails.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TEmails.Destroy;
begin
  inherited Destroy;
end;

constructor TEmails.Create;
begin
  inherited Create;
end;

  {  TExtendedOrganizationDetailsWithHyphens  }
procedure TExtendedOrganizationDetailsWithHyphens.SetHyphenInn(AValue: String);
begin
  CheckLockupValue('HyphenInn', AValue);
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

  {  TAddressUtd970  }
procedure TAddressUtd970.SetGln(AValue: Tstring13f);
begin
  CheckStrMinSize('Gln', AValue);
  CheckStrMaxSize('Gln', AValue);
  FGln:=AValue;
  ModifiedProperty('Gln');
end;

procedure TAddressUtd970.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('RussianAddress', 'RussianAddress', [], '', -1, -1);
  P:=RegisterProperty('GarAddress', 'GarAddress', [], '', -1, -1);
  P:=RegisterProperty('ForeignAddress', 'ForeignAddress', [], '', -1, -1);
  P:=RegisterProperty('Gln', 'Gln', [], '', 13, 13);
end;

procedure TAddressUtd970.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FRussianAddress:=TRussianAddressUtd970.Create;
  FGarAddress:=TGarAddress.Create;
  FForeignAddress:=TForeignAddressUtd970.Create;
end;

destructor TAddressUtd970.Destroy;
begin
  FRussianAddress.Free;
  FGarAddress.Free;
  FForeignAddress.Free;
  inherited Destroy;
end;

constructor TAddressUtd970.Create;
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

  {  TRussianAddressUtd970  }
procedure TRussianAddressUtd970.SetZipCode(AValue: String);
begin
  CheckStrMinSize('ZipCode', AValue);
  CheckStrMaxSize('ZipCode', AValue);
  FZipCode:=AValue;
  ModifiedProperty('ZipCode');
end;

procedure TRussianAddressUtd970.SetRegion(AValue: String);
begin
  CheckStrMinSize('Region', AValue);
  CheckStrMaxSize('Region', AValue);
  FRegion:=AValue;
  ModifiedProperty('Region');
end;

procedure TRussianAddressUtd970.SetTerritory(AValue: Tstring255);
begin
  CheckStrMinSize('Territory', AValue);
  CheckStrMaxSize('Territory', AValue);
  FTerritory:=AValue;
  ModifiedProperty('Territory');
end;

procedure TRussianAddressUtd970.SetCity(AValue: Tstring255);
begin
  CheckStrMinSize('City', AValue);
  CheckStrMaxSize('City', AValue);
  FCity:=AValue;
  ModifiedProperty('City');
end;

procedure TRussianAddressUtd970.SetLocality(AValue: Tstring255);
begin
  CheckStrMinSize('Locality', AValue);
  CheckStrMaxSize('Locality', AValue);
  FLocality:=AValue;
  ModifiedProperty('Locality');
end;

procedure TRussianAddressUtd970.SetStreet(AValue: Tstring255);
begin
  CheckStrMinSize('Street', AValue);
  CheckStrMaxSize('Street', AValue);
  FStreet:=AValue;
  ModifiedProperty('Street');
end;

procedure TRussianAddressUtd970.SetBuilding(AValue: Tstring50);
begin
  CheckStrMinSize('Building', AValue);
  CheckStrMaxSize('Building', AValue);
  FBuilding:=AValue;
  ModifiedProperty('Building');
end;

procedure TRussianAddressUtd970.SetBlock(AValue: Tstring50);
begin
  CheckStrMinSize('Block', AValue);
  CheckStrMaxSize('Block', AValue);
  FBlock:=AValue;
  ModifiedProperty('Block');
end;

procedure TRussianAddressUtd970.SetApartment(AValue: Tstring50);
begin
  CheckStrMinSize('Apartment', AValue);
  CheckStrMaxSize('Apartment', AValue);
  FApartment:=AValue;
  ModifiedProperty('Apartment');
end;

procedure TRussianAddressUtd970.SetOtherInfo(AValue: Tstring1000);
begin
  CheckStrMinSize('OtherInfo', AValue);
  CheckStrMaxSize('OtherInfo', AValue);
  FOtherInfo:=AValue;
  ModifiedProperty('OtherInfo');
end;

procedure TRussianAddressUtd970.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ZipCode', 'ZipCode', [], '', 6, 6);
  P:=RegisterProperty('Region', 'Region', [xsaRequared], '', 2, 2);
  P:=RegisterProperty('Territory', 'Territory', [], '', 1, 255);
  P:=RegisterProperty('City', 'City', [], '', 1, 255);
  P:=RegisterProperty('Locality', 'Locality', [], '', 1, 255);
  P:=RegisterProperty('Street', 'Street', [], '', 1, 255);
  P:=RegisterProperty('Building', 'Building', [], '', 1, 50);
  P:=RegisterProperty('Block', 'Block', [], '', 1, 50);
  P:=RegisterProperty('Apartment', 'Apartment', [], '', 1, 50);
  P:=RegisterProperty('OtherInfo', 'OtherInfo', [], '', 1, 1000);
end;

procedure TRussianAddressUtd970.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TRussianAddressUtd970.Destroy;
begin
  inherited Destroy;
end;

constructor TRussianAddressUtd970.Create;
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

  {  TForeignAddressUtd970  }
procedure TForeignAddressUtd970.SetCountry(AValue: String);
begin
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TForeignAddressUtd970.SetAddress(AValue: Tstring1000);
begin
  CheckStrMinSize('Address', AValue);
  CheckStrMaxSize('Address', AValue);
  FAddress:=AValue;
  ModifiedProperty('Address');
end;

procedure TForeignAddressUtd970.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Country', 'Country', [xsaRequared], '', 3, 3);
  P:=RegisterProperty('Address', 'Address', [xsaRequared], '', 1, 1000);
end;

procedure TForeignAddressUtd970.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TForeignAddressUtd970.Destroy;
begin
  inherited Destroy;
end;

constructor TForeignAddressUtd970.Create;
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

  {  TGarAddress  }
procedure TGarAddress.SetAddressCode(AValue: Tstring36);
begin
  CheckStrMinSize('AddressCode', AValue);
  CheckStrMaxSize('AddressCode', AValue);
  FAddressCode:=AValue;
  ModifiedProperty('AddressCode');
end;

procedure TGarAddress.SetZipCode(AValue: String);
begin
  CheckStrMinSize('ZipCode', AValue);
  CheckStrMaxSize('ZipCode', AValue);
  FZipCode:=AValue;
  ModifiedProperty('ZipCode');
end;

procedure TGarAddress.SetRegion(AValue: String);
begin
  CheckStrMinSize('Region', AValue);
  CheckStrMaxSize('Region', AValue);
  FRegion:=AValue;
  ModifiedProperty('Region');
end;

procedure TGarAddress.SetLandPlot(AValue: Tstring50);
begin
  CheckStrMinSize('LandPlot', AValue);
  CheckStrMaxSize('LandPlot', AValue);
  FLandPlot:=AValue;
  ModifiedProperty('LandPlot');
end;

procedure TGarAddress.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('MunicipalTerritory', 'MunicipalTerritory', [], '', -1, -1);
  P:=RegisterProperty('UrbanSettlement', 'UrbanSettlement', [], '', -1, -1);
  P:=RegisterProperty('Locality', 'Locality', [], '', -1, -1);
  P:=RegisterProperty('ElementPlanningStructure', 'ElementPlanningStructure', [], '', -1, -1);
  P:=RegisterProperty('ElementRoadNetwork', 'ElementRoadNetwork', [], '', -1, -1);
  P:=RegisterProperty('Buildings', 'Buildings', [], '', -1, -1);
  P:=RegisterProperty('RoomBuilding', 'RoomBuilding', [], '', -1, -1);
  P:=RegisterProperty('RoomApartment', 'RoomApartment', [], '', -1, -1);
  P:=RegisterProperty('AddressCode', 'AddressCode', [xsaRequared], '', 1, 36);
  P:=RegisterProperty('ZipCode', 'ZipCode', [], '', 6, 6);
  P:=RegisterProperty('Region', 'Region', [xsaRequared], '', 2, 2);
  P:=RegisterProperty('LandPlot', 'LandPlot', [], '', 1, 50);
end;

procedure TGarAddress.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FMunicipalTerritory:=TAddressElement.Create;
  FUrbanSettlement:=TAddressElement.Create;
  FLocality:=TAddressElement.Create;
  FElementPlanningStructure:=TAddressElement.Create;
  FElementRoadNetwork:=TAddressElement.Create;
  FBuildings:=GarAddress_Buildings.Create;
  FRoomBuilding:=TAddressElement.Create;
  FRoomApartment:=TAddressElement.Create;
end;

destructor TGarAddress.Destroy;
begin
  FMunicipalTerritory.Free;
  FUrbanSettlement.Free;
  FLocality.Free;
  FElementPlanningStructure.Free;
  FElementRoadNetwork.Free;
  FBuildings.Free;
  FRoomBuilding.Free;
  FRoomApartment.Free;
  inherited Destroy;
end;

constructor TGarAddress.Create;
begin
  inherited Create;
end;

  {  TBuildings  }
procedure TBuildings.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Building', 'Building', [], '', -1, -1);
end;

procedure TBuildings.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FBuilding:=TAddressElementList.Create;
end;

destructor TBuildings.Destroy;
begin
  FBuilding.Free;
  inherited Destroy;
end;

constructor TBuildings.Create;
begin
  inherited Create;
end;

  {  TAddressElement  }
procedure TAddressElement.SetType1(AValue: Tstring50);
begin
  CheckStrMinSize('Type1', AValue);
  CheckStrMaxSize('Type1', AValue);
  FType1:=AValue;
  ModifiedProperty('Type1');
end;

procedure TAddressElement.SetNameOrNumber(AValue: Tstring255);
begin
  CheckStrMinSize('NameOrNumber', AValue);
  CheckStrMaxSize('NameOrNumber', AValue);
  FNameOrNumber:=AValue;
  ModifiedProperty('NameOrNumber');
end;

procedure TAddressElement.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Type1', 'Type', [xsaRequared], '', 1, 50);
  P:=RegisterProperty('NameOrNumber', 'NameOrNumber', [xsaRequared], '', 1, 255);
end;

procedure TAddressElement.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TAddressElement.Destroy;
begin
  inherited Destroy;
end;

constructor TAddressElement.Create;
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

  {  TEmployeeUtd970  }
procedure TEmployeeUtd970.SetPosition(AValue: Tstring255);
begin
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TEmployeeUtd970.SetEmployeeInfo(AValue: Tstring255);
begin
  CheckStrMinSize('EmployeeInfo', AValue);
  CheckStrMaxSize('EmployeeInfo', AValue);
  FEmployeeInfo:=AValue;
  ModifiedProperty('EmployeeInfo');
end;

procedure TEmployeeUtd970.SetLastName(AValue: Tstring60);
begin
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TEmployeeUtd970.SetFirstName(AValue: Tstring60);
begin
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TEmployeeUtd970.SetMiddleName(AValue: Tstring60);
begin
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TEmployeeUtd970.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Position', 'Position', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('EmployeeInfo', 'EmployeeInfo', [], '', 1, 255);
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 60);
end;

procedure TEmployeeUtd970.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TEmployeeUtd970.Destroy;
begin
  inherited Destroy;
end;

constructor TEmployeeUtd970.Create;
begin
  inherited Create;
end;

  {  TOtherIssuerUtd970  }
procedure TOtherIssuerUtd970.SetPosition(AValue: Tstring255);
begin
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TOtherIssuerUtd970.SetEmployeeInfo(AValue: Tstring255);
begin
  CheckStrMinSize('EmployeeInfo', AValue);
  CheckStrMaxSize('EmployeeInfo', AValue);
  FEmployeeInfo:=AValue;
  ModifiedProperty('EmployeeInfo');
end;

procedure TOtherIssuerUtd970.SetInn(AValue: Tinn);
begin
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TOtherIssuerUtd970.SetOrganizationName(AValue: Tstring255);
begin
  CheckStrMinSize('OrganizationName', AValue);
  CheckStrMaxSize('OrganizationName', AValue);
  FOrganizationName:=AValue;
  ModifiedProperty('OrganizationName');
end;

procedure TOtherIssuerUtd970.SetLastName(AValue: Tstring60);
begin
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TOtherIssuerUtd970.SetFirstName(AValue: Tstring60);
begin
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TOtherIssuerUtd970.SetMiddleName(AValue: Tstring60);
begin
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TOtherIssuerUtd970.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('EmployeeBase', 'EmployeeBase', [], '', -1, -1);
  P:=RegisterProperty('OrganizationBase', 'OrganizationBase', [], '', -1, -1);
  P:=RegisterProperty('Position', 'Position', [], '', 1, 255);
  P:=RegisterProperty('EmployeeInfo', 'EmployeeInfo', [], '', 1, 255);
  P:=RegisterProperty('Inn', 'Inn', [], '', 10, 12);
  P:=RegisterProperty('OrganizationName', 'OrganizationName', [], '', 1, 255);
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 60);
end;

procedure TOtherIssuerUtd970.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FEmployeeBase:=TDocumentRequisitesType.Create;
  FOrganizationBase:=TDocumentRequisitesType.Create;
end;

destructor TOtherIssuerUtd970.Destroy;
begin
  FEmployeeBase.Free;
  FOrganizationBase.Free;
  inherited Destroy;
end;

constructor TOtherIssuerUtd970.Create;
begin
  inherited Create;
end;

  {  TDocumentRequisitesType  }
procedure TDocumentRequisitesType.SetDocumentName(AValue: Tstring255);
begin
  CheckStrMinSize('DocumentName', AValue);
  CheckStrMaxSize('DocumentName', AValue);
  FDocumentName:=AValue;
  ModifiedProperty('DocumentName');
end;

procedure TDocumentRequisitesType.SetDocumentNumber(AValue: Tstring255);
begin
  CheckStrMinSize('DocumentNumber', AValue);
  CheckStrMaxSize('DocumentNumber', AValue);
  FDocumentNumber:=AValue;
  ModifiedProperty('DocumentNumber');
end;

procedure TDocumentRequisitesType.SetDocumentDate(AValue: Tdate1);
begin
  CheckStrMinSize('DocumentDate', AValue);
  CheckStrMaxSize('DocumentDate', AValue);
  FDocumentDate:=AValue;
  ModifiedProperty('DocumentDate');
end;

procedure TDocumentRequisitesType.SetFileId(AValue: Tstring255);
begin
  CheckStrMinSize('FileId', AValue);
  CheckStrMaxSize('FileId', AValue);
  FFileId:=AValue;
  ModifiedProperty('FileId');
end;

procedure TDocumentRequisitesType.SetId(AValue: Tstring255);
begin
  CheckStrMinSize('Id', AValue);
  CheckStrMaxSize('Id', AValue);
  FId:=AValue;
  ModifiedProperty('Id');
end;

procedure TDocumentRequisitesType.SetSystemId(AValue: Tstring500);
begin
  CheckStrMinSize('SystemId', AValue);
  CheckStrMaxSize('SystemId', AValue);
  FSystemId:=AValue;
  ModifiedProperty('SystemId');
end;

procedure TDocumentRequisitesType.SetSystemUrl(AValue: Tstring255);
begin
  CheckStrMinSize('SystemUrl', AValue);
  CheckStrMaxSize('SystemUrl', AValue);
  FSystemUrl:=AValue;
  ModifiedProperty('SystemUrl');
end;

procedure TDocumentRequisitesType.SetAdditionalInfo(AValue: Tstring2000);
begin
  CheckStrMinSize('AdditionalInfo', AValue);
  CheckStrMaxSize('AdditionalInfo', AValue);
  FAdditionalInfo:=AValue;
  ModifiedProperty('AdditionalInfo');
end;

procedure TDocumentRequisitesType.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('IdentificationDetails', 'IdentificationDetails', [], '', -1, -1);
  P:=RegisterProperty('DocumentName', 'DocumentName', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('DocumentNumber', 'DocumentNumber', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('DocumentDate', 'DocumentDate', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('FileId', 'FileId', [], '', 1, 255);
  P:=RegisterProperty('Id', 'Id', [], '', 1, 255);
  P:=RegisterProperty('SystemId', 'SystemId', [], '', 1, 500);
  P:=RegisterProperty('SystemUrl', 'SystemUrl', [], '', 1, 255);
  P:=RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', 1, 2000);
end;

procedure TDocumentRequisitesType.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FIdentificationDetails:=TIdentificationDetailsList.Create;
end;

destructor TDocumentRequisitesType.Destroy;
begin
  FIdentificationDetails.Free;
  inherited Destroy;
end;

constructor TDocumentRequisitesType.Create;
begin
  inherited Create;
end;

  {  TIdentificationDetails  }
procedure TIdentificationDetails.SetInn(AValue: Tinn);
begin
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TIdentificationDetails.SetShortNameExecutiveAuthority(AValue: Tstring255);
begin
  CheckStrMinSize('ShortNameExecutiveAuthority', AValue);
  CheckStrMaxSize('ShortNameExecutiveAuthority', AValue);
  FShortNameExecutiveAuthority:=AValue;
  ModifiedProperty('ShortNameExecutiveAuthority');
end;

procedure TIdentificationDetails.SetStatusId(AValue: String);
begin
  CheckLockupValue('StatusId', AValue);
  FStatusId:=AValue;
  ModifiedProperty('StatusId');
end;

procedure TIdentificationDetails.SetCountry(AValue: String);
begin
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TIdentificationDetails.SetOrgName(AValue: Tstring1000);
begin
  CheckStrMinSize('OrgName', AValue);
  CheckStrMaxSize('OrgName', AValue);
  FOrgName:=AValue;
  ModifiedProperty('OrgName');
end;

procedure TIdentificationDetails.SetLegalEntityId(AValue: Tstring255);
begin
  CheckStrMinSize('LegalEntityId', AValue);
  CheckStrMaxSize('LegalEntityId', AValue);
  FLegalEntityId:=AValue;
  ModifiedProperty('LegalEntityId');
end;

procedure TIdentificationDetails.SetOrganizationOrPersonInfo(AValue: Tstring255);
begin
  CheckStrMinSize('OrganizationOrPersonInfo', AValue);
  CheckStrMaxSize('OrganizationOrPersonInfo', AValue);
  FOrganizationOrPersonInfo:=AValue;
  ModifiedProperty('OrganizationOrPersonInfo');
end;

procedure TIdentificationDetails.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Inn', 'Inn', [], '', 10, 12);
  P:=RegisterProperty('ShortNameExecutiveAuthority', 'ShortNameExecutiveAuthority', [], '', 1, 255);
  P:=RegisterProperty('StatusId', 'StatusId', [], '', -1, -1);
    P.ValidList.Add('LegalEntity');
    P.ValidList.Add('PhysicalPerson');
  P:=RegisterProperty('Country', 'Country', [], '', 3, 3);
  P:=RegisterProperty('OrgName', 'OrgName', [], '', 1, 1000);
  P:=RegisterProperty('LegalEntityId', 'LegalEntityId', [], '', 1, 255);
  P:=RegisterProperty('OrganizationOrPersonInfo', 'OrganizationOrPersonInfo', [], '', 1, 255);
end;

procedure TIdentificationDetails.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TIdentificationDetails.Destroy;
begin
  inherited Destroy;
end;

constructor TIdentificationDetails.Create;
begin
  inherited Create;
end;

  {  TSigners  }
procedure TSigners.SetBoxId(AValue: Tguid);
begin
  FBoxId:=AValue;
  ModifiedProperty('BoxId');
end;

procedure TSigners.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Signer', 'Signer', [], '', -1, -1);
  P:=RegisterProperty('BoxId', 'BoxId', [], '', -1, -1);
end;

procedure TSigners.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSigner:=TSignerList.Create;
end;

destructor TSigners.Destroy;
begin
  FSigner.Free;
  inherited Destroy;
end;

constructor TSigners.Create;
begin
  inherited Create;
end;

  {  TSigner  }
procedure TSigner.SetSignerStatus(AValue: String);
begin
  CheckLockupValue('SignerStatus', AValue);
  CheckStrMinSize('SignerStatus', AValue);
  CheckStrMaxSize('SignerStatus', AValue);
  FSignerStatus:=AValue;
  ModifiedProperty('SignerStatus');
end;

procedure TSigner.SetSignatureType(AValue: String);
begin
  CheckLockupValue('SignatureType', AValue);
  CheckStrMinSize('SignatureType', AValue);
  CheckStrMaxSize('SignatureType', AValue);
  FSignatureType:=AValue;
  ModifiedProperty('SignatureType');
end;

procedure TSigner.SetSigningDate(AValue: Tdate1);
begin
  CheckStrMinSize('SigningDate', AValue);
  CheckStrMaxSize('SigningDate', AValue);
  FSigningDate:=AValue;
  ModifiedProperty('SigningDate');
end;

procedure TSigner.SetSignerPowersConfirmationMethod(AValue: String);
begin
  CheckLockupValue('SignerPowersConfirmationMethod', AValue);
  CheckStrMinSize('SignerPowersConfirmationMethod', AValue);
  CheckStrMaxSize('SignerPowersConfirmationMethod', AValue);
  FSignerPowersConfirmationMethod:=AValue;
  ModifiedProperty('SignerPowersConfirmationMethod');
end;

procedure TSigner.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Certificate', 'Certificate', [], '', -1, -1);
  P:=RegisterProperty('Fio', 'Fio', [], '', -1, -1);
  P:=RegisterProperty('Position', 'Position', [], '', -1, -1);
  P:=RegisterProperty('SignerAdditionalInfo', 'SignerAdditionalInfo', [], '', -1, -1);
  P:=RegisterProperty('PowerOfAttorney', 'PowerOfAttorney', [], '', -1, -1);
  P:=RegisterProperty('SignerStatus', 'SignerStatus', [], '', 1, 1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
  P:=RegisterProperty('SignatureType', 'SignatureType', [], '', 1, 1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
  P:=RegisterProperty('SigningDate', 'SigningDate', [], '', 10, 10);
  P:=RegisterProperty('SignerPowersConfirmationMethod', 'SignerPowersConfirmationMethod', [], '', 1, 1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
    P.ValidList.Add('5');
    P.ValidList.Add('6');
end;

procedure TSigner.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FCertificate:=TCertificate.Create;
  FFio:=TFio.Create;
  FPosition:=Signer_Position.Create;
  FSignerAdditionalInfo:=Signer_SignerAdditionalInfo.Create;
  FPowerOfAttorney:=TPowerOfAttorney.Create;
end;

destructor TSigner.Destroy;
begin
  FCertificate.Free;
  FFio.Free;
  FPosition.Free;
  FSignerAdditionalInfo.Free;
  FPowerOfAttorney.Free;
  inherited Destroy;
end;

constructor TSigner.Create;
begin
  inherited Create;
end;

  {  TPosition  }
procedure TPosition.SetPositionSource(AValue: String);
begin
  CheckLockupValue('PositionSource', AValue);
  FPositionSource:=AValue;
  ModifiedProperty('PositionSource');
end;

procedure TPosition.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('PositionSource', 'PositionSource', [xsaRequared], '', -1, -1);
    P.ValidList.Add('Employee');
    P.ValidList.Add('Certificate');
    P.ValidList.Add('StorageByTitleTypeId');
    P.ValidList.Add('Manual');
end;

procedure TPosition.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TPosition.Destroy;
begin
  inherited Destroy;
end;

constructor TPosition.Create;
begin
  inherited Create;
end;

  {  TSignerAdditionalInfo  }
procedure TSignerAdditionalInfo.SetSignerAdditionalInfoSource(AValue: String);
begin
  CheckLockupValue('SignerAdditionalInfoSource', AValue);
  FSignerAdditionalInfoSource:=AValue;
  ModifiedProperty('SignerAdditionalInfoSource');
end;

procedure TSignerAdditionalInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerAdditionalInfoSource', 'SignerAdditionalInfoSource', [xsaRequared], '', -1, -1);
    P.ValidList.Add('StorageByTitleTypeId');
    P.ValidList.Add('Manual');
end;

procedure TSignerAdditionalInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TSignerAdditionalInfo.Destroy;
begin
  inherited Destroy;
end;

constructor TSignerAdditionalInfo.Create;
begin
  inherited Create;
end;

  {  TCertificate  }
procedure TCertificate.SetCertificateThumbprint(AValue: Tstring100);
begin
  CheckStrMinSize('CertificateThumbprint', AValue);
  CheckStrMaxSize('CertificateThumbprint', AValue);
  FCertificateThumbprint:=AValue;
  ModifiedProperty('CertificateThumbprint');
end;

procedure TCertificate.SetCertificateBytes(AValue: String);
begin
  FCertificateBytes:=AValue;
  ModifiedProperty('CertificateBytes');
end;

procedure TCertificate.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CertificateThumbprint', 'CertificateThumbprint', [], '', 1, 100);
  P:=RegisterProperty('CertificateBytes', 'CertificateBytes', [], '', -1, -1);
end;

procedure TCertificate.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TCertificate.Destroy;
begin
  inherited Destroy;
end;

constructor TCertificate.Create;
begin
  inherited Create;
end;

  {  TPowerOfAttorney  }
procedure TPowerOfAttorney.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Electronic', 'Electronic', [], '', -1, -1);
  P:=RegisterProperty('Paper', 'Paper', [], '', -1, -1);
end;

procedure TPowerOfAttorney.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FElectronic:=TElectronic.Create;
  FPaper:=TPaper.Create;
end;

destructor TPowerOfAttorney.Destroy;
begin
  FElectronic.Free;
  FPaper.Free;
  inherited Destroy;
end;

constructor TPowerOfAttorney.Create;
begin
  inherited Create;
end;

  {  TElectronic  }
procedure TElectronic.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Storage', 'Storage', [], '', -1, -1);
  P:=RegisterProperty('Manual', 'Manual', [], '', -1, -1);
end;

procedure TElectronic.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FStorage:=TStorage.Create;
  FManual:=TManual.Create;
end;

destructor TElectronic.Destroy;
begin
  FStorage.Free;
  FManual.Free;
  inherited Destroy;
end;

constructor TElectronic.Create;
begin
  inherited Create;
end;

  {  TStorage  }
procedure TStorage.SetUseDefault(AValue: String);
begin
  CheckLockupValue('UseDefault', AValue);
  FUseDefault:=AValue;
  ModifiedProperty('UseDefault');
end;

procedure TStorage.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('FullId', 'FullId', [], '', -1, -1);
  P:=RegisterProperty('UseDefault', 'UseDefault', [xsaRequared], '', -1, -1);
    P.ValidList.Add('true');
    P.ValidList.Add('false');
end;

procedure TStorage.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FFullId:=Storage_FullId.Create;
end;

destructor TStorage.Destroy;
begin
  FFullId.Free;
  inherited Destroy;
end;

constructor TStorage.Create;
begin
  inherited Create;
end;

  {  TFullId  }
procedure TFullId.SetRegistrationNumber(AValue: Tguid);
begin
  FRegistrationNumber:=AValue;
  ModifiedProperty('RegistrationNumber');
end;

procedure TFullId.SetIssuerInn(AValue: Tinn);
begin
  CheckStrMinSize('IssuerInn', AValue);
  CheckStrMaxSize('IssuerInn', AValue);
  FIssuerInn:=AValue;
  ModifiedProperty('IssuerInn');
end;

procedure TFullId.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('RegistrationNumber', 'RegistrationNumber', [xsaRequared], '', -1, -1);
  P:=RegisterProperty('IssuerInn', 'IssuerInn', [xsaRequared], '', 10, 12);
end;

procedure TFullId.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TFullId.Destroy;
begin
  inherited Destroy;
end;

constructor TFullId.Create;
begin
  inherited Create;
end;

  {  TManual  }
procedure TManual.SetRegistrationNumber(AValue: Tguid);
begin
  FRegistrationNumber:=AValue;
  ModifiedProperty('RegistrationNumber');
end;

procedure TManual.SetRegistrationDate(AValue: Tdate1);
begin
  CheckStrMinSize('RegistrationDate', AValue);
  CheckStrMaxSize('RegistrationDate', AValue);
  FRegistrationDate:=AValue;
  ModifiedProperty('RegistrationDate');
end;

procedure TManual.SetInternalNumber(AValue: Tstring50);
begin
  CheckStrMinSize('InternalNumber', AValue);
  CheckStrMaxSize('InternalNumber', AValue);
  FInternalNumber:=AValue;
  ModifiedProperty('InternalNumber');
end;

procedure TManual.SetInternalDate(AValue: Tdate1);
begin
  CheckStrMinSize('InternalDate', AValue);
  CheckStrMaxSize('InternalDate', AValue);
  FInternalDate:=AValue;
  ModifiedProperty('InternalDate');
end;

procedure TManual.SetSystemId(AValue: Tstring500);
begin
  CheckStrMinSize('SystemId', AValue);
  CheckStrMaxSize('SystemId', AValue);
  FSystemId:=AValue;
  ModifiedProperty('SystemId');
end;

procedure TManual.SetSystemUrl(AValue: Tstring500);
begin
  CheckStrMinSize('SystemUrl', AValue);
  CheckStrMaxSize('SystemUrl', AValue);
  FSystemUrl:=AValue;
  ModifiedProperty('SystemUrl');
end;

procedure TManual.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('RegistrationNumber', 'RegistrationNumber', [], '', -1, -1);
  P:=RegisterProperty('RegistrationDate', 'RegistrationDate', [], '', 10, 10);
  P:=RegisterProperty('InternalNumber', 'InternalNumber', [], '', 1, 50);
  P:=RegisterProperty('InternalDate', 'InternalDate', [], '', 10, 10);
  P:=RegisterProperty('SystemId', 'SystemId', [], '', 1, 500);
  P:=RegisterProperty('SystemUrl', 'SystemUrl', [], '', 1, 500);
end;

procedure TManual.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TManual.Destroy;
begin
  inherited Destroy;
end;

constructor TManual.Create;
begin
  inherited Create;
end;

  {  TPaper  }
procedure TPaper.SetInternalNumber(AValue: Tstring50);
begin
  CheckStrMinSize('InternalNumber', AValue);
  CheckStrMaxSize('InternalNumber', AValue);
  FInternalNumber:=AValue;
  ModifiedProperty('InternalNumber');
end;

procedure TPaper.SetRegistrationDate(AValue: Tdate1);
begin
  CheckStrMinSize('RegistrationDate', AValue);
  CheckStrMaxSize('RegistrationDate', AValue);
  FRegistrationDate:=AValue;
  ModifiedProperty('RegistrationDate');
end;

procedure TPaper.SetIssuerInfo(AValue: Tstring1000);
begin
  CheckStrMinSize('IssuerInfo', AValue);
  CheckStrMaxSize('IssuerInfo', AValue);
  FIssuerInfo:=AValue;
  ModifiedProperty('IssuerInfo');
end;

procedure TPaper.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Person', 'Person', [], '', -1, -1);
  P:=RegisterProperty('InternalNumber', 'InternalNumber', [], '', 1, 50);
  P:=RegisterProperty('RegistrationDate', 'RegistrationDate', [], '', 10, 10);
  P:=RegisterProperty('IssuerInfo', 'IssuerInfo', [], '', 1, 1000);
end;

procedure TPaper.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FPerson:=TFio.Create;
end;

destructor TPaper.Destroy;
begin
  FPerson.Free;
  inherited Destroy;
end;

constructor TPaper.Create;
begin
  inherited Create;
end;

  {  TFio  }
procedure TFio.SetLastName(AValue: Tstring60);
begin
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TFio.SetFirstName(AValue: Tstring60);
begin
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TFio.SetMiddleName(AValue: Tstring60);
begin
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TFio.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 60);
end;

procedure TFio.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TFio.Destroy;
begin
  inherited Destroy;
end;

constructor TFio.Create;
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
  FWaybill:=TXSDWaybills_WaybillArray.Create;
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

  {  TWaybill  }
procedure TWaybill.SetTransferDocumentNumber(AValue: Tstring255);
begin
  CheckStrMinSize('TransferDocumentNumber', AValue);
  CheckStrMaxSize('TransferDocumentNumber', AValue);
  FTransferDocumentNumber:=AValue;
  ModifiedProperty('TransferDocumentNumber');
end;

procedure TWaybill.SetTransferDocumentDate(AValue: Tdate1);
begin
  CheckStrMinSize('TransferDocumentDate', AValue);
  CheckStrMaxSize('TransferDocumentDate', AValue);
  FTransferDocumentDate:=AValue;
  ModifiedProperty('TransferDocumentDate');
end;

procedure TWaybill.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TransferDocumentNumber', 'TransferDocumentNumber', [xsaRequared], '', 1, 255);
  P:=RegisterProperty('TransferDocumentDate', 'TransferDocumentDate', [xsaRequared], '', 10, 10);
end;

procedure TWaybill.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TWaybill.Destroy;
begin
  inherited Destroy;
end;

constructor TWaybill.Create;
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