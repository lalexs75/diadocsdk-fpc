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
///////////////////////////////////////////////////////////////////////////////
// Протобуферы для читающих методов API:
//	GetEvent(string boxId, Guid eventId) : BoxEvent
//	GetNewEvents(string boxId, Guid afterEventId) : BoxEventList
//	GetMessage(string boxId, Guid messageId) : Message

unit DiadocTypes_DiadocMessage_GetApi;

{$I diadoc_define.inc}

interface

//import "Content.proto";
//import "DocumentId.proto";
//import "LockMode.proto";
//import "TotalCountType.proto";
//import "Documents/Document.proto";
//import "Events/CancellationInfo.proto";
//import "Events/ResolutionInfo.proto";
//import "Events/ResolutionRequestInfo.proto";
//import "Events/ResolutionRequestDenialInfo.proto";
//import "Events/ResolutionRouteInfo.proto";
uses
  Classes, SysUtils,
  protobuf_fpc,
  DiadocTypes_Content,
  DiadocTypes_LockMode,
  TotalCountType,
  DiadocTypes_Document,
  DiadocTypes_CancellationInfo,
  DiadocTypes_ResolutionInfo,
  DiadocTypes_ResolutionRequestInfo,
  DiadocTypes_ResolutionRequestDenialInfo,
  DiadocTypes_ResolutionRouteInfo,
  DiadocTypes_DocumentId,
  OuterDocflow,
  Events_RevocationRequestInfo
  ;

