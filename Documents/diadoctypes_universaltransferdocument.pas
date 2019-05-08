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

unit DiadocTypes_UniversalTransferDocument;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc;
type
  (*
  //[Flags] enum InvoiceAmendmentFlags
  //{
  //  None = 0,
  //  AmendmentRequested = 1,
  //  Revised = 2,
  //  Corrected = 4,
  //}
  *)
  TInvoiceAmendmentFlag = (
    None = 0,
    AmendmentRequested = 1,
    Revised = 2,
    Corrected = 4);
  TInvoiceAmendmentFlags = set of TInvoiceAmendmentFlag;


  TUniversalTransferDocumentStatus = (
    UnknownDocumentStatus = 0,	// This type will be reported to legacy client when it receives unknown status from server
    OutboundWaitingForSenderSignature = 1,
    OutboundWaitingForInvoiceReceiptAndRecipientSignature = 2,
    OutboundWaitingForInvoiceReceipt = 3,
    OutboundWaitingForRecipientSignature = 4,
    OutboundWithRecipientSignature = 5,
    OutboundRecipientSignatureRequestRejected = 6,
    OutboundInvalidSenderSignature = 7,
    OutboundNotFinished = 8,
    OutboundFinished = 9,
    InboundWaitingForRecipientSignature = 16,
    InboundWithRecipientSignature = 17,
    InboundRecipientSignatureRequestRejected = 18,
    InboundInvalidRecipientSignature = 19,
    InboundNotFinished = 20,
    InboundFinished = 21
  );

  { TUniversalCorrectionDocumentRevisionMetadata }
  //message UniversalCorrectionDocumentRevisionMetadata {
  //    required UniversalTransferDocument.UniversalTransferDocumentStatus DocumentStatus = 1;
  //    required string TotalInc = 2;
  //    required string TotalDec = 3;
  //    required string VatInc = 4;
  //    required string VatDec = 5;
  //    optional string Grounds = 6; // DocumentGrounds
  //    required string DocumentFunction = 7;
  //    required int32 Currency = 8;
  //    required sfixed64 ConfirmationDateTimeTicks = 9;
  //    required int32 InvoiceAmendmentFlags = 10;
  //    required string OriginalInvoiceNumber = 11;
  //    required string OriginalInvoiceDate = 12;
  //    optional string OriginalInvoiceRevisionNumber = 13;
  //    optional string OriginalInvoiceRevisionDate = 14;
  //    required string OriginalInvoiceCorrectionNumber = 15;
  //    required string OriginalInvoiceCorrectionDate = 16;
  //}
  TUniversalCorrectionDocumentRevisionMetadata = class(TSerializationObject)  //message UniversalCorrectionDocumentRevisionMetadata
  private
    FConfirmationDateTimeTicks: sfixed64;
    FCurrency: int32;
    FDocumentFunction: string;
    FDocumentStatus: TUniversalTransferDocumentStatus;
    FGrounds: string;
    FInvoiceAmendmentFlags: int32;
    FOriginalInvoiceCorrectionDate: string;
    FOriginalInvoiceCorrectionNumber: string;
    FOriginalInvoiceDate: string;
    FOriginalInvoiceNumber: string;
    FOriginalInvoiceRevisionDate: string;
    FOriginalInvoiceRevisionNumber: string;
    FTotalDec: string;
    FTotalInc: string;
    FVatDec: string;
    FVatInc: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property DocumentStatus:TUniversalTransferDocumentStatus read FDocumentStatus write FDocumentStatus;//1;
    property TotalInc:string read FTotalInc write FTotalInc;//2;
    property TotalDec:string read FTotalDec write FTotalDec;//3;
    property VatInc:string read FVatInc write FVatInc;//4;
    property VatDec:string read FVatDec write FVatDec;//5;
    property Grounds:string read FGrounds write FGrounds;// 6; // DocumentGrounds
    property DocumentFunction:string read FDocumentFunction write FDocumentFunction;//7;
    property Currency:int32 read FCurrency write FCurrency;//8;
    property ConfirmationDateTimeTicks:sfixed64 read FConfirmationDateTimeTicks write FConfirmationDateTimeTicks;//9;
    property InvoiceAmendmentFlags:int32 read FInvoiceAmendmentFlags write FInvoiceAmendmentFlags;//10;
    property OriginalInvoiceNumber:string read FOriginalInvoiceNumber write FOriginalInvoiceNumber;//11;
    property OriginalInvoiceDate:string read FOriginalInvoiceDate write FOriginalInvoiceDate;//12;
    property OriginalInvoiceRevisionNumber:string read FOriginalInvoiceRevisionNumber write FOriginalInvoiceRevisionNumber;//13;
    property OriginalInvoiceRevisionDate:string read FOriginalInvoiceRevisionDate write FOriginalInvoiceRevisionDate;//14;
    property OriginalInvoiceCorrectionNumber:string read FOriginalInvoiceCorrectionNumber write FOriginalInvoiceCorrectionNumber;//15;
    property OriginalInvoiceCorrectionDate:string read FOriginalInvoiceCorrectionDate write FOriginalInvoiceCorrectionDate;//16;
  end;


  { TUniversalCorrectionDocumentMetadata }
  //message UniversalCorrectionDocumentMetadata {
  //	required UniversalTransferDocument.UniversalTransferDocumentStatus DocumentStatus = 1;
  //	required string TotalInc = 2;
  //	required string TotalDec = 3;
  //	required string VatInc = 4;
  //	required string VatDec = 5;
  //	optional string Grounds = 6; // DocumentGrounds
  //	required string DocumentFunction = 7;
  //	required int32 Currency = 8;
  //	required sfixed64 ConfirmationDateTimeTicks = 9;
  //	required int32 InvoiceAmendmentFlags = 10;
  //	required string OriginalInvoiceNumber = 11;
  //	required string OriginalInvoiceDate = 12;
  //	optional string OriginalInvoiceRevisionNumber = 13;
  //	optional string OriginalInvoiceRevisionDate = 14;
  //}
  TUniversalCorrectionDocumentMetadata = class(TSerializationObject)  //message UniversalCorrectionDocumentMetadata
  private
    FConfirmationDateTimeTicks: sfixed64;
    FCurrency: int32;
    FDocumentFunction: string;
    FDocumentStatus: TUniversalTransferDocumentStatus;
    FGrounds: string;
    FInvoiceAmendmentFlags: int32;
    FOriginalInvoiceDate: string;
    FOriginalInvoiceNumber: string;
    FOriginalInvoiceRevisionDate: string;
    FOriginalInvoiceRevisionNumber: string;
    FTotalDec: string;
    FTotalInc: string;
    FVatDec: string;
    FVatInc: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property DocumentStatus:TUniversalTransferDocumentStatus read FDocumentStatus write FDocumentStatus;//1;
    property TotalInc:string read FTotalInc write FTotalInc;//2;
    property TotalDec:string read FTotalDec write FTotalDec;//3;
    property VatInc:string read FVatInc write FVatInc;//4;
    property VatDec:string read FVatDec write FVatDec;//5;
    property Grounds:string read FGrounds write FGrounds;//6; // DocumentGrounds
    property DocumentFunction:string read FDocumentFunction write FDocumentFunction;//7;
    property Currency:int32 read FCurrency write FCurrency;//8;
    property ConfirmationDateTimeTicks:sfixed64 read FConfirmationDateTimeTicks write FConfirmationDateTimeTicks;//9;
    property InvoiceAmendmentFlags:int32 read FInvoiceAmendmentFlags write FInvoiceAmendmentFlags;//10;
    property OriginalInvoiceNumber:string read FOriginalInvoiceNumber write FOriginalInvoiceNumber;//11;
    property OriginalInvoiceDate:string read FOriginalInvoiceDate write FOriginalInvoiceDate;//12;
    property OriginalInvoiceRevisionNumber:string read FOriginalInvoiceRevisionNumber write FOriginalInvoiceRevisionNumber;//13;
    property OriginalInvoiceRevisionDate:string read FOriginalInvoiceRevisionDate write FOriginalInvoiceRevisionDate;//14;
  end;

  { TUniversalTransferDocumentRevisionMetadata }
  //message UniversalTransferDocumentRevisionMetadata {
  //	required UniversalTransferDocument.UniversalTransferDocumentStatus DocumentStatus = 1;
  //	required string Total = 2; // TotalSum;
  //	optional string Vat = 3; //TotalVat;
  //	optional string Grounds = 4; // DocumentGrounds
  //	required string DocumentFunction = 5;
  //	required int32 Currency = 6;
  //	optional sfixed64 ConfirmationDateTimeTicks = 7;
  //	required int32 InvoiceAmendmentFlags = 8;
  //	required string OriginalInvoiceNumber = 9;
  //	required string OriginalInvoiceDate = 10;
  //}
  TUniversalTransferDocumentRevisionMetadata = class(TSerializationObject)  //message UniversalTransferDocumentRevisionMetadata
  private
    FConfirmationDateTimeTicks: sfixed64;
    FCurrency: int32;
    FDocumentFunction: string;
    FDocumentStatus: TUniversalTransferDocumentStatus;
    FGrounds: string;
    FInvoiceAmendmentFlags: int32;
    FOriginalInvoiceDate: string;
    FOriginalInvoiceNumber: string;
    FTotal: string;
    FVat: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property DocumentStatus:TUniversalTransferDocumentStatus read FDocumentStatus write FDocumentStatus; //1;
    property Total:string read FTotal write FTotal;//2; // TotalSum;
    property Vat:string read FVat write FVat;//3; //TotalVat;
    property Grounds:string read FGrounds write FGrounds;//4; // DocumentGrounds
    property DocumentFunction:string read FDocumentFunction write FDocumentFunction;//5;
    property Currency:int32 read FCurrency write FCurrency;//6;
    property ConfirmationDateTimeTicks:sfixed64 read FConfirmationDateTimeTicks write FConfirmationDateTimeTicks;//7;
    property InvoiceAmendmentFlags:int32 read FInvoiceAmendmentFlags write FInvoiceAmendmentFlags;//8;
    property OriginalInvoiceNumber:string read FOriginalInvoiceNumber write FOriginalInvoiceNumber;//9;
    property OriginalInvoiceDate:string  read FOriginalInvoiceDate write FOriginalInvoiceDate;//10;
  end;

  { TUniversalTransferDocumentMetadata }
  //message UniversalTransferDocumentMetadata {
  //	optional UniversalTransferDocumentStatus DocumentStatus = 1 [default = UnknownDocumentStatus];
  //	required string Total = 2; // TotalSum;
  //	optional string Vat = 3; //TotalVat;
  //	optional string Grounds = 4; // DocumentGrounds
  //	required string DocumentFunction = 5;
  //	required int32 Currency = 6;
  //	optional sfixed64 ConfirmationDateTimeTicks = 8;
  //	optional int32 InvoiceAmendmentFlags = 9;
  //}
  TUniversalTransferDocumentMetadata = class(TSerializationObject)  //message UniversalTransferDocumentMetadata
  private
    FConfirmationDateTimeTicks: sfixed64;
    FCurrency: int32;
    FDocumentFunction: string;
    FDocumentStatus: TUniversalTransferDocumentStatus;
    FGrounds: string;
    FInvoiceAmendmentFlags: int32;
    FTotal: string;
    FVat: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property DocumentStatus:TUniversalTransferDocumentStatus read FDocumentStatus write FDocumentStatus default UnknownDocumentStatus;//1
    property Total:string read FTotal write FTotal; //2 // TotalSum;
    property Vat:string read FVat  write FVat; //3; //TotalVat;
    property Grounds:string read FGrounds write FGrounds; //4; // DocumentGrounds
    property DocumentFunction:string read FDocumentFunction write FDocumentFunction; //5
    property Currency:int32 read FCurrency write FCurrency; //6
    property ConfirmationDateTimeTicks:sfixed64 read FConfirmationDateTimeTicks write FConfirmationDateTimeTicks; //8
    property InvoiceAmendmentFlags:int32 read FInvoiceAmendmentFlags write FInvoiceAmendmentFlags;//9
  end;

