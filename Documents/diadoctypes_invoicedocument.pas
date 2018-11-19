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

unit DiadocTypes_InvoiceDocument;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc;
type
  TInvoiceStatus = (
    UnknownInvoiceStatus = 0, /// This type will be reported to legacy client when it receives unknown status from server
    OutboundWaitingForInvoiceReceipt = 1,
    OutboundNotFinished = 2,
    OutboundFinished = 3,
    OutboundWaitingForSenderSignature = 6,
    OutboundInvalidSenderSignature = 7,
    InboundNotFinished = 4,
    InboundFinished = 5
  );


  { TInvoiceCorrectionRevisionMetadata }
  //message InvoiceCorrectionRevisionMetadata {
  //	optional InvoiceStatus InvoiceCorrectionRevisionStatus = 1 [default = UnknownInvoiceStatus];
  //	required string OriginalInvoiceNumber = 2;
  //	required string OriginalInvoiceDate = 3;
  //	optional string OriginalInvoiceRevisionNumber = 4;
  //	optional string OriginalInvoiceRevisionDate = 5;
  //	required string OriginalInvoiceCorrectionNumber = 6;
  //	required string OriginalInvoiceCorrectionDate = 7;
  //	required string TotalInc = 8;
  //	required string TotalDec = 9;
  //	required string VatInc = 10;
  //	required string VatDec = 11;
  //	required int32 Currency = 12;
  //	required sfixed64 ConfirmationDateTimeTicks = 13;
  //	required int32 InvoiceAmendmentFlags = 14;
  //}
  TInvoiceCorrectionRevisionMetadata = class(TSerializationObject)  //message InvoiceCorrectionRevisionMetadata
  private
    FConfirmationDateTimeTicks: sfixed64;
    FCurrency: int32;
    FInvoiceAmendmentFlags: int32;
    FInvoiceCorrectionRevisionStatus: TInvoiceStatus;
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
    property InvoiceCorrectionRevisionStatus:TInvoiceStatus read FInvoiceCorrectionRevisionStatus write FInvoiceCorrectionRevisionStatus default UnknownInvoiceStatus; //1
    property OriginalInvoiceNumber:string read FOriginalInvoiceNumber write FOriginalInvoiceNumber;                               //2
    property OriginalInvoiceDate:string read FOriginalInvoiceDate write FOriginalInvoiceDate;                                     //3
    property OriginalInvoiceRevisionNumber:string read FOriginalInvoiceRevisionNumber write FOriginalInvoiceRevisionNumber;       //4
    property OriginalInvoiceRevisionDate:string read FOriginalInvoiceRevisionDate write FOriginalInvoiceRevisionDate;             //5
    property OriginalInvoiceCorrectionNumber:string read FOriginalInvoiceCorrectionNumber write FOriginalInvoiceCorrectionNumber; //6
    property OriginalInvoiceCorrectionDate:string read FOriginalInvoiceCorrectionDate write FOriginalInvoiceCorrectionDate;       //7
    property TotalInc:string read FTotalInc write FTotalInc;                                                                      //8
    property TotalDec:string read FTotalDec write FTotalDec;                                                                       //9
    property VatInc:string read FVatInc write FVatInc;                                                                            //10
    property VatDec:string read FVatDec write FVatDec;                                                                            //11
    property Currency:int32 read FCurrency write FCurrency;                                                                       //12
    property ConfirmationDateTimeTicks:sfixed64 read FConfirmationDateTimeTicks write FConfirmationDateTimeTicks;                 //13
    property InvoiceAmendmentFlags:int32 read FInvoiceAmendmentFlags write FInvoiceAmendmentFlags;                                //14
  end;

  { TInvoiceCorrectionMetadata }
  //message InvoiceCorrectionMetadata {
  //	optional InvoiceStatus InvoiceCorrectionStatus = 1 [default = UnknownInvoiceStatus];
  //	required string OriginalInvoiceNumber = 2;
  //	required string OriginalInvoiceDate = 3;
  //	optional string OriginalInvoiceRevisionNumber = 4;
  //	optional string OriginalInvoiceRevisionDate = 5;
  //	required string TotalInc = 6;
  //	required string TotalDec = 7;
  //	required string VatInc = 8;
  //	required string VatDec = 9;
  //	required int32 Currency = 10;
  //	required sfixed64 ConfirmationDateTimeTicks = 11;
  //	required int32 InvoiceAmendmentFlags = 12;
  //}
  TInvoiceCorrectionMetadata = class(TSerializationObject)  //message InvoiceCorrectionMetadata
  private
    FConfirmationDateTimeTicks: sfixed64;
    FCurrency: int32;
    FInvoiceAmendmentFlags: int32;
    FInvoiceCorrectionStatus: TInvoiceStatus;
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
    property InvoiceCorrectionStatus:TInvoiceStatus read FInvoiceCorrectionStatus write FInvoiceCorrectionStatus default UnknownInvoiceStatus; //1
    property OriginalInvoiceNumber:string read FOriginalInvoiceNumber write FOriginalInvoiceNumber;                          //2
    property OriginalInvoiceDate:string read FOriginalInvoiceDate write FOriginalInvoiceDate;                                //3
    property OriginalInvoiceRevisionNumber:string read FOriginalInvoiceRevisionNumber write FOriginalInvoiceRevisionNumber;  //4
    property OriginalInvoiceRevisionDate:string read FOriginalInvoiceRevisionDate write FOriginalInvoiceRevisionDate;        //5
    property TotalInc:string read FTotalInc write FTotalInc;                                                                 //6
    property TotalDec:string read FTotalDec write FTotalDec;                                                                 //7
    property VatInc:string read FVatInc write FVatInc;                                                                       //8
    property VatDec:string read FVatDec write FVatDec;                                                                       //9
    property Currency:int32 read FCurrency write FCurrency;                                                                  //10
    property ConfirmationDateTimeTicks:sfixed64 read FConfirmationDateTimeTicks write FConfirmationDateTimeTicks;            //11
    property InvoiceAmendmentFlags:int32 read FInvoiceAmendmentFlags write FInvoiceAmendmentFlags;                           //12
  end;


  { TInvoiceRevisionMetadata }
  //message InvoiceRevisionMetadata {
  //	optional InvoiceStatus InvoiceRevisionStatus = 1 [default = UnknownInvoiceStatus];
  //	required string OriginalInvoiceNumber = 2;
  //	required string OriginalInvoiceDate = 3;
  //	required string Total = 4;
  //	required string Vat = 5;
  //	required int32 Currency = 6;
  //	required sfixed64 ConfirmationDateTimeTicks = 7;
  //	required int32 InvoiceAmendmentFlags = 8;
  //}
  TInvoiceRevisionMetadata = class(TSerializationObject)  //message InvoiceRevisionMetadata
  private
    FConfirmationDateTimeTicks: sfixed64;
    FCurrency: int32;
    FInvoiceAmendmentFlags: int32;
    FInvoiceRevisionStatus: TInvoiceStatus;
    FOriginalInvoiceDate: string;
    FOriginalInvoiceNumber: string;
    FTotal: string;
    FVat: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property InvoiceRevisionStatus:TInvoiceStatus read FInvoiceRevisionStatus write FInvoiceRevisionStatus default UnknownInvoiceStatus; //1
    property OriginalInvoiceNumber:string read FOriginalInvoiceNumber write FOriginalInvoiceNumber; //2;
    property OriginalInvoiceDate:string read FOriginalInvoiceDate write FOriginalInvoiceDate;       //3;
    property Total:string read FTotal write FTotal;                                                 //4;
    property Vat:string read FVat write FVat;                                                       //5;
    property Currency:int32 read FCurrency write FCurrency;                                         //6;
    property ConfirmationDateTimeTicks:sfixed64 read FConfirmationDateTimeTicks write FConfirmationDateTimeTicks; //7;
    property InvoiceAmendmentFlags:int32 read FInvoiceAmendmentFlags write FInvoiceAmendmentFlags;  //8;
  end;


  { TInvoiceMetadata }
  //message InvoiceMetadata {
	 // optional InvoiceStatus InvoiceStatus = 1 [default = UnknownInvoiceStatus];
	 // required string Total = 2;
	 // required string Vat = 3;
	 // required int32 Currency = 4;
	 // required sfixed64 ConfirmationDateTimeTicks = 5;
	 // required int32 InvoiceAmendmentFlags = 6;
  //}
  TInvoiceMetadata = class(TSerializationObject)  //message InvoiceMetadata
  private
    FConfirmationDateTimeTicks: sfixed64;
    FCurrency: int32;
    FInvoiceAmendmentFlags: int32;
    FInvoiceStatus: TInvoiceStatus;
    FTotal: string;
    FVat: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property InvoiceStatus:TInvoiceStatus read FInvoiceStatus write FInvoiceStatus default UnknownInvoiceStatus;  //1
    property Total:string read FTotal write FTotal;                                                               //2;
    property Vat:string read FVat write FVat;                                                                     //3;
    property Currency:int32 read FCurrency write FCurrency;                                                       //4;
    property ConfirmationDateTimeTicks:sfixed64 read FConfirmationDateTimeTicks write FConfirmationDateTimeTicks; //5;
    property InvoiceAmendmentFlags:int32 read FInvoiceAmendmentFlags write FInvoiceAmendmentFlags; //6
  end;

