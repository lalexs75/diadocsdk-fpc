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

unit diadoc_consts;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, DiadocTypes;

const
   rsOK =  200;                 //операция успешно завершена;
   rsBadRequest = 400;          //данные в запросе имеют неверный формат или отсутствуют обязательные параметры;
   rsUnauthorized = 401;        //в запросе отсутствует HTTP-заголовок Authorization, или в этом заголовке содержатся некорректные авторизационные данные;
   rsNotFound = 404;            //ящик с указанным идентификатором не найден в справочнике;
   rsMethodNotAllowed = 405;    //используется неподходящий HTTP-метод;
   rsInternalServerError = 500; //при обработке запроса возникла непредвиденная ошибка.

const
   //X509ChainStatusFlags Enum - from MSDN (Namespace: System.Security.Cryptography.X509Certificates)
   CtlNotSignatureValid             = $0040000;  //262144    - Specifies that the certificate trust list (CTL) contains an invalid signature.
   CtlNotTimeValid                  = $0020000;  //131072    - Specifies that the certificate trust list (CTL) is not valid because of an invalid time value, such as one that indicates that the CTL has expired.
   CtlNotValidForUsage              = $0080000;  //524288    - Specifies that the certificate trust list (CTL) is not valid for this use.
   Cyclic                           = $0000080;  //128       - Specifies that the X509 chain could not be built.
   ExplicitDistrust 	            = $4000000;  //67108864  - Specifies that the certificate is explicitly distrusted.
   HasExcludedNameConstraint        = $0008000;  //32768     - Specifies that the X509 chain is invalid because a certificate has excluded a name constraint.
   HasNotDefinedNameConstraint      = $0002000;  //8192      - Specifies that the certificate has an undefined name constraint.
   HasNotPermittedNameConstraint    = $0004000;  //16384     - Specifies that the certificate has an impermissible name constraint.
   HasNotSupportedCriticalExtension = $8000000;  //134217728 - Specifies that the certificate does not support a critical extension.
   HasNotSupportedNameConstraint    = $0001000;  //4096      - Specifies that the certificate does not have a supported name constraint or has a name constraint that is unsupported.
   HasWeakSignature                 = $0100000;  //1048576   - Specifies that the certificate has not been strong signed. Typically, this indicates that the MD2 or MD5 hashing algorithms were used to create a hash of the certificate.
   InvalidBasicConstraints          = $0000400;  //1024      - Specifies that the X509 chain is invalid due to invalid basic constraints.
   InvalidExtension                 = $0000100;  //256       - Specifies that the X509 chain is invalid due to an invalid extension.
   InvalidNameConstraints           = $0000800;  //2048      - Specifies that the X509 chain is invalid due to invalid name constraints.
   InvalidPolicyConstraints         = $0000200;  //512       - Specifies that the X509 chain is invalid due to invalid policy constraints.
   NoError                          = $0000000;  //0         - Specifies that the X509 chain has no errors.
   NoIssuanceChainPolicy            = $2000000;  //33554432  - Specifies that there is no certificate policy extension in the certificate. This error would occur if a group policy has specified that all certificates must have a certificate policy.
   NotSignatureValid                = $0000008;  //8         - Specifies that the X509 chain is invalid due to an invalid certificate signature.
   NotTimeNested                    = $0000002;  //2         - Deprecated. Specifies that the CA (certificate authority) certificate and the issued certificate have validity periods that are not nested. For example, the CA cert can be valid from January 1 to December 1 and the issued certificate from January 2 to December 2, which would mean the validity periods are not nested.
   NotTimeValid                     = $0000001;  //1         - Specifies that the X509 chain is not valid due to an invalid time value, such as a value that indicates an expired certificate.
   NotValidForUsage                 = $0000010;  //16        - Specifies that the key usage is not valid.
   OfflineRevocation                = $1000000;  //16777216  - Specifies that the online certificate revocation list (CRL) the X509 chain relies on is currently offline.
   PartialChain                     = $0010000;  //65536     - Specifies that the X509 chain could not be built up to the root certificate.
   RevocationStatusUnknown          = $0000040;  //64        - Specifies that it is not possible to determine whether the certificate has been revoked. This can be due to the certificate revocation list (CRL) being offline or unavailable.
   Revoked                          = $0000004;  //4         - Specifies that the X509 chain is invalid due to a revoked certificate.
   UntrustedRoot                    = $0000020;  //32        - Specifies that the X509 chain is invalid due to an untrusted root certificate.