implementation

{ TUniversalCorrectionDocumentRevisionMetadata }

procedure TUniversalCorrectionDocumentRevisionMetadata.InternalInit;
begin
  inherited InternalInit;
end;

procedure TUniversalCorrectionDocumentRevisionMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentStatus', 1);
  RegisterProp('TotalInc', 2);
  RegisterProp('TotalDec', 3);
  RegisterProp('VatInc', 4);
  RegisterProp('VatDec', 5);
  RegisterProp('Grounds', 6);
  RegisterProp('DocumentFunction', 7);
  RegisterProp('Currency', 8);
  RegisterProp('ConfirmationDateTimeTicks', 9);
  RegisterProp('InvoiceAmendmentFlags', 10);
  RegisterProp('OriginalInvoiceNumber', 11);
  RegisterProp('OriginalInvoiceDate', 12);
  RegisterProp('OriginalInvoiceRevisionNumber', 13);
  RegisterProp('OriginalInvoiceRevisionDate', 14);
  RegisterProp('OriginalInvoiceCorrectionNumber', 15);
  RegisterProp('OriginalInvoiceCorrectionDate', 16);
end;

{ TUniversalCorrectionDocumentMetadata }

procedure TUniversalCorrectionDocumentMetadata.InternalInit;
begin
  inherited InternalInit;
