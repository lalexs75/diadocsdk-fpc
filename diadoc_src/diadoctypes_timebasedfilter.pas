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

unit DiadocTypes_TimeBasedFilter;

{$I diadoc_define.inc}

interface

//import "Timestamp.proto";
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Timestamp;

type
  TSortDirection = (
    UnknownSortDirection = 0, // reserved for backward compatibility
    Ascending = 1,
    Descending = 2
  );


  {  TTimeBasedFilter  }
  //message TimeBasedFilter
  //{
  //	optional Timestamp FromTimestamp = 1;
  //	optional Timestamp ToTimestamp = 2;
  //	optional SortDirection SortDirection = 3 [default = Ascending];
  //}
  TTimeBasedFilter = class(TSerializationObject) //message TimeBasedFilter
  private
    FFromTimestamp: TTimestamp;
    FSortDirection: TSortDirection;
    FToTimestamp: TTimestamp;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FromTimestamp:TTimestamp read FFromTimestamp; //1;
    property ToTimestamp:TTimestamp read FToTimestamp; //2;
    property SortDirection:TSortDirection read FSortDirection write FSortDirection default Ascending;//3
  end;

implementation

{ TTimeBasedFilter }

procedure TTimeBasedFilter.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FromTimestamp', 1);
  RegisterProp('ToTimestamp', 2);
  RegisterProp('SortDirection', 3)
end;

procedure TTimeBasedFilter.InternalInit;
begin
  inherited InternalInit;
  FFromTimestamp:=TTimestamp.Create;
  FToTimestamp:=TTimestamp.Create;
end;

destructor TTimeBasedFilter.Destroy;
begin
  FreeAndNil(FFromTimestamp);
  FreeAndNil(FToTimestamp);
  inherited Destroy;
end;

end.

