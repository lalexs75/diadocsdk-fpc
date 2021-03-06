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

unit DiadocTypes_ResolutionInfo;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc, protobuf_fpc_types, DiadocTypes_ResolutionType;

type
  {  TResolutionInfo  }
  //message ResolutionInfo {
  //      optional ResolutionType ResolutionType = 1 [default = UnknownResolutionType];
  //      required string Author = 2;	// ФИО согласователя
  //      optional string InitialRequestId = 3;
  //}
  TResolutionInfo = class(TSerializationObject) //message ResolutionInfo
  private
    FAuthor: string;
    FInitialRequestId: string;
    FResolutionType: TResolutionType;
    procedure SetAuthor(AValue: string);
    procedure SetInitialRequestId(AValue: string);
    procedure SetResolutionType(AValue: TResolutionType);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ResolutionType:TResolutionType read FResolutionType write SetResolutionType default UnknownResolutionType; //1
    property Author:string read FAuthor write SetAuthor;//2;
    property InitialRequestId:string read FInitialRequestId write SetInitialRequestId;//3;
  end;

implementation

{ TResolutionInfo }

procedure TResolutionInfo.SetAuthor(AValue: string);
begin
  if FAuthor=AValue then Exit;
  FAuthor:=AValue;
  Modified(2);
end;

procedure TResolutionInfo.SetInitialRequestId(AValue: string);
begin
  if FInitialRequestId=AValue then Exit;
  FInitialRequestId:=AValue;
  Modified(3);
end;

procedure TResolutionInfo.SetResolutionType(AValue: TResolutionType);
begin
  FResolutionType:=AValue;
  Modified(1);
end;

procedure TResolutionInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ResolutionType', 1);
  RegisterProp('Author', 2, true);
  RegisterProp('InitialRequestId', 3);

  FResolutionType:=UnknownResolutionType;
end;

procedure TResolutionInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TResolutionInfo.Destroy;
begin
  inherited Destroy;
end;

end.

