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
unit DiadocTypes_ResolutionTarget;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc;
type
  { TResolutionTarget }
  //message ResolutionTarget {
  //      optional string Department = 1;
  //      optional string DepartmentId = 2;
  //      optional string User = 3;
  //      optional string UserId = 4;
  //}
  TResolutionTarget = class(TSerializationObject) //message ResolutionTarget
  private
    FDepartment: string;
    FDepartmentId: string;
    FUser: string;
    FUserId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Department:string read FDepartment write FDepartment; //1
    property DepartmentId:string read FDepartmentId write FDepartmentId; //2
    property User:string read FUser write FUser; //3
    property UserId:string read FUserId write FUserId; //4
  end;

implementation

{ TResolutionTarget }

procedure TResolutionTarget.InternalInit;
begin
  inherited InternalInit;
end;

destructor TResolutionTarget.Destroy;
begin
  inherited Destroy;
end;

procedure TResolutionTarget.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Department', 1);
  RegisterProp('DepartmentId', 2);
  RegisterProp('User', 3);
  RegisterProp('UserId', 4);
end;
end.

