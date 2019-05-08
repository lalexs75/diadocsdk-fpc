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

// forwarded documents api
// ForwardDocument(boxId, ForwardDocumentRequest) : void
// GetForwardedDocuments(boxId, GetForwardedDocumentsRequest) : GetForwardedDocumentsResponse
// GetForwardedDocumentEvents(boxId, GetForwardedDocumentEventsRequest) : GetForwardedDocumentEventsResponse
unit DiadocTypes_ForwardingApi;

{$I diadoc_define.inc}

interface

//import "Timestamp.proto";
//import "DocumentId.proto";
//import "TimeBasedFilter.proto";
//import "Forwarding/ForwardedDocument.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_Timestamp,
  DiadocTypes_DocumentId,
  DiadocTypes_TimeBasedFilter,
  DiadocTypes_ForwardedDocument
  ;

type
  {  TForwardedDocumentEvent  }
  //message ForwardedDocumentEvent
  //{
  //	optional Timestamp Timestamp = 1;
  //	optional ForwardedDocumentId ForwardedDocumentId = 2;
  //	optional bytes IndexKey = 3;
  //	optional ForwardedDocument ForwardedDocument = 4;
  //}
  TForwardedDocumentEvent = class(TSerializationObject)
  private
    FForwardedDocument: TForwardedDocument;
    FForwardedDocumentId: TForwardedDocumentId;
    FIndexKey: TBytes;
    FTimestamp: TTimestamp;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Timestamp:TTimestamp read FTimestamp;//1;
    property ForwardedDocumentId:TForwardedDocumentId read FForwardedDocumentId; //2;
    property IndexKey:TBytes read FIndexKey write FIndexKey;//3;
    property ForwardedDocument:TForwardedDocument read FForwardedDocument;//4;
  end;
  TForwardedDocumentEvents = specialize GSerializationObjectList<TForwardedDocumentEvent>;

  {  TGetForwardedDocumentEventsResponse  }
  //message GetForwardedDocumentEventsResponse
  //{
  //	optional int32 TotalCount = 1;
  //	repeated ForwardedDocumentEvent Events = 2;
  //}
  TGetForwardedDocumentEventsResponse = class(TSerializationObject)
  private
    FEvents: TForwardedDocumentEvents;
    FTotalCount: int32;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property TotalCount:int32 read FTotalCount write FTotalCount;//1;
    property Events:TForwardedDocumentEvents read FEvents;//2;
  end;


  {  TGetForwardedDocumentEventsRequest  }
  //message GetForwardedDocumentEventsRequest
  //{
  //	required TimeBasedFilter Filter = 1;
  //	optional bytes AfterIndexKey = 2;
  //	optional bool PopulateForwardedDocuments = 3 [default = false];
  //	optional bool InjectEntityContent = 4 [default = false];
  //}
  TGetForwardedDocumentEventsRequest = class(TSerializationObject)
  private
    FAfterIndexKey: TBytes;
    FFilter: TTimeBasedFilter;
    FInjectEntityContent: Boolean;
    FPopulateForwardedDocuments: Boolean;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Filter:TTimeBasedFilter read FFilter;//1;
    property AfterIndexKey:TBytes read FAfterIndexKey write FAfterIndexKey;//2;
    property PopulateForwardedDocuments:Boolean read FPopulateForwardedDocuments write FPopulateForwardedDocuments;//3
    property InjectEntityContent:Boolean read FInjectEntityContent write FInjectEntityContent;//4
  end;


  {  TGetForwardedDocumentsResponse  }
  //message GetForwardedDocumentsResponse
  //{
  //	repeated ForwardedDocument ForwardedDocuments = 1;
  //}
  TGetForwardedDocumentsResponse = class(TSerializationObject)
  private
    FForwardedDocuments: TForwardedDocuments;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property ForwardedDocuments:TForwardedDocuments read FForwardedDocuments;//1;
  end;

  {  TGetForwardedDocumentsRequest  }
  //message GetForwardedDocumentsRequest
  //{
  //	repeated ForwardedDocumentId ForwardedDocumentIds = 1;
  //	optional bool InjectEntityContent = 2 [default = false];
  //}
  TGetForwardedDocumentsRequest = class(TSerializationObject)
  private
    FForwardedDocumentIds: TForwardedDocumentIds;
    FInjectEntityContent: Boolean;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property ForwardedDocumentIds:TForwardedDocumentIds read FForwardedDocumentIds;//1;
    property InjectEntityContent:Boolean read FInjectEntityContent write FInjectEntityContent;//2
  end;


  {  TForwardDocumentResponse  }
  //message ForwardDocumentResponse
  //{
  //	optional Timestamp ForwardTimestamp = 1;
  //	optional ForwardedDocumentId ForwardedDocumentId = 2;
  //}
  TForwardDocumentResponse = class(TSerializationObject)
  private
    FForwardedDocumentId: TForwardedDocumentId;
    FForwardTimestamp: TTimestamp;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property ForwardTimestamp:TTimestamp read FForwardTimestamp;//1;
    property ForwardedDocumentId:TForwardedDocumentId read FForwardedDocumentId;//2;
  end;


  {  TForwardDocumentRequest  }
  //message ForwardDocumentRequest
  //{
  //	required string ToBoxId = 1;
  //	required DocumentId DocumentId = 2;
  //}
  TForwardDocumentRequest = class(TSerializationObject)
  private
    FDocumentId: TDocumentId;
    FToBoxId: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property ToBoxId:string read FToBoxId write FToBoxId;//1;
    property DocumentId:TDocumentId read FDocumentId;//2;
  end;

