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

unit DiadocTypes_RecipientSignatureRejectionDocflow;

{$I diadoc_define.inc}

interface

(*
import "Timestamp.proto";
import "Docflow/Attachment.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Timestamp,
  DiadocTypes_Attachment
  ;

type


  { TRecipientSignatureRejectionDocflow }
  //message RecipientSignatureRejectionDocflow
  //{
  //	optional bool IsFinished = 1;
  //	optional SignedAttachment RecipientSignatureRejectionAttachment = 2;
  //	optional Timestamp DeliveryTimestamp = 3;
  //}
  TRecipientSignatureRejectionDocflow = class(TSerializationObject) //message RecipientSignatureRejectionDocflow
  private
    FDeliveryTimestamp: TTimestamp;
    FIsFinished: Boolean;
    FRecipientSignatureRejectionAttachment: TSignedAttachment;
    procedure SetIsFinished(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished; //1;
    property RecipientSignatureRejectionAttachment:TSignedAttachment read FRecipientSignatureRejectionAttachment; //2;
    property DeliveryTimestamp:TTimestamp read FDeliveryTimestamp; //3;
  end;

implementation

{ TRecipientSignatureRejectionDocflow }

procedure TRecipientSignatureRejectionDocflow.SetIsFinished(AValue: Boolean);
begin
  if FIsFinished=AValue then Exit;
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TRecipientSignatureRejectionDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('RecipientSignatureRejectionAttachment', 2);
  RegisterProp('DeliveryTimestamp', 3);
end;

procedure TRecipientSignatureRejectionDocflow.InternalInit;
begin
  inherited InternalInit;
  FRecipientSignatureRejectionAttachment:=TSignedAttachment.Create;
  FDeliveryTimestamp:=TTimestamp.Create;
end;

destructor TRecipientSignatureRejectionDocflow.Destroy;
begin
  FreeAndNil(FRecipientSignatureRejectionAttachment);
  FreeAndNil(FDeliveryTimestamp);
  inherited Destroy;
end;

end.

