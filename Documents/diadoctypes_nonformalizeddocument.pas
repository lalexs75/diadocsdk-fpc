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

unit DiadocTypes_NonformalizedDocument;

{$I diadoc_define.inc}

interface

//import "Documents/ReceiptStatus.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_ReceiptStatus;

type
  TNonformalizedDocumentStatus = (
    UnknownNonformalizedDocumentStatus = 0, // Reserved state to report to legacy client for new statuses
    OutboundNoRecipientSignatureRequest = 1,
    OutboundWaitingForRecipientSignature = 2,
    OutboundWithRecipientSignature = 3,
    OutboundRecipientSignatureRequestRejected = 4,
    OutboundWaitingForSenderSignature = 13,
    OutboundInvalidSenderSignature = 14,
    InboundNoRecipientSignatureRequest = 5,
    InboundWaitingForRecipientSignature = 6,
    InboundWithRecipientSignature = 7,
    InboundRecipientSignatureRequestRejected = 8,
    InboundInvalidRecipientSignature = 15,
    InternalNoRecipientSignatureRequest = 9,
    InternalWaitingForRecipientSignature = 10,
    InternalWithRecipientSignature = 11,
    InternalRecipientSignatureRequestRejected = 12,
    InternalWaitingForSenderSignature = 16,
    InternalInvalidSenderSignature = 17,
    InternalInvalidRecipientSignature = 18
  );

  { TNonformalizedDocumentMetadata }
  //message NonformalizedDocumentMetadata {
  //	optional NonformalizedDocumentStatus DocumentStatus = 1 [default = UnknownNonformalizedDocumentStatus];
  //	optional ReceiptStatus ReceiptStatus = 2 [default = UnknownReceiptStatus];
  //}
  TNonformalizedDocumentMetadata = class(TSerializationObject)  //message NonformalizedDocumentMetadata
  private
    FDocumentStatus: TNonformalizedDocumentStatus;
    FReceiptStatus: TReceiptStatus;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property DocumentStatus:TNonformalizedDocumentStatus read FDocumentStatus write FDocumentStatus default UnknownNonformalizedDocumentStatus;//1
    property ReceiptStatus:TReceiptStatus read FReceiptStatus write FReceiptStatus default UnknownReceiptStatus; //2
  end;

function NonformalizedDocumentStatusToStr(AStatus:TNonformalizedDocumentStatus):string;
implementation

function NonformalizedDocumentStatusToStr(AStatus:TNonformalizedDocumentStatus):string;
begin
  case AStatus of
    UnknownNonformalizedDocumentStatus:Result:='UnknownNonformalizedDocumentStatus';               // неизвестный статус; может выдаваться лишь в случае, когда клиент использует устаревшую версию SDK и не может интерпретировать статус документа, переданный сервером
    OutboundNoRecipientSignatureRequest:Result:='OutboundNoRecipientSignatureRequest';             // документ исходящий, без запроса ответной подписи
    OutboundWaitingForRecipientSignature:Result:='OutboundWaitingForRecipientSignature';           // документ исходящий, ответная подпись, либо отказ от ее формирования еще не получены
    OutboundWithRecipientSignature:Result:='OutboundWithRecipientSignature';                       // документ исходящий, ответная подпись получена
    OutboundRecipientSignatureRequestRejected:Result:='OutboundRecipientSignatureRequestRejected'; // документ исходящий, получен отказ от формирования ответной подписи
    OutboundWaitingForSenderSignature:Result:='OutboundWaitingForSenderSignature';                 // документ исходящий, документ не отправлен, поскольку не подписан отправителем
    OutboundInvalidSenderSignature:Result:='OutboundInvalidSenderSignature';                       // документ исходящий, документ не отправлен, поскольку подпись отправителя не является корректной
    InboundNoRecipientSignatureRequest:Result:='InboundNoRecipientSignatureRequest';               // документ входящий, без запроса ответной подписи
    InboundWaitingForRecipientSignature:Result:='InboundWaitingForRecipientSignature';             // документ входящий, ответная подпись, либо отказ от ее формирования еще не отправлены
    InboundWithRecipientSignature:Result:='InboundWithRecipientSignature';                         // документ входящий, ответная подпись поставлена
    InboundRecipientSignatureRequestRejected:Result:='InboundRecipientSignatureRequestRejected';   // документ входящий, отправлен отказ от формирования ответной подписи
    InboundInvalidRecipientSignature:Result:='InboundInvalidRecipientSignature';                   // документ входящий, документооборот не завершен, поскольку подпись получателя не является корректной
    InternalNoRecipientSignatureRequest:Result:='InternalNoRecipientSignatureRequest';             // документ внутренний, без запроса ответной подписи
    InternalWaitingForRecipientSignature:Result:='InternalWaitingForRecipientSignature';           // документ внутренний, ответная подпись, либо отказ от ее формирования еще не отправлены
    InternalWithRecipientSignature:Result:='InternalWithRecipientSignature';                       // документ внутренний, ответная подпись поставлена
    InternalRecipientSignatureRequestRejected:Result:='InternalRecipientSignatureRequestRejected'; // документ внутренний, отправлен отказ от формирования ответной подписи
    InternalWaitingForSenderSignature:Result:='InternalWaitingForSenderSignature';                 // документ внутренний, документ не отправлен, поскольку не подписан отправителем
    InternalInvalidSenderSignature:Result:='InternalInvalidSenderSignature';                       // документ внутренний, документ не отправлен, поскольку подпись отправителя не является корректной
    InternalInvalidRecipientSignature:Result:='InternalInvalidRecipientSignature';                 // документ внутренний, документооборот не завершен, поскольку подпись получателя не является корректной
  else
    Result:='';
  end;
end;

{ TNonformalizedDocumentMetadata }

procedure TNonformalizedDocumentMetadata.InternalInit;
begin
  inherited InternalInit;
  FDocumentStatus:=UnknownNonformalizedDocumentStatus;
  FReceiptStatus:=UnknownReceiptStatus;
end;

procedure TNonformalizedDocumentMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentStatus', 1);
  RegisterProp('ReceiptStatus', 2);
end;
end.

