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

unit DiadocTypes_AcceptanceCertificateInfo;

{$I diadoc_define.inc}

interface

//import "Invoicing/Signer.proto";
//import "Invoicing/Official.proto";
//import "Invoicing/OrganizationInfo.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_Signer,
  DiadocTypes_Official,
  DiadocTypes_OrganizationInfo;


type
  {  WorkItem  }
  //message WorkItem {
  //	optional string Name = 1;												// наименование
  //	optional string Description = 2;										// описание работы
  //	optional string UnitCode = 3;											// код единицы измерения
  //	optional string UnitName = 4;											// наименование единицы измерения
  //	optional string Price = 5;												// цена
  //	optional string Quantity = 6;											// количество
  //	optional string SubtotalWithVatExcluded = 7;							// сумма без учета НДС
  //	optional string Vat = 8;												// сумма НДС
  //	optional string Subtotal = 9;											// сумма с учетом НДС
  //	optional string AdditionalInfo = 10;									// информационное поле сведений о работе (услуге)
  //}

  { TWorkItem }

  TWorkItem = class(TSerializationObject)
  private
    FAdditionalInfo: string;
    FDescription: string;
    FName: string;
    FPrice: string;
    FQuantity: string;
    FSubtotal: string;
    FSubtotalWithVatExcluded: string;
    FUnitCode: string;
    FUnitName: string;
    FVat: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Name:string read FName write FName;//1
    property Description:string read FDescription write FDescription;//2;
    property UnitCode:string read FUnitCode write FUnitCode;//3;
    property UnitName:string read FUnitName write FUnitName;//4;
    property Price:string read FPrice write FPrice;//5;
    property Quantity:string read FQuantity write FQuantity;//6;
    property SubtotalWithVatExcluded:string read FSubtotalWithVatExcluded write FSubtotalWithVatExcluded;//7;
    property Vat:string read FVat write FVat;//8;
    property Subtotal:string read FSubtotal write FSubtotal;//9;
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo;//10;
  end;
  TWorkItems = specialize GSerializationObjectList<TWorkItem>;

  {  TWorkDescription  }
  // Описание работ
  //message WorkDescription {
  //	optional string StartingDate = 1;										// начало периода выполнения работ
  //	optional string CompletionDate = 2;										// окончание периода выполнения работ
  //	optional string TotalWithVatExcluded = 3;								// сумма без учета НДС - итого
  //	optional string Vat = 4;												// сумма НДС - итого
  //	required string Total = 5;												// сумма с учетом НДС - итого
  //	repeated WorkItem Items = 6;											// сведения о произведенной работе
  //}
  TWorkDescription = class(TSerializationObject)
  private
    FCompletionDate: string;
    FItems: TWorkItems;
    FStartingDate: string;
    FTotal: string;
    FTotalWithVatExcluded: string;
    FVat: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property StartingDate:string read FStartingDate write FStartingDate;//1;
    property CompletionDate:string read FCompletionDate write FCompletionDate;//2;
    property TotalWithVatExcluded:string read FTotalWithVatExcluded write FTotalWithVatExcluded;//3;
    property Vat:string read FVat write FVat;//4;
    property Total:string read FTotal write FTotal;//5;
    property Items:TWorkItems read FItems;//6;
  end;
  TWorkDescriptions = specialize GSerializationObjectList<TWorkDescription>;

  {  TAcceptanceCertificateSignatureInfo  }
  //message AcceptanceCertificateSignatureInfo {
  //	optional string SignatureDate = 1;										// дата подписи акта исполнителем / заказчиком
  //	optional Official Official = 2;											// лицо, подписывающее со стороны исполнителя / заказчика
  //	optional Attorney Attorney = 3;											// сведения о доверенности подписывающего со стороны исполнителя / заказчика
  //}
  TAcceptanceCertificateSignatureInfo = class(TSerializationObject)
  private
    FAttorney: TAttorney;
    FOfficial: TOfficial;
    FSignatureDate: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property SignatureDate:string read FSignatureDate write FSignatureDate;//1;
    property Official:TOfficial read FOfficial;//2;
    property Attorney:TAttorney read FAttorney;//3;
  end;


  {  TAcceptanceCertificateBuyerTitleInfo  }
  // Со стороны заказчика
  //message AcceptanceCertificateBuyerTitleInfo {
  //	optional string Complaints = 1;											// претензии
  //	required AcceptanceCertificateSignatureInfo Signature = 2;				// сведения о подписи акта
  //	required Signer Signer = 3;												// подписант
  //	optional string AdditionalInfo = 4;										// дополнительная информация
  //}
  TAcceptanceCertificateBuyerTitleInfo = class(TSerializationObject)
  private
    FAdditionalInfo: string;
    FComplaints: string;
    FSignature: TAcceptanceCertificateSignatureInfo;
    FSigner: TSigner;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Complaints:string read FComplaints write FComplaints;//1;
    property Signature:TAcceptanceCertificateSignatureInfo read FSignature;//2;
    property Signer:TSigner read FSigner;//3;
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo;//4;
  end;



  {  TAcceptanceCertificateSellerTitleInfo}
  // Со стороны исполнителя
  //message AcceptanceCertificateSellerTitleInfo {
  //	required DiadocOrganizationInfo Seller = 1;								// исполнитель (продавец услуг)
  //	required DocflowParticipant Buyer = 2;									// заказчик (покупатель услуг)
  //	required string DocumentDate = 3;										// дата составления акта о выполнении
  //	optional string DocumentNumber = 4;										// номер акта
  //	required string DocumentTitle = 5;										// заголовок документа
  //	repeated WorkDescription Works = 6;										// описание выполненных работ
  //	required AcceptanceCertificateSignatureInfo Signature = 7;				// сведения о подписи акта
  //	required Signer Signer = 8;												// подписант
  //	optional string AdditionalInfo = 9;										// дополнительная информация
  //}
  TAcceptanceCertificateSellerTitleInfo = class(TSerializationObject)
  private
    FAdditionalInfo: string;
    FBuyer: TDocflowParticipant;
    FDocumentDate: string;
    FDocumentNumber: string;
    FDocumentTitle: string;
    FSeller: TDiadocOrganizationInfo;
    FSignature: TAcceptanceCertificateSignatureInfo;
    FSigner: TSigner;
    FWorks: TWorkDescriptions;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Seller:TDiadocOrganizationInfo read FSeller;//1;
    property Buyer:TDocflowParticipant read FBuyer;//2;
    property DocumentDate:string read FDocumentDate write FDocumentDate;//3;
    property DocumentNumber:string read FDocumentNumber write FDocumentNumber;//4;
    property DocumentTitle:string read FDocumentTitle write FDocumentTitle;//5;
    property Works:TWorkDescriptions read FWorks;//6;
    property Signature:TAcceptanceCertificateSignatureInfo read FSignature; //7;
    property Signer:TSigner read FSigner;//8;
    property AdditionalInfo:string read FAdditionalInfo write FAdditionalInfo;//9;
  end;


