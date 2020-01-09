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

unit DocumentWithDocflowV3;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_DocumentId, DiadocTypes_Timestamp,
  DocumentInfoV3, DocflowV3;

type

  TDocumentWithDocflowV3 = class;
  TLastEvent = class;

  { DocumentWithDocflowV3 } 
  //message DocumentWithDocflowV3
  //{
  //	required DocumentId DocumentId = 1;
  //	required LastEvent LastEvent = 2;
  //	required DocumentInfoV3 DocumentInfo = 3;
  //	required DocflowV3 Docflow = 4;
  //}
  TDocumentWithDocflowV3 = class(TSerializationObject)
  private
    FDocumentId:TDocumentId;
    FLastEvent:TLastEvent;
    FDocumentInfo:TDocumentInfoV3;
    FDocflow:TDocflowV3;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:TDocumentId read FDocumentId;
    property LastEvent:TLastEvent read FLastEvent;
    property DocumentInfo:TDocumentInfoV3 read FDocumentInfo;
    property Docflow:TDocflowV3 read FDocflow;
  end;
  TDocumentWithDocflowV3s = specialize GSerializationObjectList<TDocumentWithDocflowV3>;

  { LastEvent } 
  //message LastEvent
  //{
  //	required string EventId = 1;
  //	required Timestamp Timestamp = 2;
  //}
  TLastEvent = class(TSerializationObject)
  private
    FEventId:String;
    FTimestamp:TTimestamp;
    procedure SetEventId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property EventId:String read FEventId write SetEventId;
    property Timestamp:TTimestamp read FTimestamp;
  end;
  TLastEvents = specialize GSerializationObjectList<TLastEvent>;

implementation

  { DocumentWithDocflowV3 } 

procedure TDocumentWithDocflowV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentId', 1, true);
  RegisterProp('LastEvent', 2, true);
  RegisterProp('DocumentInfo', 3, true);
  RegisterProp('Docflow', 4, true);
end;

procedure TDocumentWithDocflowV3.InternalInit;
begin
  inherited InternalInit;
  FDocumentId:= TDocumentId.Create;
  FLastEvent:= TLastEvent.Create;
  FDocumentInfo:= TDocumentInfoV3.Create;
  FDocflow:= TDocflowV3.Create;
end;

destructor TDocumentWithDocflowV3.Destroy;
begin
  FDocumentId.Free;
  FLastEvent.Free;
  FDocumentInfo.Free;
  FDocflow.Free;
  inherited Destroy;
end;


  { LastEvent } 

procedure TLastEvent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('EventId', 1, true);
  RegisterProp('Timestamp', 2, true);
end;

procedure TLastEvent.InternalInit;
begin
  inherited InternalInit;
  FTimestamp:= TTimestamp.Create;
end;

destructor TLastEvent.Destroy;
begin
  FTimestamp.Free;
  inherited Destroy;
end;

procedure TLastEvent.SetEventId(AValue:String);
begin
  FEventId:=AValue;
  Modified(1);
end;

end.
