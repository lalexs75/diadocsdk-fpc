{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2019 Lagunov Aleksey alexs75@yandex.ru

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

unit DiadocTypes_Attachment;

{$I diadoc_define.inc}

interface

(*
import "Content.proto";
import "Timestamp.proto";
import "SignatureVerificationResult.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Content,
  DiadocTypes_Timestamp,
  DiadocTypes_SignatureVerificationResult;

type

  { TEntity }

  TEntity = class(TSerializationObject) //message Entity
  private
    FContent: TContent;
    FCreationTimestamp: TTimestamp;
    FEntityId: string;
    procedure SetEntityId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property EntityId:string read FEntityId write SetEntityId; //1;
    property CreationTimestamp:TTimestamp read FCreationTimestamp; //2;
    property Content:TContent read FContent; //3;
  end;

  { TAttachment }

  TAttachment = class(TSerializationObject) //message Attachment
  private
    FAttachmentFilename: string;
    FDisplayFilename: string;
    FEntity: TEntity;
    procedure SetAttachmentFilename(AValue: string);
    procedure SetDisplayFilename(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Entity:TEntity read FEntity; //1;
    property AttachmentFilename:string read FAttachmentFilename write SetAttachmentFilename; //2;
    property DisplayFilename:string read FDisplayFilename write SetDisplayFilename; //3;
  end;

  {  TSignature  }

  TSignature = class(TSerializationObject) //message Signature
  private
    FEntity: TEntity;
    FIsValid: Boolean;
    FSignerBoxId: string;
    FSignerDepartmentId: string;
    FVerificationResult: TSignatureVerificationResult;
    procedure SetIsValid(AValue: Boolean);
    procedure SetSignerBoxId(AValue: string);
    procedure SetSignerDepartmentId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Entity:TEntity read FEntity; //1;
    property SignerBoxId:string read FSignerBoxId write SetSignerBoxId; //2;
    property SignerDepartmentId:string read FSignerDepartmentId write SetSignerDepartmentId; //3;
    property IsValid:Boolean read FIsValid write SetIsValid; //4;
    property VerificationResult:TSignatureVerificationResult read FVerificationResult; //5;
  end;

  { TSignedAttachment }

  TSignedAttachment = class(TSerializationObject) //message SignedAttachment
  private
    FAttachment: TAttachment;
    FComment: TEntity;
    FSignature: TSignature;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Attachment:TAttachment read FAttachment; //1;
    property Signature:TSignature read FSignature; //2;
    property Comment:TEntity read FComment; //3;
  end;

implementation

{ TEntity }

procedure TEntity.SetEntityId(AValue: string);
begin
  if FEntityId=AValue then Exit;
  FEntityId:=AValue;
  Modified(1);
end;

procedure TEntity.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('EntityId', 1);
  RegisterProp('CreationTimestamp', 2);
  RegisterProp('Content', 3);
end;

procedure TEntity.InternalInit;
begin
  inherited InternalInit;
  FCreationTimestamp:=TTimestamp.Create;
  FContent:=TContent.Create;
end;

destructor TEntity.Destroy;
begin
  FreeAndNil(FCreationTimestamp);
  FreeAndNil(FContent);
  inherited Destroy;
end;

{ TSignedAttachment }

procedure TSignedAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Attachment', 1);
  RegisterProp('Signature', 2);
  RegisterProp('Comment', 3);
end;

procedure TSignedAttachment.InternalInit;
begin
  inherited InternalInit;
  FAttachment:=TAttachment.Create;
  FSignature:=TSignature.Create;
  FComment:=TEntity.Create;
end;

destructor TSignedAttachment.Destroy;
begin
  FreeAndNil(FAttachment);
  FreeAndNil(FSignature);
  FreeAndNil(FComment);
  inherited Destroy;
end;

{ TAttachment }

procedure TAttachment.SetAttachmentFilename(AValue: string);
begin
  if FAttachmentFilename=AValue then Exit;
  FAttachmentFilename:=AValue;
  Modified(2);
end;

procedure TAttachment.SetDisplayFilename(AValue: string);
begin
  if FDisplayFilename=AValue then Exit;
  FDisplayFilename:=AValue;
  Modified(3);
end;

procedure TAttachment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Entity', 1);
  RegisterProp('AttachmentFilename', 2);
  RegisterProp('DisplayFilename', 3);
end;

procedure TAttachment.InternalInit;
begin
  inherited InternalInit;
  FEntity:=TEntity.Create;
end;

destructor TAttachment.Destroy;
begin
  FreeAndNil(FEntity);
  inherited Destroy;
end;

{ TSignature }

procedure TSignature.SetIsValid(AValue: Boolean);
begin
  if FIsValid=AValue then Exit;
  FIsValid:=AValue;
  Modified(4);
end;

procedure TSignature.SetSignerBoxId(AValue: string);
begin
  if FSignerBoxId=AValue then Exit;
  FSignerBoxId:=AValue;
  Modified(2);
end;

procedure TSignature.SetSignerDepartmentId(AValue: string);
begin
  if FSignerDepartmentId=AValue then Exit;
  FSignerDepartmentId:=AValue;
  Modified(3);
end;

procedure TSignature.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Entity', 1);
  RegisterProp('SignerBoxId', 2);
  RegisterProp('SignerDepartmentId', 3);
  RegisterProp('IsValid', 4);
  RegisterProp('VerificationResult', 5);
end;

procedure TSignature.InternalInit;
begin
  inherited InternalInit;
  FEntity:=TEntity.Create;
  FVerificationResult:=TSignatureVerificationResult.Create;
end;

destructor TSignature.Destroy;
begin
  FreeAndNil(FEntity);
  FreeAndNil(FVerificationResult);
  inherited Destroy;
end;
end.

