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
// Протобуферы для пишущих методов API:
//	PostMessage(MessageToPost message) : Message
//	PostMessagePatch(MessagePatchToPost messagePatch) : MessagePatch

unit DiadocTypes_DiadocMessage_PostApi;

{$I diadoc_define.inc}

interface

//import "DocumentId.proto";
//import "CustomDataItem.proto";
//import "LockMode.proto";
//import "Invoicing/Signer.proto";
//import "Invoicing/ExtendedSigner.proto";
//import "Events/ResolutionInfo.proto";
//import "Events/ResolutionRequestInfo.proto";
//import "Invoicing/OrganizationInfo.proto";
//import "Docflow/DocumentInfo.proto";
uses
  Classes, SysUtils, protobuf_fpc, protobuf_fpc_types, diadoc_simple_arrays,
  DiadocTypes_DocumentId,
  DiadocTypes_CustomDataItem,
  DiadocTypes_LockMode,
  DiadocTypes_Signer,
  DiadocTypes_ExtendedSigner,
  DiadocTypes_ResolutionInfo,
  DiadocTypes_ResolutionRequestInfo,
  DiadocTypes_OrganizationInfo,
  DiadocTypes_DocumentInfo,
  DiadocTypes_ResolutionType,
  DiadocTypes_ResolutionRequestType
  ;

