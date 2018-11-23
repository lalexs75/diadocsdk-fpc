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

unit DiadocTypes_DocumentType;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils;
type
  //enum DocumentType
  //{
  //	UnknownDocumentType = -1; // reserved for backward compatibility
  //	Nonformalized = 0;
  //	Invoice = 1;
  //	TrustConnectionRequest = 11;
  //	Torg12 = 12;
  //	InvoiceRevision = 13;
  //	InvoiceCorrection = 14;
  //	InvoiceCorrectionRevision = 15;
  //	AcceptanceCertificate = 16;
  //	ProformaInvoice = 18;
  //	XmlTorg12 = 19;
  //	XmlAcceptanceCertificate = 20;
  //	PriceList = 26;
  //	PriceListAgreement = 30;
  //	CertificateRegistry = 34;
  //	ReconciliationAct = 35;
  //	Contract = 36;
  //	Torg13 = 37;
  //	ServiceDetails = 38;
  //	SupplementaryAgreement = 40;
  //	UniversalTransferDocument = 41;
  //	UniversalTransferDocumentRevision = 45;
  //	UniversalCorrectionDocument = 49;
  //	UniversalCorrectionDocumentRevision = 50;
  //}
  TDocumentType = (
    UnknownDocumentType = -1,
    Nonformalized = 0,
    Invoice = 1,
    TrustConnectionRequest = 11,
    Torg12 = 12,
    InvoiceRevision = 13,
    InvoiceCorrection = 14,
    InvoiceCorrectionRevision = 15,
    AcceptanceCertificate = 16,
    ProformaInvoice = 18,
    XmlTorg12 = 19,
    XmlAcceptanceCertificate = 20,
    PriceList = 26,
    PriceListAgreement = 30,
    CertificateRegistry = 34,
    ReconciliationAct = 35,
    Contract = 36,
    Torg13 = 37,
    ServiceDetails = 38,
    SupplementaryAgreement = 40,
    UniversalTransferDocument = 41,
    UniversalTransferDocumentRevision = 45,
    UniversalCorrectionDocument = 49,
    UniversalCorrectionDocumentRevision = 50
  );

  TDocumentTypeFilter = (
    dtfUnknownDocumentType,
    dtfNonformalized,
    dtfInvoice,
    dtfTrustConnectionRequest,
    dtfTorg12,
    dtfInvoiceRevision,
    dtfInvoiceCorrection,
    dtfInvoiceCorrectionRevision,
    dtfAcceptanceCertificate,
    dtfProformaInvoice,
    dtfXmlTorg12,
    dtfXmlAcceptanceCertificate ,
    dtfPriceList,
    dtfPriceListAgreement,
    dtfCertificateRegistry,
    dtfReconciliationAct,
    dtfContract,
    dtfTorg13,
    dtfServiceDetails,
    dtfSupplementaryAgreement,
    dtfUniversalTransferDocument,
    dtfUniversalTransferDocumentRevision,
    dtfUniversalCorrectionDocument,
    dtfUniversalCorrectionDocumentRevision,
    dtfAnyInvoiceDocumentType,    //соответствует набору из четырех типов документов СФ/ИСФ/КСФ/ИКСФ (Invoice, InvoiceRevision, InvoiceCorrection, InvoiceCorrectionRevision),
    dtfAnyBilateralDocumentType,  //соответствует любому типу двусторонних документов (Nonformalized, Torg12, AcceptanceCertificate, XmlTorg12, XmlAcceptanceCertificate, TrustConnectionRequest, PriceList, PriceListAgreement, CertificateRegistry, ReconciliationAct, Contract, Torg13),
    dtfAnyUnilateralDocumentType, //соответствует любому типу односторонних документов (ProformaInvoice, ServiceDetails),
    dtfAny                        //соответствует любому типу документа.
  );

function DocumentTypeToStr(ADocumentType:TDocumentType):string;
function DocumentTypeToDescription(ADocumentType:TDocumentType):string;

function DocumentTypeFilter(ADocumentType:TDocumentTypeFilter):string;
function DocumentTypeFilterDescription(ADocumentType:TDocumentTypeFilter):string;
implementation

