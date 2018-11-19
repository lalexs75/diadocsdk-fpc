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
  //message EmployeeCanBeInvitedForChatPatch
  //{
  //	required bool CanBeInvitedForChat = 1;
  //}

  { TEmployeeCanBeInvitedForChatPatch }

  TEmployeeCanBeInvitedForChatPatch = class(TSerializationObject)
  private
    FCanBeInvitedForChat: Boolean;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property CanBeInvitedForChat:Boolean read FCanBeInvitedForChat write FCanBeInvitedForChat;//1;
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
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Position:string read FPosition write FPosition;//1;
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
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property DocumentAccessLevel:TDocumentAccessLevel read FDocumentAccessLevel write FDocumentAccessLevel;//1;
  end;

  //message EmployeeIsAdministratorPatch
  //{
  //	required bool IsAdministrator = 1;
  //}

  { TEmployeeIsAdministratorPatch }

  TEmployeeIsAdministratorPatch = class(TSerializationObject)
  private
    FIsAdministrator: boolean;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property IsAdministrator:boolean read FIsAdministrator write FIsAdministrator;//1;
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
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property DepartmentId:string read FDepartmentId write FDepartmentId;//1;
  end;

  //message EmployeePermissionsPatch
  //{
  //	optional EmployeeDepartmentPatch Department = 1;
  //	optional EmployeeIsAdministratorPatch IsAdministrator = 2;
  //	optional EmployeeDocumentAccessLevelPatch DocumentAccessLevel = 3;
  //	optional EmployeeSelectedDepartmentsPatch SelectedDepartments = 4;
  //	repeated EmployeeAction Actions = 5;
  //}
  //

  { TEmployeePermissionsPatch }

  TEmployeePermissionsPatch = class(TSerializationObject)
  private
    FActions: TEmployeeActions;
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
  end;

  //message EmployeeToUpdate
  //{
  //	optional EmployeePermissionsPatch Permissions = 1;
  //	optional EmployeePositionPatch Position = 2;
  //	optional EmployeeCanBeInvitedForChatPatch CanBeInvitedForChat = 3;
  //}
  //

  { TEmployeeToUpdate }

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
end;

procedure TEmployeePermissionsPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Department', 1);
  RegisterProp('IsAdministrator', 2);
  RegisterProp('DocumentAccessLevel', 3);
  RegisterProp('SelectedDepartments', 4);
  RegisterProp('Actions', 5);
end;

destructor TEmployeePermissionsPatch.Destroy;
begin
  FreeAndNil(FDepartment);
  FreeAndNil(FIsAdministrator);
  FreeAndNil(FDocumentAccessLevel);
  FreeAndNil(FSelectedDepartments);
  FreeAndNil(FActions);
  inherited Destroy;
end;

{ TEmployeeDepartmentPatch }

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