end;

procedure TUniversalCorrectionDocumentMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentStatus', 1);
  RegisterProp('TotalInc', 2);
  RegisterProp('TotalDec', 3);
  RegisterProp('VatInc', 4);
  RegisterProp('VatDec', 5);
  RegisterProp('Grounds', 6);
  RegisterProp('DocumentFunction', 7);
  RegisterProp('Currency', 8);
  RegisterProp('ConfirmationDateTimeTicks', 9);
  RegisterProp('InvoiceAmendmentFlags', 10);
  RegisterProp('OriginalInvoiceNumber', 11);
  RegisterProp('OriginalInvoiceDate', 12);
  RegisterProp('OriginalInvoiceRevisionNumber', 13);
  RegisterProp('OriginalInvoiceRevisionDate', 14);
end;

{ TUniversalTransferDocumentRevisionMetadata }

procedure TUniversalTransferDocumentRevisionMetadata.InternalInit;
begin
  inherited InternalInit;
end;

procedure TUniversalTransferDocumentRevisionMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentStatus', 1);
  RegisterProp('Total', 2);
  RegisterProp('Vat', 3);
  RegisterProp('Grounds', 4);
  RegisterProp('DocumentFunction', 5);
  RegisterProp('Currency', 6);
  RegisterProp('ConfirmationDateTimeTicks', 7);
  RegisterProp('InvoiceAmendmentFlags', 8);
  RegisterProp('OriginalInvoiceNumber', 9);
  RegisterProp('OriginalInvoiceDate', 10);
end;

{ TUniversalTransferDocumentMetadata }

procedure TUniversalTransferDocumentMetadata.InternalInit;
begin
  inherited InternalInit;
  DocumentStatus:=UnknownDocumentStatus;
end;

procedure TUniversalTransferDocumentMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentStatus', 1);
  RegisterProp('Total', 2); // TotalSum;
  RegisterProp('Vat', 3); //TotalVat;
  RegisterProp('Grounds', 4); // DocumentGrounds
  RegisterProp('DocumentFunction', 5);
  RegisterProp('Currency', 6);
  RegisterProp('ConfirmationDateTimeTicks', 8);
  RegisterProp('InvoiceAmendmentFlags', 9);
end;
end.

