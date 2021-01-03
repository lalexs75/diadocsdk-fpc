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

unit AttachmentV3;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_Attachment, DiadocTypes_Content, DiadocTypes_Timestamp,
  DiadocTypes_SignatureVerificationResult;

type

  TSignatureV3 = class;
  TSignatureV3s = specialize GSerializationObjectList<TSignatureV3>;
  TSignedAttachmentV3 = class;
  TSignedAttachmentV3s = specialize GSerializationObjectList<TSignedAttachmentV3>;

  { SignatureV3 } 
  //message SignatureV3
  //{
  //	required Entity Cms = 1;
  //	optional Entity CadesT = 2;
  //	required string SignerBoxId = 3;
  //	required string SignerDepartmentId = 4;
  //	required bool IsValid = 5;
  //	optional SignatureVerificationResult VerificationResult = 6;
  //	optional Timestamp DeliveredAt = 7;
  //}
  TSignatureV3 = class(TSerializationObject)
  private
    FCms:TEntity;
    FCadesT:TEntity;
    FSignerBoxId:String;
    FSignerDepartmentId:String;
    FIsValid:Boolean;
    FVerificationResult:TSignatureVerificationResult;
    FDeliveredAt:TTimestamp;
    procedure SetSignerBoxId(AValue:String);
    procedure SetSignerDepartmentId(AValue:String);
    procedure SetIsValid(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Cms:TEntity read FCms;
    property CadesT:TEntity read FCadesT;
    property SignerBoxId:String read FSignerBoxId write SetSignerBoxId;
    property SignerDepartmentId:String read FSignerDepartmentId write SetSignerDepartmentId;
    property IsValid:Boolean read FIsValid write SetIsValid;
    property VerificationResult:TSignatureVerificationResult read FVerificationResult;
    property DeliveredAt:TTimestamp read FDeliveredAt;
  end;

  { SignedAttachmentV3 } 
  //message SignedAttachmentV3
  //{
  //	required Attachment Attachment = 1;
  //	optional SignatureV3 Signature = 2;
  //	optional Entity Comment = 3;
  //	required string ContentTypeId = 4;
  //}
  TSignedAttachmentV3 = class(TSerializationObject)
  private
    FAttachment:TAttachment;
    FSignature:TSignatureV3;
    FComment:TEntity;
    FContentTypeId:String;
    procedure SetContentTypeId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Attachment:TAttachment read FAttachment;
    property Signature:TSignatureV3 read FSignature;
    property Comment:TEntity read FComment;
    property ContentTypeId:String read FContentTypeId write SetContentTypeId;
  end;

implementation

  { SignatureV3 } 

procedure TSignatureV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Cms', 1, true);
  RegisterProp('CadesT', 2);
  RegisterProp('SignerBoxId', 3, true);
  RegisterProp('SignerDepartmentId', 4, true);
  RegisterProp('IsValid', 5, true);
  RegisterProp('VerificationResult', 6);
  RegisterProp('DeliveredAt', 7);
end;

procedure TSignatureV3.InternalInit;
begin
  inherited InternalInit;
  FCms:= TEntity.Create;
  FCadesT:= TEntity.Create;
  FVerificationResult:= TSignatureVerificationResult.Create;
  FDeliveredAt:= TTimestamp.Create;
end;

destructor TSignatureV3.Destroy;
begin
  FCms.Free;
  FCadesT.Free;
  FVerificationResult.Free;
  FDeliveredAt.Free;
  inherited Destroy;
end;

procedure TSignatureV3.SetSignerBoxId(AValue:String);
begin
  FSignerBoxId:=AValue;
  Modified(3);
end;

procedure TSignatureV3.SetSignerDepartmentId(AValue:String);
begin
  FSignerDepartmentId:=AValue;
  Modified(4);
end;

procedure TSignatureV3.SetIsValid(AValue:Boolean);
begin
  FIsValid:=AValue;
  Modified(5);
end;


  { SignedAttachmentV3 } 

procedure TSignedAttachmentV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Attachment', 1, true);
  RegisterProp('Signature', 2);
  RegisterProp('Comment', 3);
  RegisterProp('ContentTypeId', 4, true);
end;

procedure TSignedAttachmentV3.InternalInit;
begin
  inherited InternalInit;
  FAttachment:= TAttachment.Create;
  FSignature:= TSignatureV3.Create;
  FComment:= TEntity.Create;
end;

destructor TSignedAttachmentV3.Destroy;
begin
  FAttachment.Free;
  FSignature.Free;
  FComment.Free;
  inherited Destroy;
end;

procedure TSignedAttachmentV3.SetContentTypeId(AValue:String);
begin
  FContentTypeId:=AValue;
  Modified(4);
end;

end.
