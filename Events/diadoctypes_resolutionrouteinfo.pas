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

unit DiadocTypes_ResolutionRouteInfo;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc;
type

  { TResolutionRouteAssignmentInfo }
  //message ResolutionRouteAssignmentInfo {
  //	required string RouteId = 1;
  //	required string Author = 2;
  //}
  TResolutionRouteAssignmentInfo = class(TSerializationObject) //message ResolutionRouteAssignmentInfo
  private
    FAuthor: string;
    FRouteId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property RouteId:string read FRouteId write FRouteId; //1;
    property Author:string read FAuthor write FAuthor; //2;
  end;

  { TResolutionRouteRemovalInfo }
  //message ResolutionRouteRemovalInfo {
  //	required string RouteId = 1;
  //	required string Author = 2;
  //}
  TResolutionRouteRemovalInfo = class(TSerializationObject) //message ResolutionRouteRemovalInfo
  private
    FAuthor: string;
    FRouteId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property RouteId:string read FRouteId write FRouteId; //1;
    property Author:string read FAuthor write FAuthor; //2;
  end;

implementation

{ TResolutionRouteRemovalInfo }

procedure TResolutionRouteRemovalInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RouteId', 1);
  RegisterProp('Author', 2);
end;

procedure TResolutionRouteRemovalInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TResolutionRouteRemovalInfo.Destroy;
begin
  inherited Destroy;
end;

{ TResolutionRouteAssignmentInfo }

procedure TResolutionRouteAssignmentInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RouteId', 1);
  RegisterProp('Author', 2);
end;

procedure TResolutionRouteAssignmentInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TResolutionRouteAssignmentInfo.Destroy;
begin
  inherited Destroy;
end;
end.

