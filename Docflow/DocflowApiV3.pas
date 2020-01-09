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

unit DocflowApiV3;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_Timestamp, DiadocTypes_DocumentId, TotalCountType, DocumentWithDocflowV3;

type

  TGetDocflowBatchResponseV3 = class;
  TSearchDocflowsResponseV3 = class;
  TFetchedDocumentV3 = class;
  TGetDocflowsByPacketIdResponseV3 = class;
  TGetDocflowEventsResponseV3 = class;
  TDocflowEventV3 = class;

  { GetDocflowBatchResponseV3 } 
  //message GetDocflowBatchResponseV3
  //{
  //	repeated DocumentWithDocflowV3 Documents = 1;
  //}
  TGetDocflowBatchResponseV3 = class(TSerializationObject)
  private
    FDocuments:TDocumentWithDocflowV3s;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Documents:TDocumentWithDocflowV3s read FDocuments;
  end;
  TGetDocflowBatchResponseV3s = specialize GSerializationObjectList<TGetDocflowBatchResponseV3>;

  { SearchDocflowsResponseV3 } 
  //message SearchDocflowsResponseV3
  //{
  //	repeated DocumentWithDocflowV3 Documents = 1;
  //	required bool HaveMoreDocuments = 2;
  //}
  TSearchDocflowsResponseV3 = class(TSerializationObject)
  private
    FDocuments:TDocumentWithDocflowV3s;
    FHaveMoreDocuments:Boolean;
    procedure SetHaveMoreDocuments(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Documents:TDocumentWithDocflowV3s read FDocuments;
    property HaveMoreDocuments:Boolean read FHaveMoreDocuments write SetHaveMoreDocuments;
  end;
  TSearchDocflowsResponseV3s = specialize GSerializationObjectList<TSearchDocflowsResponseV3>;

  { FetchedDocumentV3 } 
  //message FetchedDocumentV3
  //{
  //	required DocumentWithDocflowV3 Document = 1;
  //	required bytes IndexKey = 2;
  //}
  TFetchedDocumentV3 = class(TSerializationObject)
  private
    FDocument:TDocumentWithDocflowV3;
    FIndexKey:TBytes;
    procedure SetIndexKey(AValue:TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Document:TDocumentWithDocflowV3 read FDocument;
    property IndexKey:TBytes read FIndexKey write SetIndexKey;
  end;
  TFetchedDocumentV3s = specialize GSerializationObjectList<TFetchedDocumentV3>;

  { GetDocflowsByPacketIdResponseV3 } 
  //message GetDocflowsByPacketIdResponseV3
  //{
  //	repeated FetchedDocumentV3 Documents = 1;
  //	optional bytes NextPageIndexKey = 2;
  //}
  TGetDocflowsByPacketIdResponseV3 = class(TSerializationObject)
  private
    FDocuments:TFetchedDocumentV3s;
    FNextPageIndexKey:TBytes;
    procedure SetNextPageIndexKey(AValue:TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Documents:TFetchedDocumentV3s read FDocuments;
    property NextPageIndexKey:TBytes read FNextPageIndexKey write SetNextPageIndexKey;
  end;
  TGetDocflowsByPacketIdResponseV3s = specialize GSerializationObjectList<TGetDocflowsByPacketIdResponseV3>;

  { DocflowEventV3 }
  //message DocflowEventV3
  //{
  //	required string EventId = 1;
  //	required Timestamp Timestamp = 2;
  //	required DocumentId DocumentId = 3;
  //	required bytes IndexKey = 4;
  //	optional DocumentWithDocflowV3 Document = 5;
  //	optional string PreviousEventId = 6;
  //	optional DocumentWithDocflowV3 PreviousDocumentState = 7;
  //}
  TDocflowEventV3 = class(TSerializationObject)
  private
    FEventId:String;
    FTimestamp:TTimestamp;
    FDocumentId:TDocumentId;
    FIndexKey:TBytes;
    FDocument:TDocumentWithDocflowV3;
    FPreviousEventId:String;
    FPreviousDocumentState:TDocumentWithDocflowV3;
    procedure SetEventId(AValue:String);
    procedure SetIndexKey(AValue:TBytes);
    procedure SetPreviousEventId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property EventId:String read FEventId write SetEventId;
    property Timestamp:TTimestamp read FTimestamp;
    property DocumentId:TDocumentId read FDocumentId;
    property IndexKey:TBytes read FIndexKey write SetIndexKey;
    property Document:TDocumentWithDocflowV3 read FDocument;
    property PreviousEventId:String read FPreviousEventId write SetPreviousEventId;
    property PreviousDocumentState:TDocumentWithDocflowV3 read FPreviousDocumentState;
  end;
  TDocflowEventV3s = specialize GSerializationObjectList<TDocflowEventV3>;

  { GetDocflowEventsResponseV3 } 
  //message GetDocflowEventsResponseV3
  //{
  //	required int32 TotalCount = 1;
  //	repeated DocflowEventV3 Events = 2;
  //	required TotalCountType TotalCountType = 3;
  //}
  TGetDocflowEventsResponseV3 = class(TSerializationObject)
  private
    FTotalCount:Integer;
    FEvents:TDocflowEventV3s;
    FTotalCountType:TTotalCountType;
    procedure SetTotalCount(AValue:Integer);
    procedure SetTotalCountType(AValue:TTotalCountType);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TotalCount:Integer read FTotalCount write SetTotalCount;
    property Events:TDocflowEventV3s read FEvents;
    property TotalCountType:TTotalCountType read FTotalCountType write SetTotalCountType;
  end;
  TGetDocflowEventsResponseV3s = specialize GSerializationObjectList<TGetDocflowEventsResponseV3>;

implementation

  { GetDocflowBatchResponseV3 } 

procedure TGetDocflowBatchResponseV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Documents', 1);
end;

procedure TGetDocflowBatchResponseV3.InternalInit;
begin
  inherited InternalInit;
  FDocuments:= TDocumentWithDocflowV3s.Create;
end;

destructor TGetDocflowBatchResponseV3.Destroy;
begin
  FDocuments.Free;
  inherited Destroy;
end;


  { SearchDocflowsResponseV3 } 

procedure TSearchDocflowsResponseV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Documents', 1);
  RegisterProp('HaveMoreDocuments', 2, true);
end;

procedure TSearchDocflowsResponseV3.InternalInit;
begin
  inherited InternalInit;
  FDocuments:= TDocumentWithDocflowV3s.Create;
end;

destructor TSearchDocflowsResponseV3.Destroy;
begin
  FDocuments.Free;
  inherited Destroy;
end;

procedure TSearchDocflowsResponseV3.SetHaveMoreDocuments(AValue:Boolean);
begin
  FHaveMoreDocuments:=AValue;
  Modified(2);
end;


  { FetchedDocumentV3 } 

procedure TFetchedDocumentV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Document', 1, true);
  RegisterProp('IndexKey', 2, true);
end;

procedure TFetchedDocumentV3.InternalInit;
begin
  inherited InternalInit;
  FDocument:= TDocumentWithDocflowV3.Create;
end;

destructor TFetchedDocumentV3.Destroy;
begin
  FDocument.Free;
  inherited Destroy;
end;

procedure TFetchedDocumentV3.SetIndexKey(AValue:TBytes);
begin
  FIndexKey:=AValue;
  Modified(2);
end;


  { GetDocflowsByPacketIdResponseV3 } 

procedure TGetDocflowsByPacketIdResponseV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Documents', 1);
  RegisterProp('NextPageIndexKey', 2);
end;

procedure TGetDocflowsByPacketIdResponseV3.InternalInit;
begin
  inherited InternalInit;
  FDocuments:= TFetchedDocumentV3s.Create;
end;

destructor TGetDocflowsByPacketIdResponseV3.Destroy;
begin
  FDocuments.Free;
  inherited Destroy;
end;

procedure TGetDocflowsByPacketIdResponseV3.SetNextPageIndexKey(AValue:TBytes);
begin
  FNextPageIndexKey:=AValue;
  Modified(2);
end;


  { GetDocflowEventsResponseV3 } 

procedure TGetDocflowEventsResponseV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TotalCount', 1, true);
  RegisterProp('Events', 2);
  RegisterProp('TotalCountType', 3, true);
end;

procedure TGetDocflowEventsResponseV3.InternalInit;
begin
  inherited InternalInit;
  FEvents:= TDocflowEventV3s.Create;
end;

destructor TGetDocflowEventsResponseV3.Destroy;
begin
  FEvents.Free;
  inherited Destroy;
end;

procedure TGetDocflowEventsResponseV3.SetTotalCount(AValue:Integer);
begin
  FTotalCount:=AValue;
  Modified(1);
end;

procedure TGetDocflowEventsResponseV3.SetTotalCountType(AValue:TTotalCountType);
begin
  FTotalCountType:=AValue;
  Modified(3);
end;


  { DocflowEventV3 } 

procedure TDocflowEventV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('EventId', 1, true);
  RegisterProp('Timestamp', 2, true);
  RegisterProp('DocumentId', 3, true);
  RegisterProp('IndexKey', 4, true);
  RegisterProp('Document', 5);
  RegisterProp('PreviousEventId', 6);
  RegisterProp('PreviousDocumentState', 7);
end;

procedure TDocflowEventV3.InternalInit;
begin
  inherited InternalInit;
  FTimestamp:= TTimestamp.Create;
  FDocumentId:= TDocumentId.Create;
  FDocument:= TDocumentWithDocflowV3.Create;
  FPreviousDocumentState:= TDocumentWithDocflowV3.Create;
end;

destructor TDocflowEventV3.Destroy;
begin
  FTimestamp.Free;
  FDocumentId.Free;
  FDocument.Free;
  FPreviousDocumentState.Free;
  inherited Destroy;
end;

procedure TDocflowEventV3.SetEventId(AValue:String);
begin
  FEventId:=AValue;
  Modified(1);
end;

procedure TDocflowEventV3.SetIndexKey(AValue:TBytes);
begin
  FIndexKey:=AValue;
  Modified(4);
end;

procedure TDocflowEventV3.SetPreviousEventId(AValue:String);
begin
  FPreviousEventId:=AValue;
  Modified(6);
end;

end.
