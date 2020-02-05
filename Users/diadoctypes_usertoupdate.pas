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

//package Diadoc.Api.Proto.Users;
unit DiadocTypes_UserToUpdate;

{$I diadoc_define.inc}

interface

//import "User.proto";
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_User;

type

  { TUserFullNamePatch }
  //message UserFullNamePatch
  //{
  //    optional FullName FullName = 1;
  //}
  TUserFullNamePatch = class(TSerializationObject)
  private
    FFullName: TFullName;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FullName:TFullName read FFullName; //1;
  end;

  { TUserLoginPatch }
  //message UserLoginPatch
  //{
  //    optional string Login = 1;
  //}
  TUserLoginPatch = class(TSerializationObject)
  private
    FLogin: string;
  protected
    procedure InternalRegisterProperty; override;
  published
    property Login:string read FLogin write FLogin;//1;
  end;

  { TUserToUpdate }
  //message UserToUpdate
  //{
  //    optional UserLoginPatch Login = 1;
  //    optional UserFullNamePatch FullName = 2;
  //}
  TUserToUpdate = class(TSerializationObject)
  private
    FFullName: TUserFullNamePatch;
    FLogin: TUserLoginPatch;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Login:TUserLoginPatch read FLogin; //1;
    property FullName:TUserFullNamePatch read FFullName; //2;
  end;

implementation

{ TUserToUpdate }

procedure TUserToUpdate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Login', 1);
  RegisterProp('FullName', 2);
end;

procedure TUserToUpdate.InternalInit;
begin
  inherited InternalInit;
  FLogin:=TUserLoginPatch.Create;
  FFullName:=TUserFullNamePatch.Create;
end;

destructor TUserToUpdate.Destroy;
begin
  FreeAndNil(FLogin);
  FreeAndNil(FFullName);
  inherited Destroy;
end;

{ TUserLoginPatch }

procedure TUserLoginPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Login', 1);
end;

{ TUserFullNamePatch }

procedure TUserFullNamePatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FullName', 1);
end;

procedure TUserFullNamePatch.InternalInit;
begin
  inherited InternalInit;
  FFullName:=TFullName.Create;
end;

destructor TUserFullNamePatch.Destroy;
begin
  FreeAndNil(FFullName);
  inherited Destroy;
end;

end.