function DocumentTypeToStr(ADocumentType: TDocumentType): string;
begin
  case ADocumentType of
    Nonformalized:Result:='Nonformalized'; //неформализованный документ.
    Invoice:Result:='Invoice'; //счет-фактура.
    InvoiceRevision:Result:='InvoiceRevision - исправление счета-фактуры.';
    InvoiceCorrection:Result:='InvoiceCorrection - корректировочный счет-фактура.';
    InvoiceCorrectionRevision:Result:='InvoiceCorrectionRevision - исправление корректировочного счета-фактуры.';
    TrustConnectionRequest:Result:='TrustConnectionRequest - запрос на инициацию канала обмена документами через Диадок.';
    Torg12:Result:='Torg12 - товарная накладная ТОРГ-12.';
    AcceptanceCertificate:Result:='AcceptanceCertificate - акт о выполнении работ / оказании услуг.';
    ProformaInvoice:Result:='ProformaInvoice - счет на оплату.';
    XmlTorg12:Result:='XmlTorg12 - товарная накладная ТОРГ-12 в XML-формате.';
    XmlAcceptanceCertificate:Result:='XmlAcceptanceCertificate - акт о выполнении работ / оказании услуг в XML-формате.';
    PriceList:Result:='PriceList - ценовой лист.';
    PriceListAgreement:Result:='PriceListAgreement - протокол согласования цены.';
    CertificateRegistry:Result:='CertificateRegistry - реестр сертификатов.';
    ReconciliationAct:Result:='ReconciliationAct - акт сверки.';
    Contract:Result:='Contract - договор.';
    Torg13:Result:='Torg13 - накладная ТОРГ-13.';
    ServiceDetails:Result:='ServiceDetails - детализация.';
    SupplementaryAgreement:Result:='SupplementaryAgreement - дополнительное соглашение к договору.';
    UniversalTransferDocument:Result:='UniversalTransferDocument - универсальный передаточный документ (УПД).';
    UniversalTransferDocumentRevision:Result:='UniversalTransferDocumentRevision - исправление универсального передаточного документа.';
    UniversalCorrectionDocument:Result:='UniversalCorrectionDocument - универсальный корректировочный документ (УКД).';
    UniversalCorrectionDocumentRevision:Result:='UniversalCorrectionDocumentRevision - исправление универсального корректировочного документа.';
    UnknownDocumentType:Result:='UnknownDocumentType - неизвестный тип документа; может выдаваться лишь в случае, когда клиент использует устаревшую версию SDK и не может интерпретировать тип документа, переданный сервером.';
  else
    Result:='';
  end;
end;

function DocumentTypeToDescription(ADocumentType: TDocumentType): string;
begin
  Result:='';
  case ADocumentType of
    Nonformalized:Result:='Неформализованный документ';
    Invoice:Result:='Счет-фактура';
    InvoiceRevision:Result:='Исправление счета-фактуры';
    InvoiceCorrection:Result:='Корректировочный счет-фактура';
    InvoiceCorrectionRevision:Result:='Исправление корректировочного счета-фактуры';
    TrustConnectionRequest:Result:='Запрос на инициацию канала обмена документами через Диадок';
    Torg12:Result:='Товарная накладная ТОРГ-12';
    AcceptanceCertificate:Result:='Акт о выполнении работ / оказании услуг';
    ProformaInvoice:Result:='Счет на оплату';
    XmlTorg12:Result:='Товарная накладная ТОРГ-12 в XML-формате';
    XmlAcceptanceCertificate:Result:='Акт о выполнении работ / оказании услуг в XML-формате';
    PriceList:Result:='Ценовой лист';
    PriceListAgreement:Result:='Протокол согласования цены';
    CertificateRegistry:Result:='Реестр сертификатов';
    ReconciliationAct:Result:='Акт сверки';
    Contract:Result:='Договор';
    Torg13:Result:='Накладная ТОРГ-13';
    ServiceDetails:Result:='Детализация';
    SupplementaryAgreement:Result:='Дополнительное соглашение к договору';
    UniversalTransferDocument:Result:='Универсальный передаточный документ (УПД)';
    UniversalTransferDocumentRevision:Result:='Исправление универсального передаточного документа';
    UniversalCorrectionDocument:Result:='Универсальный корректировочный документ (УКД)';
    UniversalCorrectionDocumentRevision:Result:='Исправление универсального корректировочного документа';
    UnknownDocumentType:Result:='Неизвестный тип документа; может выдаваться лишь в случае, когда клиент использует устаревшую версию SDK и не может интерпретировать тип документа, переданный сервером';
  else
    Result:='Другое';
  end;