implementation

{ TForwardDocumentRequest }

procedure TForwardDocumentRequest.InternalInit;
begin
  inherited InternalInit;
  FDocumentId:=TDocumentId.Create;
end;

procedure TForwardDocumentRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ToBoxId', 1);
  RegisterProp('DocumentId', 2);
end;

destructor TForwardDocumentRequest.Destroy;
begin
  FreeAndNil(FDocumentId);
  inherited Destroy;
end;

{ TForwardDocumentResponse }

procedure TForwardDocumentResponse.InternalInit;
begin
  inherited InternalInit;
  FForwardTimestamp:=TTimestamp.Create;
  FForwardedDocumentId:=TForwardedDocumentId.Create;
end;

procedure TForwardDocumentResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ForwardTimestamp', 1);
  RegisterProp('ForwardedDocumentId', 2);
end;

destructor TForwardDocumentResponse.Destroy;
begin
  FreeAndNil(FForwardTimestamp);
  FreeAndNil(FForwardedDocumentId);
  inherited Destroy;
end;

{ TGetForwardedDocumentsRequest }

procedure TGetForwardedDocumentsRequest.InternalInit;
begin
  inherited InternalInit;
  FForwardedDocumentIds:=TForwardedDocumentIds.Create;
end;

procedure TGetForwardedDocumentsRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ForwardedDocumentIds', 1);
  RegisterProp('InjectEntityContent', 2);
end;

destructor TGetForwardedDocumentsRequest.Destroy;
begin
  FreeAndNil(FForwardedDocumentIds);
  inherited Destroy;
end;

{ TGetForwardedDocumentsResponse }

procedure TGetForwardedDocumentsResponse.InternalInit;
begin
  inherited InternalInit;
  FForwardedDocuments:=TForwardedDocuments.Create;
end;

procedure TGetForwardedDocumentsResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ForwardedDocuments', 1);
end;

destructor TGetForwardedDocumentsResponse.Destroy;
begin
  FreeAndNil(FForwardedDocuments);
  inherited Destroy;
end;

{ TGetForwardedDocumentEventsRequest }

procedure TGetForwardedDocumentEventsRequest.InternalInit;
begin
  inherited InternalInit;
  FFilter:=TTimeBasedFilter.Create;
end;

procedure TGetForwardedDocumentEventsRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Filter', 1, true);
  RegisterProp('AfterIndexKey', 2);
  RegisterProp('PopulateForwardedDocuments', 3);
  RegisterProp('InjectEntityContent', 4);
end;

destructor TGetForwardedDocumentEventsRequest.Destroy;
begin
  FreeAndNil(FFilter);
  inherited Destroy;
end;

{ TGetForwardedDocumentEventsResponse }

procedure TGetForwardedDocumentEventsResponse.InternalInit;
begin
  inherited InternalInit;
  FEvents:=TForwardedDocumentEvents.Create;
end;

procedure TGetForwardedDocumentEventsResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TotalCount', 1);
  RegisterProp('Events', 2);
end;

destructor TGetForwardedDocumentEventsResponse.Destroy;
begin
  FreeAndNil(FEvents);
  inherited Destroy;
end;

{ TForwardedDocumentEvent }

procedure TForwardedDocumentEvent.InternalInit;
begin
  inherited InternalInit;
  FTimestamp:=TTimestamp.Create;
  FForwardedDocumentId:=TForwardedDocumentId.Create;
  FForwardedDocument:=TForwardedDocument.Create;
end;

procedure TForwardedDocumentEvent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Timestamp', 1);
  RegisterProp('ForwardedDocumentId', 2);
  RegisterProp('IndexKey', 3);
  RegisterProp('ForwardedDocument', 4);
end;

destructor TForwardedDocumentEvent.Destroy;
begin
  FreeAndNil(FTimestamp);
  FreeAndNil(FForwardedDocumentId);
  FreeAndNil(FForwardedDocument);
  inherited Destroy;
end;

end.

