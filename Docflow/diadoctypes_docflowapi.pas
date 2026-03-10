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

unit DiadocTypes_DocflowApi;

{$I diadoc_define.inc}

interface

//import "Timestamp.proto";
//import "DocumentId.proto";
//import "TotalCountType.proto";
//import "TimeBasedFilter.proto";
//import "Docflow/DocumentWithDocflow.proto";
uses
  Classes, SysUtils, protobuf_fpc, diadoc_simple_arrays,
  DiadocTypes_Timestamp,
  DiadocTypes_DocumentId,
  TotalCountType,
  DiadocTypes_TimeBasedFilter,
  DiadocTypes_DocumentWithDocflow;

type
  TSearchScope = (
    SearchScopeAny = 0,
    SearchScopeIncoming = 1,
    SearchScopeOutgoing = 2,
    SearchScopeDeleted = 3,
    SearchScopeInternal = 4
  );


  {  TDocflowEvent  }

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
  TDocflowEvent = class(TSerializationObject) //message DocflowEvent
  private
    FDocument: TDocumentWithDocflow;
    FDocumentId: TDocumentId;
    FEventId: string;
    FIndexKey: TBytes;
    FPreviousDocumentState: TDocumentWithDocflow;
    FPreviousEventId: string;
    FTimestamp: TTimestamp;
    procedure SetEventId(AValue: string);
    procedure SetIndexKey(AValue: TBytes);
    procedure SetPreviousEventId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property EventId:string read FEventId write SetEventId;//1;
    property Timestamp:TTimestamp read FTimestamp; //2;
    property DocumentId:TDocumentId read FDocumentId; //3;
    property IndexKey:TBytes read FIndexKey write SetIndexKey; //4;
    property Document:TDocumentWithDocflow read FDocument; //5;
    property PreviousEventId:string read FPreviousEventId write SetPreviousEventId;//6;
    property PreviousDocumentState:TDocumentWithDocflow read FPreviousDocumentState;//7;
  end;
  TDocflowEvents = specialize GSerializationObjectList<TDocflowEvent>;

  {  TGetDocflowEventsResponse  }
  //message GetDocflowEventsResponse
  //{
  //	optional int32 TotalCount = 1;
  //	repeated DocflowEvent Events = 2;
  //    required TotalCountType TotalCountType = 3;
  //}
  TGetDocflowEventsResponse = class(TSerializationObject) //message GetDocflowEventsResponse
  private
    FEvents: TDocflowEvents;
    FTotalCount: int32;
    FTotalCountType: TTotalCountType;
    procedure SetTotalCount(AValue: int32);
    procedure SetTotalCountType(AValue: TTotalCountType);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TotalCount:int32  read FTotalCount write SetTotalCount; //1;
    property Events:TDocflowEvents read FEvents; //2;
    property TotalCountType:TTotalCountType read FTotalCountType write SetTotalCountType;
  end;

  {  TGetDocflowEventsRequest  }
  //message GetDocflowEventsRequest
  //{
  //	required TimeBasedFilter Filter = 1;
  //	optional bytes AfterIndexKey = 2;
  //	optional bool PopulateDocuments = 3 [default = false];
  //	optional bool InjectEntityContent = 4 [default = false];
  //	optional bool PopulatePreviousDocumentStates = 5 [default = false];
  //}
  TGetDocflowEventsRequest = class(TSerializationObject) //message GetDocflowEventsRequest
  private
    FAfterIndexKey: TBytes;
    FFilter: TTimeBasedFilter;
    FInjectEntityContent: Boolean;
    FPopulateDocuments: Boolean;
    FPopulatePreviousDocumentStates: Boolean;
    procedure SetAfterIndexKey(AValue: TBytes);
    procedure SetInjectEntityContent(AValue: Boolean);
    procedure SetPopulateDocuments(AValue: Boolean);
    procedure SetPopulatePreviousDocumentStates(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Filter:TTimeBasedFilter read FFilter; //1;
    property AfterIndexKey:TBytes read FAfterIndexKey write SetAfterIndexKey; //2;
    property PopulateDocuments:Boolean read FPopulateDocuments write SetPopulateDocuments;//3
    property InjectEntityContent:Boolean read FInjectEntityContent write SetInjectEntityContent; //4
    property PopulatePreviousDocumentStates:Boolean read FPopulatePreviousDocumentStates write SetPopulatePreviousDocumentStates; //5
  end;


  {  TFetchedDocument  }
  //message FetchedDocument
  //{
  //	required DocumentWithDocflow Document = 1;
  //	required bytes IndexKey = 2;
  //}
  TFetchedDocument = class(TSerializationObject) //message FetchedDocument
  private
    FDocument: TDocumentWithDocflow;
    FIndexKey: TBytes;
    procedure SetIndexKey(AValue: TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Document:TDocumentWithDocflow read FDocument; //1;
    property IndexKey:TBytes read FIndexKey write SetIndexKey; //2;
  end;
  TFetchedDocuments = specialize GSerializationObjectList<TFetchedDocument>;

  {  TGetDocflowsByPacketIdResponse  }
  //message GetDocflowsByPacketIdResponse
  //{
  //	repeated FetchedDocument Documents = 1;
  //	optional bytes NextPageIndexKey = 2;
  //}
  TGetDocflowsByPacketIdResponse = class(TSerializationObject) //message GetDocflowsByPacketIdResponse
  private
    FDocuments: TFetchedDocuments;
    FNextPageIndexKey: TBytes;
    procedure SetNextPageIndexKey(AValue: TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Documents:TFetchedDocuments read FDocuments; //1;
    property NextPageIndexKey:TBytes read FNextPageIndexKey write SetNextPageIndexKey; //2;
  end;


  {  TGetDocflowsByPacketIdRequest  }
  //message GetDocflowsByPacketIdRequest
  //{
  //	required string PacketId = 1;
  //	optional int32 Count = 2 [default = 100];
  //	optional bool InjectEntityContent = 3 [default = false];
  //	optional bytes AfterIndexKey = 4;
  //}
  TGetDocflowsByPacketIdRequest = class(TSerializationObject) //message GetDocflowsByPacketIdRequest
  private
    FAfterIndexKey: TBytes;
    FCount: int32;
    FInjectEntityContent: Boolean;
    FPacketId: string;
    procedure SetAfterIndexKey(AValue: TBytes);
    procedure SetCount(AValue: int32);
    procedure SetInjectEntityContent(AValue: Boolean);
    procedure SetPacketId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property PacketId:string read FPacketId write SetPacketId; //1;
    property Count:int32 read FCount write SetCount default 100; //2
    property InjectEntityContent:Boolean read FInjectEntityContent write SetInjectEntityContent; //3
    property AfterIndexKey:TBytes read FAfterIndexKey write SetAfterIndexKey; //4;
  end;


  {  TSearchDocflowsResponse  }
  //message SearchDocflowsResponse
  //{
  //	repeated DocumentWithDocflow Documents = 1;
  //	optional bool HaveMoreDocuments = 2;
  //}
  TSearchDocflowsResponse = class(TSerializationObject) //message SearchDocflowsResponse
  private
    FDocuments: TDocumentWithDocflows;
    FHaveMoreDocuments: Boolean;
    procedure SetHaveMoreDocuments(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Documents:TDocumentWithDocflows read FDocuments; //1;
    property HaveMoreDocuments:Boolean read FHaveMoreDocuments write SetHaveMoreDocuments; //2;
  end;


  {  TSearchDocflowsRequest  }
  //message SearchDocflowsRequest
  //{
  //	required string QueryString = 1;
  //	optional int32 Count = 2 [default = 100];
  //	optional int32 FirstIndex = 3;
  //	optional SearchScope Scope = 4 [default = SearchScopeAny];
  //	optional bool InjectEntityContent = 5 [default = false];
  //}
  TSearchDocflowsRequest = class(TSerializationObject) //message SearchDocflowsRequest
  private
    FCount: int32;
    FFirstIndex: int32;
    FInjectEntityContent: Boolean;
    FQueryString: string;
    FScope: TSearchScope;
    procedure SetCount(AValue: int32);
    procedure SetFirstIndex(AValue: int32);
    procedure SetInjectEntityContent(AValue: Boolean);
    procedure SetQueryString(AValue: string);
    procedure SetScope(AValue: TSearchScope);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property QueryString:string read FQueryString write SetQueryString;//1;
    property Count:int32 read FCount write SetCount default 100;//2
    property FirstIndex:int32 read FFirstIndex write SetFirstIndex;//3;
    property Scope:TSearchScope read FScope write SetScope default SearchScopeAny;//4
    property InjectEntityContent:Boolean read FInjectEntityContent write SetInjectEntityContent;//5
  end;


  {  TGetDocflowBatchResponse  }
  //message GetDocflowBatchResponse
  //{
  //	repeated DocumentWithDocflow Documents = 1;
  //}
  TGetDocflowBatchResponse = class(TSerializationObject) //message GetDocflowBatchResponse
  private
    FDocuments: TDocumentWithDocflows;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Documents:TDocumentWithDocflows read FDocuments; //1;
  end;


  {  TGetDocflowRequest  }
  //message GetDocflowRequest
  //{
  //	required DocumentId DocumentId = 1;
  //	optional string LastEventId = 2;
  //	optional bool InjectEntityContent = 3 [default = false];
  //}
  TGetDocflowRequest = class(TSerializationObject) //message GetDocflowRequest
  private
    FDocumentId: TDocumentId;
    FInjectEntityContent: Boolean;
    FLastEventId: string;
    procedure SetInjectEntityContent(AValue: Boolean);
    procedure SetLastEventId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:TDocumentId read FDocumentId; //1;
    property LastEventId:string read FLastEventId write SetLastEventId; //2;
    property InjectEntityContent:Boolean read FInjectEntityContent write SetInjectEntityContent;//3
  end;
  TGetDocflowRequests = specialize GSerializationObjectList<TGetDocflowRequest>;

  {  TGetDocflowBatchRequest  }
  //message GetDocflowBatchRequest
  //{
	 // repeated GetDocflowRequest Requests = 1;
  //}
  TGetDocflowBatchRequest = class(TSerializationObject) //message GetDocflowBatchRequest
  private
    FRequests: TGetDocflowRequests;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Requests:TGetDocflowRequests read FRequests; //1;
  end;

implementation

{ TGetDocflowBatchRequest }

procedure TGetDocflowBatchRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Requests', 1);
end;

procedure TGetDocflowBatchRequest.InternalInit;
begin
  inherited InternalInit;
  FRequests:=TGetDocflowRequests.Create;
end;

destructor TGetDocflowBatchRequest.Destroy;
begin
  FreeAndNil(FRequests);
  inherited Destroy;
end;

{ TGetDocflowRequest }

procedure TGetDocflowRequest.SetInjectEntityContent(AValue: Boolean);
begin
  if FInjectEntityContent=AValue then Exit;
  FInjectEntityContent:=AValue;
  Modified(3);
end;

procedure TGetDocflowRequest.SetLastEventId(AValue: string);
begin
  if FLastEventId=AValue then Exit;
  FLastEventId:=AValue;
  Modified(2);
end;

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
  FDocumentId:=TDocumentId.Create;
end;

destructor TGetDocflowRequest.Destroy;
begin
  FreeAndNil(FDocumentId);
  inherited Destroy;
end;

{ TGetDocflowBatchResponse }

procedure TGetDocflowBatchResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Documents', 1);
end;

procedure TGetDocflowBatchResponse.InternalInit;
begin
  inherited InternalInit;
  FDocuments:=TDocumentWithDocflows.Create;
end;

destructor TGetDocflowBatchResponse.Destroy;
begin
  FreeAndNil(FDocuments);
  inherited Destroy;
end;

{ TSearchDocflowsRequest }

procedure TSearchDocflowsRequest.SetCount(AValue: int32);
begin
  if FCount=AValue then Exit;
  FCount:=AValue;
  Modified(2);
end;

procedure TSearchDocflowsRequest.SetFirstIndex(AValue: int32);
begin
  if FFirstIndex=AValue then Exit;
  FFirstIndex:=AValue;
  Modified(3);
end;

procedure TSearchDocflowsRequest.SetInjectEntityContent(AValue: Boolean);
begin
  if FInjectEntityContent=AValue then Exit;
  FInjectEntityContent:=AValue;
  Modified(5);
end;

procedure TSearchDocflowsRequest.SetQueryString(AValue: string);
begin
  if FQueryString=AValue then Exit;
  FQueryString:=AValue;
  Modified(1);
end;

procedure TSearchDocflowsRequest.SetScope(AValue: TSearchScope);
begin
  if FScope=AValue then Exit;
  FScope:=AValue;
  Modified(4);
end;

procedure TSearchDocflowsRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('QueryString', 1, true);//
  RegisterProp('Count', 2);
  RegisterProp('FirstIndex', 3);
  RegisterProp('Scope', 4);
  RegisterProp('InjectEntityContent', 5);

  FCount:=100;
  FScope:=SearchScopeAny;
end;

procedure TSearchDocflowsRequest.InternalInit;
begin
  inherited InternalInit;
end;

destructor TSearchDocflowsRequest.Destroy;
begin
  inherited Destroy;
end;

{ TSearchDocflowsResponse }

procedure TSearchDocflowsResponse.SetHaveMoreDocuments(AValue: Boolean);
begin
  if FHaveMoreDocuments=AValue then Exit;
  FHaveMoreDocuments:=AValue;
  Modified(2);
end;

procedure TSearchDocflowsResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Documents', 1);
  RegisterProp('HaveMoreDocuments', 2);
end;

procedure TSearchDocflowsResponse.InternalInit;
begin
  inherited InternalInit;
  FDocuments:=TDocumentWithDocflows.Create;
end;

destructor TSearchDocflowsResponse.Destroy;
begin
  FreeAndNil(FDocuments);
  inherited Destroy;
end;

{ TGetDocflowsByPacketIdRequest }

procedure TGetDocflowsByPacketIdRequest.SetAfterIndexKey(AValue: TBytes);
begin
  if FAfterIndexKey=AValue then Exit;
  FAfterIndexKey:=AValue;
  Modified(4);
end;

procedure TGetDocflowsByPacketIdRequest.SetCount(AValue: int32);
begin
  if FCount=AValue then Exit;
  FCount:=AValue;
  Modified(2);
end;

procedure TGetDocflowsByPacketIdRequest.SetInjectEntityContent(AValue: Boolean);
begin
  if FInjectEntityContent=AValue then Exit;
  FInjectEntityContent:=AValue;
  Modified(3);
end;

procedure TGetDocflowsByPacketIdRequest.SetPacketId(AValue: string);
begin
  if FPacketId=AValue then Exit;
  FPacketId:=AValue;
  Modified(1);
end;

procedure TGetDocflowsByPacketIdRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('PacketId', 1);
  RegisterProp('Count', 2);
  RegisterProp('InjectEntityContent', 3);
  RegisterProp('AfterIndexKey', 4);

  FCount:=100;
end;

procedure TGetDocflowsByPacketIdRequest.InternalInit;
begin
  inherited InternalInit;
end;

destructor TGetDocflowsByPacketIdRequest.Destroy;
begin
  inherited Destroy;
end;

{ TGetDocflowsByPacketIdResponse }

procedure TGetDocflowsByPacketIdResponse.SetNextPageIndexKey(AValue: TBytes);
begin
  if FNextPageIndexKey=AValue then Exit;
  FNextPageIndexKey:=AValue;
  Modified(2);
end;

procedure TGetDocflowsByPacketIdResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Documents', 1);
  RegisterProp('NextPageIndexKey', 2);
end;

procedure TGetDocflowsByPacketIdResponse.InternalInit;
begin
  inherited InternalInit;
  FDocuments:=TFetchedDocuments.Create;
end;

destructor TGetDocflowsByPacketIdResponse.Destroy;
begin
  FreeAndNil(FDocuments);
  inherited Destroy;
end;

{ TFetchedDocument }

procedure TFetchedDocument.SetIndexKey(AValue: TBytes);
begin
  if FIndexKey=AValue then Exit;
  FIndexKey:=AValue;
  Modified(2);
end;

procedure TFetchedDocument.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Document', 1);
  RegisterProp('IndexKey', 2);
end;

procedure TFetchedDocument.InternalInit;
begin
  inherited InternalInit;
  FDocument:=TDocumentWithDocflow.Create;
end;

destructor TFetchedDocument.Destroy;
begin
  FreeAndNil(FDocument);
  inherited Destroy;
end;

{ TGetDocflowEventsRequest }

procedure TGetDocflowEventsRequest.SetAfterIndexKey(AValue: TBytes);
begin
  if FAfterIndexKey=AValue then Exit;
  FAfterIndexKey:=AValue;
  Modified(2);
end;

procedure TGetDocflowEventsRequest.SetInjectEntityContent(AValue: Boolean);
begin
  if FInjectEntityContent=AValue then Exit;
  FInjectEntityContent:=AValue;
  Modified(4);
end;

procedure TGetDocflowEventsRequest.SetPopulateDocuments(AValue: Boolean);
begin
  if FPopulateDocuments=AValue then Exit;
  FPopulateDocuments:=AValue;
  Modified(3);
end;

procedure TGetDocflowEventsRequest.SetPopulatePreviousDocumentStates(
  AValue: Boolean);
begin
  if FPopulatePreviousDocumentStates=AValue then Exit;
  FPopulatePreviousDocumentStates:=AValue;
  Modified(5);
end;

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
  FFilter:=TTimeBasedFilter.Create;
end;

destructor TGetDocflowEventsRequest.Destroy;
begin
  FreeAndNil(FFilter);
  inherited Destroy;
end;

{ TGetDocflowEventsResponse }

procedure TGetDocflowEventsResponse.SetTotalCount(AValue: int32);
begin
  if FTotalCount=AValue then Exit;
  FTotalCount:=AValue;
  Modified(1);
end;

procedure TGetDocflowEventsResponse.SetTotalCountType(AValue: TTotalCountType);
begin
  FTotalCountType:=AValue;
  Modified(3);
end;

procedure TGetDocflowEventsResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TotalCount', 1);
  RegisterProp('Events', 2);
  RegisterProp('TotalCountType', 3, true);
end;

procedure TGetDocflowEventsResponse.InternalInit;
begin
  inherited InternalInit;
  FEvents:=TDocflowEvents.Create;
end;

destructor TGetDocflowEventsResponse.Destroy;
begin
  FreeAndNil(FEvents);
  inherited Destroy;
end;

{ TDocflowEvent }

procedure TDocflowEvent.SetEventId(AValue: string);
begin
  if FEventId=AValue then Exit;
  FEventId:=AValue;
  Modified(1);
end;

procedure TDocflowEvent.SetIndexKey(AValue: TBytes);
begin
  if FIndexKey=AValue then Exit;
  FIndexKey:=AValue;
  Modified(4);
end;

procedure TDocflowEvent.SetPreviousEventId(AValue: string);
begin
  if FPreviousEventId=AValue then Exit;
  FPreviousEventId:=AValue;
  Modified(6);
end;

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
  FTimestamp:=TTimestamp.Create;
  FDocumentId:=TDocumentId.Create;
  FDocument:=TDocumentWithDocflow.Create;
  FPreviousDocumentState:=TDocumentWithDocflow.Create;
end;

destructor TDocflowEvent.Destroy;
begin
  FreeAndNil(FTimestamp);
  FreeAndNil(FDocumentId);
  FreeAndNil(FDocument);
  FreeAndNil(FPreviousDocumentState);
  inherited Destroy;
end;

end.