resourcestring
    sOK = 'OK';
    sBadRequest = 'Bad request';
    sUnauthorized = 'Unauthorized';
    sNotFound = 'Not Found';
    sMethodNotAllowed = 'Method not allowed';
    sInternalServerError = 'Internal server error';
    sNotImplemented      = 'Not implemented';

    sNotDefindAPIKey                   = 'Not defind API key';
    sNotDefinedAderssForParse          = 'Not defined aderss for parse';
    sNotDefinedBoxId                   = 'Not defined box id';
    sNotDefinedUserId                  = 'Not defined user id';
    sNotDefinedMessageId               = 'Not defined message id';
    sNotDefinedEntityId                = 'Not defined entity id';
    sNotDefinedOrgId                   = 'Not defined org Id';
    sNotDefinedEventId                 = 'Not defined Event Id';
    sNotDefinedDepartmentId            = 'Not defined Department Id';
    sNotDefinedDocumentId              = 'Not defined Document Id';
    sNotDefinedMessage                 = 'Not defined message';

    sNotDefinedSellerInfo              = 'Not defined seller info';
    sNotDefinedParamsGetOrganization   = 'GetOrganization: not defined query params';
    sNotDefinedINNGetOrganizationsByInnKpp  = 'GetOrganizationsByInnKpp: not defined INN';
    sNotDefinedMyOrgGetCounteragent    = 'GetCounteragent: not defined MyOrgId';
    sNotDefinedCounteragentOrgIdGetCounteragent    = 'GetCounteragent: not defined CounteragentOrgId';
    sNotDefinedOrganizationsByInnListRequest = 'NotDefinedOrganizationsByInnListRequest';
    sNotDefinedTaskId                  = 'Not defined Task Id';
    sNotDefinedInvoiceTypeStr          = 'Not defined InvoiceTypeStr';
    sNotDefinedUserContractData        = 'not defined UserContractData';

    sNotDefinedMyOrgGetCounteragentCertificates    = 'GetCounteragentCertificates: not defined MyOrgId';
    sNotDefinedCounteragentOrgIdGetCounteragentCertificates    = 'GetCounteragentCertificates: not defined CounteragentOrgId';

    sNotDefinedSellerTitleMessageId    = 'Not defined SellerTitleMessageId';
    sNotDefinedSellerTitleAttachmentId = 'Not defined SellerTitleAttachmentId';
    sNotDefinedAttachmentId            = 'Not defined AttachmentId';

    //TItemMark
    sItemMarkNotSpecified   = 'Не указано';
    sItemMarkProp           = 'Имущество';
    sItemMarkJob            = 'Работа';
    sItemMarkService        = 'Услуга';
    sItemMarkPropertyRights = 'Имущественные права';
    sItemMarkOther          = 'Иное';


    //TTaxRate
    sTaxRateNoVat           = 'без НДС';
    sTaxRatePercent_0       = 'ставка налога 0%';
    sTaxRatePercent_10      = 'ставка налога 10%';
    sTaxRatePercent_18      = 'ставка налога 18%';
    sTaxRatePercent_20      = 'ставка налога 20%';
    sTaxRateFraction_10_110 = 'ставка налога 10/110 (дробь)';
    sTaxRateFraction_18_118 = 'ставка налога 18/118 (дробь)';
    sTaxRateTaxedByAgent    = 'ставка налога "НДС исчисляется налоговым агентом';
    sTaxRateFraction_20_120 = 'ставка налога 20/120 (дробь)';


    //TFunctionType
    sFunctionTypeInvoice         = 'СЧФ';
    sFunctionTypeBasic           = 'ДОП';
    sFunctionTypeInvoiceAndBasic = 'СЧФДОП';

function DDHTTPErrorCode(ACode:Integer):string;
function DocumentFilterStatus(ADocumentStatus:TDocumentFilterStatus):string;
function DocumentFilterStatusDesc(ADocumentStatus:TDocumentFilterStatus):string;
implementation

