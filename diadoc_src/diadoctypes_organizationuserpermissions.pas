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

{ Структуры данных базируются на информации http://api-docs.diadoc.ru/ru/latest/DataStructures.html }

unit DiadocTypes_OrganizationUserPermissions;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc, diadoc_simple_arrays;

type
  TDocumentAccessLevel = (
    UnknownDocumentAccessLevel = -1, // Access level which is reported to legacy clients for newly introduced access levels
    DepartmentOnly = 0,
    DepartmentAndSubdepartments = 1,
    AllDocuments = 2,
    SelectedDepartments = 3
  );

  //message AuthorizationPermission {
  //	required bool IsBlocked = 1;
  //	optional string Comment = 2;
  //}

  { TAuthorizationPermission }

  TAuthorizationPermission = class(TSerializationObject)
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

  {  TOrganizationUserPermissions  }
  //%message OrganizationUserPermissions {
  //%       required string UserDepartmentId = 1;
  //%       required bool IsAdministrator = 2;
  //%       optional DocumentAccessLevel DocumentAccessLevel = 3 [default = UnknownDocumentAccessLevel];
  //%       required bool CanSignDocuments = 4;
  //%       required bool CanManageCounteragents = 6;
  //%       required bool CanAddResolutions = 7;
  //%       required bool CanRequestResolutions = 8;
  //%       repeated string SelectedDepartmentIds = 9;
  //%       optional string JobTitle = 10;
  //%       required bool CanCreateDocuments = 11;
  //%       required AuthorizationPermission AuthorizationPermission = 12;
  //%       required bool CanDeleteRestoreDocuments = 13;
  //% }
  TOrganizationUserPermissions = class(TSerializationObject)
  private
    FAuthorizationPermission: TAuthorizationPermission;
    FCanAddResolutions: Boolean;
    FCanCreateDocuments: boolean;
    FCanDeleteRestoreDocuments: Boolean;
    FCanManageCounteragents: Boolean;
    FCanRequestResolutions: Boolean;
    FCanSignDocuments: Boolean;
    FDocumentAccessLevel: TDocumentAccessLevel;
    FIsAdministrator: Boolean;
    FJobTitle: string;
    FSelectedDepartmentIds: TDocumentStrings;
    FUserDepartmentId: string;
    procedure SetCanAddResolutions(AValue: Boolean);
    procedure SetCanCreateDocuments(AValue: boolean);
    procedure SetCanDeleteRestoreDocuments(AValue: Boolean);
    procedure SetCanManageCounteragents(AValue: Boolean);
    procedure SetCanRequestResolutions(AValue: Boolean);
    procedure SetCanSignDocuments(AValue: Boolean);
    procedure SetDocumentAccessLevel(AValue: TDocumentAccessLevel);
    procedure SetIsAdministrator(AValue: Boolean);
    procedure SetJobTitle(AValue: string);
    procedure SetUserDepartmentId(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property UserDepartmentId:string read FUserDepartmentId write SetUserDepartmentId;//1;
    property IsAdministrator:Boolean read FIsAdministrator write SetIsAdministrator;//2;
    property DocumentAccessLevel:TDocumentAccessLevel read FDocumentAccessLevel write SetDocumentAccessLevel; //3
    property CanSignDocuments:Boolean read FCanSignDocuments write SetCanSignDocuments;//4;
    property CanManageCounteragents:Boolean read FCanManageCounteragents write SetCanManageCounteragents;//6;
    property CanAddResolutions:Boolean read FCanAddResolutions write SetCanAddResolutions;//7;
    property CanRequestResolutions:Boolean read FCanRequestResolutions write SetCanRequestResolutions;//8;
    property SelectedDepartmentIds:TDocumentStrings read FSelectedDepartmentIds;//9;
    property JobTitle:string read FJobTitle write SetJobTitle; //10;
    property CanCreateDocuments:boolean read FCanCreateDocuments write SetCanCreateDocuments; //11;
    property AuthorizationPermission:TAuthorizationPermission read FAuthorizationPermission;//12;
    property CanDeleteRestoreDocuments:Boolean read FCanDeleteRestoreDocuments write SetCanDeleteRestoreDocuments;//13;
  end;

function DocumentAccessLevelToStr(AAccessLevel:TDocumentAccessLevel):string;
implementation

function DocumentAccessLevelToStr(AAccessLevel:TDocumentAccessLevel):string;
begin
  case AAccessLevel of
    UnknownDocumentAccessLevel:Result:='UnknownDocumentAccessLevel';
    DepartmentOnly:Result:='DepartmentOnly';
    DepartmentAndSubdepartments:Result:='DepartmentAndSubdepartments';
    AllDocuments:Result:='AllDocuments';
    SelectedDepartments:Result:='SelectedDepartments';
  else
    Result:='';
  end
end;

{ TAuthorizationPermission }

procedure TAuthorizationPermission.SetComment(AValue: string);
begin
  if FComment=AValue then Exit;
  FComment:=AValue;
  Modified(2);
end;

procedure TAuthorizationPermission.SetIsBlocked(AValue: Boolean);
begin
  if FIsBlocked=AValue then Exit;
  FIsBlocked:=AValue;
  Modified(1);
end;

procedure TAuthorizationPermission.InternalInit;
begin
  inherited InternalInit;
end;

procedure TAuthorizationPermission.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsBlocked', 1, true);
  RegisterProp('Comment', 2);
end;

destructor TAuthorizationPermission.Destroy;
begin
  inherited Destroy;
end;

{ TOrganizationUserPermissions }

procedure TOrganizationUserPermissions.SetCanAddResolutions(AValue: Boolean);
begin
  if FCanAddResolutions=AValue then Exit;
  FCanAddResolutions:=AValue;
  Modified(7);
end;

procedure TOrganizationUserPermissions.SetCanCreateDocuments(AValue: boolean);
begin
  if FCanCreateDocuments=AValue then Exit;
  FCanCreateDocuments:=AValue;
  Modified(11);
end;

procedure TOrganizationUserPermissions.SetCanDeleteRestoreDocuments(
  AValue: Boolean);
begin
  if FCanDeleteRestoreDocuments=AValue then Exit;
  FCanDeleteRestoreDocuments:=AValue;
  Modified(13);
end;

procedure TOrganizationUserPermissions.SetCanManageCounteragents(AValue: Boolean
  );
begin
  if FCanManageCounteragents=AValue then Exit;
  FCanManageCounteragents:=AValue;
  Modified(6);
end;

procedure TOrganizationUserPermissions.SetCanRequestResolutions(AValue: Boolean
  );
begin
  if FCanRequestResolutions=AValue then Exit;
  FCanRequestResolutions:=AValue;
  Modified(8);
end;

procedure TOrganizationUserPermissions.SetCanSignDocuments(AValue: Boolean);
begin
  if FCanSignDocuments=AValue then Exit;
  FCanSignDocuments:=AValue;
  Modified(4);
end;

procedure TOrganizationUserPermissions.SetDocumentAccessLevel(
  AValue: TDocumentAccessLevel);
begin
  if FDocumentAccessLevel=AValue then Exit;
  FDocumentAccessLevel:=AValue;
  Modified(3);
end;

procedure TOrganizationUserPermissions.SetIsAdministrator(AValue: Boolean);
begin
  if FIsAdministrator=AValue then Exit;
  FIsAdministrator:=AValue;
  Modified(2);
end;

procedure TOrganizationUserPermissions.SetJobTitle(AValue: string);
begin
  if FJobTitle=AValue then Exit;
  FJobTitle:=AValue;
  Modified(10);
end;

procedure TOrganizationUserPermissions.SetUserDepartmentId(AValue: string);
begin
  if FUserDepartmentId=AValue then Exit;
  FUserDepartmentId:=AValue;
  Modified(1);
end;

procedure TOrganizationUserPermissions.InternalInit;
begin
  inherited InternalInit;
  FSelectedDepartmentIds:=TDocumentStrings.Create;
  FAuthorizationPermission:=TAuthorizationPermission.Create;
end;

procedure TOrganizationUserPermissions.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('UserDepartmentId', 1, true);
  RegisterProp('IsAdministrator', 2, true);
  RegisterProp('DocumentAccessLevel', 3);
  RegisterProp('CanSignDocuments', 4, true);
  RegisterProp('CanManageCounteragents', 6);
  RegisterProp('CanAddResolutions', 7, true);
  RegisterProp('CanRequestResolutions', 8, true);
  RegisterProp('SelectedDepartmentIds', 9);
  RegisterProp('JobTitle', 10);
  RegisterProp('CanCreateDocuments', 11, true);
  RegisterProp('AuthorizationPermission', 12, true);
  RegisterProp('CanDeleteRestoreDocuments', 13, true);
end;

destructor TOrganizationUserPermissions.Destroy;
begin
  FreeAndNil(FAuthorizationPermission);
  FreeAndNil(FSelectedDepartmentIds);
  inherited Destroy;
end;

end.

