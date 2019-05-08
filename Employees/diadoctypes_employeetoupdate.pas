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
//EmployeeToUpdate.proto
unit DiadocTypes_EmployeeToUpdate;

{$mode objfpc}{$H+}

interface

//import "Employees/Employee.proto";
//import "OrganizationUserPermissions.proto";
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Employee,
  DiadocTypes_OrganizationUserPermissions
  ;
//package Diadoc.Api.Proto.Employees;

type
  //message AuthorizationPermissionPatch {
  // 	required bool IsBlocked = 1;
  // 	optional string Comment = 2;
  // }

  { TAuthorizationPermissionPatch }

  TAuthorizationPermissionPatch = class(TSerializationObject)
  private
    FComment: string;
    FIsBlocked: Boolean;
    procedure SetComment(AValue: string);
    procedure SetIsBlocked(AValue: Boolean);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property IsBlocked:Boolean read FIsBlocked write SetIsBlocked; //@1
    property Comment:string read FComment write SetComment; //@2
  end;

  //message EmployeeCanBeInvitedForChatPatch
  //{
  //	required bool CanBeInvitedForChat = 1;
  //}

  { TEmployeeCanBeInvitedForChatPatch }

  TEmployeeCanBeInvitedForChatPatch = class(TSerializationObject)
  private
    FCanBeInvitedForChat: Boolean;
    procedure SetCanBeInvitedForChat(AValue: Boolean);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property CanBeInvitedForChat:Boolean read FCanBeInvitedForChat write SetCanBeInvitedForChat;//1;
  end;


  //message EmployeePositionPatch
  //{
  //	optional string Position = 1;
  //}
  //

  { TEmployeePositionPatch }

  TEmployeePositionPatch = class(TSerializationObject)
  private
    FPosition: string;
    procedure SetPosition(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Position:string read FPosition write SetPosition;//1;
  end;

  //message EmployeeSelectedDepartmentsPatch
  //{
  //	repeated string SelectedDepartmentIds = 1;
  //}
  //

  { TEmployeeSelectedDepartmentsPatch }

  TEmployeeSelectedDepartmentsPatch = class(TSerializationObject)
  private
    FSelectedDepartmentIds: TDocumentStrings;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property SelectedDepartmentIds:TDocumentStrings read FSelectedDepartmentIds; //1;
  end;

  //message EmployeeDocumentAccessLevelPatch
  //{
  //	required DocumentAccessLevel DocumentAccessLevel = 1;
  //}
  //

  { TEmployeeDocumentAccessLevelPatch }

  TEmployeeDocumentAccessLevelPatch = class(TSerializationObject)
  private
    FDocumentAccessLevel: TDocumentAccessLevel;
    procedure SetDocumentAccessLevel(AValue: TDocumentAccessLevel);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property DocumentAccessLevel:TDocumentAccessLevel read FDocumentAccessLevel write SetDocumentAccessLevel;//1;
  end;

  //message EmployeeIsAdministratorPatch
  //{
  //	required bool IsAdministrator = 1;
  //}

  { TEmployeeIsAdministratorPatch }

  TEmployeeIsAdministratorPatch = class(TSerializationObject)
  private
    FIsAdministrator: boolean;
    procedure SetIsAdministrator(AValue: boolean);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property IsAdministrator:boolean read FIsAdministrator write SetIsAdministrator;//1;
  end;

  //message EmployeeDepartmentPatch
  //{
  //	required string DepartmentId = 1;
  //}
  //

  { TEmployeeDepartmentPatch }

  TEmployeeDepartmentPatch = class(TSerializationObject)
  private
    FDepartmentId: string;
    procedure SetDepartmentId(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property DepartmentId:string read FDepartmentId write SetDepartmentId;//1;
  end;

  { TEmployeePermissionsPatch }
  //message EmployeePermissionsPatch
  //{
  //	optional EmployeeDepartmentPatch Department = 1;
  //	optional EmployeeIsAdministratorPatch IsAdministrator = 2;
  //	optional EmployeeDocumentAccessLevelPatch DocumentAccessLevel = 3;
  //	optional EmployeeSelectedDepartmentsPatch SelectedDepartments = 4;
  //	repeated EmployeeAction Actions = 5;
  //    optional AuthorizationPermissionPatch AuthorizationPermission = 6;
  //}

  TEmployeePermissionsPatch = class(TSerializationObject)
  private
    FActions: TEmployeeActions;
    FAuthorizationPermission: TAuthorizationPermissionPatch;
    FDepartment: TEmployeeDepartmentPatch;
    FDocumentAccessLevel: TEmployeeDocumentAccessLevelPatch;
    FIsAdministrator: TEmployeeIsAdministratorPatch;
    FSelectedDepartments: TEmployeeSelectedDepartmentsPatch;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Department:TEmployeeDepartmentPatch read FDepartment;//1;
    property IsAdministrator:TEmployeeIsAdministratorPatch read FIsAdministrator;//2;
    property DocumentAccessLevel:TEmployeeDocumentAccessLevelPatch read FDocumentAccessLevel;//3;
    property SelectedDepartments:TEmployeeSelectedDepartmentsPatch read FSelectedDepartments;//4;
    property Actions:TEmployeeActions read FActions;//5
    property AuthorizationPermission:TAuthorizationPermissionPatch read FAuthorizationPermission; //@6;
  end;

  { TEmployeeToUpdate }
  //message EmployeeToUpdate
  //{
  //	optional EmployeePermissionsPatch Permissions = 1;
  //	optional EmployeePositionPatch Position = 2;
  //	optional EmployeeCanBeInvitedForChatPatch CanBeInvitedForChat = 3;
  //}

  TEmployeeToUpdate = class(TSerializationObject)
  private
    FCanBeInvitedForChat: TEmployeeCanBeInvitedForChatPatch;
    FPermissions: TEmployeePermissionsPatch;
    FPosition: TEmployeePositionPatch;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Permissions:TEmployeePermissionsPatch read FPermissions;//1;
    property Position:TEmployeePositionPatch read FPosition;//2;
    property CanBeInvitedForChat:TEmployeeCanBeInvitedForChatPatch read FCanBeInvitedForChat;//3;
  end;

implementation

{ TAuthorizationPermissionPatch }

procedure TAuthorizationPermissionPatch.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(2);
end;

procedure TAuthorizationPermissionPatch.SetIsBlocked(AValue: Boolean);
begin
  if FIsBlocked=AValue then Exit;
  FIsBlocked:=AValue;
  Modified(1);
end;

procedure TAuthorizationPermissionPatch.InternalInit;
begin
  inherited InternalInit;
end;

procedure TAuthorizationPermissionPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FComment', 1, true);
  RegisterProp('FIsBlocked', 2);
end;

destructor TAuthorizationPermissionPatch.Destroy;
begin
  inherited Destroy;
end;

{ TEmployeeToUpdate }

procedure TEmployeeToUpdate.InternalInit;
begin
  inherited InternalInit;
  FPermissions:=TEmployeePermissionsPatch.Create;
  FPosition:=TEmployeePositionPatch.Create;
  FCanBeInvitedForChat:=TEmployeeCanBeInvitedForChatPatch.Create;
end;

procedure TEmployeeToUpdate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Permissions', 1);
  RegisterProp('Position', 2);
  RegisterProp('CanBeInvitedForChat', 3);
end;

destructor TEmployeeToUpdate.Destroy;
begin
  FreeAndNil(FPermissions);
  FreeAndNil(FPosition);
  FreeAndNil(FCanBeInvitedForChat);
  inherited Destroy;
end;

{ TEmployeeIsAdministratorPatch }

procedure TEmployeeIsAdministratorPatch.SetIsAdministrator(AValue: boolean);
begin
  if FIsAdministrator=AValue then Exit;
  FIsAdministrator:=AValue;
  Modified(1);
end;

procedure TEmployeeIsAdministratorPatch.InternalInit;
begin
  inherited InternalInit;
end;

procedure TEmployeeIsAdministratorPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsAdministrator', 1);
end;

destructor TEmployeeIsAdministratorPatch.Destroy;
begin
  inherited Destroy;
end;

{ TEmployeePermissionsPatch }

procedure TEmployeePermissionsPatch.InternalInit;
begin
  inherited InternalInit;
  FDepartment:=TEmployeeDepartmentPatch.Create;
  FIsAdministrator:=TEmployeeIsAdministratorPatch.Create;
  FDocumentAccessLevel:=TEmployeeDocumentAccessLevelPatch.Create;
  FSelectedDepartments:=TEmployeeSelectedDepartmentsPatch.Create;
  FActions:=TEmployeeActions.Create;
  FAuthorizationPermission:=TAuthorizationPermissionPatch.Create;
end;

procedure TEmployeePermissionsPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Department', 1);
  RegisterProp('IsAdministrator', 2);
  RegisterProp('DocumentAccessLevel', 3);
  RegisterProp('SelectedDepartments', 4);
  RegisterProp('Actions', 5);
  RegisterProp('AuthorizationPermission', 6);
end;

destructor TEmployeePermissionsPatch.Destroy;
begin
  FreeAndNil(FDepartment);
  FreeAndNil(FIsAdministrator);
  FreeAndNil(FDocumentAccessLevel);
  FreeAndNil(FSelectedDepartments);
  FreeAndNil(FActions);
  FreeAndNil(FAuthorizationPermission);
  inherited Destroy;
end;

{ TEmployeeDepartmentPatch }

procedure TEmployeeDepartmentPatch.SetDepartmentId(AValue: string);
begin
  if FDepartmentId=AValue then Exit;
  FDepartmentId:=AValue;
  Modified(1);
end;

procedure TEmployeeDepartmentPatch.InternalInit;
begin
  inherited InternalInit;
end;

procedure TEmployeeDepartmentPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DepartmentId', 1);
end;

destructor TEmployeeDepartmentPatch.Destroy;
begin
  inherited Destroy;
end;

{ TEmployeeDocumentAccessLevelPatch }

procedure TEmployeeDocumentAccessLevelPatch.SetDocumentAccessLevel(
  AValue: TDocumentAccessLevel);
begin
  if FDocumentAccessLevel=AValue then Exit;
  FDocumentAccessLevel:=AValue;
  Modified(1);
end;

procedure TEmployeeDocumentAccessLevelPatch.InternalInit;
begin
  inherited InternalInit;
end;

procedure TEmployeeDocumentAccessLevelPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentAccessLevel', 1);
end;

destructor TEmployeeDocumentAccessLevelPatch.Destroy;
begin
  inherited Destroy;
end;

{ TEmployeeSelectedDepartmentsPatch }

procedure TEmployeeSelectedDepartmentsPatch.InternalInit;
begin
  inherited InternalInit;
  FSelectedDepartmentIds:=TDocumentStrings.Create;
end;

procedure TEmployeeSelectedDepartmentsPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SelectedDepartmentIds', 1);
end;

destructor TEmployeeSelectedDepartmentsPatch.Destroy;
begin
  FreeAndNil(FSelectedDepartmentIds);
  inherited Destroy;
end;

{ TEmployeePositionPatch }

procedure TEmployeePositionPatch.SetPosition(AValue: string);
begin
  if FPosition=AValue then Exit;
  FPosition:=AValue;
  Modified(1);
end;

procedure TEmployeePositionPatch.InternalInit;
begin
  inherited InternalInit;
end;

procedure TEmployeePositionPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Position', 1);
end;

destructor TEmployeePositionPatch.Destroy;
begin
  inherited Destroy;
end;

{ TEmployeeCanBeInvitedForChatPatch }

procedure TEmployeeCanBeInvitedForChatPatch.SetCanBeInvitedForChat(
  AValue: Boolean);
begin
  if FCanBeInvitedForChat=AValue then Exit;
  FCanBeInvitedForChat:=AValue;
  Modified(1);
end;

procedure TEmployeeCanBeInvitedForChatPatch.InternalInit;
begin
  inherited InternalInit;
end;

procedure TEmployeeCanBeInvitedForChatPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('CanBeInvitedForChat', 1);
end;

destructor TEmployeeCanBeInvitedForChatPatch.Destroy;
begin
  inherited Destroy;
end;

end.

