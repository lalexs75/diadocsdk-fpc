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

unit DocumentInfoV3;

interface

uses Classes, SysUtils, types, protobuf_fpc, FullVersion, DiadocTypes_DocumentId,
  DiadocTypes_Timestamp, DiadocTypes_Document, DiadocTypes_LockMode, DiadocTypes_ForwardDocumentEvent,
  DiadocTypes_DocumentDirection, DiadocTypes_DiadocMessage_PostApi, DiadocTypes_CustomDataItem;

type

  TDocumentInfoV3 = class;
  TDocumentParticipants = class;
  TDocumentParticipant = class;
  TDocumentLinks = class;
  TPacketInfo = class;
  TDocumentLetterInfo = class;
  TDocumentDraftInfo = class;
  TDocumentTemplateInfo = class;
  TTemplateTransformationInfo = class;
  TTemplateRefusalInfo = class;

  { DocumentInfoV3 } 
  //message DocumentInfoV3
  //{
  //	required FullVersion FullVersion = 1;
  //	required Documents.MessageType MessageType = 2;
  //	required int32 WorkflowId = 3;
  //	required DocumentParticipants Participants = 4;
  //	required DocumentDirection DocumentDirection = 5;
  //	required string DepartmentId = 6;
  //	optional string CustomDocumentId = 7;
  //	repeated Events.MetadataItem Metadata = 8;
  //	repeated CustomDataItem CustomData = 9;
  //	required DocumentLinks DocumentLinks = 10;
  //	required PacketInfo PacketInfo = 11;
  //	required bool IsRead = 12;
  //	required bool IsDeleted = 13;
  //	required bool IsInvitation = 14;
  //	optional DocumentLetterInfo LetterInfo = 15;
  //	optional DocumentDraftInfo DraftInfo = 16;
  //	optional DocumentTemplateInfo TemplateInfo = 17;
  //	optional Documents.Origin Origin = 18;
  //}

  { TDocumentInfoV3 }

  TDocumentInfoV3 = class(TSerializationObject)
  private
    FFullVersion:TFullVersion;
    FMessageType:DiadocTypes_Document.TMessageType;
    FWorkflowId:Integer;
    FParticipants:TDocumentParticipants;
    FDocumentDirection:TDocumentDirection;
    FDepartmentId:String;
    FCustomDocumentId:String;
    FMetadata:TMetadataItems;
    FCustomData:TCustomDataItems;
    FDocumentLinks:TDocumentLinks;
    FPacketInfo:TPacketInfo;
    FIsRead:Boolean;
    FIsDeleted:Boolean;
    FIsInvitation:Boolean;
    FLetterInfo:TDocumentLetterInfo;
    FDraftInfo:TDocumentDraftInfo;
    FTemplateInfo:TDocumentTemplateInfo;
    FOrigin:DiadocTypes_Document.TOrigin;
    procedure SetMessageType(AValue: TMessageType);
    procedure SetWorkflowId(AValue:Integer);
    procedure SetDocumentDirection(AValue:TDocumentDirection);
    procedure SetDepartmentId(AValue:String);
    procedure SetCustomDocumentId(AValue:String);
    procedure SetIsRead(AValue:Boolean);
    procedure SetIsDeleted(AValue:Boolean);
    procedure SetIsInvitation(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FullVersion:TFullVersion read FFullVersion;
    property MessageType:TMessageType read FMessageType write SetMessageType; //2
    property WorkflowId:Integer read FWorkflowId write SetWorkflowId;
    property Participants:TDocumentParticipants read FParticipants;
    property DocumentDirection:TDocumentDirection read FDocumentDirection write SetDocumentDirection;
    property DepartmentId:String read FDepartmentId write SetDepartmentId;
    property CustomDocumentId:String read FCustomDocumentId write SetCustomDocumentId;
    property Metadata:TMetadataItems read FMetadata;
    property CustomData:TCustomDataItems read FCustomData;
    property DocumentLinks:TDocumentLinks read FDocumentLinks;
    property PacketInfo:TPacketInfo read FPacketInfo;
    property IsRead:Boolean read FIsRead write SetIsRead;
    property IsDeleted:Boolean read FIsDeleted write SetIsDeleted;
    property IsInvitation:Boolean read FIsInvitation write SetIsInvitation;
    property LetterInfo:TDocumentLetterInfo read FLetterInfo;
    property DraftInfo:TDocumentDraftInfo read FDraftInfo;
    property TemplateInfo:TDocumentTemplateInfo read FTemplateInfo;
    property Origin:TOrigin read FOrigin;
  end;
  TDocumentInfoV3s = specialize GSerializationObjectList<TDocumentInfoV3>;

  { DocumentParticipants } 
  //message DocumentParticipants
  //{
  //	required DocumentParticipant Sender = 1;
  //	optional DocumentParticipant Proxy = 2;
  //	optional DocumentParticipant Recipient = 3;
  //	required bool IsInternal = 4;
  //}
  TDocumentParticipants = class(TSerializationObject)
  private
    FSender:TDocumentParticipant;
    FProxy:TDocumentParticipant;
    FRecipient:TDocumentParticipant;
    FIsInternal:Boolean;
    procedure SetIsInternal(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Sender:TDocumentParticipant read FSender;
    property Proxy:TDocumentParticipant read FProxy;
    property Recipient:TDocumentParticipant read FRecipient;
    property IsInternal:Boolean read FIsInternal write SetIsInternal;
  end;
  TDocumentParticipantss = specialize GSerializationObjectList<TDocumentParticipants>;

  { DocumentParticipant } 
  //message DocumentParticipant
  //{
  //	required string BoxId = 1;
  //	optional string DepartmentId = 2;
  //}
  TDocumentParticipant = class(TSerializationObject)
  private
    FBoxId:String;
    FDepartmentId:String;
    procedure SetBoxId(AValue:String);
    procedure SetDepartmentId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:String read FBoxId write SetBoxId;
    property DepartmentId:String read FDepartmentId write SetDepartmentId;
  end;
  TDocumentParticipantList = specialize GSerializationObjectList<TDocumentParticipant>;

  { DocumentLinks } 
  //message DocumentLinks
  //{
  //	repeated DocumentId InitialIds = 1;
  //	repeated DocumentId SubordinateIds = 2;
  //}
  TDocumentLinks = class(TSerializationObject)
  private
    FInitialIds:TDocumentIds;
    FSubordinateIds:TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property InitialIds:TDocumentIds read FInitialIds;
    property SubordinateIds:TDocumentIds read FSubordinateIds;
  end;
  TDocumentLinkss = specialize GSerializationObjectList<TDocumentLinks>;

  { PacketInfo } 
  //message PacketInfo
  //{
  //	required LockMode LockMode = 1;
  //	optional string PacketId = 2;
  //	optional Timestamp AddedAt = 3;
  //}
  TPacketInfo = class(TSerializationObject)
  private
    FLockMode:TLockMode;
    FPacketId:String;
    FAddedAt:TTimestamp;
    procedure SetLockMode(AValue:TLockMode);
    procedure SetPacketId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property LockMode:TLockMode read FLockMode write SetLockMode;
    property PacketId:String read FPacketId write SetPacketId;
    property AddedAt:TTimestamp read FAddedAt;
  end;
  TPacketInfos = specialize GSerializationObjectList<TPacketInfo>;

  { DocumentLetterInfo } 
  //message DocumentLetterInfo
  //{
  //	required bool IsEncrypted = 1;
  //	repeated ForwardDocumentEvent ForwardDocumentEvents = 2;
  //	required bool IsTest = 3;
  //}
  TDocumentLetterInfo = class(TSerializationObject)
  private
    FIsEncrypted:Boolean;
    FForwardDocumentEvents:TForwardDocumentEvents;
    FIsTest:Boolean;
    procedure SetIsEncrypted(AValue:Boolean);
    procedure SetIsTest(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsEncrypted:Boolean read FIsEncrypted write SetIsEncrypted;
    property ForwardDocumentEvents:TForwardDocumentEvents read FForwardDocumentEvents;
    property IsTest:Boolean read FIsTest write SetIsTest;
  end;
  TDocumentLetterInfos = specialize GSerializationObjectList<TDocumentLetterInfo>;

  { DocumentDraftInfo } 
  //message DocumentDraftInfo
  //{
  //	required bool IsRecycled = 1;
  //	required bool IsLocked = 2;
  //	repeated string TransformedToLetterIds = 3;
  //}
  TDocumentDraftInfo = class(TSerializationObject)
  private
    FIsRecycled:Boolean;
    FIsLocked:Boolean;
    FTransformedToLetterIds:TDocumentStrings;
    procedure SetIsRecycled(AValue:Boolean);
    procedure SetIsLocked(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsRecycled:Boolean read FIsRecycled write SetIsRecycled;
    property IsLocked:Boolean read FIsLocked write SetIsLocked;
    property TransformedToLetterIds:TDocumentStrings read FTransformedToLetterIds;
  end;
  TDocumentDraftInfos = specialize GSerializationObjectList<TDocumentDraftInfo>;


  { TemplateTransformationInfo }
  //message TemplateTransformationInfo
  //{
  //	required string TransformationId = 1;
  //	optional DocumentId TransformedToDocumentId = 2;
  //	optional string AuthorUserId = 3;
  //}
  TTemplateTransformationInfo = class(TSerializationObject)
  private
    FTransformationId:String;
    FTransformedToDocumentId:TDocumentId;
    FAuthorUserId:String;
    procedure SetTransformationId(AValue:String);
    procedure SetAuthorUserId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TransformationId:String read FTransformationId write SetTransformationId;
    property TransformedToDocumentId:TDocumentId read FTransformedToDocumentId;
    property AuthorUserId:String read FAuthorUserId write SetAuthorUserId;
  end;
  TTemplateTransformationInfos = specialize GSerializationObjectList<TTemplateTransformationInfo>;

  { DocumentTemplateInfo } 
  //message DocumentTemplateInfo
  //{
  //	required DocumentParticipants LetterParticipants = 1;
  //	repeated string TransformedToLetterIds = 2;
  //	repeated TemplateTransformationInfo TemplateTransformationInfos = 3;
  //	optional TemplateRefusalInfo TemplateRefusalInfo = 4;
  //}
  TDocumentTemplateInfo = class(TSerializationObject)
  private
    FLetterParticipants:TDocumentParticipants;
    FTransformedToLetterIds:TDocumentStrings;
    FTemplateTransformationInfos:TTemplateTransformationInfos;
    FTemplateRefusalInfo:TTemplateRefusalInfo;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property LetterParticipants:TDocumentParticipants read FLetterParticipants;
    property TransformedToLetterIds:TDocumentStrings read FTransformedToLetterIds;
    property TemplateTransformationInfos:TTemplateTransformationInfos read FTemplateTransformationInfos;
    property TemplateRefusalInfo:TTemplateRefusalInfo read FTemplateRefusalInfo;
  end;
  TDocumentTemplateInfos = specialize GSerializationObjectList<TDocumentTemplateInfo>;

  { TemplateRefusalInfo }
  //message TemplateRefusalInfo
  //{
  //	required string BoxId = 1;
  //	optional string AuthorUserId = 2;
  //	optional string Comment = 3;
  //}
  TTemplateRefusalInfo = class(TSerializationObject)
  private
    FBoxId:String;
    FAuthorUserId:String;
    FComment:String;
    procedure SetBoxId(AValue:String);
    procedure SetAuthorUserId(AValue:String);
    procedure SetComment(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:String read FBoxId write SetBoxId;
    property AuthorUserId:String read FAuthorUserId write SetAuthorUserId;
    property Comment:String read FComment write SetComment;
  end;
  TTemplateRefusalInfos = specialize GSerializationObjectList<TTemplateRefusalInfo>;

implementation

  { DocumentInfoV3 } 

procedure TDocumentInfoV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FullVersion', 1, true);
  RegisterProp('MessageType', 2, true);
  RegisterProp('WorkflowId', 3, true);
  RegisterProp('Participants', 4, true);
  RegisterProp('DocumentDirection', 5, true);
  RegisterProp('DepartmentId', 6, true);
  RegisterProp('CustomDocumentId', 7);
  RegisterProp('Metadata', 8);
  RegisterProp('CustomData', 9);
  RegisterProp('DocumentLinks', 10, true);
  RegisterProp('PacketInfo', 11, true);
  RegisterProp('IsRead', 12, true);
  RegisterProp('IsDeleted', 13, true);
  RegisterProp('IsInvitation', 14, true);
  RegisterProp('LetterInfo', 15);
  RegisterProp('DraftInfo', 16);
  RegisterProp('TemplateInfo', 17);
  RegisterProp('Origin', 18);
end;

procedure TDocumentInfoV3.InternalInit;
begin
  inherited InternalInit;
  FFullVersion:= TFullVersion.Create;
  //FMessageType:= TMessageType.Create;
  FParticipants:= TDocumentParticipants.Create;
  FMetadata:= TMetadataItems.Create;
  FCustomData:= TCustomDataItems.Create;
  FDocumentLinks:= TDocumentLinks.Create;
  FPacketInfo:= TPacketInfo.Create;
  FLetterInfo:= TDocumentLetterInfo.Create;
  FDraftInfo:= TDocumentDraftInfo.Create;
  FTemplateInfo:= TDocumentTemplateInfo.Create;
  FOrigin:= TOrigin.Create;
end;

destructor TDocumentInfoV3.Destroy;
begin
  FFullVersion.Free;
  FParticipants.Free;
  FMetadata.Free;
  FCustomData.Free;
  FDocumentLinks.Free;
  FPacketInfo.Free;
  FLetterInfo.Free;
  FDraftInfo.Free;
  FTemplateInfo.Free;
  FOrigin.Free;
  inherited Destroy;
end;

procedure TDocumentInfoV3.SetWorkflowId(AValue:Integer);
begin
  FWorkflowId:=AValue;
  Modified(3);
end;

procedure TDocumentInfoV3.SetMessageType(AValue: TMessageType);
begin
  if FMessageType=AValue then Exit;
  FMessageType:=AValue;
  Modified(2);
end;

procedure TDocumentInfoV3.SetDocumentDirection(AValue:TDocumentDirection);
begin
  FDocumentDirection:=AValue;
  Modified(5);
end;

procedure TDocumentInfoV3.SetDepartmentId(AValue:String);
begin
  FDepartmentId:=AValue;
  Modified(6);
end;

procedure TDocumentInfoV3.SetCustomDocumentId(AValue:String);
begin
  FCustomDocumentId:=AValue;
  Modified(7);
end;

procedure TDocumentInfoV3.SetIsRead(AValue:Boolean);
begin
  FIsRead:=AValue;
  Modified(12);
end;

procedure TDocumentInfoV3.SetIsDeleted(AValue:Boolean);
begin
  FIsDeleted:=AValue;
  Modified(13);
end;

procedure TDocumentInfoV3.SetIsInvitation(AValue:Boolean);
begin
  FIsInvitation:=AValue;
  Modified(14);
end;


  { DocumentParticipants } 

procedure TDocumentParticipants.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Sender', 1, true);
  RegisterProp('Proxy', 2);
  RegisterProp('Recipient', 3);
  RegisterProp('IsInternal', 4, true);
end;

procedure TDocumentParticipants.InternalInit;
begin
  inherited InternalInit;
  FSender:= TDocumentParticipant.Create;
  FProxy:= TDocumentParticipant.Create;
  FRecipient:= TDocumentParticipant.Create;
end;

destructor TDocumentParticipants.Destroy;
begin
  FSender.Free;
  FProxy.Free;
  FRecipient.Free;
  inherited Destroy;
end;

procedure TDocumentParticipants.SetIsInternal(AValue:Boolean);
begin
  FIsInternal:=AValue;
  Modified(4);
end;


  { DocumentParticipant } 

procedure TDocumentParticipant.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('DepartmentId', 2);
end;

procedure TDocumentParticipant.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDocumentParticipant.Destroy;
begin
  inherited Destroy;
end;

procedure TDocumentParticipant.SetBoxId(AValue:String);
begin
  FBoxId:=AValue;
  Modified(1);
end;

procedure TDocumentParticipant.SetDepartmentId(AValue:String);
begin
  FDepartmentId:=AValue;
  Modified(2);
end;


  { DocumentLinks } 

procedure TDocumentLinks.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InitialIds', 1);
  RegisterProp('SubordinateIds', 2);
end;

procedure TDocumentLinks.InternalInit;
begin
  inherited InternalInit;
  FInitialIds:= TDocumentIds.Create;
  FSubordinateIds:= TDocumentIds.Create;
end;

destructor TDocumentLinks.Destroy;
begin
  FInitialIds.Free;
  FSubordinateIds.Free;
  inherited Destroy;
end;


  { PacketInfo } 

procedure TPacketInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('LockMode', 1, true);
  RegisterProp('PacketId', 2);
  RegisterProp('AddedAt', 3);
end;

procedure TPacketInfo.InternalInit;
begin
  inherited InternalInit;
  FAddedAt:= TTimestamp.Create;
end;

destructor TPacketInfo.Destroy;
begin
  FAddedAt.Free;
  inherited Destroy;
end;

procedure TPacketInfo.SetLockMode(AValue:TLockMode);
begin
  FLockMode:=AValue;
  Modified(1);
end;

procedure TPacketInfo.SetPacketId(AValue:String);
begin
  FPacketId:=AValue;
  Modified(2);
end;


  { DocumentLetterInfo } 

procedure TDocumentLetterInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsEncrypted', 1, true);
  RegisterProp('ForwardDocumentEvents', 2);
  RegisterProp('IsTest', 3, true);
end;

procedure TDocumentLetterInfo.InternalInit;
begin
  inherited InternalInit;
  FForwardDocumentEvents:= TForwardDocumentEvents.Create;
end;

destructor TDocumentLetterInfo.Destroy;
begin
  FForwardDocumentEvents.Free;
  inherited Destroy;
end;

procedure TDocumentLetterInfo.SetIsEncrypted(AValue:Boolean);
begin
  FIsEncrypted:=AValue;
  Modified(1);
end;

procedure TDocumentLetterInfo.SetIsTest(AValue:Boolean);
begin
  FIsTest:=AValue;
  Modified(3);
end;


  { DocumentDraftInfo } 

procedure TDocumentDraftInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsRecycled', 1, true);
  RegisterProp('IsLocked', 2, true);
  RegisterProp('TransformedToLetterIds', 3);
end;

procedure TDocumentDraftInfo.InternalInit;
begin
  inherited InternalInit;
  FTransformedToLetterIds:= TDocumentStrings.Create;
end;

destructor TDocumentDraftInfo.Destroy;
begin
  FTransformedToLetterIds.Free;
  inherited Destroy;
end;

procedure TDocumentDraftInfo.SetIsRecycled(AValue:Boolean);
begin
  FIsRecycled:=AValue;
  Modified(1);
end;

procedure TDocumentDraftInfo.SetIsLocked(AValue:Boolean);
begin
  FIsLocked:=AValue;
  Modified(2);
end;


  { DocumentTemplateInfo } 

procedure TDocumentTemplateInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('LetterParticipants', 1, true);
  RegisterProp('TransformedToLetterIds', 2);
  RegisterProp('TemplateTransformationInfos', 3);
  RegisterProp('TemplateRefusalInfo', 4);
end;

procedure TDocumentTemplateInfo.InternalInit;
begin
  inherited InternalInit;
  FLetterParticipants:= TDocumentParticipants.Create;
  FTransformedToLetterIds:= TDocumentStrings.Create;
  FTemplateTransformationInfos:= TTemplateTransformationInfos.Create;
  FTemplateRefusalInfo:= TTemplateRefusalInfo.Create;
end;

destructor TDocumentTemplateInfo.Destroy;
begin
  FLetterParticipants.Free;
  FTransformedToLetterIds.Free;
  FTemplateTransformationInfos.Free;
  FTemplateRefusalInfo.Free;
  inherited Destroy;
end;


  { TemplateTransformationInfo } 

procedure TTemplateTransformationInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TransformationId', 1, true);
  RegisterProp('TransformedToDocumentId', 2);
  RegisterProp('AuthorUserId', 3);
end;

procedure TTemplateTransformationInfo.InternalInit;
begin
  inherited InternalInit;
  FTransformedToDocumentId:= TDocumentId.Create;
end;

destructor TTemplateTransformationInfo.Destroy;
begin
  FTransformedToDocumentId.Free;
  inherited Destroy;
end;

procedure TTemplateTransformationInfo.SetTransformationId(AValue:String);
begin
  FTransformationId:=AValue;
  Modified(1);
end;

procedure TTemplateTransformationInfo.SetAuthorUserId(AValue:String);
begin
  FAuthorUserId:=AValue;
  Modified(3);
end;


  { TemplateRefusalInfo } 

procedure TTemplateRefusalInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('AuthorUserId', 2);
  RegisterProp('Comment', 3);
end;

procedure TTemplateRefusalInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TTemplateRefusalInfo.Destroy;
begin
  inherited Destroy;
end;

procedure TTemplateRefusalInfo.SetBoxId(AValue:String);
begin
  FBoxId:=AValue;
  Modified(1);
end;

procedure TTemplateRefusalInfo.SetAuthorUserId(AValue:String);
begin
  FAuthorUserId:=AValue;
  Modified(2);
end;

procedure TTemplateRefusalInfo.SetComment(AValue:String);
begin
  FComment:=AValue;
  Modified(3);
end;

end.
