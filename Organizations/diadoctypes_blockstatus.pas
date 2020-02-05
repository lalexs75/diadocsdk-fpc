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

unit DiadocTypes_BlockStatus;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_ManualBlockStatus, DiadocTypes_AutoBlockStatus;

type

  TBlockStatus = class;

  { BlockStatus } 
  //message BlockStatus
  //{
  //    required ManualBlockStatus ManualBlockStatus = 1;
  //    required AutoBlockStatus AutoBlockStatus = 2;
  //}
  TBlockStatus = class(TSerializationObject)
  private
    FManualBlockStatus:TManualBlockStatus;
    FAutoBlockStatus:TAutoBlockStatus;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ManualBlockStatus:TManualBlockStatus read FManualBlockStatus;
    property AutoBlockStatus:TAutoBlockStatus read FAutoBlockStatus;
  end;
  TBlockStatuss = specialize GSerializationObjectList<TBlockStatus>;

implementation

  { BlockStatus } 

procedure TBlockStatus.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ManualBlockStatus', 1, true);
  RegisterProp('AutoBlockStatus', 2, true);
end;

procedure TBlockStatus.InternalInit;
begin
  inherited InternalInit;
  FManualBlockStatus:= TManualBlockStatus.Create;
  FAutoBlockStatus:= TAutoBlockStatus.Create;
end;

destructor TBlockStatus.Destroy;
begin
  FManualBlockStatus.Free;
  FAutoBlockStatus.Free;
  inherited Destroy;
end;

end.