implementation

{ TAcceptanceCertificateSellerTitleInfo }

procedure TAcceptanceCertificateSellerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FSeller:=TDiadocOrganizationInfo.Create;
  FBuyer:=TDocflowParticipant.Create;
  FWorks:=TWorkDescriptions.Create;
  FSignature:=TAcceptanceCertificateSignatureInfo.Create;
  FSigner:=TSigner.Create;
end;

procedure TAcceptanceCertificateSellerTitleInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Seller', 1);
  RegisterProp('Buyer', 2);
  RegisterProp('DocumentDate', 3);
  RegisterProp('DocumentNumber', 4);
  RegisterProp('DocumentTitle', 5);
  RegisterProp('Works', 6);
  RegisterProp('Signature', 7);
  RegisterProp('Signer', 8);
  RegisterProp('AdditionalInfo', 9);
end;

destructor TAcceptanceCertificateSellerTitleInfo.Destroy;
begin
  FreeAndNil(FSeller);
  FreeAndNil(FBuyer);
  FreeAndNil(FWorks);
  FreeAndNil(FSignature);
  FreeAndNil(FSigner);
  inherited Destroy;
end;

{ TAcceptanceCertificateBuyerTitleInfo }

procedure TAcceptanceCertificateBuyerTitleInfo.InternalInit;
begin
  inherited InternalInit;
  FSignature:=TAcceptanceCertificateSignatureInfo.Create;
  FSigner:=TSigner.Create;
end;

procedure TAcceptanceCertificateBuyerTitleInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Complaints', 1);
  RegisterProp('Signature', 2);
  RegisterProp('Signer', 3);
  RegisterProp('AdditionalInfo', 4);
end;

destructor TAcceptanceCertificateBuyerTitleInfo.Destroy;
begin
  FreeAndNil(FSignature);
  FreeAndNil(FSigner);
  inherited Destroy;
end;

{ TAcceptanceCertificateSignatureInfo }

procedure TAcceptanceCertificateSignatureInfo.InternalInit;
begin
  inherited InternalInit;
  FOfficial:=TOfficial.Create;
  FAttorney:=TAttorney.Create;
end;

procedure TAcceptanceCertificateSignatureInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignatureDate', 1);
  RegisterProp('Official', 2);
  RegisterProp('Attorney', 3);
end;

destructor TAcceptanceCertificateSignatureInfo.Destroy;
begin
  FreeAndNil(FOfficial);
  FreeAndNil(FAttorney);
  inherited Destroy;
end;

{ TWorkDescription }

procedure TWorkDescription.InternalInit;
begin
  inherited InternalInit;
  FItems:=TWorkItems.Create;
end;

procedure TWorkDescription.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('StartingDate', 1);
  RegisterProp('CompletionDate', 2);
  RegisterProp('TotalWithVatExcluded', 3);
  RegisterProp('Vat', 4);
  RegisterProp('Total', 5);
  RegisterProp('Items', 6);
end;

destructor TWorkDescription.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

{ TWorkItem }

procedure TWorkItem.InternalInit;
begin
  inherited InternalInit;
end;

procedure TWorkItem.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1);
  RegisterProp('Description', 2);
  RegisterProp('UnitCode', 3);
  RegisterProp('UnitName', 4);
  RegisterProp('Price', 5);
  RegisterProp('Quantity', 6);
  RegisterProp('SubtotalWithVatExcluded', 7);
  RegisterProp('Vat', 8);
  RegisterProp('Subtotal', 9);
  RegisterProp('AdditionalInfo', 10);
end;

destructor TWorkItem.Destroy;
begin
  inherited Destroy;
end;

end.

