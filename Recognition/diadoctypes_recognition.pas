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

unit DiadocTypes_Recognition;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc;

type
  TRecognizedDocumentType = (
    UnknownRecognizedDocumentType = -1, // Reserved type to report to legacy clients for newly introduced types
    Invoice = 1
  );


  {  TRecognizedInvoice  }
  //message RecognizedInvoice {
  //    required string MetadataJson = 1;
  //    optional string ValidationErrorMessage = 2;
  //}
  TRecognizedInvoice = class(TSerializationObject)
  private
    FMetadataJson: string;
    FValidationErrorMessage: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property MetadataJson:string read FMetadataJson write FMetadataJson;//1;
    property ValidationErrorMessage:string read FValidationErrorMessage write FValidationErrorMessage;//2;
  end;


  {  TRecognized  }
  //message Recognized {
  //    required string RecognitionId = 1;
  //    optional string ErrorMessage = 2;
  //    optional string FileName = 3;
  //    optional RecognizedDocumentType DocumentType = 4 [default = UnknownRecognizedDocumentType];
  //    optional bytes Content = 5;
  //    optional RecognizedInvoice Invoice = 6;
  //}
  TRecognized = class(TSerializationObject)
  private
    FContent: TBytes;
    FDocumentType: TRecognizedDocumentType;
    FErrorMessage: string;
    FFileName: string;
    FInvoice: TRecognizedInvoice;
    FRecognitionId: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property RecognitionId:string read FRecognitionId write FRecognitionId;//1;
    property ErrorMessage:string read FErrorMessage write FErrorMessage;//2;
    property FileName:string read FFileName write FFileName;//3;
    property DocumentType:TRecognizedDocumentType read FDocumentType write FDocumentType default UnknownRecognizedDocumentType;//4
    property Content:TBytes read FContent write FContent;// 5;
    property Invoice:TRecognizedInvoice read FInvoice;//6;
  end;


implementation

{ TRecognized }

procedure TRecognized.InternalInit;
begin
  inherited InternalInit;
  FInvoice:=TRecognizedInvoice.Create;
  FDocumentType:=UnknownRecognizedDocumentType;
end;

procedure TRecognized.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RecognitionId', 1, true);
  RegisterProp('ErrorMessage', 2);
  RegisterProp('FileName', 3);
  RegisterProp('DocumentType', 4);
  RegisterProp('Content', 5);
  RegisterProp('Invoice', 6);
end;

destructor TRecognized.Destroy;
begin
  FreeAndNil(FInvoice);
  inherited Destroy;
end;

{ TRecognizedInvoice }

procedure TRecognizedInvoice.InternalInit;
begin
  inherited InternalInit;
end;

procedure TRecognizedInvoice.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('MetadataJson', 1, true);;
  RegisterProp('ValidationErrorMessage', 2);
end;

destructor TRecognizedInvoice.Destroy;
begin
  inherited Destroy;
end;

end.

