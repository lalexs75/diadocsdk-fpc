{ Diadoc visual forms library for FPC and Lazarus

  Copyright (C) 2018-2020 Lagunov Aleksey alexs75@yandex.ru

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

unit ddConsts;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DiadocTypes;

resourcestring
  sSelectClientCaption = 'Найденные контрагенты';
  sdfsAny = 'любой документ';
  sdfsNotRead = 'документ не прочитан';
  sdfsNoRecipientSignatureRequest = 'документ без запроса ответной подписи';
  sdfsWaitingForRecipientSignature = 'документ в ожидании ответной подписи';
  sdfsWithRecipientSignature = 'документ с ответной подписью';
  sdfsWithSenderSignature = 'документ с подписью отправителя';
  sdfsRecipientSignatureRequestRejected = 'документ с отказом от формирования ответной подписи';
  sdfsWaitingForSenderSignature = 'документ, требующий подписания и отправки';
  sdfsInvalidSenderSignature = 'документ с невалидной подписью отправителя, требующий повторного подписания и отправки';
  sdfsInvalidRecipientSignature = 'документ с невалидной подписью получателя, требующий повторного подписания и отправки';
  sdfsApproved = 'согласованный документ';
  sdfsDisapproved = 'документ с отказом согласования';
  sdfsWaitingForResolution = 'документ, находящийся на согласовании или подписи';
  sdfsSignatureRequestRejected = 'документ с отказом в запросе подписи сотруднику';
  sdfsFinished = 'документ с завершенным документооборотом';
  sdfsHaveToCreateReceipt = 'требуется подписать извещение о получении';
  sdfsNotFinished = 'документ с незавершенным документооборотом';
  sdfsInvoiceAmendmentRequested = 'имеет смысл только для счетов-фактур; документ, по которому было запрошено уточнение';
  sdfsRevocationIsRequestedByMe = 'документ, по которому было запрошено аннулирование';
  sdfsRequestsMyRevocation = 'документ, по которому контрагент запросил аннулирование';
  sdfsRevocationAccepted = 'аннулированный документ';
  sdfsRevocationRejected = 'документ, запрос на аннулирование которого был отклонен';
  sdfsRevocationApproved = 'документ, запрос на аннулирование которого был согласован';
  sdfsRevocationDisapproved = 'документ с отказом согласования запроса на аннулирование';
  sdfsWaitingForRevocationApprovement = 'документ, находящийся на согласовании запроса аннулирования';
  sdfsNotRevoked = 'неаннулированный документ';
  sdfsWaitingForProxySignature = 'документ в ожидании подписи промежуточного получателя';
  sdfsWithProxySignature = 'документ с подписью промежуточного получателя';
  sdfsInvalidProxySignature = 'документ с невалидной подписью промежуточного получателя, требующий повторного подписания и отправки';
  sdfsProxySignatureRejected = 'документ с отказом от формирования подписи промежуточным получателем';
  sdfsWaitingForInvoiceReceipt = 'документ в ожидании получения извещения о получении счета-фактуры';
  sdfsWaitingForReceipt = 'документ в ожидании получения извещения о получении';
  sdfsRequestsMySignature = 'документ, по которому контрагент запросил подпись';
  sdfsRoamingNotificationError = 'документ, с ошибкой доставки в роуминге';

function DocumentFilterStatusText(ADocumentFilterStatus:TDocumentFilterStatus):string;
implementation

function DocumentFilterStatusText(ADocumentFilterStatus: TDocumentFilterStatus
  ): string;
begin
  case ADocumentFilterStatus of
    dfsAny: Result:=sdfsAny;
    dfsNotRead: Result:=sdfsNotRead;
    dfsNoRecipientSignatureRequest: Result:=sdfsNoRecipientSignatureRequest;
    dfsWaitingForRecipientSignature: Result:=sdfsWaitingForRecipientSignature;
    dfsWithRecipientSignature: Result:=sdfsWithRecipientSignature;
    dfsWithSenderSignature: Result:=sdfsWithSenderSignature;
    dfsRecipientSignatureRequestRejected: Result:=sdfsRecipientSignatureRequestRejected;
    dfsWaitingForSenderSignature: Result:=sdfsWaitingForSenderSignature;
    dfsInvalidSenderSignature: Result:=sdfsInvalidSenderSignature;
    dfsInvalidRecipientSignature: Result:=sdfsInvalidRecipientSignature;
    dfsApproved: Result:=sdfsApproved;
    dfsDisapproved: Result:=sdfsDisapproved;
    dfsWaitingForResolution: Result:=sdfsWaitingForResolution;
    dfsSignatureRequestRejected: Result:=sdfsSignatureRequestRejected;
    dfsFinished: Result:=sdfsFinished;
    dfsHaveToCreateReceipt: Result:=sdfsHaveToCreateReceipt;
    dfsNotFinished: Result:=sdfsNotFinished;
    dfsInvoiceAmendmentRequested: Result:=sdfsInvoiceAmendmentRequested;
    dfsRevocationIsRequestedByMe: Result:=sdfsRevocationIsRequestedByMe;
    dfsRequestsMyRevocation: Result:=sdfsRequestsMyRevocation;
    dfsRevocationAccepted: Result:=sdfsRevocationAccepted;
    dfsRevocationRejected: Result:=sdfsRevocationRejected;
    dfsRevocationApproved: Result:=sdfsRevocationApproved;
    dfsRevocationDisapproved: Result:=sdfsRevocationDisapproved;
    dfsWaitingForRevocationApprovement: Result:=sdfsWaitingForRevocationApprovement;
    dfsNotRevoked: Result:=sdfsNotRevoked;
    dfsWaitingForProxySignature: Result:=sdfsWaitingForProxySignature;
    dfsWithProxySignature: Result:=sdfsWithProxySignature;
    dfsInvalidProxySignature: Result:=sdfsInvalidProxySignature;
    dfsProxySignatureRejected: Result:=sdfsProxySignatureRejected;
    dfsWaitingForInvoiceReceipt: Result:=sdfsWaitingForInvoiceReceipt;
    dfsWaitingForReceipt: Result:=sdfsWaitingForReceipt;
    dfsRequestsMySignature: Result:=sdfsRequestsMySignature;
    dfsRoamingNotificationError: Result:=sdfsRoamingNotificationError;
  else
    Result:='Ошибка!';
  end;
end;

end.

