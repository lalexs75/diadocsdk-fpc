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

unit DiadocTypes_UniversalTransferDocumentDocflow;

{$I diadoc_define.inc}

interface
(*
import "Timestamp.proto";
import "Docflow/Attachment.proto";
import "Docflow/ReceiptDocflow.proto";
import "Docflow/XmlBilateralDocflow.proto";
import "Docflow/RecipientSignatureRejectionDocflow.proto";
import "Docflow/InvoiceDocflow.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Timestamp,
  DiadocTypes_Attachment,
  DiadocTypes_ReceiptDocflow,
  DiadocTypes_XmlBilateralDocflow,
  DiadocTypes_RecipientSignatureRejectionDocflow,
  DiadocTypes_InvoiceDocflow;

type


  { TInboundUniversalTransferDocumentDocflow }

  //message InboundUniversalTransferDocumentDocflow
  //{
  //  optional bool IsFinished = 1;
  //  optional InboundInvoiceReceiptDocflow ReceiptDocflow = 2;
  //  optional InvoiceConfirmationDocflow ConfirmationDocflow = 3;
  //  optional InvoiceCorrectionRequestDocflow CorrectionRequestDocflow = 4;
  //  optional Timestamp ConfirmationTimestamp = 5;
  //  optional bool IsAmendmentRequested = 6;
  //  optional bool IsRevised = 7;
  //  optional bool IsCorrected = 8;
  //  optional BuyerTitleDocflow BuyerTitleDocflow = 9;
  //  optional RecipientSignatureRejectionDocflow RecipientSignatureRejectionDocflow = 10;
  //  optional bool IsReceiptRequested = 11;
  //  optional bool IsRecipientSignatureRequested = 12;
  //  optional bool IsDocumentSignedByRecipient = 13;
  //  optional bool IsDocumentRejectedByRecipient = 14;
  //  optional bool CanDocumentBeReceipted = 15;
  //  optional bool CanDocumentBeSignedOrRejectedByRecipient = 16;
  //}
  TInboundUniversalTransferDocumentDocflow  = class(TSerializationObject) //message InboundUniversalTransferDocumentDocflow
  private
    FBuyerTitleDocflow: TBuyerTitleDocflow;
    FCanDocumentBeReceipted: Boolean;
    FCanDocumentBeSignedOrRejectedByRecipient: Boolean;
    FConfirmationDocflow: TInvoiceConfirmationDocflow;
    FConfirmationTimestamp: TTimestamp;
    FCorrectionRequestDocflow: TInvoiceCorrectionRequestDocflow;
    FIsAmendmentRequested: Boolean;
    FIsCorrected: Boolean;
    FIsDocumentRejectedByRecipient: Boolean;
    FIsDocumentSignedByRecipient: Boolean;
    FIsFinished: Boolean;
    FIsReceiptRequested: Boolean;
    FIsRecipientSignatureRequested: Boolean;
    FIsRevised: Boolean;
    FReceiptDocflow: TInboundInvoiceReceiptDocflow;
    FRecipientSignatureRejectionDocflow: TRecipientSignatureRejectionDocflow;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write FIsFinished;//1;
    property ReceiptDocflow:TInboundInvoiceReceiptDocflow read FReceiptDocflow; //2;
    property ConfirmationDocflow:TInvoiceConfirmationDocflow read FConfirmationDocflow; //3;
    property CorrectionRequestDocflow:TInvoiceCorrectionRequestDocflow read FCorrectionRequestDocflow; //4;
    property ConfirmationTimestamp:TTimestamp read FConfirmationTimestamp; //5;
    property IsAmendmentRequested:Boolean read FIsAmendmentRequested write FIsAmendmentRequested;//6;
    property IsRevised:Boolean read FIsRevised write FIsRevised;//7;
    property IsCorrected:Boolean read FIsCorrected write FIsCorrected;//8;
    property BuyerTitleDocflow:TBuyerTitleDocflow read FBuyerTitleDocflow; //9;
    property RecipientSignatureRejectionDocflow:TRecipientSignatureRejectionDocflow read FRecipientSignatureRejectionDocflow; //10;
    property IsReceiptRequested:Boolean read FIsReceiptRequested write FIsReceiptRequested;//11;
    property IsRecipientSignatureRequested:Boolean read FIsRecipientSignatureRequested write FIsRecipientSignatureRequested;//12;
    property IsDocumentSignedByRecipient:Boolean read FIsDocumentSignedByRecipient write FIsDocumentSignedByRecipient;//13;
    property IsDocumentRejectedByRecipient:Boolean read FIsDocumentRejectedByRecipient write FIsDocumentRejectedByRecipient;//14;
    property CanDocumentBeReceipted:Boolean read FCanDocumentBeReceipted write FCanDocumentBeReceipted;//15;
    property CanDocumentBeSignedOrRejectedByRecipient:Boolean read FCanDocumentBeSignedOrRejectedByRecipient write FCanDocumentBeSignedOrRejectedByRecipient;//16;
  end;


  { TOutboundUniversalTransferDocumentDocflow }

  //message OutboundUniversalTransferDocumentDocflow
  //{
  //  optional bool IsFinished = 1;
  //  optional ReceiptDocflow ReceiptDocflow = 2;
  //  optional InvoiceConfirmationDocflow ConfirmationDocflow = 3;
  //  optional InvoiceCorrectionRequestDocflow CorrectionRequestDocflow = 4;
  //  optional Timestamp ConfirmationTimestamp = 5;
  //  optional bool IsAmendmentRequested = 6;
  //  optional bool IsRevised = 7;
  //  optional bool IsCorrected = 8;
  //  optional bool CanDocumentBeSignedBySender = 9;
  //  optional BuyerTitleDocflow BuyerTitleDocflow = 10;
  //  optional RecipientSignatureRejectionDocflow RecipientSignatureRejectionDocflow = 11;
  //  optional bool IsReceiptRequested = 12;
  //  optional bool IsRecipientSignatureRequested = 13;
  //  optional bool IsDocumentSignedByRecipient = 14;
  //  optional bool IsDocumentRejectedByRecipient = 15;
  //  optional bool CanDocumentBeReceipted = 16;
  //  optional bool CanDocumentBeSignedOrRejectedByRecipient = 17;
  //}
  TOutboundUniversalTransferDocumentDocflow  = class(TSerializationObject) //message OutboundUniversalTransferDocumentDocflow
  private
    FBuyerTitleDocflow: TBuyerTitleDocflow;
    FCanDocumentBeReceipted: Boolean;
    FCanDocumentBeSignedBySender: Boolean;
    FCanDocumentBeSignedOrRejectedByRecipient: Boolean;
    FConfirmationDocflow: TInvoiceConfirmationDocflow;
    FConfirmationTimestamp: TTimestamp;
    FCorrectionRequestDocflow: TInvoiceCorrectionRequestDocflow;
    FIsAmendmentRequested: Boolean;
    FIsCorrected: Boolean;
    FIsDocumentRejectedByRecipient: Boolean;
    FIsDocumentSignedByRecipient: Boolean;
    FIsFinished: Boolean;
    FIsReceiptRequested: Boolean;
    FIsRecipientSignatureRequested: Boolean;
    FIsRevised: Boolean;
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
    property ConfirmationDocflow:TInvoiceConfirmationDocflow read FConfirmationDocflow; //3;
    property CorrectionRequestDocflow:TInvoiceCorrectionRequestDocflow read FCorrectionRequestDocflow; //4;
    property ConfirmationTimestamp:TTimestamp read FConfirmationTimestamp; //5;
    property IsAmendmentRequested:Boolean read FIsAmendmentRequested write FIsAmendmentRequested; //6;
    property IsRevised:Boolean read FIsRevised write FIsRevised; //7;
    property IsCorrected:Boolean read FIsCorrected write FIsCorrected; //8;
    property CanDocumentBeSignedBySender:Boolean read FCanDocumentBeSignedBySender write FCanDocumentBeSignedBySender; //9;
    property BuyerTitleDocflow:TBuyerTitleDocflow read FBuyerTitleDocflow; //10;
    property RecipientSignatureRejectionDocflow:TRecipientSignatureRejectionDocflow read FRecipientSignatureRejectionDocflow; //11;
    property IsReceiptRequested:Boolean read FIsReceiptRequested write FIsReceiptRequested; //12;
    property IsRecipientSignatureRequested:Boolean read FIsRecipientSignatureRequested write FIsRecipientSignatureRequested; //13;
    property IsDocumentSignedByRecipient:Boolean read FIsDocumentSignedByRecipient write FIsDocumentSignedByRecipient; //14;
    property IsDocumentRejectedByRecipient:Boolean read FIsDocumentRejectedByRecipient write FIsDocumentRejectedByRecipient; //15;
    property CanDocumentBeReceipted:Boolean read FCanDocumentBeReceipted write FCanDocumentBeReceipted; //16;
    property CanDocumentBeSignedOrRejectedByRecipient:Boolean read FCanDocumentBeSignedOrRejectedByRecipient write FCanDocumentBeSignedOrRejectedByRecipient; //17;
  end;

implementation

{ TOutboundUniversalTransferDocumentDocflow }

procedure TOutboundUniversalTransferDocumentDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('ReceiptDocflow', 2);
  RegisterProp('ConfirmationDocflow', 3);
  RegisterProp('CorrectionRequestDocflow', 4);
  RegisterProp('ConfirmationTimestamp', 5);
  RegisterProp('IsAmendmentRequested', 6);
  RegisterProp('IsRevised', 7);
  RegisterProp('IsCorrected', 8);
  RegisterProp('CanDocumentBeSignedBySender', 9);
  RegisterProp('BuyerTitleDocflow', 10);
  RegisterProp('RecipientSignatureRejectionDocflow', 11);
  RegisterProp('IsReceiptRequested', 12);
  RegisterProp('IsRecipientSignatureRequested', 13);
  RegisterProp('IsDocumentSignedByRecipient', 14);
  RegisterProp('IsDocumentRejectedByRecipient', 15);
  RegisterProp('CanDocumentBeReceipted', 16);
  RegisterProp('CanDocumentBeSignedOrRejectedByRecipient', 17);
end;

procedure TOutboundUniversalTransferDocumentDocflow.InternalInit;
begin
  inherited InternalInit;
  FReceiptDocflow:=TReceiptDocflow.Create;
  FConfirmationDocflow:=TInvoiceConfirmationDocflow.Create;
  FCorrectionRequestDocflow:=TInvoiceCorrectionRequestDocflow.Create;
  FConfirmationTimestamp:=TTimestamp.Create;
  FBuyerTitleDocflow:=TBuyerTitleDocflow.Create;
  FRecipientSignatureRejectionDocflow:=TRecipientSignatureRejectionDocflow.Create;
end;

destructor TOutboundUniversalTransferDocumentDocflow.Destroy;
begin
  FreeAndNil(FReceiptDocflow);
  FreeAndNil(FConfirmationDocflow);
  FreeAndNil(FCorrectionRequestDocflow);
  FreeAndNil(FConfirmationTimestamp);
  FreeAndNil(FBuyerTitleDocflow);
  FreeAndNil(FRecipientSignatureRejectionDocflow);
  inherited Destroy;
end;

{ TInboundUniversalTransferDocumentDocflow }

procedure TInboundUniversalTransferDocumentDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('ReceiptDocflow', 2);
  RegisterProp('ConfirmationDocflow', 3);
  RegisterProp('CorrectionRequestDocflow', 4);
  RegisterProp('ConfirmationTimestamp', 5);
  RegisterProp('IsAmendmentRequested', 6);
  RegisterProp('IsRevised', 7);
  RegisterProp('IsCorrected', 8);
  RegisterProp('BuyerTitleDocflow', 9);
  RegisterProp('RecipientSignatureRejectionDocflow', 10);
  RegisterProp('IsReceiptRequested', 11);
  RegisterProp('IsRecipientSignatureRequested', 12);
  RegisterProp('IsDocumentSignedByRecipient', 13);
  RegisterProp('IsDocumentRejectedByRecipient', 14);
  RegisterProp('CanDocumentBeReceipted', 15);
  RegisterProp('CanDocumentBeSignedOrRejectedByRecipient', 16);
end;

procedure TInboundUniversalTransferDocumentDocflow.InternalInit;
begin
  inherited InternalInit;
  FReceiptDocflow:=TInboundInvoiceReceiptDocflow.Create;
  FConfirmationDocflow:=TInvoiceConfirmationDocflow.Create;
  FCorrectionRequestDocflow:=TInvoiceCorrectionRequestDocflow.Create;
  FConfirmationTimestamp:=TTimestamp.Create;
  FBuyerTitleDocflow:=TBuyerTitleDocflow.Create;
  FRecipientSignatureRejectionDocflow:=TRecipientSignatureRejectionDocflow.Create;
end;

destructor TInboundUniversalTransferDocumentDocflow.Destroy;
begin
  FreeAndNil(FReceiptDocflow);
  FreeAndNil(FConfirmationDocflow);
  FreeAndNil(FCorrectionRequestDocflow);
  FreeAndNil(FConfirmationTimestamp);
  FreeAndNil(FBuyerTitleDocflow);
  FreeAndNil(FRecipientSignatureRejectionDocflow);
  inherited Destroy;
end;

end.

