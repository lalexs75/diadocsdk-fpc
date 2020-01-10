unit Invoice_DEFAULT_invoice_05_01_03;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject;

type
  TTaxRate_With20Percent = String;
  Tvat = String;
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
  Tokei = String;
  Tokv = String;
  Tdate1 = String;
  TTaxRate = String;
  TTaxRateWithTaxedByAgent = String;
  TTaxRateWithTwentyPercentAndTaxedByAgent = String;
  TTaxRateWithTwentyPercent = String;
  TCountry = String;
type
  TInvoiceInfo = class;
  TInvoice = class;
  TInvoiceInfo_PaymentDocuments = class;
  TInvoiceItemsTable = class;
  TInvoiceItemsTable_Item = class;
  TInvoiceItemsTable_Item_CountriesOfOrigin = class;
  TInvoiceItemsTable_Item_CustomsDeclarationNumbers = class;
  TDocflowParticipant = class;
  TOrganizationInfo = class;
  TOrganizationDetails_ManualFilling = class;
  TOrganizationDetails = class;
  TOrganizationDetails_WithAddressOptional = class;
  TOrganizationReference = class;
  TShipperOrConsignee = class;
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
  TInvoiceInfoList = specialize GXMLSerializationObjectList<TInvoiceInfo>;
  TInvoiceList = specialize GXMLSerializationObjectList<TInvoice>;
  TInvoiceInfo_PaymentDocumentsList = specialize GXMLSerializationObjectList<TInvoiceInfo_PaymentDocuments>;
  TInvoiceItemsTableList = specialize GXMLSerializationObjectList<TInvoiceItemsTable>;
  TInvoiceItemsTable_ItemList = specialize GXMLSerializationObjectList<TInvoiceItemsTable_Item>;
  TInvoiceItemsTable_Item_CountriesOfOriginList = specialize GXMLSerializationObjectList<TInvoiceItemsTable_Item_CountriesOfOrigin>;
  TInvoiceItemsTable_Item_CustomsDeclarationNumbersList = specialize GXMLSerializationObjectList<TInvoiceItemsTable_Item_CustomsDeclarationNumbers>;
  TDocflowParticipantList = specialize GXMLSerializationObjectList<TDocflowParticipant>;
  TOrganizationInfoList = specialize GXMLSerializationObjectList<TOrganizationInfo>;
  TOrganizationDetails_ManualFillingList = specialize GXMLSerializationObjectList<TOrganizationDetails_ManualFilling>;
  TOrganizationDetailsList = specialize GXMLSerializationObjectList<TOrganizationDetails>;
  TOrganizationDetails_WithAddressOptionalList = specialize GXMLSerializationObjectList<TOrganizationDetails_WithAddressOptional>;
  TOrganizationReferenceList = specialize GXMLSerializationObjectList<TOrganizationReference>;
  TShipperOrConsigneeList = specialize GXMLSerializationObjectList<TShipperOrConsignee>;
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

  {  TInvoiceInfo  }
  TInvoiceInfo = class(TXmlSerializationObject)
  private
    FSeller:TOrganizationInfo;
    FBuyer:TOrganizationInfo;
    FShipper:TShipperOrConsignee;
    FConsignee:TShipperOrConsignee;
    FSigner:TSignerInfo;
    FPaymentDocuments:TInvoiceInfo_PaymentDocuments;
    FTable:TInvoiceItemsTable;
    FInvoiceDate:Tdate1;
    FInvoiceNumber:Tstring256;
    FCurrency:Tokv;
    FAdditionalInfo:Tstring2000;
    FInvoiceRevisionDate:Tdate1;
    FInvoiceRevisionNumber:String;
    procedure SetInvoiceDate( AValue:Tdate1);
    procedure SetInvoiceNumber( AValue:Tstring256);
    procedure SetCurrency( AValue:Tokv);
    procedure SetAdditionalInfo( AValue:Tstring2000);
    procedure SetInvoiceRevisionDate( AValue:Tdate1);
    procedure SetInvoiceRevisionNumber( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Seller:TOrganizationInfo read FSeller;
    property Buyer:TOrganizationInfo read FBuyer;
    property Shipper:TShipperOrConsignee read FShipper;
    property Consignee:TShipperOrConsignee read FConsignee;
    property Signer:TSignerInfo read FSigner;
    property PaymentDocuments:TInvoiceInfo_PaymentDocuments read FPaymentDocuments;
    property Table:TInvoiceItemsTable read FTable;
    property InvoiceDate:Tdate1 read FInvoiceDate write SetInvoiceDate;
    property InvoiceNumber:Tstring256 read FInvoiceNumber write SetInvoiceNumber;
    property Currency:Tokv read FCurrency write SetCurrency;
    property AdditionalInfo:Tstring2000 read FAdditionalInfo write SetAdditionalInfo;
    property InvoiceRevisionDate:Tdate1 read FInvoiceRevisionDate write SetInvoiceRevisionDate;
    property InvoiceRevisionNumber:String read FInvoiceRevisionNumber write SetInvoiceRevisionNumber;
  end;

  {  TInvoice  }
  TInvoice = class(TInvoiceInfo)
  private
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
    function RootNodeName:string; override;
  public
    destructor Destroy; override;
  published
  end;

  {  TInvoiceInfo_PaymentDocuments  }
  TInvoiceInfo_PaymentDocuments = class(TXmlSerializationObject)
  private
    FDocument:TPaymentDocumentInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Document:TPaymentDocumentInfoList read FDocument;
  end;

  {  TInvoiceItemsTable  }
  TInvoiceItemsTable = class(TXmlSerializationObject)
  private
    FItem:TInvoiceItemsTable_ItemList;
    FTotalWithVatExcluded:String;
    FVat:Tvat;
    FTotal:String;
    procedure SetTotalWithVatExcluded( AValue:String);
    procedure SetVat( AValue:Tvat);
    procedure SetTotal( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Item:TInvoiceItemsTable_ItemList read FItem;
    property TotalWithVatExcluded:String read FTotalWithVatExcluded write SetTotalWithVatExcluded;
    property Vat:Tvat read FVat write SetVat;
    property Total:String read FTotal write SetTotal;
  end;

  {  TInvoiceItemsTable_Item  }
  TInvoiceItemsTable_Item = class(TXmlSerializationObject)
  private
    FCountriesOfOrigin:TInvoiceItemsTable_Item_CountriesOfOrigin;
    FCustomsDeclarationNumbers:TInvoiceItemsTable_Item_CustomsDeclarationNumbers;
    FProduct:Tstring1000;
    FUnit1:Tokei;
    FQuantity:String;
    FPrice:String;
    FExcise:String;
    FTaxRate:TTaxRate_With20Percent;
    FSubtotalWithVatExcluded:String;
    FVat:Tvat;
    FSubtotal:String;
    FAdditionalInfo:Tstring2000;
    procedure SetProduct( AValue:Tstring1000);
    procedure SetUnit1( AValue:Tokei);
    procedure SetQuantity( AValue:String);
    procedure SetPrice( AValue:String);
    procedure SetExcise( AValue:String);
    procedure SetTaxRate( AValue:TTaxRate_With20Percent);
    procedure SetSubtotalWithVatExcluded( AValue:String);
    procedure SetVat( AValue:Tvat);
    procedure SetSubtotal( AValue:String);
    procedure SetAdditionalInfo( AValue:Tstring2000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property CountriesOfOrigin:TInvoiceItemsTable_Item_CountriesOfOrigin read FCountriesOfOrigin;
    property CustomsDeclarationNumbers:TInvoiceItemsTable_Item_CustomsDeclarationNumbers read FCustomsDeclarationNumbers;
    property Product:Tstring1000 read FProduct write SetProduct;
    property Unit1:Tokei read FUnit1 write SetUnit1;
    property Quantity:String read FQuantity write SetQuantity;
    property Price:String read FPrice write SetPrice;
    property Excise:String read FExcise write SetExcise;
    property TaxRate:TTaxRate_With20Percent read FTaxRate write SetTaxRate;
    property SubtotalWithVatExcluded:String read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;
    property Vat:Tvat read FVat write SetVat;
    property Subtotal:String read FSubtotal write SetSubtotal;
    property AdditionalInfo:Tstring2000 read FAdditionalInfo write SetAdditionalInfo;
  end;

  {  TInvoiceItemsTable_Item_CountriesOfOrigin  }
  TInvoiceItemsTable_Item_CountriesOfOrigin = class(TXmlSerializationObject)
  private
    FCountry:TCountry;
    procedure SetCountry( AValue:TCountry);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Country:TCountry read FCountry write SetCountry;
  end;

  {  TInvoiceItemsTable_Item_CustomsDeclarationNumbers  }
  TInvoiceItemsTable_Item_CustomsDeclarationNumbers = class(TXmlSerializationObject)
  private
    FNumber:Tstring29;
    procedure SetNumber( AValue:Tstring29);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Number:Tstring29 read FNumber write SetNumber;
  end;

  {  TDocflowParticipant  }
  TDocflowParticipant = class(TXmlSerializationObject)
  private
    FBoxId:Tguid;
    FInn:Tstring20;
    FKpp:Tstring20;
    FFnsParticipantId:Tstring100;
    procedure SetBoxId( AValue:Tguid);
    procedure SetInn( AValue:Tstring20);
    procedure SetKpp( AValue:Tstring20);
    procedure SetFnsParticipantId( AValue:Tstring100);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property BoxId:Tguid read FBoxId write SetBoxId;
    property Inn:Tstring20 read FInn write SetInn;
    property Kpp:Tstring20 read FKpp write SetKpp;
    property FnsParticipantId:Tstring100 read FFnsParticipantId write SetFnsParticipantId;
  end;

  {  TOrganizationInfo  }
  TOrganizationInfo = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TOrganizationDetails;
    FOrganizationReference:TOrganizationReference;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property OrganizationDetails:TOrganizationDetails read FOrganizationDetails;
    property OrganizationReference:TOrganizationReference read FOrganizationReference;
  end;

  {  TOrganizationDetails_ManualFilling  }
  TOrganizationDetails_ManualFilling = class(TXmlSerializationObject)
  private
    FOkopf:String;
    FOkpo:String;
    FOkdp:String;
    FPhone:Tstring255;
    FFax:Tstring255;
    FBankAccountNumber:Tstring20;
    FBankName:Tstring1000;
    FBankId:String;
    FDepartment:Tstring1000;
    procedure SetOkopf( AValue:String);
    procedure SetOkpo( AValue:String);
    procedure SetOkdp( AValue:String);
    procedure SetPhone( AValue:Tstring255);
    procedure SetFax( AValue:Tstring255);
    procedure SetBankAccountNumber( AValue:Tstring20);
    procedure SetBankName( AValue:Tstring1000);
    procedure SetBankId( AValue:String);
    procedure SetDepartment( AValue:Tstring1000);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Okopf:String read FOkopf write SetOkopf;
    property Okpo:String read FOkpo write SetOkpo;
    property Okdp:String read FOkdp write SetOkdp;
    property Phone:Tstring255 read FPhone write SetPhone;
    property Fax:Tstring255 read FFax write SetFax;
    property BankAccountNumber:Tstring20 read FBankAccountNumber write SetBankAccountNumber;
    property BankName:Tstring1000 read FBankName write SetBankName;
    property BankId:String read FBankId write SetBankId;
    property Department:Tstring1000 read FDepartment write SetDepartment;
  end;

  {  TOrganizationDetails  }
  TOrganizationDetails = class(TOrganizationDetails_ManualFilling)
  private
    FAddress:TAddress;
    FOrgName:Tstring1000;
    FInn:Tstring20;
    FKpp:Tstring20;
    FIsSoleProprietor:Boolean;
    FFnsParticipantId:String;
    procedure SetOrgName( AValue:Tstring1000);
    procedure SetInn( AValue:Tstring20);
    procedure SetKpp( AValue:Tstring20);
    procedure SetIsSoleProprietor( AValue:Boolean);
    procedure SetFnsParticipantId( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Address:TAddress read FAddress;
    property OrgName:Tstring1000 read FOrgName write SetOrgName;
    property Inn:Tstring20 read FInn write SetInn;
    property Kpp:Tstring20 read FKpp write SetKpp;
    property IsSoleProprietor:Boolean read FIsSoleProprietor write SetIsSoleProprietor;
    property FnsParticipantId:String read FFnsParticipantId write SetFnsParticipantId;
  end;

  {  TOrganizationDetails_WithAddressOptional  }
  TOrganizationDetails_WithAddressOptional = class(TOrganizationDetails_ManualFilling)
  private
    FAddress:TAddress;
    FOrgName:Tstring1000;
    FInn:Tstring20;
    FKpp:Tstring20;
    FIsSoleProprietor:Boolean;
    FFnsParticipantId:String;
    procedure SetOrgName( AValue:Tstring1000);
    procedure SetInn( AValue:Tstring20);
    procedure SetKpp( AValue:Tstring20);
    procedure SetIsSoleProprietor( AValue:Boolean);
    procedure SetFnsParticipantId( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Address:TAddress read FAddress;
    property OrgName:Tstring1000 read FOrgName write SetOrgName;
    property Inn:Tstring20 read FInn write SetInn;
    property Kpp:Tstring20 read FKpp write SetKpp;
    property IsSoleProprietor:Boolean read FIsSoleProprietor write SetIsSoleProprietor;
    property FnsParticipantId:String read FFnsParticipantId write SetFnsParticipantId;
  end;

  {  TOrganizationReference  }
  TOrganizationReference = class(TOrganizationDetails_ManualFilling)
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

  {  TShipperOrConsignee  }
  TShipperOrConsignee = class(TXmlSerializationObject)
  private
    FOrganizationDetails:TOrganizationDetails;
    FSameAsSellerOrBuyer:Boolean;
    procedure SetSameAsSellerOrBuyer( AValue:Boolean);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property OrganizationDetails:TOrganizationDetails read FOrganizationDetails;
    property SameAsSellerOrBuyer:Boolean read FSameAsSellerOrBuyer write SetSameAsSellerOrBuyer;
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
    property ZipCode:String read FZipCode write SetZipCode;
    property Region:Tstring50 read FRegion write SetRegion;
    property Territory:Tstring50 read FTerritory write SetTerritory;
    property City:Tstring50 read FCity write SetCity;
    property Locality:Tstring50 read FLocality write SetLocality;
    property Street:Tstring50 read FStreet write SetStreet;
    property Building:Tstring20 read FBuilding write SetBuilding;
    property Block:Tstring20 read FBlock write SetBlock;
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
    property Country:Tstring60 read FCountry write SetCountry;
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
    property CertificateBytes:String read FCertificateBytes write SetCertificateBytes;
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
    property BoxId:Tstring100 read FBoxId write SetBoxId;
    property CertificateBytes:String read FCertificateBytes write SetCertificateBytes;
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
    property Position:Tstring128z read FPosition write SetPosition;
    property Inn:String read FInn write SetInn;
    property RegistrationCertificate:Tstring100 read FRegistrationCertificate write SetRegistrationCertificate;
    property SignerType:String read FSignerType write SetSignerType;
    property SignerOrganizationName:Tstring1000 read FSignerOrganizationName write SetSignerOrganizationName;
    property SignerInfo:Tstring255 read FSignerInfo write SetSignerInfo;
    property SignerPowersBase:Tstring255 read FSignerPowersBase write SetSignerPowersBase;
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
    property SignerPowers:Longint read FSignerPowers write SetSignerPowers;
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
    property SignerPowers:Longint read FSignerPowers write SetSignerPowers;
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
    property Country:Tstring1000 read FCountry write SetCountry;
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
    property Country:Tstring1000 read FCountry write SetCountry;
    property HyphenCountry:String read FHyphenCountry write SetHyphenCountry;
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
    property TotalWithVatExcluded:Double read FTotalWithVatExcluded write SetTotalWithVatExcluded;
    property Vat:Double read FVat write SetVat;
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
    property Excise:Double read FExcise write SetExcise;
    property SubtotalWithVatExcluded:Double read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;
    property Vat:Double read FVat write SetVat;
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
    property Unit1:String read FUnit1 write SetUnit1;
    property Quantity:Double read FQuantity write SetQuantity;
    property Price:Double read FPrice write SetPrice;
    property Excise:Double read FExcise write SetExcise;
    property SubtotalWithVatExcluded:Double read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;
    property Vat:Double read FVat write SetVat;
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
    property IssuerPerson:TOfficial read FIssuerPerson;
    property RecipientPerson:TOfficial read FRecipientPerson;
    property Date:Tdate1 read FDate write SetDate;
    property Number:Tstring255 read FNumber write SetNumber;
    property IssuerOrganizationName:Tstring1000 read FIssuerOrganizationName write SetIssuerOrganizationName;
    property IssuerAdditionalInfo:Tstring1000 read FIssuerAdditionalInfo write SetIssuerAdditionalInfo;
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
    property Official:TOfficial read FOfficial;
    property Attorney:TAttorney read FAttorney;
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
    property Date:Tdate1 read FDate write SetDate;
    property Number:Tstring30 read FNumber write SetNumber;
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
    property Name:Tstring255 read FName write SetName;
    property Number:Tstring255 read FNumber write SetNumber;
    property Date:Tdate1 read FDate write SetDate;
    property Info:Tstring1000 read FInfo write SetInfo;
  end;

implementation

  {  TInvoiceInfo  }
procedure TInvoiceInfo.SetInvoiceDate(AValue: Tdate1);
begin
  FInvoiceDate:=AValue;
  CheckStrMinSize('InvoiceDate', AValue);
  CheckStrMaxSize('InvoiceDate', AValue);
  ModifiedProperty('InvoiceDate');
end;

procedure TInvoiceInfo.SetInvoiceNumber(AValue: Tstring256);
begin
  FInvoiceNumber:=AValue;
  CheckStrMinSize('InvoiceNumber', AValue);
  CheckStrMaxSize('InvoiceNumber', AValue);
  ModifiedProperty('InvoiceNumber');
end;

procedure TInvoiceInfo.SetCurrency(AValue: Tokv);
begin
  FCurrency:=AValue;
  CheckStrMinSize('Currency', AValue);
  CheckStrMaxSize('Currency', AValue);
  ModifiedProperty('Currency');
end;

procedure TInvoiceInfo.SetAdditionalInfo(AValue: Tstring2000);
begin
  FAdditionalInfo:=AValue;
  CheckStrMinSize('AdditionalInfo', AValue);
  CheckStrMaxSize('AdditionalInfo', AValue);
  ModifiedProperty('AdditionalInfo');
end;

procedure TInvoiceInfo.SetInvoiceRevisionDate(AValue: Tdate1);
begin
  FInvoiceRevisionDate:=AValue;
  CheckStrMinSize('InvoiceRevisionDate', AValue);
  CheckStrMaxSize('InvoiceRevisionDate', AValue);
  ModifiedProperty('InvoiceRevisionDate');
end;

procedure TInvoiceInfo.SetInvoiceRevisionNumber(AValue: String);
begin
  FInvoiceRevisionNumber:=AValue;
  CheckStrMinSize('InvoiceRevisionNumber', AValue);
  CheckStrMaxSize('InvoiceRevisionNumber', AValue);
  ModifiedProperty('InvoiceRevisionNumber');
end;

procedure TInvoiceInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Seller', 'Seller', [], '', -1, -1);
  P:=RegisterProperty('Buyer', 'Buyer', [], '', -1, -1);
  P:=RegisterProperty('Shipper', 'Shipper', [], '', -1, -1);
  P:=RegisterProperty('Consignee', 'Consignee', [], '', -1, -1);
  P:=RegisterProperty('Signer', 'Signer', [], '', -1, -1);
  P:=RegisterProperty('PaymentDocuments', 'PaymentDocuments', [], '', -1, -1);
  P:=RegisterProperty('Table', 'Table', [], '', -1, -1);
  P:=RegisterProperty('InvoiceDate', 'InvoiceDate', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('InvoiceNumber', 'InvoiceNumber', [xsaRequared], '', 1, 256);
  P:=RegisterProperty('Currency', 'Currency', [], '', 3, 3);
  P:=RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', 1, 2000);
  P:=RegisterProperty('InvoiceRevisionDate', 'InvoiceRevisionDate', [], '', 10, 10);
  P:=RegisterProperty('InvoiceRevisionNumber', 'InvoiceRevisionNumber', [], '', 1, 3);
end;

procedure TInvoiceInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSeller:=TOrganizationInfo.Create;
  FBuyer:=TOrganizationInfo.Create;
  FShipper:=TShipperOrConsignee.Create;
  FConsignee:=TShipperOrConsignee.Create;
  FSigner:=TSignerInfo.Create;
  FPaymentDocuments:=TInvoiceInfo_PaymentDocuments.Create;
  FTable:=TInvoiceItemsTable.Create;
end;

destructor TInvoiceInfo.Destroy;
begin
  FSeller.Free;
  FBuyer.Free;
  FShipper.Free;
  FConsignee.Free;
  FSigner.Free;
  FPaymentDocuments.Free;
  FTable.Free;
  inherited Destroy;
end;

  {  TInvoice  }
procedure TInvoice.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
end;

procedure TInvoice.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInvoice.Destroy;
begin
  inherited Destroy;
end;

function TInvoice.RootNodeName:string;
begin
  Result:='Invoice';
end;

  {  TInvoiceInfo_PaymentDocuments  }
procedure TInvoiceInfo_PaymentDocuments.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Document', 'Document', [], '', -1, -1);
end;

procedure TInvoiceInfo_PaymentDocuments.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FDocument:=TPaymentDocumentInfoList.Create;
end;

destructor TInvoiceInfo_PaymentDocuments.Destroy;
begin
  FDocument.Free;
  inherited Destroy;
end;

  {  TInvoiceItemsTable  }
procedure TInvoiceItemsTable.SetTotalWithVatExcluded(AValue: String);
begin
  FTotalWithVatExcluded:=AValue;
  ModifiedProperty('TotalWithVatExcluded');
end;

procedure TInvoiceItemsTable.SetVat(AValue: Tvat);
begin
  FVat:=AValue;
  CheckStrMinSize('Vat', AValue);
  CheckStrMaxSize('Vat', AValue);
  ModifiedProperty('Vat');
end;

procedure TInvoiceItemsTable.SetTotal(AValue: String);
begin
  FTotal:=AValue;
  ModifiedProperty('Total');
end;

procedure TInvoiceItemsTable.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Item', 'Item', [], '', -1, -1);
  P:=RegisterProperty('TotalWithVatExcluded', 'TotalWithVatExcluded', [], '', -1, -1);
  P:=RegisterProperty('Vat', 'Vat', [], '', 1, 18);
  P:=RegisterProperty('Total', 'Total', [xsaRequared], '', -1, -1);
end;

procedure TInvoiceItemsTable.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItem:=TInvoiceItemsTable_ItemList.Create;
end;

destructor TInvoiceItemsTable.Destroy;
begin
  FItem.Free;
  inherited Destroy;
end;

  {  TInvoiceItemsTable_Item  }
procedure TInvoiceItemsTable_Item.SetProduct(AValue: Tstring1000);
begin
  FProduct:=AValue;
  CheckStrMinSize('Product', AValue);
  CheckStrMaxSize('Product', AValue);
  ModifiedProperty('Product');
end;

procedure TInvoiceItemsTable_Item.SetUnit1(AValue: Tokei);
begin
  FUnit1:=AValue;
  CheckStrMinSize('Unit1', AValue);
  CheckStrMaxSize('Unit1', AValue);
  ModifiedProperty('Unit1');
end;

procedure TInvoiceItemsTable_Item.SetQuantity(AValue: String);
begin
  FQuantity:=AValue;
  ModifiedProperty('Quantity');
end;

procedure TInvoiceItemsTable_Item.SetPrice(AValue: String);
begin
  FPrice:=AValue;
  ModifiedProperty('Price');
end;

procedure TInvoiceItemsTable_Item.SetExcise(AValue: String);
begin
  FExcise:=AValue;
  CheckStrMinSize('Excise', AValue);
  CheckStrMaxSize('Excise', AValue);
  ModifiedProperty('Excise');
end;

procedure TInvoiceItemsTable_Item.SetTaxRate(AValue: TTaxRate_With20Percent);
begin
  FTaxRate:=AValue;
  CheckLockupValue('TaxRate', AValue);
  ModifiedProperty('TaxRate');
end;

procedure TInvoiceItemsTable_Item.SetSubtotalWithVatExcluded(AValue: String);
begin
  FSubtotalWithVatExcluded:=AValue;
  ModifiedProperty('SubtotalWithVatExcluded');
end;

procedure TInvoiceItemsTable_Item.SetVat(AValue: Tvat);
begin
  FVat:=AValue;
  CheckStrMinSize('Vat', AValue);
  CheckStrMaxSize('Vat', AValue);
  ModifiedProperty('Vat');
end;

procedure TInvoiceItemsTable_Item.SetSubtotal(AValue: String);
begin
  FSubtotal:=AValue;
  ModifiedProperty('Subtotal');
end;

procedure TInvoiceItemsTable_Item.SetAdditionalInfo(AValue: Tstring2000);
begin
  FAdditionalInfo:=AValue;
  CheckStrMinSize('AdditionalInfo', AValue);
  CheckStrMaxSize('AdditionalInfo', AValue);
  ModifiedProperty('AdditionalInfo');
end;

procedure TInvoiceItemsTable_Item.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CountriesOfOrigin', 'CountriesOfOrigin', [], '', -1, -1);
  P:=RegisterProperty('CustomsDeclarationNumbers', 'CustomsDeclarationNumbers', [], '', -1, -1);
  P:=RegisterProperty('Product', 'Product', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('Unit1', 'Unit', [], '', 3, 4);
  P:=RegisterProperty('Quantity', 'Quantity', [], '', -1, -1);
  P:=RegisterProperty('Price', 'Price', [], '', -1, -1);
  P:=RegisterProperty('Excise', 'Excise', [], '', 4, 18);
  P:=RegisterProperty('TaxRate', 'TaxRate', [xsaRequared], '', -1, -1);
    P.ValidList.Add('без НДС');
    P.ValidList.Add('0');
    P.ValidList.Add('10');
    P.ValidList.Add('18');
    P.ValidList.Add('20');
    P.ValidList.Add('10/110');
    P.ValidList.Add('18/118');
  P:=RegisterProperty('SubtotalWithVatExcluded', 'SubtotalWithVatExcluded', [], '', -1, -1);
  P:=RegisterProperty('Vat', 'Vat', [], '', 1, 18);
  P:=RegisterProperty('Subtotal', 'Subtotal', [xsaRequared], '', -1, -1);
  P:=RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', 1, 2000);
end;

procedure TInvoiceItemsTable_Item.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FCountriesOfOrigin:=TInvoiceItemsTable_Item_CountriesOfOrigin.Create;
  FCustomsDeclarationNumbers:=TInvoiceItemsTable_Item_CustomsDeclarationNumbers.Create;
end;

destructor TInvoiceItemsTable_Item.Destroy;
begin
  FCountriesOfOrigin.Free;
  FCustomsDeclarationNumbers.Free;
  inherited Destroy;
end;

  {  TInvoiceItemsTable_Item_CountriesOfOrigin  }
procedure TInvoiceItemsTable_Item_CountriesOfOrigin.SetCountry(AValue: TCountry);
begin
  FCountry:=AValue;
  CheckStrMinSize('Country', AValue);
  CheckStrMaxSize('Country', AValue);
  ModifiedProperty('Country');
end;

procedure TInvoiceItemsTable_Item_CountriesOfOrigin.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Country', 'Country', [xsaSimpleObject], '', 3, 3);
end;

procedure TInvoiceItemsTable_Item_CountriesOfOrigin.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInvoiceItemsTable_Item_CountriesOfOrigin.Destroy;
begin
  inherited Destroy;
end;

  {  TInvoiceItemsTable_Item_CustomsDeclarationNumbers  }
procedure TInvoiceItemsTable_Item_CustomsDeclarationNumbers.SetNumber(AValue: Tstring29);
begin
  FNumber:=AValue;
  CheckStrMinSize('Number', AValue);
  CheckStrMaxSize('Number', AValue);
  ModifiedProperty('Number');
end;

procedure TInvoiceItemsTable_Item_CustomsDeclarationNumbers.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Number', 'Number', [xsaSimpleObject], '', 1, 29);
end;

procedure TInvoiceItemsTable_Item_CustomsDeclarationNumbers.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInvoiceItemsTable_Item_CustomsDeclarationNumbers.Destroy;
begin
  inherited Destroy;
end;

  {  TDocflowParticipant  }
procedure TDocflowParticipant.SetBoxId(AValue: Tguid);
begin
  FBoxId:=AValue;
  ModifiedProperty('BoxId');
end;

procedure TDocflowParticipant.SetInn(AValue: Tstring20);
begin
  FInn:=AValue;
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  ModifiedProperty('Inn');
end;

procedure TDocflowParticipant.SetKpp(AValue: Tstring20);
begin
  FKpp:=AValue;
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  ModifiedProperty('Kpp');
end;

procedure TDocflowParticipant.SetFnsParticipantId(AValue: Tstring100);
begin
  FFnsParticipantId:=AValue;
  CheckStrMinSize('FnsParticipantId', AValue);
  CheckStrMaxSize('FnsParticipantId', AValue);
  ModifiedProperty('FnsParticipantId');
end;

procedure TDocflowParticipant.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BoxId', 'BoxId', [], '', -1, -1);
  P:=RegisterProperty('Inn', 'Inn', [], '', 1, 20);
  P:=RegisterProperty('Kpp', 'Kpp', [], '', 1, 20);
  P:=RegisterProperty('FnsParticipantId', 'FnsParticipantId', [], '', 1, 100);
end;

procedure TDocflowParticipant.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TDocflowParticipant.Destroy;
begin
  inherited Destroy;
end;

  {  TOrganizationInfo  }
procedure TOrganizationInfo.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrganizationDetails', 'OrganizationDetails', [], '', -1, -1);
  P:=RegisterProperty('OrganizationReference', 'OrganizationReference', [], '', -1, -1);
end;

procedure TOrganizationInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TOrganizationDetails.Create;
  FOrganizationReference:=TOrganizationReference.Create;
end;

destructor TOrganizationInfo.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

  {  TOrganizationDetails_ManualFilling  }
procedure TOrganizationDetails_ManualFilling.SetOkopf(AValue: String);
begin
  FOkopf:=AValue;
  CheckStrMinSize('Okopf', AValue);
  CheckStrMaxSize('Okopf', AValue);
  ModifiedProperty('Okopf');
end;

procedure TOrganizationDetails_ManualFilling.SetOkpo(AValue: String);
begin
  FOkpo:=AValue;
  CheckStrMinSize('Okpo', AValue);
  CheckStrMaxSize('Okpo', AValue);
  ModifiedProperty('Okpo');
end;

procedure TOrganizationDetails_ManualFilling.SetOkdp(AValue: String);
begin
  FOkdp:=AValue;
  CheckStrMinSize('Okdp', AValue);
  CheckStrMaxSize('Okdp', AValue);
  ModifiedProperty('Okdp');
end;

procedure TOrganizationDetails_ManualFilling.SetPhone(AValue: Tstring255);
begin
  FPhone:=AValue;
  CheckStrMinSize('Phone', AValue);
  CheckStrMaxSize('Phone', AValue);
  ModifiedProperty('Phone');
end;

procedure TOrganizationDetails_ManualFilling.SetFax(AValue: Tstring255);
begin
  FFax:=AValue;
  CheckStrMinSize('Fax', AValue);
  CheckStrMaxSize('Fax', AValue);
  ModifiedProperty('Fax');
end;

procedure TOrganizationDetails_ManualFilling.SetBankAccountNumber(AValue: Tstring20);
begin
  FBankAccountNumber:=AValue;
  CheckStrMinSize('BankAccountNumber', AValue);
  CheckStrMaxSize('BankAccountNumber', AValue);
  ModifiedProperty('BankAccountNumber');
end;

procedure TOrganizationDetails_ManualFilling.SetBankName(AValue: Tstring1000);
begin
  FBankName:=AValue;
  CheckStrMinSize('BankName', AValue);
  CheckStrMaxSize('BankName', AValue);
  ModifiedProperty('BankName');
end;

procedure TOrganizationDetails_ManualFilling.SetBankId(AValue: String);
begin
  FBankId:=AValue;
  CheckStrMinSize('BankId', AValue);
  CheckStrMaxSize('BankId', AValue);
  ModifiedProperty('BankId');
end;

procedure TOrganizationDetails_ManualFilling.SetDepartment(AValue: Tstring1000);
begin
  FDepartment:=AValue;
  CheckStrMinSize('Department', AValue);
  CheckStrMaxSize('Department', AValue);
  ModifiedProperty('Department');
end;

procedure TOrganizationDetails_ManualFilling.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Okopf', 'Okopf', [], '', 2, 5);
  P:=RegisterProperty('Okpo', 'Okpo', [], '', 1, 10);
  P:=RegisterProperty('Okdp', 'Okdp', [], '', 1, 7);
  P:=RegisterProperty('Phone', 'Phone', [], '', 1, 255);
  P:=RegisterProperty('Fax', 'Fax', [], '', 1, 255);
  P:=RegisterProperty('BankAccountNumber', 'BankAccountNumber', [], '', 1, 20);
  P:=RegisterProperty('BankName', 'BankName', [], '', 1, 1000);
  P:=RegisterProperty('BankId', 'BankId', [], '', 9, 9);
  P:=RegisterProperty('Department', 'Department', [], '', 1, 1000);
end;

procedure TOrganizationDetails_ManualFilling.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TOrganizationDetails_ManualFilling.Destroy;
begin
  inherited Destroy;
end;

  {  TOrganizationDetails  }
procedure TOrganizationDetails.SetOrgName(AValue: Tstring1000);
begin
  FOrgName:=AValue;
  CheckStrMinSize('OrgName', AValue);
  CheckStrMaxSize('OrgName', AValue);
  ModifiedProperty('OrgName');
end;

procedure TOrganizationDetails.SetInn(AValue: Tstring20);
begin
  FInn:=AValue;
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  ModifiedProperty('Inn');
end;

procedure TOrganizationDetails.SetKpp(AValue: Tstring20);
begin
  FKpp:=AValue;
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  ModifiedProperty('Kpp');
end;

procedure TOrganizationDetails.SetIsSoleProprietor(AValue: Boolean);
begin
  FIsSoleProprietor:=AValue;
  ModifiedProperty('IsSoleProprietor');
end;

procedure TOrganizationDetails.SetFnsParticipantId(AValue: String);
begin
  FFnsParticipantId:=AValue;
  ModifiedProperty('FnsParticipantId');
end;

procedure TOrganizationDetails.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Address', 'Address', [], '', -1, -1);
  P:=RegisterProperty('OrgName', 'OrgName', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('Inn', 'Inn', [], '', 1, 20);
  P:=RegisterProperty('Kpp', 'Kpp', [], '', 1, 20);
  P:=RegisterProperty('IsSoleProprietor', 'IsSoleProprietor', [], '', -1, -1);
    P.DefaultValue:='false';
  P:=RegisterProperty('FnsParticipantId', 'FnsParticipantId', [], '', -1, -1);
end;

procedure TOrganizationDetails.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAddress:=TAddress.Create;
end;

destructor TOrganizationDetails.Destroy;
begin
  FAddress.Free;
  inherited Destroy;
end;

  {  TOrganizationDetails_WithAddressOptional  }
procedure TOrganizationDetails_WithAddressOptional.SetOrgName(AValue: Tstring1000);
begin
  FOrgName:=AValue;
  CheckStrMinSize('OrgName', AValue);
  CheckStrMaxSize('OrgName', AValue);
  ModifiedProperty('OrgName');
end;

procedure TOrganizationDetails_WithAddressOptional.SetInn(AValue: Tstring20);
begin
  FInn:=AValue;
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  ModifiedProperty('Inn');
end;

procedure TOrganizationDetails_WithAddressOptional.SetKpp(AValue: Tstring20);
begin
  FKpp:=AValue;
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  ModifiedProperty('Kpp');
end;

procedure TOrganizationDetails_WithAddressOptional.SetIsSoleProprietor(AValue: Boolean);
begin
  FIsSoleProprietor:=AValue;
  ModifiedProperty('IsSoleProprietor');
end;

procedure TOrganizationDetails_WithAddressOptional.SetFnsParticipantId(AValue: String);
begin
  FFnsParticipantId:=AValue;
  ModifiedProperty('FnsParticipantId');
end;

procedure TOrganizationDetails_WithAddressOptional.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Address', 'Address', [], '', -1, -1);
  P:=RegisterProperty('OrgName', 'OrgName', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('Inn', 'Inn', [], '', 1, 20);
  P:=RegisterProperty('Kpp', 'Kpp', [], '', 1, 20);
  P:=RegisterProperty('IsSoleProprietor', 'IsSoleProprietor', [], '', -1, -1);
    P.DefaultValue:='false';
  P:=RegisterProperty('FnsParticipantId', 'FnsParticipantId', [], '', -1, -1);
end;

procedure TOrganizationDetails_WithAddressOptional.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAddress:=TAddress.Create;
end;

destructor TOrganizationDetails_WithAddressOptional.Destroy;
begin
  FAddress.Free;
  inherited Destroy;
end;

  {  TOrganizationReference  }
procedure TOrganizationReference.SetBoxId(AValue: Tguid);
begin
  FBoxId:=AValue;
  ModifiedProperty('BoxId');
end;

procedure TOrganizationReference.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BoxId', 'BoxId', [xsaRequared], '', -1, -1);
end;

procedure TOrganizationReference.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TOrganizationReference.Destroy;
begin
  inherited Destroy;
end;

  {  TShipperOrConsignee  }
procedure TShipperOrConsignee.SetSameAsSellerOrBuyer(AValue: Boolean);
begin
  FSameAsSellerOrBuyer:=AValue;
  ModifiedProperty('SameAsSellerOrBuyer');
end;

procedure TShipperOrConsignee.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('OrganizationDetails', 'OrganizationDetails', [], '', -1, -1);
  P:=RegisterProperty('SameAsSellerOrBuyer', 'SameAsSellerOrBuyer', [], '', -1, -1);
end;

procedure TShipperOrConsignee.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TOrganizationDetails.Create;
end;

destructor TShipperOrConsignee.Destroy;
begin
  FOrganizationDetails.Free;
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

end.