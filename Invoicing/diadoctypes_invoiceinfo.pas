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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Excise:string read FExcise write FExcise; //1;
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write FSubtotalWithVatExcluded; //2;
    property Vat:string read FVat write FVat; //3;
    property Subtotal:string read FSubtotal write FSubtotal; //4;
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Unt:string read FUnt write FUnt; //1;						// единицы измерения товара (код)
    property Quantity:string read FQuantity write FQuantity; //2;					// количество единиц товара
    property Price:string read FPrice write FPrice; //3;						// цена за единицу товара
    property Excise:string read FExcise write FExcise; //4;						// акциз
    property TaxRate:TTaxRate read FTaxRate write FTaxRate; //5;
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write FSubtotalWithVatExcluded; //6;	// сумма без учета налога
    property Vat:string read FVat write FVat; //7;						// сумма налога
    property Subtotal:string read FSubtotal write FSubtotal; //8;					// сумма с учетом налога
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Id:string read FId write FId; //1
    property Value:string read FValue write FValue; //2
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Product:string read FProduct write FProduct;  //1
    property OriginalValues:TCorrectableInvoiceItemFields read FOriginalValues; //2
    property CorrectedValues:TCorrectableInvoiceItemFields read FCorrectedValues; //3;
    property AmountsInc:TInvoiceItemAmountsDiff read FAmountsInc; //4
    property AmountsDec:TInvoiceItemAmountsDiff read FAmountsDec; //5
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo; //6
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
    F: string;
    FTotal: string;
    FVat: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TotalWithVatExcluded:string read F write F; //1
    property Vat:string read FVat write FVat; //2;
    property Total:string read FTotal write FTotal; //3;
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InvoiceDate:string read FInvoiceDate write FInvoiceDate; //1
    property InvoiceNumber:string read FInvoiceNumber write FInvoiceNumber; //2;
    property InvoiceRevisionDate:string read FInvoiceRevisionDate write FInvoiceRevisionDate; //3;
    property InvoiceRevisionNumber:string read FInvoiceRevisionNumber write FInvoiceRevisionNumber; //4;
    property InvoiceCorrectionDate:string read FInvoiceCorrectionDate write FInvoiceCorrectionDate; //5;
    property InvoiceCorrectionNumber:string read FInvoiceCorrectionNumber write FInvoiceCorrectionNumber; //6;
    property InvoiceCorrectionRevisionDate:string read FInvoiceCorrectionRevisionDate write FInvoiceCorrectionRevisionDate; //7;
    property InvoiceCorrectionRevisionNumber:string read FInvoiceCorrectionRevisionNumber write FInvoiceCorrectionRevisionNumber; //8;
    property Seller:TDiadocOrganizationInfo read FSeller; //9;
    property Buyer:TDiadocOrganizationInfo read FBuyer; //10;
    property Signer:TSigner read FSigner; //11;
    property Items:TInvoiceCorrectionItems read FItems; //12;
    property Currency:string read FCurrency write FCurrency; //13
    property TotalsInc:TInvoiceTotalsDiff read FTotalsInc; //14
    property TotalsDec:TInvoiceTotalsDiff read FTotalsDec; //15
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo; //16;
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos; //17
    property Version:TInvoiceFormatVersion read FVersion write FVersion default DefaultInvoiceFormatVersion; //18
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SameAsSellerOrBuyer:Boolean read FSameAsSellerOrBuyer write FSameAsSellerOrBuyer;//1
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentDate:string read FDocumentDate write FDocumentDate; //1;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber; //2;
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property CountryCode:string read FCountryCode write FCountryCode; //1
    property DeclarationNumber:string read FDeclarationNumber write FDeclarationNumber; //2
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
    property UnitCode:Integer read GetUnitCode;
  published
    property Product:string read FProduct write FProduct;//1
    property Unt:string read FUnt write FUnt;//2;
    property Quantity:string read FQuantity write FQuantity;//3
    property Price:string read FPrice write FPrice;//4
    property CountriesOfOrigin:TDocumentStrings read FCountriesOfOrigin; //5
    property CustomsDeclarationNumbers:TDocumentStrings read FCustomsDeclarationNumbers; //6
    property Excise:string read FExcise write FExcise;//7
    property TaxRate:TTaxRate read FTaxRate write FTaxRate; //8
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write FSubtotalWithVatExcluded;//9
    property Vat:string read FVat write FVat;//10
    property Subtotal:string read FSubtotal write FSubtotal;//11
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo;//12
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InvoiceDate:string read FInvoiceDate write FInvoiceDate; //1;
    property InvoiceNumber:string read FInvoiceNumber write FInvoiceNumber; //2;
    property Seller:TDiadocOrganizationInfo read FSeller; //3;
    property Buyer:TDiadocOrganizationInfo read FBuyer; //4;
    property Shipper:TShipperOrConsignee read FShipper; //5;
    property Consignee:TShipperOrConsignee read FConsignee; //6;
    property Signer:TSigner read FSigner; //7;
    property PaymentDocuments:TPaymentDocumentInfos read FPaymentDocuments; //8;
    property Items:TInvoiceItems read FItems; //9;
    property Currency:string read FCurrency write FCurrency; //10;
    property TotalWithVatExcluded:string read FTotalWithVatExcluded write FTotalWithVatExcluded; //11;
    property Vat:string read FVat write FVat; //12;
    property Total:string read FTotal write FTotal; //13;
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo; //14;
    property InvoiceRevisionDate:string read FInvoiceRevisionDate write FInvoiceRevisionDate; //15;
    property InvoiceRevisionNumber:string read FInvoiceRevisionNumber write FInvoiceRevisionNumber; //16;
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos; //17
    property Version:TInvoiceFormatVersion read FVersion write FVersion default DefaultInvoiceFormatVersion; //18
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

procedure TCorrectableInvoiceItemFields.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Unt', 1);
  RegisterProp('Quantity', 2);
  RegisterProp('Price', 3);
  RegisterProp('Excise', 4);
  RegisterProp('TaxRate', 5);
  RegisterProp('SubtotalWithVatExcluded', 6);
  RegisterProp('Vat', 7);
  RegisterProp('Subtotal', 8);
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

