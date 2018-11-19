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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property EntityId:string read FEntityId write FEntityId; //1;
    property CreationTimestamp:TTimestamp read FCreationTimestamp; //2;
    property Content:TContent read FContent; //3;
  end;

  { TAttachment }

  TAttachment = class(TSerializationObject) //message Attachment
  private
    FAttachmentFilename: string;
    FDisplayFilename: string;
    FEntity: TEntity;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Entity:TEntity read FEntity; //1;
    property AttachmentFilename:string read FAttachmentFilename write FAttachmentFilename; //2;
    property DisplayFilename:string read FDisplayFilename write FDisplayFilename; //3;
  end;

  {  TSignature  }

  TSignature = class(TSerializationObject) //message Signature
  private
    FEntity: TEntity;
    FIsValid: Boolean;
    FSignerBoxId: string;
    FSignerDepartmentId: string;
    FVerificationResult: TSignatureVerificationResult;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Entity:TEntity read FEntity; //1;
    property SignerBoxId:string read FSignerBoxId write FSignerBoxId; //2;
    property SignerDepartmentId:string read FSignerDepartmentId write FSignerDepartmentId; //3;
    property IsValid:Boolean read FIsValid write FIsValid; //4;
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

