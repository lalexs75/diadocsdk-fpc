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

unit DiadocTypes_XmlBilateralDocflow;

{$I diadoc_define.inc}

interface
(*
import "Timestamp.proto";
import "Docflow/Attachment.proto";
import "Docflow/ReceiptDocflow.proto";
import "Docflow/RecipientSignatureRejectionDocflow.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Timestamp,
  DiadocTypes_Attachment,
  DiadocTypes_ReceiptDocflow,
  DiadocTypes_RecipientSignatureRejectionDocflow;
type


  { TBuyerTitleDocflow }
  //message BuyerTitleDocflow
  //{
  //	optional bool IsFinished = 1;
  //	optional SignedAttachment BuyerTitleAttachment = 2;
  //	optional Timestamp SendTimestamp = 3;
  //	optional Timestamp DeliveryTimestamp = 4;
  //}
  TBuyerTitleDocflow = class(TSerializationObject) //message BuyerTitleDocflow
  private
    FBuyerTitleAttachment: TSignedAttachment;
    FDeliveryTimestamp: TTimestamp;
    FIsFinished: Boolean;
    FSendTimestamp: TTimestamp;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write FIsFinished; //1;
    property BuyerTitleAttachment:TSignedAttachment read FBuyerTitleAttachment; //2;
    property SendTimestamp:TTimestamp read FSendTimestamp; //3;
    property DeliveryTimestamp:TTimestamp read FDeliveryTimestamp; //4;
  end;

  { TXmlBilateralDocflow }
  //message XmlBilateralDocflow
  //{
  //	optional bool IsFinished = 1;
  //	optional ReceiptDocflow ReceiptDocflow = 2;
  //	optional BuyerTitleDocflow BuyerTitleDocflow = 3;
  //	optional RecipientSignatureRejectionDocflow RecipientSignatureRejectionDocflow = 4;
  //	optional bool IsReceiptRequested = 5;
  //	optional bool IsDocumentSignedByRecipient = 6;
  //	optional bool IsDocumentRejectedByRecipient = 7;
  //	optional bool CanDocumentBeReceipted = 8;
  //	optional bool CanDocumentBeSignedBySender = 9;
  //	optional bool CanDocumentBeSignedOrRejectedByRecipient = 10;
  //}
  TXmlBilateralDocflow = class(TSerializationObject) //message XmlBilateralDocflow
  private
    FBuyerTitleDocflow: TBuyerTitleDocflow;
    FCanDocumentBeReceipted: Boolean;
    FCanDocumentBeSignedBySender: Boolean;
    FCanDocumentBeSignedOrRejectedByRecipient: Boolean;
    FIsDocumentRejectedByRecipient: Boolean;
    FIsDocumentSignedByRecipient: Boolean;
    FIsFinished: Boolean;
    FIsReceiptRequested: Boolean;
    FReceiptDocflow: TReceiptDocflow;
    FRecipientSignatureRejectionDocflow: TRecipientSignatureRejectionDocflow;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write FIsFinished; //1;
    property ReceiptDocflow:TReceiptDocflow read FReceiptDocflow; //2;
    property BuyerTitleDocflow:TBuyerTitleDocflow read FBuyerTitleDocflow; //3;
    property RecipientSignatureRejectionDocflow:TRecipientSignatureRejectionDocflow read FRecipientSignatureRejectionDocflow; //4;
    property IsReceiptRequested:Boolean read FIsReceiptRequested write FIsReceiptRequested; //5;
    property IsDocumentSignedByRecipient:Boolean read FIsDocumentSignedByRecipient write FIsDocumentSignedByRecipient; //6;
    property IsDocumentRejectedByRecipient:Boolean read FIsDocumentRejectedByRecipient write FIsDocumentRejectedByRecipient; //7;
    property CanDocumentBeReceipted:Boolean read FCanDocumentBeReceipted write FCanDocumentBeReceipted; //8;
    property CanDocumentBeSignedBySender:Boolean read FCanDocumentBeSignedBySender write FCanDocumentBeSignedBySender; //9;
    property CanDocumentBeSignedOrRejectedByRecipient:Boolean read FCanDocumentBeSignedOrRejectedByRecipient write FCanDocumentBeSignedOrRejectedByRecipient; //10;
  end;

implementation

{ TXmlBilateralDocflow }

procedure TXmlBilateralDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('ReceiptDocflow', 2);
  RegisterProp('BuyerTitleDocflow', 3);
  RegisterProp('RecipientSignatureRejectionDocflow', 4);
  RegisterProp('IsReceiptRequested', 5);
  RegisterProp('IsDocumentSignedByRecipient', 6);
  RegisterProp('IsDocumentRejectedByRecipient', 7);
  RegisterProp('CanDocumentBeReceipted', 8);
  RegisterProp('CanDocumentBeSignedBySender', 9);
  RegisterProp('CanDocumentBeSignedOrRejectedByRecipient', 10);
end;

procedure TXmlBilateralDocflow.InternalInit;
begin
  inherited InternalInit;
  FReceiptDocflow:=TReceiptDocflow.Create;
  FBuyerTitleDocflow:=TBuyerTitleDocflow.Create;
  FRecipientSignatureRejectionDocflow:=TRecipientSignatureRejectionDocflow.Create;
end;

destructor TXmlBilateralDocflow.Destroy;
begin
  FreeAndNil(FReceiptDocflow);
  FreeAndNil(FBuyerTitleDocflow);
  FreeAndNil(FRecipientSignatureRejectionDocflow);
  inherited Destroy;
end;

{ TBuyerTitleDocflow }

procedure TBuyerTitleDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('BuyerTitleAttachment', 2);
  RegisterProp('SendTimestamp', 3);
  RegisterProp('DeliveryTimestamp', 4);
end;

procedure TBuyerTitleDocflow.InternalInit;
begin
  inherited InternalInit;
  FBuyerTitleAttachment:=TSignedAttachment.Create;
  FSendTimestamp:=TTimestamp.Create;
  FDeliveryTimestamp:=TTimestamp.Create;
end;

destructor TBuyerTitleDocflow.Destroy;
begin
  FreeAndNil(FBuyerTitleAttachment);
  FreeAndNil(FSendTimestamp);
  FreeAndNil(FDeliveryTimestamp);
  inherited Destroy;
end;
end.

