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

  {  TOrganizationUserPermissions  }
  //message OrganizationUserPermissions {
  //       required string UserDepartmentId = 1;
  //       required bool IsAdministrator = 2;
  //       optional DocumentAccessLevel DocumentAccessLevel = 3 [default = UnknownDocumentAccessLevel];
  //       required bool CanSignDocuments = 4;
  //       required bool CanManageCounteragents = 6;
  //       required bool CanAddResolutions = 7;
  //       required bool CanRequestResolutions = 8;
  //       repeated string SelectedDepartmentIds = 9;
  //       optional string JobTitle = 10;
  //       required bool CanCreateDocuments = 11;
  // }
  TOrganizationUserPermissions = class(TSerializationObject)
  private
    FCanAddResolutions: Boolean;
    FCanCreateDocuments: boolean;
    FCanManageCounteragents: Boolean;
    FCanRequestResolutions: Boolean;
    FCanSignDocuments: Boolean;
    FDocumentAccessLevel: TDocumentAccessLevel;
    FIsAdministrator: Boolean;
    FJobTitle: string;
    FSelectedDepartmentIds: TDocumentStrings;
    FUserDepartmentId: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property UserDepartmentId:string read FUserDepartmentId write FUserDepartmentId;//1;
    property IsAdministrator:Boolean read FIsAdministrator write FIsAdministrator;//2;
    property DocumentAccessLevel:TDocumentAccessLevel read FDocumentAccessLevel write FDocumentAccessLevel; //3
    property CanSignDocuments:Boolean read FCanSignDocuments write FCanSignDocuments;//4;
    property CanManageCounteragents:Boolean read FCanManageCounteragents write FCanManageCounteragents;//6;
    property CanAddResolutions:Boolean read FCanAddResolutions write FCanAddResolutions;//7;
    property CanRequestResolutions:Boolean read FCanRequestResolutions write FCanRequestResolutions;//8;
    property SelectedDepartmentIds:TDocumentStrings read FSelectedDepartmentIds;//9;
    property JobTitle:string read FJobTitle write FJobTitle; //10;
    property CanCreateDocuments:boolean read FCanCreateDocuments write FCanCreateDocuments; //11;
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

{ TOrganizationUserPermissions }

procedure TOrganizationUserPermissions.InternalInit;
begin
  inherited InternalInit;
  FSelectedDepartmentIds:=TDocumentStrings.Create;
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
  RegisterProp('CanCreateDocuments', 11);
end;

destructor TOrganizationUserPermissions.Destroy;
begin
  FreeAndNil(FSelectedDepartmentIds);
  inherited Destroy;
end;

end.

