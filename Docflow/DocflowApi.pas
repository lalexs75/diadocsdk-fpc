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

unit DocflowApi;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_Timestamp, DiadocTypes_DocumentId, TotalCountType,
  DiadocTypes_TimeBasedFilter, DiadocTypes_DocumentWithDocflow;

type

  { SearchScope } 
  //enum SearchScope
  //{
  //	SearchScopeAny = 0;
  //	SearchScopeIncoming = 1;
  //	SearchScopeOutgoing = 2;
  //	SearchScopeDeleted = 3;
  //	SearchScopeInternal = 4;
  //}
  TSearchScope = (
    SearchScopeAny = 0,
    SearchScopeIncoming = 1,
    SearchScopeOutgoing = 2,
    SearchScopeDeleted = 3,
    SearchScopeInternal = 4
  );
  TSearchScopeArray = array of TSearchScope;

  TGetDocflowBatchRequest = class;
  TGetDocflowBatchRequests = specialize GSerializationObjectList<TGetDocflowBatchRequest>;
  TGetDocflowRequest = class;
  TGetDocflowRequests = specialize GSerializationObjectList<TGetDocflowRequest>;
  TGetDocflowBatchResponse = class;
  TGetDocflowBatchResponses = specialize GSerializationObjectList<TGetDocflowBatchResponse>;
  TSearchDocflowsRequest = class;
  TSearchDocflowsRequests = specialize GSerializationObjectList<TSearchDocflowsRequest>;
  TSearchDocflowsResponse = class;
  TSearchDocflowsResponses = specialize GSerializationObjectList<TSearchDocflowsResponse>;
  TGetDocflowsByPacketIdRequest = class;
  TGetDocflowsByPacketIdRequests = specialize GSerializationObjectList<TGetDocflowsByPacketIdRequest>;
  TFetchedDocument = class;
  TFetchedDocuments = specialize GSerializationObjectList<TFetchedDocument>;
  TGetDocflowsByPacketIdResponse = class;
  TGetDocflowsByPacketIdResponses = specialize GSerializationObjectList<TGetDocflowsByPacketIdResponse>;
  TGetDocflowEventsRequest = class;
  TGetDocflowEventsRequests = specialize GSerializationObjectList<TGetDocflowEventsRequest>;
  TGetDocflowEventsResponse = class;
  TGetDocflowEventsResponses = specialize GSerializationObjectList<TGetDocflowEventsResponse>;
  TDocflowEvent = class;
  TDocflowEvents = specialize GSerializationObjectList<TDocflowEvent>;

  { GetDocflowBatchRequest } 
  //message GetDocflowBatchRequest
  //{
  //	repeated GetDocflowRequest Requests = 1;
  //}
  TGetDocflowBatchRequest = class(TSerializationObject)
  private
    FRequests:TGetDocflowRequests;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Requests:TGetDocflowRequests read FRequests;
  end;

  { GetDocflowRequest } 
  //message GetDocflowRequest
  //{
  //	required DocumentId DocumentId = 1;
  //	optional string LastEventId = 2;
  //	optional bool InjectEntityContent = 3 [default = false];
  //}
  TGetDocflowRequest = class(TSerializationObject)
  private
    FDocumentId:TDocumentId;
    FLastEventId:String;
    FInjectEntityContent:Boolean;
    procedure SetLastEventId(AValue:String);
    procedure SetInjectEntityContent(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:TDocumentId read FDocumentId;
    property LastEventId:String read FLastEventId write SetLastEventId;
    property InjectEntityContent:Boolean read FInjectEntityContent write SetInjectEntityContent default false;
  end;

  { GetDocflowBatchResponse } 
  //message GetDocflowBatchResponse
  //{
  //	repeated DocumentWithDocflow Documents = 1;
  //}
  TGetDocflowBatchResponse = class(TSerializationObject)
  private
    FDocuments:TDocumentWithDocflows;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Documents:TDocumentWithDocflows read FDocuments;
  end;

  { SearchDocflowsRequest } 
  //message SearchDocflowsRequest
  //{
  //	required string QueryString = 1;
  //	optional int32 Count = 2 [default = 100];
  //	optional int32 FirstIndex = 3;
  //	optional SearchScope Scope = 4 [default = SearchScopeAny];
  //	optional bool InjectEntityContent = 5 [default = false];
  //}
  TSearchDocflowsRequest = class(TSerializationObject)
  private
    FQueryString:String;
    FCount:Integer;
    FFirstIndex:Integer;
    FScope:TSearchScope;
    FInjectEntityContent:Boolean;
    procedure SetQueryString(AValue:String);
    procedure SetCount(AValue:Integer);
    procedure SetFirstIndex(AValue:Integer);
    function GetScope:TSearchScope;
    procedure SetScope(AValue:TSearchScope);
    procedure SetInjectEntityContent(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
    property Scope:TSearchScope read GetScope write SetScope default SearchScopeAny;
  published
    property QueryString:String read FQueryString write SetQueryString;
    property Count:Integer read FCount write SetCount default 100;
    property FirstIndex:Integer read FFirstIndex write SetFirstIndex;
    property InjectEntityContent:Boolean read FInjectEntityContent write SetInjectEntityContent default false;
  end;

  { SearchDocflowsResponse } 
  //message SearchDocflowsResponse
  //{
  //	repeated DocumentWithDocflow Documents = 1;
  //	optional bool HaveMoreDocuments = 2;
  //}
  TSearchDocflowsResponse = class(TSerializationObject)
  private
    FDocuments:TDocumentWithDocflows;
    FHaveMoreDocuments:Boolean;
    procedure SetHaveMoreDocuments(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Documents:TDocumentWithDocflows read FDocuments;
    property HaveMoreDocuments:Boolean read FHaveMoreDocuments write SetHaveMoreDocuments;
  end;

  { GetDocflowsByPacketIdRequest } 
  //message GetDocflowsByPacketIdRequest
  //{
  //	required string PacketId = 1;
  //	optional int32 Count = 2 [default = 100];
  //	optional bool InjectEntityContent = 3 [default = false];
  //	optional bytes AfterIndexKey = 4;
  //}
  TGetDocflowsByPacketIdRequest = class(TSerializationObject)
  private
    FPacketId:String;
    FCount:Integer;
    FInjectEntityContent:Boolean;
    FAfterIndexKey:TBytes;
    procedure SetPacketId(AValue:String);
    procedure SetCount(AValue:Integer);
    procedure SetInjectEntityContent(AValue:Boolean);
    procedure SetAfterIndexKey(AValue:TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property PacketId:String read FPacketId write SetPacketId;
    property Count:Integer read FCount write SetCount default 100;
    property InjectEntityContent:Boolean read FInjectEntityContent write SetInjectEntityContent default false;
    property AfterIndexKey:TBytes read FAfterIndexKey write SetAfterIndexKey;
  end;

  { FetchedDocument } 
  //message FetchedDocument
  //{
  //	required DocumentWithDocflow Document = 1;
  //	required bytes IndexKey = 2;
  //}
  TFetchedDocument = class(TSerializationObject)
  private
    FDocument:TDocumentWithDocflow;
    FIndexKey:TBytes;
    procedure SetIndexKey(AValue:TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Document:TDocumentWithDocflow read FDocument;
    property IndexKey:TBytes read FIndexKey write SetIndexKey;
  end;

  { GetDocflowsByPacketIdResponse } 
  //message GetDocflowsByPacketIdResponse
  //{
  //	repeated FetchedDocument Documents = 1;
  //	optional bytes NextPageIndexKey = 2;
  //}
  TGetDocflowsByPacketIdResponse = class(TSerializationObject)
  private
    FDocuments:TFetchedDocuments;
    FNextPageIndexKey:TBytes;
    procedure SetNextPageIndexKey(AValue:TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Documents:TFetchedDocuments read FDocuments;
    property NextPageIndexKey:TBytes read FNextPageIndexKey write SetNextPageIndexKey;
  end;

  { GetDocflowEventsRequest } 
  //message GetDocflowEventsRequest
  //{
  //	required TimeBasedFilter Filter = 1;
  //	optional bytes AfterIndexKey = 2;
  //	optional bool PopulateDocuments = 3 [default = false];
  //	optional bool InjectEntityContent = 4 [default = false];
  //	optional bool PopulatePreviousDocumentStates = 5 [default = false];
  //}
  TGetDocflowEventsRequest = class(TSerializationObject)
  private
    FFilter:TTimeBasedFilter;
    FAfterIndexKey:TBytes;
    FPopulateDocuments:Boolean;
    FInjectEntityContent:Boolean;
    FPopulatePreviousDocumentStates:Boolean;
    procedure SetAfterIndexKey(AValue:TBytes);
    procedure SetPopulateDocuments(AValue:Boolean);
    procedure SetInjectEntityContent(AValue:Boolean);
    procedure SetPopulatePreviousDocumentStates(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Filter:TTimeBasedFilter read FFilter;
    property AfterIndexKey:TBytes read FAfterIndexKey write SetAfterIndexKey;
    property PopulateDocuments:Boolean read FPopulateDocuments write SetPopulateDocuments default false;
    property InjectEntityContent:Boolean read FInjectEntityContent write SetInjectEntityContent default false;
    property PopulatePreviousDocumentStates:Boolean read FPopulatePreviousDocumentStates write SetPopulatePreviousDocumentStates default false;
  end;

  { GetDocflowEventsResponse } 
  //message GetDocflowEventsResponse
  //{
  //	optional int32 TotalCount = 1;
  //	repeated DocflowEvent Events = 2;
  //	required TotalCountType TotalCountType = 3;
  //}
  TGetDocflowEventsResponse = class(TSerializationObject)
  private
    FTotalCount:Integer;
    FEvents:TDocflowEvents;
    FTotalCountType:TTotalCountType;
    procedure SetTotalCount(AValue:Integer);
    function GetTotalCountType:TTotalCountType;
    procedure SetTotalCountType(AValue:TTotalCountType);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
    property TotalCountType:TTotalCountType read GetTotalCountType write SetTotalCountType;
  published
    property TotalCount:Integer read FTotalCount write SetTotalCount;
    property Events:TDocflowEvents read FEvents;
  end;

  { DocflowEvent } 
  //message DocflowEvent
  //{
  //	optional string EventId = 1;
  //	optional Timestamp Timestamp = 2;
  //	optional DocumentId DocumentId = 3;
  //	optional bytes IndexKey = 4;
  //	optional DocumentWithDocflow Document = 5;
  //	optional string PreviousEventId = 6;
  //	optional DocumentWithDocflow PreviousDocumentState = 7;
  //}
  TDocflowEvent = class(TSerializationObject)
  private
    FEventId:String;
    FTimestamp:TTimestamp;
    FDocumentId:TDocumentId;
    FIndexKey:TBytes;
    FDocument:TDocumentWithDocflow;
    FPreviousEventId:String;
    FPreviousDocumentState:TDocumentWithDocflow;
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
    property Document:TDocumentWithDocflow read FDocument;
    property PreviousEventId:String read FPreviousEventId write SetPreviousEventId;
    property PreviousDocumentState:TDocumentWithDocflow read FPreviousDocumentState;
  end;

implementation

  { GetDocflowBatchRequest } 

procedure TGetDocflowBatchRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Requests', 1);
end;

procedure TGetDocflowBatchRequest.InternalInit;
begin
  inherited InternalInit;
  FRequests:= TGetDocflowRequests.Create;
end;

destructor TGetDocflowBatchRequest.Destroy;
begin
  FRequests.Free;
  inherited Destroy;
end;


  { GetDocflowRequest } 

procedure TGetDocflowRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentId', 1, true);
  RegisterProp('LastEventId', 2);
  RegisterProp('InjectEntityContent', 3);
end;

procedure TGetDocflowRequest.InternalInit;
begin
  inherited InternalInit;
  FDocumentId:= TDocumentId.Create;

  InjectEntityContent:= false;
end;

destructor TGetDocflowRequest.Destroy;
begin
  FDocumentId.Free;
  inherited Destroy;
end;

procedure TGetDocflowRequest.SetLastEventId(AValue:String);
begin
  FLastEventId:=AValue;
  Modified(2);
end;

procedure TGetDocflowRequest.SetInjectEntityContent(AValue:Boolean);
begin
  FInjectEntityContent:=AValue;
  Modified(3);
end;


  { GetDocflowBatchResponse } 

procedure TGetDocflowBatchResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Documents', 1);
end;

procedure TGetDocflowBatchResponse.InternalInit;
begin
  inherited InternalInit;
  FDocuments:= TDocumentWithDocflows.Create;
end;

destructor TGetDocflowBatchResponse.Destroy;
begin
  FDocuments.Free;
  inherited Destroy;
end;


  { SearchDocflowsRequest } 

procedure TSearchDocflowsRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('QueryString', 1, true);
  RegisterProp('Count', 2);
  RegisterProp('FirstIndex', 3);
  RegisterPropPublic('Scope', 4, TMethod(@SetScope), TMethod(@GetScope));
  RegisterProp('InjectEntityContent', 5);
end;

procedure TSearchDocflowsRequest.InternalInit;
begin
  inherited InternalInit;

  Count:= 100;
  Scope:= SearchScopeAny;
  InjectEntityContent:= false;
end;

destructor TSearchDocflowsRequest.Destroy;
begin
  inherited Destroy;
end;

procedure TSearchDocflowsRequest.SetQueryString(AValue:String);
begin
  FQueryString:=AValue;
  Modified(1);
end;

procedure TSearchDocflowsRequest.SetCount(AValue:Integer);
begin
  FCount:=AValue;
  Modified(2);
end;

procedure TSearchDocflowsRequest.SetFirstIndex(AValue:Integer);
begin
  FFirstIndex:=AValue;
  Modified(3);
end;

procedure TSearchDocflowsRequest.SetScope(AValue:TSearchScope);
begin
  FScope:=AValue;
  Modified(4);
end;

function TSearchDocflowsRequest.GetScope:TSearchScope;
begin
  Result:=FScope;
end;
procedure TSearchDocflowsRequest.SetInjectEntityContent(AValue:Boolean);
begin
  FInjectEntityContent:=AValue;
  Modified(5);
end;


  { SearchDocflowsResponse } 

procedure TSearchDocflowsResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Documents', 1);
  RegisterProp('HaveMoreDocuments', 2);
end;

procedure TSearchDocflowsResponse.InternalInit;
begin
  inherited InternalInit;
  FDocuments:= TDocumentWithDocflows.Create;
end;

destructor TSearchDocflowsResponse.Destroy;
begin
  FDocuments.Free;
  inherited Destroy;
end;

procedure TSearchDocflowsResponse.SetHaveMoreDocuments(AValue:Boolean);
begin
  FHaveMoreDocuments:=AValue;
  Modified(2);
end;


  { GetDocflowsByPacketIdRequest } 

procedure TGetDocflowsByPacketIdRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('PacketId', 1, true);
  RegisterProp('Count', 2);
  RegisterProp('InjectEntityContent', 3);
  RegisterProp('AfterIndexKey', 4);
end;

procedure TGetDocflowsByPacketIdRequest.InternalInit;
begin
  inherited InternalInit;

  Count:= 100;
  InjectEntityContent:= false;
end;

destructor TGetDocflowsByPacketIdRequest.Destroy;
begin
  inherited Destroy;
end;

procedure TGetDocflowsByPacketIdRequest.SetPacketId(AValue:String);
begin
  FPacketId:=AValue;
  Modified(1);
end;

procedure TGetDocflowsByPacketIdRequest.SetCount(AValue:Integer);
begin
  FCount:=AValue;
  Modified(2);
end;

procedure TGetDocflowsByPacketIdRequest.SetInjectEntityContent(AValue:Boolean);
begin
  FInjectEntityContent:=AValue;
  Modified(3);
end;

procedure TGetDocflowsByPacketIdRequest.SetAfterIndexKey(AValue:TBytes);
begin
  FAfterIndexKey:=AValue;
  Modified(4);
end;


  { FetchedDocument } 

procedure TFetchedDocument.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Document', 1, true);
  RegisterProp('IndexKey', 2, true);
end;

procedure TFetchedDocument.InternalInit;
begin
  inherited InternalInit;
  FDocument:= TDocumentWithDocflow.Create;
end;

destructor TFetchedDocument.Destroy;
begin
  FDocument.Free;
  inherited Destroy;
end;

procedure TFetchedDocument.SetIndexKey(AValue:TBytes);
begin
  FIndexKey:=AValue;
  Modified(2);
end;


  { GetDocflowsByPacketIdResponse } 

procedure TGetDocflowsByPacketIdResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Documents', 1);
  RegisterProp('NextPageIndexKey', 2);
end;

procedure TGetDocflowsByPacketIdResponse.InternalInit;
begin
  inherited InternalInit;
  FDocuments:= TFetchedDocuments.Create;
end;

destructor TGetDocflowsByPacketIdResponse.Destroy;
begin
  FDocuments.Free;
  inherited Destroy;
end;

procedure TGetDocflowsByPacketIdResponse.SetNextPageIndexKey(AValue:TBytes);
begin
  FNextPageIndexKey:=AValue;
  Modified(2);
end;


  { GetDocflowEventsRequest } 

procedure TGetDocflowEventsRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Filter', 1, true);
  RegisterProp('AfterIndexKey', 2);
  RegisterProp('PopulateDocuments', 3);
  RegisterProp('InjectEntityContent', 4);
  RegisterProp('PopulatePreviousDocumentStates', 5);
end;

procedure TGetDocflowEventsRequest.InternalInit;
begin
  inherited InternalInit;
  FFilter:= TTimeBasedFilter.Create;

  PopulateDocuments:= false;
  InjectEntityContent:= false;
  PopulatePreviousDocumentStates:= false;
end;

destructor TGetDocflowEventsRequest.Destroy;
begin
  FFilter.Free;
  inherited Destroy;
end;

procedure TGetDocflowEventsRequest.SetAfterIndexKey(AValue:TBytes);
begin
  FAfterIndexKey:=AValue;
  Modified(2);
end;

procedure TGetDocflowEventsRequest.SetPopulateDocuments(AValue:Boolean);
begin
  FPopulateDocuments:=AValue;
  Modified(3);
end;

procedure TGetDocflowEventsRequest.SetInjectEntityContent(AValue:Boolean);
begin
  FInjectEntityContent:=AValue;
  Modified(4);
end;

procedure TGetDocflowEventsRequest.SetPopulatePreviousDocumentStates(AValue:Boolean);
begin
  FPopulatePreviousDocumentStates:=AValue;
  Modified(5);
end;


  { GetDocflowEventsResponse } 

procedure TGetDocflowEventsResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TotalCount', 1);
  RegisterProp('Events', 2);
  RegisterPropPublic('TotalCountType', 3, TMethod(@SetTotalCountType), TMethod(@GetTotalCountType), true);
end;

procedure TGetDocflowEventsResponse.InternalInit;
begin
  inherited InternalInit;
  FEvents:= TDocflowEvents.Create;
end;

destructor TGetDocflowEventsResponse.Destroy;
begin
  FEvents.Free;
  inherited Destroy;
end;

procedure TGetDocflowEventsResponse.SetTotalCount(AValue:Integer);
begin
  FTotalCount:=AValue;
  Modified(1);
end;

procedure TGetDocflowEventsResponse.SetTotalCountType(AValue:TTotalCountType);
begin
  FTotalCountType:=AValue;
  Modified(3);
end;

function TGetDocflowEventsResponse.GetTotalCountType:TTotalCountType;
begin
  Result:=FTotalCountType;
end;

  { DocflowEvent } 

procedure TDocflowEvent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('EventId', 1);
  RegisterProp('Timestamp', 2);
  RegisterProp('DocumentId', 3);
  RegisterProp('IndexKey', 4);
  RegisterProp('Document', 5);
  RegisterProp('PreviousEventId', 6);
  RegisterProp('PreviousDocumentState', 7);
end;

procedure TDocflowEvent.InternalInit;
begin
  inherited InternalInit;
  FTimestamp:= TTimestamp.Create;
  FDocumentId:= TDocumentId.Create;
  FDocument:= TDocumentWithDocflow.Create;
  FPreviousDocumentState:= TDocumentWithDocflow.Create;
end;

destructor TDocflowEvent.Destroy;
begin
  FTimestamp.Free;
  FDocumentId.Free;
  FDocument.Free;
  FPreviousDocumentState.Free;
  inherited Destroy;
end;

procedure TDocflowEvent.SetEventId(AValue:String);
begin
  FEventId:=AValue;
  Modified(1);
end;

procedure TDocflowEvent.SetIndexKey(AValue:TBytes);
begin
  FIndexKey:=AValue;
  Modified(4);
end;

procedure TDocflowEvent.SetPreviousEventId(AValue:String);
begin
  FPreviousEventId:=AValue;
  Modified(6);
end;

end.
