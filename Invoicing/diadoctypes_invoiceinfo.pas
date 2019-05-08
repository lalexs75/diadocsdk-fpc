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

unit DiadocTypes_InvoiceInfo;

{$I diadoc_define.inc}

interface

//import "Invoicing/Signer.proto";
//import "Invoicing/OrganizationInfo.proto";
uses
  Classes, SysUtils, protobuf_fpc,
  diadoc_simple_arrays,
  DiadocTypes_Signer,
  DiadocTypes_OrganizationInfo;

type
  TInvoiceFormatVersion = (
    DefaultInvoiceFormatVersion = 0,
    v5_01 = 1,
    v5_02 = 2
  );

  TTaxRate = (
    NoVat = 0,
    Percent_0 = 1,
    Percent_10 = 2,
    Percent_18 = 3,
    Percent_20 = 4,
    Fraction_10_110 = 5,
    Fraction_18_118 = 6,
    TaxedByAgent = 7,
    Fraction_20_120 = 8
  );

  { TInvoiceItemAmountsDiff }
  //message InvoiceItemAmountsDiff {
  //	optional string Excise = 1;						// акциз
  //	optional string SubtotalWithVatExcluded = 2;	// сумма без учета налога
  //	optional string Vat = 3;						// сумма налога
  //	optional string Subtotal = 4;					// сумма с учетом налога
  //}
  TInvoiceItemAmountsDiff = class(TSerializationObject) //message InvoiceItemAmountsDiff
  private
    FExcise: string;
    FSubtotal: string;
    FSubtotalWithVatExcluded: string;
    FVat: string;
    procedure SetExcise(AValue: string);
    procedure SetSubtotal(AValue: string);
    procedure SetSubtotalWithVatExcluded(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Excise:string read FExcise write SetExcise; //1;
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded; //2;
    property Vat:string read FVat write SetVat; //3;
    property Subtotal:string read FSubtotal write SetSubtotal; //4;
  end;

  { TCorrectableInvoiceItemFields }
  //message CorrectableInvoiceItemFields {
  //	optional string Unit = 1;						// единицы измерения товара (код)
  //	optional string Quantity = 2;					// количество единиц товара
  //	optional string Price = 3;						// цена за единицу товара
  //	optional string Excise = 4;						// акциз
  //	required TaxRate TaxRate = 5;					// ставка налога
  //	optional string SubtotalWithVatExcluded = 6;	// сумма без учета налога
  //	optional string Vat = 7;						// сумма налога
  //	required string Subtotal = 8;					// сумма с учетом налога
  //}
  TCorrectableInvoiceItemFields = class(TSerializationObject) //message CorrectableInvoiceItemFields
  private
    FExcise: string;
    FPrice: string;
    FQuantity: string;
    FSubtotal: string;
    FSubtotalWithVatExcluded: string;
    FTaxRate: TTaxRate;
    FUnt: string;
    FVat: string;
    procedure SetExcise(AValue: string);
    procedure SetPrice(AValue: string);
    procedure SetQuantity(AValue: string);
    procedure SetSubtotal(AValue: string);
    procedure SetSubtotalWithVatExcluded(AValue: string);
    procedure SetTaxRate(AValue: TTaxRate);
    procedure SetUnt(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Unt:string read FUnt write SetUnt; //1;						// единицы измерения товара (код)
    property Quantity:string read FQuantity write SetQuantity; //2;					// количество единиц товара
    property Price:string read FPrice write SetPrice; //3;						// цена за единицу товара
    property Excise:string read FExcise write SetExcise; //4;						// акциз
    property TaxRate:TTaxRate read FTaxRate write SetTaxRate; //5;
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded; //6;	// сумма без учета налога
    property Vat:string read FVat write SetVat; //7;						// сумма налога
    property Subtotal:string read FSubtotal write SetSubtotal; //8;					// сумма с учетом налога
  end;


  { TAdditionalInfo }
  //message AdditionalInfo {
  //	required string Id = 1;		// Идентификатор
  //	required string Value = 2;	// Значение
  //}
  TAdditionalInfo = class(TSerializationObject) //message AdditionalInfo
  private
    FId: string;
    FValue: string;
    procedure SetId(AValue: string);
    procedure SetValue(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Id:string read FId write SetId; //1
    property Value:string read FValue write SetValue; //2
  end;
  //TAdditionalInfos = specialize GSerializationObjectList<TAdditionalInfo>;
  TCustomAdditionalInfos = specialize GSerializationObjectList<TAdditionalInfo>;
  TAdditionalInfos = class(TCustomAdditionalInfos)
  public
    function InfoByID(AID:string):string;
  end;



  { TInvoiceCorrectionItem }
  //message InvoiceCorrectionItem {
  //	required string Product = 1;					// наименование товара
  //	required CorrectableInvoiceItemFields OriginalValues = 2;	// значения до изменения
  //	required CorrectableInvoiceItemFields CorrectedValues = 3;	// значения после изменения
  //	optional InvoiceItemAmountsDiff AmountsInc = 4;			// суммы к увеличению
  //	optional InvoiceItemAmountsDiff AmountsDec = 5;			// суммы к уменьшению
  //	optional string AdditionalInfo = 6;			        // информационное поле товара v5.01
  //	repeated AdditionalInfo AdditionalInfos = 7;			// информационное поле документа v5.02
  //}
  TInvoiceCorrectionItem = class(TSerializationObject) //message InvoiceCorrectionItem
  private
    FAdditionalInfo: string;
    FAdditionalInfos: TAdditionalInfos;
    FAmountsDec: TInvoiceItemAmountsDiff;
    FAmountsInc: TInvoiceItemAmountsDiff;
    FCorrectedValues: TCorrectableInvoiceItemFields;
    FOriginalValues: TCorrectableInvoiceItemFields;
    FProduct: string;
    procedure SetAdditionalInfo(AValue: string);
    procedure SetProduct(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Product:string read FProduct write SetProduct;  //1
    property OriginalValues:TCorrectableInvoiceItemFields read FOriginalValues; //2
    property CorrectedValues:TCorrectableInvoiceItemFields read FCorrectedValues; //3;
    property AmountsInc:TInvoiceItemAmountsDiff read FAmountsInc; //4
    property AmountsDec:TInvoiceItemAmountsDiff read FAmountsDec; //5
    property AdditionalInfo:string read FAdditionalInfo write SetAdditionalInfo; //6
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos; //7
  end;
  TInvoiceCorrectionItems = specialize GSerializationObjectList<TInvoiceCorrectionItem>;


  { TInvoiceTotalsDiff }
  //message InvoiceTotalsDiff {
  //	optional string TotalWithVatExcluded = 1;	// сумма без учета налога
  //	optional string Vat = 2;			// сумма налога
  //	required string Total = 3;			// сумма всего
  //}
  TInvoiceTotalsDiff = class(TSerializationObject) //message InvoiceTotalsDiff
  private
    FTotal: string;
    FTotalWithVatExcluded: string;
    FVat: string;
    procedure SetTotal(AValue: string);
    procedure SetTotalWithVatExcluded(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TotalWithVatExcluded:string read FTotalWithVatExcluded write SetTotalWithVatExcluded; //1
    property Vat:string read FVat write SetVat; //2;
    property Total:string read FTotal write SetTotal; //3;
  end;


  { TInvoiceCorrectionInfo }
  //message InvoiceCorrectionInfo {
  //	required string InvoiceDate = 1;						// дата СФ
  //	required string InvoiceNumber = 2;						// номер СФ
  //	optional string InvoiceRevisionDate = 3;				// дата ИСФ (заполняется, если КСФ/ИКСФ формируется на исправленный СФ)
  //	optional string InvoiceRevisionNumber = 4;				// номер ИСФ (заполняется, если КСФ/ИКСФ формируется на исправленный СФ)
  //	required string InvoiceCorrectionDate = 5;				// дата КСФ
  //	required string InvoiceCorrectionNumber = 6;			// номер КСФ
  //	optional string InvoiceCorrectionRevisionDate = 7;		// дата ИКСФ (обязательно при формировании InvoiceCorrectionRevision)
  //	optional string InvoiceCorrectionRevisionNumber = 8;	// номер ИКСФ (обязательно при формировании InvoiceCorrectionRevision)
  //	required DiadocOrganizationInfo Seller = 9;				// продавец
  //	required DiadocOrganizationInfo Buyer = 10;				// покупатель
  //	required Signer Signer = 11;							// подписант
  //	repeated InvoiceCorrectionItem Items = 12;				// информация о товарах
  //	optional string Currency = 13;							// валюта (код)
  //	optional InvoiceTotalsDiff TotalsInc = 14;				// суммы к увеличению
  //	optional InvoiceTotalsDiff TotalsDec = 15;				// суммы к уменьшению
  //	optional string AdditionalInfo = 16;					// информационное поле документа v5.01
  //	repeated AdditionalInfo AdditionalInfos = 17;			// информационное поле документа v5.02
  //	optional InvoiceFormatVersion Version = 18 [default = DefaultInvoiceFormatVersion];	// версия формата ФУФа (для тестирования систем в переходном периоде)
  //}
  TInvoiceCorrectionInfo = class(TSerializationObject) //message InvoiceCorrectionInfo
  private
    FAdditionalInfo: string;
    FAdditionalInfos: TAdditionalInfos;
    FBuyer: TDiadocOrganizationInfo;
    FCurrency: string;
    FInvoiceCorrectionDate: string;
    FInvoiceCorrectionNumber: string;
    FInvoiceCorrectionRevisionDate: string;
    FInvoiceCorrectionRevisionNumber: string;
    FInvoiceDate: string;
    FInvoiceNumber: string;
    FInvoiceRevisionDate: string;
    FInvoiceRevisionNumber: string;
    FItems: TInvoiceCorrectionItems;
    FSeller: TDiadocOrganizationInfo;
    FSigner: TSigner;
    FTotalsDec: TInvoiceTotalsDiff;
    FTotalsInc: TInvoiceTotalsDiff;
    FVersion: TInvoiceFormatVersion;
    procedure SetAdditionalInfo(AValue: string);
    procedure SetCurrency(AValue: string);
    procedure SetInvoiceCorrectionDate(AValue: string);
    procedure SetInvoiceCorrectionNumber(AValue: string);
    procedure SetInvoiceCorrectionRevisionDate(AValue: string);
    procedure SetInvoiceCorrectionRevisionNumber(AValue: string);
    procedure SetInvoiceDate(AValue: string);
    procedure SetInvoiceNumber(AValue: string);
    procedure SetInvoiceRevisionDate(AValue: string);
    procedure SetInvoiceRevisionNumber(AValue: string);
    procedure SetVersion(AValue: TInvoiceFormatVersion);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InvoiceDate:string read FInvoiceDate write SetInvoiceDate; //1
    property InvoiceNumber:string read FInvoiceNumber write SetInvoiceNumber; //2;
    property InvoiceRevisionDate:string read FInvoiceRevisionDate write SetInvoiceRevisionDate; //3;
    property InvoiceRevisionNumber:string read FInvoiceRevisionNumber write SetInvoiceRevisionNumber; //4;
    property InvoiceCorrectionDate:string read FInvoiceCorrectionDate write SetInvoiceCorrectionDate; //5;
    property InvoiceCorrectionNumber:string read FInvoiceCorrectionNumber write SetInvoiceCorrectionNumber; //6;
    property InvoiceCorrectionRevisionDate:string read FInvoiceCorrectionRevisionDate write SetInvoiceCorrectionRevisionDate; //7;
    property InvoiceCorrectionRevisionNumber:string read FInvoiceCorrectionRevisionNumber write SetInvoiceCorrectionRevisionNumber; //8;
    property Seller:TDiadocOrganizationInfo read FSeller; //9;
    property Buyer:TDiadocOrganizationInfo read FBuyer; //10;
    property Signer:TSigner read FSigner; //11;
    property Items:TInvoiceCorrectionItems read FItems; //12;
    property Currency:string read FCurrency write SetCurrency; //13
    property TotalsInc:TInvoiceTotalsDiff read FTotalsInc; //14
    property TotalsDec:TInvoiceTotalsDiff read FTotalsDec; //15
    property AdditionalInfo:string read FAdditionalInfo write SetAdditionalInfo; //16;
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos; //17
    property Version:TInvoiceFormatVersion read FVersion write SetVersion default DefaultInvoiceFormatVersion; //18
  end;


  { TShipperOrConsignee }
  //message ShipperOrConsignee {
  //	optional bool SameAsSellerOrBuyer = 1;	// совпадает с продавцом/покупателем
  //	optional OrganizationInfo OrgInfo = 2;	// реквизиты организации
  //}
  TShipperOrConsignee = class(TSerializationObject) //message ShipperOrConsignee
  private
    FOrgInfo: TOrganizationInfo;
    FSameAsSellerOrBuyer: Boolean;
    procedure SetSameAsSellerOrBuyer(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SameAsSellerOrBuyer:Boolean read FSameAsSellerOrBuyer write SetSameAsSellerOrBuyer;//1
    property OrgInfo:TOrganizationInfo read FOrgInfo;//2
  end;


  { TPaymentDocumentInfo }
  //message PaymentDocumentInfo {
  //	required string DocumentDate = 1;
  //	required string DocumentNumber = 2;
  //}
  TPaymentDocumentInfo = class(TSerializationObject) //message PaymentDocumentInfo
  private
    FDocumentDate: string;
    FDocumentNumber: string;
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentDate:string read FDocumentDate write SetDocumentDate; //1;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber; //2;
  end;
  TPaymentDocumentInfos = specialize GSerializationObjectList<TPaymentDocumentInfo>;

  { TCustomsDeclaration }
  //message CustomsDeclaration {
  //	required string CountryCode = 1;			// код страны происхождения товара
  //	required string DeclarationNumber = 2;			// номер таможенной декларации
  //}
  TCustomsDeclaration = class(TSerializationObject) //message CustomsDeclaration
  private
    FCountryCode: string;
    FDeclarationNumber: string;
    procedure SetCountryCode(AValue: string);
    procedure SetDeclarationNumber(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property CountryCode:string read FCountryCode write SetCountryCode; //1
    property DeclarationNumber:string read FDeclarationNumber write SetDeclarationNumber; //2
  end;
  TCustomsDeclarations = specialize GSerializationObjectList<TCustomsDeclaration>;

  {  TInvoiceItem  }
  //message InvoiceItem {
  //	required string Product = 1;					// наименование товара
  //	optional string Unit = 2;					// единицы измерения товара (код)
  //	optional string Quantity = 3;					// количество единиц товара
  //	optional string Price = 4;					// цена за единицу товара
  //	repeated string CountriesOfOrigin = 5;	                        // страны происхождения товара (коды)  v5.01
  //	repeated string CustomsDeclarationNumbers = 6;	                // номера таможенных деклараций        v5.01
  //	optional string Excise = 7;					// акциз
  //	required TaxRate TaxRate = 8; 					// ставка налога
  //	optional string SubtotalWithVatExcluded = 9;	                // сумма без учета налога
  //	optional string Vat = 10;					// сумма налога
  //	required string Subtotal = 11;					// сумма всего
  //	optional string AdditionalInfo = 12;			        // информационное поле товара v5.01
  //	repeated CustomsDeclaration CustomsDeclarations = 13;           // номера таможенных деклараций v5.02
  //	repeated AdditionalInfo AdditionalInfos = 14;	                // информационное поле товара v5.02
  //}
  TInvoiceItem = class(TSerializationObject) //message InvoiceItem
  private
    FAdditionalInfo: string;
    FAdditionalInfos: TAdditionalInfos;
    FCountriesOfOrigin: TDocumentStrings;
    FCustomsDeclarationNumbers: TDocumentStrings;
    FCustomsDeclarations: TCustomsDeclarations;
    FExcise: string;
    FPrice: string;
    FProduct: string;
    FQuantity: string;
    FSubtotal: string;
    FSubtotalWithVatExcluded: string;
    FTaxRate: TTaxRate;
    FUnt: string;
    FVat: string;
    function GetUnitCode: Integer;
    procedure SetAdditionalInfo(AValue: string);
    procedure SetExcise(AValue: string);
    procedure SetPrice(AValue: string);
    procedure SetProduct(AValue: string);
    procedure SetQuantity(AValue: string);
    procedure SetSubtotal(AValue: string);
    procedure SetSubtotalWithVatExcluded(AValue: string);
    procedure SetTaxRate(AValue: TTaxRate);
    procedure SetUnt(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
    property UnitCode:Integer read GetUnitCode;
  published
    property Product:string read FProduct write SetProduct;//1
    property Unt:string read FUnt write SetUnt;//2;
    property Quantity:string read FQuantity write SetQuantity;//3
    property Price:string read FPrice write SetPrice;//4
    property CountriesOfOrigin:TDocumentStrings read FCountriesOfOrigin; //5
    property CustomsDeclarationNumbers:TDocumentStrings read FCustomsDeclarationNumbers; //6
    property Excise:string read FExcise write SetExcise;//7
    property TaxRate:TTaxRate read FTaxRate write SetTaxRate; //8
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;//9
    property Vat:string read FVat write SetVat;//10
    property Subtotal:string read FSubtotal write SetSubtotal;//11
    property AdditionalInfo:string read FAdditionalInfo write SetAdditionalInfo;//12
    property CustomsDeclarations:TCustomsDeclarations read FCustomsDeclarations; //13
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos; //14
  end;
  TInvoiceItems = specialize GSerializationObjectList<TInvoiceItem>;

  {  TInvoiceInfo  }
  //message InvoiceInfo {
  //	required string InvoiceDate = 1;				// дата СФ
  //	required string InvoiceNumber = 2;				// номер СФ
  //	required DiadocOrganizationInfo Seller = 3;			// продавец
  //	required DiadocOrganizationInfo Buyer = 4;			// покупатель
  //	optional ShipperOrConsignee Shipper = 5;			// грузоотправитель
  //	optional ShipperOrConsignee Consignee = 6;			// грузополучатель
  //	required Signer Signer = 7;					// подписант
  //	repeated PaymentDocumentInfo PaymentDocuments = 8;	        // платежно-расчетные документы
  //	repeated InvoiceItem Items = 9;					// информация о товарах
  //	optional string Currency = 10;					// валюта (код)
  //	optional string TotalWithVatExcluded = 11;			// сумма без учета налога
  //	optional string Vat = 12;					// сумма налога
  //	required string Total = 13;					// сумма всего
  //	optional string AdditionalInfo = 14;				// информационное поле документа v5.01
  //	optional string InvoiceRevisionDate = 15;			// дата ИСФ (обязательно при формировании InvoiceRevision)
  //	optional string InvoiceRevisionNumber = 16;			// номер ИСФ (обязательно при формировании InvoiceRevision)
  //	repeated AdditionalInfo AdditionalInfos = 17;		        // информационное поле документа v5.02
  //	optional InvoiceFormatVersion Version = 18 [default = DefaultInvoiceFormatVersion];	// версия формата ФУФа (для тестирования систем в переходном периоде)
  //}
  TInvoiceInfo = class(TSerializationObject) //message InvoiceInfo
  private
    FAdditionalInfo: string;
    FAdditionalInfos: TAdditionalInfos;
    FBuyer: TDiadocOrganizationInfo;
    FConsignee: TShipperOrConsignee;
    FCurrency: string;
    FInvoiceDate: string;
    FInvoiceNumber: string;
    FInvoiceRevisionDate: string;
    FInvoiceRevisionNumber: string;
    FItems: TInvoiceItems;
    FPaymentDocuments: TPaymentDocumentInfos;
    FSeller: TDiadocOrganizationInfo;
    FShipper: TShipperOrConsignee;
    FSigner: TSigner;
    FTotal: string;
    FTotalWithVatExcluded: string;
    FVat: string;
    FVersion: TInvoiceFormatVersion;
    procedure SetAdditionalInfo(AValue: string);
    procedure SetCurrency(AValue: string);
    procedure SetInvoiceDate(AValue: string);
    procedure SetInvoiceNumber(AValue: string);
    procedure SetInvoiceRevisionDate(AValue: string);
    procedure SetInvoiceRevisionNumber(AValue: string);
    procedure SetTotal(AValue: string);
    procedure SetTotalWithVatExcluded(AValue: string);
    procedure SetVat(AValue: string);
    procedure SetVersion(AValue: TInvoiceFormatVersion);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InvoiceDate:string read FInvoiceDate write SetInvoiceDate; //1;
    property InvoiceNumber:string read FInvoiceNumber write SetInvoiceNumber; //2;
    property Seller:TDiadocOrganizationInfo read FSeller; //3;
    property Buyer:TDiadocOrganizationInfo read FBuyer; //4;
    property Shipper:TShipperOrConsignee read FShipper; //5;
    property Consignee:TShipperOrConsignee read FConsignee; //6;
    property Signer:TSigner read FSigner; //7;
    property PaymentDocuments:TPaymentDocumentInfos read FPaymentDocuments; //8;
    property Items:TInvoiceItems read FItems; //9;
    property Currency:string read FCurrency write SetCurrency; //10;
    property TotalWithVatExcluded:string read FTotalWithVatExcluded write SetTotalWithVatExcluded; //11;
    property Vat:string read FVat write SetVat; //12;
    property Total:string read FTotal write SetTotal; //13;
    property AdditionalInfo:string read FAdditionalInfo write SetAdditionalInfo; //14;
    property InvoiceRevisionDate:string read FInvoiceRevisionDate write SetInvoiceRevisionDate; //15;
    property InvoiceRevisionNumber:string read FInvoiceRevisionNumber write SetInvoiceRevisionNumber; //16;
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos; //17
    property Version:TInvoiceFormatVersion read FVersion write SetVersion default DefaultInvoiceFormatVersion; //18
  end;

function TaxRateToStr(ATaxRate:TTaxRate):string;
implementation
uses StrUtils, diadoc_consts;

function TaxRateToStr(ATaxRate:TTaxRate):string;
begin
  case ATaxRate of
    Percent_0      : Result:=sTaxRatePercent_0;
    Percent_10     : Result:=sTaxRatePercent_10;
    Percent_18     : Result:=sTaxRatePercent_18;
    Percent_20     : Result:=sTaxRatePercent_20;
    Fraction_10_110: Result:=sTaxRateFraction_10_110;
    Fraction_18_118: Result:=sTaxRateFraction_18_118;
    TaxedByAgent   : Result:=sTaxRateTaxedByAgent;
    Fraction_20_120: Result:=sTaxRateFraction_20_120;
  else
    //NoVat
    Result:=sTaxRateNoVat;
  end;
end;

{ TAdditionalInfos }

function TAdditionalInfos.InfoByID(AID: string): string;
var
  AI:TAdditionalInfo;
begin
  Result:='';
  for AI in Self do
    if AI.Id = AID then
      Exit(AI.Value);
end;


{ TInvoiceInfo }

procedure TInvoiceInfo.SetAdditionalInfo(AValue: string);
begin
  if FAdditionalInfo=AValue then Exit;
  FAdditionalInfo:=AValue;
  Modified(14);
end;

procedure TInvoiceInfo.SetCurrency(AValue: string);
begin
  if FCurrency=AValue then Exit;
  FCurrency:=AValue;
  Modified(10);
end;

procedure TInvoiceInfo.SetInvoiceDate(AValue: string);
begin
  if FInvoiceDate=AValue then Exit;
  FInvoiceDate:=AValue;
  Modified(1);
end;

procedure TInvoiceInfo.SetInvoiceNumber(AValue: string);
begin
  if FInvoiceNumber=AValue then Exit;
  FInvoiceNumber:=AValue;
  Modified(2);
end;

procedure TInvoiceInfo.SetInvoiceRevisionDate(AValue: string);
begin
  if FInvoiceRevisionDate=AValue then Exit;
  FInvoiceRevisionDate:=AValue;
  Modified(15);
end;

procedure TInvoiceInfo.SetInvoiceRevisionNumber(AValue: string);
begin
  if FInvoiceRevisionNumber=AValue then Exit;
  FInvoiceRevisionNumber:=AValue;
  Modified(16);
end;

procedure TInvoiceInfo.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(13);
end;

procedure TInvoiceInfo.SetTotalWithVatExcluded(AValue: string);
begin
  if FTotalWithVatExcluded=AValue then Exit;
  FTotalWithVatExcluded:=AValue;
  Modified(11);
end;

procedure TInvoiceInfo.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(12);
end;

procedure TInvoiceInfo.SetVersion(AValue: TInvoiceFormatVersion);
begin
  FVersion:=AValue;
  Modified(18);
end;

procedure TInvoiceInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InvoiceDate', 1, true);
  RegisterProp('InvoiceNumber', 2, true);
  RegisterProp('Seller', 3, true);
  RegisterProp('Buyer', 4, true);
  RegisterProp('Shipper', 5);
  RegisterProp('Consignee', 6);
  RegisterProp('Signer', 7, true);
  RegisterProp('PaymentDocuments', 8);
  RegisterProp('Items', 9);
  RegisterProp('Currency', 10);
  RegisterProp('TotalWithVatExcluded', 11);
  RegisterProp('Vat', 12);
  RegisterProp('Total', 13, true);
  RegisterProp('AdditionalInfo', 14);
  RegisterProp('InvoiceRevisionDate', 15);
  RegisterProp('InvoiceRevisionNumber', 16);
  RegisterProp('AdditionalInfos', 17);
  RegisterProp('Version', 18);
end;

procedure TInvoiceInfo.InternalInit;
begin
  inherited InternalInit;
  FSeller:=TDiadocOrganizationInfo.Create;
  FBuyer:=TDiadocOrganizationInfo.Create;
  FShipper:=TShipperOrConsignee.Create;
  FConsignee:=TShipperOrConsignee.Create;
  FSigner:=TSigner.Create;
  FPaymentDocuments:=TPaymentDocumentInfos.Create;
  FItems:=TInvoiceItems.Create;
  FAdditionalInfos:=TAdditionalInfos.Create;
end;

destructor TInvoiceInfo.Destroy;
begin
  FreeAndNil(FSeller);
  FreeAndNil(FBuyer);
  FreeAndNil(FShipper);
  FreeAndNil(FConsignee);
  FreeAndNil(FSigner);
  FreeAndNil(FPaymentDocuments);
  FreeAndNil(FItems);
  FreeAndNil(FAdditionalInfos);
  inherited Destroy;
end;


{ TInvoiceItem }

function TInvoiceItem.GetUnitCode: Integer;
var
  S: String;
begin
  Result:=-1;
  S:=FUnt;
  Copy2SymbDel(S, '(');
  if S<>'' then
  begin
    Result:=StrToIntDef(Copy2SymbDel(S, ')'), -1);
  end
  else
    Result:=StrToIntDef(FUnt, -1);
end;

procedure TInvoiceItem.SetAdditionalInfo(AValue: string);
begin
  if FAdditionalInfo=AValue then Exit;
  FAdditionalInfo:=AValue;
  Modified(12);
end;

procedure TInvoiceItem.SetExcise(AValue: string);
begin
  if FExcise=AValue then Exit;
  FExcise:=AValue;
  Modified(7);
end;

procedure TInvoiceItem.SetPrice(AValue: string);
begin
  if FPrice=AValue then Exit;
  FPrice:=AValue;
  Modified(4);
end;

procedure TInvoiceItem.SetProduct(AValue: string);
begin
  if FProduct=AValue then Exit;
  FProduct:=AValue;
  Modified(1);
end;

procedure TInvoiceItem.SetQuantity(AValue: string);
begin
  if FQuantity=AValue then Exit;
  FQuantity:=AValue;
  Modified(3);
end;

procedure TInvoiceItem.SetSubtotal(AValue: string);
begin
  if FSubtotal=AValue then Exit;
  FSubtotal:=AValue;
  Modified(11);
end;

procedure TInvoiceItem.SetSubtotalWithVatExcluded(AValue: string);
begin
  if FSubtotalWithVatExcluded=AValue then Exit;
  FSubtotalWithVatExcluded:=AValue;
  Modified(9);
end;

procedure TInvoiceItem.SetTaxRate(AValue: TTaxRate);
begin
  if FTaxRate=AValue then Exit;
  FTaxRate:=AValue;
  Modified(8);
end;

procedure TInvoiceItem.SetUnt(AValue: string);
begin
  if FUnt=AValue then Exit;
  FUnt:=AValue;
  Modified(2);
end;

procedure TInvoiceItem.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(10);
end;

procedure TInvoiceItem.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Product', 1, true);
  RegisterProp('Unt', 2);
  RegisterProp('Quantity', 3);
  RegisterProp('Price', 4);
  RegisterProp('CountriesOfOrigin', 5);
  RegisterProp('CustomsDeclarationNumbers', 6);
  RegisterProp('Excise', 7);
  RegisterProp('TaxRate', 8, true);
  RegisterProp('SubtotalWithVatExcluded', 9, true);
  RegisterProp('Vat', 10);
  RegisterProp('Subtotal', 11, true);
  RegisterProp('AdditionalInfo', 12);
  RegisterProp('CustomsDeclarations', 13);
  RegisterProp('AdditionalInfos', 14);
end;

procedure TInvoiceItem.InternalInit;
begin
  inherited InternalInit;
  FCountriesOfOrigin:=TDocumentStrings.Create;
  FCustomsDeclarationNumbers:=TDocumentStrings.Create;
  FCustomsDeclarations:=TCustomsDeclarations.Create;
  FAdditionalInfos:=TAdditionalInfos.Create;
end;

destructor TInvoiceItem.Destroy;
begin
  FreeAndNil(FCountriesOfOrigin);
  FreeAndNil(FCustomsDeclarationNumbers);
  FreeAndNil(FCustomsDeclarations);
  FreeAndNil(FAdditionalInfos);
  inherited Destroy;
end;

{ TCustomsDeclaration }

procedure TCustomsDeclaration.SetCountryCode(AValue: string);
begin
  if FCountryCode=AValue then Exit;
  FCountryCode:=AValue;
  Modified(1);
end;

procedure TCustomsDeclaration.SetDeclarationNumber(AValue: string);
begin
  if FDeclarationNumber=AValue then Exit;
  FDeclarationNumber:=AValue;
  Modified(2);
end;

procedure TCustomsDeclaration.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('CountryCode', 1, true);
  RegisterProp('DeclarationNumber', 2, true);
end;

procedure TCustomsDeclaration.InternalInit;
begin
  inherited InternalInit;
end;

destructor TCustomsDeclaration.Destroy;
begin
  inherited Destroy;
end;

{ TPaymentDocumentInfo }

procedure TPaymentDocumentInfo.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(1);
end;

procedure TPaymentDocumentInfo.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(2);
end;

procedure TPaymentDocumentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentDate', 1, true);
  RegisterProp('DocumentNumber', 2, true);
end;

procedure TPaymentDocumentInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TPaymentDocumentInfo.Destroy;
begin
  inherited Destroy;
end;

{ TShipperOrConsignee }

procedure TShipperOrConsignee.SetSameAsSellerOrBuyer(AValue: Boolean);
begin
  FSameAsSellerOrBuyer:=AValue;
  Modified(1);
end;

procedure TShipperOrConsignee.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SameAsSellerOrBuyer', 1);
  RegisterProp('OrgInfo', 2);
end;

procedure TShipperOrConsignee.InternalInit;
begin
  inherited InternalInit;
  FOrgInfo:=TOrganizationInfo.Create;
end;

destructor TShipperOrConsignee.Destroy;
begin
  FreeAndNil(FOrgInfo);
  inherited Destroy;
end;

{ TInvoiceCorrectionInfo }

procedure TInvoiceCorrectionInfo.SetAdditionalInfo(AValue: string);
begin
  if FAdditionalInfo=AValue then Exit;
  FAdditionalInfo:=AValue;
  Modified(16);
end;

procedure TInvoiceCorrectionInfo.SetCurrency(AValue: string);
begin
  if FCurrency=AValue then Exit;
  FCurrency:=AValue;
  Modified(13);
end;

procedure TInvoiceCorrectionInfo.SetInvoiceCorrectionDate(AValue: string);
begin
  if FInvoiceCorrectionDate=AValue then Exit;
  FInvoiceCorrectionDate:=AValue;
  Modified(5);
end;

procedure TInvoiceCorrectionInfo.SetInvoiceCorrectionNumber(AValue: string);
begin
  if FInvoiceCorrectionNumber=AValue then Exit;
  FInvoiceCorrectionNumber:=AValue;
  Modified(6);
end;

procedure TInvoiceCorrectionInfo.SetInvoiceCorrectionRevisionDate(AValue: string
  );
begin
  if FInvoiceCorrectionRevisionDate=AValue then Exit;
  FInvoiceCorrectionRevisionDate:=AValue;
  Modified(7);
end;

procedure TInvoiceCorrectionInfo.SetInvoiceCorrectionRevisionNumber(
  AValue: string);
begin
  if FInvoiceCorrectionRevisionNumber=AValue then Exit;
  FInvoiceCorrectionRevisionNumber:=AValue;
  Modified(8);
end;

procedure TInvoiceCorrectionInfo.SetInvoiceDate(AValue: string);
begin
  if FInvoiceDate=AValue then Exit;
  FInvoiceDate:=AValue;
  Modified(1);
end;

procedure TInvoiceCorrectionInfo.SetInvoiceNumber(AValue: string);
begin
  if FInvoiceNumber=AValue then Exit;
  FInvoiceNumber:=AValue;
  Modified(2);
end;

procedure TInvoiceCorrectionInfo.SetInvoiceRevisionDate(AValue: string);
begin
  if FInvoiceRevisionDate=AValue then Exit;
  FInvoiceRevisionDate:=AValue;
  Modified(3);
end;

procedure TInvoiceCorrectionInfo.SetInvoiceRevisionNumber(AValue: string);
begin
  if FInvoiceRevisionNumber=AValue then Exit;
  FInvoiceRevisionNumber:=AValue;
  Modified(4);
end;

procedure TInvoiceCorrectionInfo.SetVersion(AValue: TInvoiceFormatVersion);
begin
  FVersion:=AValue;
  Modified(18);
end;

procedure TInvoiceCorrectionInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InvoiceDate', 1, true);
  RegisterProp('InvoiceNumber', 2, true);
  RegisterProp('InvoiceRevisionDate', 3);
  RegisterProp('InvoiceRevisionNumber', 4);
  RegisterProp('InvoiceCorrectionDate', 5, true);
  RegisterProp('InvoiceCorrectionNumber', 6, true);
  RegisterProp('InvoiceCorrectionRevisionDate', 7);
  RegisterProp('InvoiceCorrectionRevisionNumber', 8);
  RegisterProp('Seller', 9, true);
  RegisterProp('Buyer', 10, true);
  RegisterProp('Signer', 11, true);
  RegisterProp('Items', 12);
  RegisterProp('Currency', 13);
  RegisterProp('TotalsInc', 14);
  RegisterProp('TotalsDec', 15);
  RegisterProp('AdditionalInfo', 16);
  RegisterProp('AdditionalInfos', 17);
  RegisterProp('Version', 18);
end;

procedure TInvoiceCorrectionInfo.InternalInit;
begin
  inherited InternalInit;
  FSeller:=TDiadocOrganizationInfo.Create;
  FBuyer:=TDiadocOrganizationInfo.Create;
  FSigner:=TSigner.Create;
  FItems:=TInvoiceCorrectionItems.Create;
  FTotalsInc:=TInvoiceTotalsDiff.Create;
  FTotalsDec:=TInvoiceTotalsDiff.Create;
  FVersion:=DefaultInvoiceFormatVersion;
end;

destructor TInvoiceCorrectionInfo.Destroy;
begin
  FreeAndNil(FSeller);
  FreeAndNil(FBuyer);
  FreeAndNil(FSigner);
  FreeAndNil(FItems);
  FreeAndNil(FTotalsInc);
  FreeAndNil(FTotalsDec);
  inherited Destroy;
end;

{ TInvoiceTotalsDiff }

procedure TInvoiceTotalsDiff.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(3);
end;

procedure TInvoiceTotalsDiff.SetTotalWithVatExcluded(AValue: string);
begin
  if FTotalWithVatExcluded=AValue then Exit;
  FTotalWithVatExcluded:=AValue;
  Modified(1);
end;

procedure TInvoiceTotalsDiff.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(2);
end;

procedure TInvoiceTotalsDiff.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TotalWithVatExcluded', 1);
  RegisterProp('Vat', 2);
  RegisterProp('Total', 3, true);
end;

procedure TInvoiceTotalsDiff.InternalInit;
begin
  inherited InternalInit;
end;

destructor TInvoiceTotalsDiff.Destroy;
begin
  inherited Destroy;
end;

{ TInvoiceCorrectionItem }

procedure TInvoiceCorrectionItem.SetAdditionalInfo(AValue: string);
begin
  if FAdditionalInfo=AValue then Exit;
  FAdditionalInfo:=AValue;
  Modified(6);
end;

procedure TInvoiceCorrectionItem.SetProduct(AValue: string);
begin
  if FProduct=AValue then Exit;
  FProduct:=AValue;
  Modified(1);
end;

procedure TInvoiceCorrectionItem.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Product', 1, true);
  RegisterProp('OriginalValues', 2, true);
  RegisterProp('CorrectedValues', 3, true);
  RegisterProp('AmountsInc', 4);
  RegisterProp('AmountsDec', 5);
  RegisterProp('AdditionalInfo', 6);
  RegisterProp('AdditionalInfos', 7);
end;

procedure TInvoiceCorrectionItem.InternalInit;
begin
  inherited InternalInit;
  FOriginalValues:=TCorrectableInvoiceItemFields.Create;
  FCorrectedValues:=TCorrectableInvoiceItemFields.Create;
  FAmountsInc:=TInvoiceItemAmountsDiff.Create;
  FAmountsDec:=TInvoiceItemAmountsDiff.Create;
  FAdditionalInfos:=TAdditionalInfos.Create;
end;

destructor TInvoiceCorrectionItem.Destroy;
begin
  FreeAndNil(FOriginalValues);
  FreeAndNil(FCorrectedValues);
  FreeAndNil(FAmountsInc);
  FreeAndNil(FAmountsDec);
  FreeAndNil(FAdditionalInfos);
  inherited Destroy;
end;

{ TAdditionalInfo }

procedure TAdditionalInfo.SetId(AValue: string);
begin
  if FId=AValue then Exit;
  FId:=AValue;
  Modified(1);
end;

procedure TAdditionalInfo.SetValue(AValue: string);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
  Modified(2);
end;

procedure TAdditionalInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Id', 1, true);
  RegisterProp('Value', 2, true);
end;

procedure TAdditionalInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TAdditionalInfo.Destroy;
begin
  inherited Destroy;
end;

{ TCorrectableInvoiceItemFields }

procedure TCorrectableInvoiceItemFields.SetExcise(AValue: string);
begin
  if FExcise=AValue then Exit;
  FExcise:=AValue;
  Modified(4);
end;

procedure TCorrectableInvoiceItemFields.SetPrice(AValue: string);
begin
  if FPrice=AValue then Exit;
  FPrice:=AValue;
  Modified(3);
end;

procedure TCorrectableInvoiceItemFields.SetQuantity(AValue: string);
begin
  if FQuantity=AValue then Exit;
  FQuantity:=AValue;
  Modified(2);
end;

procedure TCorrectableInvoiceItemFields.SetSubtotal(AValue: string);
begin
  if FSubtotal=AValue then Exit;
  FSubtotal:=AValue;
  Modified(8);
end;

procedure TCorrectableInvoiceItemFields.SetSubtotalWithVatExcluded(
  AValue: string);
begin
  if FSubtotalWithVatExcluded=AValue then Exit;
  FSubtotalWithVatExcluded:=AValue;
  Modified(6);
end;

procedure TCorrectableInvoiceItemFields.SetTaxRate(AValue: TTaxRate);
begin
  if FTaxRate=AValue then Exit;
  FTaxRate:=AValue;
  Modified(5);
end;

procedure TCorrectableInvoiceItemFields.SetUnt(AValue: string);
begin
  if FUnt=AValue then Exit;
  FUnt:=AValue;
  Modified(1);
end;

procedure TCorrectableInvoiceItemFields.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(7);
end;

procedure TCorrectableInvoiceItemFields.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Unt', 1);
  RegisterProp('Quantity', 2);
  RegisterProp('Price', 3);
  RegisterProp('Excise', 4);
  RegisterProp('TaxRate', 5, true);
  RegisterProp('SubtotalWithVatExcluded', 6);
  RegisterProp('Vat', 7);
  RegisterProp('Subtotal', 8, true);
end;

procedure TCorrectableInvoiceItemFields.InternalInit;
begin
  inherited InternalInit;
end;

destructor TCorrectableInvoiceItemFields.Destroy;
begin
  inherited Destroy;
end;

{ TInvoiceItemAmountsDiff }

procedure TInvoiceItemAmountsDiff.SetExcise(AValue: string);
begin
  if FExcise=AValue then Exit;
  FExcise:=AValue;
  Modified(1);
end;

procedure TInvoiceItemAmountsDiff.SetSubtotal(AValue: string);
begin
  if FSubtotal=AValue then Exit;
  FSubtotal:=AValue;
  Modified(4);
end;

procedure TInvoiceItemAmountsDiff.SetSubtotalWithVatExcluded(AValue: string);
begin
  if FSubtotalWithVatExcluded=AValue then Exit;
  FSubtotalWithVatExcluded:=AValue;
  Modified(2);
end;

procedure TInvoiceItemAmountsDiff.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(3);
end;

procedure TInvoiceItemAmountsDiff.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Excise', 1);
  RegisterProp('SubtotalWithVatExcluded', 2);
  RegisterProp('Vat', 3);
  RegisterProp('Subtotal', 4);
end;

procedure TInvoiceItemAmountsDiff.InternalInit;
begin
  inherited InternalInit;
end;

destructor TInvoiceItemAmountsDiff.Destroy;
begin
  inherited Destroy;
end;

end.

