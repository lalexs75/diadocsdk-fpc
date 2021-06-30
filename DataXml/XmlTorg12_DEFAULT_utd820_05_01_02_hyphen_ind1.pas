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

unit XmlTorg12_DEFAULT_utd820_05_01_02_hyphen_ind1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject, AbstractSerializationObjects;

type
  //Код из Общероссийского классификатора территорий муниципальных образований
  Toktmo = String;
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
type

  {  Forward declarations  }
  TUniversalTransferDocumentBuyerTitle = class;
  TUniversalTransferDocumentBuyerTitle_Signers = class;
  TUniversalTransferDocumentBuyerTitle_ContentOperCode = class;
  TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc = class;
  TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab = class;
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
  TUniversalTransferDocumentBuyerTitleList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentBuyerTitle>;
  TUniversalTransferDocumentBuyerTitle_SignersList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentBuyerTitle_Signers>;
  TUniversalTransferDocumentBuyerTitle_ContentOperCodeList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentBuyerTitle_ContentOperCode>;
  TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProcList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc>;
  TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiabList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab>;
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

  {  TUniversalTransferDocumentBuyerTitle  }
  TUniversalTransferDocumentBuyerTitle = class(TXmlSerializationObject)
  private
    FEmployee:TEmployee;
    FOtherIssuer:TOtherIssuer;
    FAdditionalInfoId:TAdditionalInfoId;
    FSigners:TUniversalTransferDocumentBuyerTitle_Signers;
    FContentOperCode:TUniversalTransferDocumentBuyerTitle_ContentOperCode;
    FBuyerInfoCircumPublicProc:TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc;
    FDocumentCreator:Tstring1000;
    FDocumentCreatorBase:Tstring120;
    FOperationCode:Tstring255;
    FOperationContent:Tstring255;
    FAcceptanceDate:Tdate1;
    procedure SetDocumentCreator( AValue:Tstring1000);
    procedure SetDocumentCreatorBase( AValue:Tstring120);
    procedure SetOperationCode( AValue:Tstring255);
    procedure SetOperationContent( AValue:Tstring255);
    procedure SetAcceptanceDate( AValue:Tdate1);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
    function RootNodeName:string; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //РабОргПок
    property Employee:TEmployee read FEmployee;
    //ИнЛицо
    property OtherIssuer:TOtherIssuer read FOtherIssuer;
    //ИнфПолФХЖ4
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;
    property Signers:TUniversalTransferDocumentBuyerTitle_Signers read FSigners;
    //КодСодОпер - Код содержания операции
    property ContentOperCode:TUniversalTransferDocumentBuyerTitle_ContentOperCode read FContentOperCode;
    //ИнфПокГосЗакКазн - Информация покупателя об обстоятельствах закупок для
    //государственных и муниципальных нужд (для учета Федеральным казначейством денежных
    //обязательств)
    property BuyerInfoCircumPublicProc:TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc read FBuyerInfoCircumPublicProc;
    //НаимЭконСубСост - Наименование экономического субъекта - составителя файла обмена
    //информации покупателя
    property DocumentCreator:Tstring1000 read FDocumentCreator write SetDocumentCreator;
    //ОснДоверОргСост - Основание, по которому экономический субъект является
    //составителем файла обмена информации покупателя
    property DocumentCreatorBase:Tstring120 read FDocumentCreatorBase write SetDocumentCreatorBase;
    //ВидОперации
    property OperationCode:Tstring255 read FOperationCode write SetOperationCode;
    //СодОпер - Содержание операции
    property OperationContent:Tstring255 read FOperationContent write SetOperationContent;
    //ДатаПрин - Дата принятия товаров (результатов выполненных работ), имущественных
    //прав (подтверждения факта оказания услуг)
    property AcceptanceDate:Tdate1 read FAcceptanceDate write SetAcceptanceDate;
  end;

  {  TUniversalTransferDocumentBuyerTitle_Signers  }
  TUniversalTransferDocumentBuyerTitle_Signers = class(TXmlSerializationObject)
  private
    FSignerReference:TSignerReference;
    FSignerDetails:TExtendedSignerDetails_BuyerTitle820;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property SignerReference:TSignerReference read FSignerReference;
    property SignerDetails:TExtendedSignerDetails_BuyerTitle820 read FSignerDetails;
  end;

  {  TUniversalTransferDocumentBuyerTitle_ContentOperCode  }
  TUniversalTransferDocumentBuyerTitle_ContentOperCode = class(TXmlSerializationObject)
  private
    FTotalCode:String;
    FNameDiscrepDocument:Tstring255;
    FTypeDiscrepDocument:String;
    FNumberDiscrepDocument:Tstring255;
    FDateDiscrepDocument:Tdate1;
    FIdDiscrepDocument:Tstring255;
    procedure SetTotalCode( AValue:String);
    procedure SetNameDiscrepDocument( AValue:Tstring255);
    procedure SetTypeDiscrepDocument( AValue:String);
    procedure SetNumberDiscrepDocument( AValue:Tstring255);
    procedure SetDateDiscrepDocument( AValue:Tdate1);
    procedure SetIdDiscrepDocument( AValue:Tstring255);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //Код итога - Код, обозначающий итог приемки товара (работ, услуг,
    //прав)
    property TotalCode:String read FTotalCode write SetTotalCode;
    //НаимДокРасх - Наименование документа, оформляющего расхождения
    property NameDiscrepDocument:Tstring255 read FNameDiscrepDocument write SetNameDiscrepDocument;
    //ВидДокРасх - Код вида документа о расхождениях
    property TypeDiscrepDocument:String read FTypeDiscrepDocument write SetTypeDiscrepDocument;
    //НомДокРасх - Номер документа покупателя о расхождениях
    property NumberDiscrepDocument:Tstring255 read FNumberDiscrepDocument write SetNumberDiscrepDocument;
    //ДатаДокРасх - Дата документа о расхождениях
    property DateDiscrepDocument:Tdate1 read FDateDiscrepDocument write SetDateDiscrepDocument;
    //ИдФайлДокРасх - Идентификатор файла обмена документа о расхождениях,
    //сформированного покупателем
    property IdDiscrepDocument:Tstring255 read FIdDiscrepDocument write SetIdDiscrepDocument;
  end;

  {  TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc  }
  TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc = class(TXmlSerializationObject)
  private
    FInfoFundsLiab:TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiabList;
    FProcCode:Tstring36;
    FPersonalAccountBuyer:String;
    FNameFinAuthority:Tstring2000;
    FBuyerRegistryEntryNumber:String;
    FBuyerLiabNumber:String;
    FBuyerTreasuryCode:Tstring8;
    FBuyerTreasuryName:Tstring2000;
    FOKTMOBuy:Toktmo;
    FOKTMOPlaceDelivery:Toktmo;
    FPayDeadLine:Tdate1;
    FNumberFundsLiab:String;
    FPaymentPriority:String;
    FPaymentType:String;
    procedure SetProcCode( AValue:Tstring36);
    procedure SetPersonalAccountBuyer( AValue:String);
    procedure SetNameFinAuthority( AValue:Tstring2000);
    procedure SetBuyerRegistryEntryNumber( AValue:String);
    procedure SetBuyerLiabNumber( AValue:String);
    procedure SetBuyerTreasuryCode( AValue:Tstring8);
    procedure SetBuyerTreasuryName( AValue:Tstring2000);
    procedure SetOKTMOBuy( AValue:Toktmo);
    procedure SetOKTMOPlaceDelivery( AValue:Toktmo);
    procedure SetPayDeadLine( AValue:Tdate1);
    procedure SetNumberFundsLiab( AValue:String);
    procedure SetPaymentPriority( AValue:String);
    procedure SetPaymentType( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //ИнфСведДенОбяз - Информация для сведений о денежном
    //обязательстве
    property InfoFundsLiab:TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiabList read FInfoFundsLiab;
    //ИдКодЗак - Идентификационный код закупки
    property ProcCode:Tstring36 read FProcCode write SetProcCode;
    //ЛицСчетПок - Номер лицевого счета покупателя
    property PersonalAccountBuyer:String read FPersonalAccountBuyer write SetPersonalAccountBuyer;
    //НаимФинОргПок - Наименование финансового органа покупателя
    property NameFinAuthority:Tstring2000 read FNameFinAuthority write SetNameFinAuthority;
    //НомРеестрЗапПок - Номер реестровой записи покупателя по Реестру
    //участников бюджетного процесса, а также юридических лиц, не являющихся участниками
    //бюджетного процесса
    property BuyerRegistryEntryNumber:String read FBuyerRegistryEntryNumber write SetBuyerRegistryEntryNumber;
    //УчНомБюдОбязПок - Учетный номер бюджетного обязательства покупателя
    property BuyerLiabNumber:String read FBuyerLiabNumber write SetBuyerLiabNumber;
    //КодКазначПок - Код территориального органа Федерального казначейства
    //покупателя
    property BuyerTreasuryCode:Tstring8 read FBuyerTreasuryCode write SetBuyerTreasuryCode;
    //НаимКазначПок - Наименование территориального органа Федерального
    //казначейства покупателя
    property BuyerTreasuryName:Tstring2000 read FBuyerTreasuryName write SetBuyerTreasuryName;
    //ОКТМОПок - Код покупателя в Общероссийском классификаторе территорий
    //муниципальных образований
    property OKTMOBuy:Toktmo read FOKTMOBuy write SetOKTMOBuy;
    //ОКТМОМесПост - Код места поставки в Общероссийском классификаторе
    //территорий муниципальных образований
    property OKTMOPlaceDelivery:Toktmo read FOKTMOPlaceDelivery write SetOKTMOPlaceDelivery;
    //ДатаОплПред - Предельная дата оплаты
    property PayDeadLine:Tdate1 read FPayDeadLine write SetPayDeadLine;
    //УчНомДенОбяз - Учетный номер денежного обязательства
    property NumberFundsLiab:String read FNumberFundsLiab write SetNumberFundsLiab;
    //ОчерПлат - Очередность платежа
    property PaymentPriority:String read FPaymentPriority write SetPaymentPriority;
    //ВидПлат - Вид платежа
    property PaymentType:String read FPaymentType write SetPaymentType;
  end;

  {  TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab  }
  TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab = class(TXmlSerializationObject)
  private
    FNumberString:Int64;
    FObjectCodeFAIP:Tstring24;
    FFundsSourceType:String;
    FBuyerBudjetClassCode:Tstring20f;
    FBuyerTargetCode:Tstring20;
    FAmountAdvance:Double;
    procedure SetNumberString( AValue:Int64);
    procedure SetObjectCodeFAIP( AValue:Tstring24);
    procedure SetFundsSourceType( AValue:String);
    procedure SetBuyerBudjetClassCode( AValue:Tstring20f);
    procedure SetBuyerTargetCode( AValue:Tstring20);
    procedure SetAmountAdvance( AValue:Double);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //НомСтр - Номер строки таблицы информации продавца
    property NumberString:Int64 read FNumberString write SetNumberString;
    //КодОбъектФАИП - Код объекта капитального строительства
    //федеральной адресной инвестиционной программы/код мероприятия по
    //информатизации
    property ObjectCodeFAIP:Tstring24 read FObjectCodeFAIP write SetObjectCodeFAIP;
    //ВидСредств - Вид средств
    property FundsSourceType:String read FFundsSourceType write SetFundsSourceType;
    //КодПокБюджКласс - Код по бюджетной классификации
    //(покупатель)
    property BuyerBudjetClassCode:Tstring20f read FBuyerBudjetClassCode write SetBuyerBudjetClassCode;
    //КодЦелиПокуп - Код цели (покупатель)
    property BuyerTargetCode:Tstring20 read FBuyerTargetCode write SetBuyerTargetCode;
    //СумАванс - Сумма перечисленного аванса
    property AmountAdvance:Double read FAmountAdvance write SetAmountAdvance;
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

  {  TSignerInfo  }
  TSignerInfo = class(TXmlSerializationObject)
  private
    FSignerDetails:TSignerDetails;
    FSignerReference:TSignerReferenceInfo;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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
    constructor Create; override;
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

  {  TWaybills  }
  TWaybills = class(TXmlSerializationObject)
  private
    FWaybill:TWaybills_WaybillList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
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

  {  TUniversalTransferDocumentBuyerTitle  }
procedure TUniversalTransferDocumentBuyerTitle.SetDocumentCreator(AValue: Tstring1000);
begin
  CheckStrMinSize('DocumentCreator', AValue);
  CheckStrMaxSize('DocumentCreator', AValue);
  FDocumentCreator:=AValue;
  ModifiedProperty('DocumentCreator');
end;

procedure TUniversalTransferDocumentBuyerTitle.SetDocumentCreatorBase(AValue: Tstring120);
begin
  CheckStrMinSize('DocumentCreatorBase', AValue);
  CheckStrMaxSize('DocumentCreatorBase', AValue);
  FDocumentCreatorBase:=AValue;
  ModifiedProperty('DocumentCreatorBase');
end;

procedure TUniversalTransferDocumentBuyerTitle.SetOperationCode(AValue: Tstring255);
begin
  CheckStrMinSize('OperationCode', AValue);
  CheckStrMaxSize('OperationCode', AValue);
  FOperationCode:=AValue;
  ModifiedProperty('OperationCode');
end;

procedure TUniversalTransferDocumentBuyerTitle.SetOperationContent(AValue: Tstring255);
begin
  CheckStrMinSize('OperationContent', AValue);
  CheckStrMaxSize('OperationContent', AValue);
  FOperationContent:=AValue;
  ModifiedProperty('OperationContent');
end;

procedure TUniversalTransferDocumentBuyerTitle.SetAcceptanceDate(AValue: Tdate1);
begin
  CheckStrMinSize('AcceptanceDate', AValue);
  CheckStrMaxSize('AcceptanceDate', AValue);
  FAcceptanceDate:=AValue;
  ModifiedProperty('AcceptanceDate');
end;

procedure TUniversalTransferDocumentBuyerTitle.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Employee', 'Employee', [], '', -1, -1);
  P:=RegisterProperty('OtherIssuer', 'OtherIssuer', [], '', -1, -1);
  P:=RegisterProperty('AdditionalInfoId', 'AdditionalInfoId', [], '', -1, -1);
  P:=RegisterProperty('Signers', 'Signers', [], '', -1, -1);
  P:=RegisterProperty('ContentOperCode', 'ContentOperCode', [], '', -1, -1);
  P:=RegisterProperty('BuyerInfoCircumPublicProc', 'BuyerInfoCircumPublicProc', [], '', -1, -1);
  P:=RegisterProperty('DocumentCreator', 'DocumentCreator', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('DocumentCreatorBase', 'DocumentCreatorBase', [], '', 1, 120);
  P:=RegisterProperty('OperationCode', 'OperationCode', [], '', 1, 255);
  P:=RegisterProperty('OperationContent', 'OperationContent', [], '', 1, 255);
  P:=RegisterProperty('AcceptanceDate', 'AcceptanceDate', [], '', 10, 10);
end;

procedure TUniversalTransferDocumentBuyerTitle.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FEmployee:=TEmployee.Create;
  FOtherIssuer:=TOtherIssuer.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FSigners:=TUniversalTransferDocumentBuyerTitle_Signers.Create;
  FContentOperCode:=TUniversalTransferDocumentBuyerTitle_ContentOperCode.Create;
  FBuyerInfoCircumPublicProc:=TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.Create;
end;

destructor TUniversalTransferDocumentBuyerTitle.Destroy;
begin
  FEmployee.Free;
  FOtherIssuer.Free;
  FAdditionalInfoId.Free;
  FSigners.Free;
  FContentOperCode.Free;
  FBuyerInfoCircumPublicProc.Free;
  inherited Destroy;
end;

function TUniversalTransferDocumentBuyerTitle.RootNodeName:string;
begin
  Result:='UniversalTransferDocumentBuyerTitle';
end;

constructor TUniversalTransferDocumentBuyerTitle.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentBuyerTitle_Signers  }
procedure TUniversalTransferDocumentBuyerTitle_Signers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerReference', 'SignerReference', [], '', -1, -1);
  P:=RegisterProperty('SignerDetails', 'SignerDetails', [], '', -1, -1);
end;

procedure TUniversalTransferDocumentBuyerTitle_Signers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSignerReference:=TSignerReference.Create;
  FSignerDetails:=TExtendedSignerDetails_BuyerTitle820.Create;
end;

destructor TUniversalTransferDocumentBuyerTitle_Signers.Destroy;
begin
  FSignerReference.Free;
  FSignerDetails.Free;
  inherited Destroy;
end;

constructor TUniversalTransferDocumentBuyerTitle_Signers.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentBuyerTitle_ContentOperCode  }
procedure TUniversalTransferDocumentBuyerTitle_ContentOperCode.SetTotalCode(AValue: String);
begin
  CheckLockupValue('TotalCode', AValue);
  CheckStrMinSize('TotalCode', AValue);
  CheckStrMaxSize('TotalCode', AValue);
  FTotalCode:=AValue;
  ModifiedProperty('TotalCode');