type
  TCustomDataPatchOperation = (
    cdpoSet = 0,
    cdpoRemove = 1
  );


  {  TDocumentTransformation  }
  //message DocumentTransformation {
  //	required string DocumentId = 1;
  //	optional string CustomDocumentId = 2;
  //}
  TDocumentTransformation = class(TSerializationObject) //message DocumentTransformation
  private
    FCustomDocumentId: string;
    FDocumentId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:string read FDocumentId write FDocumentId;//1;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//2;
  end;
  TDocumentTransformations = specialize GSerializationObjectList<TDocumentTransformation>;

  {  TTemplateTransformationToPost  }
  //message TemplateTransformationToPost {
  //	required string BoxId = 1;
  //	required string TemplateId = 2;
  //	repeated DocumentTransformation DocumentTransformations = 3;
  //}
  TTemplateTransformationToPost = class(TSerializationObject) //message TemplateTransformationToPost
  private
    FBoxId: string;
    FDocumentTransformations: TDocumentTransformations;
    FTemplateId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId;//1;
    property TemplateId:string read FTemplateId write FTemplateId;//2;
    property DocumentTransformations:TDocumentTransformations read FDocumentTransformations;//3;
  end;


  {  TUnsignedContent  }
  //message UnsignedContent {
  //	optional bytes Content = 1;
  //	optional string NameOnShelf = 2;
  //}
  TUnsignedContent = class(TSerializationObject) //message UnsignedContent
  private
    FContent: TBytes;
    FNameOnShelf: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Content:TBytes read FContent write FContent;//1;
    property NameOnShelf:string read FNameOnShelf write FNameOnShelf;//2;
  end;

  { TMetadataItem }
  //message MetadataItem {
  //	required string Key = 1;
  //	required string Value = 2;
  //}
  TMetadataItem = class(TSerializationObject) //message MetadataItem
  private
    FKey: string;
    FValue: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property Key:string read FKey write FKey;//1;
    property Value:string read FValue write FValue;//2;
  end;
  TMetadataItems = specialize GSerializationObjectList<TMetadataItem>;

  { TPredefinedRecipientTitle }
  //message PredefinedRecipientTitle {
  //    required UnsignedContent UnsignedContent = 1;
  //}
  TPredefinedRecipientTitle = class(TSerializationObject) //message PredefinedRecipientTitle
  private
    FUnsignedContent: TUnsignedContent;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property UnsignedContent:TUnsignedContent read FUnsignedContent;//1;
  end;

  {  TTemplateDocumentAttachment  }
  //message TemplateDocumentAttachment {
  //	required UnsignedContent UnsignedContent = 1;
  //	optional string Comment = 2;
  //	required string TypeNamedId = 3;
  //	optional string Function = 4;
  //	optional string Version = 5;
  //	repeated MetadataItem Metadata = 6;
  //	optional int32 WorkflowId = 7;
  //	optional string CustomDocumentId = 8;
  //	optional string EditingSettingId = 9;
  //	optional bool NeedRecipientSignature = 10 [default = false];
  //    optional PredefinedRecipientTitle PredefinedRecipientTitle = 11;
  //}
  TTemplateDocumentAttachment = class(TSerializationObject) //message TemplateDocumentAttachment
  private
    FComment: string;
    FCustomDocumentId: string;
    FEditingSettingId: string;
    FFunctionType: string;
    FMetadata: TMetadataItems;
    FNeedRecipientSignature: Boolean;
    FPredefinedRecipientTitle: TPredefinedRecipientTitle;
    FTypeNamedId: string;
    FUnsignedContent: TUnsignedContent;
    FVersion: string;
    FWorkflowId: int32;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property UnsignedContent:TUnsignedContent read FUnsignedContent;//1;
    property Comment:string read FComment write FComment;//2;
    property TypeNamedId:string read FTypeNamedId write FTypeNamedId;//3;
    property FunctionType:string read FFunctionType write FFunctionType;//4;
    property Version:string read FVersion write FVersion;//5;
    property Metadata:TMetadataItems read FMetadata;//6;
    property WorkflowId:int32 read FWorkflowId write FWorkflowId;//7;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//8;
    property EditingSettingId:string read FEditingSettingId write FEditingSettingId;//9;
    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write FNeedRecipientSignature;//10
    property PredefinedRecipientTitle:TPredefinedRecipientTitle read FPredefinedRecipientTitle;//11;
  end;
  TTemplateDocumentAttachments = specialize GSerializationObjectList<TTemplateDocumentAttachment>;

  {  TTemplateToPost  }
  //message TemplateToPost {
  //	required string FromBoxId = 1;
  //	required string ToBoxId = 2;
  //	required string MessageFromBoxId = 3;
  //	required string MessageToBoxId = 4;
  //	optional string MessageToDepartmentId = 5;
  //	repeated TemplateDocumentAttachment DocumentAttachments = 6;
  //    optional LockMode LockMode = 7 [default = None];
  //}
  TTemplateToPost = class(TSerializationObject) //message TemplateToPost
  private
    FDocumentAttachments: TTemplateDocumentAttachments;
    FFromBoxId: string;
    FLockMode: TLockMode;
    FMessageFromBoxId: string;
    FMessageToBoxId: string;
    FMessageToDepartmentId: string;
    FToBoxId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FromBoxId:string read FFromBoxId write FFromBoxId;//1;
    property ToBoxId:string read FToBoxId write FToBoxId;//2;
    property MessageFromBoxId:string read FMessageFromBoxId write FMessageFromBoxId;//3;
    property MessageToBoxId:string read FMessageToBoxId write FMessageToBoxId;//4;
    property MessageToDepartmentId:string read FMessageToDepartmentId write FMessageToDepartmentId;//5;
    property DocumentAttachments:TTemplateDocumentAttachments read FDocumentAttachments; //6;
    property LockMode:TLockMode read FLockMode write FLockMode;//7 [default = None];
  end;

  {  TResolutionRouteRemoval  }
  //message ResolutionRouteRemoval {
  //	required string ParentEntityId = 1; // EntityId документа, который нужно снять с маршрута согласования
  //	required string RouteId = 2; // Идентификатор маршрута, с которого нужно снять документ
  //	optional string Comment = 3 [default = ""]; // Текстовый комментарий, ограничение - 256 символов
  //	repeated string Labels = 4;
  //}
  TResolutionRouteRemoval = class(TSerializationObject) //message ResolutionRouteRemoval
  private
    FComment: string;
    FLabels: TDocumentStrings;
    FParentEntityId: string;
    FRouteId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId;//1;
    property RouteId:string read FRouteId write FRouteId;//2;
    property Comment:string read FComment write FComment;//3
    property Labels:TDocumentStrings read FLabels;//= 4;
  end;
  TResolutionRouteRemovals = specialize GSerializationObjectList<TResolutionRouteRemoval>;

  {  TEditDocumentPacketCommand  }
  //message EditDocumentPacketCommand {
  //	required string DocumentId = 1;
  //	repeated DocumentId AddDocumentsToPacket = 2;
  //	repeated DocumentId RemoveDocumentsFromPacket = 3;
  //}
  TEditDocumentPacketCommand = class(TSerializationObject) //message EditDocumentPacketCommand
  private
    FAddDocumentsToPacket: TDocumentIds;
    FDocumentId: string;
    FRemoveDocumentsFromPacket: TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:string read FDocumentId write FDocumentId; //1;
    property AddDocumentsToPacket:TDocumentIds read FAddDocumentsToPacket;//2;
    property RemoveDocumentsFromPacket:TDocumentIds read FRemoveDocumentsFromPacket;//3;
  end;
  TEditDocumentPacketCommands = specialize GSerializationObjectList<TEditDocumentPacketCommand>;

  {  TCustomDataPatch  }
  //message CustomDataPatch {
  //	required string ParentEntityId = 1;
  //	required CustomDataPatchOperation Operation = 2;
  //	required string Key = 3;
  //	optional string Value = 4;
  //}
  TCustomDataPatch = class(TSerializationObject) //message CustomDataPatch
  private
    FKey: string;
    FOperation: TCustomDataPatchOperation;
    FParentEntityId: string;
    FValue: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId;//1;
    property Operation:TCustomDataPatchOperation read FOperation write FOperation;//2;
    property Key:string read FKey write FKey;//3;
    property Value:string read FValue write FValue;//4;
  end;
  TCustomDataPatchs = specialize GSerializationObjectList<TCustomDataPatch>;

  {  TRoamingNotificationToPost  }
  //message RoamingNotificationToPost {
  //	required string BoxId = 1;
  //	required string EventId = 2;
  //	required bool Success = 3;
  //	optional string Description = 4;
  //}
  TRoamingNotificationToPost = class(TSerializationObject) //message RoamingNotificationToPost
  private
    FBoxId: string;
    FDescription: string;
    FEventId: string;
    FSuccess: Boolean;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId;//1;
    property EventId:string read FEventId write FEventId;//2;
    property Success:Boolean read FSuccess write FSuccess;//3;
    property Description:string read FDescription write FDescription;//4;
  end;


  {  TSignedContent  }
  //message SignedContent {
  //	optional bytes Content = 1;
  //	optional bytes Signature = 2;
  //	optional string NameOnShelf = 4;
  //	optional bool SignWithTestSignature = 5 [default = false];
  //	optional string SignatureNameOnShelf = 6;
  //}
  TSignedContent = class(TSerializationObject) //message SignedContent
  private
    FContent: TBytes;
    FNameOnShelf: string;
    FSignature: TBytes;
    FSignatureNameOnShelf: string;
    FSignWithTestSignature: Boolean;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Content:TBytes read FContent write FContent;//1;
    property Signature:TBytes read FSignature write FSignature;//2;
    property NameOnShelf:string read FNameOnShelf write FNameOnShelf;//4;
    property SignWithTestSignature:Boolean read FSignWithTestSignature write FSignWithTestSignature;//5
    property SignatureNameOnShelf:string read FSignatureNameOnShelf write FSignatureNameOnShelf;//6;
  end;

  {  TXmlSignatureRejectionAttachment  }
  //message XmlSignatureRejectionAttachment {
  //	required string ParentEntityId = 1;
  //	required SignedContent SignedContent = 2;
  //	repeated string Labels = 3;
  //}
  TXmlSignatureRejectionAttachment = class(TSerializationObject) //message XmlSignatureRejectionAttachment
  private
    FLabels: TDocumentStrings;
    FParentEntityId: string;
    FSignedContent: TSignedContent;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId;//1;
    property SignedContent:TSignedContent read FSignedContent;//2;
    property Labels:TDocumentStrings read FLabels; //3;
  end;
  TXmlSignatureRejectionAttachments = specialize GSerializationObjectList<TXmlSignatureRejectionAttachment>;

  {  TRevocationRequestAttachment  }
  //message RevocationRequestAttachment {
  //	required string ParentEntityId = 1;
  //	required SignedContent SignedContent = 2;
  //	repeated string Labels = 3;
  //}
  TRevocationRequestAttachment = class(TSerializationObject) //message RevocationRequestAttachment
  private
    FLabels: TDocumentStrings;
    FParentEntityId: string;
    FSignedContent: TSignedContent;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId; //1;
    property SignedContent:TSignedContent read FSignedContent;//2;
    property Labels:TDocumentStrings read FLabels;//3;
  end;
  TRevocationRequestAttachments = specialize GSerializationObjectList<TRevocationRequestAttachment>;

  {  TDocumentSignature  }
  //message DocumentSignature {
  //	required string ParentEntityId = 1;
  //	optional bytes Signature = 2;
  //	optional bool SignWithTestSignature = 4 [default = false];
  //	optional bool IsApprovementSignature = 5 [default = false];
  //	optional string SignatureNameOnShelf = 6;
  //	optional string PatchedContentId = 7;
  //	repeated string Labels = 8;
  //}
  TDocumentSignature = class(TSerializationObject) //message DocumentSignature
  private
    FIsApprovementSignature: boolean;
    FLabels: TDocumentStrings;
    FParentEntityId: string;
    FPatchedContentId: string;
    FSignature: TBytes;
    FSignatureNameOnShelf: string;
    FSignWithTestSignature: boolean;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId;//1;
    property Signature:TBytes read FSignature write FSignature;//2;
    property SignWithTestSignature:boolean read FSignWithTestSignature write FSignWithTestSignature;//4
    property IsApprovementSignature:boolean read FIsApprovementSignature write FIsApprovementSignature;//5
    property SignatureNameOnShelf:string read FSignatureNameOnShelf write FSignatureNameOnShelf;//6;
    property PatchedContentId:string read FPatchedContentId write FPatchedContentId;//7;
    property Labels:TDocumentStrings read FLabels; //8;
  end;
  TDocumentSignatures = specialize GSerializationObjectList<TDocumentSignature>;

  {  TMessageToSend  }
  //message MessageToSend {
  //	required string BoxId = 1;
  //	required string MessageId = 2;
  //	repeated DocumentSignature DocumentSignatures = 3;
  //}
  TMessageToSend = class(TSerializationObject) //message MessageToSend
  private
    FBoxId: string;
    FDocumentSignatures: TDocumentSignatures;
    FMessageId: String;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId;//1;
    property MessageId:String read FMessageId write FMessageId;//2;
    property DocumentSignatures:TDocumentSignatures read FDocumentSignatures;//3;
  end;


  {  TDocumentPatchedContent  }
  //message DocumentPatchedContent {
  //	required DocumentId DocumentId = 1;
  //	required string PatchedContentId = 2;
  //	optional bytes Content = 3;
  //}
  TDocumentPatchedContent = class(TSerializationObject) //message DocumentPatchedContent
  private
    FContent: TBytes;
    FDocumentId: TDocumentId;
    FPatchedContentId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:TDocumentId read FDocumentId; //1;
    property PatchedContentId:string read FPatchedContentId write FPatchedContentId;//2;
    property Content:TBytes read FContent write FContent;//3;
  end;
  TDocumentPatchedContents = specialize GSerializationObjectList<TDocumentPatchedContent>;

  {  TPrepareDocumentsToSignResponse  }
  //message PrepareDocumentsToSignResponse {
  //	repeated DocumentPatchedContent DocumentPatchedContents = 1;
  //}
  TPrepareDocumentsToSignResponse = class(TSerializationObject) //message PrepareDocumentsToSignResponse
  private
    FDocumentPatchedContents: TDocumentPatchedContents;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentPatchedContents:TDocumentPatchedContents read FDocumentPatchedContents;//1;
  end;


  {  TDocumentToPatch  }
  //message DocumentToPatch {
  //	required DocumentId DocumentId = 1;
  //	optional Invoicing.Signer Signer = 2;
  //	repeated Invoicing.Signers.ExtendedSigner ExtendedSigner = 3;
  //}
  TDocumentToPatch = class(TSerializationObject) //message DocumentToPatch
  private
    FDocumentId: TDocumentId;
    FExtendedSigner: TExtendedSigners;
    FSigner: TSigner;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:TDocumentId read FDocumentId;//1;
    property Signer:TSigner read FSigner; //2;
    property ExtendedSigner:TExtendedSigners  read FExtendedSigner; //3;
  end;
  TDocumentToPatchs = specialize GSerializationObjectList<TDocumentToPatch>;

  {  TContentToPatch  }
  //message ContentToPatch {
  //	required string TypeNamedId = 1;
  //	required string Function = 2;
  //	required string Version = 3;
  //	required UnsignedContent Content = 4;
  //	optional string ToBoxId = 5;
  //	optional Invoicing.Signer Signer = 6;
  //	repeated Invoicing.Signers.ExtendedSigner ExtendedSigner = 7;
  //}
  TContentToPatch = class(TSerializationObject) //message ContentToPatch
  private
    FContent: TUnsignedContent;
    FExtendedSigner: TExtendedSigners;
    FFunctionType: string;
    FSigner: TSigner;
    FToBoxId: string;
    FTypeNamedId: string;
    FVersion: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TypeNamedId:string read FTypeNamedId write FTypeNamedId;//1;
    property FunctionType:string read FFunctionType write FFunctionType;//2;
    property Version:string read FVersion write FVersion;//3;
    property Content:TUnsignedContent read FContent write FContent;//4;
    property ToBoxId:string read FToBoxId write FToBoxId;//5;
    property Signer:TSigner read FSigner;//6;
    property ExtendedSigner:TExtendedSigners read FExtendedSigner;//7;
  end;
  TContentToPatchs = specialize GSerializationObjectList<TContentToPatch>;

  {  TDraftDocumentToPatch  }
  //message DraftDocumentToPatch {
  //	required DocumentId DocumentId = 1;
  //	optional string ToBoxId = 2;
  //	optional Invoicing.Signer Signer = 3;
  //	repeated Invoicing.Signers.ExtendedSigner ExtendedSigner = 4;
  //}
  TDraftDocumentToPatch = class(TSerializationObject) //message DraftDocumentToPatch
  private
    FDocumentId: TDocumentId;
    FExtendedSigner: TExtendedSigners;
    FSigner: TSigner;
    FToBoxId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:TDocumentId read FDocumentId; //1;
    property ToBoxId:string read FToBoxId write FToBoxId;//2;
    property Signer:TSigner read FSigner;//3;
    property ExtendedSigner:TExtendedSigners read FExtendedSigner;//4;
  end;
  TDraftDocumentToPatchs = specialize GSerializationObjectList<TDraftDocumentToPatch>;

  {  TPrepareDocumentsToSignRequest  }
  //message PrepareDocumentsToSignRequest {
  //	required string BoxId = 1;
  //	repeated DraftDocumentToPatch DraftDocuments = 2;
  //	repeated DocumentToPatch Documents = 3;
  //	repeated ContentToPatch Contents = 4;
  //}
  TPrepareDocumentsToSignRequest = class(TSerializationObject) //message PrepareDocumentsToSignRequest
  private
    FBoxId: string;
    FContents: TContentToPatchs;
    FDocuments: TDocumentToPatchs;
    FDraftDocuments: TDraftDocumentToPatchs;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId;//1;
    property DraftDocuments:TDraftDocumentToPatchs read FDraftDocuments; //2;
    property Documents:TDocumentToPatchs read FDocuments;//3;
    property Contents:TContentToPatchs read FContents;//4;
  end;


  {  TDocumentSenderSignature  }
  //message DocumentSenderSignature {
  //	required string ParentEntityId = 1;
  //	optional bytes Signature = 2;
  //	optional bool SignWithTestSignature = 4 [default = false];
  //	optional string PatchedContentId = 5;
  //}
  TDocumentSenderSignature = class(TSerializationObject) //message DocumentSenderSignature
  private
    FParentEntityId: string;
    FPatchedContentId: String;
    FSignature: TBytes;
    FSignWithTestSignature: Boolean;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId;//1;
    property Signature:TBytes read FSignature write FSignature;//2;
    property SignWithTestSignature:Boolean read FSignWithTestSignature write FSignWithTestSignature;//4
    property PatchedContentId:String read FPatchedContentId write FPatchedContentId;//5;
  end;
  TDocumentSenderSignatures = specialize GSerializationObjectList<TDocumentSenderSignature>;

  {  TDraftToSend  }
  //message DraftToSend {
  //	required string BoxId = 1;
  //	required string DraftId = 2;
  //	optional string ToBoxId = 3;
  //	optional string ToDepartmentId = 4;
  //	repeated DocumentSenderSignature DocumentSignatures = 5;
  //	optional string ProxyBoxId = 6;
  //	optional string ProxyDepartmentId = 7;
  //}
  TDraftToSend = class(TSerializationObject) //message DraftToSend
  private
    FBoxId: string;
    FDocumentSignatures: TDocumentSenderSignatures;
    FDraftId: string;
    FProxyBoxId: string;
    FProxyDepartmentId: string;
    FToBoxId: string;
    FToDepartmentId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId;//1;
    property DraftId:string read FDraftId write FDraftId;//2;
    property ToBoxId:string read FToBoxId write FToBoxId;//3;
    property ToDepartmentId:string read FToDepartmentId write FToDepartmentId;//4;
    property DocumentSignatures:TDocumentSenderSignatures read FDocumentSignatures;//5;
    property ProxyBoxId:string read FProxyBoxId write FProxyBoxId;//6;
    property ProxyDepartmentId:string read FProxyDepartmentId write FProxyDepartmentId;//7;
  end;

  {  TRequestedSignatureRejection  }
  //message RequestedSignatureRejection {
  //	required string ParentEntityId = 1;
  //	required SignedContent SignedContent = 2;
  //	repeated string Labels = 3;
  //}
  TRequestedSignatureRejection = class(TSerializationObject) //message RequestedSignatureRejection
  private
    FLabels: TDocumentStrings;
    FParentEntityId: string;
    FSignedContent: TSignedContent;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId; //1;
    property SignedContent:TSignedContent read FSignedContent;//2;
    property Labels:TDocumentStrings read FLabels;//3;
  end;
  TRequestedSignatureRejections = specialize GSerializationObjectList<TRequestedSignatureRejection>;

  {  TCorrectionRequestAttachment  }
  //message CorrectionRequestAttachment {
  //	required string ParentEntityId = 1;
  //	required SignedContent SignedContent = 2;
  //	// do not use field #3
  //	repeated string Labels = 4;
  //}
  TCorrectionRequestAttachment = class(TSerializationObject) //message CorrectionRequestAttachment
  private
    FLabels: TDocumentStrings;
    FParentEntityId: string;
    FSignedContent: TSignedContent;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId; //1;
    property SignedContent:TSignedContent read FSignedContent;//2;
    property Labels:TDocumentStrings read FLabels;//4;
  end;
  TCorrectionRequestAttachments = specialize GSerializationObjectList<TCorrectionRequestAttachment>;

  //message RecipientTitleAttachment {
  //    required string ParentEntityId = 1;
  //    required SignedContent SignedContent = 2;
  //    repeated string Labels = 4;
  //    required bool NeedReceipt = 5 [default = false];
  //}

  { TRecipientTitleAttachment }

  TRecipientTitleAttachment = class(TSerializationObject) //message RecipientTitleAttachment
  private
    FLabels: TDocumentStrings;
    FNeedReceipt: Boolean;
    FParentEntityId: string;
    FSignedContent: TSignedContent;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId;//1;
    property SignedContent:TSignedContent read FSignedContent;//2;
    property Labels:TDocumentStrings read FLabels;//4;
    property NeedReceipt:Boolean read FNeedReceipt write FNeedReceipt default false;//5;
  end;
  TRecipientTitleAttachments = specialize GSerializationObjectList<TRecipientTitleAttachment>;


  {  TReceiptAttachment  }
  //message ReceiptAttachment {
  //	required string ParentEntityId = 1;
  //	required SignedContent SignedContent = 2;
  //	// do not use field #3
  //	repeated string Labels = 4;
  //}
  TReceiptAttachment = class(TSerializationObject) //message ReceiptAttachment
  private
    FLabels: TDocumentStrings;
    FParentEntityId: string;
    FSignedContent: TSignedContent;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId; //1;
    property SignedContent:TSignedContent read FSignedContent;//2;
    property Labels:TDocumentStrings read FLabels;//4;
  end;
  TReceiptAttachments = specialize GSerializationObjectList<TReceiptAttachment>;

  {  TResolutionAttachment  }
  //message ResolutionAttachment {
  //	required string InitialDocumentId = 1;
  //	required ResolutionType ResolutionType = 2;
  //	optional string Comment = 3;
  //	repeated string Labels = 4;
  //}
  TResolutionAttachment = class(TSerializationObject) //message ResolutionAttachment
  private
    FComment: string;
    FInitialDocumentId: string;
    FLabels: TDocumentStrings;
    FResolutionType: TResolutionType;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialDocumentId:string read FInitialDocumentId write FInitialDocumentId; //1
    property ResolutionType:TResolutionType read FResolutionType write FResolutionType; //2
    property Comment:string read FComment write FComment; //3;
    property Labels:TDocumentStrings read FLabels; //4;
  end;
  TResolutionAttachments = specialize GSerializationObjectList<TResolutionAttachment>;

  { TResolutionRequestDenialAttachment }
  //message ResolutionRequestDenialAttachment {
  //	required string InitialResolutionRequestId = 1;
  //	optional string Comment = 2;
  //	repeated string Labels = 3;
  //}
  TResolutionRequestDenialAttachment = class(TSerializationObject) //message ResolutionRequestDenialAttachment
  private
    FComment: string;
    FInitialResolutionRequestId: string;
    FLabels: TDocumentStrings;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialResolutionRequestId:string read FInitialResolutionRequestId write FInitialResolutionRequestId;//1;
    property Comment:string read FComment write FComment;//2;
    property Labels:TDocumentStrings read FLabels; //3;
  end;
  TResolutionRequestDenialAttachments = specialize GSerializationObjectList<TResolutionRequestDenialAttachment>;

  { TResolutionRequestDenialCancellationAttachment }
  //message ResolutionRequestDenialCancellationAttachment {
  //	required string InitialResolutionRequestDenialId = 1;
  //}
  TResolutionRequestDenialCancellationAttachment = class(TSerializationObject) //message ResolutionRequestDenialCancellationAttachment
  private
    FInitialResolutionRequestDenialId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialResolutionRequestDenialId:string read FInitialResolutionRequestDenialId write FInitialResolutionRequestDenialId;//1;
  end;
  TResolutionRequestDenialCancellationAttachments = specialize GSerializationObjectList<TResolutionRequestDenialCancellationAttachment>;

  { TResolutionRequestCancellationAttachment }
  //message ResolutionRequestCancellationAttachment {
  //	required string InitialResolutionRequestId = 1;
  //	optional string Comment = 2;
  //	repeated string Labels = 3;
  //}
  TResolutionRequestCancellationAttachment = class(TSerializationObject) //message ResolutionRequestCancellationAttachment
  private
    FComment: string;
    FInitialResolutionRequestId: string;
    FLabels: TDocumentStrings;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialResolutionRequestId:string read FInitialResolutionRequestId write FInitialResolutionRequestId; //1
    property Comment:string read FComment write FComment; //2
    property Labels:TDocumentStrings read FLabels; //3
  end;
  TResolutionRequestCancellationAttachments = specialize GSerializationObjectList<TResolutionRequestCancellationAttachment>;

  {  TResolutionRouteAssignment  }
  //message ResolutionRouteAssignment
  //{
  //	required string InitialDocumentId = 1;
  //	required string RouteId = 2;
  //	optional string Comment = 3;
  //	repeated string Labels = 4;
  //}
  TResolutionRouteAssignment = class(TSerializationObject) //message ResolutionRouteAssignment
  private
    FComment: string;
    FInitialDocumentId: string;
    FLabels: TDocumentStrings;
    FRouteId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialDocumentId:string read FInitialDocumentId write FInitialDocumentId;//1;
    property RouteId:string read FRouteId write FRouteId;//2;
    property Comment:string read FComment write FComment;//3;
    property Labels:TDocumentStrings read FLabels; //4
  end;
  TResolutionRouteAssignments = specialize GSerializationObjectList<TResolutionRouteAssignment>;

  { TResolutionRequestAttachment }
  //message ResolutionRequestAttachment {
  //	required string InitialDocumentId = 1;
  //	required ResolutionRequestType Type = 2;
  //	optional string TargetUserId = 3;
  //	optional string TargetDepartmentId = 4;
  //	optional string Comment = 5;
  //	repeated string Labels = 6;
  //}
  TResolutionRequestAttachment = class(TSerializationObject) //message ResolutionRequestAttachment
  private
    FComment: string;
    FInitialDocumentId: string;
    FLabels: TDocumentStrings;
    FResType: TResolutionRequestType;
    FTargetDepartmentId: string;
    FTargetUserId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialDocumentId:string read FInitialDocumentId write FInitialDocumentId; //1;
    property ResType:TResolutionRequestType read FResType write FResType; //2;
    property TargetUserId:string read FTargetUserId write FTargetUserId; //3;
    property TargetDepartmentId:string read FTargetDepartmentId write FTargetDepartmentId; //4;
    property Comment:string read FComment write FComment; //5;
    property Labels:TDocumentStrings read FLabels; //6;
  end;
  TResolutionRequestAttachments = specialize GSerializationObjectList<TResolutionRequestAttachment>;

  {  TSignatureVerification  }
  //message SignatureVerification {
  //	required string InitialDocumentId = 1;
  //	required bool IsValid = 2;
  //	optional string ErrorMessage = 3;
  //	repeated string Labels = 4;
  //}
  TSignatureVerification = class(TSerializationObject) //message SignatureVerification
  private
    FErrorMessage: string;
    FInitialDocumentId: string;
    FIsValid: Boolean;
    FLabels: TDocumentStrings;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialDocumentId:string read FInitialDocumentId write FInitialDocumentId;//1;
    property IsValid:Boolean read FIsValid write FIsValid;//2;
    property ErrorMessage:string read FErrorMessage write FErrorMessage;//3;
    property Labels:TDocumentStrings read FLabels; //4;
  end;
  TSignatureVerifications = specialize GSerializationObjectList<TSignatureVerification>;

  { TEditingPatch }
  //message EditingPatch {
  //    required string ParentEntityId = 1;
  //    required UnsignedContent Content = 2;
  //    repeated string Labels = 3;
  // }
  TEditingPatch = class(TSerializationObject) //message EditingPatch
  private
    FContent: TUnsignedContent;
    FLabels: TDocumentStrings;
    FParentEntityId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write FParentEntityId;//1;
    property Content:TUnsignedContent read FContent write FContent;//2;
    property Labels:TDocumentStrings read FLabels; //3;
  end;
  TEditingPatchs = specialize GSerializationObjectList<TEditingPatch>;

  {  TMessagePatchToPost  }
  //message MessagePatchToPost {
  //    required string BoxId = 1;
  //    required string MessageId = 2;
  //    repeated ReceiptAttachment Receipts = 3;
  //    repeated CorrectionRequestAttachment CorrectionRequests = 4;
  //    repeated DocumentSignature Signatures = 5;
  //    repeated RequestedSignatureRejection RequestedSignatureRejections = 6;
  //    repeated RecipientTitleAttachment XmlTorg12BuyerTitles = 7;
  //    repeated RecipientTitleAttachment XmlAcceptanceCertificateBuyerTitles = 8;
  //    repeated ResolutionAttachment Resolutions = 9;
  //    repeated ResolutionRequestAttachment ResolutionRequests = 10;
  //    repeated ResolutionRequestCancellationAttachment ResolutionRequestCancellations = 11;
  //    repeated ResolutionRequestDenialAttachment ResolutionRequestDenials = 12;
  //    repeated ResolutionRequestDenialCancellationAttachment ResolutionRequestDenialCancellations = 13;
  //    repeated RevocationRequestAttachment RevocationRequests = 14;
  //    repeated XmlSignatureRejectionAttachment XmlSignatureRejections = 15;
  //    repeated CustomDataPatch CustomDataPatches = 16;
  //    repeated ResolutionRouteAssignment ResolutionRouteAssignments = 17;
  //    repeated SignatureVerification SignatureVerifications = 18;
  //    repeated EditDocumentPacketCommand EditDocumentPacketCommands = 19;
  //    repeated RecipientTitleAttachment UniversalTransferDocumentBuyerTitles = 20;
  //    repeated ResolutionRouteRemoval ResolutionRouteRemovals = 21;
  //    repeated RecipientTitleAttachment RecipientTitles = 22;
  //    repeated EditingPatch EditingPatches = 24;
  //}
  TMessagePatchToPost = class(TSerializationObject) //message MessagePatchToPost
  private
    FBoxId: string;
    FCorrectionRequests: TCorrectionRequestAttachments;
    FCustomDataPatches: TCustomDataPatchs;
    FEditDocumentPacketCommands: TEditDocumentPacketCommands;
    FEditingPatches: TEditingPatchs;
    //FEditingPatches: TCustomDataPatchs;
    FMessageId: string;
    FReceipts: TReceiptAttachments;
    FRecipientTitles: TRecipientTitleAttachments;
    FRequestedSignatureRejections: TRequestedSignatureRejections;
    FResolutionRequestCancellations: TResolutionRequestCancellationAttachments;
    FResolutionRequestDenialCancellations: TResolutionRequestDenialCancellationAttachments;
    FResolutionRequestDenials: TResolutionRequestDenialAttachments;
    FResolutionRequests: TResolutionRequestAttachments;
    FResolutionRouteAssignments: TResolutionRouteAssignments;
    FResolutionRouteRemovals: TResolutionRouteRemovals;
    FResolutions: TResolutionAttachments;
    FRevocationRequests: TRevocationRequestAttachments;
    FSignatures: TDocumentSignatures;
    FSignatureVerifications: TSignatureVerifications;
    FUniversalTransferDocumentBuyerTitles: TRecipientTitleAttachments;
    FXmlAcceptanceCertificateBuyerTitles: TRecipientTitleAttachments;
    FXmlSignatureRejections: TXmlSignatureRejectionAttachments;
    FXmlTorg12BuyerTitles: TRecipientTitleAttachments;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId;//1;
    property MessageId:string read FMessageId write FMessageId;//2;
    property Receipts:TReceiptAttachments read FReceipts;//3;
    property CorrectionRequests:TCorrectionRequestAttachments read FCorrectionRequests; //4;
    property Signatures:TDocumentSignatures read FSignatures;//5;
    property RequestedSignatureRejections:TRequestedSignatureRejections read FRequestedSignatureRejections; //6;
    property XmlTorg12BuyerTitles:TRecipientTitleAttachments read FXmlTorg12BuyerTitles; //7;
    property XmlAcceptanceCertificateBuyerTitles:TRecipientTitleAttachments read FXmlAcceptanceCertificateBuyerTitles; //8;
    property Resolutions:TResolutionAttachments read FResolutions;//9;
    property ResolutionRequests:TResolutionRequestAttachments read FResolutionRequests;//10;
    property ResolutionRequestCancellations:TResolutionRequestCancellationAttachments read FResolutionRequestCancellations; //11;
    property ResolutionRequestDenials:TResolutionRequestDenialAttachments read FResolutionRequestDenials;//12;
    property ResolutionRequestDenialCancellations:TResolutionRequestDenialCancellationAttachments read FResolutionRequestDenialCancellations; //13;
    property RevocationRequests:TRevocationRequestAttachments read FRevocationRequests; //14;
    property XmlSignatureRejections:TXmlSignatureRejectionAttachments read FXmlSignatureRejections;//15;
    property CustomDataPatches:TCustomDataPatchs read FCustomDataPatches;//16;
    property ResolutionRouteAssignments:TResolutionRouteAssignments read FResolutionRouteAssignments;//17;
    property SignatureVerifications:TSignatureVerifications read FSignatureVerifications;//18;
    property EditDocumentPacketCommands:TEditDocumentPacketCommands read FEditDocumentPacketCommands;//19;
    property UniversalTransferDocumentBuyerTitles:TRecipientTitleAttachments read FUniversalTransferDocumentBuyerTitles;//20;
    property ResolutionRouteRemovals:TResolutionRouteRemovals read FResolutionRouteRemovals; //21;
    property RecipientTitles:TRecipientTitleAttachments read FRecipientTitles; //22;
    property EditingPatches:TEditingPatchs read FEditingPatches;//24;
  end;


  {  TDocumentAttachment  }
  //message DocumentAttachment {
  //	required SignedContent SignedContent = 1;
  //	// reserved 2 for FileName
  //	optional string Comment = 3;
  //	optional bool NeedRecipientSignature = 4 [default = false];
  //	repeated DocumentId InitialDocumentIds = 5;
  //	repeated DocumentId SubordinateDocumentIds = 6;
  //	// reserved 7 for DocumentDate
  //	// reserved 8 for DocumentNumber
  //	optional string CustomDocumentId = 9;
  //	optional bool NeedReceipt = 10 [default = false];
  //	repeated CustomDataItem CustomData = 11;
  //	required string TypeNamedId = 12;
  //	optional string Function = 13;
  //	optional string Version = 14;
  //	repeated MetadataItem Metadata = 15;
  //	optional int32 WorkflowId = 16;
  //	optional bool IsEncrypted = 17 [default = false];
  //}
  TDocumentAttachment = class(TSerializationObject) //message DocumentAttachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FInitialDocumentIds: TDocumentIds;
    FIsEncrypted: Boolean;
    FMetadata: TMetadataItems;
    FNeedReceipt: boolean;
    FNeedRecipientSignature: Boolean;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
    FTypeNamedId: string;
    FVersion: string;
    FWorkflowId: int32;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    // reserved 2 for FileName
    property Comment:string read FComment write FComment; //3;
    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write FNeedRecipientSignature;//4
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;//5;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//6;
    // reserved 7 for DocumentDate
    // reserved 8 for DocumentNumber
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//9;
    property NeedReceipt:boolean read FNeedReceipt write FNeedReceipt; //10
    property CustomData:TCustomDataItems read FCustomData;//11;
    property TypeNamedId:string read FTypeNamedId write FTypeNamedId; //12;
    property FunctionType:string read FTypeNamedId write FTypeNamedId; //13;
    property Version:string read FVersion write FVersion;//14;
    property Metadata:TMetadataItems read FMetadata; //15;
    property WorkflowId:int32 read FWorkflowId write FWorkflowId;//16;
    property IsEncrypted:Boolean read FIsEncrypted write FIsEncrypted;//17
  end;
  TDocumentAttachments = specialize GSerializationObjectList<TDocumentAttachment>;

  {  TServiceDetailsAttachment  }
  //message ServiceDetailsAttachment {
  //	required SignedContent SignedContent = 1;
  //	required string FileName = 2;
  //	optional string Comment = 3;
  //	// reserved 4 for NeedRecipientSignature
  //	repeated DocumentId InitialDocumentIds = 5;
  //	repeated DocumentId SubordinateDocumentIds = 6;
  //	optional string DocumentDate = 7;
  //	optional string DocumentNumber = 8;
  //	optional string CustomDocumentId = 9;
  //	optional bool NeedReceipt = 10 [default = false];
  //	repeated CustomDataItem CustomData = 11;
  //}
  TServiceDetailsAttachment = class(TSerializationObject) //message ServiceDetailsAttachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FDocumentDate: string;
    FDocumentNumber: string;
    FFileName: string;
    FInitialDocumentIds: TDocumentIds;
    FNeedReceipt: boolean;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write FFileName;//2;
    property Comment:string read FComment write FComment;//3;
    // reserved 4 for NeedRecipientSignature
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;//5;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//6;
    property DocumentDate:string read FDocumentDate write FDocumentDate;//7;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//8;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//9;
    property NeedReceipt:boolean read FNeedReceipt write FNeedReceipt;//10
    property CustomData:TCustomDataItems read FCustomData;//11;
  end;
  TServiceDetailsAttachments = specialize GSerializationObjectList<TServiceDetailsAttachment>;

  {  TSupplementaryAgreementAttachment  }
  //message SupplementaryAgreementAttachment {
  //	required SignedContent SignedContent = 1;
  //	required string FileName = 2;
  //	optional string Comment = 3;
  //	repeated DocumentId InitialDocumentIds = 4;
  //	repeated DocumentId SubordinateDocumentIds = 5;
  //	optional string CustomDocumentId = 6;
  //	required string DocumentDate = 7;
  //	required string DocumentNumber = 8;
  //	optional string Total = 9;
  //	required string ContractNumber = 10;
  //	required string ContractDate = 11;
  //	optional string ContractType = 12;
  //	optional bool NeedReceipt = 13 [default = false];
  //	repeated CustomDataItem CustomData = 14;
  //}
  TSupplementaryAgreementAttachment = class(TSerializationObject) //message SupplementaryAgreementAttachment
  private
    FComment: string;
    FContractDate: string;
    FContractNumber: string;
    FContractType: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FDocumentDate: string;
    FDocumentNumber: string;
    FFileName: string;
    FInitialDocumentIds: TDocumentIds;
    FNeedReceipt: Boolean;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
    FTotal: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write FFileName;//2;
    property Comment:string read FComment write FComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//5;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//6;
    property DocumentDate:string read FDocumentDate write FDocumentDate;//7;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//8;
    property Total:string read FTotal write FTotal;//9;
    property ContractNumber:string read FContractNumber write FContractNumber;//10;
    property ContractDate:string read FContractDate write FContractDate;//11;
    property ContractType:string read FContractType write FContractType;//12;
    property NeedReceipt:Boolean read FNeedReceipt write FNeedReceipt;//13
    property CustomData:TCustomDataItems read FCustomData; //14;
  end;
  TSupplementaryAgreementAttachments = specialize GSerializationObjectList<TSupplementaryAgreementAttachment>;


  {  TContractAttachment  }
  //message ContractAttachment {
  //	required SignedContent SignedContent = 1;
  //	required string FileName = 2;
  //	optional string Comment = 3;
  //	repeated DocumentId InitialDocumentIds = 4;
  //	repeated DocumentId SubordinateDocumentIds = 5;
  //	optional string CustomDocumentId = 6;
  //	required string DocumentDate = 7;
  //	required string DocumentNumber = 8;
  //	optional string ContractPrice = 9;
  //	optional string ContractType = 10;
  //	optional bool NeedReceipt = 11 [default = false];
  //	repeated CustomDataItem CustomData = 12;
  //}
  TContractAttachment = class(TSerializationObject) //message ContractAttachment
  private
    FComment: string;
    FContractPrice: string;
    FContractType: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FDocumentDate: string;
    FDocumentNumber: string;
    FFileName: string;
    FInitialDocumentIds: TDocumentIds;
    FNeedReceipt: Boolean;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write FFileName;//2;
    property Comment:string read FComment write FComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds; //5;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//6;
    property DocumentDate:string read FDocumentDate write FDocumentDate;//7;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//8;
    property ContractPrice:string read FContractPrice write FContractPrice;//9;
    property ContractType:string read FContractType write FContractType;//10;
    property NeedReceipt:Boolean read FNeedReceipt write FNeedReceipt;//11
    property CustomData:TCustomDataItems read FCustomData; //12;
  end;
  TContractAttachments = specialize GSerializationObjectList<TContractAttachment>;

  {  TReconciliationActAttachment  }
  //message ReconciliationActAttachment {
  //	required SignedContent SignedContent = 1;
  //	required string FileName = 2;
  //	optional string Comment = 3;
  //	// reserved 4 for NeedRecipientSignature
  //	repeated DocumentId InitialDocumentIds = 5;
  //	repeated DocumentId SubordinateDocumentIds = 6;
  //	required string DocumentDate = 7;
  //	optional string DocumentNumber = 8 [default = ""];
  //	optional string CustomDocumentId = 9;
  //	optional bool NeedReceipt = 10 [default = false];
  //	repeated CustomDataItem CustomData = 11;
  //}
  TReconciliationActAttachment = class(TSerializationObject) //message ReconciliationActAttachment
  private
    F: string;
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FDocumentDate: string;
    FDocumentNumber: string;
    FFileName: string;
    FInitialDocumentIds: TDocumentIds;
    FNeedReceipt: Boolean;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read F write FFileName;//2;
    property Comment:string read FComment write FComment;//3;
    // reserved 4 for NeedRecipientSignature
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //5;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//6;
    property DocumentDate:string read FDocumentDate write FDocumentDate;//7;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//8
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//9;
    property NeedReceipt:Boolean read FNeedReceipt write FNeedReceipt;//10
    property CustomData:TCustomDataItems read FCustomData;//11;
  end;
  TReconciliationActAttachments = specialize GSerializationObjectList<TReconciliationActAttachment>;


  {  TPriceListAttachment  }
  //message PriceListAttachment {
  //	required SignedContent SignedContent = 1;
  //	required string FileName = 2;
  //	optional string Comment = 3;
  //	repeated DocumentId InitialDocumentIds = 4;
  //	repeated DocumentId SubordinateDocumentIds = 5;
  //	optional string CustomDocumentId = 6;
  //	required string DocumentDate = 7;
  //	required string DocumentNumber = 8;
  //	required string PriceListEffectiveDate = 9;
  //	required string ContractDocumentDate = 10;
  //	required string ContractDocumentNumber = 11;
  //	optional bool NeedReceipt = 12 [default = false];
  //	repeated CustomDataItem CustomData = 13;
  //}
  TPriceListAttachment = class(TSerializationObject) //message PriceListAttachment
  private
    FComment: string;
    FContractDocumentDate: string;
    FContractDocumentNumber: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FDocumentDate: string;
    FDocumentNumber: string;
    FFileName: string;
    FInitialDocumentIds: TDocumentIds;
    FNeedReceipt: Boolean;
    FPriceListEffectiveDate: string;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent;//1;
    property FileName:string read FFileName write FFileName;//2;
    property Comment:string read FComment write FComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//5;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//6;
    property DocumentDate:string read FDocumentDate write FDocumentDate;//7;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//8;
    property PriceListEffectiveDate:string read FPriceListEffectiveDate write FPriceListEffectiveDate;//9;
    property ContractDocumentDate:string read FContractDocumentDate write FContractDocumentDate;//10;
    property ContractDocumentNumber:string read FContractDocumentNumber write FContractDocumentNumber;//11;
    property NeedReceipt:Boolean read FNeedReceipt write FNeedReceipt;//12
    property CustomData:TCustomDataItems read FCustomData; //13;
  end;
  TPriceListAttachments = specialize GSerializationObjectList<TPriceListAttachment>;

  {  TStructuredDataAttachment  }
  //message StructuredDataAttachment {
  //	required bytes Content = 1;
  //	required string FileName = 2;
  //	required string ParentCustomDocumentId = 3;
  //}
  TStructuredDataAttachment = class(TSerializationObject) //message StructuredDataAttachment
  private
    FContent: TBytes;
    FFileName: string;
    FParentCustomDocumentId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Content:TBytes read FContent write FContent; //1;
    property FileName:string read FFileName write FFileName;//2;
    property ParentCustomDocumentId:string read FParentCustomDocumentId write FParentCustomDocumentId;//3;
  end;
  TStructuredDataAttachments = specialize GSerializationObjectList<TStructuredDataAttachment>;

  {  TTrustConnectionRequestAttachment  }
  //message TrustConnectionRequestAttachment {
  //	required SignedContent SignedContent = 1;
  //	required string FileName = 2;
  //	optional string Comment = 3;
  //	optional string CustomDocumentId = 4;
  //	repeated CustomDataItem CustomData = 5;
  //}
  TTrustConnectionRequestAttachment = class(TSerializationObject) //message TrustConnectionRequestAttachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FFileName: string;
    FSignedContent: TSignedContent;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write FFileName;//2;
    property Comment:string read FComment write FComment;// = 3;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//4;
    property CustomData:TCustomDataItems read FCustomData;//5;
  end;

  {  TAcceptanceCertificateAttachment  }
  //message AcceptanceCertificateAttachment {
  //	required SignedContent SignedContent = 1;
  //	required string FileName = 2;
  //	optional string Comment = 3;
  //	repeated DocumentId InitialDocumentIds = 4;
  //	repeated DocumentId SubordinateDocumentIds = 5;
  //	required string DocumentDate = 6;
  //	optional string DocumentNumber = 7 [default=""];
  //	required string Total = 8;
  //	optional string CustomDocumentId = 9;
  //	optional string Vat = 10;
  //	optional string Grounds = 11;
  //	optional bool NeedReceipt = 12 [default = false];
  //	optional bool NeedRecipientSignature = 13 [default = true];
  //	repeated CustomDataItem CustomData = 14;
  //}
  TAcceptanceCertificateAttachment = class(TSerializationObject) //message AcceptanceCertificateAttachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FDocumentDate: string;
    FDocumentNumber: string;
    FFileName: string;
    FGrounds: string;
    FInitialDocumentIds: TDocumentIds;
    FNeedReceipt: Boolean;
    FNeedRecipientSignature: Boolean;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
    FTotal: string;
    FVat: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write FFileName;//2;
    property Comment:string read FComment write FComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;//4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//5;
    property DocumentDate:string read FDocumentDate write FDocumentDate;//6;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//7
    property Total:string read FTotal write FTotal;//8;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//9;
    property Vat:string read FVat write FVat;//10;
    property Grounds:string read FGrounds write FGrounds;//11;
    property NeedReceipt:Boolean read FNeedReceipt write FNeedReceipt;//12
    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write FNeedRecipientSignature;//13
    property CustomData:TCustomDataItems read FCustomData;//14;
  end;
  TAcceptanceCertificateAttachments = specialize GSerializationObjectList<TAcceptanceCertificateAttachment>;

  {  TTorg13Attachment  }
  //message Torg13Attachment {
  //	required SignedContent SignedContent = 1;
  //	required string FileName = 2;
  //	optional string Comment = 3;
  //	repeated DocumentId InitialDocumentIds = 4;
  //	repeated DocumentId SubordinateDocumentIds = 5;
  //	required string DocumentDate = 6;
  //	required string DocumentNumber = 7;
  //	required string Total = 8;
  //	optional string CustomDocumentId = 9;
  //	// reserved 10 for Vat
  //	optional string Grounds = 11;
  //	optional bool NeedReceipt = 12 [default = false];
  //	repeated CustomDataItem CustomData = 13;
  //}
  TTorg13Attachment = class(TSerializationObject) //message Torg13Attachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FDocumentDate: string;
    FDocumentNumber: string;
    FFileName: string;
    FGrounds: string;
    FInitialDocumentIds: TDocumentIds;
    FNeedReceipt: Boolean;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
    FTotal: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent;//1;
    property FileName:string read FFileName write FFileName;//2;
    property Comment:string read FComment write FComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;//4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//5;
    property DocumentDate:string read FDocumentDate write FDocumentDate;//6;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//7;
    property Total:string read FTotal write FTotal;//8;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//9;
    // reserved 10 for Vat
    property Grounds:string read FGrounds write FGrounds;//11;
    property NeedReceipt:Boolean read FNeedReceipt write FNeedReceipt;//12;
    property CustomData:TCustomDataItems read FCustomData;//13;
  end;
  TTorg13Attachments = specialize GSerializationObjectList<TTorg13Attachment>;

  {  TBasicDocumentAttachment  }
  //message BasicDocumentAttachment {
  //	required SignedContent SignedContent = 1;
  //	required string FileName = 2;
  //	optional string Comment = 3;
  //	repeated DocumentId InitialDocumentIds = 4;
  //	repeated DocumentId SubordinateDocumentIds = 5;
  //	required string DocumentDate = 6;
  //	required string DocumentNumber = 7;
  //	required string Total = 8;
  //	optional string CustomDocumentId = 9;
  //	optional string Vat = 10;
  //	optional string Grounds = 11;
  //	optional bool NeedReceipt = 12 [default = false];
  //	repeated CustomDataItem CustomData = 13;
  //}
  TBasicDocumentAttachment = class(TSerializationObject) //message BasicDocumentAttachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FDocumentDate: string;
    FDocumentNumber: string;
    FFileName: string;
    FGrounds: string;
    FInitialDocumentIds: TDocumentIds;
    FNeedReceipt: boolean;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
    FTotal: string;
    FVat: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent;//1;
    property FileName:string read FFileName write FFileName;//2;
    property Comment:string read FComment write FComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;//4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds; //5;
    property DocumentDate:string read FDocumentDate write FDocumentDate;//6;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//7;
    property Total:string read FTotal write FTotal;//8;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//9;
    property Vat:string read FVat write FVat;//10;
    property Grounds:string read FGrounds write FGrounds;//11;
    property NeedReceipt:boolean read FNeedReceipt write FNeedReceipt; //12
    property CustomData:TCustomDataItems read FCustomData;//13;
  end;
  TBasicDocumentAttachments = specialize GSerializationObjectList<TBasicDocumentAttachment>;

  {  TNonformalizedAttachment  }
  //message NonformalizedAttachment {
  //	required SignedContent SignedContent = 1;
  //	required string FileName = 2;
  //	optional string Comment = 3;
  //	optional bool NeedRecipientSignature = 4 [default = false];
  //	repeated DocumentId InitialDocumentIds = 5;
  //	repeated DocumentId SubordinateDocumentIds = 6;
  //	optional string DocumentDate = 7;
  //	optional string DocumentNumber = 8;
  //	optional string CustomDocumentId = 9;
  //	optional bool NeedReceipt = 10 [default = false];
  //	repeated CustomDataItem CustomData = 11;
  //}
  TNonformalizedAttachment = class(TSerializationObject) //message NonformalizedAttachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FDocumentDate: string;
    FDocumentNumber: string;
    FFileName: string;
    FInitialDocumentIds: TDocumentIds;
    FNeedReceipt: Boolean;
    FNeedRecipientSignature: Boolean;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write FFileName; //2;
    property Comment:string read FComment write FComment; //3;
    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write FNeedRecipientSignature;//4
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //5;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//6;
    property DocumentDate:string read FDocumentDate write FDocumentDate; //7;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber; //8;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId; //9;
    property NeedReceipt:Boolean read FNeedReceipt write FNeedReceipt; //10
    property CustomData:TCustomDataItems read FCustomData;//11;
  end;
  TNonformalizedAttachments = specialize GSerializationObjectList<TNonformalizedAttachment>;

  {  TXmlDocumentAttachment  }
  //message XmlDocumentAttachment {
  //	required SignedContent SignedContent = 1;
  //	optional string Comment = 3;
  //	repeated DocumentId InitialDocumentIds = 4;
  //	repeated DocumentId SubordinateDocumentIds = 5;
  //	optional string CustomDocumentId = 6;
  //	optional bool NeedReceipt = 7 [default = false];
  //	repeated CustomDataItem CustomData = 8;
  //}
  TXmlDocumentAttachment = class(TSerializationObject) //message XmlDocumentAttachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FInitialDocumentIds: TDocumentIds;
    FNeedReceipt: Boolean;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent;//1;
    property Comment:string read FComment write FComment; //3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//5;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//6;
    property NeedReceipt:Boolean read FNeedReceipt write FNeedReceipt; //7
    property CustomData:TCustomDataItems read FCustomData;//8;
  end;
  TXmlDocumentAttachments = specialize GSerializationObjectList<TXmlDocumentAttachment>;

  {  TEncryptedInvoiceCorrectionMetadata  }
  //message EncryptedInvoiceCorrectionMetadata {
  //	required Diadoc.Api.Proto.Docflow.DocumentDateAndNumber OriginalInvoiceDateAndNumber = 1;
  //	optional Diadoc.Api.Proto.Docflow.DocumentDateAndNumber OriginalInvoiceRevisionDateAndNumber = 2;
  //	optional Diadoc.Api.Proto.Docflow.DocumentDateAndNumber InvoiceCorrectionRevisionDateAndNumber = 3;
  //}
  TEncryptedInvoiceCorrectionMetadata = class(TSerializationObject) //message EncryptedInvoiceCorrectionMetadata
  private
    FInvoiceCorrectionRevisionDateAndNumber: TDocumentDateAndNumber;
    FOriginalInvoiceDateAndNumber: TDocumentDateAndNumber;
    FOriginalInvoiceRevisionDateAndNumber: TDocumentDateAndNumber;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property OriginalInvoiceDateAndNumber:TDocumentDateAndNumber read FOriginalInvoiceDateAndNumber write FOriginalInvoiceDateAndNumber;//1;
    property OriginalInvoiceRevisionDateAndNumber:TDocumentDateAndNumber read FOriginalInvoiceRevisionDateAndNumber write FOriginalInvoiceRevisionDateAndNumber;//2;
    property InvoiceCorrectionRevisionDateAndNumber:TDocumentDateAndNumber read FInvoiceCorrectionRevisionDateAndNumber write FInvoiceCorrectionRevisionDateAndNumber; //3;
  end;


  {  TEncryptedInvoiceMetadata  }
  //message EncryptedInvoiceMetadata {
  //	optional Diadoc.Api.Proto.Docflow.DocumentDateAndNumber RevisionDateAndNumber = 1;
  //}
  TEncryptedInvoiceMetadata = class(TSerializationObject) //message EncryptedInvoiceMetadata
  private
    FRevisionDateAndNumber: TDocumentDateAndNumber;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property RevisionDateAndNumber:TDocumentDateAndNumber read FRevisionDateAndNumber write FRevisionDateAndNumber; //1;
  end;


  {  TEncryptedXmlBasicDocumentMetadata  }
  //message EncryptedXmlBasicDocumentMetadata {
  //	required string FormationDate = 1;
  //	required string FormationTime = 2;
  //	optional string DocumentName = 3;
  //}
  TEncryptedXmlBasicDocumentMetadata = class(TSerializationObject) //message EncryptedXmlBasicDocumentMetadata
  private
    FDocumentName: string;
    FFormationDate: string;
    FFormationTime: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FormationDate:string read FFormationDate write FFormationDate;//1;
    property FormationTime:string read FFormationTime write FFormationTime;//2;
    property DocumentName:string read FDocumentName write FDocumentName;//3;
  end;


  {  TEncryptedDocumentMetadata  }
  //message EncryptedDocumentMetadata {
  //	required string FileId = 1;
  //	required string BuyerFnsParticipantId = 2;
  //	required string SenderFnsParticipantId = 3;
  //	required Diadoc.Api.Proto.Docflow.DocumentDateAndNumber DocumentDateAndNumber = 4;
  //}
  TEncryptedDocumentMetadata = class(TSerializationObject) //message EncryptedDocumentMetadata
  private
    FBuyerFnsParticipantId: string;
    FDocumentDateAndNumber: TDocumentDateAndNumber;
    FFileId: string;
    FSenderFnsParticipantId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FileId:string read FFileId write FFileId;//1;
    property BuyerFnsParticipantId:string read FBuyerFnsParticipantId write FBuyerFnsParticipantId;//2;
    property SenderFnsParticipantId:string read FSenderFnsParticipantId write FSenderFnsParticipantId;//3;
    property DocumentDateAndNumber:TDocumentDateAndNumber read FDocumentDateAndNumber; //4;
  end;

  {  TEncryptedInvoiceAttachment  }
  //message EncryptedInvoiceAttachment {
  //	required SignedContent SignedContent = 1;
  //	optional string Comment = 3;
  //	repeated DocumentId InitialDocumentIds = 4;
  //	repeated DocumentId SubordinateDocumentIds = 5;
  //	optional string CustomDocumentId = 6;
  //	repeated CustomDataItem CustomData = 7;
  //	required EncryptedDocumentMetadata Metadata = 8;
  //	optional EncryptedInvoiceMetadata InvoiceMetadata = 9;
  //	optional EncryptedInvoiceCorrectionMetadata InvoiceCorrectionMetadata = 10;
  //}
  TEncryptedInvoiceAttachment = class(TSerializationObject) //message EncryptedInvoiceAttachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FInitialDocumentIds: TDocumentIds;
    FInvoiceCorrectionMetadata: TEncryptedInvoiceCorrectionMetadata;
    FInvoiceMetadata: TEncryptedInvoiceMetadata;
    FMetadata: TEncryptedDocumentMetadata;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property Comment:string read FComment write FComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds write FInitialDocumentIds;//4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds write FSubordinateDocumentIds; //5;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;// = 6;
    property CustomData:TCustomDataItems read FCustomData;//7;
    property Metadata:TEncryptedDocumentMetadata read FMetadata;//8;
    property InvoiceMetadata:TEncryptedInvoiceMetadata read FInvoiceMetadata;//9;
    property InvoiceCorrectionMetadata:TEncryptedInvoiceCorrectionMetadata read FInvoiceCorrectionMetadata;//10;
  end;
  TEncryptedInvoiceAttachments = specialize GSerializationObjectList<TEncryptedInvoiceAttachment>;


  {  TEncryptedXmlDocumentAttachment  }
  //message EncryptedXmlDocumentAttachment {
  //	required SignedContent SignedContent = 1;
  //	optional string Comment = 3;
  //	repeated DocumentId InitialDocumentIds = 4;
  //	repeated DocumentId SubordinateDocumentIds = 5;
  //	optional string CustomDocumentId = 6;
  //	repeated CustomDataItem CustomData = 7;
  //	required EncryptedDocumentMetadata Metadata = 8;
  //	required EncryptedXmlBasicDocumentMetadata XmlBasicMetadata = 9;
  //}
  TEncryptedXmlDocumentAttachment = class(TSerializationObject) //message EncryptedXmlDocumentAttachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FInitialDocumentIds: TDocumentIds;
    FMetadata: TEncryptedDocumentMetadata;
    FSignedContent: TSignedContent;
    FSubordinateDocumentIds: TDocumentIds;
    FXmlBasicMetadata: TEncryptedXmlBasicDocumentMetadata;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent;//1;
    property Comment:string read FComment write FComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds; //5;
    property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId;//6;
    property CustomData:TCustomDataItems read FCustomData;//7;
    property Metadata:TEncryptedDocumentMetadata read FMetadata;//8;
    property XmlBasicMetadata:TEncryptedXmlBasicDocumentMetadata read FXmlBasicMetadata;//9;
  end;


  {  TMessageToPost  }
 // message MessageToPost {
	//required string FromBoxId = 1;
	//optional string ToBoxId = 2;
	//repeated XmlDocumentAttachment Invoices = 3;
	//repeated NonformalizedAttachment NonformalizedDocuments = 4;
	//repeated BasicDocumentAttachment Torg12Documents = 5;
	//repeated AcceptanceCertificateAttachment AcceptanceCertificates = 7;
	//repeated StructuredDataAttachment StructuredDataAttachments = 8;
	//repeated BasicDocumentAttachment ProformaInvoices = 9;
	//repeated XmlDocumentAttachment XmlTorg12SellerTitles = 10;
	//repeated XmlDocumentAttachment XmlAcceptanceCertificateSellerTitles = 11;
	//optional string ToDepartmentId = 12;
	//optional bool IsDraft = 13 [default = false];
	//optional bool LockDraft = 14 [default = false];
	//optional bool StrictDraftValidation = 15 [default = true];
	//optional bool IsInternal = 16 [default = false];
	//optional string FromDepartmentId = 17;
	//optional bool DelaySend = 18 [default = false];
	//repeated PriceListAttachment PriceLists = 19;
	//repeated NonformalizedAttachment PriceListAgreements = 20;
	//repeated NonformalizedAttachment CertificateRegistries = 21;
	//repeated ReconciliationActAttachment ReconciliationActs = 22;
	//repeated ContractAttachment Contracts = 23;
	//repeated Torg13Attachment Torg13Documents = 24;
	//repeated ServiceDetailsAttachment ServiceDetailsDocuments = 25;
	//optional string ProxyBoxId = 26;
	//optional string ProxyDepartmentId = 27;
	//repeated EncryptedInvoiceAttachment EncryptedInvoices = 28;
	//repeated EncryptedXmlDocumentAttachment EncryptedXmlTorg12SellerTitles = 29;
	//repeated EncryptedXmlDocumentAttachment EncryptedXmlAcceptanceCertificateSellerTitles = 30;
	//repeated SupplementaryAgreementAttachment SupplementaryAgreements = 31;
	//optional bool LockPacket = 32 [default = false];
	//repeated XmlDocumentAttachment UniversalTransferDocumentSellerTitles = 33;
	//repeated DocumentAttachment DocumentAttachments = 34;
        //optional LockMode LockMode = 35 [default = None];
 // }
  TMessageToPost = class(TSerializationObject) //message MessageToPost
  private
    FAcceptanceCertificates: TAcceptanceCertificateAttachments;
    FCertificateRegistries: TNonformalizedAttachment;
    FContracts: TContractAttachments;
    FDelaySend: Boolean;
    FDocumentAttachments: TDocumentAttachments;
    FEncryptedInvoices: TEncryptedInvoiceAttachments;
    FEncryptedXmlAcceptanceCertificateSellerTitles: TEncryptedXmlDocumentAttachment;
    FEncryptedXmlTorg12SellerTitles: TEncryptedXmlDocumentAttachment;
    FFromBoxId: string;
    FFromDepartmentId: string;
    FInvoices: TXmlDocumentAttachments;
    FIsDraft: Boolean;
    FIsInternal: Boolean;
    FLockDraft: Boolean;
    FLockMode: TLockMode;
    FLockPacket: Boolean;
    FNonformalizedDocuments: TNonformalizedAttachments;
    FPriceListAgreements: TNonformalizedAttachments;
    FPriceLists: TPriceListAttachments;
    FProformaInvoices: TBasicDocumentAttachments;
    FProxyBoxId: string;
    FProxyDepartmentId: string;
    FReconciliationActs: TReconciliationActAttachments;
    FServiceDetailsDocuments: TServiceDetailsAttachments;
    FStrictDraftValidation: Boolean;
    FStructuredDataAttachments: TStructuredDataAttachments;
    FSupplementaryAgreements: TSupplementaryAgreementAttachments;
    FToBoxId: string;
    FToDepartmentId: string;
    FTorg12Documents: TBasicDocumentAttachments;
    FTorg13Documents: TTorg13Attachments;
    FUniversalTransferDocumentSellerTitles: TXmlDocumentAttachments;
    FXmlAcceptanceCertificateSellerTitles: TXmlDocumentAttachments;
    FXmlTorg12SellerTitles: TXmlDocumentAttachments;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FromBoxId:string read FFromBoxId write FFromBoxId;//1;
    property ToBoxId:string read FToBoxId write FToBoxId;//2;
    property Invoices:TXmlDocumentAttachments read FInvoices; //3;
    property NonformalizedDocuments:TNonformalizedAttachments read FNonformalizedDocuments;//4;
    property Torg12Documents:TBasicDocumentAttachments read FTorg12Documents;//5;
    property AcceptanceCertificates:TAcceptanceCertificateAttachments read FAcceptanceCertificates;//7;
    property StructuredDataAttachments:TStructuredDataAttachments read FStructuredDataAttachments; //8;
    property ProformaInvoices:TBasicDocumentAttachments read FProformaInvoices;//9;
    property XmlTorg12SellerTitles:TXmlDocumentAttachments read FXmlTorg12SellerTitles;//10;
    property XmlAcceptanceCertificateSellerTitles:TXmlDocumentAttachments read FXmlAcceptanceCertificateSellerTitles;//11;
    property ToDepartmentId:string read FToDepartmentId write FToDepartmentId;//12;
    property IsDraft:Boolean read FIsDraft write FIsDraft;//13
    property LockDraft:Boolean read FLockDraft write FLockDraft;//14
    property StrictDraftValidation:Boolean read FStrictDraftValidation write FStrictDraftValidation default true;//15
    property IsInternal:Boolean read FIsInternal write FIsInternal;//16
    property FromDepartmentId:string read FFromDepartmentId write FFromDepartmentId;//17;
    property DelaySend:Boolean read FDelaySend write FDelaySend;//18
    property PriceLists:TPriceListAttachments read FPriceLists;//19;
    property PriceListAgreements:TNonformalizedAttachments read FPriceListAgreements;//20;
    property CertificateRegistries:TNonformalizedAttachment read FCertificateRegistries; //21;
    property ReconciliationActs:TReconciliationActAttachments read FReconciliationActs;//22;
    property Contracts:TContractAttachments read FContracts;//23;
    property Torg13Documents:TTorg13Attachments read FTorg13Documents;//24;
    property ServiceDetailsDocuments:TServiceDetailsAttachments read FServiceDetailsDocuments;//25;
    property ProxyBoxId:string read FProxyBoxId write FProxyBoxId;//26;
    property ProxyDepartmentId:string read FProxyDepartmentId write FProxyDepartmentId;//27;
    property EncryptedInvoices:TEncryptedInvoiceAttachments read FEncryptedInvoices;//28;
    property EncryptedXmlTorg12SellerTitles:TEncryptedXmlDocumentAttachment read FEncryptedXmlTorg12SellerTitles;//29;
    property EncryptedXmlAcceptanceCertificateSellerTitles:TEncryptedXmlDocumentAttachment read FEncryptedXmlAcceptanceCertificateSellerTitles;//30;
    property SupplementaryAgreements:TSupplementaryAgreementAttachments read FSupplementaryAgreements;//31;
    property LockPacket:Boolean read FLockPacket write FLockPacket; //32
    property UniversalTransferDocumentSellerTitles:TXmlDocumentAttachments read FUniversalTransferDocumentSellerTitles; //33;
    property DocumentAttachments:TDocumentAttachments read FDocumentAttachments;//34;
    property LockMode:TLockMode read FLockMode write FLockMode;//35 [default = None];
  end;