type
  { TemplateRefusalType }
  //enum TemplateRefusalType {
  //	UnknownTemplateRefusalType = 0;
  //	Refusal = 1;
  //	Withdrawal = 2;
  //}
  TTemplateRefusalType = (
    UnknownTemplateRefusalType = 0,
    Refusal = 1,
    Withdrawal = 2
  );


  TEntityType = (
    UnknownEntityType = 0, // Reserved type to report to legacy clients for newly introduced entity types
    Attachment = 1,
    Signature = 2
    //Неизвестные типы должны обрабатываться клиентом как cущность Attachment с типом вложения AttachmentType.Nonformalized
  );

  { AttachmentType }
  //enum AttachmentType {
  //	UnknownAttachmentType = -1; // Reserved attachment type to report to legacy clients for newly introduced attachment types
  //	Nonformalized = 0;
  //	Invoice = 1;
  //	InvoiceReceipt = 2;
  //	InvoiceConfirmation = 3;
  //	InvoiceCorrectionRequest = 4;
  //	AttachmentComment = 5;
  //	DeliveryFailureNotification = 6;
  //	EancomInvoic = 7;
  //	SignatureRequestRejection = 8;
  //	EcrCatConformanceCertificateMetadata = 9;
  //	SignatureVerificationReport = 10;
  //	TrustConnectionRequest = 11;
  //	Torg12 = 12;
  //	InvoiceRevision = 13;
  //	InvoiceCorrection = 14;
  //	InvoiceCorrectionRevision = 15;
  //	AcceptanceCertificate = 16;
  //	StructuredData = 17;
  //	ProformaInvoice = 18;
  //	XmlTorg12 = 19;
  //	XmlAcceptanceCertificate = 20;
  //	XmlTorg12BuyerTitle = 21;
  //	XmlAcceptanceCertificateBuyerTitle = 22;
  //	Resolution = 23;
  //	ResolutionRequest = 24;
  //	ResolutionRequestDenial = 25;
  //	PriceList = 26;
  //	Receipt = 27;
  //	XmlSignatureRejection = 28;
  //	RevocationRequest = 29;
  //	PriceListAgreement = 30;
  //	CertificateRegistry = 34;
  //	ReconciliationAct = 35;
  //	Contract = 36;
  //	Torg13 = 37;
  //	ServiceDetails = 38;
  //	RoamingNotification = 39;
  //	SupplementaryAgreement = 40;
  //	UniversalTransferDocument = 41;
  //	UniversalTransferDocumentBuyerTitle = 42;
  //	UniversalTransferDocumentRevision = 45;
  //	UniversalCorrectionDocument = 49;
  //	UniversalCorrectionDocumentRevision = 50;
  //	UniversalCorrectionDocumentBuyerTitle = 51;
  //	CustomData = 64;
  //	MoveDocument = 65;
  //	ResolutionRouteAssignmentAttachment = 66;
  //	ResolutionRouteRemovalAttachment = 67;
  //	Title = 68;
  //	Cancellation = 69;
  //	Edition = 71;
  //	DeletionRestoration = 72;
  //	TemplateTransformation = 73;
  //	TemplateRefusal = 74;
  //	OuterDocflow = 75;
  //	//Неизвестные типы должны обрабатываться как Title
  //}
  TAttachmentType = (
    UnknownAttachmentType = -1,
    Nonformalized = 0,
    Invoice = 1,
    InvoiceReceipt = 2,
    InvoiceConfirmation = 3,
    InvoiceCorrectionRequest = 4,
    AttachmentComment = 5,
    DeliveryFailureNotification = 6,
    EancomInvoic = 7,
    SignatureRequestRejection = 8,
    EcrCatConformanceCertificateMetadata = 9,
    SignatureVerificationReport = 10,
    TrustConnectionRequest = 11,
    Torg12 = 12,
    InvoiceRevision = 13,
    InvoiceCorrection = 14,
    InvoiceCorrectionRevision = 15,
    AcceptanceCertificate = 16,
    StructuredData = 17,
    ProformaInvoice = 18,
    XmlTorg12 = 19,
    XmlAcceptanceCertificate = 20,
    XmlTorg12BuyerTitle = 21,
    XmlAcceptanceCertificateBuyerTitle = 22,
    Resolution = 23,
    ResolutionRequest = 24,
    ResolutionRequestDenial = 25,
    PriceList = 26,
    Receipt = 27,
    XmlSignatureRejection = 28,
    RevocationRequest = 29,
    PriceListAgreement = 30,
    CertificateRegistry = 34,
    ReconciliationAct = 35,
    Contract = 36,
    Torg13 = 37,
    ServiceDetails = 38,
    RoamingNotification = 39,
    SupplementaryAgreement = 40,
    UniversalTransferDocument = 41,
    UniversalTransferDocumentBuyerTitle = 42,
    UniversalTransferDocumentRevision = 45,
    UniversalCorrectionDocument = 49,
    UniversalCorrectionDocumentRevision = 50,
    UniversalCorrectionDocumentBuyerTitle = 51,
    CustomData = 64,
    MoveDocument = 65,
    ResolutionRouteAssignmentAttachment = 66,
    ResolutionRouteRemovalAttachment = 67,
    Title = 68,
    Cancellation = 69,
    Edition = 71,
    DeletionRestoration = 72,
    TemplateTransformation = 73,
    TemplateRefusal = 74,
    atOuterDocflow = 75
    //Неизвестные типы должны обрабатываться как Title
  );
  TAttachmentTypeArray = array of TAttachmentType;


  {  TTemplateTransformationInfo  }
  //message TemplateTransformationInfo
  //{
  //	optional DocumentId TransformedToDocumentId = 1;
  //	optional string Author = 2;
  //}
  TTemplateTransformationInfo = class(TSerializationObject)
  private
    FAuthor: string;
    FTransformedToDocumentId: TDocumentId;
    procedure SetAuthor(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property TransformedToDocumentId:TDocumentId read FTransformedToDocumentId;//1;
    property Author:string read FAuthor write SetAuthor; //2;
  end;

  {  TEntityPatch  }
  //message EntityPatch {
  //	required string EntityId = 1;
  //	optional bool DocumentIsDeleted = 2 [default = false];
  //	optional string MovedToDepartment = 3;
  //	optional bool DocumentIsRestored = 4 [default = false];
  //	optional bool ContentIsPatched = 5 [default = false];
  //	optional string ForwardedToBoxId = 6;
  //}
  TEntityPatch = class(TSerializationObject)
  private
    FContentIsPatched: Boolean;
    FDocumentIsDeleted: Boolean;
    FDocumentIsRestored: Boolean;
    FEntityId: string;
    FForwardedToBoxId: string;
    FMovedToDepartment: string;
    procedure SetContentIsPatched(AValue: Boolean);
    procedure SetDocumentIsDeleted(AValue: Boolean);
    procedure SetDocumentIsRestored(AValue: Boolean);
    procedure SetEntityId(AValue: string);
    procedure SetForwardedToBoxId(AValue: string);
    procedure SetMovedToDepartment(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property EntityId:string read FEntityId write SetEntityId;//1;
    property DocumentIsDeleted:Boolean read FDocumentIsDeleted write SetDocumentIsDeleted;//2
    property MovedToDepartment:string read FMovedToDepartment write SetMovedToDepartment;//3;
    property DocumentIsRestored:Boolean read FDocumentIsRestored write SetDocumentIsRestored;//4
    property ContentIsPatched:Boolean read FContentIsPatched write SetContentIsPatched;//5
    property ForwardedToBoxId:string read FForwardedToBoxId write SetForwardedToBoxId;//6;
  end;
  TEntityPatchs = specialize GSerializationObjectList<TEntityPatch>;

  { TemplateRefusalInfo }
  //message TemplateRefusalInfo
  //{
  //	required TemplateRefusalType Type = 1 [default = UnknownTemplateRefusalType];
  //	required string BoxId = 2;
  //	optional string Author = 3;
  //	optional string Comment = 4;
  //}
  TTemplateRefusalInfo = class(TSerializationObject)
  private
    FTypeField:TTemplateRefusalType;
    FBoxId:String;
    FAuthor:String;
    FComment:String;
    procedure SetTypeField(AValue:TTemplateRefusalType);
    procedure SetBoxId(AValue:String);
    procedure SetAuthor(AValue:String);
    procedure SetComment(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TypeField:TTemplateRefusalType read FTypeField write SetTypeField default UnknownTemplateRefusalType;
    property BoxId:String read FBoxId write SetBoxId;
    property Author:String read FAuthor write SetAuthor;
    property Comment:String read FComment write SetComment;
  end;
  TTemplateRefusalInfos = specialize GSerializationObjectList<TTemplateRefusalInfo>;

  { TEntity }
  //message Entity {
  //	optional EntityType EntityType = 1 [default = UnknownEntityType];
  //	required string EntityId = 2;
  //	optional string ParentEntityId = 3;
  //	optional Content Content = 4;											// null <=> there is no content for this entity (very unlikely to happen)
  //	optional AttachmentType AttachmentType = 5 [default = UnknownAttachmentType];	// only for EntityType.Attachment
  //	optional string FileName = 6;											// only for EntityType.Attachment
  //	optional bool NeedRecipientSignature = 7 [default = false];				// only for EntityType.Attachment
  //	optional string SignerBoxId = 8;										// only for EntityType.Signature
  //	optional string NotDeliveredEventId = 10;								// only for Attachment/DeliveryFailureNotification
  //	optional Documents.Document DocumentInfo = 11;							// only for EntityType.Attachment
  //	optional sfixed64 RawCreationDate = 12 [default = 0];
  //	optional ResolutionInfo ResolutionInfo = 13;
  //	optional string SignerDepartmentId = 14;								// only for EntityType.Signature
  //	optional ResolutionRequestInfo ResolutionRequestInfo = 15;
  //	optional ResolutionRequestDenialInfo ResolutionRequestDenialInfo = 16;
  //	optional bool NeedReceipt = 17 [default = false];						// only for EntityType.Attachment
  //	optional string PacketId = 18;
  //	optional bool IsApprovementSignature = 19 [default = false];			// only for EntityType.Signature
  //	optional bool IsEncryptedContent = 20 [default = false];
  //	optional string AttachmentVersion = 21;
  //	optional ResolutionRouteAssignmentInfo ResolutionRouteAssignmentInfo = 22; // only for AttachmentType.ResolutionRouteAssignmentAttachment
  //	optional ResolutionRouteRemovalInfo ResolutionRouteRemovalInfo = 23;	// only for AttachmentType.ResolutionRouteRemovalAttachment
  //	optional CancellationInfo CancellationInfo = 24;						// only for AttachmentType.Cancellation
  //	repeated string Labels = 25;
  //    optional string Version = 26;
  //    optional TemplateTransformationInfo TemplateTransformationInfo = 27;
  //    optional TemplateRefusalInfo TemplateRefusalInfo = 28;
  //    optional OuterDocflowInfo OuterDocflow = 29;
  //    optional RevocationRequestInfo RevocationRequestInfo = 30;
  //    optional string ContentTypeId = 31;
  //}
  TEntity  = class(TSerializationObject) //message Entity
  private
    FAttachmentType: TAttachmentType;
    FAttachmentVersion: string;
    FCancellationInfo: TCancellationInfo;
    FContent: TContent;
    FContentTypeId: string;
    FDocumentInfo: TDocument;
    FEntityId: string;
    FEntityType: TEntityType;
    FFileName: string;
    FIsApprovementSignature: Boolean;
    FIsEncryptedContent: Boolean;
    FLabels: TDocumentStrings;
    FNeedReceipt: boolean;
    FNeedRecipientSignature: Boolean;
    FNotDeliveredEventId: string;
    FOuterDocflow: TOuterDocflowInfo;
    FPacketId: string;
    FParentEntityId: string;
    FRawCreationDate: sfixed64;
    FResolutionInfo: TResolutionInfo;
    FResolutionRequestDenialInfo: TResolutionRequestDenialInfo;
    FResolutionRequestInfo: TResolutionRequestInfo;
    FResolutionRouteAssignmentInfo: TResolutionRouteAssignmentInfo;
    FResolutionRouteRemovalInfo: TResolutionRouteRemovalInfo;
    FRevocationRequestInfo: TRevocationRequestInfo;
    FSignerBoxId: string;
    FSignerDepartmentId: string;
    FTemplateRefusalInfo: TTemplateRefusalInfo;
    FTemplateTransformationInfo: TTemplateTransformationInfo;
    FVersion: string;
    procedure SetAttachmentType(AValue: TAttachmentType);
    procedure SetAttachmentVersion(AValue: string);
    procedure SetContentTypeId(AValue: string);
    procedure SetEntityId(AValue: string);
    procedure SetEntityType(AValue: TEntityType);
    procedure SetFileName(AValue: string);
    procedure SetIsApprovementSignature(AValue: Boolean);
    procedure SetIsEncryptedContent(AValue: Boolean);
    procedure SetNeedReceipt(AValue: boolean);
    procedure SetNeedRecipientSignature(AValue: Boolean);
    procedure SetNotDeliveredEventId(AValue: string);
    procedure SetPacketId(AValue: string);
    procedure SetParentEntityId(AValue: string);
    procedure SetRawCreationDate(AValue: sfixed64);
    procedure SetSignerBoxId(AValue: string);
    procedure SetSignerDepartmentId(AValue: string);
    procedure SetVersion(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property EntityType:TEntityType read FEntityType write SetEntityType default UnknownEntityType ;//%1
    property EntityId:string read FEntityId write SetEntityId; //%2;
    property ParentEntityId:string read FParentEntityId write SetParentEntityId; //%3;
    property Content:TContent read FContent; //%4;
    property AttachmentType:TAttachmentType read FAttachmentType write SetAttachmentType default UnknownAttachmentType; //%5
    property FileName:string read FFileName write SetFileName; //%6;
    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write SetNeedRecipientSignature; //%7
    property SignerBoxId:string read FSignerBoxId write SetSignerBoxId; //%8
    property NotDeliveredEventId:string read FNotDeliveredEventId write SetNotDeliveredEventId; //%10
    property DocumentInfo:TDocument read FDocumentInfo; //%11
    property RawCreationDate:sfixed64 read FRawCreationDate write SetRawCreationDate;//%12
    property ResolutionInfo:TResolutionInfo read FResolutionInfo; //%13;
    property SignerDepartmentId:string read FSignerDepartmentId write SetSignerDepartmentId; //%14;
    property ResolutionRequestInfo:TResolutionRequestInfo read FResolutionRequestInfo; //%15;
    property ResolutionRequestDenialInfo:TResolutionRequestDenialInfo read FResolutionRequestDenialInfo; //%16;
    property NeedReceipt:boolean read FNeedReceipt write SetNeedReceipt; //%17
    property PacketId:string read FPacketId write SetPacketId; //%18;
    property IsApprovementSignature:Boolean read FIsApprovementSignature write SetIsApprovementSignature; //%19
    property IsEncryptedContent:Boolean read FIsEncryptedContent write SetIsEncryptedContent; //%20
    property AttachmentVersion:string read FAttachmentVersion write SetAttachmentVersion; //%21;
    property ResolutionRouteAssignmentInfo:TResolutionRouteAssignmentInfo read FResolutionRouteAssignmentInfo;//%22
    property ResolutionRouteRemovalInfo:TResolutionRouteRemovalInfo read FResolutionRouteRemovalInfo; //%23
    property CancellationInfo:TCancellationInfo read FCancellationInfo; //%24
    property Labels:TDocumentStrings read FLabels; //%25;
    property Version:string read FVersion write SetVersion;//%26;
    property TemplateTransformationInfo:TTemplateTransformationInfo read FTemplateTransformationInfo;//%27
    property TemplateRefusalInfo:TTemplateRefusalInfo read FTemplateRefusalInfo; //%28
    property OuterDocflow:TOuterDocflowInfo read FOuterDocflow; //%29
    property RevocationRequestInfo:TRevocationRequestInfo read FRevocationRequestInfo;//%30;
    property ContentTypeId:string read FContentTypeId write SetContentTypeId; //%31;
  end;
  TEntitys = specialize GSerializationObjectList<TEntity>;

  {  TMessagePatch  }
  //message MessagePatch {
  //	required string MessageId = 1;
  //	required sfixed64 TimestampTicks = 2;	// DateTime.Ticks in UTC
  //	repeated Entity Entities = 3;
  //	optional bool ForDraft = 4 [default = false];
  //	optional bool DraftIsRecycled = 5 [default = false];
  //	repeated string DraftIsTransformedToMessageIdList = 6;
  //	optional bool DraftIsLocked = 7 [default = false];
  //	optional bool MessageIsDeleted = 8 [default = false];
  //	repeated EntityPatch EntityPatches = 9;
  //	optional bool MessageIsRestored = 10 [default = false];
  //	optional bool MessageIsDelivered = 11 [default = false];
  //	optional string DeliveredPatchId = 12;
  //	required string PatchId = 13;
  //
  //    required Documents.MessageType MessageType = 15;
  //}
  TMessagePatch = class(TSerializationObject)
  private
    FDeliveredPatchId: string;
    FDraftIsLocked: Boolean;
    FDraftIsRecycled: Boolean;
    FDraftIsTransformedToMessageIdList: TDocumentStrings;
    FEntities: TEntitys;
    FEntityPatches: TEntityPatchs;
    FForDraft: Boolean;
    FMessageId: string;
    FMessageIsDeleted: Boolean;
    FMessageIsDelivered: Boolean;
    FMessageIsRestored: Boolean;
    FMessageType: TMessageType;
    FPatchId: string;
    FTimestampTicks: sfixed64;
    procedure SetDeliveredPatchId(AValue: string);
    procedure SetDraftIsLocked(AValue: Boolean);
    procedure SetDraftIsRecycled(AValue: Boolean);
    procedure SetForDraft(AValue: Boolean);
    procedure SetMessageId(AValue: string);
    procedure SetMessageIsDeleted(AValue: Boolean);
    procedure SetMessageIsDelivered(AValue: Boolean);
    procedure SetMessageIsRestored(AValue: Boolean);
    procedure SetMessageType(AValue: TMessageType);
    procedure SetPatchId(AValue: string);
    procedure SetTimestampTicks(AValue: sfixed64);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property MessageId:string read FMessageId write SetMessageId;//1;
    property TimestampTicks:sfixed64 read FTimestampTicks write SetTimestampTicks;// = 2;
    property Entities:TEntitys read FEntities; //3;
    property ForDraft:Boolean read FForDraft write SetForDraft;//4
    property DraftIsRecycled:Boolean read FDraftIsRecycled write SetDraftIsRecycled;//5
    property DraftIsTransformedToMessageIdList:TDocumentStrings read FDraftIsTransformedToMessageIdList;//6;
    property DraftIsLocked:Boolean read FDraftIsLocked write SetDraftIsLocked;//7
    property MessageIsDeleted:Boolean read FMessageIsDeleted write SetMessageIsDeleted;//8
    property EntityPatches:TEntityPatchs read FEntityPatches;//9;
    property MessageIsRestored:Boolean read FMessageIsRestored write SetMessageIsRestored;//10
    property MessageIsDelivered:Boolean read FMessageIsDelivered write SetMessageIsDelivered;//11
    property DeliveredPatchId:string read FDeliveredPatchId write SetDeliveredPatchId;//12;
    property PatchId:string read FPatchId write SetPatchId;//13;
    property MessageType:TMessageType read FMessageType write SetMessageType;//15;
  end;


  {  TTemplate  }
  //message Template {
  //    required string MessageId = 1;
  //    required sfixed64 TimestampTicks = 2;
  //    required string FromBoxId = 3;
  //    required string ToBoxId = 4;
  //    required string MessageFromBoxId = 5;
  //    required string MessageToBoxId = 6;
  //    repeated Entity Entities = 7;
  //    optional bool IsDeleted = 8 [default = false];
  //    optional string MessageToDepartmentId = 9;
  //    required LockMode LockMode = 10;
  //    optional string MessageProxyBoxId = 11;
  //    optional string MessageProxyDepartmentId = 12;
  //    optional bool IsReusable = 13 [default = false];
  //}
  TTemplate = class(TSerializationObject)
  private
    FEntities: TEntitys;
    FFromBoxId: string;
    FIsDeleted: Boolean;
    FIsReusable: Boolean;
    FLockMode: TLockMode;
    FMessageFromBoxId: string;
    FMessageId: string;
    FMessageProxyBoxId: string;
    FMessageProxyDepartmentId: string;
    FMessageToBoxId: string;
    FMessageToDepartmentId: string;
    FTimestampTicks: sfixed64;
    FToBoxId: string;
    procedure SetFromBoxId(AValue: string);
    procedure SetIsDeleted(AValue: Boolean);
    procedure SetIsReusable(AValue: Boolean);
    procedure SetLockMode(AValue: TLockMode);
    procedure SetMessageFromBoxId(AValue: string);
    procedure SetMessageId(AValue: string);
    procedure SetMessageProxyBoxId(AValue: string);
    procedure SetMessageProxyDepartmentId(AValue: string);
    procedure SetMessageToBoxId(AValue: string);
    procedure SetMessageToDepartmentId(AValue: string);
    procedure SetTimestampTicks(AValue: sfixed64);
    procedure SetToBoxId(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property MessageId:string read FMessageId write SetMessageId;//1;
    property TimestampTicks:sfixed64 read FTimestampTicks write SetTimestampTicks;//2;
    property FromBoxId:string read FFromBoxId write SetFromBoxId;//3;
    property ToBoxId:string read FToBoxId write SetToBoxId;//4;
    property MessageFromBoxId:string read FMessageFromBoxId write SetMessageFromBoxId;//5;
    property MessageToBoxId:string read FMessageToBoxId write SetMessageToBoxId;//6;
    property Entities:TEntitys read FEntities;//7;
    property IsDeleted:Boolean read FIsDeleted write SetIsDeleted;//8
    property MessageToDepartmentId:string read FMessageToDepartmentId write SetMessageToDepartmentId;//9;
    property LockMode:TLockMode read FLockMode write SetLockMode; //10;
    property MessageProxyBoxId:string read FMessageProxyBoxId write SetMessageProxyBoxId;//11;
    property MessageProxyDepartmentId:string read FMessageProxyDepartmentId write SetMessageProxyDepartmentId;//12;
    property IsReusable:Boolean read FIsReusable write SetIsReusable; //13 [default = false];
  end;

  { TTemplateToLetterTransformationInfo }
  //%message TemplateToLetterTransformationInfo
  //{
  //	required string LetterFromBoxId = 1;
  //	required string LetterToBoxId = 2;
  //	optional string LetterFromDepartmentId = 3;
  //	optional string LetterToDepartmentId = 4;
  //    optional string LetterProxyBoxId = 5;
  //    optional string LetterProxyDepartmentId = 6;
  //}
  TTemplateToLetterTransformationInfo = class(TSerializationObject)
  private
    FLetterFromBoxId: string;
    FLetterFromDepartmentId: string;
    FLetterProxyBoxId: string;
    FLetterProxyDepartmentId: string;
    FLetterToBoxId: string;
    FLetterToDepartmentId: string;
    procedure SetLetterFromBoxId(AValue: string);
    procedure SetLetterFromDepartmentId(AValue: string);
    procedure SetLetterProxyBoxId(AValue: string);
    procedure SetLetterProxyDepartmentId(AValue: string);
    procedure SetLetterToBoxId(AValue: string);
    procedure SetLetterToDepartmentId(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property LetterFromBoxId:string read FLetterFromBoxId write SetLetterFromBoxId;//1;
    property LetterToBoxId:string read FLetterToBoxId write SetLetterToBoxId;//2;
    property LetterFromDepartmentId:string read FLetterFromDepartmentId write SetLetterFromDepartmentId;//3;
    property LetterToDepartmentId:string read FLetterToDepartmentId write SetLetterToDepartmentId;//4;
    property LetterProxyBoxId:string read FLetterProxyBoxId write SetLetterProxyBoxId;//5;
    property LetterProxyDepartmentId:string read FLetterProxyDepartmentId write SetLetterProxyDepartmentId;//6;
  end;

  {  TMessage  }
  //%message Message {
  //	required string MessageId = 1;
  //	required sfixed64 TimestampTicks = 2;			// DateTime.Ticks in UTC
  //	required sfixed64 LastPatchTimestampTicks = 3;	// DateTime.Ticks in UTC
  //	required string FromBoxId = 4;
  //	required string FromTitle = 5;
  //	optional string ToBoxId = 6;
  //	optional string ToTitle = 7;
  //	repeated Entity Entities = 8;
  //	optional bool IsDraft = 9 [default = false];
  //	optional bool DraftIsLocked = 10 [default = false];
  //	optional bool DraftIsRecycled = 11 [default = false];
  //	optional string CreatedFromDraftId = 12;
  //	repeated string DraftIsTransformedToMessageIdList = 13;
  //	optional bool IsDeleted = 14 [default = false];
  //	optional bool IsTest = 15 [default = false];
  //	optional bool IsInternal = 16 [default = false];
  //	optional bool IsProxified = 17 [default = false];
  //	optional string ProxyBoxId = 18;
  //	optional string ProxyTitle = 19;
  //	optional bool PacketIsLocked = 20 [default = false];
  //    required LockMode LockMode = 21 [default = None];
  //    required Documents.MessageType MessageType = 22;
  //    optional TemplateToLetterTransformationInfo TemplateToLetterTransformationInfo = 23;
  //    optional bool IsReusable = 24 [default = false];
  //}
  TMessage  = class(TSerializationObject) //message Message {
  private
    FCreatedFromDraftId: string;
    FDraftIsLocked: Boolean;
    FDraftIsRecycled: Boolean;
    FDraftIsTransformedToMessageIdList: TDocumentStrings;
    FEntities: TEntitys;
    FFromBoxId: string;
    FFromTitle: string;
    FIsDeleted: Boolean;
    FIsDraft: Boolean;
    FIsInternal: Boolean;
    FIsProxified: Boolean;
    FIsReusable: Boolean;
    FIsTest: Boolean;
    FLastPatchTimestampTicks: sfixed64;
    FLockMode: TLockMode;
    FMessageId: string;
    FMessageType: TMessageType;
    FPacketIsLocked: Boolean;
    FProxyBoxId: string;
    FProxyTitle: string;
    FTemplateToLetterTransformationInfo: TTemplateToLetterTransformationInfo;
    FTimestampTicks: sfixed64;
    FToBoxId: string;
    FToTitle: string;
    procedure SetCreatedFromDraftId(AValue: string);
    procedure SetDraftIsLocked(AValue: Boolean);
    procedure SetDraftIsRecycled(AValue: Boolean);
    procedure SetFromBoxId(AValue: string);
    procedure SetFromTitle(AValue: string);
    procedure SetIsDeleted(AValue: Boolean);
    procedure SetIsDraft(AValue: Boolean);
    procedure SetIsInternal(AValue: Boolean);
    procedure SetIsProxified(AValue: Boolean);
    procedure SetIsReusable(AValue: Boolean);
    procedure SetIsTest(AValue: Boolean);
    procedure SetLastPatchTimestampTicks(AValue: sfixed64);
    procedure SetLockMode(AValue: TLockMode);
    procedure SetMessageId(AValue: string);
    procedure SetMessageType(AValue: TMessageType);
    procedure SetPacketIsLocked(AValue: Boolean);
    procedure SetProxyBoxId(AValue: string);
    procedure SetProxyTitle(AValue: string);
    procedure SetTimestampTicks(AValue: sfixed64);
    procedure SetToBoxId(AValue: string);
    procedure SetToTitle(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property MessageId:string read FMessageId write SetMessageId; //%1
    property TimestampTicks:sfixed64 read FTimestampTicks write SetTimestampTicks; //%2
    property LastPatchTimestampTicks:sfixed64 read FLastPatchTimestampTicks write SetLastPatchTimestampTicks; //%3
    property FromBoxId:string read FFromBoxId write SetFromBoxId; //%4
    property FromTitle:string read FFromTitle write SetFromTitle; //%5
    property ToBoxId:string read FToBoxId write SetToBoxId; //%6
    property ToTitle:string read FToTitle write SetToTitle; //%7
    property Entities:TEntitys read FEntities; //%8
    property IsDraft:Boolean read FIsDraft write SetIsDraft; //%9
    property DraftIsLocked:Boolean read FDraftIsLocked write SetDraftIsLocked; //%10
    property DraftIsRecycled:Boolean read FDraftIsRecycled write SetDraftIsRecycled; //%11
    property CreatedFromDraftId:string read FCreatedFromDraftId write SetCreatedFromDraftId; //%12
    property DraftIsTransformedToMessageIdList:TDocumentStrings read FDraftIsTransformedToMessageIdList;//%13
    property IsDeleted:Boolean read FIsDeleted write SetIsDeleted; //%14
    property IsTest:Boolean read FIsTest write SetIsTest; //%15
    property IsInternal:Boolean read FIsInternal write SetIsInternal; //%16
    property IsProxified:Boolean read FIsProxified write SetIsProxified; //%17
    property ProxyBoxId:string read FProxyBoxId write SetProxyBoxId; //%18
    property ProxyTitle:string read FProxyTitle write SetProxyTitle; //%19
    property PacketIsLocked:Boolean read FPacketIsLocked write SetPacketIsLocked; //%20
    property LockMode:TLockMode read FLockMode write SetLockMode;//%21
    property MessageType:TMessageType read FMessageType write SetMessageType; //%22
    property TemplateToLetterTransformationInfo:TTemplateToLetterTransformationInfo read FTemplateToLetterTransformationInfo; //%23
    property IsReusable:Boolean read FIsReusable write SetIsReusable; //24 [default = false];
  end;


  {  TBoxEvent  }
  //message BoxEvent {
  //	required string EventId = 1;
  //	optional Message Message = 2;
  //	optional MessagePatch Patch = 3;
  //}
  TBoxEvent = class(TSerializationObject)
  private
    FEventId: string;
    FMessage: TMessage;
    FPatch: TMessagePatch;
    procedure SetEventId(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property EventId:string read FEventId write SetEventId;//1;
    property Message:TMessage read FMessage;//2;
    property Patch:TMessagePatch read FPatch; //3;
  end;

  TBoxEvents = specialize GSerializationObjectList<TBoxEvent>;

  {  TBoxEventList  }
  //message BoxEventList {
  //	repeated BoxEvent Events = 1;
  //	optional int32 TotalCount = 2;
  //    required TotalCountType TotalCountType = 3;
  //}
  TBoxEventList = class(TSerializationObject)
  private
    FEvents: TBoxEvents;
    FTotalCount: int32;
    FTotalCountType: TTotalCountType;
    procedure SetTotalCount(AValue: int32);
    procedure SetTotalCountType(AValue: TTotalCountType);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Events:TBoxEvents read FEvents;//1;
    property TotalCount:int32 read FTotalCount write SetTotalCount;//2;
    property TotalCountType:TTotalCountType read FTotalCountType write SetTotalCountType; //3
  end;


function EntityTypeToStr(AType:TEntityType):string;
function AttachmentTypeToStr(AType:TAttachmentType):string;
implementation

function EntityTypeToStr(AType:TEntityType):string;
begin
  case AType of
    UnknownEntityType:Result:='UnknownEntityType';
    Attachment:Result:='Attachment';
    Signature:Result:='Signature';
  else
    Result:='';
  end;
end;

function AttachmentTypeToStr(AType:TAttachmentType):string;
begin
  case AType of
    UnknownAttachmentType:Result:='UnknownAttachmentType';
    Nonformalized:Result:='Nonformalized';
    Invoice:Result:='Invoice';
    InvoiceReceipt:Result:='InvoiceReceipt';
    InvoiceConfirmation:Result:='InvoiceConfirmation';
    InvoiceCorrectionRequest:Result:='InvoiceCorrectionRequest';
    AttachmentComment:Result:='AttachmentComment';
    DeliveryFailureNotification:Result:='DeliveryFailureNotification';
    EancomInvoic:Result:='EancomInvoic';
    SignatureRequestRejection:Result:='SignatureRequestRejection';
    EcrCatConformanceCertificateMetadata:Result:='EcrCatConformanceCertificateMetadata';
    SignatureVerificationReport:Result:='SignatureVerificationReport';
    TrustConnectionRequest:Result:='TrustConnectionRequest';
    Torg12:Result:='Torg12';
    InvoiceRevision:Result:='InvoiceRevision';
    InvoiceCorrection:Result:='InvoiceCorrection';
    InvoiceCorrectionRevision:Result:='InvoiceCorrectionRevision';
    AcceptanceCertificate:Result:='AcceptanceCertificate';
    StructuredData:Result:='StructuredData';
    ProformaInvoice:Result:='ProformaInvoice';
    XmlTorg12:Result:='XmlTorg12';
    XmlAcceptanceCertificate:Result:='XmlAcceptanceCertificate';
    XmlTorg12BuyerTitle:Result:='XmlTorg12BuyerTitle';
    XmlAcceptanceCertificateBuyerTitle:Result:='XmlAcceptanceCertificateBuyerTitle';
    Resolution:Result:='Resolution';
    ResolutionRequest:Result:='ResolutionRequest';
    ResolutionRequestDenial:Result:='ResolutionRequestDenial';
    PriceList:Result:='PriceList';
    Receipt:Result:='Receipt';
    XmlSignatureRejection:Result:='XmlSignatureRejection';
    RevocationRequest:Result:='RevocationRequest';
    PriceListAgreement:Result:='PriceListAgreement';
    CertificateRegistry:Result:='CertificateRegistry';
    ReconciliationAct:Result:='ReconciliationAct';
    Contract:Result:='Contract';
    Torg13:Result:='Torg13';
    ServiceDetails:Result:='ServiceDetails';
    RoamingNotification:Result:='RoamingNotification';
    SupplementaryAgreement:Result:='SupplementaryAgreement';
    UniversalTransferDocument:Result:='UniversalTransferDocument';
    UniversalTransferDocumentBuyerTitle:Result:='UniversalTransferDocumentBuyerTitle';
    UniversalTransferDocumentRevision:Result:='UniversalTransferDocumentRevision';
    UniversalCorrectionDocument:Result:='UniversalCorrectionDocument';
    UniversalCorrectionDocumentRevision:Result:='UniversalCorrectionDocumentRevision';
    UniversalCorrectionDocumentBuyerTitle:Result:='UniversalCorrectionDocumentBuyerTitle';
    CustomData:Result:='CustomData';
    MoveDocument:Result:='MoveDocument';
    ResolutionRouteAssignmentAttachment:Result:='ResolutionRouteAssignmentAttachment';
    ResolutionRouteRemovalAttachment:Result:='ResolutionRouteRemovalAttachment';
    Title:Result:='Title';
    Cancellation:Result:='Cancellation';
    Edition:Result:='Edition';
  else
    Result:='';
  end;
end;

{ TTemplateTransformationInfo }

procedure TTemplateTransformationInfo.SetAuthor(AValue: string);
begin
  if FAuthor=AValue then Exit;
  FAuthor:=AValue;
end;

procedure TTemplateTransformationInfo.InternalInit;
begin
  inherited InternalInit;
  FTransformedToDocumentId:=TDocumentId.Create;
end;

procedure TTemplateTransformationInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TransformedToDocumentId', 1);
  RegisterProp('Author', 2);
end;

destructor TTemplateTransformationInfo.Destroy;
begin
  FreeAndNil(FTransformedToDocumentId);
  inherited Destroy;
end;

{ TTemplateToLetterTransformationInfo }

procedure TTemplateToLetterTransformationInfo.SetLetterFromBoxId(AValue: string
  );
begin
  if FLetterFromBoxId=AValue then Exit;
  FLetterFromBoxId:=AValue;
  Modified(1);
end;

procedure TTemplateToLetterTransformationInfo.SetLetterFromDepartmentId(
  AValue: string);
begin
  if FLetterFromDepartmentId=AValue then Exit;
  FLetterFromDepartmentId:=AValue;
  Modified(3);
end;

procedure TTemplateToLetterTransformationInfo.SetLetterProxyBoxId(AValue: string
  );
begin
  if FLetterProxyBoxId=AValue then Exit;
  FLetterProxyBoxId:=AValue;
  Modified(5);
end;

procedure TTemplateToLetterTransformationInfo.SetLetterProxyDepartmentId(
  AValue: string);
begin
  if FLetterProxyDepartmentId=AValue then Exit;
  FLetterProxyDepartmentId:=AValue;
  Modified(6);
end;

procedure TTemplateToLetterTransformationInfo.SetLetterToBoxId(AValue: string);
begin
  if FLetterToBoxId=AValue then Exit;
  FLetterToBoxId:=AValue;
  Modified(2);
end;

procedure TTemplateToLetterTransformationInfo.SetLetterToDepartmentId(
  AValue: string);
begin
  if FLetterToDepartmentId=AValue then Exit;
  FLetterToDepartmentId:=AValue;
  Modified(4);
end;

procedure TTemplateToLetterTransformationInfo.InternalInit;
begin
  inherited InternalInit;
end;

procedure TTemplateToLetterTransformationInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('LetterFromBoxId', 1, true);
  RegisterProp('LetterToBoxId', 2, true);
  RegisterProp('LetterFromDepartmentId', 3);
  RegisterProp('LetterToDepartmentId', 4);
  RegisterProp('LetterProxyBoxId', 5);
  RegisterProp('LetterProxyDepartmentId', 6);
end;

destructor TTemplateToLetterTransformationInfo.Destroy;
begin
  inherited Destroy;
end;

{ TBoxEventList }

procedure TBoxEventList.SetTotalCount(AValue: int32);
begin
  if FTotalCount=AValue then Exit;
  FTotalCount:=AValue;
  Modified(2);
end;

procedure TBoxEventList.SetTotalCountType(AValue: TTotalCountType);
begin
  if FTotalCountType=AValue then Exit;
  FTotalCountType:=AValue;
  Modified(3);
end;

procedure TBoxEventList.InternalInit;
begin
  inherited InternalInit;
  FEvents:=TBoxEvents.Create;
end;

procedure TBoxEventList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Events', 1, true);
  RegisterProp('TotalCount', 2);
  RegisterProp('TotalCountType', 3, true);
end;

destructor TBoxEventList.Destroy;
begin
  FreeAndNil(FEvents);
  inherited Destroy;
end;

{ TBoxEvent }

procedure TBoxEvent.SetEventId(AValue: string);
begin
  if FEventId=AValue then Exit;
  FEventId:=AValue;
  Modified(1);
end;

procedure TBoxEvent.InternalInit;
begin
  inherited InternalInit;
  FMessage:=TMessage.Create;
  FPatch:=TMessagePatch.Create;
end;

procedure TBoxEvent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('EventId', 1, true);
  RegisterProp('Message', 2);
  RegisterProp('Patch', 3);
end;

destructor TBoxEvent.Destroy;
begin
  FreeAndNil(FMessage);
  FreeAndNil(FPatch);
  inherited Destroy;
end;

{ TTemplate }

procedure TTemplate.SetFromBoxId(AValue: string);
begin
  if FFromBoxId=AValue then Exit;
  FFromBoxId:=AValue;
  Modified(3);
end;

procedure TTemplate.SetIsDeleted(AValue: Boolean);
begin
  if FIsDeleted=AValue then Exit;
  FIsDeleted:=AValue;
  Modified(8);
end;

procedure TTemplate.SetIsReusable(AValue: Boolean);
begin
  if FIsReusable=AValue then Exit;
  FIsReusable:=AValue;
  Modified(13);
end;

procedure TTemplate.SetLockMode(AValue: TLockMode);
begin
  if FLockMode=AValue then Exit;
  FLockMode:=AValue;
  Modified(10);
end;

procedure TTemplate.SetMessageFromBoxId(AValue: string);
begin
  if FMessageFromBoxId=AValue then Exit;
  FMessageFromBoxId:=AValue;
  Modified(5);
end;

procedure TTemplate.SetMessageId(AValue: string);
begin
  if FMessageId=AValue then Exit;
  FMessageId:=AValue;
  Modified(1);
end;

procedure TTemplate.SetMessageProxyBoxId(AValue: string);
begin
  if FMessageProxyBoxId=AValue then Exit;
  FMessageProxyBoxId:=AValue;
  Modified(11);
end;

procedure TTemplate.SetMessageProxyDepartmentId(AValue: string);
begin
  if FMessageProxyDepartmentId=AValue then Exit;
  FMessageProxyDepartmentId:=AValue;
  Modified(12);
end;

procedure TTemplate.SetMessageToBoxId(AValue: string);
begin
  if FMessageToBoxId=AValue then Exit;
  FMessageToBoxId:=AValue;
  Modified(6);
end;

procedure TTemplate.SetMessageToDepartmentId(AValue: string);
begin
  if FMessageToDepartmentId=AValue then Exit;
  FMessageToDepartmentId:=AValue;
  Modified(9);
end;

procedure TTemplate.SetTimestampTicks(AValue: sfixed64);
begin
  if FTimestampTicks=AValue then Exit;
  FTimestampTicks:=AValue;
  Modified(2);
end;

procedure TTemplate.SetToBoxId(AValue: string);
begin
  if FToBoxId=AValue then Exit;
  FToBoxId:=AValue;
  Modified(4);
end;

procedure TTemplate.InternalInit;
begin
  inherited InternalInit;
  FEntities:=TEntitys.Create;
end;

procedure TTemplate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('MessageId', 1, true);
  RegisterProp('TimestampTicks', 2, true);
  RegisterProp('FromBoxId', 3, true);
  RegisterProp('ToBoxId', 4, true);
  RegisterProp('MessageFromBoxId', 5, true);
  RegisterProp('MessageToBoxId', 6, true);
  RegisterProp('Entities', 7);
  RegisterProp('IsDeleted', 8);
  RegisterProp('MessageToDepartmentId', 9);
  RegisterProp('LockMode', 10, true);
  RegisterProp('MessageProxyBoxId', 11);
  RegisterProp('MessageProxyDepartmentId', 12);
  RegisterProp('IsReusable', 13);
end;

destructor TTemplate.Destroy;
begin
  FreeAndNil(FEntities);
  inherited Destroy;
end;

{ TMessagePatch }

procedure TMessagePatch.SetDeliveredPatchId(AValue: string);
begin
  if FDeliveredPatchId=AValue then Exit;
  FDeliveredPatchId:=AValue;
  Modified(12);
end;

procedure TMessagePatch.SetDraftIsLocked(AValue: Boolean);
begin
  if FDraftIsLocked=AValue then Exit;
  FDraftIsLocked:=AValue;
  Modified(7);
end;

procedure TMessagePatch.SetDraftIsRecycled(AValue: Boolean);
begin
  if FDraftIsRecycled=AValue then Exit;
  FDraftIsRecycled:=AValue;
  Modified(5);
end;

procedure TMessagePatch.SetForDraft(AValue: Boolean);
begin
  if FForDraft=AValue then Exit;
  FForDraft:=AValue;
  Modified(4);
end;

procedure TMessagePatch.SetMessageId(AValue: string);
begin
  if FMessageId=AValue then Exit;
  FMessageId:=AValue;
  Modified(1);
end;

procedure TMessagePatch.SetMessageIsDeleted(AValue: Boolean);
begin
  if FMessageIsDeleted=AValue then Exit;
  FMessageIsDeleted:=AValue;
  Modified(8);
end;

procedure TMessagePatch.SetMessageIsDelivered(AValue: Boolean);
begin
  if FMessageIsDelivered=AValue then Exit;
  FMessageIsDelivered:=AValue;
  Modified(11);
end;

procedure TMessagePatch.SetMessageIsRestored(AValue: Boolean);
begin
  if FMessageIsRestored=AValue then Exit;
  FMessageIsRestored:=AValue;
  Modified(10);
end;

procedure TMessagePatch.SetMessageType(AValue: TMessageType);
begin
  if FMessageType=AValue then Exit;
  FMessageType:=AValue;
  Modified(15);
end;

procedure TMessagePatch.SetPatchId(AValue: string);
begin
  if FPatchId=AValue then Exit;
  FPatchId:=AValue;
  Modified(13);
end;

procedure TMessagePatch.SetTimestampTicks(AValue: sfixed64);
begin
  if FTimestampTicks=AValue then Exit;
  FTimestampTicks:=AValue;
  Modified(2);
end;

procedure TMessagePatch.InternalInit;
begin
  inherited InternalInit;
  FEntities:=TEntitys.Create;
  FDraftIsTransformedToMessageIdList:=TDocumentStrings.Create;
  FEntityPatches:=TEntityPatchs.Create;
end;

procedure TMessagePatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('MessageId', 1, true);
  RegisterProp('TimestampTicks', 2, true);
  RegisterProp('Entities', 3);
  RegisterProp('ForDraft', 4);
  RegisterProp('DraftIsRecycled', 5);
  RegisterProp('DraftIsTransformedToMessageIdList', 6);
  RegisterProp('DraftIsLocked', 7);
  RegisterProp('MessageIsDeleted', 8);
  RegisterProp('EntityPatches', 9);
  RegisterProp('MessageIsRestored', 10);
  RegisterProp('MessageIsDelivered', 11);
  RegisterProp('DeliveredPatchId', 12);
  RegisterProp('PatchId', 13, true);
  RegisterProp('MessageType', 15, true);
end;

destructor TMessagePatch.Destroy;
begin
  FreeAndNil(FEntities);
  FreeAndNil(FDraftIsTransformedToMessageIdList);
  FreeAndNil(FEntityPatches);
  inherited Destroy;
end;

{ TEntityPatch }

procedure TEntityPatch.SetContentIsPatched(AValue: Boolean);
begin
  if FContentIsPatched=AValue then Exit;
  FContentIsPatched:=AValue;
  Modified(5);
end;

procedure TEntityPatch.SetDocumentIsDeleted(AValue: Boolean);
begin
  if FDocumentIsDeleted=AValue then Exit;
  FDocumentIsDeleted:=AValue;
  Modified(2);
end;

procedure TEntityPatch.SetDocumentIsRestored(AValue: Boolean);
begin
  if FDocumentIsRestored=AValue then Exit;
  FDocumentIsRestored:=AValue;
  Modified(4);
end;

procedure TEntityPatch.SetEntityId(AValue: string);
begin
  if FEntityId=AValue then Exit;
  FEntityId:=AValue;
  Modified(1);
end;

procedure TEntityPatch.SetForwardedToBoxId(AValue: string);
begin
  if FForwardedToBoxId=AValue then Exit;
  FForwardedToBoxId:=AValue;
  Modified(6);
end;

procedure TEntityPatch.SetMovedToDepartment(AValue: string);
begin
  if FMovedToDepartment=AValue then Exit;
  FMovedToDepartment:=AValue;
  Modified(3);
end;

procedure TEntityPatch.InternalInit;
begin
  inherited InternalInit;
end;

procedure TEntityPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('EntityId', 1, true);
  RegisterProp('DocumentIsDeleted', 2);
  RegisterProp('MovedToDepartment', 3);
  RegisterProp('DocumentIsRestored', 4);
  RegisterProp('ContentIsPatched', 5);
  RegisterProp('ForwardedToBoxId', 6);
end;

destructor TEntityPatch.Destroy;
begin
  inherited Destroy;
end;

{ TEntity }

procedure TEntity.SetAttachmentType(AValue: TAttachmentType);
begin
  if FAttachmentType=AValue then Exit;
  if (FAttachmentType = UnknownAttachmentType) or
     (FAttachmentType = InvoiceReceipt) or
     (FAttachmentType = InvoiceConfirmation) or
     (FAttachmentType = InvoiceCorrectionRequest) or
     (FAttachmentType = AttachmentComment) or
     (FAttachmentType = DeliveryFailureNotification) or
     (FAttachmentType = EancomInvoic) or
     (FAttachmentType = TAttachmentType.Nonformalized) or
     (FAttachmentType = TAttachmentType.Invoice) or
     (FAttachmentType = SignatureRequestRejection) or
     (FAttachmentType = EcrCatConformanceCertificateMetadata) or
     (FAttachmentType = SignatureVerificationReport) or
     (FAttachmentType = TAttachmentType.TrustConnectionRequest) or
     (FAttachmentType = TAttachmentType.Torg12) or
     (FAttachmentType = TAttachmentType.InvoiceRevision) or
     (FAttachmentType = TAttachmentType.InvoiceCorrection) or
     (FAttachmentType = TAttachmentType.InvoiceCorrectionRevision) or
     (FAttachmentType = TAttachmentType.AcceptanceCertificate) or
     (FAttachmentType = StructuredData) or
     (FAttachmentType = TAttachmentType.ProformaInvoice) or
     (FAttachmentType = TAttachmentType.XmlTorg12) or
     (FAttachmentType = TAttachmentType.XmlAcceptanceCertificate) or
     (FAttachmentType = XmlTorg12BuyerTitle) or
     (FAttachmentType = XmlAcceptanceCertificateBuyerTitle) or
     (FAttachmentType = Resolution) or
     (FAttachmentType = ResolutionRequest) or
     (FAttachmentType = ResolutionRequestDenial) or
     (FAttachmentType = TAttachmentType.PriceList) or
     (FAttachmentType = Receipt) or
     (FAttachmentType = XmlSignatureRejection) or
     (FAttachmentType = RevocationRequest) or
     (FAttachmentType = TAttachmentType.PriceListAgreement) or
     (FAttachmentType = TAttachmentType.CertificateRegistry) or
     (FAttachmentType = TAttachmentType.ReconciliationAct) or
     (FAttachmentType = TAttachmentType.Contract) or
     (FAttachmentType = TAttachmentType.Torg13) or
     (FAttachmentType = TAttachmentType.ServiceDetails) or
     (FAttachmentType = RoamingNotification) or
     (FAttachmentType = TAttachmentType.SupplementaryAgreement) or
     (FAttachmentType = TAttachmentType.UniversalTransferDocument) or
     (FAttachmentType = UniversalTransferDocumentBuyerTitle) or
     (FAttachmentType = TAttachmentType.UniversalTransferDocumentRevision) or
     (FAttachmentType = TAttachmentType.UniversalCorrectionDocument) or
     (FAttachmentType = TAttachmentType.UniversalCorrectionDocumentRevision) or
     (FAttachmentType = UniversalCorrectionDocumentBuyerTitle) or
     (FAttachmentType = CustomData) or
     (FAttachmentType = MoveDocument) or
     (FAttachmentType = ResolutionRouteAssignmentAttachment) or
     (FAttachmentType = ResolutionRouteRemovalAttachment) or
     (FAttachmentType = Title) or
     (FAttachmentType = Cancellation) or
     (FAttachmentType = Edition) then
    FAttachmentType:=AValue
  else
    FAttachmentType:=Title;
  Modified(5);
end;

procedure TEntity.SetAttachmentVersion(AValue: string);
begin
  if FAttachmentVersion=AValue then Exit;
  FAttachmentVersion:=AValue;
  Modified(21);
end;

procedure TEntity.SetContentTypeId(AValue: string);
begin
  if FContentTypeId=AValue then Exit;
  FContentTypeId:=AValue;
  Modified(31);
end;

procedure TEntity.SetEntityId(AValue: string);
begin
  if FEntityId=AValue then Exit;
  FEntityId:=AValue;
  Modified(2);
end;

procedure TEntity.SetEntityType(AValue: TEntityType);
begin
  if FEntityType=AValue then Exit;

  if AValue in  [UnknownEntityType, Attachment, Signature] then
    FEntityType:=AValue
  else
  begin
    FEntityType:=UnknownEntityType;
    FAttachmentType:=TAttachmentType.Nonformalized;
  end;
  Modified(1);
end;

procedure TEntity.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(6);
end;

procedure TEntity.SetIsApprovementSignature(AValue: Boolean);
begin
  if FIsApprovementSignature=AValue then Exit;
  FIsApprovementSignature:=AValue;
  Modified(19);
end;

procedure TEntity.SetIsEncryptedContent(AValue: Boolean);
begin
  if FIsEncryptedContent=AValue then Exit;
  FIsEncryptedContent:=AValue;
  Modified(20);
end;

procedure TEntity.SetNeedReceipt(AValue: boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(17);
end;

procedure TEntity.SetNeedRecipientSignature(AValue: Boolean);
begin
  if FNeedRecipientSignature=AValue then Exit;
  FNeedRecipientSignature:=AValue;
  Modified(7);
end;

procedure TEntity.SetNotDeliveredEventId(AValue: string);
begin
  if FNotDeliveredEventId=AValue then Exit;
  FNotDeliveredEventId:=AValue;
  Modified(10);
end;

procedure TEntity.SetPacketId(AValue: string);
begin
  if FPacketId=AValue then Exit;
  FPacketId:=AValue;
  Modified(18);
end;

procedure TEntity.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(3);
end;

procedure TEntity.SetRawCreationDate(AValue: sfixed64);
begin
  if FRawCreationDate=AValue then Exit;
  FRawCreationDate:=AValue;
  Modified(12);
end;

procedure TEntity.SetSignerBoxId(AValue: string);
begin
  if FSignerBoxId=AValue then Exit;
  FSignerBoxId:=AValue;
  Modified(8);
end;

procedure TEntity.SetSignerDepartmentId(AValue: string);
begin
  if FSignerDepartmentId=AValue then Exit;
  FSignerDepartmentId:=AValue;
  Modified(14);
end;

procedure TEntity.SetVersion(AValue: string);
begin
  if FVersion=AValue then Exit;
  FVersion:=AValue;
  Modified(26);
end;

procedure TEntity.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('EntityType', 1);
  RegisterProp('EntityId', 2, true);
  RegisterProp('ParentEntityId', 3);
  RegisterProp('Content', 4);
  RegisterProp('AttachmentType', 5);
  RegisterProp('FileName', 6);
  RegisterProp('NeedRecipientSignature', 7);
  RegisterProp('SignerBoxId', 8);
  RegisterProp('NotDeliveredEventId', 10);
  RegisterProp('DocumentInfo', 11);
  RegisterProp('RawCreationDate', 12);
  RegisterProp('ResolutionInfo', 13);
  RegisterProp('SignerDepartmentId', 14);
  RegisterProp('ResolutionRequestInfo', 15);
  RegisterProp('ResolutionRequestDenialInfo', 16);
  RegisterProp('NeedReceipt', 17);
  RegisterProp('PacketId', 18);
  RegisterProp('IsApprovementSignature', 19);
  RegisterProp('IsEncryptedContent', 20);
  RegisterProp('AttachmentVersion', 21);
  RegisterProp('ResolutionRouteAssignmentInfo', 22);
  RegisterProp('ResolutionRouteRemovalInfo', 23);
  RegisterProp('CancellationInfo', 24);
  RegisterProp('Labels', 25, true);
  RegisterProp('Version', 26);
  RegisterProp('TemplateTransformationInfo', 27);
  RegisterProp('TemplateRefusalInfo', 28);
  RegisterProp('OuterDocflow', 29);
  RegisterProp('RevocationRequestInfo', 30);
  RegisterProp('ContentTypeId', 31);
end;

procedure TEntity.InternalInit;
begin
  inherited InternalInit;
  FContent:=TContent.Create;
  FDocumentInfo:=TDocument.Create;
  FResolutionInfo:=TResolutionInfo.Create;
  FResolutionRequestInfo:=TResolutionRequestInfo.Create;
  FResolutionRequestDenialInfo:=TResolutionRequestDenialInfo.Create;
  FResolutionRouteAssignmentInfo:=TResolutionRouteAssignmentInfo.Create;
  FResolutionRouteRemovalInfo:=TResolutionRouteRemovalInfo.Create;
  FCancellationInfo:=TCancellationInfo.Create;
  FLabels:=TDocumentStrings.Create;
  FTemplateTransformationInfo:=TTemplateTransformationInfo.Create;
  FTemplateRefusalInfo:= TTemplateRefusalInfo.Create;
  FOuterDocflow:=TOuterDocflowInfo.Create;
  FRevocationRequestInfo:=TRevocationRequestInfo.Create;
(*
  EntityType:= UnknownEntityType;
  AttachmentType:= UnknownAttachmentType;
  NeedRecipientSignature:= false;
  RawCreationDate:= 0;
  NeedReceipt:= false;
  IsApprovementSignature:= false;
  IsEncryptedContent:= false;
*)
end;

destructor TEntity.Destroy;
begin
  FreeAndNil(FContent);
  FreeAndNil(FDocumentInfo);
  FreeAndNil(FResolutionInfo);
  FreeAndNil(FResolutionRequestInfo);
  FreeAndNil(FResolutionRequestDenialInfo);
  FreeAndNil(FResolutionRouteAssignmentInfo);
  FreeAndNil(FResolutionRouteRemovalInfo);
  FreeAndNil(FCancellationInfo);
  FreeAndNil(FLabels);
  FreeAndNil(FTemplateTransformationInfo);
  FTemplateRefusalInfo.Free;
  FOuterDocflow.Free;
  FreeAndNil(FRevocationRequestInfo);
  inherited Destroy;
end;

{ TMessage }

procedure TMessage.SetCreatedFromDraftId(AValue: string);
begin
  if FCreatedFromDraftId=AValue then Exit;
  FCreatedFromDraftId:=AValue;
  Modified(12);
end;

procedure TMessage.SetDraftIsLocked(AValue: Boolean);
begin
  if FDraftIsLocked=AValue then Exit;
  FDraftIsLocked:=AValue;
  Modified(10);
end;

procedure TMessage.SetDraftIsRecycled(AValue: Boolean);
begin
  if FDraftIsRecycled=AValue then Exit;
  FDraftIsRecycled:=AValue;
  Modified(11);
end;

procedure TMessage.SetFromBoxId(AValue: string);
begin
  if FFromBoxId=AValue then Exit;
  FFromBoxId:=AValue;
  Modified(4);
end;

procedure TMessage.SetFromTitle(AValue: string);
begin
  if FFromTitle=AValue then Exit;
  FFromTitle:=AValue;
  Modified(5);
end;

procedure TMessage.SetIsDeleted(AValue: Boolean);
begin
  if FIsDeleted=AValue then Exit;
  FIsDeleted:=AValue;
  Modified(14);
end;

procedure TMessage.SetIsDraft(AValue: Boolean);
begin
  if FIsDraft=AValue then Exit;
  FIsDraft:=AValue;
  Modified(9);
end;

procedure TMessage.SetIsInternal(AValue: Boolean);
begin
  if FIsInternal=AValue then Exit;
  FIsInternal:=AValue;
  Modified(16);
end;

procedure TMessage.SetIsProxified(AValue: Boolean);
begin
  if FIsProxified=AValue then Exit;
  FIsProxified:=AValue;
  Modified(17);
end;

procedure TMessage.SetIsReusable(AValue: Boolean);
begin
  if FIsReusable=AValue then Exit;
  FIsReusable:=AValue;
  Modified(24);
end;

procedure TMessage.SetIsTest(AValue: Boolean);
begin
  if FIsTest=AValue then Exit;
  FIsTest:=AValue;
  Modified(15);
end;

procedure TMessage.SetLastPatchTimestampTicks(AValue: sfixed64);
begin
  if FLastPatchTimestampTicks=AValue then Exit;
  FLastPatchTimestampTicks:=AValue;
  Modified(3);
end;

procedure TMessage.SetLockMode(AValue: TLockMode);
begin
  if FLockMode=AValue then Exit;
  FLockMode:=AValue;
  Modified(21);
end;

procedure TMessage.SetMessageId(AValue: string);
begin
  if FMessageId=AValue then Exit;
  FMessageId:=AValue;
  Modified(1);
end;

procedure TMessage.SetMessageType(AValue: TMessageType);
begin
  if FMessageType=AValue then Exit;
  FMessageType:=AValue;
  Modified(22);
end;

procedure TMessage.SetPacketIsLocked(AValue: Boolean);
begin
  if FPacketIsLocked=AValue then Exit;
  FPacketIsLocked:=AValue;
  Modified(20);
end;

procedure TMessage.SetProxyBoxId(AValue: string);
begin
  if FProxyBoxId=AValue then Exit;
  FProxyBoxId:=AValue;
  Modified(18);
end;

procedure TMessage.SetProxyTitle(AValue: string);
begin
  if FProxyTitle=AValue then Exit;
  FProxyTitle:=AValue;
  Modified(19);
end;

procedure TMessage.SetTimestampTicks(AValue: sfixed64);
begin
  if FTimestampTicks=AValue then Exit;
  FTimestampTicks:=AValue;
  Modified(2);
end;

procedure TMessage.SetToBoxId(AValue: string);
begin
  if FToBoxId=AValue then Exit;
  FToBoxId:=AValue;
  Modified(6);
end;

procedure TMessage.SetToTitle(AValue: string);
begin
  if FToTitle=AValue then Exit;
  FToTitle:=AValue;
  Modified(7);
end;

procedure TMessage.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('MessageId', 1, true);
  RegisterProp('TimestampTicks', 2, true);
  RegisterProp('LastPatchTimestampTicks', 3, true);
  RegisterProp('FromBoxId', 4, true);
  RegisterProp('FromTitle', 5, true);
  RegisterProp('ToBoxId', 6);
  RegisterProp('ToTitle', 7);
  RegisterProp('Entities', 8);
  RegisterProp('IsDraft', 9);
  RegisterProp('DraftIsLocked', 10);
  RegisterProp('DraftIsRecycled', 11);
  RegisterProp('CreatedFromDraftId', 2);
  RegisterProp('DraftIsTransformedToMessageIdList', 13);
  RegisterProp('IsDeleted', 14);
  RegisterProp('IsTest', 15);
  RegisterProp('IsInternal', 16);
  RegisterProp('IsProxified', 17);
  RegisterProp('ProxyBoxId', 18);
  RegisterProp('ProxyTitle', 19);
  RegisterProp('PacketIsLocked', 20);
  RegisterProp('LockMode', 21, true);
  RegisterProp('MessageType', 22, true);
  RegisterProp('TemplateToLetterTransformationInfo', 23);
  RegisterProp('IsReusable', 24);
end;

procedure TMessage.InternalInit;
begin
  inherited InternalInit;
  FEntities:=TEntitys.Create;
  FDraftIsTransformedToMessageIdList:=TDocumentStrings.Create;
  FTemplateToLetterTransformationInfo:=TTemplateToLetterTransformationInfo.Create;
end;

destructor TMessage.Destroy;
begin
  FreeAndNil(FEntities);
  FreeAndNil(FDraftIsTransformedToMessageIdList);
  FreeAndNil(FTemplateToLetterTransformationInfo);
  inherited Destroy;
end;

{ TemplateRefusalInfo }

procedure TTemplateRefusalInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TypeField', 1, true);
  RegisterProp('BoxId', 2, true);
  RegisterProp('Author', 3);
  RegisterProp('Comment', 4);
end;

procedure TTemplateRefusalInfo.InternalInit;
begin
  inherited InternalInit;
  TypeField:= UnknownTemplateRefusalType;
end;

destructor TTemplateRefusalInfo.Destroy;
begin
  inherited Destroy;
end;

procedure TTemplateRefusalInfo.SetTypeField(AValue:TTemplateRefusalType);
begin
  FTypeField:=AValue;
  Modified(1);
end;

procedure TTemplateRefusalInfo.SetBoxId(AValue:String);
begin
  FBoxId:=AValue;
  Modified(2);
end;

procedure TTemplateRefusalInfo.SetAuthor(AValue:String);
begin
  FAuthor:=AValue;
  Modified(3);
end;

procedure TTemplateRefusalInfo.SetComment(AValue:String);
begin
  FComment:=AValue;
  Modified(4);
end;

end.

