unit UserContract_820_05_01_01_Hyphen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject;
type
    //1 - Сведения о юридическом лице, состоящем на учете в налоговых органах // СвЮЛУч
    //2 - Сведения об индивидуальном предпринимателе// СвИП
    //3 - Сведения об иностранном лице, не состоящем на учете в налоговых органах // СвЮлНеУч, СвИнНеУч
    //4 - Сведения о физическом лице // СвФл
   //TOrganizationType = (org1 = 1, org2 = 2, org3 = 3,  org4 = 4);
  //TTaxRateWithTwentyPercentAndTaxedByAgent">
  //  <xs:restriction base="xs:string">
  //    <xs:enumeration value="без НДС" />
  //    <xs:enumeration value="0%" />
  //    <xs:enumeration value="10%" />
  //    <xs:enumeration value="18%" />
  //    <xs:enumeration value="20%" />
  //    <xs:enumeration value="10/110" />
  //    <xs:enumeration value="18/118" />
  //    <xs:enumeration value="20/120" />
  //    <xs:enumeration value="НДС исчисляется налоговым агентом" />

  { TRussianAddress }

  TRussianAddress = class(TXmlSerializationObject)
  private
    FApartment: string;
    FBlock: string;
    FBuilding: string;
    FCity: string;
    FLocality: string;
    FRegion: string;
    FStreet: string;
    FTerritory: string;
    FZipCode: string;
    procedure SetApartment(AValue: string);
    procedure SetBlock(AValue: string);
    procedure SetBuilding(AValue: string);
    procedure SetCity(AValue: string);
    procedure SetLocality(AValue: string);
    procedure SetRegion(AValue: string);
    procedure SetStreet(AValue: string);
    procedure SetTerritory(AValue: string);
    procedure SetZipCode(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property ZipCode:string read FZipCode write SetZipCode;
    property Region:string read FRegion write SetRegion;
    property Territory:string read FTerritory write SetTerritory;
    property City:string read FCity write SetCity;
    property Locality:string read FLocality write SetLocality;
    property Street:string read FStreet write SetStreet;
    property Building:string read FBuilding write SetBuilding;
    property Block:string read FBlock write SetBlock;
    property Apartment:string read FApartment write SetApartment;
  end;

  { TForeignAddress }

  TForeignAddress = class(TXmlSerializationObject)
  private
    FAddress: string;
    FCountry: string;
    procedure SetAddress(AValue: string);
    procedure SetCountry(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Country:string read FCountry write SetCountry;
    property Address:string read FAddress write SetAddress;
  end;

  { TAddress }

  TAddress = class(TXmlSerializationObject)
  private
    FAddressCode: string;
    FForeignAddress: TForeignAddress;
    FRussianAddress: TRussianAddress;
    procedure SetAddressCode(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property RussianAddress:TRussianAddress read FRussianAddress;
    property ForeignAddress:TForeignAddress read FForeignAddress;
    property AddressCode:string read FAddressCode write SetAddressCode;
  end;

  { TCustomsDeclarationWithHyphens }

  TCustomsDeclarationWithHyphens = class(TXmlSerializationObject)
  private
    FCountry: string;
    FDeclarationNumber: string;
    FHyphenCountry: string;
    procedure SetCountry(AValue: string);
    procedure SetDeclarationNumber(AValue: string);
    procedure SetHyphenCountry(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Country:string read FCountry write SetCountry;
    property HyphenCountry:string read FHyphenCountry write SetHyphenCountry;
    property DeclarationNumber:string read FDeclarationNumber write SetDeclarationNumber;
  end;
  TCustomsDeclarationList = specialize GXMLSerializationObjectList<TCustomsDeclarationWithHyphens>;

  { TCustomsDeclarations }

  TCustomsDeclarations = class(TXmlSerializationObject)
  private
    FCustomsDeclaration: TCustomsDeclarationList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property CustomsDeclaration:TCustomsDeclarationList read FCustomsDeclaration;
  end;

  { TAdditionalInfo }

  TAdditionalInfo = class(TXmlSerializationObject)
  private
    FId: string;
    FValue: string;
    procedure SetId(AValue: string);
    procedure SetValue(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Id:string read FId write SetId;
    property Value:string read FValue write SetValue;
  end;
  TAdditionalInfos = specialize GXMLSerializationObjectList<TAdditionalInfo>;

  { TExtendedOrganizationDetails_ManualFilling }

  TExtendedOrganizationDetails_ManualFilling = class(TXmlSerializationObject)
  private
    FBankAccountNumber: String;
    FBankId: String;
    FBankName: String;
    FCorrespondentAccount: String;
    FCountry: String;
    FDepartment: String;
    FEmail: string;
    FIndividualEntityRegistrationCertificate: String;
    FLegalEntityId: String;
    FOkdp: string;
    FOkopf: string;
    FOkpo: string;
    FOrganizationAdditionalInfo: String;
    FOrganizationOrPersonInfo: String;
    FOrgType: String;
    FPhone: string;
    FShortOrgName: String;
    procedure SetBankAccountNumber(AValue: String);
    procedure SetBankId(AValue: String);
    procedure SetBankName(AValue: String);
    procedure SetCorrespondentAccount(AValue: String);
    procedure SetCountry(AValue: String);
    procedure SetDepartment(AValue: String);
    procedure SetEmail(AValue: string);
    procedure SetIndividualEntityRegistrationCertificate(AValue: String);
    procedure SetLegalEntityId(AValue: String);
    procedure SetOkdp(AValue: string);
    procedure SetOkopf(AValue: string);
    procedure SetOkpo(AValue: string);
    procedure SetOrganizationAdditionalInfo(AValue: String);
    procedure SetOrganizationOrPersonInfo(AValue: String);
    procedure SetOrgType(AValue: String);
    procedure SetPhone(AValue: string);
    procedure SetShortOrgName(AValue: String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property OrgType:String read FOrgType write SetOrgType;
    property Okopf:string read FOkopf write SetOkopf;
    property Okpo:string read FOkpo write SetOkpo;
    property Okdp:string read FOkdp write SetOkdp;
    property Phone:string read FPhone write SetPhone;
    property Email:string read FEmail write SetEmail;
    property CorrespondentAccount:String read FCorrespondentAccount write SetCorrespondentAccount;
    property BankAccountNumber:String read FBankAccountNumber write SetBankAccountNumber;
    property BankName:String read FBankName write SetBankName;
    property BankId:String read FBankId write SetBankId;
    property Department:String read FDepartment write SetDepartment;
    property OrganizationAdditionalInfo:String read FOrganizationAdditionalInfo write SetOrganizationAdditionalInfo;
    property OrganizationOrPersonInfo:String read FOrganizationOrPersonInfo write SetOrganizationOrPersonInfo;
    property IndividualEntityRegistrationCertificate:String read FIndividualEntityRegistrationCertificate write SetIndividualEntityRegistrationCertificate;
    property LegalEntityId:String read FLegalEntityId write SetLegalEntityId;
    property ShortOrgName:String read FShortOrgName write SetShortOrgName;
    property Country:String read FCountry write SetCountry;
  end;

  TExtendedOrganizationDetails = class(TExtendedOrganizationDetails_ManualFilling)
  private
    FAddress: TAddress;
    FFnsParticipantId: string;
    FInn: string;
    FKpp: string;
    FOrgName: string;
    procedure SetFnsParticipantId(AValue: string);
    procedure SetInn(AValue: string);
    procedure SetKpp(AValue: string);
    procedure SetOrgName(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Address:TAddress read FAddress;
    property OrgName:string read FOrgName write SetOrgName;
    property Inn:string read FInn write SetInn;
    property Kpp:string read FKpp write SetKpp;
    property FnsParticipantId:string read FFnsParticipantId write SetFnsParticipantId;
  end;

  { TExtendedOrganizationDetailsWithHyphens }

  TExtendedOrganizationDetailsWithHyphens = class(TExtendedOrganizationDetails)
  private
    FHyphenInn: string;
    procedure SetHyphenInn(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property HyphenInn:string read FHyphenInn write SetHyphenInn;
  end;

  { TExtendedOrganizationReference }

  TExtendedOrganizationReference = class(TExtendedOrganizationDetails_ManualFilling)
  private
    FBoxId: string;
    procedure SetBoxId(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId;
  end;


  { TExtendedOrganizationInfoWithHyphens }

  TExtendedOrganizationInfoWithHyphens = class(TXmlSerializationObject)
  private
    FOrganizationDetails: TExtendedOrganizationDetailsWithHyphens;
    FOrganizationReference: TExtendedOrganizationReference;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetailsWithHyphens read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference read FOrganizationReference;
  end;
  TExtendedOrganizationInfoWithHyphensList = specialize GXMLSerializationObjectList<TExtendedOrganizationInfoWithHyphens>;

  { TShipper }

  TShipper = class(TXmlSerializationObject)
  private
    FOrganizationDetails: TExtendedOrganizationDetails;
    FOrganizationReference: TExtendedOrganizationReference;
    FSameAsSeller: string;
    procedure SetSameAsSeller(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property OrganizationDetails:TExtendedOrganizationDetails read FOrganizationDetails;
    property OrganizationReference:TExtendedOrganizationReference read FOrganizationReference;
    property SameAsSeller:string read FSameAsSeller write SetSameAsSeller;
  end;
  TShipperList = specialize GXMLSerializationObjectList<TShipper>;

  { TShippers }

  TShippers = class(TXmlSerializationObject)
  private
    FShipper: TShipperList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Shipper:TShipperList read FShipper;
  end;

  { TSignerReference }

  TSignerReference = class(TXmlSerializationObject)
  private
    FBoxId: string;
    FCertificateBytes: string;
    FCertificateThumbprint: string;
    procedure SetBoxId(AValue: string);
    procedure SetCertificateBytes(AValue: string);
    procedure SetCertificateThumbprint(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId;
    property CertificateBytes:string read FCertificateBytes write SetCertificateBytes;
    property CertificateThumbprint:string read FCertificateThumbprint write SetCertificateThumbprint;
  end;

  { TExtendedSignerDetailsBase }

  TExtendedSignerDetailsBase = class(TXmlSerializationObject)
  private
    FFirstName: string;
    FInn: string;
    FLastName: string;
    FMiddleName: string;
    FPosition: string;
    FRegistrationCertificate: string;
    FSignerInfo: string;
    FSignerOrganizationName: string;
    FSignerOrgPowersBase: string;
    FSignerPowersBase: string;
    FSignerType: string;
    procedure SetFirstName(AValue: string);
    procedure SetInn(AValue: string);
    procedure SetLastName(AValue: string);
    procedure SetMiddleName(AValue: string);
    procedure SetPosition(AValue: string);
    procedure SetRegistrationCertificate(AValue: string);
    procedure SetSignerInfo(AValue: string);
    procedure SetSignerOrganizationName(AValue: string);
    procedure SetSignerOrgPowersBase(AValue: string);
    procedure SetSignerPowersBase(AValue: string);
    procedure SetSignerType(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property LastName:string read FLastName write SetLastName;
    property FirstName:string read FFirstName write SetFirstName;
    property MiddleName:string read FMiddleName write SetMiddleName;
    property Position:string read FPosition write SetPosition;
    property Inn:string read FInn write SetInn;
    property RegistrationCertificate:string read FRegistrationCertificate write SetRegistrationCertificate;
    property SignerType:string read FSignerType write SetSignerType;
    property SignerOrganizationName:string read FSignerOrganizationName write SetSignerOrganizationName;
    property SignerInfo:string read FSignerInfo write SetSignerInfo;
    property SignerPowersBase:string read FSignerPowersBase write SetSignerPowersBase;
    property SignerOrgPowersBase:string read FSignerOrgPowersBase write SetSignerOrgPowersBase;
  end;

  {  TExtendedSignerDetails  }

  TExtendedSignerDetails = class(TExtendedSignerDetailsBase)
  private
    FSignerStatus: string;
    procedure SetSignerStatus(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property SignerStatus:string read FSignerStatus write SetSignerStatus;
  end;

  { TExtendedSignerDetails_SellerTitle }

  TExtendedSignerDetails_SellerTitle = class(TExtendedSignerDetails)
  private
    FSignerPowers: string;
    procedure SetSignerPowers(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property SignerPowers:string read FSignerPowers write SetSignerPowers;
  end;

  TSigner = class(TXmlSerializationObject)
  private
    FSignerDetails: TExtendedSignerDetails_SellerTitle;
    FSignerReference: TSignerReference;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property SignerReference:TSignerReference read FSignerReference;
    property SignerDetails:TExtendedSignerDetails_SellerTitle read FSignerDetails;
  end;
  TSignerList = specialize GXMLSerializationObjectList<TSigner>;

  { TSigners }

  TSigners = class(TXmlSerializationObject)
  private
    FSigner: TSignerList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Signer:TSignerList read FSigner;
  end;

  { TItemTracingInfo }

  TItemTracingInfo = class(TXmlSerializationObject)
  private
    FItemAddInfo: string;
    FQuantity: string;
    FRegNumberUnit: string;
    FUnt: string;
    procedure SetItemAddInfo(AValue: string);
    procedure SetQuantity(AValue: string);
    procedure SetRegNumberUnit(AValue: string);
    procedure SetUnt(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property RegNumberUnit:string read FRegNumberUnit write SetRegNumberUnit;
    property Unt:string read FUnt write SetUnt;
    property Quantity:string read FQuantity write SetQuantity;
    property ItemAddInfo:string read FItemAddInfo write SetItemAddInfo;
  end;
  TItemTracingInfos = specialize GXMLSerializationObjectList<TItemTracingInfo>;

  { TItemIdentificationNumber }

  TItemIdentificationNumber = class(TXmlSerializationObject)
  private
    FPackageId: string;
    FTransPackageId: string;
    FUnt: string;
    procedure SetPackageId(AValue: string);
    procedure SetTransPackageId(AValue: string);
    procedure SetUnt(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Unt:string read FUnt write SetUnt;
    property PackageId:string read FPackageId write SetPackageId;
    property TransPackageId:string read FTransPackageId write SetTransPackageId;
  end;
  TItemIdentificationNumberList = specialize GXMLSerializationObjectList<TItemIdentificationNumber>;

  { TItemIdentificationNumbers }

  TItemIdentificationNumbers = class(TXmlSerializationObject)
  private
    FItemIdentificationNumber: TItemIdentificationNumberList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property ItemIdentificationNumber:TItemIdentificationNumberList read FItemIdentificationNumber;
  end;

  { TInvoiceItem }

  TInvoiceItem = class(TXmlSerializationObject)
  private
    FAdditionalInfos: TAdditionalInfos;
    FAdditionalProperty: string;
    FCatalogCode: string;
    FCustomsDeclarations: TCustomsDeclarations;
    FExcise: string;
    FHyphenSubtotal: string;
    FHyphenUnit: string;
    FHyphenVat: string;
    FItemArticle: string;
    FItemCharact: string;
    FItemIdentificationNumbers: TItemIdentificationNumbers;
    FItemKind: string;
    FItemMark: string;
    FItemToRelease: string;
    FItemTracingInfos: TItemTracingInfos;
    FItemTypeCode: string;
    FItemVendorCode: string;
    FPrice: string;
    FProduct: string;
    FQuantity: string;
    FSubtotal: string;
    FSubtotalWithVatExcluded: string;
    FTaxRate: string;
    FUnitName: string;
    FUnt: string;
    FVat: string;
    FWithoutVat: string;
    procedure SetAdditionalProperty(AValue: string);
    procedure SetCatalogCode(AValue: string);
    procedure SetExcise(AValue: string);
    procedure SetHyphenSubtotal(AValue: string);
    procedure SetHyphenUnit(AValue: string);
    procedure SetHyphenVat(AValue: string);
    procedure SetItemArticle(AValue: string);
    procedure SetItemCharact(AValue: string);
    procedure SetItemKind(AValue: string);
    procedure SetItemMark(AValue: string);
    procedure SetItemToRelease(AValue: string);
    procedure SetItemTypeCode(AValue: string);
    procedure SetItemVendorCode(AValue: string);
    procedure SetPrice(AValue: string);
    procedure SetProduct(AValue: string);
    procedure SetQuantity(AValue: string);
    procedure SetSubtotal(AValue: string);
    procedure SetSubtotalWithVatExcluded(AValue: string);
    procedure SetTaxRate(AValue: string);
    procedure SetUnitName(AValue: string);
    procedure SetUnt(AValue: string);
    procedure SetVat(AValue: string);
    procedure SetWithoutVat(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property CustomsDeclarations:TCustomsDeclarations read FCustomsDeclarations;
    property AdditionalInfos:TAdditionalInfos read FAdditionalInfos;
    property ItemTracingInfos:TItemTracingInfos read FItemTracingInfos;
    property ItemIdentificationNumbers:TItemIdentificationNumbers read FItemIdentificationNumbers;
    property Product:string read FProduct write SetProduct;
    property Unt:string read FUnt write SetUnt;
    property HyphenUnit:string read FHyphenUnit write SetHyphenUnit;
    property UnitName:string read FUnitName write SetUnitName;
    property Quantity:string read FQuantity write SetQuantity;
    property Price:string read FPrice write SetPrice;
    property Excise:string read FExcise write SetExcise;
    property TaxRate:string read FTaxRate write SetTaxRate;
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write SetSubtotalWithVatExcluded;
    property Vat:string read FVat write SetVat;
    property WithoutVat:string read FWithoutVat write SetWithoutVat;
    property HyphenVat:string read FHyphenVat write SetHyphenVat;
    property Subtotal:string read FSubtotal write SetSubtotal;
    property HyphenSubtotal:string read FHyphenSubtotal write SetHyphenSubtotal;
    property ItemMark:string read FItemMark write SetItemMark;
    property AdditionalProperty:string read FAdditionalProperty write SetAdditionalProperty;
    property ItemVendorCode:string read FItemVendorCode write SetItemVendorCode;
    property ItemToRelease:string read FItemToRelease write SetItemToRelease;
    property ItemCharact:string read FItemCharact write SetItemCharact;
    property ItemArticle:string read FItemArticle write SetItemArticle;
    property ItemKind:string read FItemKind write SetItemKind;
    property CatalogCode:string read FCatalogCode write SetCatalogCode;
    property ItemTypeCode:string read FItemTypeCode write SetItemTypeCode;
  end;
  TInvoiceItems = specialize GXMLSerializationObjectList<TInvoiceItem>;

  { TInvoiceTable }

  TInvoiceTable = class(TXmlSerializationObject)
  private
    FHyphenTotal: string;
    FHyphenVat: string;
    FItems: TInvoiceItems;
    FTotal: string;
    FTotalNet: string;
    FTotalWithVatExcluded: string;
    FVat: string;
    FWithoutVat: string;
    procedure SetHyphenTotal(AValue: string);
    procedure SetHyphenVat(AValue: string);
    procedure SetTotal(AValue: string);
    procedure SetTotalNet(AValue: string);
    procedure SetTotalWithVatExcluded(AValue: string);
    procedure SetVat(AValue: string);
    procedure SetWithoutVat(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Items:TInvoiceItems read FItems;
    property TotalWithVatExcluded:string read FTotalWithVatExcluded write SetTotalWithVatExcluded;
    property Vat:string read FVat write SetVat;
    property WithoutVat:string read FWithoutVat write SetWithoutVat;
    property HyphenVat:string read FHyphenVat write SetHyphenVat;
    property Total:string read FTotal write SetTotal;
    property HyphenTotal:string read FHyphenTotal write SetHyphenTotal;
    property TotalNet:string read FTotalNet write SetTotalNet;
  end;

  { TSellers }

  TSellers = class(TXmlSerializationObject)
  private
    FSeller: TExtendedOrganizationInfoWithHyphensList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Seller:TExtendedOrganizationInfoWithHyphensList read FSeller;
  end;

  { TBuyers }

  TBuyers = class(TXmlSerializationObject)
  private
    FBuyer: TExtendedOrganizationInfoWithHyphensList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Buyer:TExtendedOrganizationInfoWithHyphensList read FBuyer;
  end;

  { TConsignees }

  TConsignees = class(TXmlSerializationObject)
  private
    FConsignee: TExtendedOrganizationInfoWithHyphensList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Consignee:TExtendedOrganizationInfoWithHyphensList read FConsignee;
  end;

  { TPaymentDocumentInfo }

  TPaymentDocumentInfo = class(TXmlSerializationObject)
  private
    FDate: string;
    FNumber: string;
    FTotal: string;
    procedure SetDate(AValue: string);
    procedure SetNumber(AValue: string);
    procedure SetTotal(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Date:string read FDate write SetDate;
    property Number:string read FNumber write SetNumber;
    property Total:string read FTotal write SetTotal;
  end;
  TPaymentDocumentInfoList = specialize GXMLSerializationObjectList<TPaymentDocumentInfo>;

  { TPaymentDocuments }

  TPaymentDocuments = class(TXmlSerializationObject)
  private
    FDocuments: TPaymentDocumentInfoList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Documents:TPaymentDocumentInfoList read FDocuments;
  end;

  { TTransferBase }

  TTransferBase = class(TXmlSerializationObject)
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
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property BaseDocumentName:string read FBaseDocumentName write SetBaseDocumentName;
    property BaseDocumentNumber:string read FBaseDocumentNumber write SetBaseDocumentNumber;
    property BaseDocumentDate:string read FBaseDocumentDate write SetBaseDocumentDate;
    property BaseDocumentInfo:string read FBaseDocumentInfo write SetBaseDocumentInfo;
  end;

  { TTransferBase820 }

  TTransferBase820 = class(TTransferBase)
  private
    FBaseDocumentId: string;
    procedure SetBaseDocumentId(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property BaseDocumentId:string read FBaseDocumentId write SetBaseDocumentId;
  end;
  TTransferBase820s = specialize GXMLSerializationObjectList<TTransferBase820>;

  { TTransferBases }

  TTransferBases = class(TXmlSerializationObject)
  private
    FTransferBase: TTransferBase820s;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property TransferBase:TTransferBase820s read FTransferBase;
  end;

  { TWaybill }

  TWaybill = class(TXmlSerializationObject)
  private
    FTransferDocumentDate: string;
    FTransferDocumentNumber: string;
    procedure SetTransferDocumentDate(AValue: string);
    procedure SetTransferDocumentNumber(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property TransferDocumentNumber:string read FTransferDocumentNumber write SetTransferDocumentNumber;
    property TransferDocumentDate:string read FTransferDocumentDate write SetTransferDocumentDate;
  end;
  TWaybillList = specialize GXMLSerializationObjectList<TWaybill>;


  { TWaybills }

  TWaybills = class(TXmlSerializationObject)
  private
    FWaybill: TWaybillList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Waybill:TWaybillList read FWaybill;
  end;

  { TAdditionalInfoId }

  TAdditionalInfoId = class(TXmlSerializationObject)
  private
    FAdditionalInfo: string;
    FInfoFileId: string;
    procedure SetAdditionalInfo(AValue: string);
    procedure SetInfoFileId(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property AdditionalInfo:string read FAdditionalInfo write SetAdditionalInfo;
    property InfoFileId:string read FInfoFileId write SetInfoFileId;
  end;

  { TEmployee }

  TEmployee = class(TXmlSerializationObject)
  private
    FEmployeeBase: string;
    FEmployeeInfo: string;
    FFirstName: string;
    FLastName: string;
    FMiddleName: string;
    FPosition: string;
    procedure SetEmployeeBase(AValue: string);
    procedure SetEmployeeInfo(AValue: string);
    procedure SetFirstName(AValue: string);
    procedure SetLastName(AValue: string);
    procedure SetMiddleName(AValue: string);
    procedure SetPosition(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Position:string read FPosition write SetPosition;
    property EmployeeInfo:string read FEmployeeInfo write SetEmployeeInfo;
    property EmployeeBase:string read FEmployeeBase write SetEmployeeBase;
    property LastName:string read FLastName write SetLastName;
    property FirstName:string read FFirstName write SetFirstName;
    property MiddleName:string read FMiddleName write SetMiddleName;
  end;

  { TOtherIssuer }

  TOtherIssuer = class(TXmlSerializationObject)
  private
    FEmployeeBase: string;
    FEmployeeInfo: string;
    FFirstName: string;
    FLastName: string;
    FMiddleName: string;
    FOrganizationBase: string;
    FOrganizationName: string;
    FPosition: string;
    procedure SetEmployeeBase(AValue: string);
    procedure SetEmployeeInfo(AValue: string);
    procedure SetFirstName(AValue: string);
    procedure SetLastName(AValue: string);
    procedure SetMiddleName(AValue: string);
    procedure SetOrganizationBase(AValue: string);
    procedure SetOrganizationName(AValue: string);
    procedure SetPosition(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Position:string read FPosition write SetPosition;
    property EmployeeInfo:string read FEmployeeInfo write SetEmployeeInfo;
    property EmployeeBase:string read FEmployeeBase write SetEmployeeBase;
    property OrganizationName:string read FOrganizationName write SetOrganizationName;
    property OrganizationBase:string read FOrganizationBase write SetOrganizationBase;
    property LastName:string read FLastName write SetLastName;
    property FirstName:string read FFirstName write SetFirstName;
    property MiddleName:string read FMiddleName write SetMiddleName;
  end;

  { TTransferInfo }

  TTransferInfo = class(TXmlSerializationObject)
  private
    FAdditionalInfoId: TAdditionalInfoId;
    FCarrier: TExtendedOrganizationInfoWithHyphens;
    FCreatedThingInfo: string;
    FCreatedThingTransferDate: string;
    FEmployee: TEmployee;
    FOperationInfo: string;
    FOperationType: string;
    FOtherIssuer: TOtherIssuer;
    FTransferBases: TTransferBases;
    FTransferDate: string;
    FTransferEndDate: string;
    FTransferStartDate: string;
    FTransferTextInfo: string;
    FWaybills: TWaybills;
    procedure SetCreatedThingInfo(AValue: string);
    procedure SetCreatedThingTransferDate(AValue: string);
    procedure SetOperationInfo(AValue: string);
    procedure SetOperationType(AValue: string);
    procedure SetTransferDate(AValue: string);
    procedure SetTransferEndDate(AValue: string);
    procedure SetTransferStartDate(AValue: string);
    procedure SetTransferTextInfo(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property TransferBases:TTransferBases read FTransferBases;
    property Waybills:TWaybills read FWaybills;
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;
    property Carrier:TExtendedOrganizationInfoWithHyphens read FCarrier;
    property Employee:TEmployee read FEmployee;
    property OtherIssuer:TOtherIssuer read FOtherIssuer;
    property OperationInfo:string read FOperationInfo write SetOperationInfo;
    property OperationType:string read FOperationType write SetOperationType;
    property TransferDate:string read FTransferDate write SetTransferDate;
    property TransferStartDate:string read FTransferStartDate write SetTransferStartDate;
    property TransferEndDate:string read FTransferEndDate write SetTransferEndDate;
    property TransferTextInfo:string read FTransferTextInfo write SetTransferTextInfo;
    property CreatedThingTransferDate:string read FCreatedThingTransferDate write SetCreatedThingTransferDate;
    property CreatedThingInfo:string read FCreatedThingInfo write SetCreatedThingInfo;
  end;


  { TUniversalTransferDocumentWithHyphens }

  TUniversalTransferDocumentWithHyphens = class(TXmlSerializationObject)
  private
    FAdditionalInfoId: TAdditionalInfoId;
    FBuyers: TBuyers;
    FCircumFormatInvoice: string;
    FConsignees: TConsignees;
    FCurrency: string;
    FCurrencyRate: string;
    FDocumentCreator: string;
    FDocumentCreatorBase: string;
    FDocumentDate: string;
    FDocumentName: string;
    FDocumentNumber: string;
    FFactorInfo: TExtendedOrganizationInfoWithHyphens;
    FFunct: string;
    FGovernmentContractInfo: string;
    FHyphenRevisionDate: string;
    FHyphenRevisionNumber: string;
    FPaymentDocuments: TPaymentDocuments;
    FRevisionDate: string;
    FRevisionNumber: string;
    FSellers: TSellers;
    FShippers: TShippers;
    FSigners: TSigner;
    FTable: TInvoiceTable;
    FTransferInfo: TTransferInfo;
    procedure SetCircumFormatInvoice(AValue: string);
    procedure SetCurrency(AValue: string);
    procedure SetCurrencyRate(AValue: string);
    procedure SetDocumentCreator(AValue: string);
    procedure SetDocumentCreatorBase(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentName(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFunct(AValue: string);
    procedure SetGovernmentContractInfo(AValue: string);
    procedure SetHyphenRevisionDate(AValue: string);
    procedure SetHyphenRevisionNumber(AValue: string);
    procedure SetRevisionDate(AValue: string);
    procedure SetRevisionNumber(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
    function RootNodeName:string; override;
  public
    destructor Destroy; override;
  published
    property Sellers:TSellers read FSellers;
    property Buyers:TBuyers read FBuyers;
    property Shippers:TShippers read FShippers;
    property Consignees:TConsignees read FConsignees;
    property Signers:TSigner read FSigners;
    property PaymentDocuments:TPaymentDocuments read FPaymentDocuments;
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId;
    property Table:TInvoiceTable read FTable;
    property TransferInfo:TTransferInfo read FTransferInfo;
    property FactorInfo:TExtendedOrganizationInfoWithHyphens read FFactorInfo;
(*
      <xs:element minOccurs="0" name="MainAssignMonetaryClaim" type="TransferBase820">
        <xs:annotation>
          <xs:documentation>ОснУстДенТреб - Основание уступки денежного требования</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element minOccurs="0" name="SellerInfoCircumPublicProc">
        <xs:annotation>
          <xs:documentation>ИнфПродГосЗакКазн - Информация продавца об обстоятельствах закупок для
                          государственных и муниципальных нужд
                      </xs:documentation>
        </xs:annotation>
        <xs:complexType>
          <xs:attribute name="DateStateContract" type="date" use="required">
            <xs:annotation>
              <xs:documentation>ДатаГосКонт - Дата государственного контракта</xs:documentation>
            </xs:annotation>
          </xs:attribute>
          <xs:attribute name="NumberStateContract" type="string100" use="required">
            <xs:annotation>
              <xs:documentation>НомерГосКонт - Номер государственного контракта</xs:documentation>
            </xs:annotation>
          </xs:attribute>
          <xs:attribute name="PersonalAccountSeller" use="optional">
            <xs:annotation>
              <xs:documentation>ЛицСчетПрод - Номер лицевого счета продавца</xs:documentation>
            </xs:annotation>
            <xs:simpleType>
              <xs:restriction base="xs:string">
                <xs:length value="11" />
              </xs:restriction>
            </xs:simpleType>
          </xs:attribute>
          <xs:attribute name="SellerBudjetClassCode" type="string20f" use="optional">
            <xs:annotation>
              <xs:documentation>КодПродБюджКласс - Код бюджетной классификации продавца
                              </xs:documentation>
            </xs:annotation>
          </xs:attribute>
          <xs:attribute name="SellerTargetCode" type="string20f" use="optional">
            <xs:annotation>
              <xs:documentation>КодЦелиПрод - Код цели продавца</xs:documentation>
            </xs:annotation>
          </xs:attribute>
          <xs:attribute name="SellerTreasuryCode" use="optional">
            <xs:annotation>
              <xs:documentation>КодКазначПрод - Код территориального органа Федерального казначейства
                                  продавца
                              </xs:documentation>
            </xs:annotation>
            <xs:simpleType>
              <xs:restriction base="xs:string">
                <xs:minLength value="1" />
                <xs:maxLength value="4" />
              </xs:restriction>
            </xs:simpleType>
          </xs:attribute>
          <xs:attribute name="SellerTreasuryName" type="string2000" use="optional">
            <xs:annotation>
              <xs:documentation>НаимКазначПрод - Наименование территориального органа Федерального
                                  казначейства продавца
                              </xs:documentation>
            </xs:annotation>
          </xs:attribute>
        </xs:complexType>
      </xs:element>
      <xs:element minOccurs="0" name="DocumentShipments">
        <xs:complexType>
          <xs:sequence>
            <xs:element maxOccurs="unbounded" name="DocumentShipment">
              <xs:annotation>
                <xs:documentation>ДокПодтвОтгр - Реквизиты документа, подтверждающего отгрузку
                                      товаров
                                  </xs:documentation>
              </xs:annotation>
              <xs:complexType>
                <xs:attribute name="Name" type="string255" use="required">
                  <xs:annotation>
                    <xs:documentation>НаимДокОтгр - Наименование документа об отгрузке
                                          </xs:documentation>
                  </xs:annotation>
                </xs:attribute>
                <xs:attribute name="Number" type="string255" use="required">
                  <xs:annotation>
                    <xs:documentation>НомДокОтгр - Номер документа об отгрузке
                                          </xs:documentation>
                  </xs:annotation>
                </xs:attribute>
                <xs:attribute name="Date" type="date" use="optional">
                  <xs:annotation>
                    <xs:documentation>ДатаДокОтгр - Дата документа об отгрузке
                                          </xs:documentation>
                  </xs:annotation>
                </xs:attribute>
              </xs:complexType>
            </xs:element>
          </xs:sequence>
        </xs:complexType>
      </xs:element>
    </xs:all>
*)
    property Funct:string read FFunct write SetFunct;
(*
    <xs:attribute name="ApprovedStructureAdditionalInfoFields" type="string14f" use="optional">
      <xs:annotation>
        <xs:documentation>СоглСтрДопИнф - Информация о наличии согласованной структуры дополнительных
                      информационных полей
                  </xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="SenderFnsParticipantId" use="optional">
      <xs:annotation>
        <xs:documentation>ИдОтпр - идентификатор участника ЭДО.</xs:documentation>
        <xs:documentation>Если не указан, то в атрибут ИдОтпр подставится идентификатор первой организации, указанной в элементе Sellers</xs:documentation>
      </xs:annotation>
      <xs:simpleType>
        <xs:restriction base="xs:string">
          <xs:minLength value="4" />
          <xs:maxLength value="46" />
        </xs:restriction>
      </xs:simpleType>
    </xs:attribute>
    <xs:attribute name="RecipientFnsParticipantId" use="optional">
      <xs:annotation>
        <xs:documentation>ИдПол - идентификатор участника ЭДО</xs:documentation>
        <xs:documentation>Если не указан, то в атрибут ИдПол подставится идентификатор первой организации, указанной в элементе Buyers</xs:documentation>
      </xs:annotation>
      <xs:simpleType>
        <xs:restriction base="xs:string">
          <xs:minLength value="4" />
          <xs:maxLength value="46" />
        </xs:restriction>
      </xs:simpleType>
    </xs:attribute>
*)
    property DocumentName:string read FDocumentName write SetDocumentName;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;
    property Currency:string read FCurrency write SetCurrency;
    property CurrencyRate:string read FCurrencyRate write SetCurrencyRate;
    property RevisionDate:string read FRevisionDate write SetRevisionDate;
    property HyphenRevisionDate:string read FHyphenRevisionDate write SetHyphenRevisionDate;
    property RevisionNumber:string read FRevisionNumber write SetRevisionNumber;
    property HyphenRevisionNumber:string read FHyphenRevisionNumber write SetHyphenRevisionNumber;
    property DocumentCreator:string read FDocumentCreator write SetDocumentCreator;
    property DocumentCreatorBase:string read FDocumentCreatorBase write SetDocumentCreatorBase;
    property GovernmentContractInfo:string read FGovernmentContractInfo write SetGovernmentContractInfo;
    property CircumFormatInvoice:string read FCircumFormatInvoice write SetCircumFormatInvoice;
  end;

(*
  <xs:simpleType name="inn">
    <xs:restriction base="xs:string">
      <xs:minLength value="10" />
      <xs:maxLength value="12" />
      <xs:pattern value="([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})([0-9]{10}|[0-9]{8})" />
    </xs:restriction>
  </xs:simpleType>
  </xs:simpleType>
  <xs:simpleType name="okv">
    <xs:annotation>
      <xs:documentation>Код из Общероссийского классификатора валют</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:length value="3" />
      <xs:pattern value="[0-9]{3}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="date">
    <xs:annotation>
      <xs:documentation>Дата в формате ДД.ММ.ГГГГ (01.01.1800 - 31.12.2099)</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:length value="10" />
      <xs:pattern value="(((0[1-9]{1}|[1-2]{1}[0-9]{1})\.(0[1-9]{1}|1[0-2]{1}))|((30)\.(01|0[3-9]{1}|1[0-2]{1}))|((31)\.(01|03|05|07|08|10|12)))\.(18[0-9]{2}|19[0-9]{2}|20[0-9]{2})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="CustomsDeclaration">
    <xs:attribute name="Country" type="string1000" use="required">
      <xs:annotation>
        <xs:documentation>
					КодПроисх - Код страны происхождения товара по Общероссийскому классификатору стран мира (ОКСМ) или
					980 - Евросоюз,
					981 - ЕАЭС
				</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="DeclarationNumber" type="string1000" use="required">
      <xs:annotation>
        <xs:documentation>Номер таможенной декларации</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="InvoiceTotalsDiff">
    <xs:attribute name="TotalWithVatExcluded" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>сумма без учета налога</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Vat" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>сумма налога</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Total" type="xs:decimal" use="required">
      <xs:annotation>
        <xs:documentation>сумма всего</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="InvoiceItemAmountsDiff">
    <xs:attribute name="Excise" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>акциз</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="SubtotalWithVatExcluded" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>сумма без учета налога</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Vat" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>сумма налога</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Subtotal" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>сумма с учетом налога</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="CorrectableInvoiceItemFields_WithoutTaxRate">
    <xs:attribute name="Unit" type="xs:string" use="optional">
      <xs:annotation>
        <xs:documentation>единицы измерения товара (код)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Quantity" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>количество единиц товара</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Price" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>цена за единицу товара</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Excise" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>акциз</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="SubtotalWithVatExcluded" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>сумма без учета налога</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Vat" type="xs:decimal" use="optional">
      <xs:annotation>
        <xs:documentation>сумма налога</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Subtotal" type="xs:decimal" use="required">
      <xs:annotation>
        <xs:documentation>сумма с учетом налога</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="CorrectableInvoiceItemFields">
    <xs:complexContent mixed="false">
      <xs:extension base="CorrectableInvoiceItemFields_WithoutTaxRate">
        <xs:attribute name="TaxRate" type="TaxRate" use="required">
          <xs:annotation>
            <xs:documentation>ставка налога</xs:documentation>
          </xs:annotation>
        </xs:attribute>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="CorrectableInvoiceItemFields_WithTwentyPercent">
    <xs:complexContent mixed="false">
      <xs:extension base="CorrectableInvoiceItemFields_WithoutTaxRate">
        <xs:attribute name="TaxRate" type="TaxRateWithTwentyPercent" use="required">
          <xs:annotation>
            <xs:documentation>ставка налога</xs:documentation>
          </xs:annotation>
        </xs:attribute>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="CorrectableInvoiceItemFields_WithTaxedByAgent">
    <xs:complexContent mixed="false">
      <xs:extension base="CorrectableInvoiceItemFields_WithoutTaxRate">
        <xs:attribute name="TaxRate" type="TaxRateWithTaxedByAgent" use="required">
          <xs:annotation>
            <xs:documentation>ставка налога</xs:documentation>
          </xs:annotation>
        </xs:attribute>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="CorrectableInvoiceItemFields_WithTwentyPercentAndTaxedByAgent">
    <xs:complexContent mixed="false">
      <xs:extension base="CorrectableInvoiceItemFields_WithoutTaxRate">
        <xs:attribute name="TaxRate" type="TaxRateWithTwentyPercentAndTaxedByAgent" use="required">
          <xs:annotation>
            <xs:documentation>ставка налога</xs:documentation>
          </xs:annotation>
        </xs:attribute>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:simpleType name="TaxRate">
    <xs:restriction base="xs:string">
      <xs:enumeration value="без НДС" />
      <xs:enumeration value="0%" />
      <xs:enumeration value="10%" />
      <xs:enumeration value="18%" />
      <xs:enumeration value="10/110" />
      <xs:enumeration value="18/118" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TaxRateWithTaxedByAgent">
    <xs:restriction base="xs:string">
      <xs:enumeration value="без НДС" />
      <xs:enumeration value="0%" />
      <xs:enumeration value="10%" />
      <xs:enumeration value="18%" />
      <xs:enumeration value="10/110" />
      <xs:enumeration value="18/118" />
      <xs:enumeration value="НДС исчисляется налоговым агентом" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TaxRateWithTwentyPercent">
    <xs:restriction base="xs:string">
      <xs:enumeration value="без НДС" />
      <xs:enumeration value="0%" />
      <xs:enumeration value="10%" />
      <xs:enumeration value="18%" />
      <xs:enumeration value="20%" />
      <xs:enumeration value="10/110" />
      <xs:enumeration value="18/118" />
      <xs:enumeration value="20/120" />
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="Attorney">
    <xs:all>
      <xs:element minOccurs="0" name="IssuerPerson" type="Official">
        <xs:annotation>
          <xs:documentation>Лицо, выдавшее доверенность</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element minOccurs="0" name="RecipientPerson" type="Official">
        <xs:annotation>
          <xs:documentation>Лицо, получившее доверенность</xs:documentation>
        </xs:annotation>
      </xs:element>
    </xs:all>
    <xs:attribute name="Date" type="date" use="optional">
      <xs:annotation>
        <xs:documentation>Дата выдачи доверенности</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Number" type="string255" use="optional">
      <xs:annotation>
        <xs:documentation>Номер доверенности</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="IssuerOrganizationName" type="string1000" use="optional">
      <xs:annotation>
        <xs:documentation>Организация, представитель которой выдал доверенность</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="IssuerAdditionalInfo" type="string1000" use="optional">
      <xs:annotation>
        <xs:documentation>Дополнительная информация о выдавшем доверенность</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="RecipientAdditionalInfo" type="string1000" use="optional">
      <xs:annotation>
        <xs:documentation>Дополнительная информация о получившем доверенность</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="Official">
    <xs:attribute name="LastName" type="string60" use="required" />
    <xs:attribute name="FirstName" type="string60" use="required" />
    <xs:attribute name="MiddleName" type="string60" use="optional" />
    <xs:attribute name="Position" type="string128z" use="optional" />
  </xs:complexType>
  <xs:complexType name="AcceptanceCertificateSignatureInfo">
    <xs:sequence>
      <xs:element minOccurs="0" name="Official" type="Official">
        <xs:annotation>
          <xs:documentation>лицо, подписывающее со стороны исполнителя / заказчика</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element minOccurs="0" name="Attorney" type="Attorney">
        <xs:annotation>
          <xs:documentation>сведения о доверенности подписывающего со стороны исполнителя / заказчика</xs:documentation>
        </xs:annotation>
      </xs:element>
    </xs:sequence>
    <xs:attribute name="SignatureDate" type="date" use="optional">
      <xs:annotation>
        <xs:documentation>дата подписи акта исполнителем / заказчиком</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="GroundInfo">
    <xs:attribute name="Name" type="string255" use="required">
      <xs:annotation>
        <xs:documentation>НаимОсн - Наименование документа-основания</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Number" type="string255" use="optional">
      <xs:annotation>
        <xs:documentation>НомОсн - Номер документа-основания</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Date" type="date" use="optional">
      <xs:annotation>
        <xs:documentation>ДатаОсн - Дата документа-основания</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="Info" type="string1000" use="optional">
      <xs:annotation>
        <xs:documentation>ДопСвОсн - Дополнительные сведения документа-основания</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="ExtendedOrganizationInfo">
    <xs:choice>
      <xs:element name="OrganizationDetails" type="ExtendedOrganizationDetails" />
      <xs:element name="OrganizationReference" type="ExtendedOrganizationReference" />
    </xs:choice>
  </xs:complexType>
  <xs:complexType name="SignerInfo">
    <xs:choice>
      <xs:element name="SignerDetails" type="SignerDetails" />
      <xs:element name="SignerReference" type="SignerReferenceInfo" />
    </xs:choice>
  </xs:complexType>
  <xs:complexType name="SignerDetails">
    <xs:attribute name="LastName" type="xs:string" use="required" />
    <xs:attribute name="FirstName" type="xs:string" use="required" />
    <xs:attribute name="MiddleName" type="xs:string" use="optional" />
    <xs:attribute name="Position" type="xs:string" use="optional" />
    <xs:attribute name="Inn" type="xs:string" use="required" />
    <xs:attribute name="SoleProprietorRegistrationCertificate" type="xs:string" use="optional" />
  </xs:complexType>
  <xs:complexType name="SignerReferenceInfo">
    <xs:attribute name="CertificateBytes" type="xs:base64Binary" use="optional">
      <xs:annotation>
        <xs:documentation>X.509 сертификат подписанта (DER-кодировка) в формате BASE64</xs:documentation>
        <xs:documentation>Одно из полей CertificateBytes или CertificateThumbprint обязательно для заполнения</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="CertificateThumbprint" type="string100" use="optional">
      <xs:annotation>
        <xs:documentation>Отпечаток сертификата подписанта</xs:documentation>
        <xs:documentation>Одно из полей CertificateBytes или CertificateThumbprint обязательно для заполнения</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="ExtendedSignerDetails_BuyerTitle">
    <xs:complexContent mixed="false">
      <xs:extension base="ExtendedSignerDetails">
        <xs:attribute name="SignerPowers" use="required">
          <xs:annotation>
            <xs:documentation>ОблПолн - Область полномочий</xs:documentation>
            <xs:documentation>
							1 - лицо, совершившее сделку, операцию
							2 - лицо, совершившее сделку, операцию и ответственное за ее оформление
							3 - лицо, ответственное за оформление свершившегося события
						</xs:documentation>
          </xs:annotation>
          <xs:simpleType>
            <xs:restriction base="xs:integer">
              <xs:enumeration value="1" />
              <xs:enumeration value="2" />
              <xs:enumeration value="3" />
            </xs:restriction>
          </xs:simpleType>
        </xs:attribute>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="ExtendedSignerDetails_BuyerTitle820">
    <xs:complexContent mixed="false">
      <xs:extension base="ExtendedSignerDetailsBase">
        <xs:attribute name="SignerPowers" use="required">
          <xs:annotation>
            <xs:documentation>ОблПолн - Область полномочий</xs:documentation>
            <xs:documentation>
							1 - лицо, совершившее сделку, операцию
							2 - лицо, совершившее сделку, операцию и ответственное за ее оформление
							3 - лицо, ответственное за оформление свершившегося события
						</xs:documentation>
          </xs:annotation>
          <xs:simpleType>
            <xs:restriction base="xs:integer">
              <xs:enumeration value="1" />
              <xs:enumeration value="2" />
              <xs:enumeration value="3" />
            </xs:restriction>
          </xs:simpleType>
        </xs:attribute>
        <xs:attribute name="SignerStatus" use="required">
          <xs:annotation>
            <xs:documentation>Статус</xs:documentation>
            <xs:documentation>
							3 - работник иной уполномоченной организации;
							4 - уполномоченное физическое лицо, в том числе индивидуальный предприниматель;
							5 - работник организации – покупателя;
							6 - работник организации – составителя файла обмена информации покупателя, если составитель файла обмена информации покупателя не является покупателем.
						</xs:documentation>
          </xs:annotation>
          <xs:simpleType>
            <xs:restriction base="xs:integer">
              <xs:enumeration value="3" />
              <xs:enumeration value="4" />
              <xs:enumeration value="5" />
              <xs:enumeration value="6" />
            </xs:restriction>
          </xs:simpleType>
        </xs:attribute>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="ExtendedSignerDetails_CorrectionSellerTitle">
    <xs:complexContent mixed="false">
      <xs:extension base="ExtendedSignerDetails">
        <xs:attribute name="SignerPowers" use="required">
          <xs:annotation>
            <xs:documentation>ОблПолн - Область полномочий</xs:documentation>
            <xs:documentation>
							0 - лицо, ответственное за подписание счетов-фактур;
							3 – лицо, ответственное за оформление свершившегося события;
							6 - лицо, совершившее сделку, операцию и ответственное за подписание счетов-фактур
						</xs:documentation>
          </xs:annotation>
          <xs:simpleType>
            <xs:restriction base="xs:integer">
              <xs:enumeration value="0" />
              <xs:enumeration value="3" />
              <xs:enumeration value="6" />
            </xs:restriction>
          </xs:simpleType>
        </xs:attribute>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="ExtendedSignerDetails_CorrectionBuyerTitle">
    <xs:complexContent mixed="false">
      <xs:extension base="ExtendedSignerDetails">
        <xs:attribute name="SignerPowers" use="required">
          <xs:annotation>
            <xs:documentation>ОблПолн - Область полномочий</xs:documentation>
            <xs:documentation>
							3 – лицо, ответственное за оформление свершившегося события;
						</xs:documentation>
          </xs:annotation>
          <xs:simpleType>
            <xs:restriction base="xs:integer">
              <xs:enumeration value="3" />
            </xs:restriction>
          </xs:simpleType>
        </xs:attribute>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="ExtendedSignerDetails_551_552">
    <xs:complexContent mixed="false">
      <xs:extension base="ExtendedSignerDetails">
        <xs:attribute name="SignerPowers" use="required">
          <xs:annotation>
            <xs:documentation>ОблПолн - Область полномочий</xs:documentation>
            <xs:documentation>
							1 - лицо, совершившее сделку, операцию;
							2 – лицо, совершившее сделку, операцию и ответственное за ее оформление;
							3 – лицо, ответственное за оформление свершившегося события
						</xs:documentation>
          </xs:annotation>
          <xs:simpleType>
            <xs:restriction base="xs:integer">
              <xs:enumeration value="1" />
              <xs:enumeration value="2" />
              <xs:enumeration value="3" />
            </xs:restriction>
          </xs:simpleType>
        </xs:attribute>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>

</xs:schema>
*)
implementation

{ TItemIdentificationNumbers }

procedure TItemIdentificationNumbers.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('ItemIdentificationNumber', 'ItemIdentificationNumber', [], '', -1, -1);
end;

procedure TItemIdentificationNumbers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItemIdentificationNumber:=TItemIdentificationNumberList.Create;
end;

destructor TItemIdentificationNumbers.Destroy;
begin
  FreeAndNil(FItemIdentificationNumber);
  inherited Destroy;
end;

{ TCustomsDeclarations }

procedure TCustomsDeclarations.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('CustomsDeclaration', 'CustomsDeclaration', [], '', -1, -1);
end;

procedure TCustomsDeclarations.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FCustomsDeclaration:=TCustomsDeclarationList.Create;
end;

destructor TCustomsDeclarations.Destroy;
begin
  FreeAndNil(FCustomsDeclaration);
  inherited Destroy;
end;

{ TOtherIssuer }

procedure TOtherIssuer.SetEmployeeBase(AValue: string);
begin
  if FEmployeeBase=AValue then Exit;
  FEmployeeBase:=AValue;
  ModifiedProperty('EmployeeBase');
end;

procedure TOtherIssuer.SetEmployeeInfo(AValue: string);
begin
  if FEmployeeInfo=AValue then Exit;
  FEmployeeInfo:=AValue;
  ModifiedProperty('EmployeeInfo');
end;

procedure TOtherIssuer.SetFirstName(AValue: string);
begin
  if FFirstName=AValue then Exit;
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TOtherIssuer.SetLastName(AValue: string);
begin
  if FLastName=AValue then Exit;
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TOtherIssuer.SetMiddleName(AValue: string);
begin
  if FMiddleName=AValue then Exit;
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TOtherIssuer.SetOrganizationBase(AValue: string);
begin
  if FOrganizationBase=AValue then Exit;
  FOrganizationBase:=AValue;
  ModifiedProperty('OrganizationBase');
end;

procedure TOtherIssuer.SetOrganizationName(AValue: string);
begin
  if FOrganizationName=AValue then Exit;
  FOrganizationName:=AValue;
  ModifiedProperty('OrganizationName');
end;

procedure TOtherIssuer.SetPosition(AValue: string);
begin
  if FPosition=AValue then Exit;
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TOtherIssuer.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Position', 'Position', [], '', 1, 1000);
  RegisterProperty('EmployeeInfo', 'EmployeeInfo', [], '', 1, 1000);
  RegisterProperty('EmployeeBase', 'EmployeeBase', [], '', 1, 1000);
  RegisterProperty('OrganizationName', 'OrganizationName', [], '', 1, 1000);
  RegisterProperty('OrganizationBase', 'OrganizationBase', [], '', 1, 1000);
  RegisterProperty('LastName', 'LastName', [], '', 1, 1000);
  RegisterProperty('FirstName', 'FirstName', [], '', 1, 1000);
  RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 1000);
end;

procedure TOtherIssuer.InternalInitChilds;
begin
  inherited InternalInitChilds;
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
  ModifiedProperty('EmployeeBase');
end;

procedure TEmployee.SetEmployeeInfo(AValue: string);
begin
  if FEmployeeInfo=AValue then Exit;
  FEmployeeInfo:=AValue;
  ModifiedProperty('EmployeeInfo');
end;

procedure TEmployee.SetFirstName(AValue: string);
begin
  if FFirstName=AValue then Exit;
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TEmployee.SetLastName(AValue: string);
begin
  if FLastName=AValue then Exit;
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TEmployee.SetMiddleName(AValue: string);
begin
  if FMiddleName=AValue then Exit;
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TEmployee.SetPosition(AValue: string);
begin
  if FPosition=AValue then Exit;
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TEmployee.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Position', 'Position', [], '', 1, 1000);
  RegisterProperty('EmployeeInfo', 'EmployeeInfo', [], '', 1, 1000);
  RegisterProperty('EmployeeBase', 'EmployeeBase', [], '', 1, 1000);
  RegisterProperty('LastName', 'LastName', [], '', 1, 1000);
  RegisterProperty('FirstName', 'FirstName', [], '', 1, 1000);
  RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 1000);
end;

procedure TEmployee.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TEmployee.Destroy;
begin
  inherited Destroy;
end;

{ TAdditionalInfoId }

procedure TAdditionalInfoId.SetAdditionalInfo(AValue: string);
begin
  if FAdditionalInfo=AValue then Exit;
  FAdditionalInfo:=AValue;
  ModifiedProperty('AdditionalInfo');
end;

procedure TAdditionalInfoId.SetInfoFileId(AValue: string);
begin
  if FInfoFileId=AValue then Exit;
  FInfoFileId:=AValue;
  ModifiedProperty('InfoFileId');
end;

procedure TAdditionalInfoId.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('AdditionalInfo', 'AdditionalInfo', [], '', 1, 1000);
  RegisterProperty('InfoFileId', 'InfoFileId', [], '', 1, 1000);
end;

procedure TAdditionalInfoId.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TAdditionalInfoId.Destroy;
begin
  inherited Destroy;
end;

{ TWaybills }

procedure TWaybills.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Waybill', 'Waybill', [], '', -1, -1);
end;

procedure TWaybills.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FWaybill:=TWaybillList.Create;
end;

destructor TWaybills.Destroy;
begin
  FreeAndNil(FWaybill);
  inherited Destroy;
end;

{ TWaybill }

procedure TWaybill.SetTransferDocumentDate(AValue: string);
begin
  if FTransferDocumentDate=AValue then Exit;
  FTransferDocumentDate:=AValue;
  ModifiedProperty('TransferDocumentDate');
end;

procedure TWaybill.SetTransferDocumentNumber(AValue: string);
begin
  if FTransferDocumentNumber=AValue then Exit;
  FTransferDocumentNumber:=AValue;
  ModifiedProperty('TransferDocumentNumber');
end;

procedure TWaybill.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('TransferDocumentNumber', 'TransferDocumentNumber', [], '', 1, 1000);
  RegisterProperty('TransferDocumentDate', 'TransferDocumentDate', [], '', 1, 1000);
end;

procedure TWaybill.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TWaybill.Destroy;
begin
  inherited Destroy;
end;

{ TTransferBases }

procedure TTransferBases.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('TransferBase', 'TransferBase', [], '', -1, -1);
end;

procedure TTransferBases.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FTransferBase:=TTransferBase820s.Create;
end;

destructor TTransferBases.Destroy;
begin
  FreeAndNil(FTransferBase);
  inherited Destroy;
end;

{ TTransferBase820 }

procedure TTransferBase820.SetBaseDocumentId(AValue: string);
begin
  if FBaseDocumentId=AValue then Exit;
  FBaseDocumentId:=AValue;
  ModifiedProperty('BaseDocumentId');
end;

procedure TTransferBase820.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('BaseDocumentId', 'BaseDocumentId', [], '', 1, 1000);
end;

procedure TTransferBase820.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TTransferBase820.Destroy;
begin
  inherited Destroy;
end;

{ TTransferBase }

procedure TTransferBase.SetBaseDocumentDate(AValue: string);
begin
  if FBaseDocumentDate=AValue then Exit;
  FBaseDocumentDate:=AValue;
  ModifiedProperty('BaseDocumentDate');
end;

procedure TTransferBase.SetBaseDocumentInfo(AValue: string);
begin
  if FBaseDocumentInfo=AValue then Exit;
  FBaseDocumentInfo:=AValue;
  ModifiedProperty('BaseDocumentInfo');
end;

procedure TTransferBase.SetBaseDocumentName(AValue: string);
begin
  if FBaseDocumentName=AValue then Exit;
  FBaseDocumentName:=AValue;
  ModifiedProperty('BaseDocumentName');
end;

procedure TTransferBase.SetBaseDocumentNumber(AValue: string);
begin
  if FBaseDocumentNumber=AValue then Exit;
  FBaseDocumentNumber:=AValue;
  ModifiedProperty('BaseDocumentNumber');
end;

procedure TTransferBase.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('BaseDocumentName', 'BaseDocumentName', [], '', 1, 1000);
  RegisterProperty('BaseDocumentNumber', 'BaseDocumentNumber', [], '', 1, 1000);
  RegisterProperty('BaseDocumentDate', 'BaseDocumentDate', [], '', 1, 1000);
  RegisterProperty('BaseDocumentInfo', 'BaseDocumentInfo', [], '', 1, 1000);
end;

procedure TTransferBase.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TTransferBase.Destroy;
begin
  inherited Destroy;
end;

{ TTransferInfo }

procedure TTransferInfo.SetCreatedThingInfo(AValue: string);
begin
  if FCreatedThingInfo=AValue then Exit;
  FCreatedThingInfo:=AValue;
  ModifiedProperty('CreatedThingInfo');
end;

procedure TTransferInfo.SetCreatedThingTransferDate(AValue: string);
begin
  if FCreatedThingTransferDate=AValue then Exit;
  FCreatedThingTransferDate:=AValue;
  ModifiedProperty('CreatedThingTransferDate');
end;

procedure TTransferInfo.SetOperationInfo(AValue: string);
begin
  if FOperationInfo=AValue then Exit;
  FOperationInfo:=AValue;
  ModifiedProperty('OperationInfo');
end;

procedure TTransferInfo.SetOperationType(AValue: string);
begin
  if FOperationType=AValue then Exit;
  FOperationType:=AValue;
  ModifiedProperty('OperationType');
end;

procedure TTransferInfo.SetTransferDate(AValue: string);
begin
  if FTransferDate=AValue then Exit;
  FTransferDate:=AValue;
  ModifiedProperty('TransferDate');
end;

procedure TTransferInfo.SetTransferEndDate(AValue: string);
begin
  if FTransferEndDate=AValue then Exit;
  FTransferEndDate:=AValue;
  ModifiedProperty('TransferEndDate');
end;

procedure TTransferInfo.SetTransferStartDate(AValue: string);
begin
  if FTransferStartDate=AValue then Exit;
  FTransferStartDate:=AValue;
  ModifiedProperty('TransferStartDate');
end;

procedure TTransferInfo.SetTransferTextInfo(AValue: string);
begin
  if FTransferTextInfo=AValue then Exit;
  FTransferTextInfo:=AValue;
  ModifiedProperty('TransferTextInfo');
end;

procedure TTransferInfo.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('TransferBases', 'TransferBases', [], '', -1, -1);
  RegisterProperty('Waybills', 'Waybills', [], '', -1, -1);
  RegisterProperty('AdditionalInfoId', 'AdditionalInfoId', [], '', -1, -1);
  RegisterProperty('Carrier', 'Carrier', [], '', -1, -1);
  RegisterProperty('Employee', 'Employee', [], '', -1, -1);
  RegisterProperty('OperationInfo', 'OperationInfo', [] , '', 1, 1000);
  RegisterProperty('OperationType', 'OperationType', [], '', 1, 1000);
  RegisterProperty('TransferDate', 'TransferDate', [], '', 1, 1000);
  RegisterProperty('TransferStartDate', 'TransferStartDate', [], '', 1, 1000);
  RegisterProperty('TransferEndDate', 'TransferEndDate', [], '', 1, 1000);
  RegisterProperty('TransferTextInfo', 'TransferTextInfo', [], '', 1, 1000);
  RegisterProperty('CreatedThingTransferDate', 'CreatedThingTransferDate', [], '', 1, 1000);
  RegisterProperty('CreatedThingInfo', 'CreatedThingInfo', [], '', 1, 1000);
end;

procedure TTransferInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FTransferBases:=TTransferBases.Create;
  FWaybills:=TWaybills.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
  FCarrier:=TExtendedOrganizationInfoWithHyphens.Create;
  FEmployee:=TEmployee.Create;
end;

destructor TTransferInfo.Destroy;
begin
  FreeAndNil(FEmployee);
  FreeAndNil(FCarrier);
  FreeAndNil(FAdditionalInfoId);
  FreeAndNil(FWaybills);
  FreeAndNil(FTransferBases);
  inherited Destroy;
end;

{ TPaymentDocuments }

procedure TPaymentDocuments.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Documents', 'Document', [], '', -1, -1);
end;

procedure TPaymentDocuments.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FDocuments:=TPaymentDocumentInfoList.Create;
end;

destructor TPaymentDocuments.Destroy;
begin
  FreeAndNil(FDocuments);
  inherited Destroy;
end;

{ TPaymentDocumentInfo }

procedure TPaymentDocumentInfo.SetDate(AValue: string);
begin
  if FDate=AValue then Exit;
  FDate:=AValue;
  ModifiedProperty('Date');
end;

procedure TPaymentDocumentInfo.SetNumber(AValue: string);
begin
  if FNumber=AValue then Exit;
  FNumber:=AValue;
  ModifiedProperty('Number');
end;

procedure TPaymentDocumentInfo.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  ModifiedProperty('Total');
end;

procedure TPaymentDocumentInfo.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Date', 'Date', [], '', 1, 1000);
  RegisterProperty('Number', 'Number', [], '', 1, 1000);
  RegisterProperty('Total', 'Total', [], '', 1, 1000);
end;

procedure TPaymentDocumentInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TPaymentDocumentInfo.Destroy;
begin
  inherited Destroy;
end;

{ TSigner }

procedure TSigner.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('SignerDetails', 'SignerDetails', [], '', -1, -1);
  RegisterProperty('SignerReference', 'SignerReference', [], '', -1, -1);
end;

procedure TSigner.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSignerDetails:=TExtendedSignerDetails_SellerTitle.Create;
  FSignerReference:=TSignerReference.Create;
end;

destructor TSigner.Destroy;
begin
  FreeAndNil(FSignerDetails);
  FreeAndNil(FSignerReference);
  inherited Destroy;
end;

{ TExtendedSignerDetails_SellerTitle }

procedure TExtendedSignerDetails_SellerTitle.SetSignerPowers(AValue: string);
begin
  if FSignerPowers=AValue then Exit;
  FSignerPowers:=AValue;
  ModifiedProperty('SignerPowers');
end;

procedure TExtendedSignerDetails_SellerTitle.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('SignerPowers', 'SignerPowers', [], '', 1, 100);
end;

procedure TExtendedSignerDetails_SellerTitle.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails_SellerTitle.Destroy;
begin
  inherited Destroy;
end;

{ TExtendedSignerDetails }

procedure TExtendedSignerDetails.SetSignerStatus(AValue: string);
begin
  if FSignerStatus=AValue then Exit;
  FSignerStatus:=AValue;
  ModifiedProperty('SignerStatus');
end;

procedure TExtendedSignerDetails.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('SignerStatus', 'SignerStatus', [], '', 1, 100);
end;

procedure TExtendedSignerDetails.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetails.Destroy;
begin
  inherited Destroy;
end;

{ TExtendedSignerDetailsBase }

procedure TExtendedSignerDetailsBase.SetFirstName(AValue: string);
begin
  if FFirstName=AValue then Exit;
  FFirstName:=AValue;
  ModifiedProperty('FirstName');
end;

procedure TExtendedSignerDetailsBase.SetInn(AValue: string);
begin
  if FInn=AValue then Exit;
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TExtendedSignerDetailsBase.SetLastName(AValue: string);
begin
  if FLastName=AValue then Exit;
  FLastName:=AValue;
  ModifiedProperty('LastName');
end;

procedure TExtendedSignerDetailsBase.SetMiddleName(AValue: string);
begin
  if FMiddleName=AValue then Exit;
  FMiddleName:=AValue;
  ModifiedProperty('MiddleName');
end;

procedure TExtendedSignerDetailsBase.SetPosition(AValue: string);
begin
  if FPosition=AValue then Exit;
  FPosition:=AValue;
  ModifiedProperty('Position');
end;

procedure TExtendedSignerDetailsBase.SetRegistrationCertificate(AValue: string);
begin
  if FRegistrationCertificate=AValue then Exit;
  FRegistrationCertificate:=AValue;
  ModifiedProperty('RegistrationCertificate');
end;

procedure TExtendedSignerDetailsBase.SetSignerInfo(AValue: string);
begin
  if FSignerInfo=AValue then Exit;
  FSignerInfo:=AValue;
  ModifiedProperty('SignerInfo');
end;

procedure TExtendedSignerDetailsBase.SetSignerOrganizationName(AValue: string);
begin
  if FSignerOrganizationName=AValue then Exit;
  FSignerOrganizationName:=AValue;
  ModifiedProperty('SignerOrganizationName');
end;

procedure TExtendedSignerDetailsBase.SetSignerOrgPowersBase(AValue: string);
begin
  if FSignerOrgPowersBase=AValue then Exit;
  FSignerOrgPowersBase:=AValue;
  ModifiedProperty('SignerOrgPowersBase');
end;

procedure TExtendedSignerDetailsBase.SetSignerPowersBase(AValue: string);
begin
  if FSignerPowersBase=AValue then Exit;
  FSignerPowersBase:=AValue;
  ModifiedProperty('SignerPowersBase');
end;

procedure TExtendedSignerDetailsBase.SetSignerType(AValue: string);
begin
  if FSignerType=AValue then Exit;
  FSignerType:=AValue;
  ModifiedProperty('SignerType');
end;

procedure TExtendedSignerDetailsBase.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('LastName', 'LastName', [], '', 1, 100);
  RegisterProperty('FirstName', 'FirstName', [], '', 1, 100);
  RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 100);
  RegisterProperty('Position', 'Position', [], '', 1, 100);
  RegisterProperty('Inn', 'Inn', [], '', 1, 100);
  RegisterProperty('RegistrationCertificate', 'RegistrationCertificate', [], '', 1, 100);
  RegisterProperty('SignerType', 'SignerType', [], '', 1, 100);
  RegisterProperty('SignerOrganizationName', 'SignerOrganizationName', [], '', 1, 100);
  RegisterProperty('SignerInfo', 'SignerInfo', [], '', 1, 100);
  RegisterProperty('SignerPowersBase', 'SignerPowersBase', [], '', 1, 100);
  RegisterProperty('SignerOrgPowersBase', 'SignerOrgPowersBase', [], '', 1, 100);
end;

procedure TExtendedSignerDetailsBase.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedSignerDetailsBase.Destroy;
begin
  inherited Destroy;
end;

{ TSignerReference }

procedure TSignerReference.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  ModifiedProperty('BoxId');
end;

procedure TSignerReference.SetCertificateBytes(AValue: string);
begin
  if FCertificateBytes=AValue then Exit;
  FCertificateBytes:=AValue;
  ModifiedProperty('CertificateBytes');
end;

procedure TSignerReference.SetCertificateThumbprint(AValue: string);
begin
  if FCertificateThumbprint=AValue then Exit;
  FCertificateThumbprint:=AValue;
  ModifiedProperty('CertificateThumbprint');
end;

procedure TSignerReference.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('BoxId', 'BoxId', [], '', 1, 1000);
  RegisterProperty('CertificateBytes', 'CertificateBytes', [], '', 1, 1000);
  RegisterProperty('CertificateThumbprint', 'CertificateThumbprint', [], '', 1, 1000);
end;

procedure TSignerReference.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TSignerReference.Destroy;
begin
  inherited Destroy;
end;

{ TSigners }

procedure TSigners.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Signer', 'Signer', [], '', -1, -1);
end;

procedure TSigners.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSigner:=TSignerList.Create;
end;

destructor TSigners.Destroy;
begin
  FreeAndNil(FSigner);
  inherited Destroy;
end;

{ TConsignees }

procedure TConsignees.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Consignee', 'Consignee', [], '', -1, -1);
end;

procedure TConsignees.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FConsignee:=TExtendedOrganizationInfoWithHyphensList.Create;
end;

destructor TConsignees.Destroy;
begin
  FreeAndNil(FConsignee);
  inherited Destroy;
end;

{ TBuyers }

procedure TBuyers.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Buyer', 'Buyer', [], '', -1, -1);
end;

procedure TBuyers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FBuyer:=TExtendedOrganizationInfoWithHyphensList.Create;
end;

destructor TBuyers.Destroy;
begin
  FreeAndNil(FBuyer);
  inherited Destroy;
end;

{ TSellers }

procedure TSellers.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Seller', 'Seller', [], '', -1, -1);
end;

procedure TSellers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSeller:=TExtendedOrganizationInfoWithHyphensList.Create;
end;

destructor TSellers.Destroy;
begin
  FreeAndNil(FSeller);
  inherited Destroy;
end;

procedure TShippers.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Shipper', 'Shipper', [], '', -1, -1);
end;

procedure TShippers.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FShipper:=TShipperList.Create;
end;

destructor TShippers.Destroy;
begin
  FreeAndNil(FShipper);
  inherited Destroy;
end;

{ TShipper }

procedure TShipper.SetSameAsSeller(AValue: string);
begin
  if FSameAsSeller=AValue then Exit;
  FSameAsSeller:=AValue;
  ModifiedProperty('SameAsSeller');
end;

procedure TShipper.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('OrganizationDetails', 'OrganizationDetails', [], '', -1, -1);
  RegisterProperty('OrganizationReference', 'OrganizationReference', [], '', -1, -1);
  RegisterProperty('SameAsSeller', 'SameAsSeller', [], '', 1, 1000);
end;

procedure TShipper.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganizationDetails:=TExtendedOrganizationDetails.Create;
  FOrganizationReference:=TExtendedOrganizationReference.Create;
end;

destructor TShipper.Destroy;
begin
  FreeAndNil(FOrganizationDetails);
  FreeAndNil(FOrganizationReference);
  inherited Destroy;
end;

{ TItemIdentificationNumber }

procedure TItemIdentificationNumber.SetPackageId(AValue: string);
begin
  if FPackageId=AValue then Exit;
  FPackageId:=AValue;
  ModifiedProperty('PackageId');
end;

procedure TItemIdentificationNumber.SetTransPackageId(AValue: string);
begin
  if FTransPackageId=AValue then Exit;
  FTransPackageId:=AValue;
  ModifiedProperty('TransPackageId');
end;

procedure TItemIdentificationNumber.SetUnt(AValue: string);
begin
  if FUnt=AValue then Exit;
  FUnt:=AValue;
  ModifiedProperty('Unt');
end;

procedure TItemIdentificationNumber.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Unt', 'Unit', [], '', 1, 1000);
  RegisterProperty('PackageId', 'PackageId', [], '', 1, 1000);
  RegisterProperty('TransPackageId', 'TransPackageId', [], '', 1, 1000);
end;

procedure TItemIdentificationNumber.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TItemIdentificationNumber.Destroy;
begin
  inherited Destroy;
end;

{ TItemTracingInfo }

procedure TItemTracingInfo.SetItemAddInfo(AValue: string);
begin
  if FItemAddInfo=AValue then Exit;
  FItemAddInfo:=AValue;
  ModifiedProperty('ItemAddInfo');
end;

procedure TItemTracingInfo.SetQuantity(AValue: string);
begin
  if FQuantity=AValue then Exit;
  FQuantity:=AValue;
  ModifiedProperty('Quantity');
end;

procedure TItemTracingInfo.SetRegNumberUnit(AValue: string);
begin
  if FRegNumberUnit=AValue then Exit;
  FRegNumberUnit:=AValue;
  ModifiedProperty('RegNumberUnit');
end;

procedure TItemTracingInfo.SetUnt(AValue: string);
begin
  if FUnt=AValue then Exit;
  FUnt:=AValue;
  ModifiedProperty('Unt');
end;

procedure TItemTracingInfo.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('RegNumberUnit', 'RegNumberUnit', [], '', 1, 1000);
  RegisterProperty('Unt', 'Unit', [], '', 1, 1000);
  RegisterProperty('Quantity', 'Quantity', [], '', 1, 1000);
  RegisterProperty('ItemAddInfo', 'ItemAddInfo', [], '', 1, 1000);
end;

procedure TItemTracingInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TItemTracingInfo.Destroy;
begin
  inherited Destroy;
end;

{ TAdditionalInfo }

procedure TAdditionalInfo.SetId(AValue: string);
begin
  if FId=AValue then Exit;
  FId:=AValue;
  ModifiedProperty('Id');
end;

procedure TAdditionalInfo.SetValue(AValue: string);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
  ModifiedProperty('Value');
end;

procedure TAdditionalInfo.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Id', 'Id', [], '', 1, 1000);
  RegisterProperty('Value', 'Value', [], '', 1, 1000);
end;

procedure TAdditionalInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TAdditionalInfo.Destroy;
begin
  inherited Destroy;
end;

{ TCustomsDeclarationWithHyphens }

procedure TCustomsDeclarationWithHyphens.SetCountry(AValue: string);
begin
  if FCountry=AValue then Exit;
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TCustomsDeclarationWithHyphens.SetDeclarationNumber(AValue: string);
begin
  if FDeclarationNumber=AValue then Exit;
  FDeclarationNumber:=AValue;
  ModifiedProperty('DeclarationNumber');
end;

procedure TCustomsDeclarationWithHyphens.SetHyphenCountry(AValue: string);
begin
  if FHyphenCountry=AValue then Exit;
  FHyphenCountry:=AValue;
  ModifiedProperty('HyphenCountry');
end;

procedure TCustomsDeclarationWithHyphens.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Country', 'Country', [], '', 1, 1000);
  RegisterProperty('HyphenCountry', 'HyphenCountry', [], '', 1, 1000);
  RegisterProperty('DeclarationNumber', 'DeclarationNumber', [], '', 1, 1000);
end;

procedure TCustomsDeclarationWithHyphens.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TCustomsDeclarationWithHyphens.Destroy;
begin
  inherited Destroy;
end;

{ TInvoiceItem }

procedure TInvoiceItem.SetAdditionalProperty(AValue: string);
begin
  if FAdditionalProperty=AValue then Exit;
  FAdditionalProperty:=AValue;
  ModifiedProperty('AdditionalProperty');
end;

procedure TInvoiceItem.SetCatalogCode(AValue: string);
begin
  if FCatalogCode=AValue then Exit;
  FCatalogCode:=AValue;
  ModifiedProperty('CatalogCode');
end;

procedure TInvoiceItem.SetExcise(AValue: string);
begin
  if FExcise=AValue then Exit;
  FExcise:=AValue;
  ModifiedProperty('Excise');
end;

procedure TInvoiceItem.SetHyphenSubtotal(AValue: string);
begin
  if FHyphenSubtotal=AValue then Exit;
  FHyphenSubtotal:=AValue;
  ModifiedProperty('HyphenSubtotal');
end;

procedure TInvoiceItem.SetHyphenUnit(AValue: string);
begin
  if FHyphenUnit=AValue then Exit;
  FHyphenUnit:=AValue;
  ModifiedProperty('HyphenUnit');
end;

procedure TInvoiceItem.SetHyphenVat(AValue: string);
begin
  if FHyphenVat=AValue then Exit;
  FHyphenVat:=AValue;
  ModifiedProperty('HyphenVat');
end;

procedure TInvoiceItem.SetItemArticle(AValue: string);
begin
  if FItemArticle=AValue then Exit;
  FItemArticle:=AValue;
  ModifiedProperty('ItemArticle');
end;

procedure TInvoiceItem.SetItemCharact(AValue: string);
begin
  if FItemCharact=AValue then Exit;
  FItemCharact:=AValue;
  ModifiedProperty('ItemCharact');
end;

procedure TInvoiceItem.SetItemKind(AValue: string);
begin
  if FItemKind=AValue then Exit;
  FItemKind:=AValue;
  ModifiedProperty('ItemKind');
end;

procedure TInvoiceItem.SetItemMark(AValue: string);
begin
  if FItemMark=AValue then Exit;
  FItemMark:=AValue;
  ModifiedProperty('ItemMark');
end;

procedure TInvoiceItem.SetItemToRelease(AValue: string);
begin
  if FItemToRelease=AValue then Exit;
  FItemToRelease:=AValue;
  ModifiedProperty('ItemToRelease');
end;

procedure TInvoiceItem.SetItemTypeCode(AValue: string);
begin
  if FItemTypeCode=AValue then Exit;
  FItemTypeCode:=AValue;
  ModifiedProperty('ItemTypeCode');
end;

procedure TInvoiceItem.SetItemVendorCode(AValue: string);
begin
  if FItemVendorCode=AValue then Exit;
  FItemVendorCode:=AValue;
  ModifiedProperty('ItemVendorCode');
end;

procedure TInvoiceItem.SetPrice(AValue: string);
begin
  if FPrice=AValue then Exit;
  FPrice:=AValue;
  ModifiedProperty('Price');
end;

procedure TInvoiceItem.SetProduct(AValue: string);
begin
  if FProduct=AValue then Exit;
  FProduct:=AValue;
  ModifiedProperty('Product');
end;

procedure TInvoiceItem.SetQuantity(AValue: string);
begin
  if FQuantity=AValue then Exit;
  FQuantity:=AValue;
  ModifiedProperty('Quantity');
end;

procedure TInvoiceItem.SetSubtotal(AValue: string);
begin
  if FSubtotal=AValue then Exit;
  FSubtotal:=AValue;
  ModifiedProperty('Subtotal');
end;

procedure TInvoiceItem.SetSubtotalWithVatExcluded(AValue: string);
begin
  if FSubtotalWithVatExcluded=AValue then Exit;
  FSubtotalWithVatExcluded:=AValue;
  ModifiedProperty('SubtotalWithVatExcluded');
end;

procedure TInvoiceItem.SetTaxRate(AValue: string);
begin
  if FTaxRate=AValue then Exit;
  FTaxRate:=AValue;
  ModifiedProperty('TaxRate');
end;

procedure TInvoiceItem.SetUnitName(AValue: string);
begin
  if FUnitName=AValue then Exit;
  FUnitName:=AValue;
  ModifiedProperty('UnitName');
end;

procedure TInvoiceItem.SetUnt(AValue: string);
begin
  if FUnt=AValue then Exit;
  FUnt:=AValue;
  ModifiedProperty('Unt');
end;

procedure TInvoiceItem.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  ModifiedProperty('Vat');
end;

procedure TInvoiceItem.SetWithoutVat(AValue: string);
begin
  if FWithoutVat=AValue then Exit;
  FWithoutVat:=AValue;
  ModifiedProperty('WithoutVat');
end;

procedure TInvoiceItem.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('CustomsDeclarations', 'CustomsDeclarations', [], '', -1, -1);
  RegisterProperty('AdditionalInfos', 'AdditionalInfos', [], '', -1, -1);
  RegisterProperty('ItemTracingInfos', 'ItemTracingInfos', [], '', -1, -1);
  RegisterProperty('ItemIdentificationNumbers', 'ItemIdentificationNumbers', [], '', -1, -1);
  RegisterProperty('Product', 'Product', [], '', 1, 1000);
  RegisterProperty('Unt', 'Unit', [], '', 1, 1000);
  RegisterProperty('HyphenUnit', 'HyphenUnit', [], '', 1, 1000);
  RegisterProperty('UnitName', 'UnitName', [], '', 1, 1000);
  RegisterProperty('Quantity', 'Quantity', [], '', 1, 1000);
  RegisterProperty('Price', 'Price', [], '', 1, 1000);
  RegisterProperty('Excise', 'Excise', [], '', 1, 1000);
  RegisterProperty('TaxRate', 'TaxRate', [], '', 1, 1000);
  RegisterProperty('SubtotalWithVatExcluded', 'SubtotalWithVatExcluded', [], '', 1, 1000);
  RegisterProperty('Vat', 'Vat', [], '', 1, 1000);
  RegisterProperty('WithoutVat', 'WithoutVat', [], '', 1, 1000);
  RegisterProperty('HyphenVat', 'HyphenVat', [], '', 1, 1000);
  RegisterProperty('Subtotal', 'Subtotal', [], '', 1, 1000);
  RegisterProperty('HyphenSubtotal', 'HyphenSubtotal', [], '', 1, 1000);
  RegisterProperty('ItemMark', 'ItemMark', [], '', 1, 1000);
  RegisterProperty('AdditionalProperty', 'AdditionalProperty', [], '', 1, 1000);
  RegisterProperty('ItemVendorCode', 'ItemVendorCode', [], '', 1, 1000);
  RegisterProperty('ItemToRelease', 'ItemToRelease', [], '', 1, 1000);
  RegisterProperty('ItemCharact', 'ItemCharact', [], '', 1, 1000);
  RegisterProperty('ItemArticle', 'ItemArticle', [], '', 1, 1000);
  RegisterProperty('ItemKind', 'ItemKind', [], '', 1, 1000);
  RegisterProperty('CatalogCode', 'CatalogCode', [], '', 1, 1000);
  RegisterProperty('ItemTypeCode', 'ItemTypeCode', [], '', 1, 1000);
end;

procedure TInvoiceItem.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FCustomsDeclarations:=TCustomsDeclarations.Create;
  FAdditionalInfos:=TAdditionalInfos.Create;
  FItemTracingInfos:=TItemTracingInfos.Create;
  FItemIdentificationNumbers:=TItemIdentificationNumbers.Create;
end;

destructor TInvoiceItem.Destroy;
begin
  FreeAndNil(FCustomsDeclarations);
  FreeAndNil(FAdditionalInfos);
  FreeAndNil(FItemTracingInfos);
  FreeAndNil(FItemIdentificationNumbers);
  inherited Destroy;
end;

{ TInvoiceTable }

procedure TInvoiceTable.SetHyphenTotal(AValue: string);
begin
  if FHyphenTotal=AValue then Exit;
  FHyphenTotal:=AValue;
  ModifiedProperty('HyphenTotal');
end;

procedure TInvoiceTable.SetHyphenVat(AValue: string);
begin
  if FHyphenVat=AValue then Exit;
  FHyphenVat:=AValue;
  ModifiedProperty('HyphenVat');
end;

procedure TInvoiceTable.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  ModifiedProperty('Total');
end;

procedure TInvoiceTable.SetTotalNet(AValue: string);
begin
  if FTotalNet=AValue then Exit;
  FTotalNet:=AValue;
  ModifiedProperty('TotalNet');
end;

procedure TInvoiceTable.SetTotalWithVatExcluded(AValue: string);
begin
  if FTotalWithVatExcluded=AValue then Exit;
  FTotalWithVatExcluded:=AValue;
  ModifiedProperty('TotalWithVatExcluded');
end;

procedure TInvoiceTable.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  ModifiedProperty('Vat');
end;

procedure TInvoiceTable.SetWithoutVat(AValue: string);
begin
  if FWithoutVat=AValue then Exit;
  FWithoutVat:=AValue;
  ModifiedProperty('WithoutVat');
end;

procedure TInvoiceTable.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Items', 'Item', [], '', -1, -1);
  RegisterProperty('TotalWithVatExcluded', 'TotalWithVatExcluded', [], '', 1, 1000);
  RegisterProperty('Vat', 'Vat', [], '', 1, 1000);
  RegisterProperty('WithoutVat', 'WithoutVat', [], '', 1, 1000);
  RegisterProperty('HyphenVat', 'HyphenVat', [], '', 1, 1000);
  RegisterProperty('Total', 'Total', [], '', 1, 1000);
  RegisterProperty('HyphenTotal', 'HyphenTotal', [], '', 1, 1000);
  RegisterProperty('TotalNet', 'TotalNet', [], '', 1, 1000);
end;

procedure TInvoiceTable.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FItems:=TInvoiceItems.Create;
end;

destructor TInvoiceTable.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

{ TExtendedOrganizationDetails }

procedure TExtendedOrganizationDetails.SetFnsParticipantId(AValue: string);
begin
  if FFnsParticipantId=AValue then Exit;
  FFnsParticipantId:=AValue;
  ModifiedProperty('FnsParticipantId');
end;

procedure TExtendedOrganizationDetails.SetInn(AValue: string);
begin
  if FInn=AValue then Exit;
  FInn:=AValue;
  ModifiedProperty('Inn');
end;

procedure TExtendedOrganizationDetails.SetKpp(AValue: string);
begin
  if FKpp=AValue then Exit;
  FKpp:=AValue;
  ModifiedProperty('Kpp');
end;

procedure TExtendedOrganizationDetails.SetOrgName(AValue: string);
begin
  if FOrgName=AValue then Exit;
  FOrgName:=AValue;
  ModifiedProperty('OrgName');
end;

procedure TExtendedOrganizationDetails.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Address', 'Address', [], '', -1, -1);
  RegisterProperty('OrgName', 'OrgName', [], '', 1, 1000);
  RegisterProperty('Inn', 'Inn', [], '', 1, 1000);
  RegisterProperty('Kpp', 'Kpp', [], '', 1, 1000);
  RegisterProperty('FnsParticipantId', 'FnsParticipantId', [], '', 1, 1000);
end;

procedure TExtendedOrganizationDetails.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FAddress:=TAddress.Create;
end;

destructor TExtendedOrganizationDetails.Destroy;
begin
  FreeAndNil(FAddress);
  inherited Destroy;
end;

{ TAddress }

procedure TAddress.SetAddressCode(AValue: string);
begin
  if FAddressCode=AValue then Exit;
  FAddressCode:=AValue;
  ModifiedProperty('Country');
end;

procedure TAddress.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('RussianAddress', 'RussianAddress', [], '', -1, -1);
  RegisterProperty('ForeignAddress', 'ForeignAddress', [], '', -1, -1);
  RegisterProperty('AddressCode', 'AddressCode', [], '', 1, 100);
end;

procedure TAddress.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FRussianAddress:=TRussianAddress.Create;
  FForeignAddress:=TForeignAddress.Create;
end;

destructor TAddress.Destroy;
begin
  FreeAndNil(FRussianAddress);
  FreeAndNil(FForeignAddress);
  inherited Destroy;
end;

{ TForeignAddress }

procedure TForeignAddress.SetAddress(AValue: string);
begin
  if FAddress=AValue then Exit;
  FAddress:=AValue;
  ModifiedProperty('Address');
end;

procedure TForeignAddress.SetCountry(AValue: string);
begin
  if FCountry=AValue then Exit;
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TForeignAddress.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Country', 'Country', [], '', 1, 1000);
  RegisterProperty('Address', 'Address', [], '', 1, 1000);
end;

procedure TForeignAddress.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TForeignAddress.Destroy;
begin
  inherited Destroy;
end;

{ TRussianAddress }

procedure TRussianAddress.SetApartment(AValue: string);
begin
  if FApartment=AValue then Exit;
  FApartment:=AValue;
  ModifiedProperty('Apartment');
end;

procedure TRussianAddress.SetBlock(AValue: string);
begin
  if FBlock=AValue then Exit;
  FBlock:=AValue;
  ModifiedProperty('Block');
end;

procedure TRussianAddress.SetBuilding(AValue: string);
begin
  if FBuilding=AValue then Exit;
  FBuilding:=AValue;
  ModifiedProperty('Building');
end;

procedure TRussianAddress.SetCity(AValue: string);
begin
  if FCity=AValue then Exit;
  FCity:=AValue;
  ModifiedProperty('City');
end;

procedure TRussianAddress.SetLocality(AValue: string);
begin
  if FLocality=AValue then Exit;
  FLocality:=AValue;
  ModifiedProperty('Locality');
end;

procedure TRussianAddress.SetRegion(AValue: string);
begin
  if FRegion=AValue then Exit;
  FRegion:=AValue;
  ModifiedProperty('Region');
end;

procedure TRussianAddress.SetStreet(AValue: string);
begin
  if FStreet=AValue then Exit;
  FStreet:=AValue;
  ModifiedProperty('Street');
end;

procedure TRussianAddress.SetTerritory(AValue: string);
begin
  if FTerritory=AValue then Exit;
  FTerritory:=AValue;
  ModifiedProperty('Territory');
end;

procedure TRussianAddress.SetZipCode(AValue: string);
begin
  if FZipCode=AValue then Exit;
  FZipCode:=AValue;
  ModifiedProperty('ZipCode');
end;

procedure TRussianAddress.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('ZipCode', 'ZipCode', [], '', 1, 1000);
  RegisterProperty('Region', 'Region', [], '', 1, 1000);
  RegisterProperty('Territory', 'Territory', [], '', 1, 1000);
  RegisterProperty('City', 'City', [], '', 1, 1000);
  RegisterProperty('Locality', 'Locality', [], '', 1, 1000);
  RegisterProperty('Street', 'Street', [], '', 1, 1000);
  RegisterProperty('Building', 'Building', [], '', 1, 1000);
  RegisterProperty('Block', 'Block', [], '', 1, 1000);
  RegisterProperty('Apartment', 'Apartment', [], '', 1, 1000);
end;

procedure TRussianAddress.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TRussianAddress.Destroy;
begin
  inherited Destroy;
end;

{ TExtendedOrganizationDetails_ManualFilling }

procedure TExtendedOrganizationDetails_ManualFilling.SetBankAccountNumber(
  AValue: String);
begin
  if FBankAccountNumber=AValue then Exit;
  FBankAccountNumber:=AValue;
  ModifiedProperty('BankAccountNumber');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetBankId(AValue: String);
begin
  if FBankId=AValue then Exit;
  FBankId:=AValue;
  ModifiedProperty('BankId');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetBankName(AValue: String
  );
begin
  if FBankName=AValue then Exit;
  FBankName:=AValue;
  ModifiedProperty('BankName');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetCorrespondentAccount(
  AValue: String);
begin
  if FCorrespondentAccount=AValue then Exit;
  FCorrespondentAccount:=AValue;
  ModifiedProperty('CorrespondentAccount');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetCountry(AValue: String);
begin
  if FCountry=AValue then Exit;
  FCountry:=AValue;
  ModifiedProperty('Country');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetDepartment(
  AValue: String);
begin
  if FDepartment=AValue then Exit;
  FDepartment:=AValue;
  ModifiedProperty('Department');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetEmail(AValue: string);
begin
  if FEmail=AValue then Exit;
  FEmail:=AValue;
  ModifiedProperty('Email');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetIndividualEntityRegistrationCertificate
  (AValue: String);
begin
  if FIndividualEntityRegistrationCertificate=AValue then Exit;
  FIndividualEntityRegistrationCertificate:=AValue;
  ModifiedProperty('IndividualEntityRegistrationCertificate');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetLegalEntityId(
  AValue: String);
begin
  if FLegalEntityId=AValue then Exit;
  FLegalEntityId:=AValue;
  ModifiedProperty('LegalEntityId');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOkdp(AValue: string);
begin
  if FOkdp=AValue then Exit;
  FOkdp:=AValue;
  ModifiedProperty('Okdp');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOkopf(AValue: string);
begin
  if FOkopf=AValue then Exit;
  FOkopf:=AValue;
  ModifiedProperty('Okopf');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOkpo(AValue: string);
begin
  if FOkpo=AValue then Exit;
  FOkpo:=AValue;
  ModifiedProperty('Okpo');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOrganizationAdditionalInfo
  (AValue: String);
begin
  if FOrganizationAdditionalInfo=AValue then Exit;
  FOrganizationAdditionalInfo:=AValue;
  ModifiedProperty('OrganizationAdditionalInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOrganizationOrPersonInfo
  (AValue: String);
begin
  if FOrganizationOrPersonInfo=AValue then Exit;
  FOrganizationOrPersonInfo:=AValue;
  ModifiedProperty('OrganizationOrPersonInfo');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetOrgType(AValue: String);
begin
  if FOrgType=AValue then Exit;
  FOrgType:=AValue;
  ModifiedProperty('OrgType');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetPhone(AValue: string);
begin
  if FPhone=AValue then Exit;
  FPhone:=AValue;
  ModifiedProperty('Phone');
end;

procedure TExtendedOrganizationDetails_ManualFilling.SetShortOrgName(
  AValue: String);
begin
  if FShortOrgName=AValue then Exit;
  FShortOrgName:=AValue;
  ModifiedProperty('ShortOrgName');
end;

procedure TExtendedOrganizationDetails_ManualFilling.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('OrgType', 'OrgType', [], '', -1, 2000);
  RegisterProperty('Okopf', 'Okopf', [], '', -1, 2000);
  RegisterProperty('Okpo', 'Okpo', [], '', -1, 2000);
  RegisterProperty('Okdp', 'Okdp', [], '', -1, 2000);
  RegisterProperty('Phone', 'Phone', [], '', -1, 2000);
  RegisterProperty('Email', 'Email', [], '', -1, 2000);
  RegisterProperty('CorrespondentAccount', 'CorrespondentAccount', [], '', -1, 2000);
  RegisterProperty('BankAccountNumber', 'BankAccountNumber', [], '', -1, 2000);
  RegisterProperty('BankName', 'BankName', [], '', -1, 2000);
  RegisterProperty('BankId', 'BankId', [], '', -1, 2000);
  RegisterProperty('Department', 'Department', [], '', -1, 2000);
  RegisterProperty('OrganizationAdditionalInfo', 'OrganizationAdditionalInfo', [], '', -1, 2000);
  RegisterProperty('OrganizationOrPersonInfo', 'OrganizationOrPersonInfo', [], '', -1, 2000);
  RegisterProperty('IndividualEntityRegistrationCertificate', 'IndividualEntityRegistrationCertificate', [], '', -1, 2000);
  RegisterProperty('LegalEntityId', 'LegalEntityId', [], '', -1, 2000);
  RegisterProperty('ShortOrgName', 'ShortOrgName', [], '', -1, 2000);
  RegisterProperty('Country', 'Country', [], '', -1, 2000);
end;

procedure TExtendedOrganizationDetails_ManualFilling.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationDetails_ManualFilling.Destroy;
begin
  inherited Destroy;
end;

{ TExtendedOrganizationReference }

procedure TExtendedOrganizationReference.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  ModifiedProperty('BoxId');
end;

procedure TExtendedOrganizationReference.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('BoxId', 'BoxId', [], '', 1, 1000);
end;

procedure TExtendedOrganizationReference.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationReference.Destroy;
begin
  inherited Destroy;
end;

{ TExtendedOrganizationDetailsWithHyphens }

procedure TExtendedOrganizationDetailsWithHyphens.SetHyphenInn(AValue: string);
begin
  if FHyphenInn=AValue then Exit;
  FHyphenInn:=AValue;
  ModifiedProperty('HyphenInn');
end;

procedure TExtendedOrganizationDetailsWithHyphens.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('HyphenInn', 'HyphenInn', [xsaRequared], '', -1, -1);
end;

procedure TExtendedOrganizationDetailsWithHyphens.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TExtendedOrganizationDetailsWithHyphens.Destroy;
begin
  inherited Destroy;
end;

{ TExtendedOrganizationInfoWithHyphens }

procedure TExtendedOrganizationInfoWithHyphens.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('OrganizationDetails', 'OrganizationDetails', [xsaRequared], '', -1, -1);
  RegisterProperty('OrganizationReference', 'OrganizationReference', [xsaRequared], '', -1, -1);
end;

procedure TExtendedOrganizationInfoWithHyphens.InternalInitChilds;
begin
  FOrganizationDetails:=TExtendedOrganizationDetailsWithHyphens.Create;
  FOrganizationReference:=TExtendedOrganizationReference.Create;
end;

destructor TExtendedOrganizationInfoWithHyphens.Destroy;
begin
  FOrganizationDetails.Free;
  FOrganizationReference.Free;
  inherited Destroy;
end;

{ TUniversalTransferDocumentWithHyphens }

procedure TUniversalTransferDocumentWithHyphens.SetFunct(AValue: string);
begin
  if FFunct=AValue then Exit;
  FFunct:=AValue;
  ModifiedProperty('Funct');
end;

procedure TUniversalTransferDocumentWithHyphens.SetGovernmentContractInfo(
  AValue: string);
begin
  if FGovernmentContractInfo=AValue then Exit;
  FGovernmentContractInfo:=AValue;
  ModifiedProperty('GovernmentContractInfo');
end;

procedure TUniversalTransferDocumentWithHyphens.SetHyphenRevisionDate(
  AValue: string);
begin
  if FHyphenRevisionDate=AValue then Exit;
  FHyphenRevisionDate:=AValue;
  ModifiedProperty('HyphenRevisionDate');
end;

procedure TUniversalTransferDocumentWithHyphens.SetHyphenRevisionNumber(
  AValue: string);
begin
  if FHyphenRevisionNumber=AValue then Exit;
  FHyphenRevisionNumber:=AValue;
  ModifiedProperty('HyphenRevisionNumber');
end;

procedure TUniversalTransferDocumentWithHyphens.SetRevisionDate(AValue: string);
begin
  if FRevisionDate=AValue then Exit;
  FRevisionDate:=AValue;
  ModifiedProperty('RevisionDate');
end;

procedure TUniversalTransferDocumentWithHyphens.SetRevisionNumber(AValue: string
  );
begin
  if FRevisionNumber=AValue then Exit;
  FRevisionNumber:=AValue;
  ModifiedProperty('RevisionNumber');
end;

procedure TUniversalTransferDocumentWithHyphens.SetCurrency(AValue: string);
begin
  if FCurrency=AValue then Exit;
  FCurrency:=AValue;
  ModifiedProperty('Currency');
end;

procedure TUniversalTransferDocumentWithHyphens.SetCircumFormatInvoice(
  AValue: string);
begin
  if FCircumFormatInvoice=AValue then Exit;
  FCircumFormatInvoice:=AValue;
  ModifiedProperty('CircumFormatInvoice');
end;

procedure TUniversalTransferDocumentWithHyphens.SetCurrencyRate(AValue: string);
begin
  if FCurrencyRate=AValue then Exit;
  FCurrencyRate:=AValue;
  ModifiedProperty('CurrencyRate');
end;

procedure TUniversalTransferDocumentWithHyphens.SetDocumentCreator(
  AValue: string);
begin
  if FDocumentCreator=AValue then Exit;
  FDocumentCreator:=AValue;
  ModifiedProperty('DocumentCreator');
end;

procedure TUniversalTransferDocumentWithHyphens.SetDocumentCreatorBase(
  AValue: string);
begin
  if FDocumentCreatorBase=AValue then Exit;
  FDocumentCreatorBase:=AValue;
  ModifiedProperty('DocumentCreatorBase');
end;

procedure TUniversalTransferDocumentWithHyphens.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  ModifiedProperty('DocumentDate');
end;

procedure TUniversalTransferDocumentWithHyphens.SetDocumentName(AValue: string);
begin
  if FDocumentName=AValue then Exit;
  FDocumentName:=AValue;
  ModifiedProperty('DocumentName');
end;

procedure TUniversalTransferDocumentWithHyphens.SetDocumentNumber(AValue: string
  );
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  ModifiedProperty('DocumentNumber');
end;

procedure TUniversalTransferDocumentWithHyphens.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  RegisterProperty('Sellers', 'Sellers', [xsaRequared], '', -1, -1);
  RegisterProperty('Buyers', 'Buyers', [xsaRequared], '', -1, -1);
  RegisterProperty('Table', 'Table', [], '', -1, -1);
  RegisterProperty('Shippers', 'Shippers', [], '', -1, -1);
  RegisterProperty('Consignees', 'Consignees', [], '', -1, -1);
  RegisterProperty('Funct', 'Function', [], '', 1, 100);
  RegisterProperty('DocumentName', 'DocumentName', [], '', 1, 1000);
  RegisterProperty('DocumentDate', 'DocumentDate', [], '', 1, 1000);
  RegisterProperty('DocumentNumber', 'DocumentNumber', [], '', 1, 1000);
  RegisterProperty('Currency', 'Currency', [], '', 1, 1000);
  RegisterProperty('CurrencyRate', 'CurrencyRate', [], '', 1, 1000);
  RegisterProperty('RevisionDate', 'RevisionDate', [], '', 1, 100);
  RegisterProperty('HyphenRevisionDate', 'HyphenRevisionDate', [], '', 1, 100);
  RegisterProperty('RevisionNumber', 'RevisionNumber', [], '', 1, 100);
  RegisterProperty('HyphenRevisionNumber', 'HyphenRevisionNumber', [], '', 1, 100);
  RegisterProperty('DocumentCreator', 'DocumentCreator', [], '', 1, 100);
  RegisterProperty('DocumentCreatorBase', 'DocumentCreatorBase', [], '', 1, 100);
  RegisterProperty('GovernmentContractInfo', 'GovernmentContractInfo', [], '', 1, 100);
  RegisterProperty('CircumFormatInvoice', 'CircumFormatInvoice', [], '', 1, 100);
  RegisterProperty('Signers', 'Signers', [], '', -1, -1);
  RegisterProperty('PaymentDocuments', 'PaymentDocuments', [], '', -1, -1);
  RegisterProperty('TransferInfo', 'TransferInfo', [], '', -1, -1);
  RegisterProperty('FactorInfo', 'FactorInfo', [], '', -1, -1);
  RegisterProperty('AdditionalInfoId', 'AdditionalInfoId', [], '', -1, -1);
end;

procedure TUniversalTransferDocumentWithHyphens.InternalInitChilds;
begin
  FSellers:=TSellers.Create;
  FBuyers:=TBuyers.Create;
  FTable:=TInvoiceTable.Create;
  FShippers:=TShippers.Create;
  FConsignees:=TConsignees.Create;
  FSigners:=TSigner.Create;
  FPaymentDocuments:=TPaymentDocuments.Create;
  FTransferInfo:=TTransferInfo.Create;
  FFactorInfo:=TExtendedOrganizationInfoWithHyphens.Create;
  FAdditionalInfoId:=TAdditionalInfoId.Create;
end;

function TUniversalTransferDocumentWithHyphens.RootNodeName: string;
begin
  Result:='UniversalTransferDocumentWithHyphens';
end;

destructor TUniversalTransferDocumentWithHyphens.Destroy;
begin
  FreeAndNil(FSigners);
  FreeAndNil(FSellers);
  FreeAndNil(FBuyers);
  FreeAndNil(FTable);
  FreeAndNil(FShippers);
  FreeAndNil(FConsignees);
  FreeAndNil(FPaymentDocuments);
  FreeAndNil(FTransferInfo);
  FreeAndNil(FFactorInfo);
  FreeAndNil(FAdditionalInfoId);
  inherited Destroy;
end;

end.