implementation

{ TRecipientTitleAttachment }

procedure TRecipientTitleAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1);
  RegisterProp('SignedContent', 2);
  RegisterProp('Labels', 4);
  RegisterProp('NeedReceipt', 5);
end;

procedure TRecipientTitleAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FLabels:=TDocumentStrings.Create;
  FNeedReceipt:=false;
end;

destructor TRecipientTitleAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TPredefinedRecipientTitle }

procedure TPredefinedRecipientTitle.InternalInit;
begin
  inherited InternalInit;
  FUnsignedContent:=TUnsignedContent.Create;
end;

procedure TPredefinedRecipientTitle.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('UnsignedContent', 1);
end;

destructor TPredefinedRecipientTitle.Destroy;
begin
  FUnsignedContent.Free;
  inherited Destroy;
end;

{ TEditingPatch }

procedure TEditingPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1);
  RegisterProp('Content', 2);
  RegisterProp('Labels', 3);
end;

procedure TEditingPatch.InternalInit;
begin
  inherited InternalInit;
  FContent:=TUnsignedContent.Create;
  FLabels:=TDocumentStrings.Create;
end;

destructor TEditingPatch.Destroy;
begin
  FreeAndNil(FContent);
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TMessageToPost }

procedure TMessageToPost.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FromBoxId', 1, true);
  RegisterProp('ToBoxId', 2);
  RegisterProp('Invoices', 3);
  RegisterProp('NonformalizedDocuments', 4);
  RegisterProp('Torg12Documents', 5);
  RegisterProp('AcceptanceCertificates', 7);
  RegisterProp('StructuredDataAttachments', 8);
  RegisterProp('ProformaInvoices', 9);
  RegisterProp('XmlTorg12SellerTitles', 10);
  RegisterProp('XmlAcceptanceCertificateSellerTitles', 11);
  RegisterProp('ToDepartmentId', 12);
  RegisterProp('IsDraft', 13);
  RegisterProp('LockDraft', 14);
  RegisterProp('StrictDraftValidation', 15);
  RegisterProp('IsInternal', 16);
  RegisterProp('FromDepartmentId', 17);
  RegisterProp('DelaySend', 18);
  RegisterProp('PriceLists', 19);
  RegisterProp('PriceListAgreements', 20);
  RegisterProp('CertificateRegistries', 21);
  RegisterProp('ReconciliationActs', 22);
  RegisterProp('Contracts', 23);
  RegisterProp('Torg13Documents', 24);
  RegisterProp('ServiceDetailsDocuments', 25);
  RegisterProp('ProxyBoxId', 26);
  RegisterProp('ProxyDepartmentId', 27);
  RegisterProp('EncryptedInvoices', 28);
  RegisterProp('EncryptedXmlTorg12SellerTitles', 29);
  RegisterProp('EncryptedXmlAcceptanceCertificateSellerTitles', 30);
  RegisterProp('SupplementaryAgreements', 31);
  RegisterProp('LockPacket', 32);
  RegisterProp('UniversalTransferDocumentSellerTitles', 33);
  RegisterProp('DocumentAttachments', 34);
  RegisterProp('LockMode', 35);
