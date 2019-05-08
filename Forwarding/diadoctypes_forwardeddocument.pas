{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2019 Lagunov Aleksey alexs75@yandex.ru

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

unit DiadocTypes_ForwardedDocument;

{$I diadoc_define.inc}

interface

//import "Timestamp.proto";
//import "DocumentId.proto";
//import "Docflow/DocumentWithDocflow.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_Timestamp,
  DiadocTypes_DocumentId,
  DiadocTypes_DocumentWithDocflow
  ;

type
  {  TForwardedDocumentId  }
  //message ForwardedDocumentId
  //{
  //	optional string FromBoxId = 1;
  //	optional DocumentId DocumentId = 2;
  //	optional string ForwardEventId = 3;
  //}
  TForwardedDocumentId = class(TSerializationObject)
  private
    FDocumentId: TDocumentId;
    FForwardEventId: string;
    FFromBoxId: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property FromBoxId:string read FFromBoxId write FFromBoxId;//1;
    property DocumentId:TDocumentId read FDocumentId; //2;
    property ForwardEventId:string read FForwardEventId write FForwardEventId;//3;
  end;
  TForwardedDocumentIds = specialize GSerializationObjectList<TForwardedDocumentId>;

  {  TForwardedDocument  }
  //message ForwardedDocument
  //{
  //	optional Timestamp ForwardTimestamp = 1;
  //	optional ForwardedDocumentId ForwardedDocumentId = 2;
  //	optional Docflow.DocumentWithDocflow DocumentWithDocflow = 3;
  //}
  TForwardedDocument = class(TSerializationObject)
  private
    FDocumentWithDocflow: TDocumentWithDocflow;
    FForwardedDocumentId: TForwardedDocumentId;
    FForwardTimestamp: TTimestamp;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property ForwardTimestamp:TTimestamp read FForwardTimestamp;//1;
    property ForwardedDocumentId:TForwardedDocumentId read FForwardedDocumentId; //2;
    property DocumentWithDocflow:TDocumentWithDocflow read FDocumentWithDocflow; //3;
  end;
  TForwardedDocuments = specialize GSerializationObjectList<TForwardedDocument>;

implementation


{ TForwardedDocument }

procedure TForwardedDocument.InternalInit;
begin
  inherited InternalInit;
  FForwardTimestamp:=TTimestamp.Create;
  FForwardedDocumentId:=TForwardedDocumentId.Create;
  FDocumentWithDocflow:=TDocumentWithDocflow.Create;
end;

procedure TForwardedDocument.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ForwardTimestamp', 1);
  RegisterProp('ForwardedDocumentId', 2);
  RegisterProp('DocumentWithDocflow', 3);
end;

destructor TForwardedDocument.Destroy;
begin
  FreeAndNil(FForwardTimestamp);
  FreeAndNil(FForwardedDocumentId);
  FreeAndNil(FDocumentWithDocflow);
  inherited Destroy;
end;

{ TForwardedDocumentId }

procedure TForwardedDocumentId.InternalInit;
begin
  inherited InternalInit;
  FDocumentId:=TDocumentId.Create;
end;

procedure TForwardedDocumentId.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FromBoxId', 1);
  RegisterProp('DocumentId', 2);
  RegisterProp('ForwardEventId', 3);
end;

destructor TForwardedDocumentId.Destroy;
begin
  FreeAndNil(FDocumentId);
  inherited Destroy;
end;

end.

