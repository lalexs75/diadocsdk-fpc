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
unit diadoc_simple_arrays;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, diadoc_consts, protobuf_fpc;

type
  { TDocumentBytes }

  TDocumentBytes = class(TSerializationArray)
  private
    FItems:array of TBytes;
    function GetItem(AIndex:Integer): TBytes;
  protected
    procedure InternalAddAsString(AValue:String); override;
    function GetCount: integer; override;
  public
    constructor Create;
    destructor Destroy; override;
    property Item[AIndex:Integer]:TBytes read GetItem; default;
  end;

implementation

{ TDocumentBytes }

function TDocumentBytes.GetItem(AIndex: Integer): TBytes;
begin
  if (AIndex>=0) and (AIndex < Length(FItems)) then
    Result:=FItems[AIndex]
  else
    raise Exception.Create('TDocumentBytes.GetItem');
end;

procedure TDocumentBytes.InternalAddAsString(AValue: String);
var
  I: Integer;
begin
  SetLength(FItems, Length(FItems) + 1);
  if Length(AValue)>0 then
  begin
    I:=Length(FItems) - 1;
    SetLength(FItems[I], Length(AValue));
    Move(AValue[1], FItems[I][1], Length(AValue))
  end;
end;

function TDocumentBytes.GetCount: integer;
begin
  Result:=Length(FItems);
end;

constructor TDocumentBytes.Create;
begin
  inherited Create;
  SetLength(FItems, 0);
end;

destructor TDocumentBytes.Destroy;
begin
  SetLength(FItems, 0);
  inherited Destroy;
end;

end.