end;

procedure TMessageToPost.InternalInit;
begin
  inherited InternalInit;
  FInvoices:=TXmlDocumentAttachments.Create;
  FNonformalizedDocuments:=TNonformalizedAttachments.Create;
  FTorg12Documents:=TBasicDocumentAttachments.Create;
  FAcceptanceCertificates:=TAcceptanceCertificateAttachments.Create;
  FStructuredDataAttachments:=TStructuredDataAttachments.Create;
  FProformaInvoices:=TBasicDocumentAttachments.Create;
  FXmlTorg12SellerTitles:=TXmlDocumentAttachments.Create;
  FXmlAcceptanceCertificateSellerTitles:=TXmlDocumentAttachments.Create;
  FPriceLists:=TPriceListAttachments.Create;
  FPriceListAgreements:=TNonformalizedAttachments.Create;
  FCertificateRegistries:=TNonformalizedAttachment.Create;
  FReconciliationActs:=TReconciliationActAttachments.Create;
  FContracts:=TContractAttachments.Create;
  FTorg13Documents:=TTorg13Attachments.Create;
  FServiceDetailsDocuments:=TServiceDetailsAttachments.Create;
  FEncryptedInvoices:=TEncryptedInvoiceAttachments.Create;
  FEncryptedXmlTorg12SellerTitles:=TEncryptedXmlDocumentAttachment.Create;
  FEncryptedXmlAcceptanceCertificateSellerTitles:=TEncryptedXmlDocumentAttachment.Create;
  FSupplementaryAgreements:=TSupplementaryAgreementAttachments.Create;
  FUniversalTransferDocumentSellerTitles:=TXmlDocumentAttachments.Create;
  FDocumentAttachments:=TDocumentAttachments.Create;

  FStrictDraftValidation:=true;//15
