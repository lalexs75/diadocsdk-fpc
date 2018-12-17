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
    procedure SetIsAllowed(AValue: boolean);
    procedure SetName(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
  public
  published
    property Name:string read FName write SetName;//1;
    property IsAllowed:boolean read FIsAllowed write SetIsAllowed;//2;
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
    procedure SetDocumentAccessLevel(AValue: TDocumentAccessLevel);
    procedure SetIsAdministrator(AValue: Boolean);
    procedure SetUserDepartmentId(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property UserDepartmentId:string read FUserDepartmentId write SetUserDepartmentId; //1;
    property IsAdministrator:Boolean read FIsAdministrator write SetIsAdministrator; //2;
    property DocumentAccessLevel:TDocumentAccessLevel read FDocumentAccessLevel write SetDocumentAccessLevel default UnknownDocumentAccessLevel;
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
    procedure SetCanBeInvitedForChat(AValue: Boolean);
    procedure SetPosition(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property User:TUserV2 read FUser;//1;
    property Permissions:TEmployeePermissions read FPermissions;//2;
    property Position:string read FPosition write SetPosition;//3;
    property CanBeInvitedForChat:Boolean read FCanBeInvitedForChat write SetCanBeInvitedForChat;//4;
    property CreationTimestamp:TTimestamp read FCreationTimestamp;//5;
  end;
  TEmployees = specialize GSerializationObjectList<TEmployee>;

  { EmployeeList }
  //message EmployeeList {
  //	repeated Employee Employees = 1;
  //	required int32 TotalCount = 2;
  //}
  TEmployeeList = class(TSerializationObject)
  private
    FEmployees:TEmployees;
    FTotalCount:Integer;
    procedure SetTotalCount(AValue:Integer);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Employees:TEmployees read FEmployees;
    property TotalCount:Integer read FTotalCount write SetTotalCount;
  end;
  TEmployeeLists = specialize GSerializationObjectList<TEmployeeList>;

implementation

{ TEmployee }

procedure TEmployee.SetCanBeInvitedForChat(AValue: Boolean);
begin
  if FCanBeInvitedForChat=AValue then Exit;
  FCanBeInvitedForChat:=AValue;
  Modified(4);
end;

procedure TEmployee.SetPosition(AValue: string);
begin
  if FPosition=AValue then Exit;
  FPosition:=AValue;
  Modified(3);
end;

procedure TEmployee.InternalInit;
begin
  inherited InternalInit;
  FUser:=TUserV2.Create;
  FPermissions:=TEmployeePermissions.Create;
  FCreationTimestamp:=TTimestamp.Create;
end;

procedure TEmployee.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('User', 1, true);
  RegisterProp('Permissions', 2, true);
  RegisterProp('Position', 3, true);
  RegisterProp('CanBeInvitedForChat', 4, true);
  RegisterProp('CreationTimestamp', 5);
end;

destructor TEmployee.Destroy;
begin
  FreeAndNil(FUser);
  FreeAndNil(FPermissions);
  FreeAndNil(FCreationTimestamp);
  inherited Destroy;
end;

{ TEmployeePermissions }

procedure TEmployeePermissions.SetDocumentAccessLevel(
  AValue: TDocumentAccessLevel);
begin
  if FDocumentAccessLevel=AValue then Exit;
  FDocumentAccessLevel:=AValue;
  Modified(3);
end;

procedure TEmployeePermissions.SetIsAdministrator(AValue: Boolean);
begin
  if FIsAdministrator=AValue then Exit;
  FIsAdministrator:=AValue;
  Modified(2);
end;

procedure TEmployeePermissions.SetUserDepartmentId(AValue: string);
begin
  if FUserDepartmentId=AValue then Exit;
  FUserDepartmentId:=AValue;
  Modified(1);
end;

procedure TEmployeePermissions.InternalInit;
begin
  inherited InternalInit;
  DocumentAccessLevel:= UnknownDocumentAccessLevel;
  FSelectedDepartmentIds:=TDocumentStrings.Create;
  FActions:=TEmployeeActions.Create;
end;

procedure TEmployeePermissions.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('UserDepartmentId', 1, true);
  RegisterProp('IsAdministrator', 2, true);
  RegisterProp('DocumentAccessLevel', 3, true);
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

procedure TEmployeeAction.SetIsAllowed(AValue: boolean);
begin
  if FIsAllowed=AValue then Exit;
  FIsAllowed:=AValue;
  Modified(2);
end;

procedure TEmployeeAction.SetName(AValue: string);
begin
  if FName=AValue then Exit;
  FName:=AValue;
  Modified(1);
end;

procedure TEmployeeAction.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1, true);
  RegisterProp('IsAllowed', 2, true);
end;

{ EmployeeList }

procedure TEmployeeList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Employees', 1);
  RegisterProp('TotalCount', 2, true);
end;

procedure TEmployeeList.InternalInit;
begin
  inherited InternalInit;
  FEmployees:= TEmployees.Create;
end;

destructor TEmployeeList.Destroy;
begin
  FEmployees.Free;
  inherited Destroy;
end;

procedure TEmployeeList.SetTotalCount(AValue:Integer);
begin
  FTotalCount:=AValue;
  Modified(2);
end;


end.

