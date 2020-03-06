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

unit DiadocAPI;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, diadoc_base, DiadocTypes, httpsend,
  protobuf_fpc,
  diadoc_consts,
  DiadocTypes_Department,
  DiadocTypes_DepartmentList,
  DiadocTypes_DepartmentToCreate,
  DiadocTypes_DepartmentToUpdate,
  DiadocTypes_AcquireCounteragent,
  DiadocTypes_Address,
  DiadocTypes_AsyncMethodResult,
  DiadocTypes_BoxList,
  DiadocTypes_CertificateInfo,
  DiadocTypes_Counteragent,
  DiadocTypes_CloudSign,
  DiadocTypes_DiadocMessage_GetApi,
  DiadocTypes_DocflowApi,
  DiadocTypes_Employee,
  DiadocTypes_Document,
  DiadocTypes_DocumentList,
  DiadocTypes_DocumentType,
  DiadocTypes_DocumentTypeDescription,
  DiadocTypes_DocumentZip,
  DiadocTypes_ExternalServiceAuthInfo,
  DiadocTypes_ExtendedSigner,
  DiadocTypes_ForwardDocumentEvent,
  DiadocTypes_ForwardingApi,
  DiadocTypes_GetOrganizationsByInnList,
  DiadocTypes_InvoiceCorrectionRequestInfo,
  DiadocTypes_InvoiceInfo,
  DiadocTypes_DiadocMessage_PostApi,
  DiadocTypes_KeyValueStorage,
  DiadocTypes_Organization,
  DiadocTypes_OrganizationUser,
  DiadocTypes_OrganizationUserPermissions,
  DiadocTypes_Recognition,
  DiadocTypes_Signer,
  DiadocTypes_SignatureInfo,
  DiadocTypes_Torg12Info,
  diadoctypes_tovtorginfo,
  DiadocTypes_UniversalTransferDocumentInfo,
  DiadocTypes_AcceptanceCertificate552Info,
  DiadocTypes_AcceptanceCertificateInfo,
  DiadocTypes_DocumentProtocol,
  DiadocTypes_DocumentsMoveOperation,
  DiadocTypes_User,
  DiadocTypes_SignatureRejectionInfo,
  DiadocTypes_RevocationRequestInfo,
  DiadocTypes_ForwardedDocument,
  DiadocTypes_Subscription,
  DiadocTypes_EmployeeToCreate,
  DiadocTypes_UserToUpdate,
  DiadocTypes_EmployeeToUpdate,
  DiadocTypes_DocumentFilter,
  DiadocTypes_Routing,
  DiadocTypes_RegistrationRequest,
  DiadocTypes_OrganizationFeatures,
  CustomPrintFormDetection,
  XsdContentType,
  LoginPassword,
  Content_v3,
  DssSign,
  DetectTitleResponse
  ;

type
  TDiadocAPI = class;
  TOnHttpStatusEnevent = procedure (Sender:TDiadocAPI; AHTTP:THTTPSend) of object;

  { TPrintFormResult }

  TPrintFormResult = class
  private
    FContentType: string;
    FFileName: string;
    FHasContent: Boolean;
    FRetryAfter: Integer;
    FStream:TMemoryStream;
    function GetStream: TMemoryStream;
  public
    constructor Create;
    destructor Destroy; override;
  public
    property RetryAfter:Integer read FRetryAfter;
    property ContentType:string read FContentType;
    property FileName:string read FFileName;
    property HasContent:Boolean read FHasContent;
    property Stream:TMemoryStream read GetStream;
  end;

  { TDiadocAPI }

  TDiadocAPI = class(TComponent)
  private
    FApiClientId: string;
    FOnHttpStatus: TOnHttpStatusEnevent;
    FPassword: string;
    FProxyData: TProxyData;
    FResultCode: integer;
    FResultString: string;
    FResultText: TStrings;
    FUserName: string;

    FAuthToken: String;
    FHTTP:THTTPSend;

    procedure SetProxyData(AValue: TProxyData);
    {$IFDEF DIADOC_DEBUG}
    procedure SaveProtobuf(AProtobufName:string);
    {$ENDIF}
    function InternalGenerateInvoiceXml(AInvoiceInfo:TSerializationObject; AInvoiceTypeStr:string; ALogString:string; ADisableValidation:boolean):TStream;
  protected
    function SendCommand(AMethod:THttpMethod; ACommand:string; AParams:string; AData:TStream):Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;

    //-------------------------------------------------
    //Авторизация
    //-------------------------------------------------
    function Authenticate:boolean;
    function AuthenticateBySert(certBytes:TStream):boolean;
    function GetExternalServiceAuthInfo(AKey:string):TExternalServiceAuthInfo;
    //void Authenticate(const Bytes_t& certBytes, bool useLocalMachineStorage = false);
    function VerifyThatUserHasAccessToAnyBox(ACertBytes:TStream):boolean;
    //void Authenticate(const std::wstring& login, const std::wstring& password);
    function GetAuthToken:string;

    function GetMyUser:TUser;
    function GetMyUserV2:TUserV2;

    function UpdateMyUser(AUserToUpdate:TUserToUpdate):TUserV2;

    function GetDepartmentByFullId(const ABoxId:string; const ADepartmentId:string):DiadocTypes_Department.TDepartment;
    function GetDepartments(const ABoxId:string; const APage:Integer = 0; const ACount:Integer = 0):DiadocTypes_DepartmentList.TDepartmentList;
    function CreateDepartment(const ABoxId:string; const ADepartmentToCreate:DiadocTypes_DepartmentToCreate.TDepartmentToCreate):DiadocTypes_Department.TDepartment;
    function UpdateDepartment(const ABoxId:string; const ADepartmentId:string; ADepartmentToUpdate:DiadocTypes_DepartmentToUpdate.TDepartmentToUpdate):DiadocTypes_Department.TDepartment;
    procedure DeleteDepartment(const ABoxId:string; const ADepartmentId:string);

    function GetEmployee(const ABoxId:string; const AUserId:string):DiadocTypes_Employee.TEmployee;
    function GetEmployees(const ABoxId:string; APage:Integer; ACount:Integer):DiadocTypes_Employee.TEmployeeList;

    function CreateEmployee(const ABoxId:string; AEmployeeToCreate:TEmployeeToCreate):DiadocTypes_Employee.TEmployee;
    function UpdateEmployee(const ABoxId:string; AUserId:string; AEmployeeToUpdate:TEmployeeToUpdate):DiadocTypes_Employee.TEmployee;
    procedure DeleteEmployee(const ABoxId:string; AUserId:string);
    //Diadoc::Api::Proto::Employees::Employee GetMyEmployee(const std::wstring& boxId);
    function GetMyEmployee(const ABoxId:string):DiadocTypes_Employee.TEmployee;

    function GetSubscriptions(const ABoxId:string; const AUserId:string):TEmployeeSubscriptions;
    function UpdateSubscriptions(const AboxId:string; const AUserId:string; const ASubscriptionsToUpdate:TSubscriptionsToUpdate):TEmployeeSubscriptions;
    function GetOrganizationUsers(AOrgId: string): TOrganizationUsersList;
    function GetBoxes:TBoxList; deprecated;
    function GetDepartment(AOrgId, ADepartmentId: string): DiadocTypes_Organization.TDepartment;
    function GetMyPermissions(AOrgId: string): TOrganizationUserPermissions;

    //SetProxyCredentials(const std::wstring& username, const std::wstring& password);
    //GetDocumentPathUrl(std::wstring boxId, std::wstring messageId, std::wstring entityId);

    function GetBoxesByInnKpp(AInn, AKpp:string):TBoxList; deprecated;
    function GetBoxInfo(ABoxId:string):TBoxInfo; deprecated;

    function PostDiadocMessage(AMsg:TMessageToPost; AOperationId:string):TMessage;
    function PostMessagePatch(APatch:TMessagePatchToPost; AOperationId:string):TMessagePatch;
    function PrepareDocumentsToSign(ARequest:TPrepareDocumentsToSignRequest):TPrepareDocumentsToSignResponse;
    function SendDraft(ARequest:TDraftToSend; AOperationId:string):TMessage;
    function RecycleDraft(ABoxId, ADraftId:string):boolean;

    function Recognize(AFileName:string; AFileContent:TStream):string;
    function GetRecognized(ARecognitionId:string):TRecognized;
    function GetLastEvent(const ABoxId:string):TBoxEvent;
    function DetectCustomPrintForms(const ABoxId:string; ARequest:TCustomPrintFormDetectionRequest):TCustomPrintFormDetectionResult;


    // WARN: [[deprecated]]
    // WARN: Use overload with DocumentTitleType parameter
    //PostExtendedSignerDetails(const std::wstring& token, const std::wstring& boxId, const std::wstring& thumbprint, bool forBuyer, bool forCorrection, const Diadoc::Api::Proto::Invoicing::Signers::ExtendedSignerDetailsToPost &signerDetails);
    //PostExtendedSignerDetails(const std::wstring& token, const std::wstring& boxId, const std::wstring& thumbprint, const Diadoc::Api::Proto::Invoicing::Signers::DocumentTitleType &documentTitleType, const Diadoc::Api::Proto::Invoicing::Signers::ExtendedSignerDetailsToPost &signerDetails);

    function SendFnsRegistrationMessage(ABoxId:string; ACertBytes:TStream):boolean;


    function GetOrganizationStorageEntries(const ABoxId:String; AKeys:TKeyValueStorageApiGetRequest):TKeyValueStorageApiGetResponse;
    function PutOrganizationStorageEntries(const ABoxId:string; AEntries:TKeyValueStorageApiPutRequest):boolean;

    function GetSignatureInfo(ABoxId, AMessageId, AEntityId:string):TSignatureInfo;

    function CloudSign(ARequest:TCloudSignRequest; ACertificateThumbprint:string):TAsyncMethodResult;
    function CloudSignResult(ATaskId:string):TCloudSignResult;
    function CloudSignConfirm(AToken, AConfirmationCode:string):TAsyncMethodResult;
    function CloudSignConfirmResult(ATaskId:string):TCloudSignConfirmResult;
    function AutoSignReceipts(ABoxId, ACertificateThumbprint, ABatchKey:string):TAsyncMethodResult;

    //Diadoc::Api::Proto::AsyncMethodResult DssSign(const std::wstring& boxId, const Diadoc::Api::Proto::Dss::DssSignRequest& request, const std::wstring& certificateThumbprint);
    function DssSign(const ABoxId:string; const ARequest:TDssSignRequest; ACertificateThumbprint:string):TAsyncMethodResult;
    //Diadoc::Api::Proto::Dss::DssSignResult DssSignResult(const std::wstring& boxId, const std::wstring& taskId);
    function DssSignResult(const ABoxId:string; const ATaskId:string):TDssSignResult;

    //function WaitAutosignReceiptsResult(const std::wstring& taskId);
    function GetDocumentsByMessageId(ABoxId, AMessageId:string):TDocumentList;
    function DetectDocumentTypes(const ABoxId, ANameOnShelf:string):TDetectDocumentTypesResponse;

    function DetectDocumentTitles(const ABoxId:string; const NameOnShelf:string):TDetectTitleResponse;
    function DetectDocumentTypes(const ABoxId:string; const AContent:TStream):TDetectDocumentTypesResponse;
    function DetectDocumentTitles(const ABoxId:string; const AContent:TStream):TDetectTitleResponse;

    function GetContent(ATypeNamedId, AFunction, AVersion:string; ATitleIndex:integer; contentType:TXsdContentType  = TitleXsd):TMemoryStream;
    function Register(const ARequest:TRegistrationRequest):TRegistrationResponse;
    procedure RegisterConfirm(const ARequest:TRegistrationConfirmRequest);



    function ParseUniversalTransferDocumentBuyerTitleXml(AXmlContent:TStream):TUniversalTransferDocumentBuyerTitleInfo; //------------Парсинг УПД
    function ParseUniversalTransferDocumentSellerTitleXml(AXmlContent:TStream; const documentVersion:string = 'utd_05_01_05'):TUniversalTransferDocumentSellerTitleInfo; //------------Парсинг СФ---------------------------
    function ParseUniversalCorrectionDocumentSellerTitleXml(AXmlContent:TStream; const documentVersion:string = 'ucd_05_01_03'):TUniversalCorrectionDocumentSellerTitleInfo;
    function ParseUniversalCorrectionDocumentBuyerTitleXml(AXmlContent:TStream):TUniversalTransferDocumentBuyerTitleInfo;
    function ParseTitleXml(const ABoxId:string; const ADocumentTypeNamedId:string; const ADocumentFunction:string; const ADocumentVersion:string; ATitleIndex:integer; const AContent:TStream):TMemoryStream;

    function ParseTorg12SellerTitleXml(AXmlContent:TStream):TTorg12SellerTitleInfo;
    function ParseTovTorg551SellerTitleXml(AXmlContent:TStream):TTovTorgSellerTitleInfo;

    function ParseTorg12BuyerTitleXml(AXmlContent:TStream):TTorg12BuyerTitleInfo;
    function GenerateTorg12XmlForSeller(ATorg12SellerInfo:TTorg12SellerTitleInfo; ADisableValidation:boolean):TStream;
    function GenerateTorg12XmlForBuyer(ATorg12BuyerInfo: TTorg12BuyerTitleInfo; ABoxId: string; ASellerTitleMessageId: string; ASellerTitleAttachmentId: string): TStream;
    function GenerateTovTorg551XmlForSeller(ATovTorgSellerInfo:TTovTorgSellerTitleInfo; ADisableValidation:boolean):TStream;
    function GenerateTovTorg551XmlForBuyer(ATovTorgBuyerInfo:TTovTorgBuyerTitleInfo; ABoxId:string; ASellerTitleMessageId:string; ASellerTitleAttachmentId:string; ADocumentVersion:string):TStream;

    function ParseTovTorg551BuyerTitleXml(AContent:TStream):TTovTorgBuyerTitleInfo;
    function ParseAcceptanceCertificate552SellerTitleXml(ASellerTitleXmlContent:TStream):TAcceptanceCertificate552SellerTitleInfo;
    function ParseAcceptanceCertificate552BuyerTitleXml(ABuyerTitleXmlContent:TStream):TAcceptanceCertificate552BuyerTitleInfo;
    //-------------------------------------------------
    //Работа с УПД
    //------------Генерация УПД
    function GenerateUniversalTransferDocumentXmlForSeller( ASellerInfo: TUniversalTransferDocumentSellerTitleInfo;
        ADisableValidation: boolean; const DocumentVersion:string { = 'utd_05_01_05'}): TMemoryStream;
    function GenerateUniversalTransferDocumentXmlForBuyer(utdBuyerInfo:TUniversalTransferDocumentBuyerTitleInfo; ABoxId:string; ASellerTitleMessageId:string; ASellerTitleAttachmentId:string):TStream;
    function GenerateTitleXml(const ABoxId:string; const ADocumentTypeNamedId:string; const ADocumentFunction:string;
        const ADocumentVersion:string; ATitleIndex:Integer; const AUserContractData: TStream;
        const AEditingSettingId:string = ''; ADisableValidation:boolean = false; const ALetterId:string = '';
        const ADocumentId:string = ''): TMemoryStream;

    function GenerateUniversalCorrectionDocumentXmlForSeller(AUtdSellerInfo:TUniversalCorrectionDocumentSellerTitleInfo;
        ADisableValidation:Boolean; const documentVersion:string = 'ucd_05_01_03'):TMemoryStream;
    function GenerateRecipientTitleXml(ABoxId, ASenderTitleMessageId, ASenderTitleAttachmentId:string; AUserContractData:TStream; ADocumentVersion:string):TStream;
    function GenerateSenderTitleXml(ABoxId, ADocumentTypeNamedId, ADocumentFunction, ADocumentVersion:string;  AUserContractData:TStream;  AEditingSettingId:string; ADisableValidation:boolean):TMemoryStream;

    //ExtendedSignerDetails
    //-------------------------------------------------
    //Работа с документами
    //-------------------------------------------------
    function Delete(ABoxId:string; AMessageId:string; ADocumentId:string):boolean;
    function ForwardDocument(ABoxId: string; ARequest: TForwardDocumentRequest): TForwardDocumentResponse;
    function GenerateAcceptanceCertificateXmlForBuyer(AAcceptanceCertificateBuyerInfo:TAcceptanceCertificateBuyerTitleInfo; ABoxId, ASellerTitleMessageId, ASellerTitleAttachmentId:string):TStream;
    function GenerateAcceptanceCertificateXmlForSeller(AAcceptanceCertificateSellerInfo:TAcceptanceCertificateSellerTitleInfo; ADisableValidation:Boolean):TStream;
    function GenerateAcceptanceCertificate552XmlForSeller(AAcceptanceCertificateSellerInfo:TAcceptanceCertificate552SellerTitleInfo; ADisableValidation:Boolean):TStream;
    function GenerateAcceptanceCertificate552XmlForBuyer(AAcceptanceCertificateBuyerInfo:TAcceptanceCertificate552BuyerTitleInfo; ABoxId, ASellerTitleMessageId, ASellerTitleAttachmentId:string):TStream;
    function GenerateDocumentProtocol(ABoxId, AmessageId, ADocumentId:string):TDocumentProtocol;

    function GenerateForwardedDocumentProtocol(ABoxId:string; AForwardedDocumentId:TForwardedDocumentId):TDocumentProtocol;
    function GenerateDocumentZip(ABoxId, AMessageId, ADocumentId: string; AFullDocflow: boolean): TDocumentZipGenerationResult;

    function GenerateReceiptXml(const ABoxId:string; const AMessageId:string; const AAttachmentId:string; const ASigner:TSigner):TStream;
    function GenerateDocumentReceiptXml(ABoxId, AMessageId, AAttachmentId:string; ASigner:TSigner):TStream;
    function GeneratePrintForm(ABoxId, AMessageId, ADocumentId:string):TPrintFormResult;
    //GeneratePrintFormFromAttachment
    function GenerateRevocationRequestXml(ABoxId, AMessageId, AAttachmentId:string; ARevocationRequestInfo:TRevocationRequestInfo):TStream;
    function GenerateSignatureRejectionXml(ABoxId, AMessageId, AAttachmentId:string; ASignatureRejectionInfo:TSignatureRejectionInfo):TStream;
    function GetForwardedDocumentEvents(ABoxId:string; ARequest:TGetForwardedDocumentEventsRequest):TGetForwardedDocumentEventsResponse;
    //GenerateForwardedDocumentPrintForm
    function GetForwardedEntityContent(ABoxId:string; AForwardedDocumentId:TForwardedDocumentId; AEntityId:string):TStream;
    function GetForwardedDocuments(ABoxId:string; ARequest:TGetForwardedDocumentsRequest):TGetForwardedDocumentsResponse;
    function GetGeneratedPrintForm(APrintFormId:string):TStream;
    function MoveDocuments(AOperation:TDocumentsMoveOperation):Boolean;
    function ParseAcceptanceCertificateSellerTitleXml(ASellerTitleXmlContent:TStream):TAcceptanceCertificateSellerTitleInfo;
    function ParseAcceptanceCertificateBuyerTitleXml(ABuyerTitleXmlContent:TStream):TAcceptanceCertificateBuyerTitleInfo;
    function ParseRevocationRequestXml(AXmlContent:TStream):TRevocationRequestInfo;
    function ParseSignatureRejectionXml(AXmlContent:TStream):TSignatureRejectionInfo;
    function Restore(ABoxId, AMessageId, ADocumentId:string):boolean;
    function ShelfDownload(ANameOnShelf:string):TStream;
    //function ShelfUpload:boolean;

    //-------------------------------------------------
    //Работа со счетами-фактурами
    //------------Генерация СФ-------------------------
    function CanSendInvoice(ABoxId: string; ACertBytes: TStream): boolean;
    function GetInvoiceCorrectionRequestInfo(ABoxId:string; AMessageId:string; AEntityId:string):TInvoiceCorrectionRequestInfo;
    function GenerateInvoiceXml(AInvoiceInfo:TInvoiceInfo; ADisableValidation:boolean):TStream;
    function GenerateInvoiceRevisionXml(AInvoiceRevisionInfo:TInvoiceInfo; ADisableValidation:boolean):TStream;
    function GenerateInvoiceCorrectionXml(AInvoiceCorrectionInfo:TInvoiceCorrectionInfo; ADisableValidation:boolean):TStream;
    function GenerateInvoiceCorrectionRevisionXml(AInvoiceCorrectionRevisionInfo:TInvoiceCorrectionInfo; ADisableValidation:boolean):TStream;
    function ParseInvoiceXml(AXmlContent:TStream):TInvoiceInfo;
    function GenerateInvoiceDocumentReceiptXml(ABoxId, AMessageId, AAttachmentId:string; ASigner:TSigner):TStream;
    function GenerateInvoiceCorrectionRequestXml(ABoxId, AMessageId, AAttachmentId:string; ACorrectionInfo:TInvoiceCorrectionRequestInfo):TStream;
    //------------Отправка СФ--------------------------
    //ExtendedSignerDetails
    function GetExtendedSignerDetails(AToken, ABoxId, AThumbprint: string;
      AForBuyer, AForCorrection: boolean): TExtendedSignerDetails;

    //-------------------------------------------------
    //Работа с сообщениями
    //-------------------------------------------------
    function GetEntityContent(ABoxID, AMessageId, AEntityId: string): TMemoryStream;
    function GetMessage(ABoxID: string; AmessageId: string; AEntityId: string; AOriginalSignature, AInjectEntityContent: boolean): TMessage;

    //GetDiadocMessage(const std::wstring& boxId, const std::wstring& messageId, bool withOriginalSignature = false, bool injectEntityContent = false);
    //GetDiadocMessage(const std::wstring& boxId, const std::wstring& messageId, const std::wstring& entityId, bool withOriginalSignature = false, bool injectEntityContent = false);

    //-------------------------------------------------
    //Работа с событиями
    //-------------------------------------------------
    function GetEvent(ABoxId, AEventId: string): TBoxEvent;
    function GetNewEvents(ABoxId, AAfterEventId: string):TBoxEventList;

    //-------------------------------------------------
    //Работа с организациями
    //-------------------------------------------------
    function GetOrganizationsByInnList(AOrgID:string; ARequest:TGetOrganizationsByInnListRequest):TGetOrganizationsByInnListResponse;
    function GetOrganizationsByInnKpp(AINN: string; AKPP: string='';
      AIncludeRelations: boolean=false): TOrganizationList;

    function GetOrganization(const  AOrgId, AFNSParticipantId, AINN : string):TOrganization;
    function GetOrganizationById(const AOrgId : string):TOrganization;
    function GetOrganizationByInn(const AINN : string):TOrganization;
    function GetOrganizationByFnsParticipantId(const AFNSParticipantId : string):TOrganization;
    function ParseRussianAddress(AAddress:string):TRussianAddress;

    function GetMyOrganizations(autoRegister:boolean = false):TOrganizationList;
    function GetOrganizationFeatures(const ABoxId:string):TOrganizationFeatures;
    function GetBox(const ABoxId:string):TBox;
    function GetDocumentTypes(const ABoxId:string):TGetDocumentTypesResponse;

    //$GetDocuments(const std::wstring& boxId, const std::wstring& filterCategory, const std::wstring& counteragentBoxId, __int64* timestampFrom, __int64* timestampTo, const std::wstring& fromDocumentDate, const std::wstring& toDocumentDate, const std::wstring& departmentId, bool excludeSubdepartments, const std::string& afterIndexKey, int* count = NULL);
    //$GetDocuments(const std::wstring& boxId, const std::wstring& filterCategory, const std::wstring& counteragentBoxId, __int64* timestampFrom, __int64* timestampTo, const std::wstring& fromDocumentDate, const std::wstring& toDocumentDate, const std::wstring& departmentId, bool excludeSubdepartments, const std::string& afterIndexKey, int* count = NULL);
    //$GetDocuments(const DocumentFilter& documentFilter);
    function GetDocuments(ABoxId: string; ADocumentType: TDocumentTypeFilter; ADocumentClass: TDocumentFilterClass; ADocumentStatus: TDocumentFilterStatus; ADepartmentId: string; ACounteragentBoxId: string; AFromDocumentDate: string; AToDocumentDate: string; AAfterIndexKey: string): TDocumentList; overload;
    function GetDocuments(ADocumentFilter:TDocumentFilter): TDocumentList; overload;

    function GetDocument(AboxId, AMessageId, AEntityId:string):TDocument;
    //-------------------------------------------------
    //Работа с контрагентами
    //-------------------------------------------------
    function AcquireCounteragent(AMyOrgId:string; AMyDepartmentId:string; ARequest:TAcquireCounteragentRequest):TAsyncMethodResult;
    function AcquireCounteragentResult(ATaskId:string):TAcquireCounteragentResult;
    procedure BreakWithCounteragent;
    function GetCounteragent(AMyOrgId, ACounteragentOrgId: string): TCounteragent;
    function GetCounteragents(myOrgId: string; AReqestCounteragentStatus: TReqestCounteragentStatus; afterIndexKey: string=''): TCounteragentList;
    function GetCounteragentCertificates(AMyOrgId, ACounteragentOrgId: string): TCounteragentCertificateList;

    function GetDocflows(ABoxId: string; ARequest: TGetDocflowBatchRequest): TGetDocflowBatchResponse;
    procedure GetDocflowsByPacketId;
    procedure SearchDocflows;
    procedure GetDocflowEvents;

    //-------------------------------------------------
    //Работа с шаблонами
    //-------------------------------------------------
    function GetTemplate(ABoxId, ATemplateId, AEntityId:string):TTemplate;
    function PostTemplate(ATemplateToPost:TTemplateToPost; AOperationId:string):TTemplate;
    function PostTemplatePatch(const ABoxId:string; const ATemplateId:string; const APatch:TTemplatePatchToPost; const AOperationId:string = ''):TMessagePatch;
    function TransformTemplateToMessage(ATemplateTransformationToPost:TTemplateTransformationToPost; AOperationId:string):TMessage;


    //Сервисные методы и свойства
    property AuthToken: String read FAuthToken;
    property ResultText:TStrings read FResultText;
    property ResultCode : integer read FResultCode;
    property ResultString : string read FResultString;
  published
    property ProxyData:TProxyData read FProxyData write SetProxyData;
    property UserName:string read FUserName write FUserName;
    property Password:string read FPassword write FPassword;
    property ApiClientId:string read FApiClientId write FApiClientId;
    property OnHttpStatus:TOnHttpStatusEnevent read FOnHttpStatus write FOnHttpStatus;
  end;

