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
//import "Documents/Document.proto";
//import "Events/CancellationInfo.proto";
//import "Events/ResolutionInfo.proto";
//import "Events/ResolutionRequestInfo.proto";
//import "Events/ResolutionRequestDenialInfo.proto";
//import "Events/ResolutionRouteInfo.proto";
uses
  Classes, SysUtils, protobuf_fpc_types,
  protobuf_fpc,
  diadoc_simple_arrays,
  DiadocTypes_Content,
  DiadocTypes_DocumentId,
  DiadocTypes_LockMode,
  DiadocTypes_Document,
  DiadocTypes_CancellationInfo,
  DiadocTypes_ResolutionInfo,
  DiadocTypes_ResolutionRequestInfo,
  DiadocTypes_ResolutionRequestDenialInfo,
  DiadocTypes_ResolutionRouteInfo
  ;

type
  TEntityType = (
    UnknownEntityType = 0, // Reserved type to report to legacy clients for newly introduced entity types
    Attachment = 1,
    Signature = 2
    //Неизвестные типы должны обрабатываться клиентом как cущность Attachment с типом вложения AttachmentType.Nonformalized
  );

  TAttachmentType = (
    UnknownAttachmentType = -1, // Reserved attachment type to report to legacy clients for newly introduced attachment types
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
    Edition = 71
    //Неизвестные типы должны обрабатываться как Title
  );



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
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property EntityId:string read FEntityId write FEntityId;//1;
    property DocumentIsDeleted:Boolean read FDocumentIsDeleted write FDocumentIsDeleted;//2
    property MovedToDepartment:string read FMovedToDepartment write FMovedToDepartment;//3;
    property DocumentIsRestored:Boolean read FDocumentIsRestored write FDocumentIsRestored;//4
    property ContentIsPatched:Boolean read FContentIsPatched write FContentIsPatched;//5
    property ForwardedToBoxId:string read FForwardedToBoxId write FForwardedToBoxId;//6;
  end;

  TEntityPatchs = specialize GSerializationObjectList<TEntityPatch>;

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
  //}
  TEntity  = class(TSerializationObject) //message Entity
  private
    FAttachmentType: TAttachmentType;
    FAttachmentVersion: string;
    FCancellationInfo: TCancellationInfo;
    FContent: TContent;
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
    FPacketId: string;
    FParentEntityId: string;
    FRawCreationDate: sfixed64;
    FResolutionInfo: TResolutionInfo;
    FResolutionRequestDenialInfo: TResolutionRequestDenialInfo;
    FResolutionRequestInfo: TResolutionRequestInfo;
    FResolutionRouteAssignmentInfo: TResolutionRouteAssignmentInfo;
    FResolutionRouteRemovalInfo: TResolutionRouteRemovalInfo;
    FSignerBoxId: string;
    FSignerDepartmentId: string;
    FVersion: string;
    procedure SetAttachmentType(AValue: TAttachmentType);
    procedure SetEntityType(AValue: TEntityType);
    procedure SetVersion(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property EntityType:TEntityType read FEntityType write SetEntityType default UnknownEntityType ;//1
    property EntityId:string read FEntityId write FEntityId; //2;
    property ParentEntityId:string read FParentEntityId write FParentEntityId; //3;
    property Content:TContent read FContent; //4;
    property AttachmentType:TAttachmentType read FAttachmentType write SetAttachmentType default UnknownAttachmentType; //5
    property FileName:string read FFileName write FFileName; //6;
    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write FNeedRecipientSignature; //7
    property SignerBoxId:string read FSignerBoxId write FSignerBoxId; //8
    property NotDeliveredEventId:string read FNotDeliveredEventId write FNotDeliveredEventId; //10
    property DocumentInfo:TDocument read FDocumentInfo; //11
    property RawCreationDate:sfixed64 read FRawCreationDate write FRawCreationDate;//12
    property ResolutionInfo:TResolutionInfo read FResolutionInfo; //13;
    property SignerDepartmentId:string read FSignerDepartmentId write FSignerDepartmentId; //14;
    property ResolutionRequestInfo:TResolutionRequestInfo read FResolutionRequestInfo; //15;
    property ResolutionRequestDenialInfo:TResolutionRequestDenialInfo read FResolutionRequestDenialInfo; //16;
    property NeedReceipt:boolean read FNeedReceipt write FNeedReceipt; //17
    property PacketId:string read FPacketId write FPacketId; //18;
    property IsApprovementSignature:Boolean read FIsApprovementSignature write FIsApprovementSignature; //19
    property IsEncryptedContent:Boolean read FIsEncryptedContent write FIsEncryptedContent; //20
    property AttachmentVersion:string read FAttachmentVersion write FAttachmentVersion; //21;
    property ResolutionRouteAssignmentInfo:TResolutionRouteAssignmentInfo read FResolutionRouteAssignmentInfo;//22
    property ResolutionRouteRemovalInfo:TResolutionRouteRemovalInfo read FResolutionRouteRemovalInfo; //23
    property CancellationInfo:TCancellationInfo read FCancellationInfo; //24
    property Labels:TDocumentStrings read FLabels; //25;
    property Version:string read FVersion write SetVersion;//26;
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
    FPatchId: string;
    FTimestampTicks: sfixed64;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property MessageId:string read FMessageId write FMessageId;//1;
    property TimestampTicks:sfixed64 read FTimestampTicks write FTimestampTicks;// = 2;
    property Entities:TEntitys read FEntities; //3;
    property ForDraft:Boolean read FForDraft write FForDraft;//4
    property DraftIsRecycled:Boolean read FDraftIsRecycled write FDraftIsRecycled;//5
    property DraftIsTransformedToMessageIdList:TDocumentStrings read FDraftIsTransformedToMessageIdList;//6;
    property DraftIsLocked:Boolean read FDraftIsLocked write FDraftIsLocked;//7
    property MessageIsDeleted:Boolean read FMessageIsDeleted write FMessageIsDeleted;//8
    property EntityPatches:TEntityPatchs read FEntityPatches;//9;
    property MessageIsRestored:Boolean read FMessageIsRestored write FMessageIsRestored;//10
    property MessageIsDelivered:Boolean read FMessageIsDelivered write FMessageIsDelivered;//11
    property DeliveredPatchId:string read FDeliveredPatchId write FDeliveredPatchId;//12;
    property PatchId:string read FPatchId write FPatchId;//13;
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
  //}
  TTemplate = class(TSerializationObject)
  private
    FEntities: TEntitys;
    FFromBoxId: string;
    FIsDeleted: Boolean;
    FLockMode: TLockMode;
    FMessageFromBoxId: string;
    FMessageId: string;
    FMessageToBoxId: string;
    FMessageToDepartmentId: string;
    FTimestampTicks: sfixed64;
    FToBoxId: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property MessageId:string read FMessageId write FMessageId;//1;
    property TimestampTicks:sfixed64 read FTimestampTicks write FTimestampTicks;//2;
    property FromBoxId:string read FFromBoxId write FFromBoxId;//3;
    property ToBoxId:string read FToBoxId write FToBoxId;//4;
    property MessageFromBoxId:string read FMessageFromBoxId write FMessageFromBoxId;//5;
    property MessageToBoxId:string read FMessageToBoxId write FMessageToBoxId;//6;
    property Entities:TEntitys read FEntities;//7;
    property IsDeleted:Boolean read FIsDeleted write FIsDeleted;//8
    property MessageToDepartmentId:string read FMessageToDepartmentId write FMessageToDepartmentId;//9;
    property LockMode:TLockMode read FLockMode write FLockMode; //10;
  end;


  {  TMessage  }
  //message Message {
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
    FIsTest: Boolean;
    FLastPatchTimestampTicks: sfixed64;
    FLockMode: TLockMode;
    FMessageId: string;
    FPacketIsLocked: Boolean;
    FProxyBoxId: string;
    FProxyTitle: string;
    FTimestampTicks: sfixed64;
    FToBoxId: string;
    FToTitle: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property MessageId:string read FMessageId write FMessageId; //1;
    property TimestampTicks:sfixed64 read FTimestampTicks write FTimestampTicks; //2;
    property LastPatchTimestampTicks:sfixed64 read FLastPatchTimestampTicks write FLastPatchTimestampTicks; //3;
    property FromBoxId:string read FFromBoxId write FFromBoxId; //4;
    property FromTitle:string read FFromTitle write FFromTitle; //5;
    property ToBoxId:string read FToBoxId write FToBoxId; //6;
    property ToTitle:string read FToTitle write FToTitle; //7;
    property Entities:TEntitys read FEntities; //8;
    property IsDraft:Boolean read FIsDraft write FIsDraft; //9
    property DraftIsLocked:Boolean read FDraftIsLocked write FDraftIsLocked; //10
    property DraftIsRecycled:Boolean read FDraftIsRecycled write FDraftIsRecycled; //11
    property CreatedFromDraftId:string read FCreatedFromDraftId write FCreatedFromDraftId; //12;
    property DraftIsTransformedToMessageIdList:TDocumentStrings read FDraftIsTransformedToMessageIdList;//13;
    property IsDeleted:Boolean read FIsDeleted write FIsDeleted; //14
    property IsTest:Boolean read FIsTest write FIsTest; //15
    property IsInternal:Boolean read FIsInternal write FIsInternal; //16
    property IsProxified:Boolean read FIsProxified write FIsProxified; //17
    property ProxyBoxId:string read FProxyBoxId write FProxyBoxId; //18;
    property ProxyTitle:string read FProxyTitle write FProxyTitle; //19;
    property PacketIsLocked:Boolean read FPacketIsLocked write FPacketIsLocked; //20
    property LockMode:TLockMode read FLockMode write FLockMode;//21;
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
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property EventId:string read FEventId write FEventId;//1;
    property Message:TMessage read FMessage;//2;
    property Patch:TMessagePatch read FPatch; //3;
  end;

  TBoxEvents = specialize GSerializationObjectList<TBoxEvent>;

  {  TBoxEventList  }
  //message BoxEventList {
  //	repeated BoxEvent Events = 1;
  //	optional int32 TotalCount = 2;
  //}
  TBoxEventList = class(TSerializationObject)
  private
    FEvents: TBoxEvents;
    FTotalCount: int32;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Events:TBoxEvents read FEvents;//1;
    property TotalCount:int32 read FTotalCount write FTotalCount;//2;
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

{ TBoxEventList }

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
end;

destructor TBoxEventList.Destroy;
begin
  FreeAndNil(FEvents);
  inherited Destroy;
end;

{ TBoxEvent }

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
  RegisterProp('LockMode', 10);
end;

destructor TTemplate.Destroy;
begin
  FreeAndNil(FEntities);
  inherited Destroy;
end;

{ TMessagePatch }

procedure TMessagePatch.InternalInit;
begin
  inherited InternalInit;
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
end;

procedure TMessagePatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  FEntities:=TEntitys.Create;
  FDraftIsTransformedToMessageIdList:=TDocumentStrings.Create;
  FEntityPatches:=TEntityPatchs.Create;
end;

destructor TMessagePatch.Destroy;
begin
  FreeAndNil(FEntities);
  FreeAndNil(FDraftIsTransformedToMessageIdList);
  FreeAndNil(FEntityPatches);
  inherited Destroy;
end;

{ TEntityPatch }

procedure TEntityPatch.InternalInit;
begin
  inherited InternalInit;
  RegisterProp('EntityId', 1, true);
  RegisterProp('DocumentIsDeleted', 2);
  RegisterProp('MovedToDepartment', 3);
  RegisterProp('DocumentIsRestored', 4);
  RegisterProp('ContentIsPatched', 5);
  RegisterProp('ForwardedToBoxId', 6);
end;

procedure TEntityPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
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
  RegisterProp('EntityId', 2);
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
  inherited Destroy;
end;

{ TMessage }

procedure TMessage.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('MessageId', 1);
  RegisterProp('TimestampTicks', 2);
  RegisterProp('LastPatchTimestampTicks', 3);
  RegisterProp('FromBoxId', 4);
  RegisterProp('FromTitle', 5);
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
  RegisterProp('LockMode', 21);
end;

procedure TMessage.InternalInit;
begin
  inherited InternalInit;
  FEntities:=TEntitys.Create;
  FDraftIsTransformedToMessageIdList:=TDocumentStrings.Create;
end;

destructor TMessage.Destroy;
begin
  FreeAndNil(FEntities);
  FreeAndNil(FDraftIsTransformedToMessageIdList);
  inherited Destroy;
end;

end.

