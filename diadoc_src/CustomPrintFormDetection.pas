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
{ Структуры данных базируются на информации http://api-docs.diadoc.ru/ru/latest/DataStructures.html }

unit CustomPrintFormDetection;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_DocumentId;

type

  TCustomPrintFormDetectionRequest = class;
  TCustomPrintFormDetectionResult = class;
  TCustomPrintFormDetectionItemResult = class;

  { CustomPrintFormDetectionRequest } 
  //message CustomPrintFormDetectionRequest
  //{
  //    repeated DocumentId DocumentIds = 1;
  //}
  TCustomPrintFormDetectionRequest = class(TSerializationObject)
  private
    FDocumentIds:TDocumentIds;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentIds:TDocumentIds read FDocumentIds;
  end;
  TCustomPrintFormDetectionRequests = specialize GSerializationObjectList<TCustomPrintFormDetectionRequest>;

  { CustomPrintFormDetectionItemResult }
  //message CustomPrintFormDetectionItemResult
  //{
  //    required DocumentId DocumentId = 1;
  //    required bool HasCustomPrintForm = 2;
  //}
  TCustomPrintFormDetectionItemResult = class(TSerializationObject)
  private
    FDocumentId:TDocumentId;
    FHasCustomPrintForm:Boolean;
    procedure SetHasCustomPrintForm(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentId:TDocumentId read FDocumentId;
    property HasCustomPrintForm:Boolean read FHasCustomPrintForm write SetHasCustomPrintForm;
  end;
  TCustomPrintFormDetectionItemResults = specialize GSerializationObjectList<TCustomPrintFormDetectionItemResult>;


  { CustomPrintFormDetectionResult }
  //message CustomPrintFormDetectionResult
  //{
  //    repeated CustomPrintFormDetectionItemResult Items = 1;
  //}
  TCustomPrintFormDetectionResult = class(TSerializationObject)
  private
    FItems:TCustomPrintFormDetectionItemResults;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Items:TCustomPrintFormDetectionItemResults read FItems;
  end;
  TCustomPrintFormDetectionResults = specialize GSerializationObjectList<TCustomPrintFormDetectionResult>;

implementation

  { CustomPrintFormDetectionRequest } 

procedure TCustomPrintFormDetectionRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentIds', 1);
end;

procedure TCustomPrintFormDetectionRequest.InternalInit;
begin
  inherited InternalInit;
  FDocumentIds:= TDocumentIds.Create;
end;

destructor TCustomPrintFormDetectionRequest.Destroy;
begin
  FDocumentIds.Free;
  inherited Destroy;
end;


  { CustomPrintFormDetectionResult } 

procedure TCustomPrintFormDetectionResult.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Items', 1);
end;

procedure TCustomPrintFormDetectionResult.InternalInit;
begin
  inherited InternalInit;
  FItems:= TCustomPrintFormDetectionItemResults.Create;
end;

destructor TCustomPrintFormDetectionResult.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;


  { CustomPrintFormDetectionItemResult } 

procedure TCustomPrintFormDetectionItemResult.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentId', 1, true);
  RegisterProp('HasCustomPrintForm', 2, true);
end;

procedure TCustomPrintFormDetectionItemResult.InternalInit;
begin
  inherited InternalInit;
  FDocumentId:= TDocumentId.Create;
end;

destructor TCustomPrintFormDetectionItemResult.Destroy;
begin
  FDocumentId.Free;
  inherited Destroy;
end;

procedure TCustomPrintFormDetectionItemResult.SetHasCustomPrintForm(AValue:Boolean);
begin
  FHasCustomPrintForm:=AValue;
  Modified(2);
end;

end.