procedure Register;

function FindEntitie(AMessage: TMessage; AType:TAttachmentType):TEntity;
implementation
uses synautil, synacode, XMLRead;

{$R diadoc-fpc.res}

procedure Register;
begin
  RegisterComponents('Diadoc',[TDiadocAPI]);
end;

function CreateUtdDocumentTitleType(AForBuyer, AForCorrection:Boolean):TDocumentTitleType;
begin
  if AForBuyer then
  begin
    if AForCorrection then
      Result:=UcdBuyer
    else
      Result:=UtdBuyer
  end
  else
  begin
    if AForCorrection then
      Result:=UcdSeller
    else
      Result:=UtdSeller;
  end;
end;


function FindEntitie(AMessage: TMessage; AType:TAttachmentType):TEntity;
var
  E: TEntity;
begin
  Result:=nil;
  for E in AMessage.Entities do
  begin
    if E.AttachmentType = AType then
      Exit(E);
  end;
end;

function FindHeaderValue(AHeders:TStrings; AName:string):string;
var
  S, S1: String;
  P: SizeInt;
begin
  Result:='';
  AName:=UpperCase(AName);
  for S in AHeders do
  begin
    P:=Pos(':', S);
    if P>0 then
    begin
      S1:=UpperCase(Trim(Copy(S, 1, P-1)));
      if S1=AName then
        Exit(Trim(Copy(S, P+1, Length(S))));
    end;
  end;
end;

{ TPrintFormResult }

function TPrintFormResult.GetStream: TMemoryStream;
begin
  if not Assigned(FStream) then
    FStream:=TMemoryStream.Create;
  Result:=FStream;
end;

constructor TPrintFormResult.Create;
begin

end;

destructor TPrintFormResult.Destroy;
begin
  if Assigned(FStream) then
    FreeAndNil(FStream);
  inherited Destroy;
end;

{ TDiadocAPI }

procedure TDiadocAPI.SetProxyData(AValue: TProxyData);
begin
  FProxyData.Assign(AValue);
end;

{$IFDEF DIADOC_DEBUG}
procedure TDiadocAPI.SaveProtobuf(AProtobufName: string);
var
  S: String;
  F: TFileStream;
  P: Int64;
begin
  if ExtractFileExt(AProtobufName) = '' then
    AProtobufName := AProtobufName + '.protobuf';
  S:=GetTempDir(false) + PathDelim + AProtobufName;
  F:=TFileStream.Create(S, fmCreate);
  P:=FHTTP.Document.Position;
  FHTTP.Document.Position:=0;
  FHTTP.Document.SaveToStream(F);
  F.Free;
  FHTTP.Document.Position:=P;
end;
{$ENDIF}

function TDiadocAPI.Authenticate: boolean;
var
  S: String;
begin
  if FAuthToken <> '' then Exit(True);
  //WppTraceDebugOut(L"Authenticating by login/password pair...");

  Result:=false;
  S:='';
  AddURLParam(S, 'login', FUserName);
  AddURLParam(S, 'password', FPassword);

  if SendCommand(hmPOST, '/V2/Authenticate', S, nil) then
  begin
    FHTTP.Document.Position:=0;
    FAuthToken:=ReadStrFromStream(FHTTP.Document, FHTTP.Document.Size);
    Result:=true;
  end;
end;

function TDiadocAPI.AuthenticateBySert(certBytes: TStream): boolean;
begin
  raise ENotImplemented.Create(sNotImplemented);
  (*
  WppTraceDebugOut(L"Authenticating by certBytes...");
  auto response = PerformHttpRequest(L"/V2/Authenticate", certBytes, POST);
  CertSystemStore store(useLocalMachineStorage);
  auto decryptedToken = store.Decrypt(response);

  std::wstringstream wss;
  wss << L"/V2/AuthenticateConfirm?token=" << StringHelper::CanonicalizeUrl(CryptHelper::ToBase64(decryptedToken)) << std::flush;
  auto confirmResponse = PerformHttpRequestString(wss.str(), certBytes, POST);
  token_ = StringHelper::Utf8ToUtf16(confirmResponse);
  *)
end;

function TDiadocAPI.GetExternalServiceAuthInfo(AKey: string
  ): TExternalServiceAuthInfo;
var
  S: String;
begin
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'key', AKey);
  if SendCommand(hmPOST, 'GetExternalServiceAuthInfo', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetExternalServiceAuthInfo');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TExternalServiceAuthInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.VerifyThatUserHasAccessToAnyBox(ACertBytes: TStream
  ): boolean;
var
  S: String;
begin
  (*
  void DiadocApi::VerifyThatUserHasAccessToAnyBox(const Bytes_t& certBytes)
  {
  	WppTraceDebugOut(L"Verifing that user has access to any box...");
  	auto response = PerformHttpRequest(L"/VerifyThatUserHasAccessToAnyBox", certBytes, POST);
  }
  *)
  Result:=false;
  if not Authenticate then exit;
  S:='';
  if SendCommand(hmPOST, 'VerifyThatUserHasAccessToAnyBox', S, ACertBytes) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('VerifyThatUserHasAccessToAnyBox');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    Result:=FHTTP.ResultCode = 200;
    if Result then
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetAuthToken: string;
begin
  Result:=AuthToken;
end;

function TDiadocAPI.GetMyUserV2: TUserV2;
var
  S: String;