end;

destructor TMessageToPost.Destroy;
begin
  FreeAndNil(FInvoices);
  FreeAndNil(FNonformalizedDocuments);
  FreeAndNil(FTorg12Documents);
  FreeAndNil(FAcceptanceCertificates);
  FreeAndNil(FStructuredDataAttachments);
  FreeAndNil(FProformaInvoices);
  FreeAndNil(FXmlTorg12SellerTitles);
  FreeAndNil(FXmlAcceptanceCertificateSellerTitles);
  FreeAndNil(FPriceLists);
  FreeAndNil(FPriceListAgreements);
  FreeAndNil(FCertificateRegistries);
  FreeAndNil(FReconciliationActs);
  FreeAndNil(FContracts);
  FreeAndNil(FTorg13Documents);
  FreeAndNil(FServiceDetailsDocuments);
  FreeAndNil(FEncryptedInvoices);
  FreeAndNil(FEncryptedXmlTorg12SellerTitles);
  FreeAndNil(FEncryptedXmlAcceptanceCertificateSellerTitles);
  FreeAndNil(FSupplementaryAgreements);
  FreeAndNil(FUniversalTransferDocumentSellerTitles);
  FreeAndNil(FDocumentAttachments);
  inherited Destroy;
end;

{ TEncryptedXmlDocumentAttachment }

procedure TEncryptedXmlDocumentAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('Comment', 3);
  RegisterProp('InitialDocumentIds', 4);
  RegisterProp('SubordinateDocumentIds', 5);
  RegisterProp('CustomDocumentId', 6);
  RegisterProp('CustomData', 7);
  RegisterProp('Metadata', 8, true);
  RegisterProp('XmlBasicMetadata', 9, true);
end;

procedure TEncryptedXmlDocumentAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
  FMetadata:=TEncryptedDocumentMetadata.Create;
  FXmlBasicMetadata:=TEncryptedXmlBasicDocumentMetadata.Create;
end;

destructor TEncryptedXmlDocumentAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  FreeAndNil(FMetadata);
  FreeAndNil(FXmlBasicMetadata);
  inherited Destroy;
end;

{ TEncryptedInvoiceAttachment }

procedure TEncryptedInvoiceAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('Comment', 3);
  RegisterProp('InitialDocumentIds', 4);
  RegisterProp('SubordinateDocumentIds', 5);
  RegisterProp('CustomDocumentId', 6);
  RegisterProp('CustomData', 7);
  RegisterProp('Metadata', 8, true);
  RegisterProp('InvoiceMetadata', 9);
  RegisterProp('InvoiceCorrectionMetadata', 10);
end;

procedure TEncryptedInvoiceAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FCustomData:=TCustomDataItems.Create;
  FMetadata:=TEncryptedDocumentMetadata.Create;
  FInvoiceMetadata:=TEncryptedInvoiceMetadata.Create;
  FInvoiceCorrectionMetadata:=TEncryptedInvoiceCorrectionMetadata.Create;
end;

destructor TEncryptedInvoiceAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FCustomData);
  FreeAndNil(FMetadata);
  FreeAndNil(FInvoiceMetadata);
  FreeAndNil(FInvoiceCorrectionMetadata);
  inherited Destroy;
end;

{ TEncryptedDocumentMetadata }

procedure TEncryptedDocumentMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FileId', 1, true);
  RegisterProp('BuyerFnsParticipantId', 2, true);
  RegisterProp('SenderFnsParticipantId', 3, true);
  RegisterProp('DocumentDateAndNumber', 4, true);
end;

procedure TEncryptedDocumentMetadata.InternalInit;
begin
  inherited InternalInit;
  FDocumentDateAndNumber:=TDocumentDateAndNumber.Create;
end;

destructor TEncryptedDocumentMetadata.Destroy;
begin
  FreeAndNil(FDocumentDateAndNumber);
  inherited Destroy;
end;

{ TEncryptedXmlBasicDocumentMetadata }

procedure TEncryptedXmlBasicDocumentMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FormationDate', 1, true);
  RegisterProp('FormationTime', 2, true);
  RegisterProp('DocumentName', 3);
end;

procedure TEncryptedXmlBasicDocumentMetadata.InternalInit;
begin
  inherited InternalInit;
end;

destructor TEncryptedXmlBasicDocumentMetadata.Destroy;
begin
  inherited Destroy;
end;

{ TEncryptedInvoiceMetadata }

procedure TEncryptedInvoiceMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RevisionDateAndNumber', 1);
end;

procedure TEncryptedInvoiceMetadata.InternalInit;
begin
  inherited InternalInit;
  FRevisionDateAndNumber:=TDocumentDateAndNumber.Create;
end;

destructor TEncryptedInvoiceMetadata.Destroy;
begin
  FreeAndNil(FRevisionDateAndNumber);
  inherited Destroy;
end;

{ TEncryptedInvoiceCorrectionMetadata }

procedure TEncryptedInvoiceCorrectionMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('OriginalInvoiceDateAndNumber', 1, true);
  RegisterProp('OriginalInvoiceRevisionDateAndNumber', 2);
  RegisterProp('InvoiceCorrectionRevisionDateAndNumber', 3);
end;

procedure TEncryptedInvoiceCorrectionMetadata.InternalInit;
begin
  inherited InternalInit;
  FInvoiceCorrectionRevisionDateAndNumber:=TDocumentDateAndNumber.Create;
  FOriginalInvoiceDateAndNumber:=TDocumentDateAndNumber.Create;
  FOriginalInvoiceRevisionDateAndNumber:=TDocumentDateAndNumber.Create;
end;