end;

procedure TUniversalTransferDocumentBuyerTitle_ContentOperCode.SetNameDiscrepDocument(AValue: Tstring255);
begin
  CheckStrMinSize('NameDiscrepDocument', AValue);
  CheckStrMaxSize('NameDiscrepDocument', AValue);
  FNameDiscrepDocument:=AValue;
  ModifiedProperty('NameDiscrepDocument');
end;

procedure TUniversalTransferDocumentBuyerTitle_ContentOperCode.SetTypeDiscrepDocument(AValue: String);
begin
  CheckLockupValue('TypeDiscrepDocument', AValue);
  CheckStrMinSize('TypeDiscrepDocument', AValue);
  CheckStrMaxSize('TypeDiscrepDocument', AValue);
  FTypeDiscrepDocument:=AValue;
  ModifiedProperty('TypeDiscrepDocument');
end;

procedure TUniversalTransferDocumentBuyerTitle_ContentOperCode.SetNumberDiscrepDocument(AValue: Tstring255);
begin
  CheckStrMinSize('NumberDiscrepDocument', AValue);
  CheckStrMaxSize('NumberDiscrepDocument', AValue);
  FNumberDiscrepDocument:=AValue;
  ModifiedProperty('NumberDiscrepDocument');
end;

procedure TUniversalTransferDocumentBuyerTitle_ContentOperCode.SetDateDiscrepDocument(AValue: Tdate1);
begin
  CheckStrMinSize('DateDiscrepDocument', AValue);
  CheckStrMaxSize('DateDiscrepDocument', AValue);
  FDateDiscrepDocument:=AValue;
  ModifiedProperty('DateDiscrepDocument');
