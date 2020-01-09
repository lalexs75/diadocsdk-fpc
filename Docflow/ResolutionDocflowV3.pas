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

unit ResolutionDocflowV3;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_Timestamp, ResolutionAction, DiadocTypes_ResolutionRequestType,
  DiadocTypes_ResolutionTarget, DiadocTypes_ResolutionType, DiadocTypes_Attachment, AttachmentV3;

type

  { ResolutionStatus } 
  //enum ResolutionStatus
  //{
  //	UnknownStatus = 0;
  //	None = 1;
  //	Approved = 2;
  //	Disapproved = 3;
  //	ApprovementRequested = 4;
  //	ApprovementSignatureRequested = 5;
  //	PrimarySignatureRequested = 6;
  //	SignatureRequestRejected = 7;
  //	SignedWithApprovingSignature = 8;
  //	SignedWithPrimarySignature = 9;
  //	PrimarySignatureRejected = 10; 
  //	ActionsRequested = 11;
  //}
  TResolutionStatus = (
    UnknownStatus = 0,
    None = 1,
    Approved = 2,
    Disapproved = 3,
    ApprovementRequested = 4,
    ApprovementSignatureRequested = 5,
    PrimarySignatureRequested = 6,
    SignatureRequestRejected = 7,
    SignedWithApprovingSignature = 8,
    SignedWithPrimarySignature = 9,
    PrimarySignatureRejected = 10,
    ActionsRequested = 11
  );

  TResolutionDocflowV3 = class;
  TResolutionEntitiesV3 = class;
  TResolutionRequestV3 = class;
  TResolutionV3 = class;
  TApprovementSignatureV3 = class;
  TSignatureDenialV3 = class;

  { ResolutionDocflowV3 } 
  //message ResolutionDocflowV3
  //{
  //	required bool IsFinished = 1;
  //
  //	required string ParentEntityId = 2;
  //
  //	required ResolutionStatus ResolutionStatus = 3 [default = UnknownStatus];
  //
  //	optional string ResolutionEntityId = 4;
  //}
  TResolutionDocflowV3 = class(TSerializationObject)
  private
    FIsFinished:Boolean;
    FParentEntityId:String;
    FResolutionStatus:TResolutionStatus;
    FResolutionEntityId:String;
    procedure SetIsFinished(AValue:Boolean);
    procedure SetParentEntityId(AValue:String);
    procedure SetResolutionStatus(AValue:TResolutionStatus);
    procedure SetResolutionEntityId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished;
    property ParentEntityId:String read FParentEntityId write SetParentEntityId;
    property ResolutionStatus:TResolutionStatus read FResolutionStatus write SetResolutionStatus default UnknownStatus;
    property ResolutionEntityId:String read FResolutionEntityId write SetResolutionEntityId;
  end;
  TResolutionDocflowV3s = specialize GSerializationObjectList<TResolutionDocflowV3>;

  { ResolutionRequestV3 }
  //message ResolutionRequestV3
  //{
  //	required Entity Entity = 1;
  //	required ResolutionTarget Target = 2;
  //	optional string AuthorUserId = 3;
  //	required ResolutionRequestType RequestType = 4 [default = UnknownResolutionRequestType];
  //	optional string ResolvedWith = 5;
  //	repeated ResolutionAction Actions = 6;
  //}
  TResolutionRequestV3 = class(TSerializationObject)
  private
    FEntity:TEntity;
    FTarget:TResolutionTarget;
    FAuthorUserId:String;
    FRequestType:TResolutionRequestType;
    FResolvedWith:String;
    FActions:TResolutionAction;
    procedure SetAuthorUserId(AValue:String);
    procedure SetRequestType(AValue:TResolutionRequestType);
    procedure SetResolvedWith(AValue:String);
    procedure SetActions(AValue:TResolutionAction);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Entity:TEntity read FEntity;
    property Target:TResolutionTarget read FTarget;
    property AuthorUserId:String read FAuthorUserId write SetAuthorUserId;
    property RequestType:TResolutionRequestType read FRequestType write SetRequestType default UnknownResolutionRequestType;
    property ResolvedWith:String read FResolvedWith write SetResolvedWith;
    property Actions:TResolutionAction read FActions write SetActions;
  end;
  TResolutionRequestV3s = specialize GSerializationObjectList<TResolutionRequestV3>;

  { ResolutionV3 }
  //message ResolutionV3
  //{
  //	required Entity Entity = 1;
  //	optional string ResolutionRequestId = 2;
  //	optional string AuthorUserId = 3;
  //	required ResolutionType ResolutionType = 4 [default = UnknownResolutionType];
  //}
  TResolutionV3 = class(TSerializationObject)
  private
    FEntity:TEntity;
    FResolutionRequestId:String;
    FAuthorUserId:String;
    FResolutionType:TResolutionType;
    procedure SetResolutionRequestId(AValue:String);
    procedure SetAuthorUserId(AValue:String);
    procedure SetResolutionType(AValue:TResolutionType);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Entity:TEntity read FEntity;
    property ResolutionRequestId:String read FResolutionRequestId write SetResolutionRequestId;
    property AuthorUserId:String read FAuthorUserId write SetAuthorUserId;
    property ResolutionType:TResolutionType read FResolutionType write SetResolutionType default UnknownResolutionType;
  end;
  TResolutionV3s = specialize GSerializationObjectList<TResolutionV3>;
  { ApprovementSignatureV3 }
  //message ApprovementSignatureV3
  //{
  //	required SignatureV3 Signature = 1;
  //	optional string ResolutionRequestId = 2;
  //	optional string AuthorUserId = 3;
  //}
  TApprovementSignatureV3 = class(TSerializationObject)
  private
    FSignature:TSignatureV3;
    FResolutionRequestId:String;
    FAuthorUserId:String;
    procedure SetResolutionRequestId(AValue:String);
    procedure SetAuthorUserId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Signature:TSignatureV3 read FSignature;
    property ResolutionRequestId:String read FResolutionRequestId write SetResolutionRequestId;
    property AuthorUserId:String read FAuthorUserId write SetAuthorUserId;
  end;
  TApprovementSignatureV3s = specialize GSerializationObjectList<TApprovementSignatureV3>;

  { SignatureDenialV3 }
  //message SignatureDenialV3
  //{
  //	required Entity Entity = 1;
  //	required string ResolutionRequestId = 2;
  //	optional string AuthorUserId = 3;
  //}
  TSignatureDenialV3 = class(TSerializationObject)
  private
    FEntity:TEntity;
    FResolutionRequestId:String;
    FAuthorUserId:String;
    procedure SetResolutionRequestId(AValue:String);
    procedure SetAuthorUserId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Entity:TEntity read FEntity;
    property ResolutionRequestId:String read FResolutionRequestId write SetResolutionRequestId;
    property AuthorUserId:String read FAuthorUserId write SetAuthorUserId;
  end;
  TSignatureDenialV3s = specialize GSerializationObjectList<TSignatureDenialV3>;

  { ResolutionEntitiesV3 }
  //message ResolutionEntitiesV3
  //{
  //	repeated ResolutionRequestV3 Requests = 1;
  //	repeated ResolutionV3 Resolutions = 2;
  //	repeated ApprovementSignatureV3 ApprovementSignatures = 3;
  //	repeated SignatureDenialV3 SignatureDenials = 4;
  //}
  TResolutionEntitiesV3 = class(TSerializationObject)
  private
    FRequests:TResolutionRequestV3s;
    FResolutions:TResolutionV3s;
    FApprovementSignatures:TApprovementSignatureV3s;
    FSignatureDenials:TSignatureDenialV3s;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Requests:TResolutionRequestV3s read FRequests;
    property Resolutions:TResolutionV3s read FResolutions;
    property ApprovementSignatures:TApprovementSignatureV3s read FApprovementSignatures;
    property SignatureDenials:TSignatureDenialV3s read FSignatureDenials;
  end;
  TResolutionEntitiesV3s = specialize GSerializationObjectList<TResolutionEntitiesV3>;

