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

unit DiadocTypes_UnilateralDocument;

{$I diadoc_define.inc}

interface

//import "Documents/ReceiptStatus.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_ReceiptStatus
  ;

type
  TUnilateralDocumentStatus = (
    UnknownUnilateralDocumentStatus = 0, // Reserved status to report to legacy clients for newly introduced statuses
    Outbound = 1,
    OutboundWaitingForSenderSignature = 4,
    OutboundInvalidSenderSignature = 5,
    Inbound = 2,
    Internal = 3,
    InternalWaitingForSenderSignature = 6,
    InternalInvalidSenderSignature = 7
  );

  { TServiceDetailsMetadata }
  //message ServiceDetailsMetadata {
  //	required UnilateralDocumentStatus DocumentStatus = 1 [default = UnknownUnilateralDocumentStatus];
  //	required ReceiptStatus ReceiptStatus = 2 [default = UnknownReceiptStatus];
  //}
  TServiceDetailsMetadata = class(TSerializationObject)  //message ServiceDetailsMetadata
  private
    FDocumentStatus: TUnilateralDocumentStatus;
    FReceiptStatus: TReceiptStatus;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property DocumentStatus:TUnilateralDocumentStatus read FDocumentStatus write FDocumentStatus default UnknownUnilateralDocumentStatus; //1
    property ReceiptStatus:TReceiptStatus read FReceiptStatus write FReceiptStatus default UnknownReceiptStatus; //2
  end;



  { TProformaInvoiceMetadata }
  //message ProformaInvoiceMetadata {
	 // optional UnilateralDocumentStatus DocumentStatus = 1 [default = UnknownUnilateralDocumentStatus];
	 // required string Total = 2;
	 // optional string Vat = 3;
	 // optional string Grounds = 4;
	 // optional ReceiptStatus ReceiptStatus = 5 [default = UnknownReceiptStatus];
  //}
  TProformaInvoiceMetadata = class(TSerializationObject)  //message ProformaInvoiceMetadata
  private
    FDocumentStatus: TUnilateralDocumentStatus;
    FGrounds: string;
    FReceiptStatus: TReceiptStatus;
    FTotal: string;
    FVat: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property DocumentStatus:TUnilateralDocumentStatus read FDocumentStatus write FDocumentStatus default UnknownUnilateralDocumentStatus; //1
    property Total:string read FTotal write FTotal;//2
    property Vat:string read FVat write FVat; //3
    property Grounds:string read FGrounds write FGrounds; //4
    property ReceiptStatus:TReceiptStatus read FReceiptStatus write FReceiptStatus default UnknownReceiptStatus; //5
  end;

implementation

{ TServiceDetailsMetadata }

procedure TServiceDetailsMetadata.InternalInit;
begin
  inherited InternalInit;
  DocumentStatus:=UnknownUnilateralDocumentStatus;
  FReceiptStatus:=UnknownReceiptStatus;
end;

procedure TServiceDetailsMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentStatus', 1);
  RegisterProp('ReceiptStatus', 2);
end;

{ TProformaInvoiceMetadata }

procedure TProformaInvoiceMetadata.InternalInit;
begin
  inherited InternalInit;
  FDocumentStatus:=UnknownUnilateralDocumentStatus;
  FReceiptStatus:=UnknownReceiptStatus;
end;

procedure TProformaInvoiceMetadata.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentStatus', 1);
  RegisterProp('Total', 2);
  RegisterProp('Vat', 3);
  RegisterProp('Grounds', 4);
  RegisterProp('ReceiptStatus', 5);
end;

end.

