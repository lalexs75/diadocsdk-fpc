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

unit DiadocTypes_InvoiceDocflow;

{$I diadoc_define.inc}

interface
(*
import "Timestamp.proto";
import "Docflow/Attachment.proto";
import "Docflow/ReceiptDocflow.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Timestamp,
  DiadocTypes_Attachment,
  DiadocTypes_ReceiptDocflow
  ;
type


  { TInvoiceCorrectionRequestDocflow }
  //message InvoiceCorrectionRequestDocflow
  //{
  //	optional bool IsFinished = 1;
  //	optional SignedAttachment CorrectionRequestAttachment = 2;
  //	optional ReceiptDocflow ReceiptDocflow = 3;
  //}
  TInvoiceCorrectionRequestDocflow = class(TSerializationObject) //message InvoiceCorrectionRequestDocflow
  private
    FCorrectionRequestAttachment: TSignedAttachment;
    FIsFinished: Boolean;
    FReceiptDocflow: TReceiptDocflow;
    procedure SetIsFinished(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished; //1;
    property CorrectionRequestAttachment:TSignedAttachment read FCorrectionRequestAttachment; //2;
    property ReceiptDocflow:TReceiptDocflow read FReceiptDocflow; //3;
  end;


  { TInvoiceConfirmationDocflow }
  //message InvoiceConfirmationDocflow
  //{
  //	optional bool IsFinished = 1;
  //	optional SignedAttachment ConfirmationAttachment = 2;
  //	optional ReceiptDocflow ReceiptDocflow = 3;
  //}
  TInvoiceConfirmationDocflow = class(TSerializationObject) //message InvoiceConfirmationDocflow
  private
    FConfirmationAttachment: TSignedAttachment;
    FIsFinished: Boolean;
    FReceiptDocflow: TReceiptDocflow;
    procedure SetIsFinished(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished; //1;
    property ConfirmationAttachment:TSignedAttachment read FConfirmationAttachment; //2;
    property ReceiptDocflow:TReceiptDocflow read FReceiptDocflow; //3;
  end;

  { TInboundInvoiceReceiptDocflow }
  //message InboundInvoiceReceiptDocflow
  //{
  //	optional bool IsFinished = 1;
  //	optional SignedAttachment ReceiptAttachment = 2;
  //	optional InvoiceConfirmationDocflow ConfirmationDocflow = 3;
  //}
  TInboundInvoiceReceiptDocflow = class(TSerializationObject) //message InboundInvoiceReceiptDocflow
  private
    FConfirmationDocflow: TInvoiceConfirmationDocflow;
    FIsFinished: boolean;
    FReceiptAttachment: TSignedAttachment;
    procedure SetIsFinished(AValue: boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:boolean read FIsFinished write SetIsFinished; //1;
    property ReceiptAttachment:TSignedAttachment read FReceiptAttachment; //2;
    property ConfirmationDocflow:TInvoiceConfirmationDocflow read FConfirmationDocflow; //3;
  end;

  { TOutboundInvoiceDocflow }
  //message OutboundInvoiceDocflow
  //{
  //	optional bool IsFinished = 1;
  //	optional ReceiptDocflow ReceiptDocflow = 2;
  //	optional InvoiceConfirmationDocflow ConfirmationDocflow = 3;
  //	optional InvoiceCorrectionRequestDocflow CorrectionRequestDocflow = 4;
  //	optional Timestamp ConfirmationTimestamp = 5;
  //	optional bool IsAmendmentRequested = 6;
  //	optional bool IsRevised = 7;
  //	optional bool IsCorrected = 8;
  //	optional bool CanDocumentBeSignedBySender = 9;
  //}
  TOutboundInvoiceDocflow = class(TSerializationObject) //message OutboundInvoiceDocflow
  private
    FCanDocumentBeSignedBySender: Boolean;
    FConfirmationDocflow: TInvoiceConfirmationDocflow;
    FConfirmationTimestamp: TTimestamp;
    FCorrectionRequestDocflow: TInvoiceCorrectionRequestDocflow;
    FIsAmendmentRequested: Boolean;
    FIsCorrected: Boolean;
    FIsFinished: Boolean;
    FIsRevised: Boolean;
    FReceiptDocflow: TReceiptDocflow;
    procedure SetCanDocumentBeSignedBySender(AValue: Boolean);
    procedure SetIsAmendmentRequested(AValue: Boolean);
    procedure SetIsCorrected(AValue: Boolean);
    procedure SetIsFinished(AValue: Boolean);
    procedure SetIsRevised(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished; //1;
    property ReceiptDocflow:TReceiptDocflow read FReceiptDocflow; //2;
    property ConfirmationDocflow:TInvoiceConfirmationDocflow read FConfirmationDocflow; //3;
    property CorrectionRequestDocflow:TInvoiceCorrectionRequestDocflow read FCorrectionRequestDocflow; //4;
    property ConfirmationTimestamp:TTimestamp read FConfirmationTimestamp; //5;
    property IsAmendmentRequested:Boolean read FIsAmendmentRequested write SetIsAmendmentRequested; //6;
    property IsRevised:Boolean read FIsRevised write SetIsRevised; //7;
    property IsCorrected:Boolean read FIsCorrected write SetIsCorrected; //8;
    property CanDocumentBeSignedBySender:Boolean read FCanDocumentBeSignedBySender write SetCanDocumentBeSignedBySender; //9;
  end;


  { TInboundInvoiceDocflow }
  //message InboundInvoiceDocflow
  //{
  //	optional bool IsFinished = 1;
  //	optional InboundInvoiceReceiptDocflow ReceiptDocflow = 2;
  //	optional InvoiceConfirmationDocflow ConfirmationDocflow = 3;
  //	optional InvoiceCorrectionRequestDocflow CorrectionRequestDocflow = 4;
  //	optional Timestamp ConfirmationTimestamp = 5;
  //	optional bool IsAmendmentRequested = 6;
  //	optional bool IsRevised = 7;
  //	optional bool IsCorrected = 8;
  //}
  TInboundInvoiceDocflow = class(TSerializationObject) //message InboundInvoiceDocflow
  private
    FConfirmationDocflow: TInvoiceConfirmationDocflow;
    FConfirmationTimestamp: TTimestamp;
    FCorrectionRequestDocflow: TInvoiceCorrectionRequestDocflow;
    FIsAmendmentRequested: Boolean;
    FIsCorrected: Boolean;
    FIsFinished: Boolean;
    FIsRevised: Boolean;
    FReceiptDocflow: TInboundInvoiceReceiptDocflow;
    procedure SetIsAmendmentRequested(AValue: Boolean);
    procedure SetIsCorrected(AValue: Boolean);
    procedure SetIsFinished(AValue: Boolean);
    procedure SetIsRevised(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished; //1;
    property ReceiptDocflow:TInboundInvoiceReceiptDocflow read FReceiptDocflow; //2;
    property ConfirmationDocflow:TInvoiceConfirmationDocflow read FConfirmationDocflow; //3;
    property CorrectionRequestDocflow:TInvoiceCorrectionRequestDocflow read FCorrectionRequestDocflow; //4;
    property ConfirmationTimestamp:TTimestamp read FConfirmationTimestamp; //5;
    property IsAmendmentRequested:Boolean read FIsAmendmentRequested write SetIsAmendmentRequested; //6;
    property IsRevised:Boolean read FIsRevised write SetIsRevised; //7;
    property IsCorrected:Boolean read FIsCorrected write SetIsCorrected; //8;
  end;

implementation

{ TInvoiceCorrectionRequestDocflow }

procedure TInvoiceCorrectionRequestDocflow.SetIsFinished(AValue: Boolean);
begin
  if FIsFinished=AValue then Exit;
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TInvoiceCorrectionRequestDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('CorrectionRequestAttachment', 2);
  RegisterProp('ReceiptDocflow', 3);
end;

procedure TInvoiceCorrectionRequestDocflow.InternalInit;
begin
  inherited InternalInit;
  FCorrectionRequestAttachment:=TSignedAttachment.Create;
  FReceiptDocflow:=TReceiptDocflow.Create;
end;

destructor TInvoiceCorrectionRequestDocflow.Destroy;
begin
  FreeAndNil(FCorrectionRequestAttachment);
  FreeAndNil(FReceiptDocflow);
  inherited Destroy;
end;

{ TInboundInvoiceReceiptDocflow }

procedure TInboundInvoiceReceiptDocflow.SetIsFinished(AValue: boolean);
begin
  if FIsFinished=AValue then Exit;
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TInboundInvoiceReceiptDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('ReceiptAttachment', 2);
  RegisterProp('ConfirmationDocflow', 3);
end;

procedure TInboundInvoiceReceiptDocflow.InternalInit;
begin
  inherited InternalInit;
  FReceiptAttachment:=TSignedAttachment.Create;
  FConfirmationDocflow:=TInvoiceConfirmationDocflow.Create;
end;

destructor TInboundInvoiceReceiptDocflow.Destroy;
begin
  FreeAndNil(FReceiptAttachment);
  FreeAndNil(FConfirmationDocflow);
  inherited Destroy;
end;

{ TInvoiceConfirmationDocflow }

procedure TInvoiceConfirmationDocflow.SetIsFinished(AValue: Boolean);
begin
  if FIsFinished=AValue then Exit;
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TInvoiceConfirmationDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('ConfirmationAttachment', 2);
  RegisterProp('ReceiptDocflow', 3);
end;

procedure TInvoiceConfirmationDocflow.InternalInit;
begin
  inherited InternalInit;
  FConfirmationAttachment:=TSignedAttachment.Create;
  FReceiptDocflow:=TReceiptDocflow.Create;
end;

destructor TInvoiceConfirmationDocflow.Destroy;
begin
  FreeAndNil(FConfirmationAttachment);
  FreeAndNil(FReceiptDocflow);
  inherited Destroy;
end;

{ TOutboundInvoiceDocflow }

procedure TOutboundInvoiceDocflow.SetIsFinished(AValue: Boolean);
begin
  if FIsFinished=AValue then Exit;
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TOutboundInvoiceDocflow.SetCanDocumentBeSignedBySender(AValue: Boolean
  );
begin
  if FCanDocumentBeSignedBySender=AValue then Exit;
  FCanDocumentBeSignedBySender:=AValue;
  Modified(9);
end;

procedure TOutboundInvoiceDocflow.SetIsAmendmentRequested(AValue: Boolean);
begin
  if FIsAmendmentRequested=AValue then Exit;
  FIsAmendmentRequested:=AValue;
  Modified(6);
end;

procedure TOutboundInvoiceDocflow.SetIsCorrected(AValue: Boolean);
begin
  if FIsCorrected=AValue then Exit;
  FIsCorrected:=AValue;
  Modified(8);
end;

procedure TOutboundInvoiceDocflow.SetIsRevised(AValue: Boolean);
begin
  if FIsRevised=AValue then Exit;
  FIsRevised:=AValue;
  Modified(7);
end;

procedure TOutboundInvoiceDocflow.InternalRegisterProperty;
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
end;

procedure TOutboundInvoiceDocflow.InternalInit;
begin
  inherited InternalInit;
  FReceiptDocflow:=TReceiptDocflow.Create;
  FConfirmationDocflow:=TInvoiceConfirmationDocflow.Create;
  FCorrectionRequestDocflow:=TInvoiceCorrectionRequestDocflow.Create;
  FConfirmationTimestamp:=TTimestamp.Create;
end;

destructor TOutboundInvoiceDocflow.Destroy;
begin
  FreeAndNil(FReceiptDocflow);
  FreeAndNil(FConfirmationDocflow);
  FreeAndNil(FCorrectionRequestDocflow);
  FreeAndNil(FConfirmationTimestamp);
  inherited Destroy;
end;

{ TInboundInvoiceDocflow }

procedure TInboundInvoiceDocflow.SetIsAmendmentRequested(AValue: Boolean);
begin
  if FIsAmendmentRequested=AValue then Exit;
  FIsAmendmentRequested:=AValue;
  Modified(6);
end;

procedure TInboundInvoiceDocflow.SetIsCorrected(AValue: Boolean);
begin
  if FIsCorrected=AValue then Exit;
  FIsCorrected:=AValue;
  Modified(8);
end;

procedure TInboundInvoiceDocflow.SetIsFinished(AValue: Boolean);
begin
  if FIsFinished=AValue then Exit;
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TInboundInvoiceDocflow.SetIsRevised(AValue: Boolean);
begin
  if FIsRevised=AValue then Exit;
  FIsRevised:=AValue;
  Modified(7);
end;

procedure TInboundInvoiceDocflow.InternalRegisterProperty;
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
end;

procedure TInboundInvoiceDocflow.InternalInit;
begin
  inherited InternalInit;
  FReceiptDocflow:=TInboundInvoiceReceiptDocflow.Create;
  FConfirmationDocflow:=TInvoiceConfirmationDocflow.Create;
  FCorrectionRequestDocflow:=TInvoiceCorrectionRequestDocflow.Create;
  FConfirmationTimestamp:=TTimestamp.Create;
end;

destructor TInboundInvoiceDocflow.Destroy;
begin
  FreeAndNil(FReceiptDocflow);
  FreeAndNil(FConfirmationDocflow);
  FreeAndNil(FCorrectionRequestDocflow);
  FreeAndNil(FConfirmationTimestamp);
  inherited Destroy;
end;

end.