end;

procedure TUniversalTransferDocumentBuyerTitle_ContentOperCode.SetIdDiscrepDocument(AValue: Tstring255);
begin
  CheckStrMinSize('IdDiscrepDocument', AValue);
  CheckStrMaxSize('IdDiscrepDocument', AValue);
  FIdDiscrepDocument:=AValue;
  ModifiedProperty('IdDiscrepDocument');
end;

procedure TUniversalTransferDocumentBuyerTitle_ContentOperCode.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('TotalCode', 'TotalCode', [xsaRequared], '', 1, 1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
  P:=RegisterProperty('NameDiscrepDocument', 'NameDiscrepDocument', [], '', 1, 255);
  P:=RegisterProperty('TypeDiscrepDocument', 'TypeDiscrepDocument', [], '', 1, 1);
    P.ValidList.Add('2');
    P.ValidList.Add('3');
  P:=RegisterProperty('NumberDiscrepDocument', 'NumberDiscrepDocument', [], '', 1, 255);
  P:=RegisterProperty('DateDiscrepDocument', 'DateDiscrepDocument', [], '', 10, 10);
  P:=RegisterProperty('IdDiscrepDocument', 'IdDiscrepDocument', [], '', 1, 255);
end;

procedure TUniversalTransferDocumentBuyerTitle_ContentOperCode.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TUniversalTransferDocumentBuyerTitle_ContentOperCode.Destroy;
begin
  inherited Destroy;
end;

constructor TUniversalTransferDocumentBuyerTitle_ContentOperCode.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc  }
procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetProcCode(AValue: Tstring36);
begin
  CheckStrMinSize('ProcCode', AValue);
  CheckStrMaxSize('ProcCode', AValue);
  FProcCode:=AValue;
  ModifiedProperty('ProcCode');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetPersonalAccountBuyer(AValue: String);