function InvoiceStatusToStr(AStatus:TInvoiceStatus):string;
implementation

(*

    UnknownInvoiceStatus (неизвестный статус; может выдаваться лишь в случае, когда клиент использует устаревшую версию SDK и не может интерпретировать статус документа, переданный сервером),
    OutboundWaitingForInvoiceReceipt (СФ/ИСФ/КСФ/ИКСФ исходящий, ожидается извещение о получении СФ/ИСФ/КСФ/ИКСФ от покупателя),
    OutboundNotFinished (СФ/ИСФ/КСФ/ИКСФ исходящий, извещение о получении СФ/ИСФ/КСФ/ИКСФ от покупателя уже есть, но документооборот еще не завершен),
    OutboundFinished (СФ/ИСФ/КСФ/ИКСФ исходящий, документооборот завершен),
    OutboundWaitingForSenderSignature (СФ/ИСФ/КСФ/ИКСФ исходящий, документ не отправлен, поскольку не подписан отправителем),
    OutboundInvalidSenderSignature (СФ/ИСФ/КСФ/ИКСФ исходящий, документ не отправлен, поскольку подпись отправителя не является корректной),
    InboundNotFinished (СФ/ИСФ/КСФ/ИКСФ входящий, документооборот не завершен),
    InboundFinished (СФ/ИСФ/КСФ/ИКСФ входящий, документооборот завершен).

*)
function InvoiceStatusToStr(AStatus:TInvoiceStatus):string;
begin
  case AStatus of
    UnknownInvoiceStatus:Result:='UnknownInvoiceStatus';
    OutboundWaitingForInvoiceReceipt:Result:='OutboundWaitingForInvoiceReceipt';
    OutboundNotFinished:Result:='OutboundNotFinished';
    OutboundFinished:Result:='OutboundFinished';
    OutboundWaitingForSenderSignature:Result:='OutboundWaitingForSenderSignature';
    OutboundInvalidSenderSignature:Result:='OutboundInvalidSenderSignature';
    InboundNotFinished:Result:='InboundNotFinished';
    InboundFinished:Result:='InboundFinished';
  else
    Result:='';
  end;
