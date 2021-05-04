{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2021 Lagunov Aleksey alexs75@yandex.ru

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

unit DocflowStatusV3;

interface

uses Classes, SysUtils, types, protobuf_fpc;

type

  TDocflowStatusV3 = class;
  TDocflowStatusV3s = specialize GSerializationObjectList<TDocflowStatusV3>;
  TDocflowStatusModelV3 = class;
  TDocflowStatusModelV3s = specialize GSerializationObjectList<TDocflowStatusModelV3>;

  { DocflowStatusV3 } 
  //message DocflowStatusV3
  //{
  //    required DocflowStatusModelV3 PrimaryStatus = 1;
  //    optional DocflowStatusModelV3 SecondaryStatus = 2;
  //}
  TDocflowStatusV3 = class(TSerializationObject)
  private
    FPrimaryStatus:TDocflowStatusModelV3;
    FSecondaryStatus:TDocflowStatusModelV3;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property PrimaryStatus:TDocflowStatusModelV3 read FPrimaryStatus;
    property SecondaryStatus:TDocflowStatusModelV3 read FSecondaryStatus;
  end;

  { DocflowStatusModelV3 } 
  //message DocflowStatusModelV3
  //{
  //    optional string Severity = 1;
  //    optional string StatusText = 2;
  //}
  TDocflowStatusModelV3 = class(TSerializationObject)
  private
    FSeverity:String;
    FStatusText:String;
    procedure SetSeverity(AValue:String);
    procedure SetStatusText(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Severity:String read FSeverity write SetSeverity;
    property StatusText:String read FStatusText write SetStatusText;
  end;

implementation

  { DocflowStatusV3 } 

procedure TDocflowStatusV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('PrimaryStatus', 1, true);
  RegisterProp('SecondaryStatus', 2);
end;

procedure TDocflowStatusV3.InternalInit;
begin
  inherited InternalInit;
  FPrimaryStatus:= TDocflowStatusModelV3.Create;
  FSecondaryStatus:= TDocflowStatusModelV3.Create;
end;

destructor TDocflowStatusV3.Destroy;
begin
  FPrimaryStatus.Free;
  FSecondaryStatus.Free;
  inherited Destroy;
end;


  { DocflowStatusModelV3 } 

procedure TDocflowStatusModelV3.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Severity', 1);
  RegisterProp('StatusText', 2);
end;

procedure TDocflowStatusModelV3.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDocflowStatusModelV3.Destroy;
begin
  inherited Destroy;
end;

procedure TDocflowStatusModelV3.SetSeverity(AValue:String);
begin
  FSeverity:=AValue;
  Modified(1);
end;

procedure TDocflowStatusModelV3.SetStatusText(AValue:String);
begin
  FStatusText:=AValue;
  Modified(2);
end;

end.
