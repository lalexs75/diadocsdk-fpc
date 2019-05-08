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

unit DiadocTypes_Department;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_Address, DiadocTypes_Timestamp, Diadoctypes_Routing;

type

  TDepartment = class;

  { Department } 
  //message Department
  //{
  //	required string Id = 1;
  //	optional string ParentDepartmentId = 2;
  //	required string Name = 3;
  //	required string Abbreviation = 4;
  //	optional string Kpp = 5;
  //	optional Address Address = 6;
  //	required Routing Routing = 7;
  //	required Timestamp CreationTimestamp = 8;
  //}
  TDepartment = class(TSerializationObject)
  private
    FId:String;
    FParentDepartmentId:String;
    FName:String;
    FAbbreviation:String;
    FKpp:String;
    FAddress:TAddress;
    FRouting:TRouting;
    FCreationTimestamp:TTimestamp;
    procedure SetId(AValue:String);
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
    property Id:String read FId write SetId;
    property ParentDepartmentId:String read FParentDepartmentId write SetParentDepartmentId;
    property Name:String read FName write SetName;
    property Abbreviation:String read FAbbreviation write SetAbbreviation;
    property Kpp:String read FKpp write SetKpp;
    property Address:TAddress read FAddress;
    property Routing:TRouting read FRouting;
    property CreationTimestamp:TTimestamp read FCreationTimestamp;
  end;
  TDepartments = specialize GSerializationObjectList<TDepartment>;

implementation

  { Department } 

procedure TDepartment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Id', 1, true);
  RegisterProp('ParentDepartmentId', 2);
  RegisterProp('Name', 3, true);
  RegisterProp('Abbreviation', 4, true);
  RegisterProp('Kpp', 5);
  RegisterProp('Address', 6);
  RegisterProp('Routing', 7, true);
  RegisterProp('CreationTimestamp', 8, true);
end;

procedure TDepartment.InternalInit;
begin
  inherited InternalInit;
  FAddress:= TAddress.Create;
  FRouting:= TRouting.Create;
  FCreationTimestamp:= TTimestamp.Create;
end;

destructor TDepartment.Destroy;
begin
  FAddress.Free;
  FRouting.Free;
  FCreationTimestamp.Free;
  inherited Destroy;
end;

procedure TDepartment.SetId(AValue:String);
begin
  FId:=AValue;
  Modified(1);
end;

procedure TDepartment.SetParentDepartmentId(AValue:String);
begin
  FParentDepartmentId:=AValue;
  Modified(2);
end;

procedure TDepartment.SetName(AValue:String);
begin
  FName:=AValue;
  Modified(3);
end;

procedure TDepartment.SetAbbreviation(AValue:String);
begin
  FAbbreviation:=AValue;
  Modified(4);
end;

procedure TDepartment.SetKpp(AValue:String);
begin
  FKpp:=AValue;
  Modified(5);
end;

end.