begin
  CheckStrMinSize('PersonalAccountBuyer', AValue);
  CheckStrMaxSize('PersonalAccountBuyer', AValue);
  FPersonalAccountBuyer:=AValue;
  ModifiedProperty('PersonalAccountBuyer');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetNameFinAuthority(AValue: Tstring2000);
begin
  CheckStrMinSize('NameFinAuthority', AValue);
  CheckStrMaxSize('NameFinAuthority', AValue);
  FNameFinAuthority:=AValue;
  ModifiedProperty('NameFinAuthority');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetBuyerRegistryEntryNumber(AValue: String);
begin
  CheckStrMinSize('BuyerRegistryEntryNumber', AValue);
  CheckStrMaxSize('BuyerRegistryEntryNumber', AValue);
  FBuyerRegistryEntryNumber:=AValue;
  ModifiedProperty('BuyerRegistryEntryNumber');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetBuyerLiabNumber(AValue: String);
begin
  CheckStrMinSize('BuyerLiabNumber', AValue);
  CheckStrMaxSize('BuyerLiabNumber', AValue);
  FBuyerLiabNumber:=AValue;
  ModifiedProperty('BuyerLiabNumber');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetBuyerTreasuryCode(AValue: Tstring8);
begin
  CheckStrMinSize('BuyerTreasuryCode', AValue);
  CheckStrMaxSize('BuyerTreasuryCode', AValue);
  FBuyerTreasuryCode:=AValue;
  ModifiedProperty('BuyerTreasuryCode');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetBuyerTreasuryName(AValue: Tstring2000);