end;

function DocumentTypeFilter(ADocumentType: TDocumentTypeFilter): string;
begin
  case ADocumentType of
    dtfUnknownDocumentType:Result:='UnknownDocumentType';
    dtfNonformalized:Result:='Nonformalized';
    dtfInvoice:Result:='Invoice';
    dtfTrustConnectionRequest:Result:='TrustConnectionRequest';
    dtfTorg12:Result:='Torg12';
    dtfInvoiceRevision:Result:='InvoiceRevision';
    dtfInvoiceCorrection:Result:='InvoiceCorrection';
    dtfInvoiceCorrectionRevision:Result:='InvoiceCorrectionRevision';
    dtfAcceptanceCertificate:Result:='AcceptanceCertificate';
    dtfProformaInvoice:Result:='ProformaInvoice';
    dtfXmlTorg12:Result:='XmlTorg12';
    dtfXmlAcceptanceCertificate:Result:='XmlAcceptanceCertificate';
    dtfPriceList:Result:='PriceList';
    dtfPriceListAgreement:Result:='PriceListAgreement';
    dtfCertificateRegistry:Result:='CertificateRegistry';
    dtfReconciliationAct:Result:='ReconciliationAct';
    dtfContract:Result:='Contract';
    dtfTorg13:Result:='Torg13';
    dtfServiceDetails:Result:='ServiceDetails';
    dtfSupplementaryAgreement:Result:='SupplementaryAgreement';
    dtfUniversalTransferDocument:Result:='UniversalTransferDocument';
    dtfUniversalTransferDocumentRevision:Result:='UniversalTransferDocumentRevision';
    dtfUniversalCorrectionDocument:Result:='UniversalCorrectionDocument';
    dtfUniversalCorrectionDocumentRevision:Result:='UniversalCorrectionDocumentRevision';
    dtfAnyInvoiceDocumentType:Result:='AnyInvoiceDocumentType';    //соответствует набору из четырех типов документов СФ/ИСФ/КСФ/ИКСФ (Invoice, InvoiceRevision, InvoiceCorrection, InvoiceCorrectionRevision),
    dtfAnyBilateralDocumentType:Result:='AnyBilateralDocumentType';  //соответствует любому типу двусторонних документов (Nonformalized, Torg12, AcceptanceCertificate, XmlTorg12, XmlAcceptanceCertificate, TrustConnectionRequest, PriceList, PriceListAgreement, CertificateRegistry, ReconciliationAct, Contract, Torg13),
    dtfAnyUnilateralDocumentType:Result:='AnyUnilateralDocumentType'; //соответствует любому типу односторонних документов (ProformaInvoice, ServiceDetails),
  else
    //dtfAny                        //соответствует любому типу документа.
    Result:='Any';
  end;
end;

function DocumentTypeFilterDescription(ADocumentType: TDocumentTypeFilter
  ): string;
