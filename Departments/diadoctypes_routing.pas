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
unit DiadocTypes_Routing;

interface

uses Classes, SysUtils, types, protobuf_fpc;

type

  TRouting = class;

  { Routing } 
  //message Routing
  //{
  //	required bool Kpp = 1;
  //	required bool Address = 2;
  //}
  TRouting = class(TSerializationObject)
  private
    FKpp:Boolean;
    FAddress:Boolean;
    procedure SetKpp(AValue:Boolean);
    procedure SetAddress(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Kpp:Boolean read FKpp write SetKpp;
    property Address:Boolean read FAddress write SetAddress;
  end;
  TRoutings = specialize GSerializationObjectList<TRouting>;

implementation

  { Routing } 

procedure TRouting.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Kpp', 1, true);
  RegisterProp('Address', 2, true);
end;

procedure TRouting.InternalInit;
begin
  inherited InternalInit;
end;

destructor TRouting.Destroy;
begin
  inherited Destroy;
end;

procedure TRouting.SetKpp(AValue:Boolean);
begin
  FKpp:=AValue;
  Modified(1);
end;

procedure TRouting.SetAddress(AValue:Boolean);
begin
  FAddress:=AValue;
  Modified(2);
end;

end.