begin
//Diadoc::Api::Proto::UserV2 DiadocApi::GetMyUserV2()
//{
//	WppTraceDebugOut("GetMyUserV2...");
//	return FromProtoBytes<Diadoc::Api::Proto::UserV2>(PerformHttpRequest(L"/V2/GetMyUser", GET));
//}
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  if SendCommand(hmGET, '/V2/GetMyUser', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetMyUser_V2');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TUserV2.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.UpdateMyUser(AUserToUpdate: TUserToUpdate): TUserV2;
var
  F: TStream;
begin
  //Diadoc::Api::Proto::UserV2 DiadocApi::UpdateMyUser(Diadoc::Api::Proto::Users::UserToUpdate& userToUpdate)
  //{
  //	WppTraceDebugOut("UpdateMyUser...");
  //	return FromProtoBytes<Diadoc::Api::Proto::UserV2>(PerformHttpRequest(L"/UpdateMyUser", ToProtoBytes(userToUpdate), POST));
  //}
  Result:=nil;
  if not Authenticate then exit;
  F:=AUserToUpdate.SaveToStream;
  if SendCommand(hmPOST, '/UpdateMyUser', '', F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('UpdateMyUser');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TUserV2.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GetDepartmentByFullId(const ABoxId: string;
  const ADepartmentId: string): DiadocTypes_Department.TDepartment;
var
  S: String;
begin
  //Diadoc::Api::Proto::Departments::Department DiadocApi::GetDepartmentByFullId(const std::wstring& boxId, const std::wstring& departmentId)
  //{
  //	WppTraceDebugOut("GetDepartmentByFullId...");
  //	std::wstringstream buf;
  //	buf << L"/admin/GetDepartment?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  //		<< L"&departmentId=" << StringHelper::CanonicalizeUrl(departmentId);
  //	return FromProtoBytes<Diadoc::Api::Proto::Departments::Department>(PerformHttpRequest(buf.str(), GET));
  //}
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if ADepartmentId = '' then
    raise EDiadocException.Create(sNotDefinedDepartmentId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'departmentId', ADepartmentId);

  if SendCommand(hmGET, '/admin/GetDepartment', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetDepartment');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=DiadocTypes_Department.TDepartment.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetDepartments(const ABoxId: string; const APage: Integer;
  const ACount: Integer): DiadocTypes_DepartmentList.TDepartmentList;
var
  S: String;
begin
  //Diadoc::Api::Proto::Departments::DepartmentList DiadocApi::GetDepartments(const std::wstring& boxId, int* page, int* count)
  //{
  //	WppTraceDebugOut("GetDepartments...");
  //	std::wstringstream buf;
  //	buf << L"/admin/GetDepartments?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //	if (page != NULL) {
  //		buf << L"&page=" << *page;
  //	}
  //	if (count != NULL) {
  //		buf << L"&count=" << *count;
  //	}
  //	return FromProtoBytes<Diadoc::Api::Proto::Departments::DepartmentList>(PerformHttpRequest(buf.str(), GET));
  //}

  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  if APage > 0 then
    AddURLParam(S, 'page', IntToStr(APage));
  if ACount > 0 then
    AddURLParam(S, 'count', IntToStr(ACount));

  if SendCommand(hmGET, '/admin/GetDepartments', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetDepartments');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=DiadocTypes_DepartmentList.TDepartmentList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.CreateDepartment(const ABoxId: string;
  const ADepartmentToCreate: DiadocTypes_DepartmentToCreate.TDepartmentToCreate
  ): DiadocTypes_Department.TDepartment;
var
  S: String;
  F: TStream;
begin
  //Diadoc::Api::Proto::Departments::Department DiadocApi::CreateDepartment(const std::wstring& boxId, const Diadoc::Api::Proto::Departments::DepartmentToCreate& departmentToCreate)
  //{
  //	WppTraceDebugOut("CreateDepartment...");
  //	std::wstringstream buf;
  //	buf << L"/admin/CreateDepartment?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //	return FromProtoBytes<Diadoc::Api::Proto::Departments::Department>(PerformHttpRequest(buf.str(), ToProtoBytes(departmentToCreate), POST));
  //}

  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  F:=ADepartmentToCreate.SaveToStream;

  if SendCommand(hmPOST, '/admin/CreateDepartment', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('CreateDepartment');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=DiadocTypes_Department.TDepartment.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.UpdateDepartment(const ABoxId: string;
  const ADepartmentId: string;
  ADepartmentToUpdate: DiadocTypes_DepartmentToUpdate.TDepartmentToUpdate
  ): DiadocTypes_Department.TDepartment;
var
  S: String;
  F: TStream;
begin
  //Diadoc::Api::Proto::Departments::Department DiadocApi::UpdateDepartment(const std::wstring& boxId, const std::wstring& departmentId, Diadoc::Api::Proto::Departments::DepartmentToUpdate& departmentToUpdate)
  //{
  //	WppTraceDebugOut("UpdateDepartment...");
  //	std::wstringstream buf;
  //	buf << L"/admin/UpdateDepartment?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  //		<< L"&departmentId=" << StringHelper::CanonicalizeUrl(departmentId);
  //	return FromProtoBytes<Diadoc::Api::Proto::Departments::Department>(PerformHttpRequest(buf.str(), ToProtoBytes(departmentToUpdate), POST));
  //}

  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if ADepartmentId = '' then
    raise EDiadocException.Create(sNotDefinedDepartmentId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'departmentId', ADepartmentId);
  F:=ADepartmentToUpdate.SaveToStream;

  if SendCommand(hmPOST, '/admin/UpdateDepartment', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('CreateDepartment');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=DiadocTypes_Department.TDepartment.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

procedure TDiadocAPI.DeleteDepartment(const ABoxId: string;
  const ADepartmentId: string);
var
  S: String;
begin
  //void DiadocApi::DeleteDepartment(const std::wstring& boxId, const std::wstring& departmentId)
  //{
  //	WppTraceDebugOut("DeleteDepartment...");
  //	std::wstringstream buf;
  //	buf << L"/admin/DeleteDepartment?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  //		<< L"&departmentId=" << StringHelper::CanonicalizeUrl(departmentId);
  //	PerformHttpRequest(buf.str(), POST);
  //}

  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if ADepartmentId = '' then
    raise EDiadocException.Create(sNotDefinedDepartmentId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'departmentId', ADepartmentId);

  if SendCommand(hmPOST, '/admin/DeleteDepartment', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('DeleteDepartment');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetEmployee(const ABoxId: string; const AUserId: string
  ): DiadocTypes_Employee.TEmployee;
var
  S: String;
begin
  //Diadoc::Api::Proto::Employees::Employee DiadocApi::GetEmployee(const std::wstring& boxId, const std::wstring& userId)
  //{
  //	WppTraceDebugOut("GetEmployee...");
  //	std::wstringstream buf;
  //	buf << L"/GetEmployee?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  //		<< L"/&userId=" << StringHelper::CanonicalizeUrl(userId);
  //	return FromProtoBytes<Diadoc::Api::Proto::Employees::Employee>(PerformHttpRequest(buf.str(), GET));
  //}
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AuserId = '' then
    raise EDiadocException.Create(sNotDefinedUserId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'userId', AuserId);

  if SendCommand(hmGET, '/GetEmployee', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetEmployee');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=DiadocTypes_Employee.TEmployee.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetEmployees(const ABoxId: string; APage: Integer;
  ACount: Integer): DiadocTypes_Employee.TEmployeeList;
var
  S: String;
begin
  //Diadoc::Api::Proto::Employees::EmployeeList DiadocApi::GetEmployees(const std::wstring& boxId, int* page, int* count)
  //{
  //	WppTraceDebugOut("GetEmployees...");
  //	std::wstringstream buf;
  //	buf << L"/GetEmployees?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //	if (page != NULL) {
  //		buf << L"&page=" << *page;
  //	}
  //	if (count != NULL) {
  //		buf << L"&count=" << *count;
  //	}
  //	return FromProtoBytes<Diadoc::Api::Proto::Employees::EmployeeList>(PerformHttpRequest(buf.str(), GET));
  //}
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  if APage > 0 then
    AddURLParam(S, 'page', IntToStr(APage));
  if ACount > 0 then
    AddURLParam(S, 'count', IntToStr(ACount));

  if SendCommand(hmGET, '/GetEmployees', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetEmployees');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=DiadocTypes_Employee.TEmployeeList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.CreateEmployee(const ABoxId: string;
  AEmployeeToCreate: TEmployeeToCreate): DiadocTypes_Employee.TEmployee;
var
  F: TStream;
  S: String;
begin
  //Diadoc::Api::Proto::Employees::Employee DiadocApi::CreateEmployee(const std::wstring& boxId, const Diadoc::Api::Proto::Employees::EmployeeToCreate& employeeToCreate)
  //{
  //	WppTraceDebugOut("CreateEmployee...");
  //	std::wstringstream buf;
  //	buf << L"/CreateEmployee?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //	return FromProtoBytes<Diadoc::Api::Proto::Employees::Employee>(PerformHttpRequest(buf.str(), ToProtoBytes(employeeToCreate), POST));
  //}
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  F:=AEmployeeToCreate.SaveToStream;

  if SendCommand(hmPOST, '/CreateEmployee', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('CreateEmployee');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=DiadocTypes_Employee.TEmployee.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.UpdateEmployee(const ABoxId: string; AUserId: string;
  AEmployeeToUpdate: TEmployeeToUpdate): DiadocTypes_Employee.TEmployee;
var
  S: String;
  F: TStream;
begin
  (*

  Diadoc::Api::Proto::Employees::Employee DiadocApi::UpdateEmployee(const std::wstring& boxId, const std::wstring& userId, const Diadoc::Api::Proto::Employees::EmployeeToUpdate& employeeToUpdate)
  {
  	WppTraceDebugOut("UpdateEmployee...");
  	std::wstringstream buf;
  	buf << L"/UpdateEmployee?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  		<< L"&userId=" << StringHelper::CanonicalizeUrl(userId);
  	return FromProtoBytes<Diadoc::Api::Proto::Employees::Employee>(PerformHttpRequest(buf.str(), ToProtoBytes(employeeToUpdate), POST));
  }

  *)
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AUserId = '' then
    raise EDiadocException.Create(sNotDefinedUserId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'userId', AUserId);
  F:=AEmployeeToUpdate.SaveToStream;

  if SendCommand(hmPOST, '/UpdateEmployee', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('UpdateEmployee');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=DiadocTypes_Employee.TEmployee.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

procedure TDiadocAPI.DeleteEmployee(const ABoxId: string; AUserId: string);
var
  S: String;
begin
  (*
  void DiadocApi::DeleteEmployee(const std::wstring& boxId, const std::wstring& userId)
  {
  	WppTraceDebugOut("DeleteEmployee...");
  	std::wstringstream buf;
  	buf << L"/DeleteEmployee?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  		<< L"&userId=" << StringHelper::CanonicalizeUrl(userId);
  	PerformHttpRequest(buf.str(), POST);
  }

  *)
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AUserId = '' then
    raise EDiadocException.Create(sNotDefinedUserId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'userId', AUserId);

  if SendCommand(hmPOST, '/DeleteEmployee', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('DeleteEmployee');
    {$ENDIF}
  end;
end;

function TDiadocAPI.GetMyEmployee(const ABoxId: string
  ): DiadocTypes_Employee.TEmployee;
var
  S: String;
begin
  (*
  iadoc::Api::Proto::Employees::Employee DiadocApi::GetMyEmployee(const std::wstring& boxId)
  {
  	WppTraceDebugOut("GetMyEmployee...");
  	std::wstringstream buf;
  	buf << L"/GetMyEmployee?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  	return FromProtoBytes<Diadoc::Api::Proto::Employees::Employee>(PerformHttpRequest(buf.str(), GET));
  }
  *)
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  if SendCommand(hmPOST, '/GetMyEmployee', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetMyEmployee');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=DiadocTypes_Employee.TEmployee.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetSubscriptions(const ABoxId: string; const AUserId: string
  ): TEmployeeSubscriptions;
var
  S: String;
begin
  (*
  Diadoc::Api::Proto::Employees::Subscriptions::EmployeeSubscriptions DiadocApi::GetSubscriptions(const std::wstring& boxId, const std::wstring& userId)
  {
  	WppTraceDebugOut("GetSubscriptions...");
  	std::wstringstream buf;
  	buf << L"/GetSubscriptions?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  		<< L"&userId=" << StringHelper::CanonicalizeUrl(userId);
  	return FromProtoBytes<Diadoc::Api::Proto::Employees::Subscriptions::EmployeeSubscriptions>(PerformHttpRequest(buf.str(), GET));
  }
  *)
  Result:=nil;

  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AuserId = '' then
    raise EDiadocException.Create(sNotDefinedUserId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'userId', AuserId);

  if SendCommand(hmGET, '/GetSubscriptions', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetSubscriptions');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TEmployeeSubscriptions.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.UpdateSubscriptions(const AboxId: string;
  const AUserId: string; const ASubscriptionsToUpdate: TSubscriptionsToUpdate
  ): TEmployeeSubscriptions;
var
  F: TStream;
  S: String;
begin
  (*
  Diadoc::Api::Proto::Employees::Subscriptions::EmployeeSubscriptions DiadocApi::UpdateSubscriptions(const std::wstring& boxId, const std::wstring& userId, const Diadoc::Api::Proto::Employees::Subscriptions::SubscriptionsToUpdate& subscriptionsToUpdate)
  {
  	WppTraceDebugOut("UpdateSubscriptions...");
  	std::wstringstream buf;
  	buf << L"/UpdateSubscriptions?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  		<< L"&userId=" << StringHelper::CanonicalizeUrl(userId);
  	return FromProtoBytes<Diadoc::Api::Proto::Employees::Subscriptions::EmployeeSubscriptions>(PerformHttpRequest(buf.str(), ToProtoBytes(subscriptionsToUpdate), POST));
  }
  *)
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AuserId = '' then
    raise EDiadocException.Create(sNotDefinedUserId);
  if not Authenticate then exit;

  F:=ASubscriptionsToUpdate.SaveToStream;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'userId', AuserId);
  if SendCommand(hmPOST, 'UpdateSubscriptions', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('UpdateSubscriptions');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TEmployeeSubscriptions.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.CanSendInvoice(ABoxId:string; ACertBytes:TStream): boolean;
var
  S: String;
begin
  Result:=false;
(*
  bool DiadocApi::CanSendInvoice(const std::wstring& boxId, const Bytes_t& certBytes)
  {
  	WppTraceDebugOut("CanSendInvoice...");
  	std::wstringstream buf;
  	buf << L"/CanSendInvoice?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  	try
  	{
  		PerformHttpRequest(buf.str(), certBytes, POST);
  		return true;
  	}
  	catch (HttpException e)
  	{
  		if (e.StatusCode == 403)
  			return false;
  		throw e;
  	}
  }
*)

  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);

  if SendCommand(hmPOST, 'CanSendInvoice', S, ACertBytes) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('CanSendInvoice');
    {$ENDIF}
    Result:=FHTTP.ResultCode = 200;
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode <> 200 then
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;

end;

function TDiadocAPI.GetInvoiceCorrectionRequestInfo(ABoxId: string;
  AMessageId: string; AEntityId: string): TInvoiceCorrectionRequestInfo;
var
  S: String;
begin
  (*
  InvoiceCorrectionRequestInfo DiadocApi::GetInvoiceCorrectionRequestInfo(const std::wstring& boxId, const std::wstring& messageId, const std::wstring& entityId)
  {
  	WppTraceDebugOut("GetInvoiceCorrectionRequestInfo...");
  	std::wstringstream queryString;
  	queryString << L"/GetInvoiceCorrectionRequestInfo?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&messageId=" << StringHelper::CanonicalizeUrl(messageId) << L"&entityId=" << StringHelper::CanonicalizeUrl(entityId);
  	return FromProtoBytes<InvoiceCorrectionRequestInfo>(PerformHttpRequest(queryString.str(), GET));
  }
  *)
  Result:=nil;
  if ABoxID='' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AMessageId='' then
    raise EDiadocException.Create(sNotDefinedMessageId);
  if AEntityId='' then
    raise EDiadocException.Create(sNotDefinedEntityId);

  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'boxId', ABoxId); //идентификатор ящика
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения
  AddURLParam(S, 'entityId', AEntityId); //идентификатор сущности;

  if not Authenticate then exit;

  S:='';
  if SendCommand(hmGET, 'GetInvoiceCorrectionRequestInfo', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetInvoiceCorrectionRequestInfo');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TInvoiceCorrectionRequestInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;

end;

function TDiadocAPI.ParseUniversalTransferDocumentSellerTitleXml(
  AXmlContent: TStream; const documentVersion: string = 'utd_05_01_05'
  ): TUniversalTransferDocumentSellerTitleInfo;
var
  S: String;
begin
(*
Diadoc::Api::Proto::Invoicing::UniversalTransferDocumentSellerTitleInfo DiadocApi::ParseUniversalTransferDocumentSellerTitleXml(const Bytes_t& utdXmlContent)
{
	WppTraceDebugOut("ParseUniversalTransferDocumentSellerTitleXml...");
	return FromProtoBytes<UniversalTransferDocumentSellerTitleInfo>(PerformHttpRequest(L"/ParseUniversalTransferDocumentSellerTitleXml?documentVersion=utd_05_01_05", utdXmlContent, L"POST"));
}
*)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'documentVersion', documentVersion);
  if SendCommand(hmPOST, 'ParseUniversalTransferDocumentSellerTitleXml', S, AXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseUniversalTransferDocumentSellerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TUniversalTransferDocumentSellerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ParseUniversalCorrectionDocumentSellerTitleXml(
  AXmlContent: TStream; const documentVersion: string = 'ucd_05_01_03'
  ): TUniversalCorrectionDocumentSellerTitleInfo;
var
  S: String;
begin
(*
Diadoc::Api::Proto::Invoicing::UniversalCorrectionDocumentSellerTitleInfo DiadocApi::ParseUniversalCorrectionDocumentSellerTitleXml(const Bytes_t& utdXmlContent)
{
	WppTraceDebugOut("ParseUniversalCorrectionDocumentSellerTitleXml...");
	return FromProtoBytes<UniversalCorrectionDocumentSellerTitleInfo>(PerformHttpRequest(L"/ParseUniversalCorrectionDocumentSellerTitleXml?documentVersion=ucd_05_01_03", utdXmlContent, L"POST"));
}
*)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'documentVersion', documentVersion);
  if SendCommand(hmPOST, 'ParseUniversalCorrectionDocumentSellerTitleXml', S, AXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseUniversalCorrectionDocumentSellerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TUniversalCorrectionDocumentSellerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ParseUniversalCorrectionDocumentBuyerTitleXml(
  AXmlContent: TStream): TUniversalTransferDocumentBuyerTitleInfo;
var
  S: String;
begin
  S:='';
  if not Authenticate then exit;
//  AddURLParam(S, 'documentVersion', 'ucd_05_01_02');
  if SendCommand(hmPOST, 'ParseUniversalCorrectionDocumentBuyerTitleXml', S, AXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseUniversalCorrectionDocumentBuyerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TUniversalTransferDocumentBuyerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ParseTitleXml(const ABoxId: string;
  const ADocumentTypeNamedId: string; const ADocumentFunction: string;
  const ADocumentVersion: string; ATitleIndex: integer; const AContent: TStream
  ): TMemoryStream;
var
  S: String;
begin
  //DiadocApi::Bytes_t DiadocApi::ParseTitleXml(const std::wstring& boxId, const std::wstring& documentTypeNamedId, const std::wstring& documentFunction, const std::wstring& documentVersion, int titleIndex, const Bytes_t& content)
  //{
  //	WppTraceDebugOut("ParseTitleXml...");
  //	std::wstringstream buf;
  //	buf << L"/ParseTitleXml";
  //	buf << L"?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //	buf << L"&documentTypeNamedId=" << StringHelper::CanonicalizeUrl(documentTypeNamedId);
  //	buf << L"&documentFunction=" << StringHelper::CanonicalizeUrl(documentFunction);
  //	buf << L"&documentVersion=" << StringHelper::CanonicalizeUrl(documentVersion);
  //	buf << L"&titleIndex=" << titleIndex;
  //	return PerformHttpRequest(buf.str(), content, L"POST");
  //}

  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'documentTypeNamedId', ADocumentTypeNamedId);
  AddURLParam(S, 'documentFunction', ADocumentFunction);
  AddURLParam(S, 'documentVersion', ADocumentVersion);
  AddURLParam(S, 'titleIndex', IntToStr(ATitleIndex));

  if SendCommand(hmPOST, 'ParseTitleXml', S, AContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseTitleXml.xml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;

end;

function TDiadocAPI.ParseTorg12SellerTitleXml(AXmlContent: TStream
  ): TTorg12SellerTitleInfo;
var
  S: String;
begin
  //return FromProtoBytes<Torg12SellerTitleInfo>(PerformHttpRequest(L"/ParseTorg12SellerTitleXml", content, L"POST"));
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  //AddURLParam(S, 'documentVersion', 'utd_05_01_04');
  if SendCommand(hmPOST, 'ParseTorg12SellerTitleXml', S, AXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseTorg12SellerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TTorg12SellerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ParseTovTorg551SellerTitleXml(AXmlContent: TStream
  ): TTovTorgSellerTitleInfo;
var
  S: String;
begin
  (*
  TovTorgSellerTitleInfo DiadocApi::ParseTovTorg551SellerTitleXml(const Bytes_t& content)
  {
  	WppTraceDebugOut("ParseTovTorg551SellerTitleXml...");
  	return FromProtoBytes<TovTorgSellerTitleInfo>(PerformHttpRequest(L"/ParseTorg12SellerTitleXml?documentVersion=tovtorg_05_01_04", content, L"POST"));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'documentVersion', 'tovtorg_05_01_04');
  if SendCommand(hmPOST, 'ParseTorg12SellerTitleXml', S, AXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseTorg12SellerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TTovTorgSellerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ParseTorg12BuyerTitleXml(AXmlContent: TStream
  ): TTorg12BuyerTitleInfo;
var
  S: String;
begin
  (*
  Torg12BuyerTitleInfo DiadocApi::ParseTorg12BuyerTitleXml(const Bytes_t& content)
  {
  	WppTraceDebugOut("ParseTorg12BuyerTitleXml...");
  	return FromProtoBytes<Torg12BuyerTitleInfo>(PerformHttpRequest(L"/ParseTorg12BuyerTitleXml", content, L"POST"));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  if SendCommand(hmPOST, 'ParseTorg12BuyerTitleXml', S, AXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseTorg12BuyerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TTorg12BuyerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GenerateTorg12XmlForSeller(
  ATorg12SellerInfo: TTorg12SellerTitleInfo; ADisableValidation: boolean
  ): TStream;
var
  F: TStream;
  S: String;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateTorg12XmlForSeller(const Torg12SellerTitleInfo& torg12SellerInfo, bool disableValidation)
  {
  	WppTraceDebugOut("GenerateTorg12XmlForSeller...");
  	auto requestBody = ToProtoBytes(torg12SellerInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	std::wstringstream queryString;
  	queryString << L"/GenerateTorg12XmlForSeller" << (disableValidation ? L"?disableValidation" : L"");
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)
  Result:=nil;
  if not Assigned(ATorg12SellerInfo) then Exit;
  if not Authenticate then exit;
  S:='';
  if ADisableValidation then;
    AddURLParam(S, 'disableValidation');

  F:=ATorg12SellerInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateTorg12XmlForSeller', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateTorg12XmlForSeller.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateUniversalTransferDocumentXmlForSeller(
  ASellerInfo: TUniversalTransferDocumentSellerTitleInfo;
  ADisableValidation: boolean; const DocumentVersion: string {= 'utd_05_01_05'}): TMemoryStream;
var
  S: String;
  F: TStream;
begin
(*
  DiadocApi::WebFile DiadocApi::GenerateUniversalTransferDocumentXmlForSeller(const UniversalTransferDocumentSellerTitleInfo& utdSellerInfo, bool disableValidation)
  {
  	WppTraceDebugOut("GenerateUniversalTransferDocumentXmlForSeller...");
  	auto requestBody = ToProtoBytes(utdSellerInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	std::wstringstream queryString;
  	queryString << L"/GenerateUniversalTransferDocumentXmlForSeller"
  		<< (disableValidation ? L"?disableValidation" : L"");
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
}
*)
  Result:=nil;
  if not Assigned(ASellerInfo) then
    raise EDiadocException.Create(sNotDefinedSellerInfo);
  if not Authenticate then exit;

  if not Authenticate then exit;
  S:='';
  if ADisableValidation then
    AddURLParam(S, 'disableValidation');
  AddURLParam(S, 'documentVersion', documentVersion);

  F:=ASellerInfo.SaveToStream;
  F.Position:=0;
  if SendCommand(hmPOST, 'GenerateUniversalTransferDocumentXmlForSeller', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateUniversalTransferDocumentXmlForSeller.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  FreeAndNil(F);
end;

function TDiadocAPI.GenerateUniversalTransferDocumentXmlForBuyer(
  utdBuyerInfo: TUniversalTransferDocumentBuyerTitleInfo; ABoxId: string;
  ASellerTitleMessageId: string; ASellerTitleAttachmentId: string): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateUniversalTransferDocumentXmlForBuyer(const UniversalTransferDocumentBuyerTitleInfo& utdBuyerInfo, const std::wstring& boxId, const std::wstring& sellerTitleMessageId, const std::wstring& sellerTitleAttachmentId)
  {
  	WppTraceDebugOut("GenerateUniversalTransferDocumentXmlForBuyer...");
  	std::wstringstream queryString;
  	queryString << L"/GenerateUniversalTransferDocumentXmlForBuyer?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  		<< L"&sellerTitleMessageId=" << StringHelper::CanonicalizeUrl(sellerTitleMessageId)
  		<< L"&sellerTitleAttachmentId=" << StringHelper::CanonicalizeUrl(sellerTitleAttachmentId);
  	auto requestBody = ToProtoBytes(utdBuyerInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)
  Result:=nil;
  if not Assigned(utdBuyerInfo) then
    raise EDiadocException.Create(sNotDefinedSellerInfo);

  if AboxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if ASellerTitleMessageId = '' then
    raise EDiadocException.Create(sNotDefinedSellerTitleMessageId);
  if ASellerTitleAttachmentId = '' then
    raise EDiadocException.Create(sNotDefinedSellerTitleAttachmentId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', AboxId);
  AddURLParam(S, 'sellerTitleMessageId', ASellerTitleMessageId);
  AddURLParam(S, 'sellerTitleAttachmentId', ASellerTitleAttachmentId);

  F:=utdBuyerInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateUniversalTransferDocumentXmlForBuyer', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateUniversalTransferDocumentXmlForBuyer.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  FreeAndNil(F);
end;

function TDiadocAPI.GenerateTitleXml(const ABoxId: string;
  const ADocumentTypeNamedId: string; const ADocumentFunction: string;
  const ADocumentVersion: string; ATitleIndex: Integer;
  const AUserContractData: TStream; const AEditingSettingId: string;
  ADisableValidation: boolean; const ALetterId: string;
  const ADocumentId: string): TMemoryStream;
var
  S: String;
begin
(*
  DiadocApi::WebFile DiadocApi::GenerateTitleXml(
          const std::wstring& boxId,
          const std::wstring& documentTypeNamedId,
          const std::wstring& documentFunction,
          const std::wstring& documentVersion,
          int titleIndex,
          const DiadocApi::Bytes_t& userContractData,
          const std::wstring& editingSettingId,
          bool disableValidation,
          const std::wstring& letterId,
          const std::wstring& documentId) {
      WppTraceDebugOut("GenerateTitleXml...");
      std::wstringstream queryString;
      queryString << L"/GenerateTitleXml?boxId=" << StringHelper::CanonicalizeUrl(boxId)
                  << L"&documentTypeNamedId=" << StringHelper::CanonicalizeUrl(documentTypeNamedId)
                  << L"&documentFunction=" << StringHelper::CanonicalizeUrl(documentFunction)
                  << L"&documentVersion=" << StringHelper::CanonicalizeUrl(documentVersion)
                  << L"&titleIndex=" << titleIndex
                  << L"&editingSettingId=" << StringHelper::CanonicalizeUrl(editingSettingId)
                  << (disableValidation ? L"&disableValidation" : L"")
                  << L"&letterId=" << StringHelper::CanonicalizeUrl(letterId)
                  << L"&documentId=" << StringHelper::CanonicalizeUrl(documentId);
      auto connect = session_.Connect(api_url_.c_str(), api_port_);
      auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
      SendRequest(request, userContractData);
      return WebFile(request);
  }
*)

  Result:=nil;
  if not Assigned(AUserContractData) then
    raise EDiadocException.Create(sNotDefinedUserContractData);
  if AboxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if ADocumentTypeNamedId = '' then
    raise EDiadocException.Create(sNotDefinedDocumentTypeNamedId);
  if ADocumentFunction = '' then
    raise EDiadocException.Create(sNotDefinedDocumentFunction);
  if ADocumentVersion = '' then
    raise EDiadocException.Create(sNotDefinedDocumentVersion);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', AboxId);
  AddURLParam(S, 'documentTypeNamedId', ADocumentTypeNamedId);
  AddURLParam(S, 'documentFunction', ADocumentFunction);
  AddURLParam(S, 'documentVersion', ADocumentVersion);
  AddURLParam(S, 'titleIndex', IntToStr(ATitleIndex));
  AddURLParam(S, 'editingSettingId', AEditingSettingId);
  if ADisableValidation then
    AddURLParam(S, 'disableValidation');
  AddURLParam(S, 'letterId', ALetterId);
  AddURLParam(S, 'documentId', ADocumentId);

  if SendCommand(hmPOST, 'GenerateTitleXml', S, AUserContractData) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateTitleXml.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GenerateUniversalCorrectionDocumentXmlForSeller(
  AUtdSellerInfo: TUniversalCorrectionDocumentSellerTitleInfo;
  ADisableValidation: Boolean; const documentVersion: string = 'ucd_05_01_03'): TMemoryStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateUniversalCorrectionDocumentXmlForSeller(const UniversalCorrectionDocumentSellerTitleInfo& utdSellerInfo, bool disableValidation)
  {
  	WppTraceDebugOut("GenerateUniversalCorrectionDocumentXmlForSeller...");
  	auto requestBody = ToProtoBytes(utdSellerInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	std::wstringstream queryString;
  	queryString << L"/GenerateUniversalTransferDocumentXmlForSeller"
  		<< L"?correction"
  		<< (disableValidation ? L"&disableValidation" : L"");
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)

  Result:=nil;
  if not Assigned(AUtdSellerInfo) then
    raise EDiadocException.Create(sNotDefinedSellerInfo);


  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'correction');
  if ADisableValidation then
    AddURLParam(S, 'disableValidation');
  AddURLParam(S, 'documentVersion', documentVersion);

  F:=AUtdSellerInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateUniversalTransferDocumentXmlForSeller', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateUniversalCorrectionDocumentXmlForSeller.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  FreeAndNil(F);
end;

function TDiadocAPI.GenerateRecipientTitleXml(ABoxId, ASenderTitleMessageId,
  ASenderTitleAttachmentId: string; AUserContractData: TStream;
  ADocumentVersion: string): TStream;
var
  S: String;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateRecipientTitleXml(const std::wstring& boxId, const std::wstring& senderTitleMessageId, const std::wstring& senderTitleAttachmentId, const DiadocApi::Bytes_t& userContractData, const std::wstring& documentVersion)
  {
  	WppTraceDebugOut("GenerateRecipientTitleXml...");
  	std::wstringstream queryString;
  	queryString << L"/GenerateRecipientTitleXml?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  		<< L"&senderTitleMessageId=" << StringHelper::CanonicalizeUrl(senderTitleMessageId)
  		<< L"&senderTitleAttachmentId=" << StringHelper::CanonicalizeUrl(senderTitleAttachmentId)
  		<< L"&documentVersion=" << StringHelper::CanonicalizeUrl(documentVersion);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, userContractData);
  	return WebFile(request);
  }
  *)

  Result:=nil;
  if not Assigned(AUserContractData) then
    raise EDiadocException.Create(sNotDefinedUserContractData);


  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'senderTitleMessageId', ASenderTitleMessageId);
  AddURLParam(S, 'senderTitleAttachmentId', ASenderTitleAttachmentId);
  AddURLParam(S, 'documentVersion', ADocumentVersion);

  if SendCommand(hmPOST, 'GenerateRecipientTitleXml', S, AUserContractData) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateRecipientTitleXml.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GenerateSenderTitleXml(ABoxId, ADocumentTypeNamedId,
  ADocumentFunction, ADocumentVersion: string; AUserContractData: TStream;
  AEditingSettingId: string; ADisableValidation: boolean): TMemoryStream;
var
  S: String;
begin
(*
DiadocApi::WebFile DiadocApi::GenerateSenderTitleXml(const std::wstring& boxId, const std::wstring& documentTypeNamedId, const std::wstring& documentFunction, const std::wstring& documentVersion, const Bytes_t& userContractData, const std::wstring& editingSettingId, bool disableValidation)
{
	WppTraceDebugOut("GenerateSenderTitleXml...");
	std::wstringstream queryString;
	queryString << L"/GenerateSenderTitleXml?boxId=" << StringHelper::CanonicalizeUrl(boxId)
		<< L"&documentTypeNamedId=" << StringHelper::CanonicalizeUrl(documentTypeNamedId)
		<< L"&documentFunction=" << StringHelper::CanonicalizeUrl(documentFunction)
		<< L"&documentVersion=" << StringHelper::CanonicalizeUrl(documentVersion)
		<< L"&editingSettingId=" << StringHelper::CanonicalizeUrl(editingSettingId)
		<< (disableValidation ? L"&disableValidation" : L"");
	auto connect = session_.Connect(api_url_.c_str(), api_port_);
	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
	SendRequest(request, userContractData);
	return WebFile(request);
}*)


  Result:=nil;
  if not Assigned(AUserContractData) then
    raise EDiadocException.Create(sNotDefinedUserContractData);


  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'documentTypeNamedId=', ADocumentTypeNamedId);
  AddURLParam(S, 'documentFunction=', ADocumentFunction);
  AddURLParam(S, 'documentVersion=', ADocumentVersion);
  if AEditingSettingId<>'' then
    AddURLParam(S, 'editingSettingId=', AEditingSettingId);
  if ADisableValidation then
    AddURLParam(S, 'disableValidation');

  if SendCommand(hmPOST, 'GenerateSenderTitleXml', S, AUserContractData) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateSenderTitleXml.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.Delete(ABoxId: string; AMessageId: string;
  ADocumentId: string): boolean;
var
  S: String;
begin
  (*
  void DiadocApi::Delete(const std::wstring &boxId, const std::wstring &messageId, const std::wstring &documentId)
  {
  	WppTraceDebugOut("Delete...");
  	std::wstringstream queryString;
  	queryString << L"/Delete?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&messageId=" << StringHelper::CanonicalizeUrl(messageId);
  	if (!documentId.empty())
  		queryString << L"&documentId=" << StringHelper::CanonicalizeUrl(documentId);
  	PerformHttpRequest(queryString.str(), POST);
  }
  *)
  Result:=false;

  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AMessageId = '' then
    raise EDiadocException.Create(sNotDefinedMessageId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения;
  if ADocumentId<>'' then
    AddURLParam(S, 'documentId', ADocumentId); //идентификатор сущности документа, для которого требуется сгенерировать печатную форму;
  if SendCommand(hmGET, 'Delete', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('Delete.bin');
    {$ENDIF}

    Result:=FHTTP.ResultCode = 200;
    if not Result then
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ForwardDocument(ABoxId: string;
  ARequest: TForwardDocumentRequest): TForwardDocumentResponse;
var
  S: String;
  F: TStream;
begin
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if not Assigned(ARequest) then Exit;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  F:=ARequest.SaveToStream;
  if SendCommand(hmPOST, '/V2/ForwardDocument', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ForwardDocument');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TForwardDocumentResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateAcceptanceCertificateXmlForBuyer(
  AAcceptanceCertificateBuyerInfo: TAcceptanceCertificateBuyerTitleInfo;
  ABoxId, ASellerTitleMessageId, ASellerTitleAttachmentId: string): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateAcceptanceCertificateXmlForBuyer(const Diadoc::Api::Proto::Invoicing::AcceptanceCertificateBuyerTitleInfo& acceptanceCertificateBuyerInfo, const std::wstring& boxId, const std::wstring& sellerTitleMessageId, const std::wstring& sellerTitleAttachmentId)
  {
  	WppTraceDebugOut("GenerateAcceptanceCertificateXmlForBuyer...");
  	std::wstringstream queryString;
  	queryString << L"/GenerateAcceptanceCertificateXmlForBuyer?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  				<< L"&sellerTitleMessageId=" << StringHelper::CanonicalizeUrl(sellerTitleMessageId)
  				<< L"&sellerTitleAttachmentId=" << StringHelper::CanonicalizeUrl(sellerTitleAttachmentId);
  	auto requestBody = ToProtoBytes(acceptanceCertificateBuyerInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)
  Result:=nil;
  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'sellerTitleMessageId', ASellerTitleMessageId);
  AddURLParam(S, 'sellerTitleAttachmentId', ASellerTitleAttachmentId);
  F:=AAcceptanceCertificateBuyerInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateAcceptanceCertificateXmlForBuyer', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateAcceptanceCertificateXmlForBuyer');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateAcceptanceCertificateXmlForSeller(
  AAcceptanceCertificateSellerInfo: TAcceptanceCertificateSellerTitleInfo;
  ADisableValidation: Boolean): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateAcceptanceCertificateXmlForSeller(const Diadoc::Api::Proto::Invoicing::AcceptanceCertificateSellerTitleInfo& acceptanceCertificateSellerInfo, bool disableValidation)
  {
  	WppTraceDebugOut("GenerateAcceptanceCertificateXmlForSeller...");
  	auto requestBody = ToProtoBytes(acceptanceCertificateSellerInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	std::wstringstream queryString;
  	queryString << L"/GenerateAcceptanceCertificateXmlForSeller" << (disableValidation ? L"?disableValidation" : L"");
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)
  Result:=nil;

  if not Authenticate then exit;

  S:='';
  if ADisableValidation then
    AddURLParam(S, 'disableValidation');

  F:=AAcceptanceCertificateSellerInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateAcceptanceCertificateXmlForSeller', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateAcceptanceCertificateXmlForSeller');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateAcceptanceCertificate552XmlForSeller(
  AAcceptanceCertificateSellerInfo: TAcceptanceCertificate552SellerTitleInfo;
  ADisableValidation: Boolean): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateAcceptanceCertificate552XmlForSeller(const Diadoc::Api::Proto::Invoicing::AcceptanceCertificate552SellerTitleInfo& acceptanceCertificateSellerInfo, bool disableValidation)
  {
      WppTraceDebugOut("GenerateAcceptanceCertificate552XmlForSeller...");
      auto requestBody = ToProtoBytes(acceptanceCertificateSellerInfo);
      auto connect = session_.Connect(api_url_.c_str(), api_port_);
      std::wstringstream queryString;
      queryString << L"/GenerateAcceptanceCertificate552XmlForSeller?documentVersion=rezru_05_01_02" << (disableValidation ? L"&disableValidation" : L"");
      auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
      SendRequest(request, requestBody);
      return WebFile(request);
  }
  *)
  Result:=nil;

  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'documentVersion', 'rezru_05_01_02');
  if ADisableValidation then
    AddURLParam(S, 'disableValidation');

  F:=AAcceptanceCertificateSellerInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateAcceptanceCertificate552XmlForSeller', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateAcceptanceCertificate552XmlForSeller');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateAcceptanceCertificate552XmlForBuyer(
  AAcceptanceCertificateBuyerInfo: TAcceptanceCertificate552BuyerTitleInfo;
  ABoxId, ASellerTitleMessageId, ASellerTitleAttachmentId: string): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateAcceptanceCertificate552XmlForBuyer(const Diadoc::Api::Proto::Invoicing::AcceptanceCertificate552BuyerTitleInfo& acceptanceCertificateBuyerInfo, const std::wstring& boxId, const std::wstring& sellerTitleMessageId, const std::wstring& sellerTitleAttachmentId)
  {
      WppTraceDebugOut("GenerateAcceptanceCertificate552XmlForBuyer...");
      std::wstringstream queryString;
      queryString << L"/GenerateAcceptanceCertificate552XmlForBuyer?boxId=" << StringHelper::CanonicalizeUrl(boxId)
                  << L"&sellerTitleMessageId=" << StringHelper::CanonicalizeUrl(sellerTitleMessageId)
                  << L"&sellerTitleAttachmentId=" << StringHelper::CanonicalizeUrl(sellerTitleAttachmentId)
                  << L"&documentVersion=rezru_05_01_02";
      auto requestBody = ToProtoBytes(acceptanceCertificateBuyerInfo);
      auto connect = session_.Connect(api_url_.c_str(), api_port_);
      auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
      SendRequest(request, requestBody);
      return WebFile(request);
  }
  *)
  Result:=nil;

  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'sellerTitleMessageId', ASellerTitleMessageId);
  AddURLParam(S, 'sellerTitleAttachmentId', AsellerTitleAttachmentId);
  AddURLParam(S, 'documentVersion', 'rezru_05_01_02');

  F:=AAcceptanceCertificateBuyerInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateAcceptanceCertificate552XmlForBuyer', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateAcceptanceCertificate552XmlForBuyer');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateDocumentProtocol(ABoxId, AmessageId,
  ADocumentId: string): TDocumentProtocol;
var
  S: String;
begin
  (*
  TaskResult<DocumentProtocol> DiadocApi::GenerateDocumentProtocol(const std::wstring& boxId, const std::wstring& messageId, const std::wstring& documentId)
  {
  	std::wstringstream buf;
  	buf << "?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&messageId=" << StringHelper::CanonicalizeUrl(messageId) << L"&documentId=" << StringHelper::CanonicalizeUrl(documentId);
  	return PerformAsyncHttpRequest<DocumentProtocol>("GenerateDocumentProtocol", buf.str(), GET);
  }
  *)
  Result:=nil;
  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения;
  AddURLParam(S, 'documentId', ADocumentId); //идентификатор сущности документа, для которого требуется сгенерировать печатную форму;

  if SendCommand(hmGET, 'GenerateDocumentProtocol', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateDocumentProtocol');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDocumentProtocol.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GenerateForwardedDocumentProtocol(ABoxId: string;
  AForwardedDocumentId: TForwardedDocumentId): TDocumentProtocol;
var
  S: String;
  F: TStream;
begin
  (*
  TaskResult<DocumentProtocol> DiadocApi::GenerateForwardedDocumentProtocol(const std::wstring& boxId, const ForwardedDocumentId& forwardedDocumentId)
  {
  	std::wstringstream buf;
  	buf << L"?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  	buf << L"&fromBoxId=" << StringHelper::Utf8ToUtf16(forwardedDocumentId.fromboxid());
  	buf << L"&messageId=" << StringHelper::Utf8ToUtf16(forwardedDocumentId.documentid().messageid());
  	buf << L"&documentId=" << StringHelper::Utf8ToUtf16(forwardedDocumentId.documentid().entityid());
  	buf << L"&forwardEventId=" << StringHelper::Utf8ToUtf16(forwardedDocumentId.forwardeventid());
  	return PerformAsyncHttpRequest<DocumentProtocol>("GenerateForwardedDocumentProtocol", buf.str(), GET);
  }
  *)
  Result:=nil;
  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'fromBoxId', AForwardedDocumentId.FromBoxId);
  AddURLParam(S, 'messageId', AForwardedDocumentId.DocumentId.MessageId);
  AddURLParam(S, 'documentId', AForwardedDocumentId.DocumentId.EntityId);
  AddURLParam(S, 'forwardEventId', AForwardedDocumentId.ForwardEventId);

  if SendCommand(hmGET, 'GenerateForwardedDocumentProtocol', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateForwardedDocumentProtocol');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDocumentProtocol.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GenerateDocumentZip(ABoxId, AMessageId,
  ADocumentId: string; AFullDocflow: boolean): TDocumentZipGenerationResult;
var
  S: String;
begin
  Result:=nil;

  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AMessageId = '' then
    raise EDiadocException.Create(sNotDefinedMessageId);
  if ADocumentId = '' then
    raise EDiadocException.Create(sNotDefinedDepartmentId);

  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения;
  AddURLParam(S, 'documentId', ADocumentId); //идентификатор сущности документа, для которого требуется сгенерировать печатную форму;
  AddURLParam(S, 'fullDocflow', BoolToStr(AFullDocflow, true)); //идентификатор сущности документа, для которого требуется сгенерировать печатную форму;

  if SendCommand(hmGET, 'GenerateDocumentZip', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateDocumentZip');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDocumentZipGenerationResult.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GenerateReceiptXml(const ABoxId: string;
  const AMessageId: string; const AAttachmentId: string; const ASigner: TSigner
  ): TStream;
var
  F: TStream;
  S: String;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateReceiptXml(const std::wstring& boxId, const std::wstring& messageId, const std::wstring& attachmentId, const Diadoc::Api::Proto::Invoicing::Signer signer)
  {
      WppTraceDebugOut("GenerateReceiptXml...");
      auto requestBody = ToProtoBytes(signer);
      std::wstringstream buf;
      buf << L"/GenerateReceiptXml?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&messageId=" << StringHelper::CanonicalizeUrl(messageId) << L"&attachmentId=" << StringHelper::CanonicalizeUrl(attachmentId);
      auto connect = session_.Connect(api_url_.c_str(), api_port_);
      auto request = connect.OpenRequest(POST.c_str(), buf.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
      SendRequest(request, requestBody);
      return WebFile(request);
  }
  *)

  Result:=nil;
  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'messageId', AMessageId);
  AddURLParam(S, 'attachmentId', AAttachmentId);
  F:=ASigner.SaveToStream;
  if SendCommand(hmPOST, 'GenerateReceiptXml', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateReceiptXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateDocumentReceiptXml(ABoxId, AMessageId,
  AAttachmentId: string; ASigner: TSigner): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateDocumentReceiptXml(const std::wstring& boxId, const std::wstring& messageId, const std::wstring& attachmentId, const Diadoc::Api::Proto::Invoicing::Signer signer)
  {
  	WppTraceDebugOut("GenerateDocumentReceiptXml...");
  	auto requestBody = ToProtoBytes(signer);
  	std::wstringstream buf;
  	buf << L"/GenerateDocumentReceiptXml?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&messageId=" << StringHelper::CanonicalizeUrl(messageId) << L"&attachmentId=" << StringHelper::CanonicalizeUrl(attachmentId);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	auto request = connect.OpenRequest(POST.c_str(), buf.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)
  Result:=nil;
  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'messageId', AMessageId);
  AddURLParam(S, 'attachmentId', AAttachmentId);
  F:=ASigner.SaveToStream;
  if SendCommand(hmPOST, 'GenerateDocumentReceiptXml', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateDocumentReceiptXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GeneratePrintForm(ABoxId, AMessageId, ADocumentId: string
  ): TPrintFormResult;
var
  i: Integer;
  S, S1: String;
begin
  Result:=nil;

  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AMessageId = '' then
    raise EDiadocException.Create(sNotDefinedMessageId);
  if ADocumentId = '' then
    raise EDiadocException.Create(sNotDefinedDepartmentId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения;
  AddURLParam(S, 'documentId', ADocumentId); //идентификатор сущности документа, для которого требуется сгенерировать печатную форму;
  if SendCommand(hmGET, 'GeneratePrintForm', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GeneratePrintForm.bin');
    {$ENDIF}

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TPrintFormResult.Create;
      S1:=FindHeaderValue(FHTTP.Headers, 'Retry-After');
      if S1<>'' then
        Result.FRetryAfter:=StrToIntDef(S1, -1)
      else
      begin
        Result.FFileName:=GetParameter(FindHeaderValue(FHTTP.Headers, 'Content-Disposition'), 'filename');
        FHTTP.Document.Position:=0;
        if FHTTP.Document.Size > 0 then
        begin
          Result.FHasContent:=true;
          Result.Stream.LoadFromStream(FHTTP.Document);
        end;
      end;
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GenerateRevocationRequestXml(ABoxId, AMessageId,
  AAttachmentId: string; ARevocationRequestInfo: TRevocationRequestInfo
  ): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateRevocationRequestXml(const std::wstring& boxId, const std::wstring& messageId, const std::wstring& attachmentId, const RevocationRequestInfo& revocationRequestInfo)
  {
  	WppTraceDebugOut("GenerateRevocationRequestXml...");
  	std::wstringstream queryString;
  	queryString << L"/GenerateRevocationRequestXml?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&messageId=" << StringHelper::CanonicalizeUrl(messageId) << L"&attachmentId=" << StringHelper::CanonicalizeUrl(attachmentId);
  	auto requestBody = ToProtoBytes(revocationRequestInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)

  Result:=nil;

  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AAttachmentId = '' then
    raise EDiadocException.Create(sNotDefinedAttachmentId);
  if AMessageId = '' then
    raise EDiadocException.Create(sNotDefinedMessageId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения;
  AddURLParam(S, 'attachmentId', AAttachmentId);
  F:=ARevocationRequestInfo.SaveToStream;
  if SendCommand(hmGET, 'GenerateRevocationRequestXml', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateRevocationRequestXml.bin');
    {$ENDIF}

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateSignatureRejectionXml(ABoxId, AMessageId,
  AAttachmentId: string; ASignatureRejectionInfo: TSignatureRejectionInfo
  ): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateSignatureRejectionXml(const std::wstring& boxId, const std::wstring& messageId, const std::wstring& attachmentId, const SignatureRejectionInfo& signatureRejectionInfo)
  {
  	WppTraceDebugOut("GenerateSignatureRejectionXml...");
  	std::wstringstream queryString;
  	queryString << L"/GenerateSignatureRejectionXml?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&messageId=" << StringHelper::CanonicalizeUrl(messageId) << L"&attachmentId=" << StringHelper::CanonicalizeUrl(attachmentId);
  	auto requestBody = ToProtoBytes(signatureRejectionInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)

  Result:=nil;

  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AAttachmentId = '' then
    raise EDiadocException.Create(sNotDefinedAttachmentId);
  if AMessageId = '' then
    raise EDiadocException.Create(sNotDefinedMessageId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения;
  AddURLParam(S, 'attachmentId', AAttachmentId);
  F:=ASignatureRejectionInfo.SaveToStream;
  if SendCommand(hmGET, 'GenerateSignatureRejectionXml', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateSignatureRejectionXml.bin');
    {$ENDIF}

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GetForwardedDocumentEvents(ABoxId: string;
  ARequest: TGetForwardedDocumentEventsRequest
  ): TGetForwardedDocumentEventsResponse;
begin
  Result:=nil;
  (*
  GetForwardedDocumentEventsResponse DiadocApi::GetForwardedDocumentEvents(const std::wstring& boxId, const GetForwardedDocumentEventsRequest& request)
  {
  	return PerformHttpRequestWithBoxId<GetForwardedDocumentEventsRequest, GetForwardedDocumentEventsResponse>("GetForwardedDocumentEvents", boxId, request);
  }
  *)
end;

function TDiadocAPI.GetForwardedEntityContent(ABoxId: string;
  AForwardedDocumentId: TForwardedDocumentId; AEntityId: string): TStream;
var
  S: String;
begin
  (*
  DiadocApi::Bytes_t DiadocApi::GetForwardedEntityContent(const std::wstring& boxId, const ForwardedDocumentId& forwardedDocumentId, const std::wstring& entityId)
  {
  	WppTraceDebugOut(L"GetForwardedEntityContent...");
  	std::wstringstream buf;
  	buf << L"/GetForwardedEntityContent?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  	buf << L"&fromBoxId=" << StringHelper::Utf8ToUtf16(forwardedDocumentId.fromboxid());
  	buf << L"&messageId=" << StringHelper::Utf8ToUtf16(forwardedDocumentId.documentid().messageid());
  	buf << L"&documentId=" << StringHelper::Utf8ToUtf16(forwardedDocumentId.documentid().entityid());
  	buf << L"&forwardEventId=" << StringHelper::Utf8ToUtf16(forwardedDocumentId.forwardeventid());
  	buf << L"&entityId=" << StringHelper::CanonicalizeUrl(entityId);
  	return PerformHttpRequest(buf.str(), GET);
  }
  *)
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if not Assigned(AForwardedDocumentId) then Exit;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'fromBoxId', AForwardedDocumentId.FromBoxId);//fromBoxId
  AddURLParam(S, 'messageId', AForwardedDocumentId.DocumentId.MessageId); //идентификатор сообщения;
  AddURLParam(S, 'documentId', AForwardedDocumentId.DocumentId.EntityId); //идентификатор сущности документа;
  AddURLParam(S, 'forwardEventId', AForwardedDocumentId.ForwardEventId); //идентификатор события пересылки документа;
  AddURLParam(S, 'entityId', AEntityId); //идентификатор сущности, связанной с документом, содержимое которой требуется выгрузить;

  if SendCommand(hmPOST, '/V2/GetForwardedEntityContent', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetForwardedEntityContent');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetForwardedDocuments(ABoxId: string;
  ARequest: TGetForwardedDocumentsRequest): TGetForwardedDocumentsResponse;
var
  S: String;
  F: TStream;
begin
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if not Assigned(ARequest) then Exit;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  F:=ARequest.SaveToStream;
  if SendCommand(hmPOST, '/V2/GetForwardedDocuments', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetForwardedDocuments');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TGetForwardedDocumentsResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GetGeneratedPrintForm(APrintFormId: string): TStream;
var
  S: String;
begin
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'printFormId', APrintFormId);
  if SendCommand(hmGET, 'GetGeneratedPrintForm', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetGeneratedPrintForm');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.MoveDocuments(AOperation: TDocumentsMoveOperation): Boolean;
var
  S: String;
  F: TStream;
begin
  (*
  void DiadocApi::MoveDocuments(const Diadoc::Api::Proto::Documents::DocumentsMoveOperation& operation)
  {
  	WppTraceDebugOut("MoveDocuments...");
  	auto requestBody = ToProtoBytes(operation);
  	PerformHttpRequest(L"/MoveDocuments", requestBody, POST);
  }
  *)
  Result:=false;
  if not Assigned(AOperation) then Exit;
  if not Authenticate then exit;
  S:='';
  F:=AOperation.SaveToStream;
  if SendCommand(hmPOST, 'MoveDocuments', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('MoveDocuments');
    {$ENDIF}

    Result:=ResultCode = 200;
    FHTTP.Document.Position:=0;
    if not Result then
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.ParseAcceptanceCertificateSellerTitleXml(
  ASellerTitleXmlContent: TStream): TAcceptanceCertificateSellerTitleInfo;
var
  S: String;
begin
  (*
  AcceptanceCertificateSellerTitleInfo DiadocApi::ParseAcceptanceCertificateSellerTitleXml(const Bytes_t& sellerTitleXmlContent)
  {
  	WppTraceDebugOut("ParseAcceptanceCertificateSellerTitleXml...");
  	return FromProtoBytes<AcceptanceCertificateSellerTitleInfo>(PerformHttpRequest(L"/ParseAcceptanceCertificateSellerTitleXml", sellerTitleXmlContent, L"POST"));
  }
  *)

  Result:=nil;
  if not Assigned(ASellerTitleXmlContent) then Exit;
  if not Authenticate then exit;
  S:='';
  if SendCommand(hmPOST, 'ParseAcceptanceCertificateSellerTitleXml', S, ASellerTitleXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseAcceptanceCertificateSellerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TAcceptanceCertificateSellerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ParseAcceptanceCertificateBuyerTitleXml(
  ABuyerTitleXmlContent: TStream): TAcceptanceCertificateBuyerTitleInfo;
var
  S: String;
begin
  (*
  AcceptanceCertificateBuyerTitleInfo DiadocApi::ParseAcceptanceCertificateBuyerTitleXml(const Bytes_t& buyerTitleXmlContent)
  {
      WppTraceDebugOut("ParseAcceptanceCertificateBuyerTitleXml...");
      return FromProtoBytes<AcceptanceCertificateBuyerTitleInfo>(PerformHttpRequest(L"/ParseAcceptanceCertificateBuyerTitleXml", buyerTitleXmlContent, L"POST"));
  }
  *)

  Result:=nil;
  if not Assigned(ABuyerTitleXmlContent) then Exit;
  if not Authenticate then exit;
  S:='';
  if SendCommand(hmPOST, 'ParseAcceptanceCertificateBuyerTitleXml', S, ABuyerTitleXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseAcceptanceCertificateBuyerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TAcceptanceCertificateBuyerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ParseRevocationRequestXml(AXmlContent: TStream
  ): TRevocationRequestInfo;
var
  S: String;
begin
  (*
  RevocationRequestInfo DiadocApi::ParseRevocationRequestXml(const Bytes_t& xmlContent)
  {
  	WppTraceDebugOut("ParseRevocationRequestXml...");
  	return FromProtoBytes<RevocationRequestInfo>(PerformHttpRequest(L"/ParseRevocationRequestXml", xmlContent, L"POST"));
  }
  *)
  Result:=nil;
  if not Assigned(AXmlContent) then Exit;
  if not Authenticate then exit;
  S:='';
  if SendCommand(hmPOST, 'ParseRevocationRequestXml', S, AXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseRevocationRequestXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TRevocationRequestInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ParseSignatureRejectionXml(AXmlContent: TStream
  ): TSignatureRejectionInfo;
var
  S: String;
begin
  (*
  SignatureRejectionInfo DiadocApi::ParseSignatureRejectionXml(const Bytes_t& xmlContent)
  {
  	WppTraceDebugOut("ParseSignatureRejectionXml...");
  	return FromProtoBytes<SignatureRejectionInfo>(PerformHttpRequest(L"/ParseSignatureRejectionXml", xmlContent, L"POST"));
  }
  *)
  Result:=nil;
  if not Assigned(AXmlContent) then Exit;
  if not Authenticate then exit;
  S:='';
  if SendCommand(hmPOST, 'ParseSignatureRejectionXml', S, AXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseSignatureRejectionXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TSignatureRejectionInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.Restore(ABoxId, AMessageId, ADocumentId: string): boolean;
var
  S: String;
begin
  Result:=false;

  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AMessageId = '' then
    raise EDiadocException.Create(sNotDefinedMessageId);
  if ADocumentId = '' then
    raise EDiadocException.Create(sNotDefinedDocumentId);

  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);//идентификатор ящика;
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения;
  AddURLParam(S, 'documentId', ADocumentId);
  if SendCommand(hmPOST, 'Restore', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('Restore.bin');
    {$ENDIF}

    Result:=FHTTP.ResultCode = 200;
    if not Result then
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ShelfDownload(ANameOnShelf: string): TStream;
var
  S: String;
begin
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'nameOnShelf', ANameOnShelf);
  if SendCommand(hmGET, 'ShelfDownload', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ShelfDownload');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;
(*
function TDiadocAPI.ShelfUpload(ANameOnShelf, APartIndex, AIsLastPart:string): boolean;
begin
  //nameOnShelf: имя файла на «полке документов»
  //partIndex: номер загружаемого фрагмента файла (фрагменты индексируются, начиная с 0);
  //isLastPart: признак того, что загружается последний фрагмент файла: выставляется в 1 для последнего фрагмента, может отсутствовать или быть выставленным в 0 для всех остальных фрагментов;

end;
*)
function TDiadocAPI.ParseUniversalTransferDocumentBuyerTitleXml(
  AXmlContent: TStream): TUniversalTransferDocumentBuyerTitleInfo;
var
  S: String;
begin
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'documentVersion', 'utd_05_01_04');
  if SendCommand(hmPOST, 'ParseUniversalTransferDocumentBuyerTitleXml', S, AXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseUniversalTransferDocumentBuyerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TUniversalTransferDocumentBuyerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GenerateTorg12XmlForBuyer(
  ATorg12BuyerInfo: TTorg12BuyerTitleInfo; ABoxId: string;
  ASellerTitleMessageId: string; ASellerTitleAttachmentId: string): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateTorg12XmlForBuyer(const Torg12BuyerTitleInfo& torg12BuyerInfo, const std::wstring& boxId, const std::wstring& sellerTitleMessageId, const std::wstring& sellerTitleAttachmentId)
  {
  	WppTraceDebugOut("GenerateTorg12XmlForBuyer...");
  	std::wstringstream queryString;
  	queryString << L"/GenerateTorg12XmlForBuyer?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  				<< L"&sellerTitleMessageId=" << StringHelper::CanonicalizeUrl(sellerTitleMessageId)
  				<< L"&sellerTitleAttachmentId=" << StringHelper::CanonicalizeUrl(sellerTitleAttachmentId);
  	auto requestBody = ToProtoBytes(torg12BuyerInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)
//documentVersion – версия документа
//boxId – идентификатор ящика
//sellerTitleMessageId – идентификатор сообщения, содержащего соответствующий титул продавца
//sellerTitleAttachmentId – идентификатор сущности, представляющей титул продавца, для которого требуется изготовить титул заказчика
  Result:=nil;

  S:='';
  if not Assigned(ATorg12BuyerInfo) then exit;

  if ABoxID='' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if ASellerTitleMessageId='' then
    raise EDiadocException.Create(sNotDefinedSellerTitleMessageId);
  if ASellerTitleAttachmentId='' then
    raise EDiadocException.Create(sNotDefinedSellerTitleAttachmentId);

  if not Authenticate then exit;

  AddURLParam(S, 'boxId', ABoxId); //идентификатор ящика
  AddURLParam(S, 'sellerTitleMessageId', ASellerTitleMessageId);
  AddURLParam(S, 'sellerTitleAttachmentId', ASellerTitleAttachmentId);

  F:=ATorg12BuyerInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateTorg12XmlForBuyer', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateTorg12XmlForBuyer.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateTovTorg551XmlForSeller(
  ATovTorgSellerInfo: TTovTorgSellerTitleInfo; ADisableValidation: boolean
  ): TStream;
var
  S: String;
  F: TStream;
begin
  Result:=nil;
  (*
  DiadocApi::WebFile DiadocApi::GenerateTovTorg551XmlForSeller(const TovTorgSellerTitleInfo& tovTorgSellerInfo, bool disableValidation)
  {
  	WppTraceDebugOut("GenerateTovTorg551XmlForSeller...");
  	auto requestBody = ToProtoBytes(tovTorgSellerInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	std::wstringstream queryString;
  	queryString << L"/GenerateTorg12XmlForSeller?documentVersion=tovtorg_05_01_04" << (disableValidation ? L"&disableValidation" : L"");
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)
  if not Assigned(ATovTorgSellerInfo) then exit;
  S:='';
  if not Authenticate then exit;

  if ADisableValidation then
  AddURLParam(S, 'disableValidation');
  AddURLParam(S, 'documentVersion', 'tovtorg_05_01_04');

  F:=ATovTorgSellerInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateTorg12XmlForSeller', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateTorg12XmlForSeller.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;

end;

function TDiadocAPI.GenerateTovTorg551XmlForBuyer(
  ATovTorgBuyerInfo: TTovTorgBuyerTitleInfo; ABoxId: string;
  ASellerTitleMessageId: string; ASellerTitleAttachmentId: string;
  ADocumentVersion: string): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateTovTorg551XmlForBuyer(const TovTorgBuyerTitleInfo& tovTorgBuyerInfo, const std::wstring& boxId, const std::wstring& sellerTitleMessageId, const std::wstring& sellerTitleAttachmentId, const std::wstring& documentVersion)
  {
  	WppTraceDebugOut("GenerateTovTorg551XmlForBuyer...");
  	std::wstringstream queryString;

  	std::wstring version = documentVersion.empty()
  		? L"tovtorg_05_01_04"
  		: documentVersion;

  	queryString << L"/GenerateTorg12XmlForBuyer?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  		<< L"&sellerTitleMessageId=" << StringHelper::CanonicalizeUrl(sellerTitleMessageId)
  		<< L"&sellerTitleAttachmentId=" << StringHelper::CanonicalizeUrl(sellerTitleAttachmentId)
  		<< L"&documentVersion=" << StringHelper::CanonicalizeUrl(version);
  	auto requestBody = ToProtoBytes(tovTorgBuyerInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)

  Result:=nil;

  S:='';
  if not Assigned(ATovTorgBuyerInfo) then exit;

  if ABoxID='' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if ASellerTitleMessageId='' then
    raise EDiadocException.Create(sNotDefinedSellerTitleMessageId);
  if ASellerTitleAttachmentId='' then
    raise EDiadocException.Create(sNotDefinedSellerTitleAttachmentId);

  if not Authenticate then exit;

  if ADocumentVersion = '' then
    ADocumentVersion:='tovtorg_05_01_04';

  AddURLParam(S, 'boxId', ABoxId); //идентификатор ящика
  AddURLParam(S, 'sellerTitleMessageId', ASellerTitleMessageId);
  AddURLParam(S, 'sellerTitleAttachmentId', ASellerTitleAttachmentId);
  AddURLParam(S, 'documentVersion', ADocumentVersion);

  F:=ATovTorgBuyerInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateTorg12XmlForBuyer', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateTorg12XmlForBuyer.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;

end;

function TDiadocAPI.ParseTovTorg551BuyerTitleXml(AContent: TStream
  ): TTovTorgBuyerTitleInfo;
var
  S: String;
begin
  (*
  TovTorgBuyerTitleInfo DiadocApi::ParseTovTorg551BuyerTitleXml(const Bytes_t& content)
  {
  	WppTraceDebugOut("ParseTovTorg551BuyerTitleXml...");
  	return FromProtoBytes<TovTorgBuyerTitleInfo>(PerformHttpRequest(L"/ParseTorg12BuyerTitleXml?documentVersion=tovtorg_05_01_04", content, L"POST"));
  }
  *)

  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'documentVersion', 'tovtorg_05_01_04'); //идентификатор ящика

  if SendCommand(hmPOST, 'ParseTorg12BuyerTitleXml', S, AContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseTorg12BuyerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TTovTorgBuyerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ParseAcceptanceCertificate552SellerTitleXml(
  ASellerTitleXmlContent: TStream): TAcceptanceCertificate552SellerTitleInfo;
var
  S: String;
begin
  (*
  AcceptanceCertificate552SellerTitleInfo DiadocApi::ParseAcceptanceCertificate552SellerTitleXml(const Bytes_t& sellerTitleXmlContent)
  {
      WppTraceDebugOut("ParseAcceptanceCertificate552SellerTitleXml...");
      return FromProtoBytes<AcceptanceCertificate552SellerTitleInfo>(PerformHttpRequest(L"/ParseAcceptanceCertificate552SellerTitleXml?documentVersion=rezru_05_01_02", sellerTitleXmlContent, L"POST"));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'documentVersion', 'rezru_05_01_02');

  if SendCommand(hmPOST, 'ParseAcceptanceCertificate552SellerTitleXml', S, ASellerTitleXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseAcceptanceCertificate552SellerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TAcceptanceCertificate552SellerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.ParseAcceptanceCertificate552BuyerTitleXml(
  ABuyerTitleXmlContent: TStream): TAcceptanceCertificate552BuyerTitleInfo;
var
  S: String;
begin
  (*
  AcceptanceCertificate552BuyerTitleInfo DiadocApi::ParseAcceptanceCertificate552BuyerTitleXml(const Bytes_t& buyerTitleXmlContent)
  {
      WppTraceDebugOut("ParseAcceptanceCertificate552BuyerTitleXml...");
      return FromProtoBytes<AcceptanceCertificate552BuyerTitleInfo>(PerformHttpRequest(L"/ParseAcceptanceCertificate552BuyerTitleXml?documentVersion=rezru_05_01_02", buyerTitleXmlContent, L"POST"));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'documentVersion', 'rezru_05_01_02');

  if SendCommand(hmPOST, 'ParseAcceptanceCertificate552BuyerTitleXml', S, ABuyerTitleXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseAcceptanceCertificate552BuyerTitleXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TAcceptanceCertificate552BuyerTitleInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GenerateInvoiceXml(AInvoiceInfo: TInvoiceInfo;
  ADisableValidation: boolean): TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateInvoiceXml(const InvoiceInfo& invoiceInfo, bool disableValidation)
  {
  	return GenerateInvoiceXml(invoiceInfo, "Invoice", "GenerateInvoiceXml...", disableValidation);
  }
*)
  Result:=InternalGenerateInvoiceXml(AInvoiceInfo, 'Invoice', 'GenerateInvoiceXml', ADisableValidation);
end;

function TDiadocAPI.InternalGenerateInvoiceXml(
  AInvoiceInfo: TSerializationObject; AInvoiceTypeStr: string;
  ALogString: string; ADisableValidation: boolean): TStream;
var
  F: TStream;
  S: String;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateInvoiceXml(const T& info, std::string invoiceTypeStr, std::string logString, bool disableValidation)
  {
  	WppTraceDebugOut(logString.c_str());
  	auto requestBody = ToProtoBytes(info);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	std::wstringstream queryString;
  	queryString << L"/GenerateInvoiceXml?invoiceType=" << invoiceTypeStr.c_str() << (disableValidation ? L"&disableValidation" : L"");
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)
  Result:=nil;
  if AInvoiceTypeStr = '' then
    raise EDiadocException.Create(sNotDefinedInvoiceTypeStr);

  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'invoiceType', AInvoiceTypeStr); //идентификатор ящика
  if ADisableValidation then
    AddURLParam(S, 'disableValidation');

  F:=AInvoiceInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateInvoiceXml', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf(ALogString);
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      TMemoryStream(Result).LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateInvoiceRevisionXml(
  AInvoiceRevisionInfo: TInvoiceInfo; ADisableValidation: boolean): TStream;
begin
(*
DiadocApi::WebFile DiadocApi::GenerateInvoiceRevisionXml(const Diadoc::Api::Proto::Invoicing::InvoiceInfo& invoiceRevisionInfo, bool disableValidation)
{
	return GenerateInvoiceXml(invoiceRevisionInfo, "InvoiceRevision", "GenerateInvoiceRevisionXml...", disableValidation);
}
*)
  Result:=InternalGenerateInvoiceXml(AInvoiceRevisionInfo, 'InvoiceRevision', 'GenerateInvoiceRevisionXml', ADisableValidation);
end;

function TDiadocAPI.GenerateInvoiceCorrectionXml(
  AInvoiceCorrectionInfo: TInvoiceCorrectionInfo; ADisableValidation: boolean
  ): TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateInvoiceCorrectionXml(const Diadoc::Api::Proto::Invoicing::InvoiceCorrectionInfo& invoiceCorrectionInfo, bool disableValidation)
  {
  	return GenerateInvoiceXml(invoiceCorrectionInfo, "InvoiceCorrection", "GenerateInvoiceCorrectionXml...", disableValidation);
  }
  *)
  Result:=InternalGenerateInvoiceXml(AInvoiceCorrectionInfo, 'InvoiceCorrection', 'GenerateInvoiceCorrectionXml', ADisableValidation);
end;

function TDiadocAPI.GenerateInvoiceCorrectionRevisionXml(
  AInvoiceCorrectionRevisionInfo: TInvoiceCorrectionInfo;
  ADisableValidation: boolean): TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateInvoiceCorrectionRevisionXml(const Diadoc::Api::Proto::Invoicing::InvoiceCorrectionInfo& invoiceCorrectionRevisionInfo, bool disableValidation)
  {
  	return GenerateInvoiceXml(invoiceCorrectionRevisionInfo, "InvoiceCorrectionRevision", "GenerateInvoiceCorrectionRevisionXml...", disableValidation);
  }
  *)
  Result:=InternalGenerateInvoiceXml(AInvoiceCorrectionRevisionInfo, 'InvoiceCorrectionRevision', 'GenerateInvoiceCorrectionRevisionXml', ADisableValidation);
end;

function TDiadocAPI.ParseInvoiceXml(AXmlContent: TStream): TInvoiceInfo;
var
  S: String;
begin
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  if SendCommand(hmPOST, 'ParseInvoiceXml', S, AXmlContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseInvoiceXml');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TInvoiceInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
(*
  InvoiceInfo DiadocApi::ParseInvoiceXml(const Bytes_t& invoiceXmlContent)
  {
  	WppTraceDebugOut("ParseInvoiceXml...");
  	return FromProtoBytes<InvoiceInfo>(PerformHttpRequest(L"/ParseInvoiceXml", invoiceXmlContent, L"POST"));
  }
*)
end;

function TDiadocAPI.GenerateInvoiceDocumentReceiptXml(ABoxId, AMessageId,
  AAttachmentId: string; ASigner: TSigner): TStream;
var
  F: TStream;
  S: String;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateInvoiceDocumentReceiptXml(const std::wstring& boxId, const std::wstring& messageId, const std::wstring& attachmentId, const Diadoc::Api::Proto::Invoicing::Signer signer)
  {
  	WppTraceDebugOut("GenerateInvoiceDocumentReceiptXml...");
  	auto requestBody = ToProtoBytes(signer);
  	std::wstringstream buf;
  	buf << L"/GenerateInvoiceDocumentReceiptXml?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&messageId=" << StringHelper::CanonicalizeUrl(messageId) << L"&attachmentId=" << StringHelper::CanonicalizeUrl(attachmentId);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	auto request = connect.OpenRequest(POST.c_str(), buf.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)
  Result:=nil;
  if not Assigned(ASigner) then exit;
  S:='';
  if ABoxID='' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AAttachmentId='' then
    raise EDiadocException.Create(sNotDefinedAttachmentId);

  if not Authenticate then exit;

  AddURLParam(S, 'boxId', ABoxId); //идентификатор ящика
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения
  AddURLParam(S, 'attachmentId', AAttachmentId);

  F:=ASigner.SaveToStream;
  if SendCommand(hmPOST, 'GenerateInvoiceDocumentReceiptXml', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetEntityContent.bin');
    {$ENDIF}
    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GenerateInvoiceCorrectionRequestXml(ABoxId, AMessageId, AAttachmentId: string; ACorrectionInfo: TInvoiceCorrectionRequestInfo): TStream;
var
  S: String;
  F: TStream;
begin
  (*
  DiadocApi::WebFile DiadocApi::GenerateInvoiceCorrectionRequestXml(const std::wstring& boxId, const std::wstring& messageId, const std::wstring& attachmentId, const InvoiceCorrectionRequestInfo& correctionInfo)
  {
  	WppTraceDebugOut("GenerateInvoiceCorrectionRequestXml...");
  	std::wstringstream queryString;
  	queryString << L"/GenerateInvoiceCorrectionRequestXml?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&messageId=" << StringHelper::CanonicalizeUrl(messageId) << L"&attachmentId=" << StringHelper::CanonicalizeUrl(attachmentId);
  	auto requestBody = ToProtoBytes(correctionInfo);
  	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  	auto request = connect.OpenRequest(POST.c_str(), queryString.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  	SendRequest(request, requestBody);
  	return WebFile(request);
  }
  *)
  Result:=nil;
  S:='';
  if ABoxID='' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AMessageId='' then
    raise EDiadocException.Create(sNotDefinedMessageId);
  if AAttachmentId='' then
    raise EDiadocException.Create(sNotDefinedAttachmentId);

  if not Authenticate then exit;

  AddURLParam(S, 'boxId', ABoxId); //идентификатор ящика
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения
  AddURLParam(S, 'attachmentId', AAttachmentId); //идентификатор сущности;

  F:=ACorrectionInfo.SaveToStream;
  if SendCommand(hmPOST, 'GenerateInvoiceCorrectionRequestXml', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GenerateInvoiceCorrectionRequestXml.xml');
    {$ENDIF}
    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GetExtendedSignerDetails(AToken, ABoxId,
  AThumbprint: string; AForBuyer, AForCorrection: boolean): TExtendedSignerDetails;
var
  S: String;
  documentTitleType: TDocumentTitleType;
begin
  raise ENotImplemented.Create(sNotImplemented);
  (*

  Signers::ExtendedSignerDetails DiadocApi::GetExtendedSignerDetails(const std::wstring& token, const std::wstring& boxId, const std::wstring& thumbprint, bool forBuyer, bool forCorrection)
  {
      Signers::DocumentTitleType documentTitleType = CreateUtdDocumentTitleType(forBuyer, forCorrection);
      return GetExtendedSignerDetails(token, boxId, thumbprint, documentTitleType);
  }

  Signers::ExtendedSignerDetails DiadocApi::GetExtendedSignerDetails(const std::wstring& token, const std::wstring& boxId, const std::wstring& thumbprint, const Signers::DocumentTitleType& documentTitleType)
  {
  	WppTraceDebugOut("GetExtendedSignerDetails...");

  	std::wstringstream queryString;
  	queryString
  		<< L"/V2/ExtendedSignerDetails?boxId=" << StringHelper::CanonicalizeUrl(boxId)
  		<< L"&thumbprint=" << StringHelper::CanonicalizeUrl(thumbprint)
  		<< L"&documentTitleType=" << std::to_wstring(static_cast<int>(documentTitleType));

  	return PerformHttpRequest<Signers::ExtendedSignerDetails>("GET", queryString.str());
  }
  *)
  Result:=nil;
  S:='';
  if ABoxID='' then
    raise EDiadocException.Create(sNotDefinedBoxId);

  if not Authenticate then exit;

  documentTitleType:=CreateUtdDocumentTitleType(AForBuyer, AForCorrection);

  AddURLParam(S, 'boxId', ABoxId); //идентификатор ящика
  AddURLParam(S, 'thumbprint', AThumbprint);
  AddURLParam(S, 'documentTitleType', IntToStr(Ord(documentTitleType))); //идентификатор сущности;



  if SendCommand(hmGET, '/V2/ExtendedSignerDetails', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ExtendedSignerDetails');
    {$ENDIF}
    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TExtendedSignerDetails.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetEntityContent(ABoxID, AMessageId, AEntityId: string
  ): TMemoryStream;
var
  S: String;
begin
  Result:=nil;
  S:='';
  if ABoxID='' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AMessageId='' then
    raise EDiadocException.Create(sNotDefinedMessageId);
  if AEntityId='' then
    raise EDiadocException.Create(sNotDefinedEntityId);

  if not Authenticate then exit;

  AddURLParam(S, 'boxId', ABoxId); //идентификатор ящика
  AddURLParam(S, 'messageId', AMessageId); //идентификатор сообщения
  AddURLParam(S, 'entityId', AEntityId); //идентификатор сущности;



  if SendCommand(hmGET, '/V4/GetEntityContent', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetEntityContent.bin');
    {$ENDIF}
    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetMessage(ABoxID:string; AmessageId:string; AEntityId:string; AOriginalSignature, AInjectEntityContent:boolean): TMessage;
var
  S: String;
begin

  Result:=nil;
  S:='';
  if ABoxID = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AmessageId = '' then
    raise EDiadocException.Create(sNotDefinedMessageId);

  AddURLParam(S, 'boxId', ABoxId); //идентификатор ящика
  AddURLParam(S, 'messageId', AmessageId); //идентификатор сообщения

  if AEntityId<>'' then
    AddURLParam(S, 'entityId', AEntityId); //идентификатор документа из сообщения (может отсутствовать, если указан, то возвращаются не все сущности, а только связанные с данным документом);

  if AOriginalSignature then
    AddURLParam(S, 'originalSignature'); //параметр, указывающий тип возвращаемой подписи (если присутствует, то возвращается оригинальная подпись. Если параметр не передан, то возвращается подпись в формате CADES-T, в этом случае, в качестве родительской сущности будет указана оригинальная подпись).

  if AInjectEntityContent then
    AddURLParam(S, 'injectEntityContent', 'true'); // параметр, указывающий следует ли возвращать содержимое сущностей. Если передано значение true то содержимое сущностей будет добавлено к ответу. Будьте осторожны, если вам не требуется содержимое сущностей, следует передавать false, так как это существенно влияет на производительность (приблизительно в 2-3 раза). Если параметр не передан, будет установлено значение по умолчанию false.

  if not Authenticate then exit;

  if SendCommand(hmGET, '/V4/GetMessage', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetMessage');
    {$ENDIF}
    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMessage.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.PostDiadocMessage(AMsg: TMessageToPost; AOperationId: string
  ): TMessage;
var
  S: String;
  F: TStream;
begin
  (*
      Message DiadocApi::PostDiadocMessage(const MessageToPost& msg, const std::wstring& operationId)
      {
      	WppTraceDebugOut(L"PostDiadocMessage...");
      	std::wstringstream buf;
      	buf << L"/V3/PostMessage";
      	if (!operationId.empty())
      		buf << L"?operationId=" << StringHelper::CanonicalizeUrl(operationId);
      	return FromProtoBytes<Message>(PerformHttpRequest(buf.str(), ToProtoBytes(msg), POST));
      }
  *)
  Result:=nil;
  if not Assigned(AMsg) then
    raise EDiadocException.Create(sNotDefinedMessage);

  if not Authenticate then exit;
  S:='';
  if AOperationId<>'' then
    AddURLParam(S, 'operationId', AOperationId);

  F:=AMsg.SaveToStream;

  if SendCommand(hmPOST, '/V3/PostMessage', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('PostDiadocMessage');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TMessage.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetEvent(ABoxId, AEventId:string):TBoxEvent;
var
  S: String;
begin
  //BoxEvent DiadocApi::GetEvent(const std::wstring& boxId, const std::wstring& eventId)
  {
  	WppTraceDebugOut(L"GetEvent...");
  	std::wstringstream buf;
  	buf << L"/V2/GetEvent?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&eventId=" << StringHelper::CanonicalizeUrl(eventId);
  	return FromProtoBytes<BoxEvent>(PerformHttpRequest(buf.str(), GET));
  }
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if AEventId = '' then
    raise EDiadocException.Create(sNotDefinedEventId);
  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'boxId', ABoxId);  //boxId: идентификатор ящика
  AddURLParam(S, 'eventId', AEventId);  //eventId: идентификатор события;


  if SendCommand(hmGET, '/V2/GetEvent', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetEvent');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TBoxEvent.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;


function TDiadocAPI.GetNewEvents(ABoxId, AAfterEventId: string): TBoxEventList;
var
  S: String;
begin
  //  BoxEventList DiadocApi::GetNewEvents(const std::wstring& boxId, const std::wstring& afterEventId)
    {
    	WppTraceDebugOut(L"GetNewEvents...");
    	std::wstringstream queryString;
    	queryString << L"/V6/GetNewEvents?boxId=" << StringHelper::CanonicalizeUrl(boxId);
    	if (!afterEventId.empty())
    		queryString << L"&afterEventId=" << StringHelper::CanonicalizeUrl(afterEventId);
    	queryString << L"&includeDrafts";
    	return FromProtoBytes<BoxEventList>(PerformHttpRequest(queryString.str(), GET));
    }
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);

  S:='';
  AddURLParam(S, 'boxId', ABoxId);  //boxId: идентификатор ящика
  if AAfterEventId<>'' then
    AddURLParam(S, 'afterEventId', AAfterEventId);  //afterEventId: идентификатор последнего полученного события (может отсутствовать);

  if not Authenticate then exit;

  if SendCommand(hmGET, '/V6/GetNewEvents', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetNewEvents');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TBoxEventList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetDepartment(AOrgId, ADepartmentId: string
  ): DiadocTypes_Organization.TDepartment;
var
  S: String;
begin
  //Department DiadocApi::GetDepartment(const std::wstring& orgId, const std::wstring& departmentId)
  {
  	WppTraceDebugOut("GetDepartment...");
  	std::wstringstream buf;
  	buf << L"/GetDepartment?orgId=" << StringHelper::CanonicalizeUrl(orgId)
  		<< L"&departmentId=" << StringHelper::CanonicalizeUrl(departmentId);
  	return FromProtoBytes<Department>(PerformHttpRequest(buf.str(), GET));
  }
  Result:=nil;
  if AOrgId = '' then
    raise EDiadocException.Create(sNotDefinedOrgId);
  if ADepartmentId = '' then
    raise EDiadocException.Create(sNotDefinedDepartmentId);
  S:='';
  AddURLParam(S, 'orgId', AOrgId);  //orgId: идентификатор организации
  AddURLParam(S, 'departmentId', ADepartmentId);  //departmentId: идентификатор подразделения организации.

  //outputFormat: формат вывода данных, может отсутствовать. Возможные значения: xml, protobuf (по-умолчанию - protobuf).

  if not Authenticate then exit;

  if SendCommand(hmGET, 'GetDepartment', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetDepartment');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TDepartment.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetMyPermissions(AOrgId:string): TOrganizationUserPermissions;
var
  S: String;
begin
  //OrganizationUserPermissions DiadocApi::GetMyPermissions(const std::wstring& orgId)
  {
  	WppTraceDebugOut("GetMyPermissions...");
  	std::wstringstream buf;
  	buf << L"/GetMyPermissions?orgId=" << StringHelper::CanonicalizeUrl(orgId);
  	return FromProtoBytes<OrganizationUserPermissions>(PerformHttpRequest(buf.str(), GET));
  }
  Result:=nil;
  if AOrgId = '' then
    raise EDiadocException.Create(sNotDefinedOrgId);
  S:='';
  AddURLParam(S, 'orgId', AOrgId);  //orgId: идентификатор организации

  if not Authenticate then exit;

  if SendCommand(hmGET, 'GetMyPermissions', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetMyPermissions');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TOrganizationUserPermissions.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetMyUser: TUser;
var
  S: String;
begin
  //Diadoc::Api::Proto::User DiadocApi::GetMyUser()
  {
  	WppTraceDebugOut("GetMyUser...");
  	return FromProtoBytes<Diadoc::Api::Proto::User>(PerformHttpRequest(L"/GetMyUser", GET));
  }
  S:='';
  Result:=nil;

  if not Authenticate then exit;

  if SendCommand(hmGET, 'GetMyUser', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetMyUser');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TUser.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetOrganizationsByInnList(AOrgID: string;
  ARequest: TGetOrganizationsByInnListRequest
  ): TGetOrganizationsByInnListResponse;
var
  S: String;
  F: TStream;
begin
  Result:=nil;
{  if AOrgId = '' then
    raise EDiadocException.Create(sNotDefinedOrgId);}

  if not Assigned(ARequest) then
    raise EDiadocException.Create(sNotDefinedOrganizationsByInnListRequest);

  S:='';

  if AOrgId <>'' then
    AddURLParam(S, 'orgId', AOrgId);  //orgId: идентификатор организации

  if not Authenticate then exit;

  F:=ARequest.SaveToStream;
  if SendCommand(hmPOST, 'GetOrganizationsByInnList', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetOrganizationsByInnList');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TGetOrganizationsByInnListResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  FreeAndNil(F);
end;

function TDiadocAPI.GetOrganizationUsers(AOrgId:string): TOrganizationUsersList;
var
  S: String;
begin
  Result:=nil;
  if AOrgId = '' then
    raise EDiadocException.Create(sNotDefinedOrgId);
  S:='';
  AddURLParam(S, 'orgId', AOrgId);  //orgId: идентификатор организации

  if not Authenticate then exit;

  if SendCommand(hmGET, 'GetOrganizationUsers', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetOrganizationUsers');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TOrganizationUsersList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.SendCommand(AMethod: THttpMethod; ACommand: string;
  AParams: string; AData: TStream): Boolean;
var
  S, SMethod: String;
begin
  if FApiClientId = '' then
    raise EDiadocException.Create(sNotDefindAPIKey);

  FHTTP.Clear;

  if ProxyData.ProxyHost <> '' then
  begin
    FHTTP.ProxyHost:=ProxyData.ProxyHost;
    FHTTP.ProxyPort:=ProxyData.ProxyPort;
    FHTTP.ProxyUser:=ProxyData.ProxyUser;
    FHTTP.ProxyPass:=ProxyData.ProxyPass;
  end
  else
  begin
    FHTTP.ProxyHost:='';
    FHTTP.ProxyPort:='';
    FHTTP.ProxyUser:='';
    FHTTP.ProxyPass:='';
  end;

  FHTTP.KeepAlive:=true;

  S:='ddauth_api_client_id=' + FApiClientId;
  if FAuthToken <> '' then
    S:=S + ',ddauth_token=' + FAuthToken;

  S:='Authorization: DiadocAuth '+S;
  FHTTP.Headers.Insert(0, S);

  if AMethod = hmGET then
    SMethod := 'GET'
  else
  begin
    SMethod := 'POST';
    FHTTP.MimeType := 'application/x-www-form-urlencoded';

    if (not Assigned(AData)) or (AData.Size = 0) then
    begin
      FHTTP.Headers.Insert(0, 'Content-Length: 0');
    end
    else
      FHTTP.Document.LoadFromStream(AData);
  end;

  if AParams <> '' then
    AParams:='?' + AParams;

  Result := FHTTP.HTTPMethod(SMethod, sKonturAPI_URL + ACommand + AParams);
  FHTTP.Document.Position:=0;
  FResultCode := FHTTP.ResultCode;
  FResultString := FHTTP.ResultString;
  if Assigned(FOnHttpStatus) then
    FOnHttpStatus(Self, FHTTP);
end;

function TDiadocAPI.GetOrganizationsByInnKpp(AINN:string; AKPP:string = ''; AIncludeRelations:boolean = false): TOrganizationList;
var
  S: String;
begin
  Result:=nil;
  if AINN = '' then
    raise EDiadocException.Create(sNotDefinedINNGetOrganizationsByInnKpp);

  S:='';
  AddURLParam(S, 'inn', AINN);
  if AKPP <> '' then
    AddURLParam(S, 'kpp', AKPP);

  if AIncludeRelations then
    AddURLParam(S, 'includeRelations', '');

  if S = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);

  if not Authenticate then exit;

  if SendCommand(hmGET, 'GetOrganizationsByInnKpp', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetOrganizationsByInnKpp');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FResultCode = 200 then
    begin
      Result:=TOrganizationList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetBox(const ABoxId: string): TBox;
var
  S: String;
begin
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  S:='';
  AddURLParam(S, 'boxId', ABoxId);


  if not Authenticate then exit;

  if SendCommand(hmGET, 'GetBox', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetMyOrganizations');
    {$ENDIF}
    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TBox.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetDocumentTypes(const ABoxId: string
  ): TGetDocumentTypesResponse;
var
  S: String;
begin
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  S:='';
  AddURLParam(S, 'boxId', ABoxId);


  if not Authenticate then exit;

  if SendCommand(hmGET, 'GetDocumentTypes', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetDocumentTypes');
    {$ENDIF}
    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TGetDocumentTypesResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetDocuments(ABoxId: string;
  ADocumentType: TDocumentTypeFilter; ADocumentClass: TDocumentFilterClass;
  ADocumentStatus: TDocumentFilterStatus;
  ADepartmentId: string;
  ACounteragentBoxId: string;
  AFromDocumentDate: string;
  AToDocumentDate: string;
  AAfterIndexKey: string): TDocumentList;
var
  S, FFilterCategory: String;
begin
  Result:=nil;
  if ABoxId = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);

  S:='';
  FFilterCategory:=DocumentTypeFilter(ADocumentType) + '.' + DocumentClassFilter(ADocumentClass)+DocumentFilterStatusStr(ADocumentStatus);
  AddURLParam(S, 'boxId', ABoxId); //идентификатор ящика, в котором осуществляется поиск документов;
  AddURLParam(S, 'filterCategory', FFilterCategory); //статус, по которому требуется отфильтровать список документов;

  if ACounteragentBoxId <> '' then
    AddURLParam(S, 'counteragentBoxId', ACounteragentBoxId); //идентификатор ящика контрагента, по которому требуется дополнительная фильтрация (может отсутствовать, не имеет смысла при фильтрации внутренних документов);

  if ADepartmentId<>'' then
    AddURLParam(S, 'toDepartmentId', ADepartmentId); //идентификатор подразделения получателя, по которому требуется дополнительная фильтрация (может отсутствовать, имеет смысл только при фильтрации внутренних документов);


  if AFromDocumentDate <> '' then
    AddURLParam(S, 'fromDocumentDate', AFromDocumentDate); //дата документа в формате ДД.ММ.ГГГГ, задающая начальную точку периода, по которому требуется дополнительная фильтрация (может отсутствовать);

  if AToDocumentDate <> '' then
    AddURLParam(S, 'toDocumentDate', AToDocumentDate); //дата документа в формате ДД.ММ.ГГГГ, задающая конечную точку периода, по которому требуется дополнительная фильтрация (может отсутствовать);

  (*
  timestampFromTicks: метка времени, задающая начальную точку периода, по которому требуется дополнительная фильтрация (может отсутствовать);
  timestampToTicks: метка времени, задающая конечную точку периода, по которому требуется дополнительная фильтрация (может отсутствовать);
  excludeSubdepartments: если присутствует - исключить из выборки дочерние подразделения;
  sortDirection: задает порядок сортировки документов в выдаче, принимает одно из значений «Ascending», или «Descending» (может отсутствовать, значение по умолчанию - «Ascending»);
  count:максимальное количество документов в ответе (может отсутствовать, в этом случае в ответе будет не больше 100 документов). Может принимать значения от 0 до 100.
  *)

  if AAfterIndexKey<>'' then
    AddURLParam(S, 'afterIndexKey', AAfterIndexKey); //уникальный ключ документа, позволяющий итерироваться по всему списку документов, удовлетворяющих фильтру (может отсутствовать);

  if not Authenticate then exit;

  if SendCommand(hmGET, '/V3/GetDocuments', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetDocuments');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDocumentList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetDocuments(ADocumentFilter: TDocumentFilter
  ): TDocumentList;
begin
  Result:=nil;
  //
end;

function TDiadocAPI.GetDocument(AboxId, AMessageId, AEntityId: string
  ): TDocument;
var
  S: String;
begin
  Result:=nil;

  if ABoxID = '' then
    raise EDiadocException.Create(sNotDefinedBoxId);

  if AMessageId = '' then
    raise EDiadocException.Create(sNotDefinedMessageId);

  if AEntityId = '' then
    raise EDiadocException.Create(sNotDefinedEntityId);

  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'messageId', AmessageId);
  AddURLParam(S, 'entityId', AentityId);

  if not Authenticate then exit;

  if SendCommand(hmGET, '/V3/GetDocument', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetDocument');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDocument.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.AcquireCounteragent(AMyOrgId: string;
  AMyDepartmentId: string; ARequest: TAcquireCounteragentRequest
  ): TAsyncMethodResult;
var
  S: String;
  F: TStream;
begin
  Result:=nil;

  if (AMyOrgId = '') then
    raise EDiadocException.Create(sNotDefinedMyOrgGetCounteragent);

  S:='';
  AddURLParam(S, 'myOrgId', EncodeURLElement(AMyOrgId));              // идентификатор организации, от имени которой производится инициация отношения партнерства.

  if AMyDepartmentId <> '' then
    AddURLParam(S, 'myDepartmentId', EncodeURLElement(AMyOrgId));     // идентификатор подразделения, от имени которого производится инициация отношения партнерства. Данный параметр запроса может отсутствовать.

  F:=ARequest.SaveToStream;
  F.Free;
  raise ENotImplemented.Create(sNotDefindAPIKey);
end;

function TDiadocAPI.AcquireCounteragentResult(ATaskId: string
  ): TAcquireCounteragentResult;
var
  S: String;
begin
  Result:=nil;
  S:='';
  if (ATaskId = '') then
    raise EDiadocException.Create(sNotDefinedTaskId);

  AddURLParam(S, 'taskId', EncodeURLElement(ATaskId));                       // идентификатор задачи на отправки приглашения контрагенту, полученный в результате выполнения запроса AcquireCounteragent

  if not Authenticate then exit;

  if SendCommand(hmGET, 'AcquireCounteragentResult', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('AcquireCounteragentResult');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      FHTTP.Document.Position:=0;
      Result:=TAcquireCounteragentResult.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

procedure TDiadocAPI.BreakWithCounteragent;
begin
  raise ENotImplemented.Create(sNotDefindAPIKey);
end;

function TDiadocAPI.GetCounteragent(AMyOrgId, ACounteragentOrgId:string):TCounteragent;
var
  S: String;
begin
  Result:=nil;
  if (AMyOrgId = '') then
    raise EDiadocException.Create(sNotDefinedMyOrgGetCounteragent);
  if (ACounteragentOrgId = '') then
    raise EDiadocException.Create(sNotDefinedCounteragentOrgIdGetCounteragent);

  S:='';
  AddURLParam(S, 'myOrgId', EncodeURLElement(AMyOrgId));                       //myOrgId: идентификатор организации, для которой осуществляется поиск контрагента;
  AddURLParam(S, 'counteragentOrgId', EncodeURLElement(ACounteragentOrgId));   //counteragentOrgId: идентификатор организации-контрагента.

  if not Authenticate then exit;

  if SendCommand(hmGET, '/V2/GetCounteragent', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetCounteragent');
    {$ENDIF}

    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TCounteragent.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

{ http://api-docs.diadoc.ru/ru/latest/http/GetCounteragents.html }
function TDiadocAPI.GetCounteragents(myOrgId: string; AReqestCounteragentStatus:TReqestCounteragentStatus; afterIndexKey: string = ''): TCounteragentList;
var
  S: String;
begin
  Result:=nil;
  if myOrgId = '' then
    raise EDiadocException.Create(sNotDefinedOrgId);

  S:='';
  AddURLParam(S, 'myOrgId', EncodeURLElement(myOrgId));

  //counteragentStatus: статус, по которому требуется отфильтровать список контрагентов (может отсутствовать);

  if afterIndexKey<>'' then
    AddURLParam(S, 'afterIndexKey', EncodeURLElement(afterIndexKey)); // уникальный ключ, позволяющий итерироваться по всему списку контрагентов, удовлетворяющих фильтру (может отсутствовать).

  if AReqestCounteragentStatus <> rcsAny then
    AddURLParam(S, 'counteragentStatus', EncodeURLElement(ReqestCounteragentStatusStr(AReqestCounteragentStatus)));

  if not Authenticate then exit;

  if SendCommand(hmGET, '/V2/GetCounteragents', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetCounteragents');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TCounteragentList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetCounteragentCertificates(AMyOrgId, ACounteragentOrgId: string):TCounteragentCertificateList;
var
  S: String;
begin
  Result:=nil;
  if (AMyOrgId = '') then
    raise EDiadocException.Create(sNotDefinedMyOrgGetCounteragentCertificates);
  if (ACounteragentOrgId = '') then
    raise EDiadocException.Create(sNotDefinedCounteragentOrgIdGetCounteragentCertificates);

  S:='';
  AddURLParam(S, 'myOrgId', EncodeURLElement(AMyOrgId));                       //myOrgId: идентификатор организации, от лица которой будет произведен поиск сертификатов контрагента;
  AddURLParam(S, 'counteragentOrgId', EncodeURLElement(ACounteragentOrgId));   //counteragentOrgId: идентификатор организации, для которой осуществляется поиск сертификатов контрагента;

  if not Authenticate then exit;

  if SendCommand(hmGET, '/GetCounteragentCertificates', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetCounteragentCertificates');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TCounteragentCertificateList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetDocflows(ABoxId: string; ARequest: TGetDocflowBatchRequest):TGetDocflowBatchResponse;
var
  S: String;
  F: TStream;
begin
  Result:=nil;
  (*
  {
  	return PerformHttpRequestWithBoxId<GetDocflowBatchRequest, GetDocflowBatchResponse>("GetDocflows", boxId, request);
  }
  *)
  if ABoxID='' then
    raise EDiadocException.Create(sNotDefinedBoxId);
  if not Assigned(ARequest) then Exit;
  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'boxId', ABoxId); //идентификатор ящика

  F:=ARequest.SaveToStream;
  if SendCommand(hmPOST, ' /V2/GetDocflows', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetDocflows');
    {$ENDIF}
    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TGetDocflowBatchResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

procedure TDiadocAPI.GetDocflowsByPacketId;
begin
  raise ENotImplemented.Create(sNotDefindAPIKey);
end;

procedure TDiadocAPI.SearchDocflows;
begin
  raise ENotImplemented.Create(sNotDefindAPIKey);
end;

procedure TDiadocAPI.GetDocflowEvents;
begin
  raise ENotImplemented.Create(sNotDefindAPIKey);
end;

function TDiadocAPI.GetTemplate(ABoxId, ATemplateId, AEntityId: string
  ): TTemplate;
var
  S: String;
begin
  (*
  Template DiadocApi::GetTemplate(const std::wstring& boxId, const std::wstring& templateId, const std::wstring& entityId)
  {
  	WppTraceDebugOut(L"GetTemplate...");
  	std::wstringstream buf;
  	buf	<<	L"/GetTemplate?boxId="	<<	StringHelper::CanonicalizeUrl(boxId) <<	L"&templateId="	<<	StringHelper::CanonicalizeUrl(templateId);
  	if	(!entityId.empty())
  		buf	<<	L"?entityId="	<<	StringHelper::CanonicalizeUrl(entityId);
  	return FromProtoBytes<Template>(PerformHttpRequest(buf.str(), GET));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'templateId', ATemplateId);
  if AEntityId<>'' then
    AddURLParam(S, 'entityId', AEntityId);

  if SendCommand(hmGET, 'GetTemplate', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetTemplate');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TTemplate.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.PostTemplate(ATemplateToPost: TTemplateToPost;
  AOperationId: string): TTemplate;
var
  S: String;
  F: TStream;
begin
  (*
  Template DiadocApi::PostTemplate(const TemplateToPost& templateToPost, const std::wstring& operationId)
  {
  	WppTraceDebugOut(L"PostTemplate...");
  	std::wstringstream buf;
  	buf << L"/PostTemplate";
  	if (!operationId.empty())
  		buf << L"?operationId=" << StringHelper::CanonicalizeUrl(operationId);
  	return FromProtoBytes<Template>(PerformHttpRequest(buf.str(), ToProtoBytes(templateToPost), POST));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  if AOperationId <> '' then
    AddURLParam(S, 'operationId', AOperationId);

  F:=ATemplateToPost.SaveToStream;
  if SendCommand(hmPOST, 'PostTemplate', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('PostTemplate');
    {$ENDIF}
    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TTemplate.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.PostTemplatePatch(const ABoxId: string;
  const ATemplateId: string; const APatch: TTemplatePatchToPost;
  const AOperationId: string): TMessagePatch;
begin
  Result:=nil;
  raise ENotImplemented.Create('PostTemplatePatch');
(*
MessagePatch DiadocApi::PostTemplatePatch(const std::wstring& boxId, const std::wstring& templateId, const TemplatePatchToPost& patch, const std::wstring& operationId)
{
	WppTraceDebugOut(L"PostTemplatePatch...");
	std::wstringstream buf;
	buf << L"/PostTemplatePatch";
	buf << L"?boxId=" << StringHelper::CanonicalizeUrl(boxId);
	buf << L"&templateId=" << StringHelper::CanonicalizeUrl(templateId);
	if (!operationId.empty())
		buf << L"&operationId=" << StringHelper::CanonicalizeUrl(operationId);
	return FromProtoBytes<MessagePatch>(PerformHttpRequest(buf.str(), ToProtoBytes(patch), POST));
}

*)
end;

function TDiadocAPI.TransformTemplateToMessage(
  ATemplateTransformationToPost: TTemplateTransformationToPost;
  AOperationId: string): TMessage;
var
  S: String;
  F: TStream;
begin
  (*
  Message DiadocApi::TransformTemplateToMessage(const TemplateTransformationToPost& templateTransformationToPost, const std::wstring& operationId)
  {
  	WppTraceDebugOut(L"TransformTemplateToMessage...");
  	std::wstringstream buf;
  	buf << L"/TransformTemplateToMessage";
  	if (!operationId.empty())
  		buf << L"?operationId=" << StringHelper::CanonicalizeUrl(operationId);
  	return FromProtoBytes<Message>(PerformHttpRequest(buf.str(), ToProtoBytes(templateTransformationToPost), POST));
  }
  *)
  Result:=nil;
  S:='';
  if AOperationId <> '' then
    AddURLParam(S, 'operationId', AOperationId);

  if not Authenticate then exit;

  F:=ATemplateTransformationToPost.SaveToStream;
  if SendCommand(hmPOST, 'TransformTemplateToMessage', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('TransformTemplateToMessage');
    {$ENDIF}

    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMessage.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GetOrganization(const AOrgId, AFNSParticipantId,
  AINN: string): TOrganization;
var
  S: String;
begin
  Result:=nil;
  S:='';
  if AINN <> '' then
    AddURLParam(S, 'inn', AINN);
  if AOrgId <> '' then
    AddURLParam(S, 'orgId', AOrgId);
  if AFNSParticipantId <> '' then
    AddURLParam(S, 'fnsParticipantId', AFNSParticipantId);

  if S = '' then
    raise EDiadocException.Create(sNotDefinedParamsGetOrganization);

  if not Authenticate then exit;

  if SendCommand(hmGET, 'GetOrganization', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetOrganization');
    {$ENDIF}

    FHTTP.Document.Position:=0;

    if FHTTP.ResultCode = 200 then
    begin
      Result:=TOrganization.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetOrganizationById(const AOrgId: string): TOrganization;
begin
  Result:=GetOrganization(AOrgId, '', '');
end;

function TDiadocAPI.GetOrganizationByInn(const AINN: string): TOrganization;
begin
  Result:=GetOrganization('', '', AINN);
end;

function TDiadocAPI.GetOrganizationByFnsParticipantId(
  const AFNSParticipantId: string): TOrganization;
begin
  Result:=GetOrganization('', AFNSParticipantId, '');
end;

function TDiadocAPI.ParseRussianAddress(AAddress: string): TRussianAddress;
var
  S: String;
begin
  Result:=nil;
  S:='';
  if AAddress <> '' then
    AddURLParam(S, 'address', EncodeURLElement(AAddress));

  if S = '' then
    raise EDiadocException.Create(sNotDefinedAderssForParse);

  if not Authenticate then exit;

  if SendCommand(hmGET, 'ParseRussianAddress', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('ParseRussianAddress');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TRussianAddress.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetMyOrganizations(autoRegister: boolean): TOrganizationList;
var
  S: String;
begin
  Result:=nil;
  if not Authenticate then exit;

  S:='';
  AddURLParam(S, 'autoRegister', BoolToStr(autoRegister, true));
  if SendCommand(hmGET, 'GetMyOrganizations', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetMyOrganizations');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TOrganizationList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetOrganizationFeatures(const ABoxId: string
  ): TOrganizationFeatures;
var
  S: String;
begin
  //Diadoc::Api::Proto::Organizations::OrganizationFeatures DiadocApi::GetOrganizationFeatures(const std::wstring& boxId)
  //{
  //	WppTraceDebugOut("GetOrganizationFeatures...");
  //	std::wstringstream buf;
  //	buf << L"/GetOrganizationFeatures?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //	return FromProtoBytes<Diadoc::Api::Proto::Organizations::OrganizationFeatures>(PerformHttpRequest(buf.str(), GET));
  //}
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  if SendCommand(hmGET, 'GetOrganizationFeatures', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetOrganizationFeatures');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TOrganizationFeatures.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

constructor TDiadocAPI.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHTTP := THTTPSend.Create;
  FHTTP.Protocol:='1.1';

  FProxyData:=TProxyData.Create;
  FResultText:=TStringList.Create;
end;

destructor TDiadocAPI.Destroy;
begin
  FreeAndNil(FResultText);
  FreeAndNil(FProxyData);
  FreeAndNil(FHTTP);
  inherited Destroy;
end;

procedure TDiadocAPI.Clear;
begin
  FAuthToken:='';
end;

function TDiadocAPI.GetBoxes: TBoxList;
var
  S: String;
begin
  (*
  BoxList DiadocApi::GetBoxes()
  {
  	WppTraceDebugOut(L"GetBoxes...");
  	std::wstringstream wss;
  	wss << L"/GetBoxesByAuthToken";
  	return FromProtoBytes<BoxList>(PerformHttpRequest(wss.str(), GET));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  if SendCommand(hmPOST, 'GetBoxesByAuthToken', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetBoxesByAuthToken');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TBoxList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetBoxesByInnKpp(AInn, AKpp: string): TBoxList;
var
  S: String;
begin
  (*
  BoxList DiadocApi::GetBoxesByInnKpp(const std::wstring& inn, const std::wstring& kpp)
  {
  	WppTraceDebugOut(L"GetBoxesByInnKpp...");
  	std::wstringstream buf;
  	buf << L"/GetBoxesByInnKpp?inn=" << StringHelper::CanonicalizeUrl(inn);
  	if (!kpp.empty())
  		buf << L"&kpp=" << StringHelper::CanonicalizeUrl(kpp);
  	return FromProtoBytes<BoxList>(PerformHttpRequest(buf.str(), GET));
  }  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'inn', AInn);
  if AKpp <> '' then
    AddURLParam(S, 'kpp', AKpp);

  if SendCommand(hmPOST, 'GetBoxesByInnKpp', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetBoxesByInnKpp');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TBoxList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetBoxInfo(ABoxId: string): TBoxInfo;
var
  S: String;
begin
  (*
  BoxInfo DiadocApi::GetBoxInfo(const std::wstring& boxId)
  {
  	WppTraceDebugOut(L"GetBoxInfo...");
  	std::wstringstream buf;
  	buf << L"/GetBoxInfo?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  	return FromProtoBytes<BoxInfo>(PerformHttpRequest(buf.str(), GET));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);

  if SendCommand(hmPOST, 'GetBoxInfo', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetBoxInfo');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TBoxInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;
(*
function TDiadocAPI.PostDiadocMessage(AMsg: TMessageToPost; AOperationId: string
  ): TMessage;
var
  S: String;
  F: TStream;
begin
  (*
  Message DiadocApi::PostDiadocMessage(const MessageToPost& msg, const std::wstring& operationId)
  {
  	WppTraceDebugOut(L"PostDiadocMessage...");
  	std::wstringstream buf;
  	buf << L"/V3/PostMessage";
  	if (!operationId.empty())
  		buf << L"?operationId=" << StringHelper::CanonicalizeUrl(operationId);
  	return FromProtoBytes<Message>(PerformHttpRequest(buf.str(), ToProtoBytes(msg), POST));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  if AOperationId <> '' then
    AddURLParam(S, 'operationId', AOperationId);

  F:=AMsg.SaveToStream;
  if SendCommand(hmPOST, '/V3/PostMessage', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('PostMessage');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMessage.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end; *)

function TDiadocAPI.PostMessagePatch(APatch: TMessagePatchToPost;
  AOperationId: string): TMessagePatch;
var
  S: String;
  F: TStream;
begin
  (*
  MessagePatch DiadocApi::PostMessagePatch(const MessagePatchToPost& patch, const std::wstring& operationId)
  {
  	WppTraceDebugOut(L"PostMessagePatch...");
  	std::wstringstream buf;
  	buf << L"/V3/PostMessagePatch";
  	if (!operationId.empty())
  		buf << L"?operationId=" << StringHelper::CanonicalizeUrl(operationId);
  	return FromProtoBytes<MessagePatch>(PerformHttpRequest(buf.str(), ToProtoBytes(patch), POST));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  if AOperationId <> '' then
    AddURLParam(S, 'operationId', AOperationId);

  F:=APatch.SaveToStream;
  if SendCommand(hmPOST, '/V3/PostMessagePatch', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('PostMessagePatch');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMessagePatch.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.PrepareDocumentsToSign(ARequest: TPrepareDocumentsToSignRequest): TPrepareDocumentsToSignResponse;
var
  F: TStream;
  S: String;
begin
  (*
  PrepareDocumentsToSignResponse DiadocApi::PrepareDocumentsToSign(const PrepareDocumentsToSignRequest& request)
  {
  	WppTraceDebugOut("PrepareDocumentsToSign...");
  	DiadocApi::Bytes_t result = PerformHttpRequest(L"/PrepareDocumentsToSign", ToProtoBytes(request), POST);
  	return FromProtoBytes<PrepareDocumentsToSignResponse>(result);
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  F:=ARequest.SaveToStream;
  S:='';
  if SendCommand(hmPOST, 'PrepareDocumentsToSign', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('PrepareDocumentsToSign');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TPrepareDocumentsToSignResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.SendDraft(ARequest: TDraftToSend; AOperationId: string
  ): TMessage;
var
  S: String;
  F: TStream;
begin
  (*
  Message DiadocApi::SendDraft(const DraftToSend& request, const std::wstring& operationId)
  {
  	WppTraceDebugOut(L"SendDraft...");
  	std::wstringstream buf;
  	buf << L"/SendDraft";
  	if (!operationId.empty())
  		buf << L"?operationId=" << StringHelper::CanonicalizeUrl(operationId);
  	return FromProtoBytes<Message>(PerformHttpRequest(buf.str(), ToProtoBytes(request), POST));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  if AOperationId <> '' then
    AddURLParam(S, 'operationId', AOperationId);

  F:=ARequest.SaveToStream;
  if SendCommand(hmPOST, 'SendDraft', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('SendDraft');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMessage.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;

end;

function TDiadocAPI.RecycleDraft(ABoxId, ADraftId: string): boolean;
var
  S: String;
begin
  (*
  void DiadocApi::RecycleDraft(const std::wstring& boxId, const std::wstring& draftId)
  {
  	WppTraceDebugOut(L"RecycleDraft...");
  	std::wstringstream queryString;
  	queryString << L"/RecycleDraft?boxId=" << boxId << L"&draftId=" << draftId;
  	PerformHttpRequest(queryString.str(), POST);
  }
  *)
  Result:=false;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'draftId', ADraftId);

  if SendCommand(hmPOST, 'RecycleDraft', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('RecycleDraft');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    Result:=FHTTP.ResultCode = 200;
    if not Result then
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.Recognize(AFileName: string; AFileContent: TStream): string;
var
  S: String;
begin
  (*
  std::wstring DiadocApi::Recognize(const std::wstring& fileName, const Bytes_t& fileContent)
  {
  	WppTraceDebugOut(L"Recognize...");
  	std::wstringstream wss;
  	wss << L"/Recognize?filename=" << StringHelper::CanonicalizeUrl(fileName);
  	return StringHelper::Utf8ToUtf16(PerformHttpRequestString(wss.str(), fileContent, POST));
  }
  *)
  Result:='';
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'filename', AFileName);

  if SendCommand(hmPOST, 'Recognize', S, AFileContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('Recognize');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      if FHTTP.Document.Size > 0 then
      begin
        SetLength(Result, FHTTP.Document.Size);
        FHTTP.Document.Read(Result[1], FHTTP.Document.Size);
      end;
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;

end;

function TDiadocAPI.GetRecognized(ARecognitionId: string): TRecognized;
var
  S: String;
begin
  (*
  Recognized DiadocApi::GetRecognized(const std::wstring& recognitionId)
  {
  	WppTraceDebugOut("GetRecognized...");
  	std::wstringstream queryString;
  	queryString << L"/GetRecognized?recognitionId=" << StringHelper::CanonicalizeUrl(recognitionId);
  	return FromProtoBytes<Recognized>(PerformHttpRequest(queryString.str(), GET));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'recognitionId', ARecognitionId);

  if SendCommand(hmPOST, 'GetRecognized', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetRecognized');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TRecognized.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetLastEvent(const ABoxId: string): TBoxEvent;
var
  S: String;
begin
(*
  Diadoc::Api::Proto::Events::BoxEvent DiadocApi::GetLastEvent(const std::wstring& boxId)
  {
  	WppTraceDebugOut("GetLastEvent...");
  	std::wstringstream buf;
  	buf << L"/GetLastEvent?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  	return FromProtoBytes<Diadoc::Api::Proto::Events::BoxEvent>(PerformHttpRequest(buf.str(), GET));
  }
*)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  if SendCommand(hmGET, 'GetLastEvent', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetLastEvent');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TBoxEvent.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.DetectCustomPrintForms(const ABoxId: string;
  ARequest: TCustomPrintFormDetectionRequest): TCustomPrintFormDetectionResult;
var
  S: String;
  F: TStream;
begin
  (*
  CustomPrintFormDetectionResult DiadocApi::DetectCustomPrintForms(const std::wstring& boxId, const CustomPrintFormDetectionRequest request)
  {
  	WppTraceDebugOut(L"DetectCustomPrintForms...");
  	std::wstringstream buf;
  	buf << L"/DetectCustomPrintForms";
  	if (!boxId.empty())
  		buf << L"?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  	return FromProtoBytes<CustomPrintFormDetectionResult>(PerformHttpRequest(buf.str(), ToProtoBytes(request), POST));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  F:=ARequest.SaveToStream;
  if SendCommand(hmPOST, 'DetectCustomPrintForms', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('DetectCustomPrintForms');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TCustomPrintFormDetectionResult.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.SendFnsRegistrationMessage(ABoxId: string;
  ACertBytes: TStream): boolean;
var
  S: String;
begin
  (*
  void DiadocApi::SendFnsRegistrationMessage(const std::wstring& boxId, const Bytes_t& certBytes)
  {
  	WppTraceDebugOut("SendFnsRegistrationMessage...");
  	std::wstringstream buf;
  	buf << L"/SendFnsRegistrationMessage?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  	FnsRegistrationMessageInfo regMessageInfo;
  	regMessageInfo.add_certificates(&certBytes[0], certBytes.size());
  	PerformHttpRequest(buf.str(), ToProtoBytes(regMessageInfo), POST);
  }
  *)
  Result:=false;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  if SendCommand(hmPOST, 'SendFnsRegistrationMessage', S, ACertBytes) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('SendFnsRegistrationMessage');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    Result:=FHTTP.ResultCode = 200;
    if not Result then
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;

end;

function TDiadocAPI.GetOrganizationStorageEntries(const ABoxId: String;
  AKeys: TKeyValueStorageApiGetRequest): TKeyValueStorageApiGetResponse;
var
  F: TStream;
  S: String;
begin
  (*
  KeyValueStorageApiGetResponse DiadocApi::GetOrganizationStorageEntries(const std::wstring& boxId, const KeyValueStorageApiGetRequest& keys)
  {
  	WppTraceDebugOut("GetOrganizationStorageEntries...");
  	std::wstringstream buf;
  	buf << L"/V2/KeyValueStorageGet?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  	auto requestBody = ToProtoBytes(keys);
  	return FromProtoBytes<KeyValueStorageApiGetResponse>(PerformHttpRequest(buf.str(), requestBody, POST));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);

  F:=AKeys.SaveToStream;
  if SendCommand(hmPOST, '/V2/KeyValueStorageGet', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('KeyValueStorageGet');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TKeyValueStorageApiGetResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.PutOrganizationStorageEntries(const ABoxId: string;
  AEntries: TKeyValueStorageApiPutRequest): boolean;
var
  S: String;
  F: TStream;
begin
  (*
  void DiadocApi::PutOrganizationStorageEntries(const std::wstring& boxId, const KeyValueStorageApiPutRequest& entries)
  {
  	WppTraceDebugOut("PutOrganizationStorageEntries...");
  	std::wstringstream buf;
  	buf << L"/V2/KeyValueStoragePut?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  	auto requestBody = ToProtoBytes(entries);
  	PerformHttpRequest(buf.str(), requestBody, POST);
  }
  *)
  Result:=false;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  F:=AEntries.SaveToStream;
  if SendCommand(hmPOST, '/V2/KeyValueStoragePut', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('KeyValueStoragePut');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    Result:=FHTTP.ResultCode = 200;
    if not Result then
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.GetSignatureInfo(ABoxId, AMessageId, AEntityId: string
  ): TSignatureInfo;
var
  S: String;
begin
  (*
  SignatureInfo DiadocApi::GetSignatureInfo(const std::wstring& boxId, const std::wstring& messageId, const std::wstring& entityId)
  {
  	WppTraceDebugOut(L"GetSignatureInfo...");
  	std::wstringstream buf;
  	buf << L"/GetSignatureInfo?boxId=" << StringHelper::CanonicalizeUrl(boxId) << L"&messageId=" << StringHelper::CanonicalizeUrl(messageId) << L"&entityId=" << StringHelper::CanonicalizeUrl(entityId);
  	return FromProtoBytes<SignatureInfo>(PerformHttpRequest(buf.str(), GET));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'messageId', AMessageId);
  AddURLParam(S, 'entityId', AEntityId);

  if SendCommand(hmGET, 'GetSignatureInfo', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetSignatureInfo');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TSignatureInfo.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.CloudSign(ARequest: TCloudSignRequest;
  ACertificateThumbprint: string): TAsyncMethodResult;
var
  S: String;
  F: TStream;
begin
  (*
  AsyncMethodResult DiadocApi::CloudSign(const CloudSignRequest& request, const std::wstring& certificateThumbprint)
  {
  	return PerformHttpRequest<CloudSignRequest, AsyncMethodResult>("CloudSign", L"certificateThumbprint=" + StringHelper::CanonicalizeUrl(certificateThumbprint), request);
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  if ACertificateThumbprint<>'' then
    AddURLParam(S, 'certificateThumbprint', ACertificateThumbprint);
  F:=ARequest.SaveToStream;
  if SendCommand(hmPOST, 'CloudSign', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('CloudSign');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TAsyncMethodResult.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.CloudSignResult(ATaskId: string): TCloudSignResult;
var
  S: String;
begin
  (*
  TaskResult<CloudSignResult> DiadocApi::CloudSignResult(const std::wstring& taskId)
  {
  	return PerformAsyncHttpRequest<Diadoc::Api::Proto::CloudSignResult>("CloudSignResult", L"taskId=" + StringHelper::CanonicalizeUrl(taskId), GET);
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'taskId', ATaskId);

  if SendCommand(hmGET, 'CloudSignResult', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('CloudSignResult');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TCloudSignResult.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.CloudSignConfirm(AToken, AConfirmationCode: string
  ): TAsyncMethodResult;
var
  S: String;
begin
  (*
  AsyncMethodResult DiadocApi::CloudSignConfirm(const std::wstring& token, const std::wstring& confirmationCode)
  {
  	return PerformHttpRequest<AsyncMethodResult>("CloudSignConfirm", L"token=" + StringHelper::CanonicalizeUrl(token) + L"&confirmationCode=" + StringHelper::CanonicalizeUrl(confirmationCode));
  }
  *)
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'token', AToken);
  AddURLParam(S, 'confirmationCode', AConfirmationCode);

  if SendCommand(hmPOST, 'CloudSignConfirm', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('CloudSignConfirm');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TAsyncMethodResult.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.CloudSignConfirmResult(ATaskId: string
  ): TCloudSignConfirmResult;
var
  S: String;
begin
  //TaskResult<CloudSignConfirmResult> DiadocApi::CloudSignConfirmResult(const std::wstring& taskId)
  //{
  //	return PerformAsyncHttpRequest<Diadoc::Api::Proto::CloudSignConfirmResult>("CloudSignConfirmResult", L"taskId=" + StringHelper::CanonicalizeUrl(taskId), GET);
  //}
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'taskId', ATaskId);

  if SendCommand(hmGET, 'CloudSignConfirmResult', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('CloudSignConfirmResult');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TCloudSignConfirmResult.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.AutoSignReceipts(ABoxId, ACertificateThumbprint,
  ABatchKey: string): TAsyncMethodResult;
var
  S: String;
begin
  //AsyncMethodResult DiadocApi::AutoSignReceipts(const std::wstring& boxId, const std::wstring& certificateThumbprint, const std::wstring& batchKey)
  //{
  //	std::wstringstream params;
  //	params << "boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //	if (!certificateThumbprint.empty())
  //		params << "&certificateThumbprint=" << StringHelper::CanonicalizeUrl(certificateThumbprint);
  //	if (!batchKey.empty())
  //		params << "&batchKey=" << StringHelper::CanonicalizeUrl(batchKey);
  //	return PerformHttpRequest<AsyncMethodResult>("AutoSignReceipts", params.str());
  //}
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  if ACertificateThumbprint <> '' then
    AddURLParam(S, 'certificateThumbprint', ACertificateThumbprint);
  if ABatchKey <> '' then
    AddURLParam(S, 'batchKey', ABatchKey);

  if SendCommand(hmGET, 'AutoSignReceipts', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('AutoSignReceipts');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TAsyncMethodResult.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.DssSign(const ABoxId: string;
  const ARequest: TDssSignRequest; ACertificateThumbprint: string
  ): TAsyncMethodResult;
var
  S: String;
  F: TStream;
begin
  //AsyncMethodResult DiadocApi::DssSign(const std::wstring& boxId, const DssSignRequest& request, const std::wstring& certificateThumbprint)
  //{
  //	WppTraceDebugOut("DssSign...");
  //	std::wstringstream buf;
  //	buf << L"/DssSign?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //	buf << L"&certificateThumbprint=" << StringHelper::CanonicalizeUrl(certificateThumbprint);
  //	return FromProtoBytes<AsyncMethodResult>(PerformHttpRequest(buf.str(), ToProtoBytes(request), POST));
  //}
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'certificateThumbprint', ACertificateThumbprint);
  F:=ARequest.SaveToStream;
  if SendCommand(hmPOST, 'DssSign', S, F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('DssSign');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TAsyncMethodResult.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

function TDiadocAPI.DssSignResult(const ABoxId: string; const ATaskId: string
  ): TDssSignResult;
var
  S: String;
begin

  //DssSignResult DiadocApi::DssSignResult(const std::wstring& boxId, const std::wstring& taskId)
  //{
  //	WppTraceDebugOut("DssSignResult...");
  //	std::wstringstream buf;
  //	buf << L"/DssSignResult?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //	buf << L"&taskId=" << StringHelper::CanonicalizeUrl(taskId);
  //	return FromProtoBytes<Dss::DssSignResult>(PerformHttpRequest(buf.str(), GET));
  //}


  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'taskId', ATaskId);

  if SendCommand(hmGET, 'DssSignResult', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('DssSignResult');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDssSignResult.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetDocumentsByMessageId(ABoxId, AMessageId: string
  ): TDocumentList;
var
  S: String;
begin
  //DocumentList DiadocApi::GetDocumentsByMessageId(const std::wstring& boxId, const std::wstring& messageId)
  //{
  //	auto queryString = L"/GetDocumentsByMessageId?boxId=" + StringHelper::CanonicalizeUrl(boxId)
  //		+ L"&messageId=" + StringHelper::CanonicalizeUrl(messageId);
  //	auto bytes = PerformHttpRequest(queryString, GET);
  //	return FromProtoBytes<DocumentList>(bytes);
  //}
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'messageId', AMessageId);

  if SendCommand(hmGET, 'GetDocumentsByMessageId', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetDocumentsByMessageId');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDocumentList.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.DetectDocumentTypes(const ABoxId, ANameOnShelf: string
  ): TDetectDocumentTypesResponse;
var
  S: String;
begin
  //DetectDocumentTypesResponse DiadocApi::DetectDocumentTypes(const std::wstring& boxId, const std::wstring& nameOnShelf)
  //{
  //    WppTraceDebugOut("DetectDocumentTypes...");
  //    auto queryString = L"/DetectDocumentTypes?boxId=" + StringHelper::CanonicalizeUrl(boxId)
  //                       + L"&nameOnShelf=" + StringHelper::CanonicalizeUrl(nameOnShelf);
  //    return FromProtoBytes<DetectDocumentTypesResponse>(PerformHttpRequest(queryString, GET));
  //}
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'nameOnShelf', ANameOnShelf);

  if SendCommand(hmGET, 'DetectDocumentTypes', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('DetectDocumentTypes');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDetectDocumentTypesResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.DetectDocumentTitles(const ABoxId: string;
  const NameOnShelf: string): TDetectTitleResponse;
var
  S: String;
begin
  //DetectTitleResponse DiadocApi::DetectDocumentTitles(const std::wstring& boxId, const std::wstring& nameOnShelf)
  //{
  //    WppTraceDebugOut("DetectDocumentTitles...");
  //    auto queryString = L"/DetectDocumentTitles?boxId=" + StringHelper::CanonicalizeUrl(boxId)
  //                       + L"&nameOnShelf=" + StringHelper::CanonicalizeUrl(nameOnShelf);
  //    return FromProtoBytes<DetectTitleResponse>(PerformHttpRequest(queryString, GET));
  //}
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);
  AddURLParam(S, 'nameOnShelf', NameOnShelf);

  if SendCommand(hmGET, 'DetectDocumentTitles', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('DetectDocumentTitles');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDetectTitleResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.DetectDocumentTypes(const ABoxId: string;
  const AContent: TStream): TDetectDocumentTypesResponse;
var
  S: String;
begin
  //DetectDocumentTypesResponse DiadocApi::DetectDocumentTypes(const std::wstring& boxId, const Bytes_t& content)
  //{
  //	WppTraceDebugOut("DetectDocumentTypes...");
  //	std::wstringstream buf;
  //	buf << L"/DetectDocumentTypes?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //	return FromProtoBytes<DetectDocumentTypesResponse>(PerformHttpRequest(buf.str(), content, POST));
  //}
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);

  if SendCommand(hmGET, 'DetectDocumentTypes', S, AContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('DetectDocumentTypes');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDetectDocumentTypesResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.DetectDocumentTitles(const ABoxId: string;
  const AContent: TStream): TDetectTitleResponse;
var
  S: String;
begin
  //DetectTitleResponse DiadocApi::DetectDocumentTitles(const std::wstring& boxId, const Bytes_t& content)
  //{
  //    WppTraceDebugOut("DetectDocumentTitles...");
  //    std::wstringstream buf;
  //    buf << L"/DetectDocumentTitles?boxId=" << StringHelper::CanonicalizeUrl(boxId);
  //    return FromProtoBytes<DetectTitleResponse>(PerformHttpRequest(buf.str(), content, POST));
  //}
  Result:=nil;
  if not Authenticate then exit;
  S:='';
  AddURLParam(S, 'boxId', ABoxId);

  if SendCommand(hmGET, 'DetectDocumentTitles', S, AContent) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('DetectDocumentTitles');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TDetectTitleResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.GetContent(ATypeNamedId, AFunction, AVersion: string;
  ATitleIndex: integer; contentType: TXsdContentType): TMemoryStream;
var
  S: String;
begin
  //DiadocApi::WebFile DiadocApi::GetContent(const std::wstring& typeNamedId, const std::wstring& function, const std::wstring& version, int titleIndex, XsdContentType contentType)
  //{
  //	WppTraceDebugOut("GetContent...");
  //	std::wstringstream buf;
  //	buf << L"/GetContent?typeNamedId=" << StringHelper::CanonicalizeUrl(typeNamedId);
  //	buf << L"&function=" << StringHelper::CanonicalizeUrl(function);
  //	buf << L"&version=" << StringHelper::CanonicalizeUrl(version);
  //	buf << L"&titleIndex=" << titleIndex;
  //	switch (contentType)
  //	{
  //		case TitleXsd: buf << L"&contentType=TitleXsd"; break;
  //		case UserContractXsd: buf << L"&contentType=UserContractXsd"; break;
  //		default: throw std::runtime_error("Invalid XsdContentType value");
  //	}
  //	auto connect = session_.Connect(api_url_.c_str(), api_port_);
  //	auto request = connect.OpenRequest(GET.c_str(), buf.str().c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, connection_flags_);
  //	Bytes_t requestBody;
  //	SendRequest(request, requestBody);
  //	return WebFile(request);
  //}

  Result:=nil;
  S:='';
  AddURLParam(S, 'typeNamedId', ATypeNamedId);
  AddURLParam(S, 'function', AFunction);
  AddURLParam(S, 'version', AVersion);
  AddURLParam(S, 'titleIndex', IntToStr(ATitleIndex));
  case contentType of
    TitleXsd: AddURLParam(S, 'contentType', 'TitleXsd');
    UserContractXsd: AddURLParam(S, 'contentType', 'UserContractXsd');
  else
    raise Exception.Create('Invalid XsdContentType value');
  end;

  if not Authenticate then exit;
  if SendCommand(hmGET, 'GetContent', S, nil) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('GetContent');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TMemoryStream.Create;
      Result.CopyFrom(FHTTP.Document, 0);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
end;

function TDiadocAPI.Register(const ARequest: TRegistrationRequest): TRegistrationResponse;
var
  F: TStream;
begin
  //Diadoc::Api::Proto::Registration::RegistrationResponse DiadocApi::Register(const Diadoc::Api::Proto::Registration::RegistrationRequest& request)
  //{
  //	WppTraceDebugOut("Register...");
  //	DiadocApi::Bytes_t result = PerformHttpRequest(L"/Register", ToProtoBytes(request), POST);
  //	return FromProtoBytes<Diadoc::Api::Proto::Registration::RegistrationResponse>(result);
  //}

  Result:=nil;
  if not Assigned(ARequest) then exit;
  if not Authenticate then exit;
  F:=ARequest.SaveToStream;
  if SendCommand(hmPOST, 'Register', '', F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('Register');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode = 200 then
    begin
      Result:=TRegistrationResponse.Create;
      Result.LoadFromStream(FHTTP.Document);
    end
    else
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

procedure TDiadocAPI.RegisterConfirm(const ARequest: TRegistrationConfirmRequest
  );
var
  F: TStream;
begin
  //void DiadocApi::RegisterConfirm(const Diadoc::Api::Proto::Registration::RegistrationConfirmRequest& request)
  //{
  //	WppTraceDebugOut("RegisterConfirm...");
  //	PerformHttpRequest(L"/RegisterConfirm", ToProtoBytes(request), POST);
  //}
  if not Assigned(ARequest) then exit;
  if not Authenticate then exit;
  F:=ARequest.SaveToStream;
  if SendCommand(hmPOST, 'RegisterConfirm', '', F) then
  begin
    {$IFDEF DIADOC_DEBUG}
    SaveProtobuf('RegisterConfirm');
    {$ENDIF}

    FHTTP.Document.Position:=0;
    if FHTTP.ResultCode <> 200 then
      FResultText.LoadFromStream(FHTTP.Document, TEncoding.UTF8);
  end;
  F.Free;
end;

end.

{ TODO : Необходимо реализовать поддержку авторизации в системе по протоколу V3 - https://github.com/diadoc/diadocsdk-cpp/commit/fffca188f45b8862d5b7369e1b77757a2bf4829d}
