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
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:string read FDocumentId write SetDocumentId;//1;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//2;
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
    procedure SetBoxId(AValue: string);
    procedure SetTemplateId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId;//1;
    property TemplateId:string read FTemplateId write SetTemplateId;//2;
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
    procedure SetContent(AValue: TBytes);
    procedure SetNameOnShelf(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Content:TBytes read FContent write SetContent;//1;
    property NameOnShelf:string read FNameOnShelf write SetNameOnShelf;//2;
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
    procedure SetKey(AValue: string);
    procedure SetValue(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property Key:string read FKey write SetKey;//1;
    property Value:string read FValue write SetValue;//2;
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
  //    optional bool RefusalDisabled = 12 [default = false];
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
    FRefusalDisabled: Boolean;
    FTypeNamedId: string;
    FUnsignedContent: TUnsignedContent;
    FVersion: string;
    FWorkflowId: int32;
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetEditingSettingId(AValue: string);
    procedure SetFunctionType(AValue: string);
    procedure SetNeedRecipientSignature(AValue: Boolean);
    procedure SetRefusalDisabled(AValue: Boolean);
    procedure SetTypeNamedId(AValue: string);
    procedure SetVersion(AValue: string);
    procedure SetWorkflowId(AValue: int32);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property UnsignedContent:TUnsignedContent read FUnsignedContent;//1;
    property Comment:string read FComment write SetComment;//2;
    property TypeNamedId:string read FTypeNamedId write SetTypeNamedId;//3;
    property FunctionType:string read FFunctionType write SetFunctionType;//4;
    property Version:string read FVersion write SetVersion;//5;
    property Metadata:TMetadataItems read FMetadata;//6;
    property WorkflowId:int32 read FWorkflowId write SetWorkflowId;//7;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//8;
    property EditingSettingId:string read FEditingSettingId write SetEditingSettingId;//9;
    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write SetNeedRecipientSignature;//10
    property PredefinedRecipientTitle:TPredefinedRecipientTitle read FPredefinedRecipientTitle;//11;
    property RefusalDisabled:Boolean read FRefusalDisabled write SetRefusalDisabled default false;//12
  end;
  TTemplateDocumentAttachments = specialize GSerializationObjectList<TTemplateDocumentAttachment>;

  { TemplateRefusalAttachment }
  //message TemplateRefusalAttachment {
  //	required string DocumentId = 1;
  //	optional string Comment = 2;
  //	repeated string Labels = 3;
  //}
  TTemplateRefusalAttachment = class(TSerializationObject)
  private
    FDocumentId:String;
    FComment:String;
    FLabels:TDocumentStrings;
    procedure SetDocumentId(AValue:String);
    procedure SetComment(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:String read FDocumentId write SetDocumentId;
    property Comment:String read FComment write SetComment;
    property Labels:TDocumentStrings read FLabels;
  end;
  TTemplateRefusalAttachments = specialize GSerializationObjectList<TTemplateRefusalAttachment>;

  { TemplatePatchToPost }
  //message TemplatePatchToPost {
  //	repeated TemplateRefusalAttachment Refusals = 1;
  //}
  TTemplatePatchToPost = class(TSerializationObject)
  private
    FRefusals:TTemplateRefusalAttachments;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Refusals:TTemplateRefusalAttachments read FRefusals;
  end;
  TTemplatePatchToPosts = specialize GSerializationObjectList<TTemplatePatchToPost>;


  {  TTemplateToPost  }
  //message TemplateToPost {
  //	required string FromBoxId = 1;
  //	required string ToBoxId = 2;
  //	required string MessageFromBoxId = 3;
  //	required string MessageToBoxId = 4;
  //	optional string MessageToDepartmentId = 5;
  //	repeated TemplateDocumentAttachment DocumentAttachments = 6;
  //    optional LockMode LockMode = 7 [default = None];
  //    optional string FromDepartmentId = 8;
  //    optional string ToDepartmentId = 9;
  //}
  TTemplateToPost = class(TSerializationObject) //message TemplateToPost
  private
    FDocumentAttachments: TTemplateDocumentAttachments;
    FFromBoxId: string;
    FFromDepartmentId: string;
    FLockMode: TLockMode;
    FMessageFromBoxId: string;
    FMessageToBoxId: string;
    FMessageToDepartmentId: string;
    FToBoxId: string;
    FToDepartmentId: string;
    procedure SetFromBoxId(AValue: string);
    procedure SetFromDepartmentId(AValue: string);
    procedure SetLockMode(AValue: TLockMode);
    procedure SetMessageFromBoxId(AValue: string);
    procedure SetMessageToBoxId(AValue: string);
    procedure SetMessageToDepartmentId(AValue: string);
    procedure SetToBoxId(AValue: string);
    procedure SetToDepartmentId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FromBoxId:string read FFromBoxId write SetFromBoxId;//1;
    property ToBoxId:string read FToBoxId write SetToBoxId;//2;
    property MessageFromBoxId:string read FMessageFromBoxId write SetMessageFromBoxId;//3;
    property MessageToBoxId:string read FMessageToBoxId write SetMessageToBoxId;//4;
    property MessageToDepartmentId:string read FMessageToDepartmentId write SetMessageToDepartmentId;//5;
    property DocumentAttachments:TTemplateDocumentAttachments read FDocumentAttachments; //6;
    property LockMode:TLockMode read FLockMode write SetLockMode;//7 [default = None];
    property FromDepartmentId:string read FFromDepartmentId write SetFromDepartmentId; //8;
    property ToDepartmentId:string read FToDepartmentId write SetToDepartmentId;//9;
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
    procedure SetComment(AValue: string);
    procedure SetParentEntityId(AValue: string);
    procedure SetRouteId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId;//1;
    property RouteId:string read FRouteId write SetRouteId;//2;
    property Comment:string read FComment write SetComment;//3
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
    procedure SetDocumentId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:string read FDocumentId write SetDocumentId; //1;
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
    procedure SetKey(AValue: string);
    procedure SetOperation(AValue: TCustomDataPatchOperation);
    procedure SetParentEntityId(AValue: string);
    procedure SetValue(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId;//1;
    property Operation:TCustomDataPatchOperation read FOperation write SetOperation;//2;
    property Key:string read FKey write SetKey;//3;
    property Value:string read FValue write SetValue;//4;
  end;
  TCustomDataPatchs = specialize GSerializationObjectList<TCustomDataPatch>;

  {  TRoamingNotificationToPost  }
  //message RoamingNotificationToPost {
  //	required string BoxId = 1;
  //	required string EventId = 2;
  //	required bool Success = 3;
  //	optional string Description = 4;
  //    optional string MessageId = 5;
  //    repeated string NotifiableEntityIds = 6;
  //}
  TRoamingNotificationToPost = class(TSerializationObject) //message RoamingNotificationToPost
  private
    FBoxId: string;
    FDescription: string;
    FEventId: string;
    FMessageId: string;
    FNotifiableEntityIds: TDocumentStrings;
    FSuccess: Boolean;
    procedure SetBoxId(AValue: string);
    procedure SetDescription(AValue: string);
    procedure SetEventId(AValue: string);
    procedure SetMessageId(AValue: string);
    procedure SetSuccess(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId;//1;
    property EventId:string read FEventId write SetEventId;//2;
    property Success:Boolean read FSuccess write SetSuccess;//3;
    property Description:string read FDescription write SetDescription;//4;
    property MessageId:string read FMessageId write SetMessageId;// = 5;
    property NotifiableEntityIds:TDocumentStrings read FNotifiableEntityIds;//6;
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
    procedure SetContent(AValue: TBytes);
    procedure SetNameOnShelf(AValue: string);
    procedure SetSignature(AValue: TBytes);
    procedure SetSignatureNameOnShelf(AValue: string);
    procedure SetSignWithTestSignature(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
    procedure LoadContent(S:TStream); overload;
    procedure LoadContent(const AFileName:string); overload;
    procedure LoadSignature(S:TStream); overload;
    procedure LoadSignature(const AFileName:string); overload;
  published
    property Content:TBytes read FContent write SetContent;//1;
    property Signature:TBytes read FSignature write SetSignature;//2;
    property NameOnShelf:string read FNameOnShelf write SetNameOnShelf;//4;
    property SignWithTestSignature:Boolean read FSignWithTestSignature write SetSignWithTestSignature;//5
    property SignatureNameOnShelf:string read FSignatureNameOnShelf write SetSignatureNameOnShelf;//6;
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
    procedure SetParentEntityId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId;//1;
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
    procedure SetParentEntityId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId; //1;
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
    procedure SetIsApprovementSignature(AValue: boolean);
    procedure SetParentEntityId(AValue: string);
    procedure SetPatchedContentId(AValue: string);
    procedure SetSignature(AValue: TBytes);
    procedure SetSignatureNameOnShelf(AValue: string);
    procedure SetSignWithTestSignature(AValue: boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId;//1;
    property Signature:TBytes read FSignature write SetSignature;//2;
    property SignWithTestSignature:boolean read FSignWithTestSignature write SetSignWithTestSignature;//4
    property IsApprovementSignature:boolean read FIsApprovementSignature write SetIsApprovementSignature;//5
    property SignatureNameOnShelf:string read FSignatureNameOnShelf write SetSignatureNameOnShelf;//6;
    property PatchedContentId:string read FPatchedContentId write SetPatchedContentId;//7;
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
    procedure SetBoxId(AValue: string);
    procedure SetMessageId(AValue: String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId;//1;
    property MessageId:String read FMessageId write SetMessageId;//2;
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
    procedure SetContent(AValue: TBytes);
    procedure SetPatchedContentId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:TDocumentId read FDocumentId; //1;
    property PatchedContentId:string read FPatchedContentId write SetPatchedContentId;//2;
    property Content:TBytes read FContent write SetContent;//3;
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
    procedure SetContent(AValue: TUnsignedContent);
    procedure SetFunctionType(AValue: string);
    procedure SetToBoxId(AValue: string);
    procedure SetTypeNamedId(AValue: string);
    procedure SetVersion(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TypeNamedId:string read FTypeNamedId write SetTypeNamedId;//1;
    property FunctionType:string read FFunctionType write SetFunctionType;//2;
    property Version:string read FVersion write SetVersion;//3;
    property Content:TUnsignedContent read FContent write SetContent;//4;
    property ToBoxId:string read FToBoxId write SetToBoxId;//5;
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
    procedure SetToBoxId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:TDocumentId read FDocumentId; //1;
    property ToBoxId:string read FToBoxId write SetToBoxId;//2;
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
    procedure SetBoxId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId;//1;
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
    procedure SetParentEntityId(AValue: string);
    procedure SetPatchedContentId(AValue: String);
    procedure SetSignature(AValue: TBytes);
    procedure SetSignWithTestSignature(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId;//1;
    property Signature:TBytes read FSignature write SetSignature;//2;
    property SignWithTestSignature:Boolean read FSignWithTestSignature write SetSignWithTestSignature;//4
    property PatchedContentId:String read FPatchedContentId write SetPatchedContentId;//5;
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
    procedure SetBoxId(AValue: string);
    procedure SetDraftId(AValue: string);
    procedure SetProxyBoxId(AValue: string);
    procedure SetProxyDepartmentId(AValue: string);
    procedure SetToBoxId(AValue: string);
    procedure SetToDepartmentId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId;//1;
    property DraftId:string read FDraftId write SetDraftId;//2;
    property ToBoxId:string read FToBoxId write SetToBoxId;//3;
    property ToDepartmentId:string read FToDepartmentId write SetToDepartmentId;//4;
    property DocumentSignatures:TDocumentSenderSignatures read FDocumentSignatures;//5;
    property ProxyBoxId:string read FProxyBoxId write SetProxyBoxId;//6;
    property ProxyDepartmentId:string read FProxyDepartmentId write SetProxyDepartmentId;//7;
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
    procedure SetParentEntityId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId; //1;
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
    procedure SetParentEntityId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId; //1;
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
    procedure SetNeedReceipt(AValue: Boolean);
    procedure SetParentEntityId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId;//1;
    property SignedContent:TSignedContent read FSignedContent;//2;
    property Labels:TDocumentStrings read FLabels;//4;
    property NeedReceipt:Boolean read FNeedReceipt write SetNeedReceipt default false;//5;
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
    procedure SetParentEntityId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId; //1;
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
    procedure SetComment(AValue: string);
    procedure SetInitialDocumentId(AValue: string);
    procedure SetResolutionType(AValue: TResolutionType);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialDocumentId:string read FInitialDocumentId write SetInitialDocumentId; //1
    property ResolutionType:TResolutionType read FResolutionType write SetResolutionType; //2
    property Comment:string read FComment write SetComment; //3;
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
    procedure SetComment(AValue: string);
    procedure SetInitialResolutionRequestId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialResolutionRequestId:string read FInitialResolutionRequestId write SetInitialResolutionRequestId;//1;
    property Comment:string read FComment write SetComment;//2;
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
    procedure SetInitialResolutionRequestDenialId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialResolutionRequestDenialId:string read FInitialResolutionRequestDenialId write SetInitialResolutionRequestDenialId;//1;
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
    procedure SetComment(AValue: string);
    procedure SetInitialResolutionRequestId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialResolutionRequestId:string read FInitialResolutionRequestId write SetInitialResolutionRequestId; //1
    property Comment:string read FComment write SetComment; //2
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
    procedure SetComment(AValue: string);
    procedure SetInitialDocumentId(AValue: string);
    procedure SetRouteId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialDocumentId:string read FInitialDocumentId write SetInitialDocumentId;//1;
    property RouteId:string read FRouteId write SetRouteId;//2;
    property Comment:string read FComment write SetComment;//3;
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
    procedure SetComment(AValue: string);
    procedure SetInitialDocumentId(AValue: string);
    procedure SetResType(AValue: TResolutionRequestType);
    procedure SetTargetDepartmentId(AValue: string);
    procedure SetTargetUserId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialDocumentId:string read FInitialDocumentId write SetInitialDocumentId; //1;
    property ResType:TResolutionRequestType read FResType write SetResType; //2;
    property TargetUserId:string read FTargetUserId write SetTargetUserId; //3;
    property TargetDepartmentId:string read FTargetDepartmentId write SetTargetDepartmentId; //4;
    property Comment:string read FComment write SetComment; //5;
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
    procedure SetErrorMessage(AValue: string);
    procedure SetInitialDocumentId(AValue: string);
    procedure SetIsValid(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialDocumentId:string read FInitialDocumentId write SetInitialDocumentId;//1;
    property IsValid:Boolean read FIsValid write SetIsValid;//2;
    property ErrorMessage:string read FErrorMessage write SetErrorMessage;//3;
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
    procedure SetParentEntityId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentEntityId:string read FParentEntityId write SetParentEntityId;//1;
    property Content:TUnsignedContent read FContent;//2;
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
    procedure SetBoxId(AValue: string);
    procedure SetMessageId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId;//1;
    property MessageId:string read FMessageId write SetMessageId;//2;
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
  //    optional string EditingSettingId = 18;
  //}
  TDocumentAttachment = class(TSerializationObject) //message DocumentAttachment
  private
    FComment: string;
    FCustomData: TCustomDataItems;
    FCustomDocumentId: string;
    FEditingSettingId: string;
    FFunctionType: string;
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetEditingSettingId(AValue: string);
    procedure SetFunctionType(AValue: string);
    procedure SetIsEncrypted(AValue: Boolean);
    procedure SetNeedReceipt(AValue: boolean);
    procedure SetNeedRecipientSignature(AValue: Boolean);
    procedure SetTypeNamedId(AValue: string);
    procedure SetVersion(AValue: string);
    procedure SetWorkflowId(AValue: int32);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    // reserved 2 for FileName
    property Comment:string read FComment write SetComment; //3;
    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write SetNeedRecipientSignature;//4
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;//5;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//6;
    // reserved 7 for DocumentDate
    // reserved 8 for DocumentNumber
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//9;
    property NeedReceipt:boolean read FNeedReceipt write SetNeedReceipt; //10
    property CustomData:TCustomDataItems read FCustomData;//11;
    property TypeNamedId:string read FTypeNamedId write SetTypeNamedId; //12;
    property FunctionType:string read FFunctionType write SetFunctionType; //13;
    property Version:string read FVersion write SetVersion;//14;
    property Metadata:TMetadataItems read FMetadata; //15;
    property WorkflowId:int32 read FWorkflowId write SetWorkflowId;//16;
    property IsEncrypted:Boolean read FIsEncrypted write SetIsEncrypted;//17
    property EditingSettingId:string read FEditingSettingId write SetEditingSettingId; //18;
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetNeedReceipt(AValue: boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write SetFileName;//2;
    property Comment:string read FComment write SetComment;//3;
    // reserved 4 for NeedRecipientSignature
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;//5;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//6;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//7;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;//8;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//9;
    property NeedReceipt:boolean read FNeedReceipt write SetNeedReceipt;//10
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
    procedure SetComment(AValue: string);
    procedure SetContractDate(AValue: string);
    procedure SetContractNumber(AValue: string);
    procedure SetContractType(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetNeedReceipt(AValue: Boolean);
    procedure SetTotal(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write SetFileName;//2;
    property Comment:string read FComment write SetComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//5;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//6;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//7;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;//8;
    property Total:string read FTotal write SetTotal;//9;
    property ContractNumber:string read FContractNumber write SetContractNumber;//10;
    property ContractDate:string read FContractDate write SetContractDate;//11;
    property ContractType:string read FContractType write SetContractType;//12;
    property NeedReceipt:Boolean read FNeedReceipt write SetNeedReceipt;//13
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
    procedure SetComment(AValue: string);
    procedure SetContractPrice(AValue: string);
    procedure SetContractType(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetNeedReceipt(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write SetFileName;//2;
    property Comment:string read FComment write SetComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds; //5;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//6;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//7;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;//8;
    property ContractPrice:string read FContractPrice write SetContractPrice;//9;
    property ContractType:string read FContractType write SetContractType;//10;
    property NeedReceipt:Boolean read FNeedReceipt write SetNeedReceipt;//11
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetNeedReceipt(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write SetFileName;//2;
    property Comment:string read FComment write SetComment;//3;
    // reserved 4 for NeedRecipientSignature
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //5;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//6;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//7;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;//8
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//9;
    property NeedReceipt:Boolean read FNeedReceipt write SetNeedReceipt;//10
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
    procedure SetComment(AValue: string);
    procedure SetContractDocumentDate(AValue: string);
    procedure SetContractDocumentNumber(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetNeedReceipt(AValue: Boolean);
    procedure SetPriceListEffectiveDate(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent;//1;
    property FileName:string read FFileName write SetFileName;//2;
    property Comment:string read FComment write SetComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//5;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//6;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//7;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;//8;
    property PriceListEffectiveDate:string read FPriceListEffectiveDate write SetPriceListEffectiveDate;//9;
    property ContractDocumentDate:string read FContractDocumentDate write SetContractDocumentDate;//10;
    property ContractDocumentNumber:string read FContractDocumentNumber write SetContractDocumentNumber;//11;
    property NeedReceipt:Boolean read FNeedReceipt write SetNeedReceipt;//12
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
    procedure SetContent(AValue: TBytes);
    procedure SetFileName(AValue: string);
    procedure SetParentCustomDocumentId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Content:TBytes read FContent write SetContent; //1;
    property FileName:string read FFileName write SetFileName;//2;
    property ParentCustomDocumentId:string read FParentCustomDocumentId write SetParentCustomDocumentId;//3;
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetFileName(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write SetFileName;//2;
    property Comment:string read FComment write SetComment;//3;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//4;
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetGrounds(AValue: string);
    procedure SetNeedReceipt(AValue: Boolean);
    procedure SetNeedRecipientSignature(AValue: Boolean);
    procedure SetTotal(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write SetFileName;//2;
    property Comment:string read FComment write SetComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;//4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//5;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//6;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;//7
    property Total:string read FTotal write SetTotal;//8;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//9;
    property Vat:string read FVat write SetVat;//10;
    property Grounds:string read FGrounds write SetGrounds;//11;
    property NeedReceipt:Boolean read FNeedReceipt write SetNeedReceipt;//12
    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write SetNeedRecipientSignature;//13
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetGrounds(AValue: string);
    procedure SetNeedReceipt(AValue: Boolean);
    procedure SetTotal(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent;//1;
    property FileName:string read FFileName write SetFileName;//2;
    property Comment:string read FComment write SetComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;//4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//5;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//6;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;//7;
    property Total:string read FTotal write SetTotal;//8;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//9;
    // reserved 10 for Vat
    property Grounds:string read FGrounds write SetGrounds;//11;
    property NeedReceipt:Boolean read FNeedReceipt write SetNeedReceipt;//12;
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetGrounds(AValue: string);
    procedure SetNeedReceipt(AValue: boolean);
    procedure SetTotal(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent;//1;
    property FileName:string read FFileName write SetFileName;//2;
    property Comment:string read FComment write SetComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;//4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds; //5;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//6;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;//7;
    property Total:string read FTotal write SetTotal;//8;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//9;
    property Vat:string read FVat write SetVat;//10;
    property Grounds:string read FGrounds write SetGrounds;//11;
    property NeedReceipt:boolean read FNeedReceipt write SetNeedReceipt; //12
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetNeedReceipt(AValue: Boolean);
    procedure SetNeedRecipientSignature(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write SetFileName; //2;
    property Comment:string read FComment write SetComment; //3;
    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write SetNeedRecipientSignature;//4
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //5;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//6;
    property DocumentDate:string read FDocumentDate write SetDocumentDate; //7;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber; //8;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId; //9;
    property NeedReceipt:Boolean read FNeedReceipt write SetNeedReceipt; //10
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetNeedReceipt(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent;//1;
    property Comment:string read FComment write SetComment; //3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//5;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//6;
    property NeedReceipt:Boolean read FNeedReceipt write SetNeedReceipt; //7
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
    property OriginalInvoiceDateAndNumber:TDocumentDateAndNumber read FOriginalInvoiceDateAndNumber;//1;
    property OriginalInvoiceRevisionDateAndNumber:TDocumentDateAndNumber read FOriginalInvoiceRevisionDateAndNumber;//2;
    property InvoiceCorrectionRevisionDateAndNumber:TDocumentDateAndNumber read FInvoiceCorrectionRevisionDateAndNumber; //3;
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
    property RevisionDateAndNumber:TDocumentDateAndNumber read FRevisionDateAndNumber; //1;
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
    procedure SetDocumentName(AValue: string);
    procedure SetFormationDate(AValue: string);
    procedure SetFormationTime(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FormationDate:string read FFormationDate write SetFormationDate;//1;
    property FormationTime:string read FFormationTime write SetFormationTime;//2;
    property DocumentName:string read FDocumentName write SetDocumentName;//3;
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
    procedure SetBuyerFnsParticipantId(AValue: string);
    procedure SetFileId(AValue: string);
    procedure SetSenderFnsParticipantId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FileId:string read FFileId write SetFileId;//1;
    property BuyerFnsParticipantId:string read FBuyerFnsParticipantId write SetBuyerFnsParticipantId;//2;
    property SenderFnsParticipantId:string read FSenderFnsParticipantId write SetSenderFnsParticipantId;//3;
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetInitialDocumentIds(AValue: TDocumentIds);
    procedure SetSubordinateDocumentIds(AValue: TDocumentIds);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property Comment:string read FComment write SetComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds write SetInitialDocumentIds;//4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds write SetSubordinateDocumentIds; //5;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;// = 6;
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
    procedure SetComment(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent;//1;
    property Comment:string read FComment write SetComment;//3;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //4;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds; //5;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId;//6;
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
    procedure SetDelaySend(AValue: Boolean);
    procedure SetFromBoxId(AValue: string);
    procedure SetFromDepartmentId(AValue: string);
    procedure SetIsDraft(AValue: Boolean);
    procedure SetIsInternal(AValue: Boolean);
    procedure SetLockDraft(AValue: Boolean);
    procedure SetLockMode(AValue: TLockMode);
    procedure SetLockPacket(AValue: Boolean);
    procedure SetProxyBoxId(AValue: string);
    procedure SetProxyDepartmentId(AValue: string);
    procedure SetStrictDraftValidation(AValue: Boolean);
    procedure SetToBoxId(AValue: string);
    procedure SetToDepartmentId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FromBoxId:string read FFromBoxId write SetFromBoxId;//1;
    property ToBoxId:string read FToBoxId write SetToBoxId;//2;
    property Invoices:TXmlDocumentAttachments read FInvoices; //3;
    property NonformalizedDocuments:TNonformalizedAttachments read FNonformalizedDocuments;//4;
    property Torg12Documents:TBasicDocumentAttachments read FTorg12Documents;//5;
    property AcceptanceCertificates:TAcceptanceCertificateAttachments read FAcceptanceCertificates;//7;
    property StructuredDataAttachments:TStructuredDataAttachments read FStructuredDataAttachments; //8;
    property ProformaInvoices:TBasicDocumentAttachments read FProformaInvoices;//9;
    property XmlTorg12SellerTitles:TXmlDocumentAttachments read FXmlTorg12SellerTitles;//10;
    property XmlAcceptanceCertificateSellerTitles:TXmlDocumentAttachments read FXmlAcceptanceCertificateSellerTitles;//11;
    property ToDepartmentId:string read FToDepartmentId write SetToDepartmentId;//12;
    property IsDraft:Boolean read FIsDraft write SetIsDraft;//13
    property LockDraft:Boolean read FLockDraft write SetLockDraft;//14
    property StrictDraftValidation:Boolean read FStrictDraftValidation write SetStrictDraftValidation default true;//15
    property IsInternal:Boolean read FIsInternal write SetIsInternal;//16
    property FromDepartmentId:string read FFromDepartmentId write SetFromDepartmentId;//17;
    property DelaySend:Boolean read FDelaySend write SetDelaySend;//18
    property PriceLists:TPriceListAttachments read FPriceLists;//19;
    property PriceListAgreements:TNonformalizedAttachments read FPriceListAgreements;//20;
    property CertificateRegistries:TNonformalizedAttachment read FCertificateRegistries; //21;
    property ReconciliationActs:TReconciliationActAttachments read FReconciliationActs;//22;
    property Contracts:TContractAttachments read FContracts;//23;
    property Torg13Documents:TTorg13Attachments read FTorg13Documents;//24;
    property ServiceDetailsDocuments:TServiceDetailsAttachments read FServiceDetailsDocuments;//25;
    property ProxyBoxId:string read FProxyBoxId write SetProxyBoxId;//26;
    property ProxyDepartmentId:string read FProxyDepartmentId write SetProxyDepartmentId;//27;
    property EncryptedInvoices:TEncryptedInvoiceAttachments read FEncryptedInvoices;//28;
    property EncryptedXmlTorg12SellerTitles:TEncryptedXmlDocumentAttachment read FEncryptedXmlTorg12SellerTitles;//29;
    property EncryptedXmlAcceptanceCertificateSellerTitles:TEncryptedXmlDocumentAttachment read FEncryptedXmlAcceptanceCertificateSellerTitles;//30;
    property SupplementaryAgreements:TSupplementaryAgreementAttachments read FSupplementaryAgreements;//31;
    property LockPacket:Boolean read FLockPacket write SetLockPacket; //32
    property UniversalTransferDocumentSellerTitles:TXmlDocumentAttachments read FUniversalTransferDocumentSellerTitles; //33;
    property DocumentAttachments:TDocumentAttachments read FDocumentAttachments;//34;
    property LockMode:TLockMode read FLockMode write SetLockMode default None;//35];
  end;

implementation

{ TRecipientTitleAttachment }

procedure TRecipientTitleAttachment.SetNeedReceipt(AValue: Boolean);
begin
  FNeedReceipt:=AValue;
  Modified(5);
end;

procedure TRecipientTitleAttachment.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

procedure TRecipientTitleAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('SignedContent', 2, true);
  RegisterProp('Labels', 4);
  RegisterProp('NeedReceipt', 5, true);
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
  RegisterProp('UnsignedContent', 1, true);
end;

destructor TPredefinedRecipientTitle.Destroy;
begin
  FUnsignedContent.Free;
  inherited Destroy;
end;

{ TEditingPatch }

procedure TEditingPatch.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

procedure TEditingPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('Content', 2, true);
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

procedure TMessageToPost.SetDelaySend(AValue: Boolean);
begin
  FDelaySend:=AValue;
  Modified(18);
end;

procedure TMessageToPost.SetFromBoxId(AValue: string);
begin
  if FFromBoxId=AValue then Exit;
  FFromBoxId:=AValue;
  Modified(1);
end;

procedure TMessageToPost.SetFromDepartmentId(AValue: string);
begin
  FFromDepartmentId:=AValue;
  Modified(17);
end;

procedure TMessageToPost.SetIsDraft(AValue: Boolean);
begin
  FIsDraft:=AValue;
  Modified(13);
end;

procedure TMessageToPost.SetIsInternal(AValue: Boolean);
begin
  FIsInternal:=AValue;
  Modified(16);
end;

procedure TMessageToPost.SetLockDraft(AValue: Boolean);
begin
  FLockDraft:=AValue;
  Modified(14);
end;

procedure TMessageToPost.SetLockMode(AValue: TLockMode);
begin
  FLockMode:=AValue;
  Modified(35);
end;

procedure TMessageToPost.SetLockPacket(AValue: Boolean);
begin
  FLockPacket:=AValue;
  Modified(32);
end;

procedure TMessageToPost.SetProxyBoxId(AValue: string);
begin
  if FProxyBoxId=AValue then Exit;
  FProxyBoxId:=AValue;
  Modified(26);
end;

procedure TMessageToPost.SetProxyDepartmentId(AValue: string);
begin
  if FProxyDepartmentId=AValue then Exit;
  FProxyDepartmentId:=AValue;
  Modified(27);
end;

procedure TMessageToPost.SetStrictDraftValidation(AValue: Boolean);
begin
  FStrictDraftValidation:=AValue;
  Modified(15);
end;

procedure TMessageToPost.SetToBoxId(AValue: string);
begin
  if FToBoxId=AValue then Exit;
  FToBoxId:=AValue;
  Modified(2);
end;

procedure TMessageToPost.SetToDepartmentId(AValue: string);
begin
  if FToDepartmentId=AValue then Exit;
  FToDepartmentId:=AValue;
  Modified(12);
end;

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
  FLockMode:=None;
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

procedure TEncryptedXmlDocumentAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TEncryptedXmlDocumentAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(6);
end;

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

procedure TEncryptedInvoiceAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TEncryptedInvoiceAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(6);
end;

procedure TEncryptedInvoiceAttachment.SetInitialDocumentIds(AValue: TDocumentIds
  );
begin
  if FInitialDocumentIds=AValue then Exit;
  FInitialDocumentIds:=AValue;
  Modified(4);
end;

procedure TEncryptedInvoiceAttachment.SetSubordinateDocumentIds(
  AValue: TDocumentIds);
begin
  if FSubordinateDocumentIds=AValue then Exit;
  FSubordinateDocumentIds:=AValue;
  Modified(5);
end;

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

procedure TEncryptedDocumentMetadata.SetBuyerFnsParticipantId(AValue: string);
begin
  if FBuyerFnsParticipantId=AValue then Exit;
  FBuyerFnsParticipantId:=AValue;
  Modified(2);
end;

procedure TEncryptedDocumentMetadata.SetFileId(AValue: string);
begin
  if FFileId=AValue then Exit;
  FFileId:=AValue;
  Modified(1);
end;

procedure TEncryptedDocumentMetadata.SetSenderFnsParticipantId(AValue: string);
begin
  if FSenderFnsParticipantId=AValue then Exit;
  FSenderFnsParticipantId:=AValue;
  Modified(3);
end;

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

procedure TEncryptedXmlBasicDocumentMetadata.SetDocumentName(AValue: string);
begin
  if FDocumentName=AValue then Exit;
  FDocumentName:=AValue;
  Modified(3);
end;

procedure TEncryptedXmlBasicDocumentMetadata.SetFormationDate(AValue: string);
begin
  if FFormationDate=AValue then Exit;
  FFormationDate:=AValue;
  Modified(1);
end;

procedure TEncryptedXmlBasicDocumentMetadata.SetFormationTime(AValue: string);
begin
  if FFormationTime=AValue then Exit;
  FFormationTime:=AValue;
  Modified(2);
end;

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

procedure TXmlDocumentAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TXmlDocumentAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(6);
end;

procedure TXmlDocumentAttachment.SetNeedReceipt(AValue: Boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(7);
end;

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

procedure TNonformalizedAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TNonformalizedAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(9);
end;

procedure TNonformalizedAttachment.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(7);
end;

procedure TNonformalizedAttachment.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(8);
end;

procedure TNonformalizedAttachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

procedure TNonformalizedAttachment.SetNeedReceipt(AValue: Boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(10);
end;

procedure TNonformalizedAttachment.SetNeedRecipientSignature(AValue: Boolean);
begin
  if FNeedRecipientSignature=AValue then Exit;
  FNeedRecipientSignature:=AValue;
  Modified(4);
end;

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

procedure TBasicDocumentAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TBasicDocumentAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(9);
end;

procedure TBasicDocumentAttachment.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(6);
end;

procedure TBasicDocumentAttachment.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(7);
end;

procedure TBasicDocumentAttachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

procedure TBasicDocumentAttachment.SetGrounds(AValue: string);
begin
  if FGrounds=AValue then Exit;
  FGrounds:=AValue;
  Modified(11);
end;

procedure TBasicDocumentAttachment.SetNeedReceipt(AValue: boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(12);
end;

procedure TBasicDocumentAttachment.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(8);
end;

procedure TBasicDocumentAttachment.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(10);
end;

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

procedure TTorg13Attachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TTorg13Attachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(9);
end;

procedure TTorg13Attachment.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(6);
end;

procedure TTorg13Attachment.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(7);
end;

procedure TTorg13Attachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

procedure TTorg13Attachment.SetGrounds(AValue: string);
begin
  if FGrounds=AValue then Exit;
  FGrounds:=AValue;
  Modified(11);
end;

procedure TTorg13Attachment.SetNeedReceipt(AValue: Boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(12);
end;

procedure TTorg13Attachment.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(8);
end;

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

procedure TAcceptanceCertificateAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TAcceptanceCertificateAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(9);
end;

procedure TAcceptanceCertificateAttachment.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(6);
end;

procedure TAcceptanceCertificateAttachment.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(7);
end;

procedure TAcceptanceCertificateAttachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

procedure TAcceptanceCertificateAttachment.SetGrounds(AValue: string);
begin
  if FGrounds=AValue then Exit;
  FGrounds:=AValue;
  Modified(11);
end;

procedure TAcceptanceCertificateAttachment.SetNeedReceipt(AValue: Boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(12);
end;

procedure TAcceptanceCertificateAttachment.SetNeedRecipientSignature(
  AValue: Boolean);
begin
  if FNeedRecipientSignature=AValue then Exit;
  FNeedRecipientSignature:=AValue;
  Modified(13);
end;

procedure TAcceptanceCertificateAttachment.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(8);
end;

procedure TAcceptanceCertificateAttachment.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(10);
end;

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

procedure TTrustConnectionRequestAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TTrustConnectionRequestAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(4);
end;

procedure TTrustConnectionRequestAttachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

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

procedure TStructuredDataAttachment.SetContent(AValue: TBytes);
begin
  if FContent=AValue then Exit;
  FContent:=AValue;
  Modified(1);
end;

procedure TStructuredDataAttachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

procedure TStructuredDataAttachment.SetParentCustomDocumentId(AValue: string);
begin
  if FParentCustomDocumentId=AValue then Exit;
  FParentCustomDocumentId:=AValue;
  Modified(3);
end;

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

procedure TPriceListAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TPriceListAttachment.SetContractDocumentDate(AValue: string);
begin
  if FContractDocumentDate=AValue then Exit;
  FContractDocumentDate:=AValue;
  Modified(10);
end;

procedure TPriceListAttachment.SetContractDocumentNumber(AValue: string);
begin
  if FContractDocumentNumber=AValue then Exit;
  FContractDocumentNumber:=AValue;
  Modified(11);
end;

procedure TPriceListAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(6);
end;

procedure TPriceListAttachment.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(7);
end;

procedure TPriceListAttachment.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(8);
end;

procedure TPriceListAttachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

procedure TPriceListAttachment.SetNeedReceipt(AValue: Boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(12);
end;

procedure TPriceListAttachment.SetPriceListEffectiveDate(AValue: string);
begin
  if FPriceListEffectiveDate=AValue then Exit;
  FPriceListEffectiveDate:=AValue;
  Modified(9);
end;

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

procedure TReconciliationActAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TReconciliationActAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(9);
end;

procedure TReconciliationActAttachment.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(7);
end;

procedure TReconciliationActAttachment.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(8);
end;

procedure TReconciliationActAttachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

procedure TReconciliationActAttachment.SetNeedReceipt(AValue: Boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(10);
end;

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

procedure TContractAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(2);
end;

procedure TContractAttachment.SetContractPrice(AValue: string);
begin
  if FContractPrice=AValue then Exit;
  FContractPrice:=AValue;
  Modified(9);
end;

procedure TContractAttachment.SetContractType(AValue: string);
begin
  if FContractType=AValue then Exit;
  FContractType:=AValue;
  Modified(10);
end;

procedure TContractAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(6);
end;

procedure TContractAttachment.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(7);
end;

procedure TContractAttachment.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(8);
end;

procedure TContractAttachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(1);
end;

procedure TContractAttachment.SetNeedReceipt(AValue: Boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(11);
end;

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

procedure TSupplementaryAgreementAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TSupplementaryAgreementAttachment.SetContractDate(AValue: string);
begin
  if FContractDate=AValue then Exit;
  FContractDate:=AValue;
  Modified(11);
end;

procedure TSupplementaryAgreementAttachment.SetContractNumber(AValue: string);
begin
  if FContractNumber=AValue then Exit;
  FContractNumber:=AValue;
  Modified(10);
end;

procedure TSupplementaryAgreementAttachment.SetContractType(AValue: string);
begin
  if FContractType=AValue then Exit;
  FContractType:=AValue;
  Modified(12);
end;

procedure TSupplementaryAgreementAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(6);
end;

procedure TSupplementaryAgreementAttachment.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(7);
end;

procedure TSupplementaryAgreementAttachment.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(8);
end;

procedure TSupplementaryAgreementAttachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

procedure TSupplementaryAgreementAttachment.SetNeedReceipt(AValue: Boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(13);
end;

procedure TSupplementaryAgreementAttachment.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(9);
end;

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

procedure TServiceDetailsAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TServiceDetailsAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(9);
end;

procedure TServiceDetailsAttachment.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(7);
end;

procedure TServiceDetailsAttachment.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(8);
end;

procedure TServiceDetailsAttachment.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

procedure TServiceDetailsAttachment.SetNeedReceipt(AValue: boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(10);
end;

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

procedure TDocumentAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TDocumentAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(9);
end;

procedure TDocumentAttachment.SetEditingSettingId(AValue: string);
begin
  if FEditingSettingId=AValue then Exit;
  FEditingSettingId:=AValue;
  Modified(18);
end;

procedure TDocumentAttachment.SetFunctionType(AValue: string);
begin
  if FFunctionType=AValue then Exit;
  FFunctionType:=AValue;
  Modified(13);
end;

procedure TDocumentAttachment.SetIsEncrypted(AValue: Boolean);
begin
  if FIsEncrypted=AValue then Exit;
  FIsEncrypted:=AValue;
  Modified(17);
end;

procedure TDocumentAttachment.SetNeedReceipt(AValue: boolean);
begin
  if FNeedReceipt=AValue then Exit;
  FNeedReceipt:=AValue;
  Modified(10);
end;

procedure TDocumentAttachment.SetNeedRecipientSignature(AValue: Boolean);
begin
  if FNeedRecipientSignature=AValue then Exit;
  FNeedRecipientSignature:=AValue;
  Modified(4);
end;

procedure TDocumentAttachment.SetTypeNamedId(AValue: string);
begin
  if FTypeNamedId=AValue then Exit;
  FTypeNamedId:=AValue;
  Modified(12);
end;

procedure TDocumentAttachment.SetVersion(AValue: string);
begin
  if FVersion=AValue then Exit;
  FVersion:=AValue;
  Modified(14);
end;

procedure TDocumentAttachment.SetWorkflowId(AValue: int32);
begin
  if FWorkflowId=AValue then Exit;
  FWorkflowId:=AValue;
  Modified(16);
end;

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
  RegisterProp('EditingSettingId', 18);
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

procedure TMessagePatchToPost.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

procedure TMessagePatchToPost.SetMessageId(AValue: string);
begin
  if FMessageId=AValue then Exit;
  FMessageId:=AValue;
  Modified(2);
end;

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

procedure TSignatureVerification.SetErrorMessage(AValue: string);
begin
  if FErrorMessage=AValue then Exit;
  FErrorMessage:=AValue;
  Modified(3);
end;

procedure TSignatureVerification.SetInitialDocumentId(AValue: string);
begin
  if FInitialDocumentId=AValue then Exit;
  FInitialDocumentId:=AValue;
  Modified(1);
end;

procedure TSignatureVerification.SetIsValid(AValue: Boolean);
begin
  FIsValid:=AValue;
  Modified(2);
end;

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

procedure TResolutionRouteAssignment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TResolutionRouteAssignment.SetInitialDocumentId(AValue: string);
begin
  if FInitialDocumentId=AValue then Exit;
  FInitialDocumentId:=AValue;
  Modified(1);
end;

procedure TResolutionRouteAssignment.SetRouteId(AValue: string);
begin
  if FRouteId=AValue then Exit;
  FRouteId:=AValue;
  Modified(2);
end;

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

procedure TReceiptAttachment.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

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

procedure TCorrectionRequestAttachment.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

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

procedure TRequestedSignatureRejection.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

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

procedure TDocumentSenderSignature.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

procedure TDocumentSenderSignature.SetPatchedContentId(AValue: String);
begin
  if FPatchedContentId=AValue then Exit;
  FPatchedContentId:=AValue;
  Modified(5);
end;

procedure TDocumentSenderSignature.SetSignature(AValue: TBytes);
begin
  if FSignature=AValue then Exit;
  FSignature:=AValue;
  Modified(1);
end;

procedure TDocumentSenderSignature.SetSignWithTestSignature(AValue: Boolean);
begin
  FSignWithTestSignature:=AValue;
  Modified(4);
end;

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

procedure TDraftToSend.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

procedure TDraftToSend.SetDraftId(AValue: string);
begin
  if FDraftId=AValue then Exit;
  FDraftId:=AValue;
  Modified(2);
end;

procedure TDraftToSend.SetProxyBoxId(AValue: string);
begin
  if FProxyBoxId=AValue then Exit;
  FProxyBoxId:=AValue;
  Modified(6);
end;

procedure TDraftToSend.SetProxyDepartmentId(AValue: string);
begin
  if FProxyDepartmentId=AValue then Exit;
  FProxyDepartmentId:=AValue;
  Modified(7);
end;

procedure TDraftToSend.SetToBoxId(AValue: string);
begin
  if FToBoxId=AValue then Exit;
  FToBoxId:=AValue;
  Modified(3);
end;

procedure TDraftToSend.SetToDepartmentId(AValue: string);
begin
  if FToDepartmentId=AValue then Exit;
  FToDepartmentId:=AValue;
  Modified(4);
end;

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

procedure TPrepareDocumentsToSignRequest.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

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

procedure TDraftDocumentToPatch.SetToBoxId(AValue: string);
begin
  if FToBoxId=AValue then Exit;
  FToBoxId:=AValue;
  Modified(2);
end;

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

procedure TContentToPatch.SetContent(AValue: TUnsignedContent);
begin
  if FContent=AValue then Exit;
  FContent:=AValue;
  Modified(4);
end;

procedure TContentToPatch.SetFunctionType(AValue: string);
begin
  if FFunctionType=AValue then Exit;
  FFunctionType:=AValue;
  Modified(2);
end;

procedure TContentToPatch.SetToBoxId(AValue: string);
begin
  if FToBoxId=AValue then Exit;
  FToBoxId:=AValue;
  Modified(5);
end;

procedure TContentToPatch.SetTypeNamedId(AValue: string);
begin
  if FTypeNamedId=AValue then Exit;
  FTypeNamedId:=AValue;
  Modified(1);
end;

procedure TContentToPatch.SetVersion(AValue: string);
begin
  if FVersion=AValue then Exit;
  FVersion:=AValue;
  Modified(3);
end;

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

procedure TDocumentPatchedContent.SetContent(AValue: TBytes);
begin
  if FContent=AValue then Exit;
  FContent:=AValue;
  Modified(3);
end;

procedure TDocumentPatchedContent.SetPatchedContentId(AValue: string);
begin
  if FPatchedContentId=AValue then Exit;
  FPatchedContentId:=AValue;
  Modified(2);
end;

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

procedure TMessageToSend.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

procedure TMessageToSend.SetMessageId(AValue: String);
begin
  if FMessageId=AValue then Exit;
  FMessageId:=AValue;
  Modified(2);
end;

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

procedure TDocumentSignature.SetIsApprovementSignature(AValue: boolean);
begin
  FIsApprovementSignature:=AValue;
  Modified(5);
end;

procedure TDocumentSignature.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

procedure TDocumentSignature.SetPatchedContentId(AValue: string);
begin
  if FPatchedContentId=AValue then Exit;
  FPatchedContentId:=AValue;
  Modified(7);
end;

procedure TDocumentSignature.SetSignature(AValue: TBytes);
begin
  if FSignature=AValue then Exit;
  FSignature:=AValue;
  Modified(2);
end;

procedure TDocumentSignature.SetSignatureNameOnShelf(AValue: string);
begin
  if FSignatureNameOnShelf=AValue then Exit;
  FSignatureNameOnShelf:=AValue;
  Modified(6);
end;

procedure TDocumentSignature.SetSignWithTestSignature(AValue: boolean);
begin
  FSignWithTestSignature:=AValue;
  Modified(4);
end;

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

procedure TRevocationRequestAttachment.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

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

procedure TXmlSignatureRejectionAttachment.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

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

procedure TSignedContent.SetContent(AValue: TBytes);
begin
  if FContent=AValue then Exit;
  FContent:=AValue;
  Modified(1);
end;

procedure TSignedContent.SetNameOnShelf(AValue: string);
begin
  if FNameOnShelf=AValue then Exit;
  FNameOnShelf:=AValue;
  Modified(4);
end;

procedure TSignedContent.SetSignature(AValue: TBytes);
begin
  if FSignature=AValue then Exit;
  FSignature:=AValue;
  Modified(2);
end;

procedure TSignedContent.SetSignatureNameOnShelf(AValue: string);
begin
  if FSignatureNameOnShelf=AValue then Exit;
  FSignatureNameOnShelf:=AValue;
  Modified(6);
end;

procedure TSignedContent.SetSignWithTestSignature(AValue: Boolean);
begin
  if FSignWithTestSignature=AValue then Exit;
  FSignWithTestSignature:=AValue;
  Modified(5);
end;

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

procedure TSignedContent.LoadContent(S: TStream);
begin
  S.Position:=0;
  SetLength(FContent, S.Size);
  if S.Size > 0 then
    S.Read(FContent[0], S.Size);
  Modified(1);
end;

procedure TSignedContent.LoadContent(const AFileName: string);
var
  F: TFileStream;
begin
  F:=TFileStream.Create(AFileName, fmOpenRead);
  LoadContent(F);
  F.Free;
end;

procedure TSignedContent.LoadSignature(S: TStream);
begin
  S.Position:=0;
  SetLength(FSignature, S.Size);
  if S.Size > 0 then
    S.Read(FSignature[0], S.Size);
  Modified(2);
end;

procedure TSignedContent.LoadSignature(const AFileName: string);
var
  F: TFileStream;
begin
  F:=TFileStream.Create(AFileName, fmOpenRead);
  LoadSignature(F);
  F.Free;
end;

{ TRoamingNotificationToPost }

procedure TRoamingNotificationToPost.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

procedure TRoamingNotificationToPost.SetDescription(AValue: string);
begin
  if FDescription=AValue then Exit;
  FDescription:=AValue;
  Modified(4);
end;

procedure TRoamingNotificationToPost.SetEventId(AValue: string);
begin
  if FEventId=AValue then Exit;
  FEventId:=AValue;
  Modified(2);
end;

procedure TRoamingNotificationToPost.SetMessageId(AValue: string);
begin
  if FMessageId=AValue then Exit;
  FMessageId:=AValue;
  Modified(5);
end;

procedure TRoamingNotificationToPost.SetSuccess(AValue: Boolean);
begin
  if FSuccess=AValue then Exit;
  FSuccess:=AValue;
  Modified(3);
end;

procedure TRoamingNotificationToPost.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('EventId', 2, true);
  RegisterProp('Success', 3, true);
  RegisterProp('Description', 4);
  RegisterProp('MessageId', 5);
  RegisterProp('NotifiableEntityIds', 6);
end;

procedure TRoamingNotificationToPost.InternalInit;
begin
  inherited InternalInit;
  FNotifiableEntityIds:=TDocumentStrings.Create;
end;

destructor TRoamingNotificationToPost.Destroy;
begin
  FreeAndNil(FNotifiableEntityIds);
  inherited Destroy;
end;

{ TCustomDataPatch }

procedure TCustomDataPatch.SetKey(AValue: string);
begin
  if FKey=AValue then Exit;
  FKey:=AValue;
  Modified(3);
end;

procedure TCustomDataPatch.SetOperation(AValue: TCustomDataPatchOperation);
begin
  FOperation:=AValue;
  Modified(2);
end;

procedure TCustomDataPatch.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

procedure TCustomDataPatch.SetValue(AValue: string);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
  Modified(4);
end;

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

procedure TEditDocumentPacketCommand.SetDocumentId(AValue: string);
begin
  if FDocumentId=AValue then Exit;
  FDocumentId:=AValue;
  Modified(1);
end;

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

procedure TResolutionRouteRemoval.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TResolutionRouteRemoval.SetParentEntityId(AValue: string);
begin
  if FParentEntityId=AValue then Exit;
  FParentEntityId:=AValue;
  Modified(1);
end;

procedure TResolutionRouteRemoval.SetRouteId(AValue: string);
begin
  if FRouteId=AValue then Exit;
  FRouteId:=AValue;
  Modified(2);
end;

procedure TResolutionRouteRemoval.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentEntityId', 1, true);
  RegisterProp('RouteId', 2, true);
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

procedure TTemplateToPost.SetFromBoxId(AValue: string);
begin
  if FFromBoxId=AValue then Exit;
  FFromBoxId:=AValue;
  Modified(1);
end;

procedure TTemplateToPost.SetFromDepartmentId(AValue: string);
begin
  if FFromDepartmentId=AValue then Exit;
  FFromDepartmentId:=AValue;
  Modified(8);
end;

procedure TTemplateToPost.SetLockMode(AValue: TLockMode);
begin
  if FLockMode=AValue then Exit;
  FLockMode:=AValue;
  Modified(7);
end;

procedure TTemplateToPost.SetMessageFromBoxId(AValue: string);
begin
  if FMessageFromBoxId=AValue then Exit;
  FMessageFromBoxId:=AValue;
  Modified(3);
end;

procedure TTemplateToPost.SetMessageToBoxId(AValue: string);
begin
  if FMessageToBoxId=AValue then Exit;
  FMessageToBoxId:=AValue;
  Modified(4);
end;

procedure TTemplateToPost.SetMessageToDepartmentId(AValue: string);
begin
  if FMessageToDepartmentId=AValue then Exit;
  FMessageToDepartmentId:=AValue;
  Modified(5);
end;

procedure TTemplateToPost.SetToBoxId(AValue: string);
begin
  if FToBoxId=AValue then Exit;
  FToBoxId:=AValue;
  Modified(2);
end;

procedure TTemplateToPost.SetToDepartmentId(AValue: string);
begin
  if FToDepartmentId=AValue then Exit;
  FToDepartmentId:=AValue;
  Modified(9);
end;

procedure TTemplateToPost.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FromBoxId', 1, true);
  RegisterProp('ToBoxId', 2, true);
  RegisterProp('MessageFromBoxId', 3, true);
  RegisterProp('MessageToBoxId', 4, true);
  RegisterProp('MessageToDepartmentId', 5);
  RegisterProp('DocumentAttachments', 6);
  RegisterProp('LockMode', 7);
  RegisterProp('FromDepartmentId', 8);
  RegisterProp('ToDepartmentId', 9);
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

procedure TTemplateDocumentAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(2);
end;

procedure TTemplateDocumentAttachment.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(8);
end;

procedure TTemplateDocumentAttachment.SetEditingSettingId(AValue: string);
begin
  if FEditingSettingId=AValue then Exit;
  FEditingSettingId:=AValue;
  Modified(9);
end;

procedure TTemplateDocumentAttachment.SetFunctionType(AValue: string);
begin
  if FFunctionType=AValue then Exit;
  FFunctionType:=AValue;
  Modified(4);
end;

procedure TTemplateDocumentAttachment.SetNeedRecipientSignature(AValue: Boolean
  );
begin
  if FNeedRecipientSignature=AValue then Exit;
  FNeedRecipientSignature:=AValue;
  Modified(10);
end;

procedure TTemplateDocumentAttachment.SetRefusalDisabled(AValue: Boolean);
begin
  if FRefusalDisabled=AValue then Exit;
  FRefusalDisabled:=AValue;
  Modified(12);
end;

procedure TTemplateDocumentAttachment.SetTypeNamedId(AValue: string);
begin
  if FTypeNamedId=AValue then Exit;
  FTypeNamedId:=AValue;
  Modified(3);
end;

procedure TTemplateDocumentAttachment.SetVersion(AValue: string);
begin
  if FVersion=AValue then Exit;
  FVersion:=AValue;
  Modified(5);
end;

procedure TTemplateDocumentAttachment.SetWorkflowId(AValue: int32);
begin
  if FWorkflowId=AValue then Exit;
  FWorkflowId:=AValue;
  Modified(7);
end;

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
  RegisterProp('RefusalDisabled', 12);
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

{ TemplateRefusalAttachment }

procedure TTemplateRefusalAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentId', 1, true);
  RegisterProp('Comment', 2);
  RegisterProp('Labels', 3);
end;

procedure TTemplateRefusalAttachment.InternalInit;
begin
  inherited InternalInit;
  FLabels:= TDocumentStrings.Create;
end;

destructor TTemplateRefusalAttachment.Destroy;
begin
  FLabels.Free;
  inherited Destroy;
end;

procedure TTemplateRefusalAttachment.SetDocumentId(AValue:String);
begin
  FDocumentId:=AValue;
  Modified(1);
end;

procedure TTemplateRefusalAttachment.SetComment(AValue:String);
begin
  FComment:=AValue;
  Modified(2);
end;



{ TemplatePatchToPost }

procedure TTemplatePatchToPost.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Refusals', 1);
end;

procedure TTemplatePatchToPost.InternalInit;
begin
  inherited InternalInit;
  FRefusals:= TTemplateRefusalAttachments.Create;
end;

destructor TTemplatePatchToPost.Destroy;
begin
  FRefusals.Free;
  inherited Destroy;
end;

{ TUnsignedContent }

procedure TUnsignedContent.SetContent(AValue: TBytes);
begin
  if FContent=AValue then Exit;
  FContent:=AValue;
  Modified(1);
end;

procedure TUnsignedContent.SetNameOnShelf(AValue: string);
begin
  if FNameOnShelf=AValue then Exit;
  FNameOnShelf:=AValue;
  Modified(2);
end;

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

procedure TTemplateTransformationToPost.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

procedure TTemplateTransformationToPost.SetTemplateId(AValue: string);
begin
  if FTemplateId=AValue then Exit;
  FTemplateId:=AValue;
  Modified(2);
end;

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

procedure TDocumentTransformation.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(2);
end;

procedure TDocumentTransformation.SetDocumentId(AValue: string);
begin
  if FDocumentId=AValue then Exit;
  FDocumentId:=AValue;
  Modified(1);
end;

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

procedure TMetadataItem.SetKey(AValue: string);
begin
  if FKey=AValue then Exit;
  FKey:=AValue;
  Modified(1);
end;

procedure TMetadataItem.SetValue(AValue: string);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
  Modified(2);
end;

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

procedure TResolutionAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(3);
end;

procedure TResolutionAttachment.SetInitialDocumentId(AValue: string);
begin
  if FInitialDocumentId=AValue then Exit;
  FInitialDocumentId:=AValue;
  Modified(1);
end;

procedure TResolutionAttachment.SetResolutionType(AValue: TResolutionType);
begin
  FResolutionType:=AValue;
  Modified(2);
end;

procedure TResolutionAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialDocumentId', 1, true);
  RegisterProp('ResolutionType', 2, true);
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

procedure TResolutionRequestDenialAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(2);
end;

procedure TResolutionRequestDenialAttachment.SetInitialResolutionRequestId(
  AValue: string);
begin
  if FInitialResolutionRequestId=AValue then Exit;
  FInitialResolutionRequestId:=AValue;
  Modified(1);
end;

procedure TResolutionRequestDenialAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialResolutionRequestId', 1, true);
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

procedure TResolutionRequestDenialCancellationAttachment.SetInitialResolutionRequestDenialId
  (AValue: string);
begin
  if FInitialResolutionRequestDenialId=AValue then Exit;
  FInitialResolutionRequestDenialId:=AValue;
  Modified(1);
end;

procedure TResolutionRequestDenialCancellationAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialResolutionRequestDenialId', 1, true);
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

procedure TResolutionRequestCancellationAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(2);
end;

procedure TResolutionRequestCancellationAttachment.SetInitialResolutionRequestId
  (AValue: string);
begin
  if FInitialResolutionRequestId=AValue then Exit;
  FInitialResolutionRequestId:=AValue;
  Modified(1);
end;

procedure TResolutionRequestCancellationAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialResolutionRequestId', 1, true);
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

procedure TResolutionRequestAttachment.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(5);
end;

procedure TResolutionRequestAttachment.SetInitialDocumentId(AValue: string);
begin
  if FInitialDocumentId=AValue then Exit;
  FInitialDocumentId:=AValue;
  Modified(1);
end;

procedure TResolutionRequestAttachment.SetResType(AValue: TResolutionRequestType
  );
begin
  FResType:=AValue;
  Modified(2);
end;

procedure TResolutionRequestAttachment.SetTargetDepartmentId(AValue: string);
begin
  if FTargetDepartmentId=AValue then Exit;
  FTargetDepartmentId:=AValue;
  Modified(4);
end;

procedure TResolutionRequestAttachment.SetTargetUserId(AValue: string);
begin
  if FTargetUserId=AValue then Exit;
  FTargetUserId:=AValue;
  Modified(3);
end;

procedure TResolutionRequestAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialDocumentId', 1, true);
  RegisterProp('ResType', 2, true);
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