implementation

  { ResolutionDocflowV3 } 

procedure TResolutionDocflowV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1, true);
  RegisterProp('ParentEntityId', 2, true);
  RegisterProp('ResolutionStatus', 3, true);
  RegisterProp('ResolutionEntityId', 4);
end;

procedure TResolutionDocflowV3.InternalInit;
begin
  inherited InternalInit;

  ResolutionStatus:= UnknownStatus;
end;

destructor TResolutionDocflowV3.Destroy;
begin
  inherited Destroy;
end;

procedure TResolutionDocflowV3.SetIsFinished(AValue:Boolean);
begin
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TResolutionDocflowV3.SetParentEntityId(AValue:String);
begin
  FParentEntityId:=AValue;
  Modified(2);
end;

procedure TResolutionDocflowV3.SetResolutionStatus(AValue:TResolutionStatus);
begin
  FResolutionStatus:=AValue;
  Modified(3);
end;

procedure TResolutionDocflowV3.SetResolutionEntityId(AValue:String);
begin
  FResolutionEntityId:=AValue;
  Modified(4);
end;


  { ResolutionEntitiesV3 } 

procedure TResolutionEntitiesV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Requests', 1);
  RegisterProp('Resolutions', 2);
  RegisterProp('ApprovementSignatures', 3);
  RegisterProp('SignatureDenials', 4);
