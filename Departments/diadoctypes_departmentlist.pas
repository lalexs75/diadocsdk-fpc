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

unit DiadocTypes_DepartmentList;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_Department;

type

  TDepartmentList = class;

  { DepartmentList } 
  //message DepartmentList
  //{
  //	repeated Department Departments = 1;
  //	required int32 TotalCount = 2;
  //}
  TDepartmentList = class(TSerializationObject)
  private
    FDepartments:TDepartments;
    FTotalCount:Integer;
    procedure SetTotalCount(AValue:Integer);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Departments:TDepartments read FDepartments;
    property TotalCount:Integer read FTotalCount write SetTotalCount;
  end;
  TDepartmentLists = specialize GSerializationObjectList<TDepartmentList>;

implementation

  { DepartmentList } 

procedure TDepartmentList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Departments', 1);
  RegisterProp('TotalCount', 2, true);
end;

procedure TDepartmentList.InternalInit;
begin
  inherited InternalInit;
  FDepartments:= TDepartments.Create;
end;

destructor TDepartmentList.Destroy;
begin
  FDepartments.Free;
  inherited Destroy;
end;

procedure TDepartmentList.SetTotalCount(AValue:Integer);
begin
  FTotalCount:=AValue;
  Modified(2);
end;

end.