destructor TEncryptedInvoiceCorrectionMetadata.Destroy;
begin
  FreeAndNil(FInvoiceCorrectionRevisionDateAndNumber);
  FreeAndNil(FOriginalInvoiceDateAndNumber);
  FreeAndNil(FOriginalInvoiceRevisionDateAndNumber);
  inherited Destroy;
end;

{ TXmlDocumentAttachment }

procedure TXmlDocumentAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('Comment', 3);
  RegisterProp('InitialDocumentIds', 4);
  RegisterProp('SubordinateDocumentIds', 5);
  RegisterProp('CustomDocumentId', 6);
  RegisterProp('NeedReceipt', 7);
  RegisterProp('CustomData', 8);
end;

procedure TXmlDocumentAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TXmlDocumentAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TNonformalizedAttachment }

procedure TNonformalizedAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('Comment', 3);
  RegisterProp('NeedRecipientSignature', 4);
  RegisterProp('InitialDocumentIds', 5);
  RegisterProp('SubordinateDocumentIds', 6);
  RegisterProp('DocumentDate', 7);
  RegisterProp('DocumentNumber', 8);
  RegisterProp('CustomDocumentId', 9);
  RegisterProp('NeedReceipt', 10);
  RegisterProp('CustomData', 11);
end;

procedure TNonformalizedAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TNonformalizedAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TBasicDocumentAttachment }

procedure TBasicDocumentAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('Comment', 3);
  RegisterProp('InitialDocumentIds', 4);
  RegisterProp('SubordinateDocumentIds', 5);
  RegisterProp('DocumentDate', 6, true);
  RegisterProp('DocumentNumber', 7, true);
  RegisterProp('Total', 8, true);
  RegisterProp('CustomDocumentId', 9);
  RegisterProp('Vat', 10);
  RegisterProp('Grounds', 11);
  RegisterProp('NeedReceipt', 12);
  RegisterProp('CustomData', 13);
end;

procedure TBasicDocumentAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TBasicDocumentAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TTorg13Attachment }

procedure TTorg13Attachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('Comment', 3);
  RegisterProp('InitialDocumentIds', 4);
  RegisterProp('SubordinateDocumentIds', 5);
  RegisterProp('DocumentDate', 6, true);
  RegisterProp('DocumentNumber', 7, true);
  RegisterProp('Total', 8, true);
  RegisterProp('CustomDocumentId', 9);
  // reserved 10 for Vat
  RegisterProp('Grounds', 11);
  RegisterProp('NeedReceipt', 12);
  RegisterProp('CustomData', 13);
end;

procedure TTorg13Attachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TTorg13Attachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TAcceptanceCertificateAttachment }

procedure TAcceptanceCertificateAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('Comment', 3);
  RegisterProp('InitialDocumentIds', 4);
  RegisterProp('SubordinateDocumentIds', 5);
  RegisterProp('DocumentDate', 6, true);
  RegisterProp('DocumentNumber', 7);
  RegisterProp('Total', 8, true);
  RegisterProp('CustomDocumentId', 9);
  RegisterProp('Vat', 10);
  RegisterProp('Grounds', 11);
  RegisterProp('NeedReceipt', 12);
  RegisterProp('NeedRecipientSignature', 13);
  RegisterProp('CustomData', 14);
end;

procedure TAcceptanceCertificateAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TAcceptanceCertificateAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TTrustConnectionRequestAttachment }

procedure TTrustConnectionRequestAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('Comment', 3);
  RegisterProp('CustomDocumentId', 4);
  RegisterProp('CustomData', 5);
end;

procedure TTrustConnectionRequestAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TTrustConnectionRequestAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TStructuredDataAttachment }

procedure TStructuredDataAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Content', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('ParentCustomDocumentId', 3, true);
end;

procedure TStructuredDataAttachment.InternalInit;
begin
  inherited InternalInit;
end;

destructor TStructuredDataAttachment.Destroy;
begin
  inherited Destroy;
end;

{ TPriceListAttachment }

procedure TPriceListAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('Comment', 3);
  RegisterProp('InitialDocumentIds', 4);
  RegisterProp('SubordinateDocumentIds', 5);
  RegisterProp('CustomDocumentId', 6);
  RegisterProp('DocumentDate', 7, true);
  RegisterProp('DocumentNumber', 8, true);
  RegisterProp('PriceListEffectiveDate', 9, true);
  RegisterProp('ContractDocumentDate', 10, true);
  RegisterProp('ContractDocumentNumber', 11, true);
  RegisterProp('NeedReceipt', 12);
  RegisterProp('CustomData', 13);
end;

procedure TPriceListAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TPriceListAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TReconciliationActAttachment }

procedure TReconciliationActAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('Comment', 3);
  // reserved 4 for NeedRecipientSignature
  RegisterProp('InitialDocumentIds', 5);
  RegisterProp('SubordinateDocumentIds', 6);
  RegisterProp('DocumentDate', 7, true);
  RegisterProp('DocumentNumber', 8);
  RegisterProp('CustomDocumentId', 9);
  RegisterProp('NeedReceipt', 10);
  RegisterProp('CustomData', 11);
end;

procedure TReconciliationActAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TReconciliationActAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TContractAttachment }

procedure TContractAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('Comment', 3);
  RegisterProp('InitialDocumentIds', 4);
  RegisterProp('SubordinateDocumentIds', 5);
  RegisterProp('CustomDocumentId', 6);
  RegisterProp('DocumentDate', 7, true);
  RegisterProp('DocumentNumber', 8, true);
  RegisterProp('ContractPrice', 9);
  RegisterProp('ContractType', 10);
  RegisterProp('NeedReceipt', 11);
  RegisterProp('CustomData', 12);
end;

procedure TContractAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TContractAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TSupplementaryAgreementAttachment }

procedure TSupplementaryAgreementAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('Comment', 3);
  RegisterProp('InitialDocumentIds', 4);
  RegisterProp('SubordinateDocumentIds', 5);
  RegisterProp('CustomDocumentId', 6);
  RegisterProp('DocumentDate', 7, true);
  RegisterProp('DocumentNumber', 8, true);
  RegisterProp('Total', 9);
  RegisterProp('ContractNumber', 10, true);
  RegisterProp('ContractDate', 11, true);
  RegisterProp('ContractType', 12);
  RegisterProp('NeedReceipt', 13);
  RegisterProp('CustomData', 14);
end;

procedure TSupplementaryAgreementAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TSupplementaryAgreementAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TServiceDetailsAttachment }

procedure TServiceDetailsAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('Comment', 3);
  // reserved 4 for NeedRecipientSignature
  RegisterProp('InitialDocumentIds', 5);
  RegisterProp('SubordinateDocumentIds', 6);
  RegisterProp('DocumentDate', 7);
  RegisterProp('DocumentNumber', 8);
  RegisterProp('CustomDocumentId', 9);
  RegisterProp('NeedReceipt', 10);
  RegisterProp('CustomData', 11);
end;

procedure TServiceDetailsAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
end;

destructor TServiceDetailsAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  inherited Destroy;
end;

{ TDocumentAttachment }

procedure TDocumentAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  // reserved 2 for FileName
  RegisterProp('Comment', 3);
  RegisterProp('NeedRecipientSignature', 4);
  RegisterProp('InitialDocumentIds', 5);
  RegisterProp('SubordinateDocumentIds', 6);
  // reserved 7 for DocumentDate
  // reserved 8 for DocumentNumber
  RegisterProp('CustomDocumentId', 9);
  RegisterProp('NeedReceipt', 10);
  RegisterProp('CustomData', 11);
  RegisterProp('TypeNamedId', 12, true);
  RegisterProp('FunctionType', 13);
  RegisterProp('Version', 14);
  RegisterProp('Metadata', 15);
  RegisterProp('WorkflowId', 16);
  RegisterProp('IsEncrypted', 17);
end;

procedure TDocumentAttachment.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FCustomData:=TCustomDataItems.Create;
  FMetadata:=TMetadataItems.Create;
end;

destructor TDocumentAttachment.Destroy;
begin
  FreeAndNil(FSignedContent);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FCustomData);
  FreeAndNil(FMetadata);
  inherited Destroy;
end;

{ TMessagePatchToPost }

procedure TMessagePatchToPost.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('MessageId', 2, true);
  RegisterProp('Receipts', 3);
  RegisterProp('CorrectionRequests', 4);
  RegisterProp('Signatures', 5);
  RegisterProp('RequestedSignatureRejections', 6);
  RegisterProp('XmlTorg12BuyerTitles', 7);
  RegisterProp('XmlAcceptanceCertificateBuyerTitles', 8);
  RegisterProp('Resolutions', 9);
  RegisterProp('ResolutionRequests', 10);
  RegisterProp('ResolutionRequestCancellations', 11);
  RegisterProp('ResolutionRequestDenials', 12);
  RegisterProp('ResolutionRequestDenialCancellations', 13);
  RegisterProp('RevocationRequests', 14);
  RegisterProp('XmlSignatureRejections', 15);
  RegisterProp('CustomDataPatches', 16);
  RegisterProp('ResolutionRouteAssignments', 17);
  RegisterProp('SignatureVerifications', 18);
  RegisterProp('EditDocumentPacketCommands', 19);
  RegisterProp('UniversalTransferDocumentBuyerTitles', 20);
  RegisterProp('ResolutionRouteRemovals', 21);
  RegisterProp('RecipientTitles', 22);
  RegisterProp('EditingPatches', 24);
end;

procedure TMessagePatchToPost.InternalInit;
begin
  inherited InternalInit;
  FReceipts:=TReceiptAttachments.Create;
  FCorrectionRequests:=TCorrectionRequestAttachments.Create;
  FSignatures:=TDocumentSignatures.Create;
  FRequestedSignatureRejections:=TRequestedSignatureRejections.Create;
  FXmlTorg12BuyerTitles:=TRecipientTitleAttachments.Create;
  FXmlAcceptanceCertificateBuyerTitles:=TRecipientTitleAttachments.Create;
  FResolutions:=TResolutionAttachments.Create;
  FResolutionRequests:=TResolutionRequestAttachments.Create;
  FResolutionRequestCancellations:=TResolutionRequestCancellationAttachments.Create;
  FResolutionRequestDenials:=TResolutionRequestDenialAttachments.Create;
  FResolutionRequestDenialCancellations:=TResolutionRequestDenialCancellationAttachments.Create;
  FRevocationRequests:=TRevocationRequestAttachments.Create;
  FXmlSignatureRejections:=TXmlSignatureRejectionAttachments.Create;
  FCustomDataPatches:=TCustomDataPatchs.Create;
  FResolutionRouteAssignments:=TResolutionRouteAssignments.Create;
  FSignatureVerifications:=TSignatureVerifications.Create;
  FEditDocumentPacketCommands:=TEditDocumentPacketCommands.Create;
  FUniversalTransferDocumentBuyerTitles:=TRecipientTitleAttachments.Create;
  FResolutionRouteRemovals:=TResolutionRouteRemovals.Create;
  FRecipientTitles:=TRecipientTitleAttachments.Create;
  FEditingPatches:=TEditingPatchs.Create;
end;

destructor TMessagePatchToPost.Destroy;
begin
  FreeAndNil(FReceipts);
  FreeAndNil(FCorrectionRequests);
  FreeAndNil(FSignatures);
  FreeAndNil(FRequestedSignatureRejections);
  FreeAndNil(FXmlTorg12BuyerTitles);
  FreeAndNil(FXmlAcceptanceCertificateBuyerTitles);
  FreeAndNil(FResolutions);
  FreeAndNil(FResolutionRequests);
  FreeAndNil(FResolutionRequestCancellations);
  FreeAndNil(FResolutionRequestDenials);
  FreeAndNil(FResolutionRequestDenialCancellations);
  FreeAndNil(FRevocationRequests);
  FreeAndNil(FXmlSignatureRejections);
  FreeAndNil(FCustomDataPatches);
  FreeAndNil(FResolutionRouteAssignments);
  FreeAndNil(FSignatureVerifications);
  FreeAndNil(FEditDocumentPacketCommands);
  FreeAndNil(FUniversalTransferDocumentBuyerTitles);
  FreeAndNil(FResolutionRouteRemovals);
  FreeAndNil(FRecipientTitles);
  FreeAndNil(FEditingPatches);
  inherited Destroy;
end;

{ TSignatureVerification }

procedure TSignatureVerification.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialDocumentId', 1, true);
  RegisterProp('IsValid', 2, true);
  RegisterProp('ErrorMessage', 3);
  RegisterProp('Labels', 4);
end;

procedure TSignatureVerification.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TSignatureVerification.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TResolutionRouteAssignment }

procedure TResolutionRouteAssignment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialDocumentId', 1, true);
  RegisterProp('RouteId', 2, true);
  RegisterProp('Comment', 3);
  RegisterProp('Labels', 4)
end;

procedure TResolutionRouteAssignment.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TResolutionRouteAssignment.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TReceiptAttachment }

procedure TReceiptAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('SignedContent', 2, true);
  RegisterProp('Labels', 4);
end;

procedure TReceiptAttachment.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TReceiptAttachment.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TCorrectionRequestAttachment }

procedure TCorrectionRequestAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('SignedContent', 2, true);
  RegisterProp('Labels', 4);
end;

procedure TCorrectionRequestAttachment.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TCorrectionRequestAttachment.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TRequestedSignatureRejection }

procedure TRequestedSignatureRejection.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('SignedContent', 2, true);
  RegisterProp('Labels', 3);
end;

procedure TRequestedSignatureRejection.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TRequestedSignatureRejection.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TDocumentSenderSignature }