function DDHTTPErrorCode(ACode: Integer): string;
begin
  case ACode of
    rsOK : Result := sOK;
    rsBadRequest : Result := sBadRequest;
    rsUnauthorized : Result := sUnauthorized;
    rsNotFound : Result := sNotFound;
    rsMethodNotAllowed : Result := sMethodNotAllowed;
    rsInternalServerError : Result := sInternalServerError;
  else
    Result:='Uknow error ' + IntToStr(ACode);
  end;
end;

function DocumentFilterStatus(ADocumentStatus: TDocumentFilterStatus): string;
begin
  case ADocumentStatus of
    dfsNotRead:Result:='NotRead';                        //(документ не прочитан),
    dfsNoRecipientSignatureRequest:Result:='NoRecipientSignatureRequest';   //(документ без запроса ответной подписи),
    dfsWaitingForRecipientSignature:Result:='WaitingForRecipientSignature';   //(документ в ожидании ответной подписи),
    dfsWithRecipientSignature:Result:='WithRecipientSignature';         //(документ с ответной подписью),
    dfsWithSenderSignature:Result:='WithSenderSignature';            //(документ с подписью отправителя),
    dfsRecipientSignatureRequestRejected:Result:='RecipientSignatureRequestRejected'; //(документ с отказом от формирования ответной подписи),
    dfsWaitingForSenderSignature:Result:='WaitingForSenderSignature';      //(документ, требующий подписания и отправки),
    dfsInvalidSenderSignature:Result:='InvalidSenderSignature';         //(документ с невалидной подписью отправителя, требующий повторного подписания и отправки),
    dfsInvalidRecipientSignature:Result:='InvalidRecipientSignature';      //(документ с невалидной подписью получателя, требующий повторного подписания и отправки),
    dfsApproved:Result:='Approved';                       //(согласованный документ),
    dfsDisapproved:Result:='Disapproved';                    //(документ с отказом согласования),
    dfsWaitingForResolution:Result:='WaitingForResolution';           //(документ, находящийся на согласовании или подписи),
    dfsSignatureRequestRejected:Result:='SignatureRequestRejected';       //(документ с отказом в запросе подписи сотруднику),
    dfsFinished:Result:='Finished';                       //(документ с завершенным документооборотом),
    dfsHaveToCreateReceipt:Result:='HaveToCreateReceipt';            //(требуется подписать извещение о получении),
    dfsNotFinished:Result:='NotFinished';                    //(документ с незавершенным документооборотом),
    dfsInvoiceAmendmentRequested:Result:='InvoiceAmendmentRequested';      //(имеет смысл только для счетов-фактур; документ, по которому было запрошено уточнение),
    dfsRevocationIsRequestedByMe:Result:='RevocationIsRequestedByMe';      //(документ, по которому было запрошено аннулирование),
    dfsRequestsMyRevocation:Result:='RequestsMyRevocation';           //(документ, по которому контрагент запросил аннулирование),
    dfsRevocationAccepted:Result:='RevocationAccepted';             //(аннулированный документ),
    dfsRevocationRejected:Result:='RevocationRejected';             //(документ, запрос на аннулирование которого был отклонен),
    dfsRevocationApproved:Result:='RevocationApproved';             //(документ, запрос на аннулирование которого был согласован),
    dfsRevocationDisapproved:Result:='RevocationDisapproved';          //(документ с отказом согласования запроса на аннулирование),
    dfsWaitingForRevocationApprovement:Result:='WaitingForRevocationApprovement'; //(документ, находящийся на согласовании запроса аннулирования),
    dfsNotRevoked:Result:='NotRevoked';                      //(неаннулированный документ)
    dfsWaitingForProxySignature:Result:='WaitingForProxySignature';        //(документ в ожидании подписи промежуточного получателя),
    dfsWithProxySignature:Result:='WithProxySignature';              //(документ с подписью промежуточного получателя),
    dfsInvalidProxySignature:Result:='InvalidProxySignature';           //(документ с невалидной подписью промежуточного получателя, требующий повторного подписания и отправки),
    dfsProxySignatureRejected:Result:='ProxySignatureRejected';          //(документ с отказом от формирования подписи промежуточным получателем),
    dfsWaitingForInvoiceReceipt:Result:='WaitingForInvoiceReceipt';        //(документ в ожидании получения извещения о получении счета-фактуры),
    dfsWaitingForReceipt:Result:='WaitingForReceipt';               //(документ в ожидании получения извещения о получении),
    dfsRequestsMySignature:Result:='RequestsMySignature';             //(документ, по которому контрагент запросил подпись),
    dfsRoamingNotificationError:Result:='RoamingNotificationError';         //(документ, с ошибкой доставки в роуминге)
  else
    //dfsAny,                            //Пустое значение (любой документ указанного класса Class),
    Result:='';
  end;