begin
  CheckStrMinSize('BuyerTreasuryName', AValue);
  CheckStrMaxSize('BuyerTreasuryName', AValue);
  FBuyerTreasuryName:=AValue;
  ModifiedProperty('BuyerTreasuryName');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetOKTMOBuy(AValue: Toktmo);
begin
  CheckStrMinSize('OKTMOBuy', AValue);
  CheckStrMaxSize('OKTMOBuy', AValue);
  FOKTMOBuy:=AValue;
  ModifiedProperty('OKTMOBuy');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetOKTMOPlaceDelivery(AValue: Toktmo);
begin
  CheckStrMinSize('OKTMOPlaceDelivery', AValue);
  CheckStrMaxSize('OKTMOPlaceDelivery', AValue);
  FOKTMOPlaceDelivery:=AValue;
  ModifiedProperty('OKTMOPlaceDelivery');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetPayDeadLine(AValue: Tdate1);
begin
  CheckStrMinSize('PayDeadLine', AValue);
  CheckStrMaxSize('PayDeadLine', AValue);
  FPayDeadLine:=AValue;
  ModifiedProperty('PayDeadLine');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetNumberFundsLiab(AValue: String);
begin
  CheckStrMinSize('NumberFundsLiab', AValue);
  CheckStrMaxSize('NumberFundsLiab', AValue);
  FNumberFundsLiab:=AValue;
  ModifiedProperty('NumberFundsLiab');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetPaymentPriority(AValue: String);
