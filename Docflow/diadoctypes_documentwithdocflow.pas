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
unit DiadocTypes_DocumentWithDocflow;

{$I diadoc_define.inc}

interface

(*
import "Timestamp.proto";
import "DocumentId.proto";
import "ForwardDocumentEvent.proto";
import "Docflow/Docflow.proto";
import "Docflow/DocumentInfo.proto";
*)

uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Timestamp,
  DiadocTypes_DocumentId,
  DiadocTypes_ForwardDocumentEvent,
  DiadocTypes_Docflow,
  DiadocTypes_DocumentInfo;

type
  { TDocumentWithDocflow }
  //message DocumentWithDocflow
  //{
  //	optional DocumentId DocumentId = 1;
  //	optional string LastEventId = 2;
  //	optional Timestamp LastEventTimestamp = 3;
  //	optional DocumentInfo DocumentInfo = 4;
  //	optional Docflow Docflow = 5;
  //	repeated DocumentId InitialDocumentIds = 6;
  //	repeated DocumentId SubordinateDocumentIds = 7;
  //	repeated ForwardDocumentEvent ForwardDocumentEvents = 8;
  //}
  TDocumentWithDocflow  = class(TSerializationObject) //message DocumentWithDocflow
  private
    FDocflow: TDocflow;
    FDocumentId: TDocumentId;
    FDocumentInfo: TDocumentInfo;
    FForwardDocumentEvents: TForwardDocumentEvents;
    FInitialDocumentIds: TDocumentIds;
    FLastEventId: string;
    FLastEventTimestamp: TTimestamp;
    FSubordinateDocumentIds: TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:TDocumentId read FDocumentId; //1;
    property LastEventId:string read FLastEventId write FLastEventId; //2;
    property LastEventTimestamp:TTimestamp read FLastEventTimestamp; //3;
    property DocumentInfo:TDocumentInfo read FDocumentInfo; //4;
    property Docflow:TDocflow read FDocflow; //5;
    property InitialDocumentIds:TDocumentIds read FInitialDocumentIds; //6;
    property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;//7;
    property ForwardDocumentEvents:TForwardDocumentEvents read FForwardDocumentEvents;//8;
  end;
  TDocumentWithDocflows = specialize GSerializationObjectList<TDocumentWithDocflow>;

implementation

{ TDocumentWithDocflow }

procedure TDocumentWithDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentId', 1);
  RegisterProp('LastEventId', 2);
  RegisterProp('LastEventTimestamp', 3);
  RegisterProp('DocumentInfo', 4);
  RegisterProp('Docflow', 5);
  RegisterProp('InitialDocumentIds', 6);
  RegisterProp('SubordinateDocumentIds', 7);
  RegisterProp('ForwardDocumentEvents', 8);
end;

procedure TDocumentWithDocflow.InternalInit;
begin
  inherited InternalInit;
  FDocumentId:=TDocumentId.Create;
  FLastEventTimestamp:=TTimestamp.Create;
  FDocumentInfo:=TDocumentInfo.Create;
  FDocflow:=TDocflow.Create;
  FInitialDocumentIds:=TDocumentIds.Create;
  FSubordinateDocumentIds:=TDocumentIds.Create;
  FForwardDocumentEvents:=TForwardDocumentEvents.Create;
end;

destructor TDocumentWithDocflow.Destroy;
begin
  FreeAndNil(FDocumentId);
  FreeAndNil(FLastEventTimestamp);
  FreeAndNil(FDocumentInfo);
  FreeAndNil(FDocflow);
  FreeAndNil(FInitialDocumentIds);
  FreeAndNil(FSubordinateDocumentIds);
  FreeAndNil(FForwardDocumentEvents);
  inherited Destroy;
end;

end.