end;

procedure TResolutionEntitiesV3.InternalInit;
begin
  inherited InternalInit;
  FRequests:= TResolutionRequestV3s.Create;
  FResolutions:= TResolutionV3s.Create;
  FApprovementSignatures:= TApprovementSignatureV3s.Create;
  FSignatureDenials:= TSignatureDenialV3s.Create;
end;

destructor TResolutionEntitiesV3.Destroy;
begin
  FRequests.Free;
  FResolutions.Free;
  FApprovementSignatures.Free;
  FSignatureDenials.Free;
  inherited Destroy;
end;


  { ResolutionRequestV3 } 

procedure TResolutionRequestV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Entity', 1, true);
  RegisterProp('Target', 2, true);
  RegisterProp('AuthorUserId', 3);
  RegisterProp('RequestType', 4, true);
  RegisterProp('ResolvedWith', 5);
  RegisterProp('Actions', 6);
end;

procedure TResolutionRequestV3.InternalInit;
begin
  inherited InternalInit;
  FEntity:= TEntity.Create;
  FTarget:= TResolutionTarget.Create;

  RequestType:= UnknownResolutionRequestType;
end;

destructor TResolutionRequestV3.Destroy;
begin
  FEntity.Free;
  FTarget.Free;
  inherited Destroy;
end;

procedure TResolutionRequestV3.SetAuthorUserId(AValue:String);
begin
  FAuthorUserId:=AValue;
  Modified(3);
end;

procedure TResolutionRequestV3.SetRequestType(AValue:TResolutionRequestType);
begin
  FRequestType:=AValue;
  Modified(4);
end;

procedure TResolutionRequestV3.SetResolvedWith(AValue:String);
begin
  FResolvedWith:=AValue;
  Modified(5);
end;

procedure TResolutionRequestV3.SetActions(AValue:TResolutionAction);
begin
  FActions:=AValue;
  Modified(6);
end;


  { ResolutionV3 } 

procedure TResolutionV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Entity', 1, true);
  RegisterProp('ResolutionRequestId', 2);
  RegisterProp('AuthorUserId', 3);
  RegisterProp('ResolutionType', 4, true);
end;

procedure TResolutionV3.InternalInit;
begin
  inherited InternalInit;
  FEntity:= TEntity.Create;

  ResolutionType:= UnknownResolutionType;
end;

destructor TResolutionV3.Destroy;
begin
  FEntity.Free;
  inherited Destroy;
end;

procedure TResolutionV3.SetResolutionRequestId(AValue:String);
begin
  FResolutionRequestId:=AValue;
  Modified(2);
end;

procedure TResolutionV3.SetAuthorUserId(AValue:String);
begin
  FAuthorUserId:=AValue;
  Modified(3);
end;

procedure TResolutionV3.SetResolutionType(AValue:TResolutionType);
begin
  FResolutionType:=AValue;
  Modified(4);
end;


  { ApprovementSignatureV3 } 

procedure TApprovementSignatureV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Signature', 1, true);
  RegisterProp('ResolutionRequestId', 2);
  RegisterProp('AuthorUserId', 3);
end;

procedure TApprovementSignatureV3.InternalInit;
begin
  inherited InternalInit;
  FSignature:= TSignatureV3.Create;
end;

destructor TApprovementSignatureV3.Destroy;
begin
  FSignature.Free;
  inherited Destroy;
end;

procedure TApprovementSignatureV3.SetResolutionRequestId(AValue:String);
begin
  FResolutionRequestId:=AValue;
  Modified(2);
end;

procedure TApprovementSignatureV3.SetAuthorUserId(AValue:String);
begin
  FAuthorUserId:=AValue;
  Modified(3);
end;


  { SignatureDenialV3 } 

procedure TSignatureDenialV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Entity', 1, true);
  RegisterProp('ResolutionRequestId', 2, true);
  RegisterProp('AuthorUserId', 3);
end;

procedure TSignatureDenialV3.InternalInit;
begin
  inherited InternalInit;
  FEntity:= TEntity.Create;
end;

destructor TSignatureDenialV3.Destroy;
begin
  FEntity.Free;
  inherited Destroy;
end;

procedure TSignatureDenialV3.SetResolutionRequestId(AValue:String);
begin
  FResolutionRequestId:=AValue;
  Modified(2);
end;

procedure TSignatureDenialV3.SetAuthorUserId(AValue:String);
begin
  FAuthorUserId:=AValue;
  Modified(3);
end;

end.
