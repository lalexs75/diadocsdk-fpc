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
unit DiadocTypes;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils;

type
  TReqestCounteragentStatus = (rcsAny,
     rcsIsMyCounteragent, //отношение партнерства установлено и действует
     rcsInvitesMe,        //контрагент прислал запрос на установление отношения партнерства
     rcsIsInvitedByMe,    //в адрес контрагента был отправлен запрос на установление отношения партнерства
     rcsRejected          //отношение партнерства было разорвано с той или иной стороны, либо запрос на установление отношения партнерства был отклонен той или иной стороной
     );

  TDocumentFilterClass = (
    dfcInbound,       //(входящий документ),
    dfcOutbound,      //(исходящий документ),
    dfcInternal       //(внутренний документ)
  );

  TDocumentFilterStatus = ( //задает статус документа и может принимать следующие значения:
    dfsAny,                            //Пустое значение (любой документ указанного класса Class),
    dfsNotRead,                        //(документ не прочитан),
    dfsNoRecipientSignatureRequest,    //(документ без запроса ответной подписи),
    dfsWaitingForRecipientSignature,   //(документ в ожидании ответной подписи),
    dfsWithRecipientSignature,         //(документ с ответной подписью),
    dfsWithSenderSignature,            //(документ с подписью отправителя),
    dfsRecipientSignatureRequestRejected, //(документ с отказом от формирования ответной подписи),
    dfsWaitingForSenderSignature,      //(документ, требующий подписания и отправки),
    dfsInvalidSenderSignature,         //(документ с невалидной подписью отправителя, требующий повторного подписания и отправки),
    dfsInvalidRecipientSignature,      //(документ с невалидной подписью получателя, требующий повторного подписания и отправки),
    dfsApproved,                       //(согласованный документ),
    dfsDisapproved,                    //(документ с отказом согласования),
    dfsWaitingForResolution,           //(документ, находящийся на согласовании или подписи),
    dfsSignatureRequestRejected,       //(документ с отказом в запросе подписи сотруднику),
    dfsFinished,                       //(документ с завершенным документооборотом),
    dfsHaveToCreateReceipt,            //(требуется подписать извещение о получении),
    dfsNotFinished,                    //(документ с незавершенным документооборотом),
    dfsInvoiceAmendmentRequested,      //(имеет смысл только для счетов-фактур; документ, по которому было запрошено уточнение),
    dfsRevocationIsRequestedByMe,      //(документ, по которому было запрошено аннулирование),
    dfsRequestsMyRevocation,           //(документ, по которому контрагент запросил аннулирование),
    dfsRevocationAccepted,             //(аннулированный документ),
    dfsRevocationRejected,             //(документ, запрос на аннулирование которого был отклонен),
    dfsRevocationApproved,             //(документ, запрос на аннулирование которого был согласован),
    dfsRevocationDisapproved,          //(документ с отказом согласования запроса на аннулирование),
    dfsWaitingForRevocationApprovement, //(документ, находящийся на согласовании запроса аннулирования),
    dfsNotRevoked,                      //(неаннулированный документ)
    dfsWaitingForProxySignature,        //(документ в ожидании подписи промежуточного получателя),
    dfsWithProxySignature,              //(документ с подписью промежуточного получателя),
    dfsInvalidProxySignature,           //(документ с невалидной подписью промежуточного получателя, требующий повторного подписания и отправки),
    dfsProxySignatureRejected,          //(документ с отказом от формирования подписи промежуточным получателем),
    dfsWaitingForInvoiceReceipt,        //(документ в ожидании получения извещения о получении счета-фактуры),
    dfsWaitingForReceipt,               //(документ в ожидании получения извещения о получении),
    dfsRequestsMySignature,             //(документ, по которому контрагент запросил подпись),
    dfsRoamingNotificationError         //(документ, с ошибкой доставки в роуминге)
  );


  TUniversalTransferDocumentStatus = (
    utdsUnknownDocumentStatus = 0,                                 //неизвестный статус; может выдаваться лишь в случае, когда клиент использует устаревшую версию SDK и не может интерпретировать статус документа, переданный сервером,
    utdsOutboundWaitingForSenderSignature = 1,                     //документ исходящий, документ не отправлен, поскольку не подписан отправителем,
    utdsOutboundWaitingForInvoiceReceiptAndRecipientSignature = 2, //документ исходящий, от покупателя ожидается извещение о получении УПД/ИУПД/УКД/ИУКД, ответная подпись, либо отказ от ее формирования,
    utdsOutboundWaitingForInvoiceReceipt = 3,                      //документ исходящий, ожидается извещение о получении УПД/ИУПД/УКД/ИУКД от покупателя,
    utdsOutboundWaitingForRecipientSignature = 4,                  //документ исходящий, ответная подпись, либо отказ от ее формирования еще не получены,
    utdsOutboundInvalidSenderSignature = 5,                        //документ исходящий, ответная подпись получена,
    utdsInboundWaitingForInvoiceReceiptAndRecipientSignature = 6,  //документ исходящий, получен отказ от формирования ответной подписи,
    utdsInboundWaitingForRecipientSignature = 7,
    utdsInboundWaitingForInvoiceReceipt = 8,
    utdsInboundWithRecipientSignature = 9,
    utdsInboundInvalidRecipientSignature = 10
  );

  TInvoiceAmendmentFlag = (
    None = 0,               //уточнение не требуется, ИСФ/КСФ/ИКСФ не передавались
    AmendmentRequested = 1, //имеется уведомление об уточнении СФ/ИСФ/КСФ/ИКСФ
    Revised = 2,            //СФ/ИСФ/КСФ/ИКСФ был исправлен, то есть было передано соответствующее ИСФ/ИКСФ
    Corrected = 4           //СФ/ИСФ был откорректирован, то есть был передан соответствующий КСФ
  );
  TInvoiceAmendmentFlags = set of TInvoiceAmendmentFlag;

