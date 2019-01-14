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

unit DiadocTypes_DepartmentToCreate;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_Address, DiadocTypes_Routing;

type

  TDepartmentToCreate = class;

  { DepartmentToCreate } 
  //message DepartmentToCreate
  //{
  //	optional string ParentDepartmentId = 1;
  //	required string Name = 2;
  //	required string Abbreviation = 3;
  //	optional string Kpp = 4;
  //	optional Address Address = 5;
  //	required Routing Routing = 6;
  //}
  TDepartmentToCreate = class(TSerializationObject)
  private
    FParentDepartmentId:String;
    FName:String;
    FAbbreviation:String;
    FKpp:String;
    FAddress:TAddress;
    FRouting:TRouting;
    procedure SetParentDepartmentId(AValue:String);
    procedure SetName(AValue:String);
    procedure SetAbbreviation(AValue:String);
    procedure SetKpp(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentDepartmentId:String read FParentDepartmentId write SetParentDepartmentId;
    property Name:String read FName write SetName;
    property Abbreviation:String read FAbbreviation write SetAbbreviation;
    property Kpp:String read FKpp write SetKpp;
    property Address:TAddress read FAddress;
    property Routing:TRouting read FRouting;
  end;
  TDepartmentToCreates = specialize GSerializationObjectList<TDepartmentToCreate>;

implementation

  { DepartmentToCreate } 

procedure TDepartmentToCreate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentDepartmentId', 1);
  RegisterProp('Name', 2, true);
  RegisterProp('Abbreviation', 3, true);
  RegisterProp('Kpp', 4);
  RegisterProp('Address', 5);
  RegisterProp('Routing', 6, true);
end;

procedure TDepartmentToCreate.InternalInit;
begin
  inherited InternalInit;
  FAddress:= TAddress.Create;
  FRouting:= TRouting.Create;
end;

destructor TDepartmentToCreate.Destroy;
begin
  FAddress.Free;
  FRouting.Free;
  inherited Destroy;
end;

procedure TDepartmentToCreate.SetParentDepartmentId(AValue:String);
begin
  FParentDepartmentId:=AValue;
  Modified(1);
end;

procedure TDepartmentToCreate.SetName(AValue:String);
begin
  FName:=AValue;
  Modified(2);
end;

procedure TDepartmentToCreate.SetAbbreviation(AValue:String);
begin
  FAbbreviation:=AValue;
  Modified(3);
end;

procedure TDepartmentToCreate.SetKpp(AValue:String);
begin
  FKpp:=AValue;
  Modified(4);
end;

end.
