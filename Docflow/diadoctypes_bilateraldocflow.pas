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
unit DiadocTypes_BilateralDocflow;

{$I diadoc_define.inc}

interface

(*
import "Docflow/ReceiptDocflow.proto";
import "Docflow/RecipientSignatureDocflow.proto";
import "Docflow/RecipientSignatureRejectionDocflow.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_ReceiptDocflow,
  DiadocTypes_RecipientSignatureDocflow,
  DiadocTypes_RecipientSignatureRejectionDocflow
  ;

type

  { TBilateralDocflow }
  //message BilateralDocflow
  //{
  //	optional bool IsFinished = 1;
  //	optional ReceiptDocflow ReceiptDocflow = 2;
  //	optional RecipientSignatureDocflow RecipientSignatureDocflow = 3;
  //	optional RecipientSignatureRejectionDocflow RecipientSignatureRejectionDocflow = 4;
  //	optional bool IsReceiptRequested = 5;
  //	optional bool IsRecipientSignatureRequested = 6;
  //	optional bool IsDocumentSignedByRecipient = 7;
  //	optional bool IsDocumentRejectedByRecipient = 8;
  //	optional bool CanDocumentBeReceipted = 9;
  //	optional bool CanDocumentBeSignedBySender = 10;
  //	optional bool CanDocumentBeSignedOrRejectedByRecipient = 11;
  //}
  TBilateralDocflow = class(TSerializationObject) //message BilateralDocflow
  private
    FCanDocumentBeReceipted: Boolean;
    FCanDocumentBeSignedBySender: Boolean;
    FCanDocumentBeSignedOrRejectedByRecipient: Boolean;
    FIsDocumentRejectedByRecipient: Boolean;
    FIsDocumentSignedByRecipient: Boolean;
    FIsFinished: Boolean;
    FIsReceiptRequested: Boolean;
    FIsRecipientSignatureRequested: Boolean;
    FReceiptDocflow: TReceiptDocflow;
    FRecipientSignatureDocflow: TRecipientSignatureDocflow;
    FRecipientSignatureRejectionDocflow: TRecipientSignatureRejectionDocflow;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write FIsFinished; //1;
    property ReceiptDocflow:TReceiptDocflow read FReceiptDocflow; //2;
    property RecipientSignatureDocflow:TRecipientSignatureDocflow read FRecipientSignatureDocflow; //3;
    property RecipientSignatureRejectionDocflow:TRecipientSignatureRejectionDocflow read FRecipientSignatureRejectionDocflow; //4;
    property IsReceiptRequested:Boolean read FIsReceiptRequested write FIsReceiptRequested; //5;
    property IsRecipientSignatureRequested:Boolean read FIsRecipientSignatureRequested write FIsRecipientSignatureRequested; //6;
    property IsDocumentSignedByRecipient:Boolean read FIsDocumentSignedByRecipient write FIsDocumentSignedByRecipient; //7;
    property IsDocumentRejectedByRecipient:Boolean read FIsDocumentRejectedByRecipient write FIsDocumentRejectedByRecipient; //8;
    property CanDocumentBeReceipted:Boolean read FCanDocumentBeReceipted write FCanDocumentBeReceipted; //9;
    property CanDocumentBeSignedBySender:Boolean read FCanDocumentBeSignedBySender write FCanDocumentBeSignedBySender; //10;
    property CanDocumentBeSignedOrRejectedByRecipient:Boolean read FCanDocumentBeSignedOrRejectedByRecipient write FCanDocumentBeSignedOrRejectedByRecipient; //11;
  end;

implementation

{ TBilateralDocflow }

procedure TBilateralDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('ReceiptDocflow', 2);
  RegisterProp('RecipientSignatureDocflow', 3);
  RegisterProp('RecipientSignatureRejectionDocflow', 4);
  RegisterProp('IsReceiptRequested', 5);
  RegisterProp('IsRecipientSignatureRequested', 6);
  RegisterProp('IsDocumentSignedByRecipient', 7);
  RegisterProp('IsDocumentRejectedByRecipient', 8);
  RegisterProp('CanDocumentBeReceipted', 9);
  RegisterProp('CanDocumentBeSignedBySender', 10);
  RegisterProp('CanDocumentBeSignedOrRejectedByRecipient', 11);
end;

procedure TBilateralDocflow.InternalInit;
begin
  inherited InternalInit;
  FReceiptDocflow:=TReceiptDocflow.Create;
  FRecipientSignatureDocflow:=TRecipientSignatureDocflow.Create;
  FRecipientSignatureRejectionDocflow:=TRecipientSignatureRejectionDocflow.Create;
end;

destructor TBilateralDocflow.Destroy;
begin
  FreeAndNil(FReceiptDocflow);
  FreeAndNil(FRecipientSignatureDocflow);
  FreeAndNil(FRecipientSignatureRejectionDocflow);
  inherited Destroy;
end;

end.