function DocumentClassFilter(ADocumentClass:TDocumentFilterClass):string;
function ReqestCounteragentStatusStr(AStatus:TReqestCounteragentStatus):string;
function DocumentFilterStatusStr(ADocumentFilterStatus:TDocumentFilterStatus):string;
implementation
function DocumentClassFilter(ADocumentClass: TDocumentFilterClass): string;
begin
  case ADocumentClass of
    dfcInbound:Result:='Inbound';   //(входящий документ),
    dfcOutbound:Result:='Outbound'; //(исходящий документ),
    dfcInternal:Result:='Internal'; //(внутренний документ)
  end
end;

function DocumentFilterStatusStr(ADocumentFilterStatus:TDocumentFilterStatus):string;
begin
  case ADocumentFilterStatus of
    dfsNotRead:Result:='NotRead';                                                      //(документ не прочитан),
    dfsNoRecipientSignatureRequest:Result:='NoRecipientSignatureRequest';              //(документ без запроса ответной подписи),
    dfsWaitingForRecipientSignature:Result:='WaitingForRecipientSignature';            //(документ в ожидании ответной подписи),
    dfsWithRecipientSignature:Result:='WithRecipientSignature';                        //(документ с ответной подписью),
    dfsWithSenderSignature:Result:='WithSenderSignature';                              //(документ с подписью отправителя),
    dfsRecipientSignatureRequestRejected:Result:='RecipientSignatureRequestRejected';  //(документ с отказом от формирования ответной подписи),
    dfsWaitingForSenderSignature:Result:='WaitingForSenderSignature';                  //(документ, требующий подписания и отправки),
    dfsInvalidSenderSignature:Result:='InvalidSenderSignature';                        //(документ с невалидной подписью отправителя, требующий повторного подписания и отправки),
    dfsInvalidRecipientSignature:Result:='InvalidRecipientSignature';                  //(документ с невалидной подписью получателя, требующий повторного подписания и отправки),
    dfsApproved:Result:='Approved';                                                    //(согласованный документ),
    dfsDisapproved:Result:='Disapproved';                                              //(документ с отказом согласования),
    dfsWaitingForResolution:Result:='WaitingForResolution';                            //(документ, находящийся на согласовании или подписи),
    dfsSignatureRequestRejected:Result:='SignatureRequestRejected';                    //(документ с отказом в запросе подписи сотруднику),
    dfsFinished:Result:='Finished';                                                    //(документ с завершенным документооборотом),
    dfsHaveToCreateReceipt:Result:='HaveToCreateReceipt';                              //(требуется подписать извещение о получении),
    dfsNotFinished:Result:='NotFinished';                                              //(документ с незавершенным документооборотом),
    dfsInvoiceAmendmentRequested:Result:='InvoiceAmendmentRequested';                  //(имеет смысл только для счетов-фактур; документ, по которому было запрошено уточнение),
    dfsRevocationIsRequestedByMe:Result:='RevocationIsRequestedByMe';                  //(документ, по которому было запрошено аннулирование),
    dfsRequestsMyRevocation:Result:='RequestsMyRevocation';                            //(документ, по которому контрагент запросил аннулирование),
    dfsRevocationAccepted:Result:='RevocationAccepted';                                //(аннулированный документ),
    dfsRevocationRejected:Result:='RevocationRejected';                                //(документ, запрос на аннулирование которого был отклонен),
    dfsRevocationApproved:Result:='RevocationApproved';                                //(документ, запрос на аннулирование которого был согласован),
    dfsRevocationDisapproved:Result:='RevocationDisapproved';                          //(документ с отказом согласования запроса на аннулирование),
    dfsWaitingForRevocationApprovement:Result:='WaitingForRevocationApprovement';      //(документ, находящийся на согласовании запроса аннулирования),
    dfsNotRevoked:Result:='NotRevoked';                                                //(неаннулированный документ)
    dfsWaitingForProxySignature:Result:='WaitingForProxySignature';                    //(документ в ожидании подписи промежуточного получателя),
    dfsWithProxySignature:Result:='WithProxySignature';                                //(документ с подписью промежуточного получателя),
    dfsInvalidProxySignature:Result:='InvalidProxySignature';                          //(документ с невалидной подписью промежуточного получателя, требующий повторного подписания и отправки),
    dfsProxySignatureRejected:Result:='ProxySignatureRejected';                        //(документ с отказом от формирования подписи промежуточным получателем),
    dfsWaitingForInvoiceReceipt:Result:='WaitingForInvoiceReceipt';                    //(документ в ожидании получения извещения о получении счета-фактуры),
    dfsWaitingForReceipt:Result:='WaitingForReceipt';                                  //(документ в ожидании получения извещения о получении),
    dfsRequestsMySignature:Result:='RequestsMySignature';                              //(документ, по которому контрагент запросил подпись),
    dfsRoamingNotificationError:Result:='RoamingNotificationError';                    //(документ, с ошибкой доставки в роуминге)
  else
    //dfsAny,                                                                          //Пустое значение (любой документ указанного класса Class),
    Result:='';
  end;
end;


function ReqestCounteragentStatusStr(AStatus: TReqestCounteragentStatus
  ): string;
begin
  case AStatus of
    rcsIsMyCounteragent:Result:='IsMyCounteragent';  // отношение партнерства установлено и действует
    rcsInvitesMe:Result:='InvitesMe';                //контрагент прислал запрос на установление отношения партнерства
    rcsIsInvitedByMe:Result:='IsInvitedByMe';        //в адрес контрагента был отправлен запрос на установление отношения партнерства
    rcsRejected:Result:='Rejected';                  //отношение партнерства было разорвано с той или иной стороны, либо запрос на установление отношения партнерства был отклонен той или иной стороной
  else
    //rcsAny
    Result:='';
  end;
end;

end.
