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

unit DiadocTypes_DocumentInfo;

{$I diadoc_define.inc}

interface
(*
import "DocumentType.proto";
import "DocumentDirection.proto";
import "Invoicing/UniversalTransferDocumentInfo.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_DocumentType,
  DiadocTypes_DocumentDirection,
  DiadocTypes_UniversalTransferDocumentInfo;

type


  {  TDocumentDateAndNumber  }

  //message DocumentDateAndNumber
  //{
  //	optional string DocumentDate = 1;
  //	optional string DocumentNumber = 2;
  //}
  TDocumentDateAndNumber = class(TSerializationObject) //message DocumentDateAndNumber
  private
    FDocumentDate: string;
    FDocumentNumber: string;
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentDate:string read FDocumentDate write SetDocumentDate;//1;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;//2;
  end;


  { TUniversalCorrectionDocumentInfo }

  //message UniversalCorrectionDocumentInfo
  //{
  //	optional string TotalInc = 1;
  //	optional string TotalDec = 2;
  //	optional string VatInc = 3;
  //	optional string VatDec = 4;
  //	optional int32 CurrencyCode = 5;
  //	optional string Grounds = 6;
  //	required Invoicing.FunctionType Function = 7;
  //	optional DocumentDateAndNumber OriginalDocumentDateAndNumber = 8;
  //	optional DocumentDateAndNumber OriginalDocumentRevisionDateAndNumber = 9;
  //	optional DocumentDateAndNumber OriginalDocumentCorrectionDateAndNumber = 10; // for UniversalCorrectionDocumentRevision
  //}
  TUniversalCorrectionDocumentInfo = class(TSerializationObject) //message UniversalCorrectionDocumentInfo
  private
    FCurrencyCode: int32;
    FFunctionType: TFunctionType;
    FGrounds: string;
    FOriginalDocumentCorrectionDateAndNumber: TDocumentDateAndNumber;
    FOriginalDocumentDateAndNumber: TDocumentDateAndNumber;
    FOriginalDocumentRevisionDateAndNumber: TDocumentDateAndNumber;
    FTotalDec: string;
    FTotalInc: string;
    FVatDec: string;
    FVatInc: string;
    procedure SetCurrencyCode(AValue: int32);
    procedure SetFunctionType(AValue: TFunctionType);
    procedure SetGrounds(AValue: string);
    procedure SetTotalDec(AValue: string);
    procedure SetTotalInc(AValue: string);
    procedure SetVatDec(AValue: string);
    procedure SetVatInc(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TotalInc:string read FTotalInc write SetTotalInc;//1;
    property TotalDec:string read FTotalDec write SetTotalDec;//2;
    property VatInc:string read FVatInc write SetVatInc;//3;
    property VatDec:string read FVatDec write SetVatDec;//4;
    property CurrencyCode:int32 read FCurrencyCode write SetCurrencyCode; //5;
    property Grounds:string read FGrounds write SetGrounds;//6;
    property FunctionType:TFunctionType read FFunctionType write SetFunctionType;//7;
    property OriginalDocumentDateAndNumber:TDocumentDateAndNumber read FOriginalDocumentDateAndNumber;//8;
    property OriginalDocumentRevisionDateAndNumber:TDocumentDateAndNumber read FOriginalDocumentRevisionDateAndNumber; //9;
    property OriginalDocumentCorrectionDateAndNumber:TDocumentDateAndNumber read FOriginalDocumentCorrectionDateAndNumber; //10;
  end;


  {  TUniversalTransferDocumentInfo  }

  //message UniversalTransferDocumentInfo
  //{
  //	optional string Total = 1;
  //	optional string Vat = 2;
  //	optional int32 CurrencyCode = 3;
  //	optional string Grounds = 4;
  //	required Invoicing.FunctionType Function = 5;
  //	optional DocumentDateAndNumber OriginalDocumentDateAndNumber = 6; // for UniversalTransferDocumentRevision
  //}
  TUniversalTransferDocumentInfo = class(TSerializationObject) //message UniversalTransferDocumentInfo
  private
    FCurrencyCode: int32;
    FFunctionType: TFunctionType;
    FGrounds: string;
    FOriginalDocumentDateAndNumber: TDocumentDateAndNumber;
    FTotal: string;
    FVat: string;
    procedure SetCurrencyCode(AValue: int32);
    procedure SetFunctionType(AValue: TFunctionType);
    procedure SetGrounds(AValue: string);
    procedure SetTotal(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Total:string read FTotal write SetTotal; //1;
    property Vat:string read FVat write SetVat;//2;
    property CurrencyCode:int32 read FCurrencyCode write SetCurrencyCode;//3;
    property Grounds:string read FGrounds write SetGrounds; //4;
    property FunctionType:TFunctionType read FFunctionType write SetFunctionType;//5;
    property OriginalDocumentDateAndNumber:TDocumentDateAndNumber read FOriginalDocumentDateAndNumber;//6
  end;


  {  TSupplementaryAgreementDocumentInfo  }

  //message SupplementaryAgreementDocumentInfo
  //{
  //	optional string Total = 1;
  //	optional string ContractType = 2;
  //	optional string ContractNumber = 3;
  //	optional string ContractDate = 4;
  //}
  TSupplementaryAgreementDocumentInfo = class(TSerializationObject) //message SupplementaryAgreementDocumentInfo
  private
    FContractDate: string;
    FContractNumber: string;
    FContractType: string;
    FTotal: string;
    procedure SetContractDate(AValue: string);
    procedure SetContractNumber(AValue: string);
    procedure SetContractType(AValue: string);
    procedure SetTotal(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Total:string read FTotal write SetTotal; //1;
    property ContractType:string read FContractType write SetContractType; //2;
    property ContractNumber:string read FContractNumber write SetContractNumber; //3;
    property ContractDate:string read FContractDate write SetContractDate; //4;
  end;


  {  TContractDocumentInfo  }

  //message ContractDocumentInfo
  //{
  //	optional string ContractPrice = 1;
  //	optional string ContractType = 2;
  //}
  TContractDocumentInfo = class(TSerializationObject) //message ContractDocumentInfo
  private
    FContractPrice: string;
    FContractType: string;
    procedure SetContractPrice(AValue: string);
    procedure SetContractType(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ContractPrice:string read FContractPrice write SetContractPrice; //1;
    property ContractType:string read FContractType write SetContractType; //2;
  end;


  {  TPriceListDocumentInfo  }

  //message PriceListDocumentInfo
  //{
  //	optional string PriceListEffectiveDate = 1;
  //	optional DocumentDateAndNumber ContractDocumentDateAndNumber = 2;
  //}
  TPriceListDocumentInfo = class(TSerializationObject) //message PriceListDocumentInfo
  private
    FContractDocumentDateAndNumber: TDocumentDateAndNumber;
    FPriceListEffectiveDate: string;
    procedure SetPriceListEffectiveDate(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property PriceListEffectiveDate:string read FPriceListEffectiveDate write SetPriceListEffectiveDate;//1;
    property ContractDocumentDateAndNumber:TDocumentDateAndNumber read FContractDocumentDateAndNumber; //2;
  end;


  {  TInvoiceCorrectionDocumentInfo  }

  //message InvoiceCorrectionDocumentInfo
  //{
  //	optional string TotalInc = 1;
  //	optional string TotalDec = 2;
  //	optional string VatInc = 3;
  //	optional string VatDec = 4;
  //	optional int32 CurrencyCode = 5;
  //	optional DocumentDateAndNumber OriginalInvoiceDateAndNumber = 6;
  //	optional DocumentDateAndNumber OriginalInvoiceRevisionDateAndNumber = 7;
  //	optional DocumentDateAndNumber OriginalInvoiceCorrectionDateAndNumber = 8; // for InvoiceCorrectionRevision
  //}
  TInvoiceCorrectionDocumentInfo = class(TSerializationObject) //message InvoiceCorrectionDocumentInfo
  private
    FCurrencyCode: int32;
    FOriginalInvoiceCorrectionDateAndNumber: TDocumentDateAndNumber;
    FOriginalInvoiceDateAndNumber: TDocumentDateAndNumber;
    FOriginalInvoiceRevisionDateAndNumber: TDocumentDateAndNumber;
    FTotalDec: string;
    FTotalInc: string;
    FVatDec: string;
    FVatInc: string;
    procedure SetCurrencyCode(AValue: int32);
    procedure SetTotalDec(AValue: string);
    procedure SetTotalInc(AValue: string);
    procedure SetVatDec(AValue: string);
    procedure SetVatInc(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TotalInc:string read FTotalInc write SetTotalInc; //1;
    property TotalDec:string read FTotalDec write SetTotalDec; //2;
    property VatInc:string read FVatInc write SetVatInc; //3;
    property VatDec:string read FVatDec write SetVatDec; //4;
    property CurrencyCode:int32 read FCurrencyCode write SetCurrencyCode; //5;
    property OriginalInvoiceDateAndNumber:TDocumentDateAndNumber read FOriginalInvoiceDateAndNumber; //6;
    property OriginalInvoiceRevisionDateAndNumber:TDocumentDateAndNumber read FOriginalInvoiceRevisionDateAndNumber; //7;
    property OriginalInvoiceCorrectionDateAndNumber:TDocumentDateAndNumber read FOriginalInvoiceCorrectionDateAndNumber; //8;
  end;


  {  TInvoiceDocumentInfo  }

  //message InvoiceDocumentInfo
  //{
  //	optional string Total = 1;
  //	optional string Vat = 2;
  //	optional int32 CurrencyCode = 3;
  //	optional DocumentDateAndNumber OriginalInvoiceDateAndNumber = 4; // for InvoiceRevision
  //}
  TInvoiceDocumentInfo = class(TSerializationObject) //message InvoiceDocumentInfo
  private
    FCurrencyCode: int32;
    FOriginalInvoiceDateAndNumber: TDocumentDateAndNumber;
    FTotal: string;
    FVat: string;
    procedure SetCurrencyCode(AValue: int32);
    procedure SetTotal(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Total:string read FTotal write SetTotal;//1;
    property Vat:string read FVat write SetVat;//2;
    property CurrencyCode:int32 read FCurrencyCode write SetCurrencyCode; //3;
    property OriginalInvoiceDateAndNumber:TDocumentDateAndNumber read FOriginalInvoiceDateAndNumber;//4;
  end;


  {  TBasicDocumentInfo  }

  //message BasicDocumentInfo
  //{
  //	optional string Total = 1;
  //	optional bool NoVat = 2;
  //	optional string Vat = 3;
  //	optional string Grounds = 4;
  //	optional DocumentDateAndNumber RevisionDateAndNumber = 5;
  //}
  TBasicDocumentInfo = class(TSerializationObject) //message BasicDocumentInfo
  private
    FGrounds: string;
    FNoVat: Boolean;
    FRevisionDateAndNumber: TDocumentDateAndNumber;
    FTotal: string;
    FVat: string;
    procedure SetGrounds(AValue: string);
    procedure SetNoVat(AValue: Boolean);
    procedure SetTotal(AValue: string);
    procedure SetVat(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Total:string read FTotal write SetTotal;//1;
    property NoVat:Boolean read FNoVat write SetNoVat;//2;
    property Vat:string read FVat write SetVat;//3;
    property Grounds:string read FGrounds write SetGrounds;//4;
    property RevisionDateAndNumber:TDocumentDateAndNumber read FRevisionDateAndNumber;//5;
  end;


  {  TDocumentInfo  }

  //message DocumentInfo
  //{
  //	optional DocumentType DocumentType = 1 [default = UnknownDocumentType];
  //	optional DocumentDirection DocumentDirection = 2 [default = UnknownDocumentDirection];
  //	optional bool IsTest = 3;
  //	optional string CustomDocumentId = 4;
  //	optional string FromDepartmentId = 5;
  //	optional string ToDepartmentId = 6;
  //	optional string CounteragentBoxId = 7;
  //	optional DocumentDateAndNumber DocumentDateAndNumber = 8;
  //	optional BasicDocumentInfo BasicDocumentInfo = 9;                  // for XmlTorg12, XmlAcceptanceCertificate, Torg12, AcceptanceCertificate, ProformaInvoice, Torg13
  //	optional InvoiceDocumentInfo InvoiceInfo = 10;                     // for Invoice, InvoiceRevision
  //	optional InvoiceCorrectionDocumentInfo InvoiceCorrectionInfo = 11; // for InvoiceCorrection, InvoiceCorrectionRevision
  //	optional PriceListDocumentInfo PriceListInfo = 12;
  //	optional ContractDocumentInfo ContractInfo = 13;
  //	optional SupplementaryAgreementDocumentInfo SupplementaryAgreementInfo = 14;
  //	optional UniversalTransferDocumentInfo UniversalTransferDocumentInfo = 15; // for UniversalTransferDocument, UniversalTransferDocumentRevision
  //	optional UniversalCorrectionDocumentInfo UniversalCorrectionDocumentInfo = 16; // for UniversalCorrectionDocument, UniversalCorrectionDocumentRevision
  //	optional string AttachmentVersion = 17;
  //    required string Version = 18;
  //}
  TDocumentInfo = class(TSerializationObject) //message DocumentInfo
  private
    FAttachmentVersion: string;
    FBasicDocumentInfo: TBasicDocumentInfo;
    FContractInfo: TContractDocumentInfo;
    FCounteragentBoxId: string;
    FCustomDocumentId: string;
    FDocumentDateAndNumber: TDocumentDateAndNumber;
    FDocumentDirection: TDocumentDirection;
    FDocumentType: TDocumentType;
    FFromDepartmentId: string;
    FInvoiceCorrectionInfo: TInvoiceCorrectionDocumentInfo;
    FInvoiceInfo: TInvoiceDocumentInfo;
    FIsTest: Boolean;
    FPriceListInfo: TPriceListDocumentInfo;
    FSupplementaryAgreementInfo: TSupplementaryAgreementDocumentInfo;
    FToDepartmentId: string;
    FUniversalCorrectionDocumentInfo: TUniversalCorrectionDocumentInfo;
    FUniversalTransferDocumentInfo: TUniversalTransferDocumentInfo;
    FVersion: string;
    procedure SetAttachmentVersion(AValue: string);
    procedure SetCounteragentBoxId(AValue: string);
    procedure SetCustomDocumentId(AValue: string);
    procedure SetDocumentDirection(AValue: TDocumentDirection);
    procedure SetDocumentType(AValue: TDocumentType);
    procedure SetFromDepartmentId(AValue: string);
    procedure SetIsTest(AValue: Boolean);
    procedure SetToDepartmentId(AValue: string);
    procedure SetVersion(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentType:TDocumentType read FDocumentType write SetDocumentType default UnknownDocumentType; //1
    property DocumentDirection:TDocumentDirection read FDocumentDirection write SetDocumentDirection default UnknownDocumentDirection; //2
    property IsTest:Boolean read FIsTest write SetIsTest; //3;
    property CustomDocumentId:string read FCustomDocumentId write SetCustomDocumentId; //4;
    property FromDepartmentId:string read FFromDepartmentId write SetFromDepartmentId; //5;
    property ToDepartmentId:string read FToDepartmentId write SetToDepartmentId; //6;
    property CounteragentBoxId:string read FCounteragentBoxId write SetCounteragentBoxId; //7;
    property DocumentDateAndNumber:TDocumentDateAndNumber read FDocumentDateAndNumber; //8;
    property BasicDocumentInfo:TBasicDocumentInfo read FBasicDocumentInfo;//9;
    property InvoiceInfo:TInvoiceDocumentInfo read FInvoiceInfo;//10;
    property InvoiceCorrectionInfo:TInvoiceCorrectionDocumentInfo read FInvoiceCorrectionInfo;// 11
    property PriceListInfo:TPriceListDocumentInfo read FPriceListInfo;//12;
    property ContractInfo:TContractDocumentInfo read FContractInfo;//13;
    property SupplementaryAgreementInfo:TSupplementaryAgreementDocumentInfo read FSupplementaryAgreementInfo; //14;
    property UniversalTransferDocumentInfo:TUniversalTransferDocumentInfo read FUniversalTransferDocumentInfo;//15;
    property UniversalCorrectionDocumentInfo:TUniversalCorrectionDocumentInfo read FUniversalCorrectionDocumentInfo; //16
    property AttachmentVersion:string read FAttachmentVersion write SetAttachmentVersion; //17;
    property Version:string read FVersion write SetVersion; //18;
  end;

implementation

{ TDocumentInfo }

procedure TDocumentInfo.SetAttachmentVersion(AValue: string);
begin
  if FAttachmentVersion=AValue then Exit;
  FAttachmentVersion:=AValue;
  Modified(17);
end;

procedure TDocumentInfo.SetCounteragentBoxId(AValue: string);
begin
  if FCounteragentBoxId=AValue then Exit;
  FCounteragentBoxId:=AValue;
  Modified(7);
end;

procedure TDocumentInfo.SetCustomDocumentId(AValue: string);
begin
  if FCustomDocumentId=AValue then Exit;
  FCustomDocumentId:=AValue;
  Modified(4);
end;

procedure TDocumentInfo.SetDocumentDirection(AValue: TDocumentDirection);
begin
  FDocumentDirection:=AValue;
  Modified(2);
end;

procedure TDocumentInfo.SetDocumentType(AValue: TDocumentType);
begin
  FDocumentType:=AValue;
  Modified(1);
end;

procedure TDocumentInfo.SetFromDepartmentId(AValue: string);
begin
  if FFromDepartmentId=AValue then Exit;
  FFromDepartmentId:=AValue;
  Modified(5);
end;

procedure TDocumentInfo.SetIsTest(AValue: Boolean);
begin
  FIsTest:=AValue;
  Modified(3);
end;

procedure TDocumentInfo.SetToDepartmentId(AValue: string);
begin
  if FToDepartmentId=AValue then Exit;
  FToDepartmentId:=AValue;
  Modified(6);
end;

procedure TDocumentInfo.SetVersion(AValue: string);
begin
  if FVersion=AValue then Exit;
  FVersion:=AValue;
  Modified(18);
end;

procedure TDocumentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentType', 1);
  RegisterProp('DocumentDirection', 2);
  RegisterProp('IsTest', 3);
  RegisterProp('CustomDocumentId', 4);
  RegisterProp('FromDepartmentId', 5);
  RegisterProp('ToDepartmentId', 6);
  RegisterProp('CounteragentBoxId', 7);
  RegisterProp('DocumentDateAndNumber', 8);
  RegisterProp('BasicDocumentInfo', 9);
  RegisterProp('InvoiceInfo', 10);
  RegisterProp('InvoiceCorrectionInfo', 11);
  RegisterProp('PriceListInfo', 12);
  RegisterProp('ContractInfo', 13);
  RegisterProp('SupplementaryAgreementInfo', 14);
  RegisterProp('UniversalTransferDocumentInfo', 15);
  RegisterProp('UniversalCorrectionDocumentInfo', 16);
  RegisterProp('AttachmentVersion', 17);
  RegisterProp('Version', 18, true);
end;

procedure TDocumentInfo.InternalInit;
begin
  inherited InternalInit;
  FBasicDocumentInfo:=TBasicDocumentInfo.Create;
  FInvoiceInfo:=TInvoiceDocumentInfo.Create;
  FInvoiceCorrectionInfo:=TInvoiceCorrectionDocumentInfo.Create;
  FPriceListInfo:=TPriceListDocumentInfo.Create;
  FContractInfo:=TContractDocumentInfo.Create;
  FSupplementaryAgreementInfo:=TSupplementaryAgreementDocumentInfo.Create;
  FUniversalTransferDocumentInfo:=TUniversalTransferDocumentInfo.Create;
  FUniversalCorrectionDocumentInfo:=TUniversalCorrectionDocumentInfo.Create;
end;

destructor TDocumentInfo.Destroy;
begin
  FreeAndNil(FBasicDocumentInfo);
  FreeAndNil(FInvoiceInfo);
  FreeAndNil(FInvoiceCorrectionInfo);
  FreeAndNil(FPriceListInfo);
  FreeAndNil(FContractInfo);
  FreeAndNil(FSupplementaryAgreementInfo);
  FreeAndNil(FUniversalTransferDocumentInfo);
  FreeAndNil(FUniversalCorrectionDocumentInfo);
  inherited Destroy;
end;

{ TBasicDocumentInfo }

procedure TBasicDocumentInfo.SetGrounds(AValue: string);
begin
  if FGrounds=AValue then Exit;
  FGrounds:=AValue;
  Modified(4);
end;

procedure TBasicDocumentInfo.SetNoVat(AValue: Boolean);
begin
  if FNoVat=AValue then Exit;
  FNoVat:=AValue;
  Modified(2);
end;

procedure TBasicDocumentInfo.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(1);
end;

procedure TBasicDocumentInfo.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(3);
end;

procedure TBasicDocumentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Total', 1);
  RegisterProp('NoVat', 2);
  RegisterProp('Vat', 3);
  RegisterProp('Grounds', 4);
  RegisterProp('RevisionDateAndNumber', 5);
end;

procedure TBasicDocumentInfo.InternalInit;
begin
  inherited InternalInit;
  FRevisionDateAndNumber:=TDocumentDateAndNumber.Create;
end;

destructor TBasicDocumentInfo.Destroy;
begin
  inherited Destroy;
  FreeAndNil(FRevisionDateAndNumber);
end;

{ TInvoiceDocumentInfo }

procedure TInvoiceDocumentInfo.SetCurrencyCode(AValue: int32);
begin
  if FCurrencyCode=AValue then Exit;
  FCurrencyCode:=AValue;
  Modified(3);
end;

procedure TInvoiceDocumentInfo.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(1);
end;

procedure TInvoiceDocumentInfo.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(2);
end;

procedure TInvoiceDocumentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Total', 1);
  RegisterProp('Vat', 2);
  RegisterProp('CurrencyCode', 3);
  RegisterProp('OriginalInvoiceDateAndNumber', 4);
end;

procedure TInvoiceDocumentInfo.InternalInit;
begin
  inherited InternalInit;
  FOriginalInvoiceDateAndNumber:=TDocumentDateAndNumber.Create;
end;

destructor TInvoiceDocumentInfo.Destroy;
begin
  FreeAndNil(FOriginalInvoiceDateAndNumber);
  inherited Destroy;
end;

{ TInvoiceCorrectionDocumentInfo }

procedure TInvoiceCorrectionDocumentInfo.SetCurrencyCode(AValue: int32);
begin
  if FCurrencyCode=AValue then Exit;
  FCurrencyCode:=AValue;
  Modified(5);
end;

procedure TInvoiceCorrectionDocumentInfo.SetTotalDec(AValue: string);
begin
  if FTotalDec=AValue then Exit;
  FTotalDec:=AValue;
  Modified(2);
end;

procedure TInvoiceCorrectionDocumentInfo.SetTotalInc(AValue: string);
begin
  if FTotalInc=AValue then Exit;
  FTotalInc:=AValue;
  Modified(1);
end;

procedure TInvoiceCorrectionDocumentInfo.SetVatDec(AValue: string);
begin
  if FVatDec=AValue then Exit;
  FVatDec:=AValue;
  Modified(4);
end;

procedure TInvoiceCorrectionDocumentInfo.SetVatInc(AValue: string);
begin
  if FVatInc=AValue then Exit;
  FVatInc:=AValue;
  Modified(3);
end;

procedure TInvoiceCorrectionDocumentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TotalInc', 1);
  RegisterProp('TotalDec', 2);
  RegisterProp('VatInc', 3);
  RegisterProp('VatDec', 4);
  RegisterProp('CurrencyCode', 5);
  RegisterProp('OriginalInvoiceDateAndNumber', 6);
  RegisterProp('OriginalInvoiceRevisionDateAndNumber', 7);
  RegisterProp('OriginalInvoiceCorrectionDateAndNumber', 8);
end;

procedure TInvoiceCorrectionDocumentInfo.InternalInit;
begin
  inherited InternalInit;
  FOriginalInvoiceDateAndNumber:=TDocumentDateAndNumber.Create;
  FOriginalInvoiceRevisionDateAndNumber:=TDocumentDateAndNumber.Create;
  FOriginalInvoiceCorrectionDateAndNumber:=TDocumentDateAndNumber.Create;
end;

destructor TInvoiceCorrectionDocumentInfo.Destroy;
begin
  FreeAndNil(FOriginalInvoiceDateAndNumber);
  FreeAndNil(FOriginalInvoiceRevisionDateAndNumber);
  FreeAndNil(FOriginalInvoiceCorrectionDateAndNumber);
  inherited Destroy;
end;

{ TPriceListDocumentInfo }

procedure TPriceListDocumentInfo.SetPriceListEffectiveDate(AValue: string);
begin
  if FPriceListEffectiveDate=AValue then Exit;
  FPriceListEffectiveDate:=AValue;
  Modified(1);
end;

procedure TPriceListDocumentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('PriceListEffectiveDate', 1);
  RegisterProp('ContractDocumentDateAndNumber', 2);
end;

procedure TPriceListDocumentInfo.InternalInit;
begin
  inherited InternalInit;
  FContractDocumentDateAndNumber:=TDocumentDateAndNumber.Create;
end;

destructor TPriceListDocumentInfo.Destroy;
begin
  FContractDocumentDateAndNumber.Free;
  inherited Destroy;
end;

{ TContractDocumentInfo }

procedure TContractDocumentInfo.SetContractPrice(AValue: string);
begin
  if FContractPrice=AValue then Exit;
  FContractPrice:=AValue;
  Modified(1);
end;

procedure TContractDocumentInfo.SetContractType(AValue: string);
begin
  if FContractType=AValue then Exit;
  FContractType:=AValue;
  Modified(2);
end;

procedure TContractDocumentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ContractPrice', 1);
  RegisterProp('ContractType', 2);
end;

procedure TContractDocumentInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TContractDocumentInfo.Destroy;
begin
  inherited Destroy;
end;

{ TSupplementaryAgreementDocumentInfo }

procedure TSupplementaryAgreementDocumentInfo.SetContractDate(AValue: string);
begin
  if FContractDate=AValue then Exit;
  FContractDate:=AValue;
  Modified(4);
end;

procedure TSupplementaryAgreementDocumentInfo.SetContractNumber(AValue: string);
begin
  if FContractNumber=AValue then Exit;
  FContractNumber:=AValue;
  Modified(3);
end;

procedure TSupplementaryAgreementDocumentInfo.SetContractType(AValue: string);
begin
  if FContractType=AValue then Exit;
  FContractType:=AValue;
  Modified(2);
end;

procedure TSupplementaryAgreementDocumentInfo.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(1);
end;

procedure TSupplementaryAgreementDocumentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Total', 1);
  RegisterProp('ContractType', 2);
  RegisterProp('ContractNumber', 3);
  RegisterProp('ContractDate', 4);
end;

procedure TSupplementaryAgreementDocumentInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TSupplementaryAgreementDocumentInfo.Destroy;
begin
  inherited Destroy;
end;

{ TUniversalTransferDocumentInfo }

procedure TUniversalTransferDocumentInfo.SetCurrencyCode(AValue: int32);
begin
  if FCurrencyCode=AValue then Exit;
  FCurrencyCode:=AValue;
  Modified(3);
end;

procedure TUniversalTransferDocumentInfo.SetFunctionType(AValue: TFunctionType);
begin
  if FFunctionType=AValue then Exit;
  FFunctionType:=AValue;
  Modified(5);
end;

procedure TUniversalTransferDocumentInfo.SetGrounds(AValue: string);
begin
  if FGrounds=AValue then Exit;
  FGrounds:=AValue;
  Modified(4);
end;

procedure TUniversalTransferDocumentInfo.SetTotal(AValue: string);
begin
  if FTotal=AValue then Exit;
  FTotal:=AValue;
  Modified(1);
end;

procedure TUniversalTransferDocumentInfo.SetVat(AValue: string);
begin
  if FVat=AValue then Exit;
  FVat:=AValue;
  Modified(2);
end;

procedure TUniversalTransferDocumentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Total', 1);
  RegisterProp('Vat', 2);
  RegisterProp('CurrencyCode', 3);
  RegisterProp('Grounds', 4);
  RegisterProp('FunctionType', 5, true);
  RegisterProp('OriginalDocumentDateAndNumber', 6);
end;

procedure TUniversalTransferDocumentInfo.InternalInit;
begin
  inherited InternalInit;
  FOriginalDocumentDateAndNumber:=TDocumentDateAndNumber.Create;
end;

destructor TUniversalTransferDocumentInfo.Destroy;
begin
  FreeAndNil(FOriginalDocumentDateAndNumber);
  inherited Destroy;
end;

{ TDocumentDateAndNumber }

procedure TDocumentDateAndNumber.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  Modified(1);
end;

procedure TDocumentDateAndNumber.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  Modified(2);
end;

procedure TDocumentDateAndNumber.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentDate', 1);
  RegisterProp('DocumentNumber', 2);
end;

procedure TDocumentDateAndNumber.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDocumentDateAndNumber.Destroy;
begin
  inherited Destroy;
end;

{ TUniversalCorrectionDocumentInfo }

procedure TUniversalCorrectionDocumentInfo.SetCurrencyCode(AValue: int32);
begin
  if FCurrencyCode=AValue then Exit;
  FCurrencyCode:=AValue;
  Modified(5);
end;

procedure TUniversalCorrectionDocumentInfo.SetFunctionType(AValue: TFunctionType
  );
begin
  if FFunctionType=AValue then Exit;
  FFunctionType:=AValue;
  Modified(7);
end;

procedure TUniversalCorrectionDocumentInfo.SetGrounds(AValue: string);
begin
  if FGrounds=AValue then Exit;
  FGrounds:=AValue;
  Modified(6);
end;

procedure TUniversalCorrectionDocumentInfo.SetTotalDec(AValue: string);
begin
  if FTotalDec=AValue then Exit;
  FTotalDec:=AValue;
  Modified(2);
end;

procedure TUniversalCorrectionDocumentInfo.SetTotalInc(AValue: string);
begin
  if FTotalInc=AValue then Exit;
  FTotalInc:=AValue;
  Modified(1);
end;

procedure TUniversalCorrectionDocumentInfo.SetVatDec(AValue: string);
begin
  if FVatDec=AValue then Exit;
  FVatDec:=AValue;
  Modified(4);
end;

procedure TUniversalCorrectionDocumentInfo.SetVatInc(AValue: string);
begin
  if FVatInc=AValue then Exit;
  FVatInc:=AValue;
  Modified(3);
end;

procedure TUniversalCorrectionDocumentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TotalInc', 1);
  RegisterProp('TotalDec', 2);
  RegisterProp('VatInc', 3);
  RegisterProp('VatDec', 4);
  RegisterProp('CurrencyCode', 5);
  RegisterProp('Grounds', 6);
  RegisterProp('FunctionType', 7, true);
  RegisterProp('OriginalDocumentDateAndNumber', 8);
  RegisterProp('OriginalDocumentRevisionDateAndNumber', 9);
  RegisterProp('OriginalDocumentCorrectionDateAndNumber', 10);
end;

procedure TUniversalCorrectionDocumentInfo.InternalInit;
begin
  inherited InternalInit;
  FOriginalDocumentDateAndNumber:=TDocumentDateAndNumber.Create;
  FOriginalDocumentRevisionDateAndNumber:=TDocumentDateAndNumber.Create;
  FOriginalDocumentCorrectionDateAndNumber:=TDocumentDateAndNumber.Create;
end;

destructor TUniversalCorrectionDocumentInfo.Destroy;
begin
  FreeAndNil(FOriginalDocumentDateAndNumber);
  FreeAndNil(FOriginalDocumentRevisionDateAndNumber);
  FreeAndNil(FOriginalDocumentCorrectionDateAndNumber);
  inherited Destroy;
end;

end.

