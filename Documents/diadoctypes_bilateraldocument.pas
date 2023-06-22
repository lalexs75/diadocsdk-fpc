{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2023 Lagunov Aleksey alexs75@yandex.ru

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

unit DiadocTypes_BilateralDocument;

{$I diadoc_define.inc}

interface

//import "Documents/ReceiptStatus.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_ReceiptStatus
  ;

type
  { BilateralDocumentStatus }
  //enum BilateralDocumentStatus {
  //	UnknownBilateralDocumentStatus = 0;	// Reserved status to report to legacy clients for newly introduced statuses
  //	OutboundWaitingForRecipientSignature = 1;
  //	OutboundWithRecipientSignature = 2;
  //	OutboundWithRecipientPartiallySignature = 19;
  //	OutboundRecipientSignatureRequestRejected = 3;
  //	OutboundWaitingForSenderSignature = 10;
  //	OutboundInvalidSenderSignature = 11;
  //	InboundWaitingForRecipientSignature = 4;
  //	InboundWithRecipientSignature = 5;
  //	InboundWithRecipientPartiallySignature = 20;
  //	InboundRecipientSignatureRequestRejected = 6;
  //	InboundInvalidRecipientSignature = 12;
  //	InternalWaitingForRecipientSignature = 7;
  //	InternalWithRecipientSignature = 8;
  //	InternalWithRecipientPartiallySignature = 21;
  //	InternalRecipientSignatureRequestRejected = 9;
  //	InternalWaitingForSenderSignature = 13;
  //	InternalInvalidSenderSignature = 14;
  //	InternalInvalidRecipientSignature = 15;
  //}
  TBilateralDocumentStatus = (
    UnknownBilateralDocumentStatus = 0,
    OutboundWaitingForRecipientSignature = 1,
    OutboundWithRecipientSignature = 2,
    OutboundWithRecipientPartiallySignature = 19,
    OutboundRecipientSignatureRequestRejected = 3,
    OutboundWaitingForSenderSignature = 10,
    OutboundInvalidSenderSignature = 11,
    InboundWaitingForRecipientSignature = 4,
    InboundWithRecipientSignature = 5,
    InboundWithRecipientPartiallySignature = 20,
    InboundRecipientSignatureRequestRejected = 6,
    InboundInvalidRecipientSignature = 12,
    InternalWaitingForRecipientSignature = 7,
    InternalWithRecipientSignature = 8,
    InternalWithRecipientPartiallySignature = 21,
    InternalRecipientSignatureRequestRejected = 9,
    InternalWaitingForSenderSignature = 13,
    InternalInvalidSenderSignature = 14,
    InternalInvalidRecipientSignature = 15
  );
  TBilateralDocumentStatusArray = array of TBilateralDocumentStatus;

  { TBilateralDocumentMetadata }
  //message BilateralDocumentMetadata {
  //	optional BilateralDocumentStatus DocumentStatus = 1 [default = UnknownBilateralDocumentStatus];
  //	optional ReceiptStatus ReceiptStatus = 2 [default = UnknownReceiptStatus];
  //}
  TBilateralDocumentMetadata = class(TSerializationObject)  //message BilateralDocumentMetadata
  private
    FDocumentStatus: TBilateralDocumentStatus;
    FReceiptStatus: TReceiptStatus;
    function GetDocumentStatus: TBilateralDocumentStatus;
    procedure SetDocumentStatus(AValue: TBilateralDocumentStatus);
    procedure SetReceiptStatus(AValue: TReceiptStatus);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    property DocumentStatus:TBilateralDocumentStatus read GetDocumentStatus write SetDocumentStatus default UnknownBilateralDocumentStatus;//1
  published
    property ReceiptStatus:TReceiptStatus read FReceiptStatus write SetReceiptStatus default UnknownReceiptStatus;//2
  end;

  { TSupplementaryAgreementMetadata }
  //message SupplementaryAgreementMetadata {
  //	optional BilateralDocumentStatus DocumentStatus = 1 [default = UnknownBilateralDocumentStatus];
  //	optional string Total = 2;
  //	optional string ContractType = 3;
  //	required string ContractNumber = 4;
  //	required string ContractDate = 5;
  //	optional ReceiptStatus ReceiptStatus = 6 [default = UnknownReceiptStatus];
  //}
  TSupplementaryAgreementMetadata = class(TSerializationObject)  //message SupplementaryAgreementMetadata
  private
    FContractDate: string;
    FContractNumber: string;
    FContractType: string;
    FDocumentStatus: TBilateralDocumentStatus;
    FReceiptStatus: TReceiptStatus;
    FTotal: string;
    function GetDocumentStatus: TBilateralDocumentStatus;
    procedure SetDocumentStatus(AValue: TBilateralDocumentStatus);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    property DocumentStatus:TBilateralDocumentStatus read GetDocumentStatus write SetDocumentStatus default UnknownBilateralDocumentStatus;//1
  published
    property Total:string read FTotal write FTotal;                             //2;
    property ContractType:string read FContractType write FContractType;        //3;
    property ContractNumber:string read FContractNumber write FContractNumber;  //4;
    property ContractDate:string read FContractDate write FContractDate;        //5;
    property ReceiptStatus:TReceiptStatus read FReceiptStatus write FReceiptStatus default UnknownReceiptStatus; //6
  end;

  { TContractMetadata }
  //message ContractMetadata {
  //	optional BilateralDocumentStatus DocumentStatus = 1 [default = UnknownBilateralDocumentStatus];
  //	optional string ContractPrice = 2;
  //	optional string ContractType = 3;
  //	optional ReceiptStatus ReceiptStatus = 4 [default = UnknownReceiptStatus];
  //}
  TContractMetadata = class(TSerializationObject)  //message ContractMetadata
  private
    FContractPrice: string;
    FContractType: string;
    FDocumentStatus: TBilateralDocumentStatus;
    FReceiptStatus: TReceiptStatus;
    function GetDocumentStatus: TBilateralDocumentStatus;
    procedure SetDocumentStatus(AValue: TBilateralDocumentStatus);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    property DocumentStatus:TBilateralDocumentStatus read GetDocumentStatus write SetDocumentStatus default UnknownBilateralDocumentStatus;//1
  published
    property ContractPrice:string read FContractPrice write FContractPrice;//2
    property ContractType:string read FContractType write FContractType;//3
    property ReceiptStatus:TReceiptStatus read FReceiptStatus write FReceiptStatus default UnknownReceiptStatus;//4
  end;

  { TPriceListMetadata }
  //message PriceListMetadata {
  //	optional BilateralDocumentStatus DocumentStatus = 1 [default = UnknownBilateralDocumentStatus];
  //	optional string PriceListEffectiveDate = 2;
  //	optional string ContractDocumentDate = 3;
  //	optional string ContractDocumentNumber = 4;
  //	optional ReceiptStatus ReceiptStatus = 5 [default = UnknownReceiptStatus];
  //}
  TPriceListMetadata = class(TSerializationObject)  //message PriceListMetadata
  private
    FContractDocumentDate: string;
    FContractDocumentNumber: string;
    FDocumentStatus: TBilateralDocumentStatus;
    FPriceListEffectiveDate: string;
    function GetDocumentStatus: TBilateralDocumentStatus;
    procedure SetDocumentStatus(AValue: TBilateralDocumentStatus);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    property DocumentStatus:TBilateralDocumentStatus read GetDocumentStatus write SetDocumentStatus;//1;
  published
    property PriceListEffectiveDate:string read FPriceListEffectiveDate write FPriceListEffectiveDate;//2;
    property ContractDocumentDate:string read FContractDocumentDate write FContractDocumentDate;//3;
    property ContractDocumentNumber:string read FContractDocumentNumber write FContractDocumentNumber;//4;
  end;

  { TBasicDocumentMetadata }
  //message BasicDocumentMetadata {
  //	optional BilateralDocumentStatus DocumentStatus = 1 [default = UnknownBilateralDocumentStatus];
  //	required string Total = 2;
  //	optional string Vat = 3;
  //	optional string Grounds = 4;
  //	optional ReceiptStatus ReceiptStatus = 5 [default = UnknownReceiptStatus];
  //	optional string RevisionDate = 6;
  //	optional string RevisionNumber = 7;
  //}
  TBasicDocumentMetadata = class(TSerializationObject)  //message BasicDocumentMetadata
  private
    FDocumentStatus: TBilateralDocumentStatus;
    FGrounds: string;
    FReceiptStatus: TReceiptStatus;
    FRevisionDate: string;
    FRevisionNumber: string;
    FTotal: string;
    FVat: string;
    function GetDocumentStatus: TBilateralDocumentStatus;
    procedure SetDocumentStatus(AValue: TBilateralDocumentStatus);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    property DocumentStatus:TBilateralDocumentStatus read GetDocumentStatus write SetDocumentStatus default UnknownBilateralDocumentStatus; //1
  published
    property Total:string read FTotal write FTotal; //2
    property Vat:string read FVat write FVat;  //3
    property Grounds:string read FGrounds write FGrounds;  //4
    property ReceiptStatus:TReceiptStatus  read FReceiptStatus write FReceiptStatus default UnknownReceiptStatus;  //5
    property RevisionDate:string read FRevisionDate write FRevisionDate;//6;
    property RevisionNumber:string read FRevisionNumber write FRevisionNumber;//7;
  end;

  { TTrustConnectionRequestMetadata }
  //message TrustConnectionRequestMetadata {
  //	optional BilateralDocumentStatus TrustConnectionRequestStatus = 1 [default = UnknownBilateralDocumentStatus];
  //}
  TTrustConnectionRequestMetadata = class(TSerializationObject)  //message TrustConnectionRequestMetadata
  private
    FTrustConnectionRequestStatus: TBilateralDocumentStatus;
    function GetTrustConnectionRequestStatus: TBilateralDocumentStatus;
    procedure SetTrustConnectionRequestStatus(AValue: TBilateralDocumentStatus);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    property TrustConnectionRequestStatus:TBilateralDocumentStatus read GetTrustConnectionRequestStatus write SetTrustConnectionRequestStatus default UnknownBilateralDocumentStatus; //1
  published
  end;

function BilateralDocumentStatusToStr(AStatus:TBilateralDocumentStatus):string;
implementation

function BilateralDocumentStatusToStr(AStatus:TBilateralDocumentStatus):string;
begin
  case AStatus of
    UnknownBilateralDocumentStatus:Result:='UnknownBilateralDocumentStatus';                       //неизвестное состояние документа, может выдаваться лишь в случае, когда клиент использует устаревшую версию SDK и не может интерпретировать состояние документа, переданное сервером
    OutboundWaitingForRecipientSignature:Result:='OutboundWaitingForRecipientSignature';           //документ исходящий, ответная подпись, либо отказ от ее формирования еще не получены
    OutboundWithRecipientSignature:Result:='OutboundWithRecipientSignature';                       //документ исходящий, ответная подпись получена
    OutboundRecipientSignatureRequestRejected:Result:='OutboundRecipientSignatureRequestRejected'; //документ исходящий, получен отказ от формирования ответной подписи
    OutboundWaitingForSenderSignature:Result:='OutboundWaitingForSenderSignature';                 //документ исходящий, документ не отправлен, поскольку не подписан отправителем
    OutboundInvalidSenderSignature:Result:='OutboundInvalidSenderSignature';                       //документ исходящий, документ не отправлен, поскольку подпись отправителя не является корректной
    InboundWaitingForRecipientSignature:Result:='InboundWaitingForRecipientSignature';             //документ входящий, ответная подпись, либо отказ от ее формирования еще не отправлены
    InboundWithRecipientSignature:Result:='InboundWithRecipientSignature';                         //документ входящий, ответная подпись поставлена
    InboundRecipientSignatureRequestRejected:Result:='InboundRecipientSignatureRequestRejected';   //документ входящий, отправлен отказ от формирования ответной подписи
    InboundInvalidRecipientSignature:Result:='InboundInvalidRecipientSignature';                   //документ входящий, документооборот не завершен, поскольку подпись получателя не является корректной
    InternalWaitingForRecipientSignature:Result:='InternalWaitingForRecipientSignature';           //документ внутренний, ответная подпись, либо отказ от ее формирования еще не отправлены
    InternalWithRecipientSignature:Result:='InternalWithRecipientSignature';                       //документ внутренний, ответная подпись поставлена
    InternalRecipientSignatureRequestRejected:Result:='InternalRecipientSignatureRequestRejected'; //документ внутренний, отправлен отказ от формирования ответной подписи
    InternalWaitingForSenderSignature:Result:='InternalWaitingForSenderSignature';                 //документ внутренний, документ не отправлен, поскольку не подписан отправителем
    InternalInvalidSenderSignature:Result:='InternalInvalidSenderSignature';                       //документ внутренний, документ не отправлен, поскольку подпись отправителя не является корректной
    InternalInvalidRecipientSignature:Result:='InternalInvalidRecipientSignature';                 //документ внутренний, документооборот не завершен, поскольку подпись получателя не является корректной
  else
  end;
end;

{ TBilateralDocumentMetadata }

function TBilateralDocumentMetadata.GetDocumentStatus: TBilateralDocumentStatus;
begin
  Result:=FDocumentStatus;
end;

procedure TBilateralDocumentMetadata.SetDocumentStatus(
  AValue: TBilateralDocumentStatus);
begin
  Modified(1);
  FDocumentStatus:=AValue;
end;

procedure TBilateralDocumentMetadata.SetReceiptStatus(AValue: TReceiptStatus);
begin
  Modified(2);
  FReceiptStatus:=AValue;
end;

procedure TBilateralDocumentMetadata.InternalInit;
begin
  inherited InternalInit;
  FDocumentStatus:=UnknownBilateralDocumentStatus;
  FReceiptStatus:=UnknownReceiptStatus;
end;

procedure TBilateralDocumentMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterPropPublic('DocumentStatus', 1, TMethod(@SetDocumentStatus), TMethod(@GetDocumentStatus));
  RegisterProp('ReceiptStatus', 2);
end;

{ TSupplementaryAgreementMetadata }

function TSupplementaryAgreementMetadata.GetDocumentStatus: TBilateralDocumentStatus;
begin
  Result:=FDocumentStatus;
end;

procedure TSupplementaryAgreementMetadata.SetDocumentStatus(
  AValue: TBilateralDocumentStatus);
begin
  Modified(1);
  FDocumentStatus:=AValue;
end;

procedure TSupplementaryAgreementMetadata.InternalInit;
begin
  inherited InternalInit;
  FDocumentStatus:=UnknownBilateralDocumentStatus;
  FReceiptStatus:=UnknownReceiptStatus;
end;

procedure TSupplementaryAgreementMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterPropPublic('DocumentStatus', 1, TMethod(@SetDocumentStatus), TMethod(@GetDocumentStatus));
  RegisterProp('Total', 2);
  RegisterProp('ContractType', 3);
  RegisterProp('ContractNumber', 4);
  RegisterProp('ContractDate', 5);
  RegisterProp('ReceiptStatus', 6);
end;

{ TContractMetadata }

function TContractMetadata.GetDocumentStatus: TBilateralDocumentStatus;
begin
  Result:=FDocumentStatus;
end;

procedure TContractMetadata.SetDocumentStatus(AValue: TBilateralDocumentStatus);
begin
  Modified(1);
  FDocumentStatus:=AValue;
end;

procedure TContractMetadata.InternalInit;
begin
  inherited InternalInit;
  FDocumentStatus:=UnknownBilateralDocumentStatus;
  FReceiptStatus:=UnknownReceiptStatus;
end;

procedure TContractMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterPropPublic('DocumentStatus', 1, TMethod(@SetDocumentStatus), TMethod(@GetDocumentStatus));
  RegisterProp('ContractPrice', 2);
  RegisterProp('ContractType', 3);
  RegisterProp('ReceiptStatus', 4);
end;

{ TPriceListMetadata }

function TPriceListMetadata.GetDocumentStatus: TBilateralDocumentStatus;
begin
  Result:=FDocumentStatus;
end;

procedure TPriceListMetadata.SetDocumentStatus(AValue: TBilateralDocumentStatus
  );
begin
  Modified(1);
  FDocumentStatus:=AValue;
end;

procedure TPriceListMetadata.InternalInit;
begin
  inherited InternalInit;
end;

procedure TPriceListMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterPropPublic('DocumentStatus', 1, TMethod(@SetDocumentStatus), TMethod(@GetDocumentStatus));
  RegisterProp('PriceListEffectiveDate', 2);
  RegisterProp('ContractDocumentDate', 3);
  RegisterProp('ContractDocumentNumber', 4);
end;

{ TBasicDocumentMetadata }

function TBasicDocumentMetadata.GetDocumentStatus: TBilateralDocumentStatus;
begin
  Result:=FDocumentStatus;
end;

procedure TBasicDocumentMetadata.SetDocumentStatus(
  AValue: TBilateralDocumentStatus);
begin
  Modified(1);
  FDocumentStatus:=AValue;
end;

procedure TBasicDocumentMetadata.InternalInit;
begin
  inherited InternalInit;
  FDocumentStatus:=UnknownBilateralDocumentStatus;
  FReceiptStatus:=UnknownReceiptStatus;
end;

procedure TBasicDocumentMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterPropPublic('DocumentStatus', 1, TMethod(@SetDocumentStatus), TMethod(@GetDocumentStatus));
  RegisterProp('Total', 2);
  RegisterProp('Vat', 3);
  RegisterProp('Grounds', 4);
  RegisterProp('ReceiptStatus', 5);
  RegisterProp('RevisionDate', 6);
  RegisterProp('RevisionNumber', 7);
end;

{ TTrustConnectionRequestMetadata }

function TTrustConnectionRequestMetadata.GetTrustConnectionRequestStatus: TBilateralDocumentStatus;
begin
  Result:=FTrustConnectionRequestStatus;
end;

procedure TTrustConnectionRequestMetadata.SetTrustConnectionRequestStatus(
  AValue: TBilateralDocumentStatus);
begin
  Modified(1);
  FTrustConnectionRequestStatus:=AValue;
end;

procedure TTrustConnectionRequestMetadata.InternalInit;
begin
  inherited InternalInit;
  FTrustConnectionRequestStatus:=UnknownBilateralDocumentStatus;
end;

procedure TTrustConnectionRequestMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterPropPublic('TrustConnectionRequestStatus', 1, TMethod(@SetTrustConnectionRequestStatus), TMethod(@GetTrustConnectionRequestStatus));
end;
end.