end;

function DocumentFilterStatusDesc(ADocumentStatus: TDocumentFilterStatus
  ): string;
begin
  case ADocumentStatus of
    dfsNotRead:Result:='Документ не прочитан';
    dfsNoRecipientSignatureRequest:Result:='Документ без запроса ответной подписи';
    dfsWaitingForRecipientSignature:Result:='Документ в ожидании ответной подписи';
    dfsWithRecipientSignature:Result:='Документ с ответной подписью';
    dfsWithSenderSignature:Result:='Документ с подписью отправителя';
    dfsRecipientSignatureRequestRejected:Result:='Документ с отказом от формирования ответной подписи';
    dfsWaitingForSenderSignature:Result:='Документ, требующий подписания и отправки';
    dfsInvalidSenderSignature:Result:='Документ с невалидной подписью отправителя, требующий повторного подписания и отправки';
    dfsInvalidRecipientSignature:Result:='Документ с невалидной подписью получателя, требующий повторного подписания и отправки';
    dfsApproved:Result:='Догласованный документ';
    dfsDisapproved:Result:='Документ с отказом согласования';
    dfsWaitingForResolution:Result:='Документ, находящийся на согласовании или подписи';
    dfsSignatureRequestRejected:Result:='Документ с отказом в запросе подписи сотруднику';
    dfsFinished:Result:='Документ с завершенным документооборотом';
    dfsHaveToCreateReceipt:Result:='Дребуется подписать извещение о получении';
    dfsNotFinished:Result:='Документ с незавершенным документооборотом';
    dfsInvoiceAmendmentRequested:Result:='Имеет смысл только для счетов-фактур; документ, по которому было запрошено уточнение';
    dfsRevocationIsRequestedByMe:Result:='Документ, по которому было запрошено аннулирование';
    dfsRequestsMyRevocation:Result:='Документ, по которому контрагент запросил аннулирование';
    dfsRevocationAccepted:Result:='Аннулированный документ';
    dfsRevocationRejected:Result:='Документ, запрос на аннулирование которого был отклонен';
    dfsRevocationApproved:Result:='Документ, запрос на аннулирование которого был согласован';
    dfsRevocationDisapproved:Result:='Документ с отказом согласования запроса на аннулирование';
    dfsWaitingForRevocationApprovement:Result:='Документ, находящийся на согласовании запроса аннулирования';
    dfsNotRevoked:Result:='Неаннулированный документ';
    dfsWaitingForProxySignature:Result:='Документ в ожидании подписи промежуточного получателя';
    dfsWithProxySignature:Result:='Документ с подписью промежуточного получателя';
    dfsInvalidProxySignature:Result:='Документ с невалидной подписью промежуточного получателя, требующий повторного подписания и отправки';
    dfsProxySignatureRejected:Result:='Документ с отказом от формирования подписи промежуточным получателем';
    dfsWaitingForInvoiceReceipt:Result:='Документ в ожидании получения извещения о получении счета-фактуры';
    dfsWaitingForReceipt:Result:='Документ в ожидании получения извещения о получении';
    dfsRequestsMySignature:Result:='Документ, по которому контрагент запросил подпись';
    dfsRoamingNotificationError:Result:='Документ, с ошибкой доставки в роуминг';
  else
    //dfsAny,                            //Пустое значение (любой документ указанного класса Class),
    Result:='Любые документы';
  end;
end;

end.

