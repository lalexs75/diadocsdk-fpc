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

unit DiadocTypes_AcceptanceCertificateDocument;

{$I diadoc_define.inc}

interface

//import "Documents/ReceiptStatus.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_ReceiptStatus
  ;

type
  TAcceptanceCertificateDocumentStatus = (
    UnknownAcceptanceCertificateDocumentStatus = 0, // Reserved status to report to legacy clients for newly introduced statuses
    OutboundWaitingForRecipientSignature = 1,
    OutboundWithRecipientSignature = 2,
    OutboundRecipientSignatureRequestRejected = 3,
    OutboundWaitingForSenderSignature = 10,
    OutboundInvalidSenderSignature = 11,
    OutboundNoRecipientSignatureRequest = 16,
    InboundWaitingForRecipientSignature = 4,
    InboundWithRecipientSignature = 5,
    InboundRecipientSignatureRequestRejected = 6,
    InboundInvalidRecipientSignature = 12,
    InboundNoRecipientSignatureRequest = 17,
    InternalWaitingForRecipientSignature = 7,
    InternalWithRecipientSignature = 8,
    InternalRecipientSignatureRequestRejected = 9,
    InternalWaitingForSenderSignature = 13,
    InternalInvalidSenderSignature = 14,
    InternalInvalidRecipientSignature = 15,
    InternalNoRecipientSignatureRequest = 18
  );

  { TAcceptanceCertificateMetadata }
  //message AcceptanceCertificateMetadata {
  //	optional AcceptanceCertificateDocumentStatus DocumentStatus = 1 [default = UnknownAcceptanceCertificateDocumentStatus];
  //	required string Total = 2;
  //	optional string Vat = 3;
  //	optional string Grounds = 4;
  //	optional ReceiptStatus ReceiptStatus = 5 [default = UnknownReceiptStatus];
  //}
  TAcceptanceCertificateMetadata = class(TSerializationObject)  //message AcceptanceCertificateMetadata
  private
    FDocumentStatus: TAcceptanceCertificateDocumentStatus;
    FGrounds: string;
    FReceiptStatus: TReceiptStatus;
    FTotal: string;
    FVat: string;
    procedure SetDocumentStatus(AValue: TAcceptanceCertificateDocumentStatus);
    procedure SetGrounds(AValue: string);
    procedure SetReceiptStatus(AValue: TReceiptStatus);
    procedure SetTotal(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property DocumentStatus:TAcceptanceCertificateDocumentStatus read FDocumentStatus write SetDocumentStatus default UnknownAcceptanceCertificateDocumentStatus;//1
    property Total:string read FTotal write SetTotal;       //2
    property Vat:string read FVat write SetVat;             //3
    property Grounds:string read FGrounds write SetGrounds; //4
    property ReceiptStatus:TReceiptStatus read FReceiptStatus write SetReceiptStatus default UnknownReceiptStatus;//5
  end;



implementation

{ TAcceptanceCertificateMetadata }

procedure TAcceptanceCertificateMetadata.SetDocumentStatus(
  AValue: TAcceptanceCertificateDocumentStatus);
begin
  if FDocumentStatus=AValue then Exit;
  FDocumentStatus:=AValue;
  Modified(1);
end;

procedure TAcceptanceCertificateMetadata.SetGrounds(AValue: string);
begin
  if FGrounds=AValue then Exit;
  FGrounds:=AValue;
  Modified(4);
end;

procedure TAcceptanceCertificateMetadata.SetReceiptStatus(AValue: TReceiptStatus
  );
begin
  if FReceiptStatus=AValue then Exit;
  FReceiptStatus:=AValue;
  Modified(5);
end;

procedure TAcceptanceCertificateMetadata.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(2);
end;

procedure TAcceptanceCertificateMetadata.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(3);
end;

procedure TAcceptanceCertificateMetadata.InternalInit;
begin
  inherited InternalInit;
  DocumentStatus:=UnknownAcceptanceCertificateDocumentStatus;
  ReceiptStatus:=UnknownReceiptStatus;
end;

procedure TAcceptanceCertificateMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentStatus', 1);
  RegisterProp('Total', 2, true);
  RegisterProp('Vat', 3);
  RegisterProp('Grounds', 4);
  RegisterProp('ReceiptStatus', 5);
end;
end.