begin
  CheckStrMinSize('PaymentPriority', AValue);
  CheckStrMaxSize('PaymentPriority', AValue);
  FPaymentPriority:=AValue;
  ModifiedProperty('PaymentPriority');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.SetPaymentType(AValue: String);
begin
  CheckLockupValue('PaymentType', AValue);
  CheckStrMinSize('PaymentType', AValue);
  CheckStrMaxSize('PaymentType', AValue);
  FPaymentType:=AValue;
  ModifiedProperty('PaymentType');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('InfoFundsLiab', 'InfoFundsLiab', [], '', -1, -1);
  P:=RegisterProperty('ProcCode', 'ProcCode', [], '', 1, 36);
  P:=RegisterProperty('PersonalAccountBuyer', 'PersonalAccountBuyer', [xsaRequared], '', 11, 11);
  P:=RegisterProperty('NameFinAuthority', 'NameFinAuthority', [xsaRequared], '', 1, 2000);
  P:=RegisterProperty('BuyerRegistryEntryNumber', 'BuyerRegistryEntryNumber', [xsaRequared], '', 8, 8);
  P:=RegisterProperty('BuyerLiabNumber', 'BuyerLiabNumber', [], '', 16, 19);
  P:=RegisterProperty('BuyerTreasuryCode', 'BuyerTreasuryCode', [], '', 1, 8);
  P:=RegisterProperty('BuyerTreasuryName', 'BuyerTreasuryName', [], '', 1, 2000);
  P:=RegisterProperty('OKTMOBuy', 'OKTMOBuy', [xsaRequared], '', 8, 11);
  P:=RegisterProperty('OKTMOPlaceDelivery', 'OKTMOPlaceDelivery', [], '', 8, 11);
  P:=RegisterProperty('PayDeadLine', 'PayDeadLine', [], '', 10, 10);
  P:=RegisterProperty('NumberFundsLiab', 'NumberFundsLiab', [], '', 22, 22);
  P:=RegisterProperty('PaymentPriority', 'PaymentPriority', [], '', 1, 1);
  P:=RegisterProperty('PaymentType', 'PaymentType', [], '', 1, 1);
    P.ValidList.Add('0');
    P.ValidList.Add('4');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FInfoFundsLiab:=TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiabList.Create;
