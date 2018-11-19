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

unit DiadocTypes_Content;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc;
type
  { TContent }
  //message Content {
  //	required sfixed32 Size = 1;	// -1 if content size is unknown
  //	optional bytes Data = 2;	// null <=> entity content exists but is not included in proto buffer
  //}
  TContent = class(TSerializationObject)  //message Content
  private
    FData: TBytes;
    FSize: sfixed32;
    procedure SetData(AValue: TBytes);
  protected
    procedure InternalRegisterProperty; override;
  public
  published
    property Size:sfixed32 read FSize write FSize; //1
    property Data:TBytes read FData write SetData; //2
  end;

implementation

{ TContent }

procedure TContent.SetData(AValue: TBytes);
begin
  if FData=AValue then Exit;
  FData:=AValue;
end;

procedure TContent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Size', 1, true);
  RegisterProp('Data', 2);
end;
end.

