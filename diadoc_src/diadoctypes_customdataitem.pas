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

unit DiadocTypes_CustomDataItem;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc;

type

  { TCustomDataItem }
  //message CustomDataItem {
  //	required string Key = 1;
  //	optional string Value = 2;
  //}
  TCustomDataItem = class(TSerializationObject) //message CustomDataItem
  private
    FKey: string;
    FValue: string;
    procedure SetKey(AValue: string);
    procedure SetValue(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property Key:string read FKey write SetKey; //1
    property Value:string read FValue write SetValue; //2;
  end;
  TCustomDataItems = specialize GSerializationObjectList<TCustomDataItem>;

implementation

{ TCustomDataItem }

procedure TCustomDataItem.SetKey(AValue: string);
begin
  if FKey=AValue then Exit;
  FKey:=AValue;
  Modified(1);
end;

procedure TCustomDataItem.SetValue(AValue: string);
begin
  if FValue=AValue then Exit;
  FValue:=AValue;
  Modified(2);
end;

procedure TCustomDataItem.InternalInit;
begin
  inherited InternalInit;
end;

procedure TCustomDataItem.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Key', 1, true);
  RegisterProp('Value', 2);
end;

end.

