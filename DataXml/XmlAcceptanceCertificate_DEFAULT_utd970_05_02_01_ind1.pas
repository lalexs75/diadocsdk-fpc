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

unit XmlAcceptanceCertificate_DEFAULT_utd970_05_02_01_ind1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject, AbstractSerializationObjects;

type
  //Код из Общероссийского классификатора территорий муниципальных образований
  Toktmo = String;
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
type

  {  Forward declarations  }
  TUniversalTransferDocumentBuyerTitle = class;
  TContentOperCode = class;
  TBuyerInfoCircumPublicProc = class;
  TInfoFundsLiab = class;
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

  {  Generic classes for collections  }
  TUniversalTransferDocumentBuyerTitleList = specialize GXMLSerializationObjectList<TUniversalTransferDocumentBuyerTitle>;
  TContentOperCodeList = specialize GXMLSerializationObjectList<TContentOperCode>;
  TBuyerInfoCircumPublicProcList = specialize GXMLSerializationObjectList<TBuyerInfoCircumPublicProc>;
  TInfoFundsLiabList = specialize GXMLSerializationObjectList<TInfoFundsLiab>;
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

  {  TUniversalTransferDocumentBuyerTitle  }
  TUniversalTransferDocumentBuyerTitle = class(TXmlSerializationObject)
  private
    FContentOperCode:UniversalTransferDocumentBuyerTitle_ContentOperCode;
    FEmployee:TEmployeeUtd970;
    FOtherIssuer:TOtherIssuerUtd970;
    FAdditionalInfoId:TAdditionalInfoId;
    FBuyerInfoCircumPublicProc:TBuyerInfoCircumPublicProc;
    FSigners:TSigners;
    FDocumentCreatorBase:TDocumentRequisitesType;
    FDocumentCreator:Tstring1000;
    FOperationCode:Tstring255;
    FOperationContent:Tstring255;
    FAcceptanceDate:Tdate1;
    procedure SetDocumentCreator( AValue:Tstring1000);
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
    //КодСодОпер - Код содержания операции
    property ContentOperCode:UniversalTransferDocumentBuyerTitle_ContentOperCode read FContentOperCode;
    //РабОргПокДолжен отсутствовать если заполнен OtherIssuer
    property Employee:TEmployeeUtd970 read FEmployee;
    //ИнЛицоДолжен отсутствовать если заполнен Employee
    property OtherIssuer:TOtherIssuerUtd970 read FOtherIssuer;
    //ИнфПолФХЖ4 - Информационное поле факта хозяйственной жизни 4
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;
    //ИнфПокЗаГоскКазн - Информация покупателя об обстоятельствах закупок для государственных и муниципальных нужд (для учета Федеральным казначейством денежных обязательств)
    property BuyerInfoCircumPublicProc:TBuyerInfoCircumPublicProc read FBuyerInfoCircumPublicProc;
    property Signers:TSigners read FSigners;
    //ОснДоверОргСост - Основание, по которому экономический субъект является составителем файла обмена информации покупателя
    property DocumentCreatorBase:TDocumentRequisitesType read FDocumentCreatorBase;
    //НаимЭконСубСост - Наименование экономического субъекта - составителя файла обмена
    //информации покупателя
    property DocumentCreator:Tstring1000 read FDocumentCreator write SetDocumentCreator;
    //ВидОпер
    property OperationCode:Tstring255 read FOperationCode write SetOperationCode;
    //СодОпер - Содержание операции
    property OperationContent:Tstring255 read FOperationContent write SetOperationContent;
    //ДатаПрин - Дата принятия товаров (результатов выполненных работ), имущественных
    //прав (подтверждения факта оказания услуг)
    property AcceptanceDate:Tdate1 read FAcceptanceDate write SetAcceptanceDate;
  end;

  {  TContentOperCode  }
  TContentOperCode = class(TXmlSerializationObject)
  private
    FDiscrepDocument:TDocumentRequisitesType;
    FTotalCode:String;
    procedure SetTotalCode( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    //РеквДокРасх - Реквизиты документа, оформляющего расхождения
    property DiscrepDocument:TDocumentRequisitesType read FDiscrepDocument;
    //Код итога - Код, обозначающий итог приемки товара (работ, услуг, прав)1 - товары (работы, услуги, права) приняты без расхождений (претензий)2 - товары (работы, услуги, права) приняты с расхождениями (претензией)3 - товары (работы, услуги, права) не приняты
    property TotalCode:String read FTotalCode write SetTotalCode;
  end;

  {  TBuyerInfoCircumPublicProc  }
  TBuyerInfoCircumPublicProc = class(TXmlSerializationObject)
  private
    FInfoFundsLiab:TInfoFundsLiabList;
    FProcCode:Tstring36;
    FPersonalAccountBuyer:String;
    FNameFinAuthority:Tstring2000;
    FBuyerRegistryEntryNumber:String;
    FBuyerLiabNumber:String;
    FBuyerTreasuryCode:Tstring4;
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
    procedure SetBuyerTreasuryCode( AValue:Tstring4);
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
    //ИнфСведДенОбяз - Информация для сведений о денежном обязательстве
    property InfoFundsLiab:TInfoFundsLiabList read FInfoFundsLiab;
    //ИдКодЗак - Идентификационный код закупки
    property ProcCode:Tstring36 read FProcCode write SetProcCode;
    //ЛицСчетПок - Номер лицевого счета покупателя
    property PersonalAccountBuyer:String read FPersonalAccountBuyer write SetPersonalAccountBuyer;
    //НаимФинОргПок - Наименование финансового органа покупателя
    property NameFinAuthority:Tstring2000 read FNameFinAuthority write SetNameFinAuthority;
    //НомРеестрЗапПок - Номер реестровой записи покупателя по Реестру участников бюджетного процесса, а также юридических лиц, не являющихся участниками бюджетного процесса
    property BuyerRegistryEntryNumber:String read FBuyerRegistryEntryNumber write SetBuyerRegistryEntryNumber;
    //УчНомБюдОбязПок - Учетный номер бюджетного обязательства покупателя
    property BuyerLiabNumber:String read FBuyerLiabNumber write SetBuyerLiabNumber;
    //КодКазначПок - Код территориального органа Федерального казначейства покупателя
    property BuyerTreasuryCode:Tstring4 read FBuyerTreasuryCode write SetBuyerTreasuryCode;
    //НаимКазначПок - Наименование территориального органа Федерального казначейства покупателя
    property BuyerTreasuryName:Tstring2000 read FBuyerTreasuryName write SetBuyerTreasuryName;
    //ОКТМОПок - Код покупателя в Общероссийском классификаторе территорий муниципальных образований
    property OKTMOBuy:Toktmo read FOKTMOBuy write SetOKTMOBuy;
    //ОКТМОМесПост - Код места поставки в Общероссийском классификаторе территорий муниципальных образований
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

  {  TInfoFundsLiab  }
  TInfoFundsLiab = class(TXmlSerializationObject)
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
    //НомСтр - Порядковый номер записи (строки) информации продавца
    property NumberString:Int64 read FNumberString write SetNumberString;
    //КодОбъектФАИП - Код объекта капитального строительства федеральной адресной инвестиционной программы/код мероприятия по информатизации
    property ObjectCodeFAIP:Tstring24 read FObjectCodeFAIP write SetObjectCodeFAIP;
    //ВидСредств - Вид средств
    property FundsSourceType:String read FFundsSourceType write SetFundsSourceType;
    //КодПокБюджКласс - Код по бюджетной классификации (покупатель)
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

implementation

  {  TUniversalTransferDocumentBuyerTitle  }
procedure TUniversalTransferDocumentBuyerTitle.SetDocumentCreator(AValue: Tstring1000);
begin
  CheckStrMinSize('DocumentCreator', AValue);
  CheckStrMaxSize('DocumentCreator', AValue);
  FDocumentCreator:=AValue;
  ModifiedProperty('DocumentCreator');
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
  P:=RegisterProperty('ContentOperCode', 'ContentOperCode', [], '', -1, -1);
  P:=RegisterProperty('Employee', 'Employee', [], '', -1, -1);
  P:=RegisterProperty('OtherIssuer', 'OtherIssuer', [], '', -1, -1);
  P:=RegisterProperty('AdditionalInfoId', 'AdditionalInfoId', [], '', -1, -1);
  P:=RegisterProperty('BuyerInfoCircumPublicProc', 'BuyerInfoCircumPublicProc', [], '', -1, -1);
  P:=RegisterProperty('Signers', 'Signers', [], '', -1, -1);
  P:=RegisterProperty('DocumentCreatorBase', 'DocumentCreatorBase', [], '', -1, -1);
  P:=RegisterProperty('DocumentCreator', 'DocumentCreator', [], '', 1, 1000);
  P:=RegisterProperty('OperationCode', 'OperationCode', [], '', 1, 255);
  P:=RegisterProperty('OperationContent', 'OperationContent', [], '', 1, 255);
  P:=RegisterProperty('AcceptanceDate', 'AcceptanceDate', [xsaRequared], '', 10, 10);
end;

procedure TUniversalTransferDocumentBuyerTitle.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FContentOperCode:=UniversalTransferDocumentBuyerTitle_ContentOperCode.Create;
  FEmployee:=TEmployeeUtd970.Create;
  FOtherIssuer:=TOtherIssuerUtd970.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FBuyerInfoCircumPublicProc:=TBuyerInfoCircumPublicProc.Create;
  FSigners:=TSigners.Create;
  FDocumentCreatorBase:=TDocumentRequisitesType.Create;
end;

destructor TUniversalTransferDocumentBuyerTitle.Destroy;
begin
  FContentOperCode.Free;
  FEmployee.Free;
  FOtherIssuer.Free;
  FAdditionalInfoId.Free;
  FBuyerInfoCircumPublicProc.Free;
  FSigners.Free;
  FDocumentCreatorBase.Free;
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

  {  TContentOperCode  }
procedure TContentOperCode.SetTotalCode(AValue: String);
begin
  CheckLockupValue('TotalCode', AValue);
  CheckStrMinSize('TotalCode', AValue);
  CheckStrMaxSize('TotalCode', AValue);
  FTotalCode:=AValue;
  ModifiedProperty('TotalCode');
end;

procedure TContentOperCode.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('DiscrepDocument', 'DiscrepDocument', [], '', -1, -1);
  P:=RegisterProperty('TotalCode', 'TotalCode', [xsaRequared], '', 1, 1);
    P.ValidList.Add('1');
    P.ValidList.Add('2');
    P.ValidList.Add('3');
end;

procedure TContentOperCode.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FDiscrepDocument:=TDocumentRequisitesType.Create;
end;

destructor TContentOperCode.Destroy;
begin
  FDiscrepDocument.Free;
  inherited Destroy;
end;

constructor TContentOperCode.Create;
begin
  inherited Create;
end;

  {  TBuyerInfoCircumPublicProc  }
procedure TBuyerInfoCircumPublicProc.SetProcCode(AValue: Tstring36);
begin
  CheckStrMinSize('ProcCode', AValue);
  CheckStrMaxSize('ProcCode', AValue);
  FProcCode:=AValue;
  ModifiedProperty('ProcCode');
end;

procedure TBuyerInfoCircumPublicProc.SetPersonalAccountBuyer(AValue: String);
begin
  CheckStrMinSize('PersonalAccountBuyer', AValue);
  CheckStrMaxSize('PersonalAccountBuyer', AValue);
  FPersonalAccountBuyer:=AValue;
  ModifiedProperty('PersonalAccountBuyer');
end;

procedure TBuyerInfoCircumPublicProc.SetNameFinAuthority(AValue: Tstring2000);
begin
  CheckStrMinSize('NameFinAuthority', AValue);
  CheckStrMaxSize('NameFinAuthority', AValue);
  FNameFinAuthority:=AValue;
  ModifiedProperty('NameFinAuthority');
end;

procedure TBuyerInfoCircumPublicProc.SetBuyerRegistryEntryNumber(AValue: String);
begin
  CheckStrMinSize('BuyerRegistryEntryNumber', AValue);
  CheckStrMaxSize('BuyerRegistryEntryNumber', AValue);
  FBuyerRegistryEntryNumber:=AValue;
  ModifiedProperty('BuyerRegistryEntryNumber');
end;

procedure TBuyerInfoCircumPublicProc.SetBuyerLiabNumber(AValue: String);
begin
  CheckStrMinSize('BuyerLiabNumber', AValue);
  CheckStrMaxSize('BuyerLiabNumber', AValue);
  FBuyerLiabNumber:=AValue;
  ModifiedProperty('BuyerLiabNumber');
end;

procedure TBuyerInfoCircumPublicProc.SetBuyerTreasuryCode(AValue: Tstring4);
begin
  CheckStrMinSize('BuyerTreasuryCode', AValue);
  CheckStrMaxSize('BuyerTreasuryCode', AValue);
  FBuyerTreasuryCode:=AValue;
  ModifiedProperty('BuyerTreasuryCode');
end;

procedure TBuyerInfoCircumPublicProc.SetBuyerTreasuryName(AValue: Tstring2000);
begin
  CheckStrMinSize('BuyerTreasuryName', AValue);
  CheckStrMaxSize('BuyerTreasuryName', AValue);
  FBuyerTreasuryName:=AValue;
  ModifiedProperty('BuyerTreasuryName');
end;

procedure TBuyerInfoCircumPublicProc.SetOKTMOBuy(AValue: Toktmo);
begin
  CheckStrMinSize('OKTMOBuy', AValue);
  CheckStrMaxSize('OKTMOBuy', AValue);
  FOKTMOBuy:=AValue;
  ModifiedProperty('OKTMOBuy');
end;

procedure TBuyerInfoCircumPublicProc.SetOKTMOPlaceDelivery(AValue: Toktmo);
begin
  CheckStrMinSize('OKTMOPlaceDelivery', AValue);
  CheckStrMaxSize('OKTMOPlaceDelivery', AValue);
  FOKTMOPlaceDelivery:=AValue;
  ModifiedProperty('OKTMOPlaceDelivery');
end;

procedure TBuyerInfoCircumPublicProc.SetPayDeadLine(AValue: Tdate1);
begin
  CheckStrMinSize('PayDeadLine', AValue);
  CheckStrMaxSize('PayDeadLine', AValue);
  FPayDeadLine:=AValue;
  ModifiedProperty('PayDeadLine');
end;

procedure TBuyerInfoCircumPublicProc.SetNumberFundsLiab(AValue: String);
begin
  CheckStrMinSize('NumberFundsLiab', AValue);
  CheckStrMaxSize('NumberFundsLiab', AValue);
  FNumberFundsLiab:=AValue;
  ModifiedProperty('NumberFundsLiab');
end;

procedure TBuyerInfoCircumPublicProc.SetPaymentPriority(AValue: String);
begin
  CheckStrMinSize('PaymentPriority', AValue);
  CheckStrMaxSize('PaymentPriority', AValue);
  FPaymentPriority:=AValue;
  ModifiedProperty('PaymentPriority');
end;

procedure TBuyerInfoCircumPublicProc.SetPaymentType(AValue: String);
begin
  CheckLockupValue('PaymentType', AValue);
  CheckStrMinSize('PaymentType', AValue);
  CheckStrMaxSize('PaymentType', AValue);
  FPaymentType:=AValue;
  ModifiedProperty('PaymentType');
end;

procedure TBuyerInfoCircumPublicProc.InternalRegisterPropertys;
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
  P:=RegisterProperty('BuyerTreasuryCode', 'BuyerTreasuryCode', [], '', 1, 4);
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

procedure TBuyerInfoCircumPublicProc.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FInfoFundsLiab:=TInfoFundsLiabList.Create;
end;

destructor TBuyerInfoCircumPublicProc.Destroy;
begin
  FInfoFundsLiab.Free;
  inherited Destroy;
end;

constructor TBuyerInfoCircumPublicProc.Create;
begin
  inherited Create;
end;

  {  TInfoFundsLiab  }
procedure TInfoFundsLiab.SetNumberString(AValue: Int64);
begin
  FNumberString:=AValue;
  ModifiedProperty('NumberString');
end;

procedure TInfoFundsLiab.SetObjectCodeFAIP(AValue: Tstring24);
begin
  CheckStrMinSize('ObjectCodeFAIP', AValue);
  CheckStrMaxSize('ObjectCodeFAIP', AValue);
  FObjectCodeFAIP:=AValue;
  ModifiedProperty('ObjectCodeFAIP');
end;

procedure TInfoFundsLiab.SetFundsSourceType(AValue: String);
begin
  CheckLockupValue('FundsSourceType', AValue);
  CheckStrMinSize('FundsSourceType', AValue);
  CheckStrMaxSize('FundsSourceType', AValue);
  FFundsSourceType:=AValue;
  ModifiedProperty('FundsSourceType');
end;

procedure TInfoFundsLiab.SetBuyerBudjetClassCode(AValue: Tstring20f);
begin
  CheckStrMinSize('BuyerBudjetClassCode', AValue);
  CheckStrMaxSize('BuyerBudjetClassCode', AValue);
  FBuyerBudjetClassCode:=AValue;
  ModifiedProperty('BuyerBudjetClassCode');
end;

procedure TInfoFundsLiab.SetBuyerTargetCode(AValue: Tstring20);
begin
  CheckStrMinSize('BuyerTargetCode', AValue);
  CheckStrMaxSize('BuyerTargetCode', AValue);
  FBuyerTargetCode:=AValue;
  ModifiedProperty('BuyerTargetCode');
end;

procedure TInfoFundsLiab.SetAmountAdvance(AValue: Double);
begin
  FAmountAdvance:=AValue;
  ModifiedProperty('AmountAdvance');
end;

procedure TInfoFundsLiab.InternalRegisterPropertys;
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

procedure TInfoFundsLiab.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInfoFundsLiab.Destroy;
begin
  inherited Destroy;
end;

constructor TInfoFundsLiab.Create;
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

end.