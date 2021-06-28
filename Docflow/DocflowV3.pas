{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2021 Lagunov Aleksey alexs75@yandex.ru

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

unit DocflowV3;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_Timestamp, DiadocTypes_Document, AttachmentV3, RoamingNotification, ResolutionDocflowV3, OuterDocflowStatus, DocflowStatusV3;

type

  TDocflowV3 = class;
  TDocflowV3s = specialize GSerializationObjectList<TDocflowV3>;
  TSenderTitleDocflow = class;
  TSenderTitleDocflows = specialize GSerializationObjectList<TSenderTitleDocflow>;
  TConfirmationDocflow = class;
  TConfirmationDocflows = specialize GSerializationObjectList<TConfirmationDocflow>;
  TSignatureRejectionDocflow = class;
  TSignatureRejectionDocflows = specialize GSerializationObjectList<TSignatureRejectionDocflow>;
  TParticipantResponseDocflow = class;
  TParticipantResponseDocflows = specialize GSerializationObjectList<TParticipantResponseDocflow>;
  TAmendmentRequestDocflow = class;
  TAmendmentRequestDocflows = specialize GSerializationObjectList<TAmendmentRequestDocflow>;
  TRevocationDocflowV3 = class;
  TRevocationDocflowV3s = specialize GSerializationObjectList<TRevocationDocflowV3>;
  TRevocationRequestDocflow = class;
  TRevocationRequestDocflows = specialize GSerializationObjectList<TRevocationRequestDocflow>;
  TRevocationResponseDocflow = class;
  TRevocationResponseDocflows = specialize GSerializationObjectList<TRevocationResponseDocflow>;
  TReceiptDocflowV3 = class;
  TReceiptDocflowV3s = specialize GSerializationObjectList<TReceiptDocflowV3>;
  TOuterDocflow = class;
  TOuterDocflows = specialize GSerializationObjectList<TOuterDocflow>;
  TOuterDocflowEntities = class;
  TOuterDocflowEntitiess = specialize GSerializationObjectList<TOuterDocflowEntities>;
  TStatusEntity = class;
  TStatusEntitys = specialize GSerializationObjectList<TStatusEntity>;

  { DocflowV3 } 
  //message DocflowV3
  //{
  //	required SenderTitleDocflow SenderTitle = 1;
  //	optional ConfirmationDocflow Confirmation = 2;
  //	optional ParticipantResponseDocflow ProxyResponse = 11;
  //	optional ReceiptDocflowV3 RecipientReceipt = 4;
  //	optional ParticipantResponseDocflow RecipientResponse = 5;
  //	optional AmendmentRequestDocflow AmendmentRequest = 6;
  //	optional RevocationDocflowV3 Revocation = 7;
  //	optional ReceiptDocflowV3 SenderReceipt = 8;
  //	optional ResolutionDocflowV3 Resolution = 9;
  //	optional ResolutionEntitiesV3 ResolutionEntities = 10;
  //	repeated OuterDocflow OuterDocflows = 12;
  //	repeated OuterDocflowEntities OuterDocflowEntities = 13;
  //	required DocflowStatusV3 DocflowStatus = 14;
  //}
  TDocflowV3 = class(TSerializationObject)
  private
    FSenderTitle:TSenderTitleDocflow;
    FConfirmation:TConfirmationDocflow;
    FProxyResponse:TParticipantResponseDocflow;
    FRecipientReceipt:TReceiptDocflowV3;
    FRecipientResponse:TParticipantResponseDocflow;
    FAmendmentRequest:TAmendmentRequestDocflow;
    FRevocation:TRevocationDocflowV3;
    FSenderReceipt:TReceiptDocflowV3;
    FResolution:TResolutionDocflowV3;
    FResolutionEntities:TResolutionEntitiesV3;
    FOuterDocflows:TOuterDocflows;
    FOuterDocflowEntities:TOuterDocflowEntitiess;
    FDocflowStatus:TDocflowStatusV3;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SenderTitle:TSenderTitleDocflow read FSenderTitle;
    property Confirmation:TConfirmationDocflow read FConfirmation;
    property ProxyResponse:TParticipantResponseDocflow read FProxyResponse;
    property RecipientReceipt:TReceiptDocflowV3 read FRecipientReceipt;
    property RecipientResponse:TParticipantResponseDocflow read FRecipientResponse;
    property AmendmentRequest:TAmendmentRequestDocflow read FAmendmentRequest;
    property Revocation:TRevocationDocflowV3 read FRevocation;
    property SenderReceipt:TReceiptDocflowV3 read FSenderReceipt;
    property Resolution:TResolutionDocflowV3 read FResolution;
    property ResolutionEntities:TResolutionEntitiesV3 read FResolutionEntities;
    property OuterDocflows:TOuterDocflows read FOuterDocflows;
    property OuterDocflowEntities:TOuterDocflowEntitiess read FOuterDocflowEntities;
    property DocflowStatus:TDocflowStatusV3 read FDocflowStatus;
  end;

  { SenderTitleDocflow } 
  //message SenderTitleDocflow
  //{
  //	required bool IsFinished = 1;
  //	required SignedAttachmentV3 Attachment = 2;
  //	optional Timestamp SentAt = 3;
  //	optional Timestamp DeliveredAt = 4;
  //	optional RoamingNotification RoamingNotification = 5;
  //	required Documents.SenderSignatureStatus SenderSignatureStatus = 6;
  //}
  TSenderTitleDocflow = class(TSerializationObject)
  private
    FIsFinished:Boolean;
    FAttachment:TSignedAttachmentV3;
    FSentAt:TTimestamp;
    FDeliveredAt:TTimestamp;
    FRoamingNotification:TRoamingNotification;
    FSenderSignatureStatus:DiadocTypes_Document.TSenderSignatureStatus;
    procedure SetIsFinished(AValue:Boolean);
    procedure SetSenderSignatureStatus(AValue:DiadocTypes_Document.TSenderSignatureStatus);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished;
    property Attachment:TSignedAttachmentV3 read FAttachment;
    property SentAt:TTimestamp read FSentAt;
    property DeliveredAt:TTimestamp read FDeliveredAt;
    property RoamingNotification:TRoamingNotification read FRoamingNotification;
    property SenderSignatureStatus:DiadocTypes_Document.TSenderSignatureStatus read FSenderSignatureStatus write SetSenderSignatureStatus;
  end;

  { ConfirmationDocflow } 
  //message ConfirmationDocflow
  //{
  //	required bool IsFinished = 1;
  //	optional SignedAttachmentV3 ConfirmationAttachment = 2;
  //	optional Timestamp ConfirmedAt = 3;
  //	optional ReceiptDocflowV3 Receipt = 4;
  //}
  TConfirmationDocflow = class(TSerializationObject)
  private
    FIsFinished:Boolean;
    FConfirmationAttachment:TSignedAttachmentV3;
    FConfirmedAt:TTimestamp;
    FReceipt:TReceiptDocflowV3;
    procedure SetIsFinished(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished;
    property ConfirmationAttachment:TSignedAttachmentV3 read FConfirmationAttachment;
    property ConfirmedAt:TTimestamp read FConfirmedAt;
    property Receipt:TReceiptDocflowV3 read FReceipt;
  end;

  { SignatureRejectionDocflow } 
  //message SignatureRejectionDocflow
  //{
  //	required SignedAttachmentV3 SignatureRejection = 1;
  //	required bool IsFormal = 2;
  //	optional Timestamp DeliveredAt = 3;
  //	optional string PlainText = 4;
  //}
  TSignatureRejectionDocflow = class(TSerializationObject)
  private
    FSignatureRejection:TSignedAttachmentV3;
    FIsFormal:Boolean;
    FDeliveredAt:TTimestamp;
    FPlainText:String;
    procedure SetIsFormal(AValue:Boolean);
    procedure SetPlainText(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignatureRejection:TSignedAttachmentV3 read FSignatureRejection;
    property IsFormal:Boolean read FIsFormal write SetIsFormal;
    property DeliveredAt:TTimestamp read FDeliveredAt;
    property PlainText:String read FPlainText write SetPlainText;
  end;

  { ParticipantResponseDocflow } 
  //message ParticipantResponseDocflow
  //{
  //	required bool IsFinished = 1;
  //	optional SignatureV3 Signature = 2;
  //	optional SignedAttachmentV3 Title = 3;
  //	optional SignatureRejectionDocflow Rejection = 4;
  //	optional Timestamp SentAt = 5;
  //	optional Timestamp DeliveredAt = 6;
  //	required Documents.RecipientResponseStatus ResponseStatus = 7;
  //}
  TParticipantResponseDocflow = class(TSerializationObject)
  private
    FIsFinished:Boolean;
    FSignature:TSignatureV3;
    FTitle:TSignedAttachmentV3;
    FRejection:TSignatureRejectionDocflow;
    FSentAt:TTimestamp;
    FDeliveredAt:TTimestamp;
    FResponseStatus:DiadocTypes_Document.TRecipientResponseStatus;
    procedure SetIsFinished(AValue:Boolean);
    procedure SetResponseStatus(AValue:DiadocTypes_Document.TRecipientResponseStatus);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished;
    property Signature:TSignatureV3 read FSignature;
    property Title:TSignedAttachmentV3 read FTitle;
    property Rejection:TSignatureRejectionDocflow read FRejection;
    property SentAt:TTimestamp read FSentAt;
    property DeliveredAt:TTimestamp read FDeliveredAt;
    property ResponseStatus:DiadocTypes_Document.TRecipientResponseStatus read FResponseStatus write SetResponseStatus;
  end;

  { AmendmentRequestDocflow } 
  //message AmendmentRequestDocflow
  //{
  //	required bool IsFinished = 1;
  //	optional SignedAttachmentV3 AmendmentRequest = 2;
  //	optional Timestamp SentAt = 3;
  //	optional Timestamp DeliveredAt = 4;
  //	optional ReceiptDocflowV3 Receipt = 5;
  //	required int32 AmendmentFlags = 6;
  //	optional string PlainText = 7;
  //	optional ConfirmationDocflow ConfirmationDocflow = 8;
  //}
  TAmendmentRequestDocflow = class(TSerializationObject)
  private
    FIsFinished:Boolean;
    FAmendmentRequest:TSignedAttachmentV3;
    FSentAt:TTimestamp;
    FDeliveredAt:TTimestamp;
    FReceipt:TReceiptDocflowV3;
    FAmendmentFlags:Integer;
    FPlainText:String;
    FConfirmationDocflow:TConfirmationDocflow;
    procedure SetIsFinished(AValue:Boolean);
    procedure SetAmendmentFlags(AValue:Integer);
    procedure SetPlainText(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished;
    property AmendmentRequest:TSignedAttachmentV3 read FAmendmentRequest;
    property SentAt:TTimestamp read FSentAt;
    property DeliveredAt:TTimestamp read FDeliveredAt;
    property Receipt:TReceiptDocflowV3 read FReceipt;
    property AmendmentFlags:Integer read FAmendmentFlags write SetAmendmentFlags;
    property PlainText:String read FPlainText write SetPlainText;
    property ConfirmationDocflow:TConfirmationDocflow read FConfirmationDocflow;
  end;

  { RevocationDocflowV3 } 
  //message RevocationDocflowV3
  //{
  //	required bool IsFinished = 1;
  //	required RevocationRequestDocflow RevocationRequest = 2;
  //	optional RevocationResponseDocflow RevocationResponse = 3;
  //	required string InitiatorBoxId = 4;
  //	required Documents.RevocationStatus RevocationStatus = 5;
  //	optional ResolutionEntitiesV3 ResolutionEntities = 6;
  //	repeated OuterDocflowEntities OuterDocflowEntities  = 7;
  //}
  TRevocationDocflowV3 = class(TSerializationObject)
  private
    FIsFinished:Boolean;
    FRevocationRequest:TRevocationRequestDocflow;
    FRevocationResponse:TRevocationResponseDocflow;
    FInitiatorBoxId:String;
    FRevocationStatus:DiadocTypes_Document.TRevocationStatus;
    FResolutionEntities:TResolutionEntitiesV3;
    FOuterDocflowEntities:TOuterDocflowEntitiess;
    procedure SetIsFinished(AValue:Boolean);
    procedure SetInitiatorBoxId(AValue:String);
    procedure SetRevocationStatus(AValue:DiadocTypes_Document.TRevocationStatus);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished;
    property RevocationRequest:TRevocationRequestDocflow read FRevocationRequest;
    property RevocationResponse:TRevocationResponseDocflow read FRevocationResponse;
    property InitiatorBoxId:String read FInitiatorBoxId write SetInitiatorBoxId;
    property RevocationStatus:DiadocTypes_Document.TRevocationStatus read FRevocationStatus write SetRevocationStatus;
    property ResolutionEntities:TResolutionEntitiesV3 read FResolutionEntities;
    property OuterDocflowEntities:TOuterDocflowEntitiess read FOuterDocflowEntities;
  end;

  { RevocationRequestDocflow } 
  //message RevocationRequestDocflow
  //{
  //	required SignedAttachmentV3 RevocationRequest = 1;
  //	optional Timestamp SentAt = 2;
  //	optional Timestamp DeliveredAt = 3;
  //	optional RoamingNotification RoamingNotification = 4;
  //	optional string PlainText = 5;
  //}
  TRevocationRequestDocflow = class(TSerializationObject)
  private
    FRevocationRequest:TSignedAttachmentV3;
    FSentAt:TTimestamp;
    FDeliveredAt:TTimestamp;
    FRoamingNotification:TRoamingNotification;
    FPlainText:String;
    procedure SetPlainText(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property RevocationRequest:TSignedAttachmentV3 read FRevocationRequest;
    property SentAt:TTimestamp read FSentAt;
    property DeliveredAt:TTimestamp read FDeliveredAt;
    property RoamingNotification:TRoamingNotification read FRoamingNotification;
    property PlainText:String read FPlainText write SetPlainText;
  end;

  { RevocationResponseDocflow } 
  //message RevocationResponseDocflow
  //{
  //	optional SignatureV3 RecipientSignature = 1;
  //	optional SignatureRejectionDocflow SignatureRejection = 2;
  //}
  TRevocationResponseDocflow = class(TSerializationObject)
  private
    FRecipientSignature:TSignatureV3;
    FSignatureRejection:TSignatureRejectionDocflow;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property RecipientSignature:TSignatureV3 read FRecipientSignature;
    property SignatureRejection:TSignatureRejectionDocflow read FSignatureRejection;
  end;

  { ReceiptDocflowV3 } 
  //message ReceiptDocflowV3
  //{
  //	required bool IsFinished = 1;
  //	optional SignedAttachmentV3 ReceiptAttachment = 2;
  //	optional Timestamp SentAt = 3;
  //	optional Timestamp DeliveredAt = 4;
  //	optional ConfirmationDocflow Confirmation = 5;
  //	required Documents.GeneralReceiptStatus Status = 6;
  //}
  TReceiptDocflowV3 = class(TSerializationObject)
  private
    FIsFinished:Boolean;
    FReceiptAttachment:TSignedAttachmentV3;
    FSentAt:TTimestamp;
    FDeliveredAt:TTimestamp;
    FConfirmation:TConfirmationDocflow;
    FStatus:DiadocTypes_Document.TGeneralReceiptStatus;
    procedure SetIsFinished(AValue:Boolean);
    procedure SetStatus(AValue:DiadocTypes_Document.TGeneralReceiptStatus);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished;
    property ReceiptAttachment:TSignedAttachmentV3 read FReceiptAttachment;
    property SentAt:TTimestamp read FSentAt;
    property DeliveredAt:TTimestamp read FDeliveredAt;
    property Confirmation:TConfirmationDocflow read FConfirmation;
    property Status:DiadocTypes_Document.TGeneralReceiptStatus read FStatus write SetStatus;
  end;

  { OuterDocflow } 
  //message OuterDocflow
  //{
  //	required string DocflowNamedId = 1;
  //	required string ParentEntityId = 2;
  //	required string OuterDocflowEntityId = 3;
  //}
  TOuterDocflow = class(TSerializationObject)
  private
    FDocflowNamedId:String;
    FParentEntityId:String;
    FOuterDocflowEntityId:String;
    procedure SetDocflowNamedId(AValue:String);
    procedure SetParentEntityId(AValue:String);
    procedure SetOuterDocflowEntityId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocflowNamedId:String read FDocflowNamedId write SetDocflowNamedId;
    property ParentEntityId:String read FParentEntityId write SetParentEntityId;
    property OuterDocflowEntityId:String read FOuterDocflowEntityId write SetOuterDocflowEntityId;
  end;

  { OuterDocflowEntities } 
  //message OuterDocflowEntities
  //{
  //	required string DocflowNamedId = 1;
  //	required string DocflowFriendlyName = 2;
  //	repeated StatusEntity StatusEntities = 3;
  //}
  TOuterDocflowEntities = class(TSerializationObject)
  private
    FDocflowNamedId:String;
    FDocflowFriendlyName:String;
    FStatusEntities:TStatusEntitys;
    procedure SetDocflowNamedId(AValue:String);
    procedure SetDocflowFriendlyName(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocflowNamedId:String read FDocflowNamedId write SetDocflowNamedId;
    property DocflowFriendlyName:String read FDocflowFriendlyName write SetDocflowFriendlyName;
    property StatusEntities:TStatusEntitys read FStatusEntities;
  end;

  { StatusEntity } 
  //message StatusEntity
  //{
  //	required SignedAttachmentV3 Attachment = 1;
  //	required Status Status = 2;
  //}
  TStatusEntity = class(TSerializationObject)
  private
    FAttachment:TSignedAttachmentV3;
    FStatus:TStatus;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Attachment:TSignedAttachmentV3 read FAttachment;
    property Status:TStatus read FStatus;
  end;

implementation

  { DocflowV3 } 

procedure TDocflowV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SenderTitle', 1, true);
  RegisterProp('Confirmation', 2);
  RegisterProp('ProxyResponse', 11);
  RegisterProp('RecipientReceipt', 4);
  RegisterProp('RecipientResponse', 5);
  RegisterProp('AmendmentRequest', 6);
  RegisterProp('Revocation', 7);
  RegisterProp('SenderReceipt', 8);
  RegisterProp('Resolution', 9);
  RegisterProp('ResolutionEntities', 10);
  RegisterProp('OuterDocflows', 12);
  RegisterProp('OuterDocflowEntities', 13);
  RegisterProp('DocflowStatus', 14, true);
end;

procedure TDocflowV3.InternalInit;
begin
  inherited InternalInit;
  FSenderTitle:= TSenderTitleDocflow.Create;
  FConfirmation:= TConfirmationDocflow.Create;
  FProxyResponse:= TParticipantResponseDocflow.Create;
  FRecipientReceipt:= TReceiptDocflowV3.Create;
  FRecipientResponse:= TParticipantResponseDocflow.Create;
  FAmendmentRequest:= TAmendmentRequestDocflow.Create;
  FRevocation:= TRevocationDocflowV3.Create;
  FSenderReceipt:= TReceiptDocflowV3.Create;
  FResolution:= TResolutionDocflowV3.Create;
  FResolutionEntities:= TResolutionEntitiesV3.Create;
  FOuterDocflows:= TOuterDocflows.Create;
  FOuterDocflowEntities:= TOuterDocflowEntitiess.Create;
  FDocflowStatus:= TDocflowStatusV3.Create;
end;

destructor TDocflowV3.Destroy;
begin
  FSenderTitle.Free;
  FConfirmation.Free;
  FProxyResponse.Free;
  FRecipientReceipt.Free;
  FRecipientResponse.Free;
  FAmendmentRequest.Free;
  FRevocation.Free;
  FSenderReceipt.Free;
  FResolution.Free;
  FResolutionEntities.Free;
  FOuterDocflows.Free;
  FOuterDocflowEntities.Free;
  FDocflowStatus.Free;
  inherited Destroy;
end;


  { SenderTitleDocflow } 

procedure TSenderTitleDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1, true);
  RegisterProp('Attachment', 2, true);
  RegisterProp('SentAt', 3);
  RegisterProp('DeliveredAt', 4);
  RegisterProp('RoamingNotification', 5);
  RegisterProp('SenderSignatureStatus', 6, true);
end;

procedure TSenderTitleDocflow.InternalInit;
begin
  inherited InternalInit;
  FAttachment:= TSignedAttachmentV3.Create;
  FSentAt:= TTimestamp.Create;
  FDeliveredAt:= TTimestamp.Create;
  FRoamingNotification:= TRoamingNotification.Create;
end;

destructor TSenderTitleDocflow.Destroy;
begin
  FAttachment.Free;
  FSentAt.Free;
  FDeliveredAt.Free;
  FRoamingNotification.Free;
  inherited Destroy;
end;

procedure TSenderTitleDocflow.SetIsFinished(AValue:Boolean);
begin
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TSenderTitleDocflow.SetSenderSignatureStatus(AValue:DiadocTypes_Document.TSenderSignatureStatus);
begin
  FSenderSignatureStatus:=AValue;
  Modified(6);
end;


  { ConfirmationDocflow } 

procedure TConfirmationDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1, true);
  RegisterProp('ConfirmationAttachment', 2);
  RegisterProp('ConfirmedAt', 3);
  RegisterProp('Receipt', 4);
end;

procedure TConfirmationDocflow.InternalInit;
begin
  inherited InternalInit;
  FConfirmationAttachment:= TSignedAttachmentV3.Create;
  FConfirmedAt:= TTimestamp.Create;
  FReceipt:= TReceiptDocflowV3.Create;
end;

destructor TConfirmationDocflow.Destroy;
begin
  FConfirmationAttachment.Free;
  FConfirmedAt.Free;
  FReceipt.Free;
  inherited Destroy;
end;

procedure TConfirmationDocflow.SetIsFinished(AValue:Boolean);
begin
  FIsFinished:=AValue;
  Modified(1);
end;


  { SignatureRejectionDocflow } 

procedure TSignatureRejectionDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignatureRejection', 1, true);
  RegisterProp('IsFormal', 2, true);
  RegisterProp('DeliveredAt', 3);
  RegisterProp('PlainText', 4);
end;

procedure TSignatureRejectionDocflow.InternalInit;
begin
  inherited InternalInit;
  FSignatureRejection:= TSignedAttachmentV3.Create;
  FDeliveredAt:= TTimestamp.Create;
end;

destructor TSignatureRejectionDocflow.Destroy;
begin
  FSignatureRejection.Free;
  FDeliveredAt.Free;
  inherited Destroy;
end;

procedure TSignatureRejectionDocflow.SetIsFormal(AValue:Boolean);
begin
  FIsFormal:=AValue;
  Modified(2);
end;

procedure TSignatureRejectionDocflow.SetPlainText(AValue:String);
begin
  FPlainText:=AValue;
  Modified(4);
end;


  { ParticipantResponseDocflow } 

procedure TParticipantResponseDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1, true);
  RegisterProp('Signature', 2);
  RegisterProp('Title', 3);
  RegisterProp('Rejection', 4);
  RegisterProp('SentAt', 5);
  RegisterProp('DeliveredAt', 6);
  RegisterProp('ResponseStatus', 7, true);
end;

procedure TParticipantResponseDocflow.InternalInit;
begin
  inherited InternalInit;
  FSignature:= TSignatureV3.Create;
  FTitle:= TSignedAttachmentV3.Create;
  FRejection:= TSignatureRejectionDocflow.Create;
  FSentAt:= TTimestamp.Create;
  FDeliveredAt:= TTimestamp.Create;
end;

destructor TParticipantResponseDocflow.Destroy;
begin
  FSignature.Free;
  FTitle.Free;
  FRejection.Free;
  FSentAt.Free;
  FDeliveredAt.Free;
  inherited Destroy;
end;

procedure TParticipantResponseDocflow.SetIsFinished(AValue:Boolean);
begin
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TParticipantResponseDocflow.SetResponseStatus(AValue:DiadocTypes_Document.TRecipientResponseStatus);
begin
  FResponseStatus:=AValue;
  Modified(7);
end;


  { AmendmentRequestDocflow } 

procedure TAmendmentRequestDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1, true);
  RegisterProp('AmendmentRequest', 2);
  RegisterProp('SentAt', 3);
  RegisterProp('DeliveredAt', 4);
  RegisterProp('Receipt', 5);
  RegisterProp('AmendmentFlags', 6, true);
  RegisterProp('PlainText', 7);
  RegisterProp('ConfirmationDocflow', 8);
end;

procedure TAmendmentRequestDocflow.InternalInit;
begin
  inherited InternalInit;
  FAmendmentRequest:= TSignedAttachmentV3.Create;
  FSentAt:= TTimestamp.Create;
  FDeliveredAt:= TTimestamp.Create;
  FReceipt:= TReceiptDocflowV3.Create;
  FConfirmationDocflow:= TConfirmationDocflow.Create;
end;

destructor TAmendmentRequestDocflow.Destroy;
begin
  FAmendmentRequest.Free;
  FSentAt.Free;
  FDeliveredAt.Free;
  FReceipt.Free;
  FConfirmationDocflow.Free;
  inherited Destroy;
end;

procedure TAmendmentRequestDocflow.SetIsFinished(AValue:Boolean);
begin
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TAmendmentRequestDocflow.SetAmendmentFlags(AValue:Integer);
begin
  FAmendmentFlags:=AValue;
  Modified(6);
end;

procedure TAmendmentRequestDocflow.SetPlainText(AValue:String);
begin
  FPlainText:=AValue;
  Modified(7);
end;


  { RevocationDocflowV3 } 

procedure TRevocationDocflowV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1, true);
  RegisterProp('RevocationRequest', 2, true);
  RegisterProp('RevocationResponse', 3);
  RegisterProp('InitiatorBoxId', 4, true);
  RegisterProp('RevocationStatus', 5, true);
  RegisterProp('ResolutionEntities', 6);
  RegisterProp('OuterDocflowEntities', 7);
end;

procedure TRevocationDocflowV3.InternalInit;
begin
  inherited InternalInit;
  FRevocationRequest:= TRevocationRequestDocflow.Create;
  FRevocationResponse:= TRevocationResponseDocflow.Create;
  FResolutionEntities:= TResolutionEntitiesV3.Create;
  FOuterDocflowEntities:= TOuterDocflowEntitiess.Create;
end;

destructor TRevocationDocflowV3.Destroy;
begin
  FRevocationRequest.Free;
  FRevocationResponse.Free;
  FResolutionEntities.Free;
  FOuterDocflowEntities.Free;
  inherited Destroy;
end;

procedure TRevocationDocflowV3.SetIsFinished(AValue:Boolean);
begin
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TRevocationDocflowV3.SetInitiatorBoxId(AValue:String);
begin
  FInitiatorBoxId:=AValue;
  Modified(4);
end;

procedure TRevocationDocflowV3.SetRevocationStatus(AValue:DiadocTypes_Document.TRevocationStatus);
begin
  FRevocationStatus:=AValue;
  Modified(5);
end;


  { RevocationRequestDocflow } 

procedure TRevocationRequestDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RevocationRequest', 1, true);
  RegisterProp('SentAt', 2);
  RegisterProp('DeliveredAt', 3);
  RegisterProp('RoamingNotification', 4);
  RegisterProp('PlainText', 5);
end;

procedure TRevocationRequestDocflow.InternalInit;
begin
  inherited InternalInit;
  FRevocationRequest:= TSignedAttachmentV3.Create;
  FSentAt:= TTimestamp.Create;
  FDeliveredAt:= TTimestamp.Create;
  FRoamingNotification:= TRoamingNotification.Create;
end;

destructor TRevocationRequestDocflow.Destroy;
begin
  FRevocationRequest.Free;
  FSentAt.Free;
  FDeliveredAt.Free;
  FRoamingNotification.Free;
  inherited Destroy;
end;

procedure TRevocationRequestDocflow.SetPlainText(AValue:String);
begin
  FPlainText:=AValue;
  Modified(5);
end;


  { RevocationResponseDocflow } 

procedure TRevocationResponseDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RecipientSignature', 1);
  RegisterProp('SignatureRejection', 2);
end;

procedure TRevocationResponseDocflow.InternalInit;
begin
  inherited InternalInit;
  FRecipientSignature:= TSignatureV3.Create;
  FSignatureRejection:= TSignatureRejectionDocflow.Create;
end;

destructor TRevocationResponseDocflow.Destroy;
begin
  FRecipientSignature.Free;
  FSignatureRejection.Free;
  inherited Destroy;
end;


  { ReceiptDocflowV3 } 

procedure TReceiptDocflowV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1, true);
  RegisterProp('ReceiptAttachment', 2);
  RegisterProp('SentAt', 3);
  RegisterProp('DeliveredAt', 4);
  RegisterProp('Confirmation', 5);
  RegisterProp('Status', 6, true);