end;

{ TInvoiceCorrectionRevisionMetadata }

procedure TInvoiceCorrectionRevisionMetadata.InternalInit;
begin
  inherited InternalInit;
  FInvoiceCorrectionRevisionStatus:=UnknownInvoiceStatus;
end;

procedure TInvoiceCorrectionRevisionMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InvoiceCorrectionRevisionStatus', 1);
  RegisterProp('OriginalInvoiceNumber', 2);
  RegisterProp('OriginalInvoiceDate', 3);
  RegisterProp('OriginalInvoiceRevisionNumber', 4);
  RegisterProp('OriginalInvoiceRevisionDate', 5);
  RegisterProp('OriginalInvoiceCorrectionNumber', 6);
  RegisterProp('OriginalInvoiceCorrectionDate', 7);
  RegisterProp('TotalInc', 8);
  RegisterProp('TotalDec', 9);
  RegisterProp('VatInc', 10);
  RegisterProp('VatDec', 11);
  RegisterProp('Currency', 12);
  RegisterProp('ConfirmationDateTimeTicks', 13);
  RegisterProp('InvoiceAmendmentFlags', 14);
end;

{ TInvoiceCorrectionMetadata }

procedure TInvoiceCorrectionMetadata.InternalInit;
begin
  inherited InternalInit;
  FInvoiceCorrectionStatus:=UnknownInvoiceStatus;
end;

procedure TInvoiceCorrectionMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InvoiceCorrectionStatus', 1);
  RegisterProp('OriginalInvoiceNumber', 2);
  RegisterProp('OriginalInvoiceDate', 3);
  RegisterProp('OriginalInvoiceRevisionNumber', 4);
  RegisterProp('OriginalInvoiceRevisionDate', 5);
  RegisterProp('TotalInc', 6);
  RegisterProp('TotalDec', 7);
  RegisterProp('VatInc', 8);
  RegisterProp('VatDec', 9);
  RegisterProp('Currency', 10);
  RegisterProp('ConfirmationDateTimeTicks', 11);
  RegisterProp('InvoiceAmendmentFlags', 12);
end;


{ TInvoiceRevisionMetadata }

procedure TInvoiceRevisionMetadata.InternalInit;
begin
  inherited InternalInit;
  FInvoiceRevisionStatus:=UnknownInvoiceStatus
end;

procedure TInvoiceRevisionMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InvoiceRevisionStatus', 1);
  RegisterProp('OriginalInvoiceNumber', 2);
  RegisterProp('OriginalInvoiceDate', 3);
  RegisterProp('Total', 4);
  RegisterProp('Vat', 5);
  RegisterProp('Currency', 6);
  RegisterProp('ConfirmationDateTimeTicks', 7);
  RegisterProp('InvoiceAmendmentFlags', 8);
end;

{ TInvoiceMetadata }

procedure TInvoiceMetadata.InternalInit;
begin
  inherited InternalInit;
  FInvoiceStatus:=UnknownInvoiceStatus;
end;

procedure TInvoiceMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InvoiceStatus', 1);
  RegisterProp('Total', 2);
  RegisterProp('Vat', 3);
  RegisterProp('Currency', 4);
  RegisterProp('ConfirmationDateTimeTicks', 5);
  RegisterProp('InvoiceAmendmentFlags', 6);
end;
end.

