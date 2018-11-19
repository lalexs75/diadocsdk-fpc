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

unit DiadocTypes_Employee;

{$I diadoc_define.inc}

interface

(*
import "User.proto";
import "OrganizationUserPermissions.proto";
import "Timestamp.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_User,
  DiadocTypes_OrganizationUserPermissions,
  DiadocTypes_Timestamp;

type
  //message EmployeeAction {
  //      required string Name = 1;
  //      required bool IsAllowed = 2;
  //}

  { TEmployeeAction }

  TEmployeeAction = class(TSerializationObject)
  private
    FIsAllowed: boolean;
    FName: string;
  protected
    procedure InternalRegisterProperty; override;
  public
  published
    property Name:string read FName write FName;//1;
    property IsAllowed:boolean read FIsAllowed write FIsAllowed;//2;
  end;
  TEmployeeActions = specialize GSerializationObjectList<TEmployeeAction>;

  // message EmployeePermissions {
  //      required string UserDepartmentId = 1;
  //      required bool IsAdministrator = 2;
  //      required DocumentAccessLevel DocumentAccessLevel = 3 [default = UnknownDocumentAccessLevel];
  //      repeated string SelectedDepartmentIds = 4;
  //      repeated EmployeeAction Actions = 5;
  //}

  { TEmployeePermissions }

  TEmployeePermissions = class(TSerializationObject)
  private
    FActions: TEmployeeActions;
    FDocumentAccessLevel: TDocumentAccessLevel;
    FIsAdministrator: Boolean;
    FSelectedDepartmentIds: TDocumentStrings;
    FUserDepartmentId: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property UserDepartmentId:string read FUserDepartmentId write FUserDepartmentId; //1;
    property IsAdministrator:Boolean read FIsAdministrator write FIsAdministrator; //2;
    property DocumentAccessLevel:TDocumentAccessLevel read FDocumentAccessLevel write FDocumentAccessLevel; //3 [default = UnknownDocumentAccessLevel];
    property SelectedDepartmentIds:TDocumentStrings read FSelectedDepartmentIds;//4;
    property Actions:TEmployeeActions read FActions;//5;
  end;

  //message Employee
  //{
  //      required UserV2 User = 1;
  //      required EmployeePermissions Permissions = 2;
  //      required string Position = 3;
  //      required bool CanBeInvitedForChat = 4;
  //      optional Timestamp CreationTimestamp = 5;
  //}

  TEmployee = class(TSerializationObject)
  private
    FCanBeInvitedForChat: Boolean;
    FCreationTimestamp: TTimestamp;
    FPermissions: TEmployeePermissions;
    FPosition: string;
    FUser: TUserV2;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property User:TUserV2 read FUser;//1;
    property Permissions:TEmployeePermissions read FPermissions;//2;
    property Position:string read FPosition write FPosition;//3;
    property CanBeInvitedForChat:Boolean read FCanBeInvitedForChat write FCanBeInvitedForChat;//4;
    property CreationTimestamp:TTimestamp read FCreationTimestamp;//5;
  end;
implementation

{ TEmployee }

procedure TEmployee.InternalInit;
begin
  inherited InternalInit;
  RegisterProp('User', 1);
  RegisterProp('Permissions', 2);
  RegisterProp('Position', 3);
  RegisterProp('CanBeInvitedForChat', 4);
  RegisterProp('CreationTimestamp', 5);
end;

procedure TEmployee.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  FUser:=TUserV2.Create;
  FPermissions:=TEmployeePermissions.Create;
  FCreationTimestamp:=TTimestamp.Create;
end;

destructor TEmployee.Destroy;
begin
  FreeAndNil(FUser);
  FreeAndNil(FPermissions);
  FreeAndNil(FCreationTimestamp);
  inherited Destroy;
end;

{ TEmployeePermissions }

procedure TEmployeePermissions.InternalInit;
begin
  inherited InternalInit;
  FDocumentAccessLevel:= UnknownDocumentAccessLevel;
  FSelectedDepartmentIds:=TDocumentStrings.Create;
  FActions:=TEmployeeActions.Create;
end;

procedure TEmployeePermissions.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('UserDepartmentId', 1);
  RegisterProp('IsAdministrator', 2);
  RegisterProp('DocumentAccessLevel', 3);
  RegisterProp('SelectedDepartmentIds', 4);
  RegisterProp('Actions', 5);
end;

destructor TEmployeePermissions.Destroy;
begin
  FSelectedDepartmentIds:=TDocumentStrings.Create;
  FActions:=TEmployeeActions.Create;
  inherited Destroy;
end;

{ TEmployeeAction }

procedure TEmployeeAction.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1);
  RegisterProp('IsAllowed', 2);
end;

end.