end;

procedure TReceiptDocflowV3.InternalInit;
begin
  inherited InternalInit;
  FReceiptAttachment:= TSignedAttachmentV3.Create;
  FSentAt:= TTimestamp.Create;
  FDeliveredAt:= TTimestamp.Create;
  FConfirmation:= TConfirmationDocflow.Create;
end;

destructor TReceiptDocflowV3.Destroy;
begin
  FReceiptAttachment.Free;
  FSentAt.Free;
  FDeliveredAt.Free;
  FConfirmation.Free;
  inherited Destroy;
end;

procedure TReceiptDocflowV3.SetIsFinished(AValue:Boolean);
begin
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TReceiptDocflowV3.SetStatus(AValue:DiadocTypes_Document.TGeneralReceiptStatus);
begin
  FStatus:=AValue;
  Modified(6);
end;


  { OuterDocflow } 

procedure TOuterDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocflowNamedId', 1, true);
  RegisterProp('ParentEntityId', 2, true);
  RegisterProp('OuterDocflowEntityId', 3, true);
end;

procedure TOuterDocflow.InternalInit;
begin
  inherited InternalInit;
end;

destructor TOuterDocflow.Destroy;
begin
  inherited Destroy;
end;

procedure TOuterDocflow.SetDocflowNamedId(AValue:String);
begin
  FDocflowNamedId:=AValue;
  Modified(1);
