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

unit DiadocTypes_EmployeeToCreate;

{$I diadoc_define.inc}

interface

//import "User.proto";
//import "Employees/Employee.proto";
//package Diadoc.Api.Proto.Employees;
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_User,
  DiadocTypes_Employee;

type
  //message EmployeeToCreateByCertificate
  //{
  //      required bytes Content = 1;
  //      optional string AccessBasis = 2;
  //      optional string Email = 3;
  //}

  TEmployeeToCreateByCertificate = class(TSerializationObject)
  private
    FAccessBasis: string;
    FContent: TBytes;
    FEmail: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Content:TBytes read FContent write FContent;//1;
    property AccessBasis:string read FAccessBasis write FAccessBasis;//2;
    property Email:string read FEmail write FEmail;//3;
  end;

  //message EmployeeToCreateByLogin
  //{
  //      required string Login = 1;
  //      optional FullName FullName = 2;
  //}

  { TEmployeeToCreateByLogin }

  TEmployeeToCreateByLogin = class(TSerializationObject)
  private
    FFullName: TFullName;
    FLogin: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Login:string read FLogin write FLogin;//1;
    property FullName:TFullName read FFullName write FFullName;//2;
  end;

  //message EmployeeToCreateCredentials
  //{
  //      optional EmployeeToCreateByLogin Login = 1;
  //      optional EmployeeToCreateByCertificate Certificate = 2;
  //}

  { TEmployeeToCreateCredentials }

  TEmployeeToCreateCredentials = class(TSerializationObject)
  private
    FCertificate: TEmployeeToCreateByCertificate;
    FLogin: TEmployeeToCreateByLogin;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Login:TEmployeeToCreateByLogin read FLogin write FLogin;//1;
    property Certificate:TEmployeeToCreateByCertificate read FCertificate write FCertificate;//2;
  end;

  //message EmployeeToCreate
  //{
  //      required EmployeeToCreateCredentials Credentials = 1;
  //      optional string Position = 2;
  //      required bool CanBeInvitedForChat = 3;
  //      required EmployeePermissions Permissions = 4;
  //}
  TEmployeeToCreate = class(TSerializationObject)
  private
    FCanBeInvitedForChat: Boolean;
    FCredentials: TEmployeeToCreateCredentials;
    FPermissions: TEmployeePermissions;
    FPosition: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Credentials:TEmployeeToCreateCredentials read FCredentials write FCredentials;//1;
    property Position:string read FPosition write FPosition;//2;
    property CanBeInvitedForChat:Boolean read FCanBeInvitedForChat write FCanBeInvitedForChat;//3;
    property Permissions:TEmployeePermissions read FPermissions write FPermissions;//4;
  end;

implementation

{ TEmployeeToCreate }

procedure TEmployeeToCreate.InternalInit;
begin
  inherited InternalInit;
  FCredentials:=TEmployeeToCreateCredentials.Create;
  FPermissions:=TEmployeePermissions.Create;
end;

procedure TEmployeeToCreate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Credentials', 1);
  RegisterProp('Position', 2);
  RegisterProp('CanBeInvitedForChat', 3);
  RegisterProp('Permissions', 4);
end;

destructor TEmployeeToCreate.Destroy;
begin
  FreeAndNil(FCredentials);
  FreeAndNil(FPermissions);
  inherited Destroy;
end;

{ TEmployeeToCreateCredentials }

procedure TEmployeeToCreateCredentials.InternalInit;
begin
  inherited InternalInit;
  FLogin:=TEmployeeToCreateByLogin.Create;
  FCertificate:=TEmployeeToCreateByCertificate.Create;
end;

procedure TEmployeeToCreateCredentials.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Login', 1);
  RegisterProp('Certificate', 2);
end;

destructor TEmployeeToCreateCredentials.Destroy;
begin
  FreeAndNil(FLogin);
  FreeAndNil(FCertificate);
  inherited Destroy;
end;

{ TEmployeeToCreateByLogin }

procedure TEmployeeToCreateByLogin.InternalInit;
begin
  inherited InternalInit;
  FFullName:=TFullName.Create;
end;

procedure TEmployeeToCreateByLogin.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Login', 1);
  RegisterProp('FullName', 2);
end;

destructor TEmployeeToCreateByLogin.Destroy;
begin
  FreeAndNil(FFullName);
  inherited Destroy;
end;

{ TEmployeeToCreateByCertificate }

procedure TEmployeeToCreateByCertificate.InternalInit;
begin
  inherited InternalInit;
end;

procedure TEmployeeToCreateByCertificate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Content', 1);
  RegisterProp('AccessBasis', 2);
  RegisterProp('Email', 3);
end;

destructor TEmployeeToCreateByCertificate.Destroy;
begin
  inherited Destroy;
end;

end.