begin
  case ADocumentType of
    dtfNonformalized:Result:='неформализованный документ.';
    dtfInvoice:Result:='счет-фактура.';
    dtfInvoiceRevision:Result:='исправление счета-фактуры.';
    dtfInvoiceCorrection:Result:='корректировочный счет-фактура.';
    dtfInvoiceCorrectionRevision:Result:='исправление корректировочного счета-фактуры.';
    dtfTrustConnectionRequest:Result:='запрос на инициацию канала обмена документами через Диадок.';
    dtfTorg12:Result:='товарная накладная ТОРГ-12.';
    dtfAcceptanceCertificate:Result:='акт о выполнении работ / оказании услуг.';
    dtfProformaInvoice:Result:='счет на оплату.';
    dtfXmlTorg12:Result:='товарная накладная ТОРГ-12 в XML-формате.';
    dtfXmlAcceptanceCertificate:Result:='акт о выполнении работ / оказании услуг в XML-формате.';
    dtfPriceList:Result:='ценовой лист.';
    dtfPriceListAgreement:Result:='протокол согласования цены.';
    dtfCertificateRegistry:Result:='реестр сертификатов.';
    dtfReconciliationAct:Result:='акт сверки.';
    dtfContract:Result:='договор.';
    dtfTorg13:Result:='накладная ТОРГ-13.';
    dtfServiceDetails:Result:='детализация.';
    dtfSupplementaryAgreement:Result:='дополнительное соглашение к договору.';
    dtfUniversalTransferDocument:Result:='универсальный передаточный документ (УПД).';
    dtfUniversalTransferDocumentRevision:Result:='исправление универсального передаточного документа.';
    dtfUniversalCorrectionDocument:Result:='универсальный корректировочный документ (УКД).';
    dtfUniversalCorrectionDocumentRevision:Result:='исправление универсального корректировочного документа.';
    dtfUnknownDocumentType:Result:='неизвестный тип документа; может выдаваться лишь в случае, когда клиент использует устаревшую версию SDK и не может интерпретировать тип документа, переданный сервером.';
{
    dtfUnknownDocumentType:Result:='UnknownDocumentType';
    dtfNonformalized:Result:='Nonformalized';
    dtfInvoice:Result:='Invoice';
    dtfTrustConnectionRequest:Result:='TrustConnectionRequest';
    dtfTorg12:Result:='Torg12';
    dtfInvoiceRevision:Result:='InvoiceRevision';
    dtfInvoiceCorrection:Result:='InvoiceCorrection';
    dtfInvoiceCorrectionRevision:Result:='InvoiceCorrectionRevision';
    dtfAcceptanceCertificate:Result:='AcceptanceCertificate';
    dtfProformaInvoice:Result:='ProformaInvoice';
    dtfXmlTorg12:Result:='XmlTorg12';
    dtfXmlAcceptanceCertificate:Result:='XmlAcceptanceCertificate';
    dtfPriceList:Result:='PriceList';
    dtfPriceListAgreement:Result:='PriceListAgreement';
    dtfCertificateRegistry:Result:='CertificateRegistry';
    dtfReconciliationAct:Result:='ReconciliationAct';
    dtfContract:Result:='Contract';
    dtfTorg13:Result:='Torg13';
    dtfServiceDetails:Result:='ServiceDetails';
    dtfSupplementaryAgreement:Result:='SupplementaryAgreement';
    dtfUniversalTransferDocument:Result:='UniversalTransferDocument';
    dtfUniversalTransferDocumentRevision:Result:='UniversalTransferDocumentRevision';
    dtfUniversalCorrectionDocument:Result:='UniversalCorrectionDocument';
    dtfUniversalCorrectionDocumentRevision:Result:='UniversalCorrectionDocumentRevision';}
    dtfAnyInvoiceDocumentType:Result:='соответствует набору из четырех типов документов СФ/ИСФ/КСФ/ИКСФ (Invoice, InvoiceRevision, InvoiceCorrection, InvoiceCorrectionRevision)';
    dtfAnyBilateralDocumentType:Result:='соответствует любому типу двусторонних документов (Nonformalized, Torg12, AcceptanceCertificate, XmlTorg12, XmlAcceptanceCertificate, TrustConnectionRequest, PriceList, PriceListAgreement, CertificateRegistry, ReconciliationAct, Contract, Torg13)';
    dtfAnyUnilateralDocumentType:Result:='соответствует любому типу односторонних документов (ProformaInvoice, ServiceDetails)';
  else
    //dtfAny                        //соответствует любому типу документа.
    Result:='Любые';
  end;
end;
end.