end;

procedure TOuterDocflow.SetParentEntityId(AValue:String);
begin
  FParentEntityId:=AValue;
  Modified(2);
end;

procedure TOuterDocflow.SetOuterDocflowEntityId(AValue:String);
begin
  FOuterDocflowEntityId:=AValue;
  Modified(3);
end;


  { OuterDocflowEntities } 

procedure TOuterDocflowEntities.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocflowNamedId', 1, true);
  RegisterProp('DocflowFriendlyName', 2, true);
  RegisterProp('StatusEntities', 3);
end;

procedure TOuterDocflowEntities.InternalInit;
begin
  inherited InternalInit;
  FStatusEntities:= TStatusEntitys.Create;
end;

destructor TOuterDocflowEntities.Destroy;
begin
  FStatusEntities.Free;
  inherited Destroy;
end;

procedure TOuterDocflowEntities.SetDocflowNamedId(AValue:String);
begin
  FDocflowNamedId:=AValue;
  Modified(1);
end;

procedure TOuterDocflowEntities.SetDocflowFriendlyName(AValue:String);
begin
  FDocflowFriendlyName:=AValue;
  Modified(2);
end;


  { StatusEntity } 

procedure TStatusEntity.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Attachment', 1, true);
  RegisterProp('Status', 2, true);
end;

procedure TStatusEntity.InternalInit;
begin
  inherited InternalInit;
  FAttachment:= TSignedAttachmentV3.Create;
  FStatus:= TStatus.Create;
end;

destructor TStatusEntity.Destroy;
begin
  FAttachment.Free;
  FStatus.Free;
  inherited Destroy;
end;

end.
