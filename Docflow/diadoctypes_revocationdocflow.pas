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

unit DiadocTypes_RevocationDocflow;

{$I diadoc_define.inc}

interface
(*
import "Docflow/Attachment.proto";
import "Docflow/RecipientSignatureDocflow.proto";
import "Docflow/RecipientSignatureRejectionDocflow.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Attachment,
  DiadocTypes_RecipientSignatureDocflow,
  DiadocTypes_RecipientSignatureRejectionDocflow;

type


  { TRevocationDocflow }
  //message RevocationDocflow
  //{
  //	optional bool IsFinished = 1;
  //	optional SignedAttachment RevocationRequestAttachment = 2;
  //	optional RecipientSignatureDocflow RecipientSignatureDocflow = 3;
  //	optional RecipientSignatureRejectionDocflow RecipientSignatureRejectionDocflow = 4;
  //    optional string InitiatorBoxId = 5;
  //	optional bool IsRevocationAccepted = 6;
  //	optional bool IsRevocationRejected = 7;
  //}
  TRevocationDocflow = class(TSerializationObject) //message RevocationDocflow
  private
    FInitiatorBoxId: string;
    FIsFinished: Boolean;
    FIsRevocationAccepted: Boolean;
    FIsRevocationRejected: Boolean;
    FRecipientSignatureDocflow: TRecipientSignatureDocflow;
    FRecipientSignatureRejectionDocflow: TRecipientSignatureRejectionDocflow;
    FRevocationRequestAttachment: TSignedAttachment;
    procedure SetInitiatorBoxId(AValue: string);
    procedure SetIsFinished(AValue: Boolean);
    procedure SetIsRevocationAccepted(AValue: Boolean);
    procedure SetIsRevocationRejected(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished; //1;
    property RevocationRequestAttachment:TSignedAttachment read FRevocationRequestAttachment; //2;
    property RecipientSignatureDocflow:TRecipientSignatureDocflow read FRecipientSignatureDocflow; //3;
    property RecipientSignatureRejectionDocflow:TRecipientSignatureRejectionDocflow read FRecipientSignatureRejectionDocflow; //4;
    property InitiatorBoxId:string read FInitiatorBoxId write SetInitiatorBoxId; // = 5;
    property IsRevocationAccepted:Boolean read FIsRevocationAccepted write SetIsRevocationAccepted; //6;
    property IsRevocationRejected:Boolean read FIsRevocationRejected write SetIsRevocationRejected; //7;
  end;

implementation

{ TRevocationDocflow }

procedure TRevocationDocflow.SetInitiatorBoxId(AValue: string);
begin
  if FInitiatorBoxId=AValue then Exit;
  FInitiatorBoxId:=AValue;
  Modified(5);
end;

procedure TRevocationDocflow.SetIsFinished(AValue: Boolean);
begin
  if FIsFinished=AValue then Exit;
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TRevocationDocflow.SetIsRevocationAccepted(AValue: Boolean);
begin
  if FIsRevocationAccepted=AValue then Exit;
  FIsRevocationAccepted:=AValue;
  Modified(6);
end;

procedure TRevocationDocflow.SetIsRevocationRejected(AValue: Boolean);
begin
  if FIsRevocationRejected=AValue then Exit;
  FIsRevocationRejected:=AValue;
  Modified(7);
end;

procedure TRevocationDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('RevocationRequestAttachment', 2);
  RegisterProp('RecipientSignatureDocflow', 3);
  RegisterProp('RecipientSignatureRejectionDocflow', 4);
  RegisterProp('InitiatorBoxId', 5);
  RegisterProp('IsRevocationAccepted', 6);
  RegisterProp('IsRevocationRejected', 7);
end;

procedure TRevocationDocflow.InternalInit;
begin
  inherited InternalInit;
  FRevocationRequestAttachment:=TSignedAttachment.Create;
  FRecipientSignatureDocflow:=TRecipientSignatureDocflow.Create;
  FRecipientSignatureRejectionDocflow:=TRecipientSignatureRejectionDocflow.Create;
end;

destructor TRevocationDocflow.Destroy;
begin
  FreeAndNil(FRevocationRequestAttachment);
  FreeAndNil(FRecipientSignatureDocflow);
  FreeAndNil(FRecipientSignatureRejectionDocflow);
  inherited Destroy;
end;

end.