procedure TDocumentSenderSignature.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('Signature', 2);
  RegisterProp('SignWithTestSignature', 4);
  RegisterProp('PatchedContentId', 5);
end;

procedure TDocumentSenderSignature.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDocumentSenderSignature.Destroy;
begin
  inherited Destroy;
end;

{ TDraftToSend }

procedure TDraftToSend.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('DraftId', 2, true);
  RegisterProp('ToBoxId', 3);
  RegisterProp('ToDepartmentId', 4);
  RegisterProp('DocumentSignatures', 5);
  RegisterProp('ProxyBoxId', 6);
  RegisterProp('ProxyDepartmentId', 7);
end;

procedure TDraftToSend.InternalInit;
begin
  inherited InternalInit;
  FDocumentSignatures:=TDocumentSenderSignatures.Create;
end;

destructor TDraftToSend.Destroy;
begin
  FreeAndNil(FDocumentSignatures);
  inherited Destroy;
end;

{ TPrepareDocumentsToSignRequest }

procedure TPrepareDocumentsToSignRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('DraftDocuments', 2);
  RegisterProp('Documents', 3);
  RegisterProp('Contents', 4);
end;

procedure TPrepareDocumentsToSignRequest.InternalInit;
begin
  inherited InternalInit;
  FDraftDocuments:=TDraftDocumentToPatchs.Create;
  FDocuments:=TDocumentToPatchs.Create;
  FContents:=TContentToPatchs.Create;
end;

destructor TPrepareDocumentsToSignRequest.Destroy;
begin
  FreeAndNil(FDraftDocuments);
  FreeAndNil(FDocuments);
  FreeAndNil(FContents);
  inherited Destroy;
end;

{ TDraftDocumentToPatch }

procedure TDraftDocumentToPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentId', 1, true);
  RegisterProp('ToBoxId', 2);
  RegisterProp('Signer', 3);
  RegisterProp('ExtendedSigner', 4);
end;

procedure TDraftDocumentToPatch.InternalInit;
begin
  inherited InternalInit;
  FDocumentId:=TDocumentId.Create;
  FSigner:=TSigner.Create;
  FExtendedSigner:=TExtendedSigners.Create;
end;

destructor TDraftDocumentToPatch.Destroy;
begin
  FreeAndNil(FDocumentId);
  FreeAndNil(FSigner);
  FreeAndNil(FExtendedSigner);
  inherited Destroy;
end;

{ TContentToPatch }

procedure TContentToPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TypeNamedId', 1, true);
  RegisterProp('FunctionType', 2, true);
  RegisterProp('Version', 3, true);
  RegisterProp('Content', 4, true);
  RegisterProp('ToBoxId', 5);
  RegisterProp('Signer', 6);
  RegisterProp('ExtendedSigner', 7);
end;

procedure TContentToPatch.InternalInit;
begin
  inherited InternalInit;
  FContent:=TUnsignedContent.Create;
  FSigner:=TSigner.Create;
  FExtendedSigner:=TExtendedSigners.Create;
end;

destructor TContentToPatch.Destroy;
begin
  FreeAndNil(FContent);
  FreeAndNil(FSigner);
  FreeAndNil(FExtendedSigner);
  inherited Destroy;
end;

{ TDocumentToPatch }

procedure TDocumentToPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentId', 1, true);;
  RegisterProp('Signer', 2);
  RegisterProp('ExtendedSigner', 3);
end;

procedure TDocumentToPatch.InternalInit;
begin
  inherited InternalInit;
  FDocumentId:=TDocumentId.Create;
  FSigner:=TSigner.Create;
  FExtendedSigner:=TExtendedSigners.Create;
end;

destructor TDocumentToPatch.Destroy;
begin
  FreeAndNil(FDocumentId);
  FreeAndNil(FSigner);
  FreeAndNil(FExtendedSigner);
  inherited Destroy;
end;


{ TDocumentPatchedContent }

procedure TDocumentPatchedContent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentId', 1, true);
  RegisterProp('PatchedContentId', 2, true);
  RegisterProp('Content', 3);
end;

procedure TDocumentPatchedContent.InternalInit;
begin
  inherited InternalInit;
  FDocumentId:=TDocumentId.Create;
end;

destructor TDocumentPatchedContent.Destroy;
begin
  FreeAndNil(FDocumentId);
  inherited Destroy;
end;

{ TPrepareDocumentsToSignResponse }

procedure TPrepareDocumentsToSignResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentPatchedContents', 1);
end;

procedure TPrepareDocumentsToSignResponse.InternalInit;
begin
  inherited InternalInit;
  FDocumentPatchedContents:=TDocumentPatchedContents.Create;
end;

destructor TPrepareDocumentsToSignResponse.Destroy;
begin
  FreeAndNil(FDocumentPatchedContents);
  inherited Destroy;
end;

{ TMessageToSend }

procedure TMessageToSend.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('MessageId', 2, true);
  RegisterProp('DocumentSignatures', 3);
end;

procedure TMessageToSend.InternalInit;
begin
  inherited InternalInit;
  FDocumentSignatures:=TDocumentSignatures.Create;
end;

destructor TMessageToSend.Destroy;
begin
  FreeAndNil(FDocumentSignatures);
  inherited Destroy;
end;

{ TDocumentSignature }

procedure TDocumentSignature.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('Signature', 2);
  RegisterProp('SignWithTestSignature', 4);
  RegisterProp('IsApprovementSignature', 5);
  RegisterProp('SignatureNameOnShelf', 6);
  RegisterProp('PatchedContentId', 7);
  RegisterProp('Labels', 8);
end;

procedure TDocumentSignature.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TDocumentSignature.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TRevocationRequestAttachment }

procedure TRevocationRequestAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('SignedContent', 2, true);
  RegisterProp('Labels', 3);
end;

procedure TRevocationRequestAttachment.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
  FSignedContent:=TSignedContent.Create;
end;

destructor TRevocationRequestAttachment.Destroy;
begin
  FreeAndNil(FLabels);
  FreeAndNil(FSignedContent);
  inherited Destroy;
end;

{ TXmlSignatureRejectionAttachment }

procedure TXmlSignatureRejectionAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('SignedContent', 2, true);
  RegisterProp('Labels', 3);
end;

procedure TXmlSignatureRejectionAttachment.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
  FSignedContent:=TSignedContent.Create;
end;

destructor TXmlSignatureRejectionAttachment.Destroy;
begin
  FreeAndNil(FLabels);
  FreeAndNil(FSignedContent);
  inherited Destroy;
end;

{ TSignedContent }

procedure TSignedContent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Content', 1);
  RegisterProp('Signature', 2);
  RegisterProp('NameOnShelf', 4);
  RegisterProp('SignWithTestSignature', 5);
  RegisterProp('SignatureNameOnShelf', 6);
end;

procedure TSignedContent.InternalInit;
begin
  inherited InternalInit;
end;

destructor TSignedContent.Destroy;
begin
  inherited Destroy;
end;

{ TRoamingNotificationToPost }

procedure TRoamingNotificationToPost.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('EventId', 2, true);
  RegisterProp('Success', 3, true);
  RegisterProp('Description', 4);
end;

procedure TRoamingNotificationToPost.InternalInit;
begin
  inherited InternalInit;
end;

destructor TRoamingNotificationToPost.Destroy;
begin
  inherited Destroy;
end;

{ TCustomDataPatch }

procedure TCustomDataPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('Operation',2, true);
  RegisterProp('Key',3, true);
  RegisterProp('Value',4);
end;

procedure TCustomDataPatch.InternalInit;
begin
  inherited InternalInit;
end;

destructor TCustomDataPatch.Destroy;
begin
  inherited Destroy;
end;

{ TEditDocumentPacketCommand }

procedure TEditDocumentPacketCommand.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentId', 1, true);
  RegisterProp('AddDocumentsToPacket', 2);
  RegisterProp('RemoveDocumentsFromPacket', 3);
end;

procedure TEditDocumentPacketCommand.InternalInit;
begin
  inherited InternalInit;
  FRemoveDocumentsFromPacket:=TDocumentIds.Create;
end;

destructor TEditDocumentPacketCommand.Destroy;
begin
  FreeAndNil(FRemoveDocumentsFromPacket);
  inherited Destroy;
end;

{ TResolutionRouteRemoval }

procedure TResolutionRouteRemoval.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1);
  RegisterProp('RouteId', 2);
  RegisterProp('Comment', 3);
  RegisterProp('Labels', 4);
end;

procedure TResolutionRouteRemoval.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TResolutionRouteRemoval.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TTemplateToPost }

procedure TTemplateToPost.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FromBoxId', 1);
  RegisterProp('ToBoxId', 2);
  RegisterProp('MessageFromBoxId', 3);
  RegisterProp('MessageToBoxId', 4);
  RegisterProp('MessageToDepartmentId', 5);
  RegisterProp('DocumentAttachments', 6);
  RegisterProp('LockMode', 7);
end;

procedure TTemplateToPost.InternalInit;
begin
  inherited InternalInit;
  FDocumentAttachments:=TTemplateDocumentAttachments.Create;
end;

destructor TTemplateToPost.Destroy;
begin
  FreeAndNil(FDocumentAttachments);
  inherited Destroy;
end;

{ TTemplateDocumentAttachment }

procedure TTemplateDocumentAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('UnsignedContent', 1, true);
  RegisterProp('Comment', 2);
  RegisterProp('TypeNamedId', 3, true);
  RegisterProp('FunctionType', 4);
  RegisterProp('Version', 5);
  RegisterProp('Metadata', 6);
  RegisterProp('WorkflowId', 7);
  RegisterProp('CustomDocumentId', 8);
  RegisterProp('EditingSettingId', 9);
  RegisterProp('NeedRecipientSignature', 10);
  RegisterProp('PredefinedRecipientTitle', 11);
end;

procedure TTemplateDocumentAttachment.InternalInit;
begin
  inherited InternalInit;
  FUnsignedContent:=TUnsignedContent.Create;
  FMetadata:=TMetadataItems.Create;
  FPredefinedRecipientTitle:=TPredefinedRecipientTitle.Create;
end;

destructor TTemplateDocumentAttachment.Destroy;
begin
  FPredefinedRecipientTitle.Free;
  FreeAndNil(FUnsignedContent);
  FreeAndNil(FMetadata);
  inherited Destroy;
end;

{ TUnsignedContent }

procedure TUnsignedContent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Content', 1);
  RegisterProp('NameOnShelf', 2);
end;

procedure TUnsignedContent.InternalInit;
begin
  inherited InternalInit;
end;

destructor TUnsignedContent.Destroy;
begin
  inherited Destroy;
end;

{ TTemplateTransformationToPost }

procedure TTemplateTransformationToPost.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('TemplateId', 2, true);
  RegisterProp('DocumentTransformations', 3);
end;

procedure TTemplateTransformationToPost.InternalInit;
begin
  inherited InternalInit;
  FDocumentTransformations:=TDocumentTransformations.Create;
end;

destructor TTemplateTransformationToPost.Destroy;
begin
  FreeAndNil(FDocumentTransformations);
  inherited Destroy;
end;

{ TDocumentTransformation }

procedure TDocumentTransformation.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentId', 1, true);
  RegisterProp('CustomDocumentId', 2);
end;

procedure TDocumentTransformation.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDocumentTransformation.Destroy;
begin
  inherited Destroy;
end;


{ TMetadataItem }

procedure TMetadataItem.InternalInit;
begin
  inherited InternalInit;
end;

procedure TMetadataItem.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Key', 1, true);
  RegisterProp('Value', 2, true);
end;

{ TResolutionAttachment }

procedure TResolutionAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialDocumentId', 1);
  RegisterProp('ResolutionType', 2);
  RegisterProp('Comment', 3);
  RegisterProp('Labels', 4);
end;

procedure TResolutionAttachment.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TResolutionAttachment.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TResolutionRequestDenialAttachment }

procedure TResolutionRequestDenialAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialResolutionRequestId', 1);
  RegisterProp('Comment', 2);
  RegisterProp('Labels', 3);
end;

procedure TResolutionRequestDenialAttachment.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TResolutionRequestDenialAttachment.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TResolutionRequestDenialCancellationAttachment }

procedure TResolutionRequestDenialCancellationAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialResolutionRequestDenialId', 1);
end;

procedure TResolutionRequestDenialCancellationAttachment.InternalInit;
begin
  inherited InternalInit;
end;

destructor TResolutionRequestDenialCancellationAttachment.Destroy;
begin
  inherited Destroy;
end;
{ TResolutionRequestCancellationAttachment }

procedure TResolutionRequestCancellationAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialResolutionRequestId', 1);
  RegisterProp('Comment', 2);
  RegisterProp('Labels', 3);
end;

procedure TResolutionRequestCancellationAttachment.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TResolutionRequestCancellationAttachment.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;

{ TResolutionRequestAttachment }

procedure TResolutionRequestAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialDocumentId', 1);
  RegisterProp('ResType', 2);
  RegisterProp('TargetUserId', 3);
  RegisterProp('TargetDepartmentId', 4);
  RegisterProp('Comment', 5);
  RegisterProp('Labels', 6);
end;

procedure TResolutionRequestAttachment.InternalInit;
begin
  inherited InternalInit;
  FLabels:=TDocumentStrings.Create;
end;

destructor TResolutionRequestAttachment.Destroy;
begin
  FreeAndNil(FLabels);
  inherited Destroy;
end;
end.

