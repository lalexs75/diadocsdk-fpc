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

{ Структуры данных базируются на информации http://api-docs.diadoc.ru/ru/latest/DataStructures.html }

unit DiadocTypes_Document;

{$I diadoc_define.inc}

interface

//import "Content.proto";
//import "DocumentId.proto";
//import "CustomDataItem.proto";
//import "DocumentType.proto";
//import "DocumentDirection.proto";
//import "LockMode.proto";
//import "Documents/AcceptanceCertificateDocument.proto";
//import "Documents/BilateralDocument.proto";
//import "Documents/InvoiceDocument.proto";
//import "Documents/NonformalizedDocument.proto";
//import "Documents/UnilateralDocument.proto";
//import "Documents/UniversalTransferDocument.proto";
//import "ResolutionTarget.proto";
//import "ForwardDocumentEvent.proto";
//import "Events/DiadocMessage-PostApi.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_Content,
  DiadocTypes_DocumentId,
  DiadocTypes_CustomDataItem,
  DiadocTypes_DocumentType,
  DiadocTypes_DocumentDirection,
  DiadocTypes_LockMode,
  DiadocTypes_AcceptanceCertificateDocument,
  DiadocTypes_BilateralDocument,
  DiadocTypes_InvoiceDocument,
  DiadocTypes_NonformalizedDocument,
  DiadocTypes_UnilateralDocument,
  DiadocTypes_UniversalTransferDocument,
  DiadocTypes_ResolutionTarget,
  DiadocTypes_ForwardDocumentEvent,
  DiadocTypes_DiadocMessage_PostApi
  ;

type

  TProxySignatureStatus = (
    UnknownProxySignatureStatus = 0,
    ProxySignatureStatusNone = 1,
    WaitingForProxySignature = 2,
    WithProxySignature = 3,
    ProxySignatureRejected = 4,
    InvalidProxySignature = 5
  );

  TGeneralReceiptStatus = (
    GeneralReceiptStatusUnknown = 0,
    GeneralReceiptStatusNotAcceptable = 1,
    HaveToCreateReceipt = 2,
    WaitingForReceipt = 3,
    Finished = 4
  );

  TRecipientResponseStatus = (
    RecipientResponseStatusUnknown = 0,
    RecipientResponseStatusNotAcceptable = 1,
    WaitingForRecipientSignature = 2,
    WithRecipientSignature = 3,
    RecipientSignatureRequestRejected = 4,
    InvalidRecipientSignature = 5
  );

  TMessageType = (
    Unknown = 0,
    MessageLetter = 1,
    DraftLetter = 2,
    TemplateLetter = 3
  );

  TResolutionStatusType = (
    UnknownResolutionStatus = -1, // Reserved status to report to legacy clients for newly introduced statuses
    None = 0,
    Approved = 1,
    Disapproved = 2,
    ApprovementRequested = 3,
    SignatureRequested = 4,
    SignatureDenied = 5,
    ActionsRequested = 6
  );

  TRevocationStatus = (
    UnknownRevocationStatus = 0, // Reserved status to report to legacy clients for newly introduced statuses
    RevocationStatusNone = 1,
    RevocationIsRequestedByMe = 2,
    RequestsMyRevocation = 3,
    RevocationAccepted = 4,
    RevocationRejected = 5
  );

  TRoamingNotificationStatus = (
    UnknownRoamingNotificationStatus = 0, // Reserved status to report to legacy clients for newly introduced statuses
    RoamingNotificationStatusNone = 1,
    RoamingNotificationStatusSuccess = 2,
    RoamingNotificationStatusError = 3
  );

  TSenderSignatureStatus = (
    UnknownSenderSignatureStatus = 0, // Reserved status to report to legacy clients for newly introduced statuses
    WaitingForSenderSignature = 1,
    SenderSignatureUnchecked = 2,
    SenderSignatureCheckedAndValid = 3,
    SenderSignatureCheckedAndInvalid = 4
  );

  { TOrigin }
  //message Origin {
  //	required MessageType MessageType = 1;
  //	required string MessageId = 2;
  //}
  TOrigin = class(TSerializationObject) //message Origin
  private
    FMessageId: string;
    FMessageType: TMessageType;
    procedure SetMessageId(AValue: string);
    procedure SetMessageType(AValue: TMessageType);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property MessageType:TMessageType read FMessageType write SetMessageType; //1;
    property MessageId:string read FMessageId write SetMessageId; //2;
  end;



  { TAmendmentRequestMetadata }
  //message AmendmentRequestMetadata {
  //	required int32 AmendmentFlags = 1;
  //	required GeneralReceiptStatus ReceiptStatus = 2 [default = GeneralReceiptStatusUnknown];
  //}
  TAmendmentRequestMetadata = class(TSerializationObject)  //message AmendmentRequestMetadata
  private
    FAmendmentFlags: int32;
    FReceiptStatus: TGeneralReceiptStatus;
    procedure SetAmendmentFlags(AValue: int32);
    procedure SetReceiptStatus(AValue: TGeneralReceiptStatus);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property AmendmentFlags:int32 read FAmendmentFlags write SetAmendmentFlags; //1;
    property ReceiptStatus:TGeneralReceiptStatus read FReceiptStatus write SetReceiptStatus default GeneralReceiptStatusUnknown; //2;
  end;



  { TConfirmationMetadata }
  //message ConfirmationMetadata {
  //	required GeneralReceiptStatus ReceiptStatus = 1 [default = GeneralReceiptStatusUnknown];
  //	required sfixed64 DateTimeTicks = 2;
  //}
  TConfirmationMetadata = class(TSerializationObject) //message ConfirmationMetadata
  private
    FDateTimeTicks: sfixed64;
    FReceiptStatus: TGeneralReceiptStatus;
    procedure SetDateTimeTicks(AValue: sfixed64);
    procedure SetReceiptStatus(AValue: TGeneralReceiptStatus);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property ReceiptStatus:TGeneralReceiptStatus read FReceiptStatus write SetReceiptStatus default GeneralReceiptStatusUnknown; //1;
    property DateTimeTicks:sfixed64 read FDateTimeTicks write SetDateTimeTicks; //2;
  end;

  //message SenderReceiptMetadata {
  //    required GeneralReceiptStatus ReceiptStatus = 1 [default = GeneralReceiptStatusUnknown];
  //}

  { TSenderReceiptMetadata }

  TSenderReceiptMetadata = class(TSerializationObject) //message SenderReceiptMetadata
  private
    FReceiptStatus: TGeneralReceiptStatus;
    procedure SetReceiptStatus(AValue: TGeneralReceiptStatus);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property ReceiptStatus:TGeneralReceiptStatus read FReceiptStatus write SetReceiptStatus default GeneralReceiptStatusUnknown;//1;
  end;

  { TRecipientReceiptMetadata }
  //message RecipientReceiptMetadata {
  //	required GeneralReceiptStatus ReceiptStatus = 1 [default = GeneralReceiptStatusUnknown];
  //	optional ConfirmationMetadata ConfirmationMetadata = 2;
  //}
  TRecipientReceiptMetadata = class(TSerializationObject)  //message RecipientReceiptMetadata
  private
    FConfirmationMetadata: TConfirmationMetadata;
    FReceiptStatus: TGeneralReceiptStatus;
    procedure SetReceiptStatus(AValue: TGeneralReceiptStatus);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property ReceiptStatus:TGeneralReceiptStatus read FReceiptStatus write SetReceiptStatus default GeneralReceiptStatusUnknown; //1;
    property ConfirmationMetadata:TConfirmationMetadata read FConfirmationMetadata; //2;
  end;



  { TResolutionStatus }
  //message ResolutionStatus {
  //	optional ResolutionStatusType Type = 1 [default = UnknownResolutionStatus];
  //	optional ResolutionTarget Target = 2;
  //	required string AuthorUserId = 3;
  //	required string AuthorFIO = 4;
  //}
  TResolutionStatus = class(TSerializationObject)  //message ResolutionStatus
  private
    FAuthorFIO: string;
    FAuthorUserId: string;
    FResolutionStatusType: TResolutionStatusType;
    FTarget: TResolutionTarget;
    procedure SetAuthorFIO(AValue: string);
    procedure SetAuthorUserId(AValue: string);
    procedure SetResolutionStatusType(AValue: TResolutionStatusType);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property ResolutionStatusType:TResolutionStatusType read FResolutionStatusType write SetResolutionStatusType default UnknownResolutionStatus; //1
    property Target:TResolutionTarget read FTarget; // 2
    property AuthorUserId:string read FAuthorUserId write SetAuthorUserId; //3
    property AuthorFIO:string read FAuthorFIO write SetAuthorFIO; // 4
  end;


  { TDocument }
  //%message Document {
  //	optional string IndexKey = 1;
  //	required string MessageId = 2;
  //	required string EntityId = 3;
  //	required sfixed64 CreationTimestampTicks = 4;
  //	optional string CounteragentBoxId = 5;
  //	optional DocumentType DocumentType = 6 [default = UnknownDocumentType];
  //	repeated DocumentId InitialDocumentIds = 7;
  //	repeated DocumentId SubordinateDocumentIds = 8;
  //	optional Content Content = 9;
  //	optional string FileName = 10;
  //	optional string DocumentDate = 11;
  //	optional string DocumentNumber = 12;
  //	optional NonformalizedDocument.NonformalizedDocumentMetadata NonformalizedDocumentMetadata = 13;
  //	optional InvoiceDocument.InvoiceMetadata InvoiceMetadata = 14;
  //	optional BilateralDocument.TrustConnectionRequestMetadata TrustConnectionRequestMetadata = 15;
  //	optional BilateralDocument.BasicDocumentMetadata Torg12Metadata = 16;
  //	optional InvoiceDocument.InvoiceRevisionMetadata InvoiceRevisionMetadata = 17;
  //	optional InvoiceDocument.InvoiceCorrectionMetadata InvoiceCorrectionMetadata = 18;
  //	optional InvoiceDocument.InvoiceCorrectionRevisionMetadata InvoiceCorrectionRevisionMetadata = 19;
  //	optional AcceptanceCertificateDocument.AcceptanceCertificateMetadata AcceptanceCertificateMetadata = 20;
  //	optional UnilateralDocument.ProformaInvoiceMetadata ProformaInvoiceMetadata = 21;
  //	optional BilateralDocument.BasicDocumentMetadata XmlTorg12Metadata = 22;
  //	optional BilateralDocument.BasicDocumentMetadata XmlAcceptanceCertificateMetadata = 23;
  //	optional bool IsDeleted = 24 [default = false];
  //	optional string DepartmentId = 25;
  //	optional bool IsTest = 26 [default = false];
  //	optional string FromDepartmentId = 27;
  //	optional string ToDepartmentId = 28;
  //	optional BilateralDocument.PriceListMetadata PriceListMetadata = 29;
  //	optional string CustomDocumentId = 30;
  //	optional ResolutionStatus ResolutionStatus = 31;
  //	optional RevocationStatus RevocationStatus = 32 [default = UnknownRevocationStatus];
  //	optional sfixed64 SendTimestampTicks = 33;
  //	optional sfixed64 DeliveryTimestampTicks = 34;
  //	repeated ForwardDocumentEvent ForwardDocumentEvents = 35;
  //	optional BilateralDocument.BilateralDocumentMetadata ReconciliationActMetadata = 38;
  //	optional BilateralDocument.ContractMetadata ContractMetadata = 39;
  //	optional BilateralDocument.BasicDocumentMetadata Torg13Metadata = 40;
  //	optional UnilateralDocument.ServiceDetailsMetadata ServiceDetailsMetadata = 41;
  //	optional RoamingNotificationStatus RoamingNotificationStatus = 42 [default = UnknownRoamingNotificationStatus];
  //	optional bool HasCustomPrintForm = 43 [default = false];
  //	repeated CustomDataItem CustomData = 44;
  //	optional string PacketId = 45;
  //	optional DocumentDirection DocumentDirection = 46 [default = UnknownDocumentDirection];
  //	optional sfixed64 LastModificationTimestampTicks = 47;
  //	optional bool IsEncryptedContent = 48;
  //	optional SenderSignatureStatus SenderSignatureStatus = 49 [default = UnknownSenderSignatureStatus];
  //	optional BilateralDocument.SupplementaryAgreementMetadata SupplementaryAgreementMetadata = 50;
  //	optional bool IsRead = 51 [default = false];
  //	optional string RoamingNotificationStatusDescription = 52;
  //	optional bool PacketIsLocked = 53 [default = false];
  //	optional NonformalizedDocument.NonformalizedDocumentMetadata PriceListAgreementMetadata = 54;
  //	optional NonformalizedDocument.NonformalizedDocumentMetadata CertificateRegistryMetadata = 55;
  //	optional UniversalTransferDocument.UniversalTransferDocumentMetadata UniversalTransferDocumentMetadata = 56;
  //	optional UniversalTransferDocument.UniversalTransferDocumentRevisionMetadata UniversalTransferDocumentRevisionMetadata = 57;
  //	optional UniversalTransferDocument.UniversalCorrectionDocumentMetadata UniversalCorrectionDocumentMetadata = 58;
  //	optional UniversalTransferDocument.UniversalCorrectionDocumentRevisionMetadata UniversalCorrectionDocumentRevisionMetadata = 59;
  //	optional string ResolutionRouteId = 60 [default = ""];
  //	optional string AttachmentVersion = 61;
  //	optional ProxySignatureStatus ProxySignatureStatus = 62 [default = UnknownProxySignatureStatus];
  //
  //	required string TypeNamedId = 63;
  //	required string Function = 64;
  //	required int32 WorkflowId = 65;
  //	required string Title = 66;
  //	repeated Events.MetadataItem Metadata = 67;
  //	required RecipientReceiptMetadata RecipientReceiptMetadata = 68;
  //	required ConfirmationMetadata ConfirmationMetadata = 69;
  //	required RecipientResponseStatus RecipientResponseStatus = 70 [default = RecipientResponseStatusUnknown];
  //	required AmendmentRequestMetadata AmendmentRequestMetadata = 71;
  //	optional Origin Origin = 72;
  //    optional string EditingSettingId = 73 [default = ""];
  //    required LockMode LockMode = 74 [default = None];
  //    required SenderReceiptMetadata SenderReceiptMetadata = 75;
  //    required string Version = 76;
  //}
  TDocument = class(TSerializationObject)
  private
    FAcceptanceCertificateMetadata: TAcceptanceCertificateMetadata;
    FAmendmentRequestMetadata: TAmendmentRequestMetadata;
    FAttachmentVersion: string;
    FCertificateRegistryMetadata: TNonformalizedDocumentMetadata;
    FConfirmationMetadata: TConfirmationMetadata;
    FContent: TContent;
    FContractMetadata: TContractMetadata;
    FCounteragentBoxId: string;
    FCreationTimestampTicks: sfixed64;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FDeliveryTimestampTicks: sfixed64;
    FDepartmentId: string;
    FDocFunction: string;
    FDocumentDate: string;
    FDocumentDirection: TDocumentDirection;
    FDocumentNumber: string;
    FDocumentType: TDocumentType;
    FEditingSettingId: string;
    FEntityId: string;
    FFileName: string;
    FForwardDocumentEvents: TForwardDocumentEvents;
    FFromDepartmentId: string;
    FHasCustomPrintForm: Boolean;
    FIndexKey: string;
    FInitialDocumentIds: TDocumentIds;
    FInvoiceCorrectionMetadata: TInvoiceCorrectionMetadata;
    FInvoiceCorrectionRevisionMetadata: TInvoiceCorrectionRevisionMetadata;
    FInvoiceMetadata: TInvoiceMetadata;
    FInvoiceRevisionMetadata: TInvoiceRevisionMetadata;
    FIsDeleted: Boolean;
    FIsEncryptedContent: Boolean;
    FIsRead: Boolean;
    FIsTest: Boolean;
    FLastModificationTimestampTicks: sfixed64;
    FLockMode: TLockMode;
    FMessageId: string;
    FMetadata: TMetadataItems;
    FNonformalizedDocumentMetadata: TNonformalizedDocumentMetadata;
    FOrigin: TOrigin;
    FPacketId: string;
    FPacketIsLocked: Boolean;
    FPriceListAgreementMetadata: TNonformalizedDocumentMetadata;
    FPriceListMetadata: TPriceListMetadata;
    FProformaInvoiceMetadata: TProformaInvoiceMetadata;
    FProxySignatureStatus: TProxySignatureStatus;
    FRecipientReceiptMetadata: TRecipientReceiptMetadata;
    FRecipientResponseStatus: TRecipientResponseStatus;
    FReconciliationActMetadata: TBilateralDocumentMetadata;
    FResolutionRouteId: string;
    FResolutionStatus: TResolutionStatus;
    FRevocationStatus: TRevocationStatus;
    FRoamingNotificationStatus: TRoamingNotificationStatus;
    FRoamingNotificationStatusDescription: string;
    FSenderReceiptMetadata: TSenderReceiptMetadata;
    FSenderSignatureStatus: TSenderSignatureStatus;
    FSendTimestampTicks: sfixed64;
    FServiceDetailsMetadata: TServiceDetailsMetadata;
    FSubordinateDocumentIds: TDocumentIds;
    FSupplementaryAgreementMetadata: TSupplementaryAgreementMetadata;
    FTitle: string;
    FToDepartmentId: string;
    FTorg12Metadata: TBasicDocumentMetadata;
    FTorg13Metadata: TBasicDocumentMetadata;
    FTrustConnectionRequestMetadata: TTrustConnectionRequestMetadata;
    FTypeNamedId: string;
    FUniversalCorrectionDocumentMetadata: TUniversalCorrectionDocumentMetadata;
    FUniversalCorrectionDocumentRevisionMetadata: TUniversalCorrectionDocumentRevisionMetadata;
    FUniversalTransferDocumentMetadata: TUniversalTransferDocumentMetadata;
    FUniversalTransferDocumentRevisionMetadata: TUniversalTransferDocumentRevisionMetadata;
    FVersion: string;
    FWorkflowId: int32;
    FXmlAcceptanceCertificateMetadata: TBasicDocumentMetadata;
    FXmlTorg12Metadata: TBasicDocumentMetadata;
    procedure SetAttachmentVersion(AValue: string);
    procedure SetCounteragentBoxId(AValue: string);
    procedure SetCreationTimestampTicks(AValue: sfixed64);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDeliveryTimestampTicks(AValue: sfixed64);
    procedure SetDepartmentId(AValue: string);
    procedure SetDocFunction(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentDirection(AValue: TDocumentDirection);
    procedure SetDocumentNumber(AValue: string);
    procedure SetDocumentType(AValue: TDocumentType);
    procedure SetEditingSettingId(AValue: string);
    procedure SetEntityId(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetFromDepartmentId(AValue: string);
    procedure SetHasCustomPrintForm(AValue: Boolean);
    procedure SetIndexKey(AValue: string);
    procedure SetIsDeleted(AValue: Boolean);
    procedure SetIsEncryptedContent(AValue: Boolean);
    procedure SetIsRead(AValue: Boolean);
    procedure SetIsTest(AValue: Boolean);
    procedure SetLastModificationTimestampTicks(AValue: sfixed64);
    procedure SetLockMode(AValue: TLockMode);
    procedure SetMessageId(AValue: string);
    procedure SetPacketId(AValue: string);
    procedure SetPacketIsLocked(AValue: Boolean);
    procedure SetProxySignatureStatus(AValue: TProxySignatureStatus);
    procedure SetRecipientResponseStatus(AValue: TRecipientResponseStatus);
    procedure SetResolutionRouteId(AValue: string);
    procedure SetRevocationStatus(AValue: TRevocationStatus);
    procedure SetRoamingNotificationStatus(AValue: TRoamingNotificationStatus);
    procedure SetRoamingNotificationStatusDescription(AValue: string);
    procedure SetSenderSignatureStatus(AValue: TSenderSignatureStatus);
    procedure SetSendTimestampTicks(AValue: sfixed64);
    procedure SetTitle(AValue: string);
    procedure SetToDepartmentId(AValue: string);
    procedure SetTypeNamedId(AValue: string);
    procedure SetVersion(AValue: string);
    procedure SetWorkflowId(AValue: int32);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property IndexKey:string read FIndexKey write SetIndexKey;                            //1;
    property MessageId:string read FMessageId write SetMessageId;                         //2;
    property EntityId:string read FEntityId write SetEntityId;                            //3;
    property CreationTimestampTicks:sfixed64 read FCreationTimestampTicks write SetCreationTimestampTicks; //4
    property CounteragentBoxId:string read FCounteragentBoxId write SetCounteragentBoxId; //5
    property DocumentType:TDocumentType read FDocumentType write SetDocumentType default UnknownDocumentType; //6
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;                  //7
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;          //8
    property Content:TContent read FContent;                                            //9;
    property FileName:string read FFileName write SetFileName;                            //10
    property DocumentDate:string read FDocumentDate write SetDocumentDate;                //11
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;          //12
    property NonformalizedDocumentMetadata:TNonformalizedDocumentMetadata read FNonformalizedDocumentMetadata; //13
    property InvoiceMetadata:TInvoiceMetadata read FInvoiceMetadata;                    //14
    property TrustConnectionRequestMetadata:TTrustConnectionRequestMetadata read FTrustConnectionRequestMetadata; //15
    property Torg12Metadata:TBasicDocumentMetadata read FTorg12Metadata;                //16;
    property InvoiceRevisionMetadata:TInvoiceRevisionMetadata read FInvoiceRevisionMetadata;//17
    property InvoiceCorrectionMetadata:TInvoiceCorrectionMetadata read FInvoiceCorrectionMetadata; // 18;
    property InvoiceCorrectionRevisionMetadata:TInvoiceCorrectionRevisionMetadata read FInvoiceCorrectionRevisionMetadata; //19
    property AcceptanceCertificateMetadata:TAcceptanceCertificateMetadata read FAcceptanceCertificateMetadata; //20
    property ProformaInvoiceMetadata:TProformaInvoiceMetadata read FProformaInvoiceMetadata; //21
    property XmlTorg12Metadata:TBasicDocumentMetadata read FXmlTorg12Metadata; //22;
    property XmlAcceptanceCertificateMetadata:TBasicDocumentMetadata read FXmlAcceptanceCertificateMetadata; deprecated 'см. RecipientReceiptMetadata и RecipientResponseStatus'; //23;
    property IsDeleted:Boolean read FIsDeleted write SetIsDeleted; //24
    property DepartmentId:string read FDepartmentId write SetDepartmentId; //25
    property IsTest:Boolean read FIsTest write SetIsTest; //26
    property FromDepartmentId:string read FFromDepartmentId write SetFromDepartmentId; //27
    property ToDepartmentId:string read FToDepartmentId write SetToDepartmentId; //28;
    property PriceListMetadata:TPriceListMetadata read FPriceListMetadata; //29;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId; //30;
    property ResolutionStatus:TResolutionStatus read FResolutionStatus; //31;
    property RevocationStatus:TRevocationStatus read FRevocationStatus write SetRevocationStatus default UnknownRevocationStatus; //32
    property SendTimestampTicks:sfixed64 read FSendTimestampTicks write SetSendTimestampTicks; //33;
    property DeliveryTimestampTicks:sfixed64 read FDeliveryTimestampTicks write SetDeliveryTimestampTicks; //34;
    property ForwardDocumentEvents:TForwardDocumentEvents read FForwardDocumentEvents; // = 35;
    property ReconciliationActMetadata:TBilateralDocumentMetadata read FReconciliationActMetadata; //38
    property ContractMetadata:TContractMetadata read FContractMetadata; //39;

    property Torg13Metadata:TBasicDocumentMetadata read FTorg13Metadata; //40;
    property ServiceDetailsMetadata:TServiceDetailsMetadata read FServiceDetailsMetadata; //41
    property RoamingNotificationStatus:TRoamingNotificationStatus read FRoamingNotificationStatus write SetRoamingNotificationStatus default UnknownRoamingNotificationStatus; // = 42 ;

    property HasCustomPrintForm:Boolean read FHasCustomPrintForm write SetHasCustomPrintForm; //43
    property CustomData:TCustomDataItems read FCustomData; //44
    property PacketId:string read FPacketId write SetPacketId; //45;
    property DocumentDirection:TDocumentDirection read FDocumentDirection write SetDocumentDirection default UnknownDocumentDirection; //46
    property LastModificationTimestampTicks:sfixed64 read FLastModificationTimestampTicks write SetLastModificationTimestampTicks; //47;
    property IsEncryptedContent:Boolean read FIsEncryptedContent write SetIsEncryptedContent; // 48;
    property SenderSignatureStatus:TSenderSignatureStatus read FSenderSignatureStatus write SetSenderSignatureStatus default UnknownSenderSignatureStatus; //49

    property SupplementaryAgreementMetadata:TSupplementaryAgreementMetadata read FSupplementaryAgreementMetadata; //50;
    property IsRead:Boolean read FIsRead write SetIsRead; //51
    property RoamingNotificationStatusDescription:string read FRoamingNotificationStatusDescription write SetRoamingNotificationStatusDescription; //52;
    property PacketIsLocked:Boolean read FPacketIsLocked write SetPacketIsLocked; //53
    property PriceListAgreementMetadata:TNonformalizedDocumentMetadata read FPriceListAgreementMetadata; //54
    property CertificateRegistryMetadata:TNonformalizedDocumentMetadata read FCertificateRegistryMetadata; //55
    property UniversalTransferDocumentMetadata:TUniversalTransferDocumentMetadata read FUniversalTransferDocumentMetadata; //56
    property UniversalTransferDocumentRevisionMetadata:TUniversalTransferDocumentRevisionMetadata read FUniversalTransferDocumentRevisionMetadata; //57
    property UniversalCorrectionDocumentMetadata:TUniversalCorrectionDocumentMetadata read FUniversalCorrectionDocumentMetadata; //58;
    property UniversalCorrectionDocumentRevisionMetadata:TUniversalCorrectionDocumentRevisionMetadata read FUniversalCorrectionDocumentRevisionMetadata; //59;
    property ResolutionRouteId:string read FResolutionRouteId write SetResolutionRouteId;//60
    property AttachmentVersion:string read FAttachmentVersion write SetAttachmentVersion;//61;
    property ProxySignatureStatus:TProxySignatureStatus read FProxySignatureStatus write SetProxySignatureStatus default UnknownProxySignatureStatus;//62
    property TypeNamedId:string read FTypeNamedId write SetTypeNamedId; //63;
    property DocFunction:string read FDocFunction write SetDocFunction; //64;
    property WorkflowId:int32 read FWorkflowId write SetWorkflowId;     //65;
    property Title:string read FTitle write SetTitle;                   //66;
    property Metadata:TMetadataItems read FMetadata; //67;
    property RecipientReceiptMetadata:TRecipientReceiptMetadata read FRecipientReceiptMetadata; //68;
    property ConfirmationMetadata:TConfirmationMetadata read FConfirmationMetadata; //69;
    property RecipientResponseStatus:TRecipientResponseStatus read FRecipientResponseStatus write SetRecipientResponseStatus default RecipientResponseStatusUnknown; //70
    property AmendmentRequestMetadata:TAmendmentRequestMetadata read FAmendmentRequestMetadata; //71;
    property Origin:TOrigin read FOrigin; //72;
    property EditingSettingId:string read FEditingSettingId write SetEditingSettingId;//73 [default = ""];
    property LockMode:TLockMode read FLockMode write SetLockMode; //74;
    property SenderReceiptMetadata:TSenderReceiptMetadata read FSenderReceiptMetadata; //75;
    property Version:string read FVersion write SetVersion;//76;
  end;
  TDocuments = specialize GSerializationObjectList<TDocument>;

function ProxySignatureStatusToStr(AStatus:TProxySignatureStatus):string;
function RevocationStatusToStr(AStatus:TRevocationStatus):string;
function RevocationStatusToHStr(AStatus:TRevocationStatus):string;
function SenderSignatureStatusToStr(AStatus:TSenderSignatureStatus):string;
function MessageTypeToStr(AMessageType:TMessageType):string;
implementation

function ProxySignatureStatusToStr(AStatus:TProxySignatureStatus):string;
begin
  case AStatus of
    UnknownProxySignatureStatus:Result:='UnknownProxySignatureStatus'; // Reserved status to report to legacy clients for newly introduced statuses
    ProxySignatureStatusNone:Result:='ProxySignatureStatusNone';       // Подпись промежуточного получателя не требуется
    WaitingForProxySignature:Result:='WaitingForProxySignature';       // Ожидается подпись промежуточного получателя
    WithProxySignature:Result:='WithProxySignature';                   // Подпись промежуточного получателя проверена и валидна
    ProxySignatureRejected:Result:='ProxySignatureRejected';           // Промежуточный получатель отказал в подписи
    InvalidProxySignature:Result:='InvalidProxySignature';             // Подпись промежуточного получателя проверена и невалидна
  else
    Result:='';
  end;
end;

function RevocationStatusToStr(AStatus:TRevocationStatus):string;
begin
  case AStatus of
    UnknownRevocationStatus : Result:='UnknownRevocationStatus';
    RevocationStatusNone : Result:='RevocationStatusNone';
    RevocationIsRequestedByMe : Result:='RevocationIsRequestedByMe';
    RequestsMyRevocation : Result:='RequestsMyRevocation';
    RevocationAccepted : Result:='RevocationAccepted';
    RevocationRejected : Result:='RevocationRejected';
  else
    Result:='';
  end;
end;

function RoamingNotificationStatusToStr(AStatus:TRoamingNotificationStatus):string;
begin
  case AStatus of
    UnknownRoamingNotificationStatus:Result:='UnknownRoamingNotificationStatus'; //документ не роуминговый, или документ без подтверждения доставки в роуминг
    RoamingNotificationStatusNone:Result:='RoamingNotificationStatusNone';                     //документ с подтверждением успешной доставки в роуминг
    RoamingNotificationStatusSuccess:Result:='RoamingNotificationStatusSuccess';               //документ с ошибкой доставки в роуминг
    RoamingNotificationStatusError:Result:='NotificationStatusError';                   //неизвестный роуминговый статус документа; может выдаваться лишь в случае, когда клиент использует устаревшую версию SDK и не может интерпретировать роуминговый статус документа, переданный сервером
  else
    Result:='';
  end;
end;

function RevocationStatusToHStr(AStatus: TRevocationStatus): string;
begin
  case AStatus of
    UnknownRevocationStatus:Result:='неизвестный статус аннулирования документа; может выдаваться лишь в случае, когда клиент использует устаревшую версию SDK и не может интерпретировать статус аннулирования документа, переданный сервером';
    RevocationStatusNone:Result:='документ не аннулирован, и не было предложений об аннулировании';
    RevocationIsRequestedByMe:Result:='отправлено исходящее предложение об аннулировании документа';
    RequestsMyRevocation:Result:='получено входящее предложение об аннулировании документа';
    RevocationAccepted:Result:='документ аннулирован';
    RevocationRejected:Result:='получен или отправлен отказ от предложения об аннулировании документа';
  else
    Result:='';
  end;
end;

function SenderSignatureStatusToStr(AStatus:TSenderSignatureStatus):string;
begin
  case AStatus of
    UnknownSenderSignatureStatus:Result:='UnknownSenderSignatureStatus';
    WaitingForSenderSignature:Result:='WaitingForSenderSignature';
    SenderSignatureUnchecked:Result:='SenderSignatureUnchecked';
    SenderSignatureCheckedAndValid:Result:='SenderSignatureCheckedAndValid';
    SenderSignatureCheckedAndInvalid:Result:='SenderSignatureCheckedAndInvalid';
  else
    Result:='';
  end;
end;

function MessageTypeToStr(AMessageType: TMessageType): string;
begin
  case AMessageType of
    Unknown:Result:='Не определено';
    MessageLetter:Result:='Letter - письмо';
    DraftLetter:Result:='Draft - черновик';
    TemplateLetter:Result:='Template - шаблон';
  else
    Result:=Format('Не известный тип (%d)', [Ord(AMessageType)]);
  end;
end;

{ TSenderReceiptMetadata }

procedure TSenderReceiptMetadata.SetReceiptStatus(AValue: TGeneralReceiptStatus
  );
begin
  if FReceiptStatus=AValue then Exit;
  FReceiptStatus:=AValue;
  Modified(1);
end;

procedure TSenderReceiptMetadata.InternalInit;
begin
  inherited InternalInit;
  ReceiptStatus:=GeneralReceiptStatusUnknown;
end;

procedure TSenderReceiptMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ReceiptStatus', 1, true);
end;

destructor TSenderReceiptMetadata.Destroy;
begin
  inherited Destroy;
end;

{ TOrigin }

procedure TOrigin.SetMessageId(AValue: string);
begin
  if FMessageId=AValue then Exit;
  FMessageId:=AValue;
  Modified(2);
end;

procedure TOrigin.SetMessageType(AValue: TMessageType);
begin
  if FMessageType=AValue then Exit;
  FMessageType:=AValue;
  Modified(1);
end;

procedure TOrigin.InternalInit;
begin
  inherited InternalInit;
end;

procedure TOrigin.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('MessageType', 1, true);
  RegisterProp('MessageId', 2, true);
end;

{ TAmendmentRequestMetadata }

procedure TAmendmentRequestMetadata.SetAmendmentFlags(AValue: int32);
begin
  if FAmendmentFlags=AValue then Exit;
  FAmendmentFlags:=AValue;
  Modified(1);
end;

procedure TAmendmentRequestMetadata.SetReceiptStatus(
  AValue: TGeneralReceiptStatus);
begin
  if FReceiptStatus=AValue then Exit;
  FReceiptStatus:=AValue;
  Modified(2);
end;

procedure TAmendmentRequestMetadata.InternalInit;
begin
  inherited InternalInit;
  ReceiptStatus:=GeneralReceiptStatusUnknown;
end;

procedure TAmendmentRequestMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('AmendmentFlags', 1, true);
  RegisterProp('ReceiptStatus', 2, true);
end;

{ TConfirmationMetadata }

procedure TConfirmationMetadata.SetDateTimeTicks(AValue: sfixed64);
begin
  if FDateTimeTicks=AValue then Exit;
  FDateTimeTicks:=AValue;
  Modified(2);
end;

procedure TConfirmationMetadata.SetReceiptStatus(AValue: TGeneralReceiptStatus);
begin
  if FReceiptStatus=AValue then Exit;
  FReceiptStatus:=AValue;
  Modified(1);
end;

procedure TConfirmationMetadata.InternalInit;
begin
  inherited InternalInit;
  ReceiptStatus:=GeneralReceiptStatusUnknown;
end;

procedure TConfirmationMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ReceiptStatus', 1, true);
  RegisterProp('DateTimeTicks', 2, true);
end;


{ TRecipientReceiptMetadata }

procedure TRecipientReceiptMetadata.SetReceiptStatus(
  AValue: TGeneralReceiptStatus);
begin
  if FReceiptStatus=AValue then Exit;
  FReceiptStatus:=AValue;
  Modified(1);
end;

procedure TRecipientReceiptMetadata.InternalInit;
begin
  inherited InternalInit;
  FConfirmationMetadata:=TConfirmationMetadata.Create;

  ReceiptStatus:=GeneralReceiptStatusUnknown;
end;

procedure TRecipientReceiptMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ReceiptStatus', 1, true);
  RegisterProp('ConfirmationMetadata', 2);
end;

destructor TRecipientReceiptMetadata.Destroy;
begin
  FreeAndNil(FConfirmationMetadata);
  inherited Destroy;
end;

{ TResolutionStatus }

procedure TResolutionStatus.SetAuthorFIO(AValue: string);
begin
  if FAuthorFIO=AValue then Exit;
  FAuthorFIO:=AValue;
  Modified(4);
end;

procedure TResolutionStatus.SetAuthorUserId(AValue: string);
begin
  if FAuthorUserId=AValue then Exit;
  FAuthorUserId:=AValue;
  Modified(3);
end;

procedure TResolutionStatus.SetResolutionStatusType(
  AValue: TResolutionStatusType);
begin
  if FResolutionStatusType=AValue then Exit;
  FResolutionStatusType:=AValue;
  Modified(1);
end;

procedure TResolutionStatus.InternalInit;
begin
  inherited InternalInit;
  FTarget:=TResolutionTarget.Create;

  ResolutionStatusType:=UnknownResolutionStatus;
end;

procedure TResolutionStatus.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ResolutionStatusType', 1);
  RegisterProp('Target', 2);
  RegisterProp('AuthorUserId', 3, true);
  RegisterProp('AuthorFIO', 4, true);
end;

destructor TResolutionStatus.Destroy;
begin
  FreeAndNil(FTarget);
  inherited Destroy;
end;


{ TDocument }

procedure TDocument.SetCreationTimestampTicks(AValue: sfixed64);
begin
  if FCreationTimestampTicks=AValue then Exit;
  FCreationTimestampTicks:=AValue;
  Modified(4);
end;

procedure TDocument.SetAttachmentVersion(AValue: string);
begin
  if FAttachmentVersion=AValue then Exit;
  FAttachmentVersion:=AValue;
  Modified(61);
end;

procedure TDocument.SetCounteragentBoxId(AValue: string);
begin
  if FCounteragentBoxId=AValue then Exit;
  FCounteragentBoxId:=AValue;
  Modified(5);
end;

procedure TDocument.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(30);
end;

procedure TDocument.SetDeliveryTimestampTicks(AValue: sfixed64);
begin
  if FDeliveryTimestampTicks=AValue then Exit;
  FDeliveryTimestampTicks:=AValue;
  Modified(34);
end;

procedure TDocument.SetDepartmentId(AValue: string);
begin
  if FDepartmentId=AValue then Exit;
  FDepartmentId:=AValue;
  Modified(25);
end;

procedure TDocument.SetDocFunction(AValue: string);
begin
  if FDocFunction=AValue then Exit;
  FDocFunction:=AValue;
  Modified(64);
end;

procedure TDocument.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(11);
end;

procedure TDocument.SetDocumentDirection(AValue: TDocumentDirection);
begin
  if FDocumentDirection=AValue then Exit;
  FDocumentDirection:=AValue;
  Modified(46);
end;

procedure TDocument.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(12);
end;

procedure TDocument.SetDocumentType(AValue: TDocumentType);
begin
  if FDocumentType=AValue then Exit;
  FDocumentType:=AValue;
  Modified(6);;
end;

procedure TDocument.SetEditingSettingId(AValue: string);
begin
  if FEditingSettingId=AValue then Exit;
  FEditingSettingId:=AValue;
  Modified(73);
end;

procedure TDocument.SetEntityId(AValue: string);
begin
  if FEntityId=AValue then Exit;
  FEntityId:=AValue;
  Modified(3);
end;

procedure TDocument.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(10);
end;

procedure TDocument.SetFromDepartmentId(AValue: string);
begin
  if FFromDepartmentId=AValue then Exit;
  FFromDepartmentId:=AValue;
  Modified(27);
end;

procedure TDocument.SetHasCustomPrintForm(AValue: Boolean);
begin
  if FHasCustomPrintForm=AValue then Exit;
  FHasCustomPrintForm:=AValue;
  Modified(43);
end;

procedure TDocument.SetIndexKey(AValue: string);
begin
  if FIndexKey=AValue then Exit;
  FIndexKey:=AValue;
  Modified(1);
end;

procedure TDocument.SetIsDeleted(AValue: Boolean);
begin
  if FIsDeleted=AValue then Exit;
  FIsDeleted:=AValue;
  Modified(24);
end;

procedure TDocument.SetIsEncryptedContent(AValue: Boolean);
begin
  if FIsEncryptedContent=AValue then Exit;
  FIsEncryptedContent:=AValue;
  Modified(48);
end;

procedure TDocument.SetIsRead(AValue: Boolean);
begin
  if FIsRead=AValue then Exit;
  FIsRead:=AValue;
  Modified(51);
end;

procedure TDocument.SetIsTest(AValue: Boolean);
begin
  if FIsTest=AValue then Exit;
  FIsTest:=AValue;
  Modified(26);
end;

procedure TDocument.SetLastModificationTimestampTicks(AValue: sfixed64);
begin
  if FLastModificationTimestampTicks=AValue then Exit;
  FLastModificationTimestampTicks:=AValue;
  Modified(47);
end;

procedure TDocument.SetLockMode(AValue: TLockMode);
begin
  if FLockMode=AValue then Exit;
  FLockMode:=AValue;
  Modified(74);
end;

procedure TDocument.SetMessageId(AValue: string);
begin
  if FMessageId=AValue then Exit;
  FMessageId:=AValue;
  Modified(2);
end;

procedure TDocument.SetPacketId(AValue: string);
begin
  if FPacketId=AValue then Exit;
  FPacketId:=AValue;
  Modified(45);
end;

procedure TDocument.SetPacketIsLocked(AValue: Boolean);
begin
  if FPacketIsLocked=AValue then Exit;
  FPacketIsLocked:=AValue;
  Modified(53);
end;

procedure TDocument.SetProxySignatureStatus(AValue: TProxySignatureStatus);
begin
  if FProxySignatureStatus=AValue then Exit;
  FProxySignatureStatus:=AValue;
  Modified(62);
end;

procedure TDocument.SetRecipientResponseStatus(AValue: TRecipientResponseStatus
  );
begin
  if FRecipientResponseStatus=AValue then Exit;
  FRecipientResponseStatus:=AValue;
  Modified(70);
end;

procedure TDocument.SetResolutionRouteId(AValue: string);
begin
  if FResolutionRouteId=AValue then Exit;
  FResolutionRouteId:=AValue;
  Modified(60);
end;

procedure TDocument.SetRevocationStatus(AValue: TRevocationStatus);
begin
  if FRevocationStatus=AValue then Exit;
  FRevocationStatus:=AValue;
  Modified(32);
end;

procedure TDocument.SetRoamingNotificationStatus(
  AValue: TRoamingNotificationStatus);
begin
  if FRoamingNotificationStatus=AValue then Exit;
  FRoamingNotificationStatus:=AValue;
  Modified(42);
end;

procedure TDocument.SetRoamingNotificationStatusDescription(AValue: string);
begin
  if FRoamingNotificationStatusDescription=AValue then Exit;
  FRoamingNotificationStatusDescription:=AValue;
  Modified(52);
end;

procedure TDocument.SetSenderSignatureStatus(AValue: TSenderSignatureStatus);
begin
  if FSenderSignatureStatus=AValue then Exit;
  FSenderSignatureStatus:=AValue;
  Modified(49);
end;

procedure TDocument.SetSendTimestampTicks(AValue: sfixed64);
begin
  if FSendTimestampTicks=AValue then Exit;
  FSendTimestampTicks:=AValue;
  Modified(33);
end;

procedure TDocument.SetTitle(AValue: string);
begin
  if FTitle=AValue then Exit;
  FTitle:=AValue;
  Modified(66);
end;

procedure TDocument.SetToDepartmentId(AValue: string);
begin
  if FToDepartmentId=AValue then Exit;
  FToDepartmentId:=AValue;
  Modified(28);
end;

procedure TDocument.SetTypeNamedId(AValue: string);
begin
  if FTypeNamedId=AValue then Exit;
  FTypeNamedId:=AValue;
  Modified(63);
end;

procedure TDocument.SetVersion(AValue: string);
begin
  if FVersion=AValue then Exit;
  FVersion:=AValue;
  Modified(76);
end;

procedure TDocument.SetWorkflowId(AValue: int32);
begin
  if FWorkflowId=AValue then Exit;
  FWorkflowId:=AValue;
  Modified(65);
end;

procedure TDocument.InternalInit;
begin
  inherited InternalInit;
  FDocumentType:=UnknownDocumentType;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FContent:=TContent.Create;
  FNonformalizedDocumentMetadata:=TNonformalizedDocumentMetadata.Create;
  FInvoiceMetadata:=TInvoiceMetadata.Create;
  FTrustConnectionRequestMetadata:=TTrustConnectionRequestMetadata.Create;
  FTorg12Metadata:=TBasicDocumentMetadata.Create;
  FInvoiceRevisionMetadata:=TInvoiceRevisionMetadata.Create;
  FInvoiceCorrectionMetadata:=TInvoiceCorrectionMetadata.Create;
  FInvoiceCorrectionRevisionMetadata:=TInvoiceCorrectionRevisionMetadata.Create;
  FAcceptanceCertificateMetadata:=TAcceptanceCertificateMetadata.Create;
  FProformaInvoiceMetadata:=TProformaInvoiceMetadata.Create;
  FXmlTorg12Metadata:=TBasicDocumentMetadata.Create;
  FXmlAcceptanceCertificateMetadata:=TBasicDocumentMetadata.Create;
  FPriceListMetadata:=TPriceListMetadata.Create;
  FForwardDocumentEvents:=TForwardDocumentEvents.Create;
  FResolutionStatus:=TResolutionStatus.Create; //31
  FReconciliationActMetadata:=TBilateralDocumentMetadata.Create;
  FContractMetadata:=TContractMetadata.Create;
  FTorg13Metadata:=TBasicDocumentMetadata.Create;
  FServiceDetailsMetadata:=TServiceDetailsMetadata.Create;
  FCustomData:=TCustomDataItems.Create;
  FSupplementaryAgreementMetadata:=TSupplementaryAgreementMetadata.Create;
  FUniversalTransferDocumentRevisionMetadata:=TUniversalTransferDocumentRevisionMetadata.Create;
  FUniversalCorrectionDocumentMetadata:=TUniversalCorrectionDocumentMetadata.Create;
  FUniversalCorrectionDocumentRevisionMetadata:=TUniversalCorrectionDocumentRevisionMetadata.Create;
  FMetadata:=TMetadataItems.Create;
  FRecipientReceiptMetadata:=TRecipientReceiptMetadata.Create;
  FConfirmationMetadata:=TConfirmationMetadata.Create;
  FAmendmentRequestMetadata:=TAmendmentRequestMetadata.Create;
  FUniversalTransferDocumentMetadata:=TUniversalTransferDocumentMetadata.Create;
  FOrigin:=TOrigin.Create;
  FSenderReceiptMetadata:=TSenderReceiptMetadata.Create;


  DocumentDirection:=UnknownDocumentDirection;
  RevocationStatus:=UnknownRevocationStatus;
  RoamingNotificationStatus:=UnknownRoamingNotificationStatus;
  ProxySignatureStatus:=UnknownProxySignatureStatus;
  RecipientResponseStatus:=RecipientResponseStatusUnknown;
  DocumentType:=UnknownDocumentType;
  SenderSignatureStatus:=UnknownSenderSignatureStatus;
  EditingSettingId:='';
end;

procedure TDocument.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IndexKey', 1);
  RegisterProp('MessageId', 2, true);
  RegisterProp('EntityId', 3, true);
  RegisterProp('CreationTimestampTicks', 4, true);
  RegisterProp('CounteragentBoxId', 5);
  RegisterProp('DocumentType', 6);
  RegisterProp('InitialDocumentIds', 7);
  RegisterProp('SubordinateDocumentIds', 8);
  RegisterProp('Content', 9);
  RegisterProp('FileName', 10);
  RegisterProp('DocumentDate', 11);
  RegisterProp('DocumentNumber', 12);
  RegisterProp('NonformalizedDocumentMetadata', 13);
  RegisterProp('InvoiceMetadata', 14);
  RegisterProp('TrustConnectionRequestMetadata', 15);
  RegisterProp('Torg12Metadata', 16);
  RegisterProp('InvoiceRevisionMetadata', 17);
  RegisterProp('InvoiceCorrectionMetadata', 18);
  RegisterProp('InvoiceCorrectionRevisionMetadata', 19);
  RegisterProp('AcceptanceCertificateMetadata', 20);
  RegisterProp('ProformaInvoiceMetadata', 21);
  RegisterProp('XmlTorg12Metadata', 22);
  RegisterProp('XmlAcceptanceCertificateMetadata', 23);
  RegisterProp('IsDeleted', 24);
  RegisterProp('DepartmentId', 25);
  RegisterProp('IsTest', 26);
  RegisterProp('FromDepartmentId', 27);
  RegisterProp('ToDepartmentId', 28);
  RegisterProp('PriceListMetadata', 29);
  RegisterProp('CustomDocumentId', 30);
  RegisterProp('ResolutionStatus', 31);
  RegisterProp('RevocationStatus', 32);
  RegisterProp('SendTimestampTicks', 33);
  RegisterProp('DeliveryTimestampTicks', 34);
  RegisterProp('ForwardDocumentEvents', 35);
  RegisterProp('ReconciliationActMetadata', 38);
  RegisterProp('ContractMetadata', 39);
  RegisterProp('Torg13Metadata', 40);
  RegisterProp('ServiceDetailsMetadata', 41);
  RegisterProp('RoamingNotificationStatus', 42);
  RegisterProp('HasCustomPrintForm', 43);
  RegisterProp('CustomData', 44);
  RegisterProp('PacketId', 45);
  RegisterProp('DocumentDirection', 46);
  RegisterProp('LastModificationTimestampTicks', 47);
  RegisterProp('IsEncryptedContent', 48);
  RegisterProp('SenderSignatureStatus', 49);
  RegisterProp('SupplementaryAgreementMetadata', 50);
  RegisterProp('IsRead', 51);
  RegisterProp('RoamingNotificationStatusDescription', 52);
  RegisterProp('PacketIsLocked', 53);
  RegisterProp('PriceListAgreementMetadata', 54);
  RegisterProp('CertificateRegistryMetadata', 55);
  RegisterProp('UniversalTransferDocumentMetadata', 56);
  RegisterProp('UniversalTransferDocumentRevisionMetadata', 57);
  RegisterProp('UniversalCorrectionDocumentMetadata', 58);
  RegisterProp('UniversalCorrectionDocumentRevisionMetadata', 59);
  RegisterProp('ResolutionRouteId', 60);
  RegisterProp('AttachmentVersion', 61);
  RegisterProp('ProxySignatureStatus', 62);

  RegisterProp('TypeNamedId', 63, true);
  RegisterProp('DocFunction', 64, true);
  RegisterProp('WorkflowId', 65, true);
  RegisterProp('Title', 66, true);

  RegisterProp('Metadata', 67);
  RegisterProp('RecipientReceiptMetadata', 68, true);
  RegisterProp('ConfirmationMetadata', 69, true);
  RegisterProp('RecipientResponseStatus', 70, true);
  RegisterProp('AmendmentRequestMetadata', 71, true);
  RegisterProp('Origin', 72);
  RegisterProp('EditingSettingId', 73);
  RegisterProp('LockMode', 74, true);
  RegisterProp('SenderReceiptMetadata', 75, true);
  RegisterProp('Version', 76, true);
end;

destructor TDocument.Destroy;
begin
  FreeAndNil(FSenderReceiptMetadata);
  FreeAndNil(FUniversalTransferDocumentMetadata);
  FreeAndNil(FResolutionStatus);   //31
  FreeAndNil(FAmendmentRequestMetadata);
  FreeAndNil(FOrigin);
  FreeAndNil(FConfirmationMetadata);
  FreeAndNil(FRecipientReceiptMetadata);
  FreeAndNil(FMetadata);
  FreeAndNil(FUniversalCorrectionDocumentRevisionMetadata);
  FreeAndNil(FUniversalCorrectionDocumentMetadata);
  FreeAndNil(FUniversalTransferDocumentRevisionMetadata);
  FreeAndNil(FSupplementaryAgreementMetadata);
  FreeAndNil(FCustomData);
  FreeAndNil(FServiceDetailsMetadata);
  FreeAndNil(FTorg13Metadata);
  FreeAndNil(FReconciliationActMetadata);
  FreeAndNil(FContractMetadata);
  FreeAndNil(FForwardDocumentEvents);
  FreeAndNil(FPriceListMetadata);
  FreeAndNil(FProformaInvoiceMetadata);
  FreeAndNil(FXmlTorg12Metadata);
  FreeAndNil(FXmlAcceptanceCertificateMetadata);
  FreeAndNil(FAcceptanceCertificateMetadata);
  FreeAndNil(FInvoiceCorrectionRevisionMetadata);
  FreeAndNil(FInvoiceCorrectionMetadata);
  FreeAndNil(FInvoiceRevisionMetadata);
  FreeAndNil(FTorg12Metadata);
  FreeAndNil(FTrustConnectionRequestMetadata);
  FreeAndNil(FNonformalizedDocumentMetadata);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FContent);
  FreeAndNil(FInvoiceMetadata);
  inherited Destroy;
end;

end.