end;

destructor TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.Destroy;
begin
  FInfoFundsLiab.Free;
  inherited Destroy;
end;

constructor TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc.Create;
begin
  inherited Create;
end;

  {  TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab  }
procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab.SetNumberString(AValue: Int64);
begin
  FNumberString:=AValue;
  ModifiedProperty('NumberString');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab.SetObjectCodeFAIP(AValue: Tstring24);
begin
  CheckStrMinSize('ObjectCodeFAIP', AValue);
  CheckStrMaxSize('ObjectCodeFAIP', AValue);
  FObjectCodeFAIP:=AValue;
  ModifiedProperty('ObjectCodeFAIP');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab.SetFundsSourceType(AValue: String);
begin
  CheckLockupValue('FundsSourceType', AValue);
  CheckStrMinSize('FundsSourceType', AValue);
  CheckStrMaxSize('FundsSourceType', AValue);
  FFundsSourceType:=AValue;
  ModifiedProperty('FundsSourceType');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab.SetBuyerBudjetClassCode(AValue: Tstring20f);
begin
  CheckStrMinSize('BuyerBudjetClassCode', AValue);
  CheckStrMaxSize('BuyerBudjetClassCode', AValue);
  FBuyerBudjetClassCode:=AValue;
  ModifiedProperty('BuyerBudjetClassCode');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab.SetBuyerTargetCode(AValue: Tstring20);
begin
  CheckStrMinSize('BuyerTargetCode', AValue);
  CheckStrMaxSize('BuyerTargetCode', AValue);
  FBuyerTargetCode:=AValue;
  ModifiedProperty('BuyerTargetCode');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab.SetAmountAdvance(AValue: Double);
begin
  FAmountAdvance:=AValue;
  ModifiedProperty('AmountAdvance');
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('NumberString', 'NumberString', [xsaRequared], '', -1, -1);
    P.TotalDigits := 6;
    P.FractionDigits := 0;
  P:=RegisterProperty('ObjectCodeFAIP', 'ObjectCodeFAIP', [], '', 1, 24);
  P:=RegisterProperty('FundsSourceType', 'FundsSourceType', [xsaRequared], '', 1, 1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
    P.ValidList.Add('4');
    P.ValidList.Add('5');
    P.ValidList.Add('6');
  P:=RegisterProperty('BuyerBudjetClassCode', 'BuyerBudjetClassCode', [xsaRequared], '', 20, 20);
  P:=RegisterProperty('BuyerTargetCode', 'BuyerTargetCode', [], '', 1, 20);
  P:=RegisterProperty('AmountAdvance', 'AmountAdvance', [xsaRequared], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
end;

procedure TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab.Destroy;
begin
  inherited Destroy;
end;

constructor TUniversalTransferDocumentBuyerTitle_BuyerInfoCircumPublicProc_InfoFundsLiab.Create;
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