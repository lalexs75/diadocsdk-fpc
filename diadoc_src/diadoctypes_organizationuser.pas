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

unit DiadocTypes_OrganizationUser;

{$I diadoc_define.inc}

interface

//import "OrganizationUserPermissions.proto";

uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_OrganizationUserPermissions;

type
  {  TOrganizationUser  }
  //message OrganizationUser {
  //    required string Id = 1;
  //    required string Name = 2; // ФИО сотрудника
  //    required OrganizationUserPermissions Permissions = 3;
  //    required string Position = 4;
  //}
  TOrganizationUser = class(TSerializationObject)
  private
    FId: string;
    FName: string;
    FPermissions: TOrganizationUserPermissions;
    FPosition: string;
    procedure SetId(AValue: string);
    procedure SetName(AValue: string);
    procedure SetPosition(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Id:string read FId write SetId;//1;
    property Name:string read FName write SetName;//2;
    property Permissions:TOrganizationUserPermissions read FPermissions; //3;
    property Position:string read FPosition write SetPosition; //4;
  end;
  TOrganizationUsers = specialize GSerializationObjectList<TOrganizationUser>;

  {  TOrganizationUsersList  }
  //message OrganizationUsersList {
  //        repeated OrganizationUser Users = 1;
  //        required string CurrentUserId = 2;
  //}
  TOrganizationUsersList = class(TSerializationObject)
  private
    FCurrentUserId: string;
    FUsers: TOrganizationUsers;
    procedure SetCurrentUserId(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Users:TOrganizationUsers read FUsers; //1;
    property CurrentUserId:string read FCurrentUserId write SetCurrentUserId; //2;
  end;

implementation

{ TDocumentZipGenerationResult }

procedure TOrganizationUsersList.SetCurrentUserId(AValue: string);
begin
  if FCurrentUserId=AValue then Exit;
  FCurrentUserId:=AValue;
  Modified(2);
end;

procedure TOrganizationUsersList.InternalInit;
begin
  inherited InternalInit;
  FUsers:=TOrganizationUsers.Create;
end;

procedure TOrganizationUsersList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Users', 1);
  RegisterProp('CurrentUserId', 2, true);
end;

destructor TOrganizationUsersList.Destroy;
begin
  FreeAndNil(FUsers);
  inherited Destroy;
end;

{ TOrganizationUser }

procedure TOrganizationUser.SetId(AValue: string);
begin
  if FId=AValue then Exit;
  FId:=AValue;
  Modified(1);
end;

procedure TOrganizationUser.SetName(AValue: string);
begin
  if FName=AValue then Exit;
  FName:=AValue;
  Modified(2);
end;

procedure TOrganizationUser.SetPosition(AValue: string);
begin
  if FPosition=AValue then Exit;
  FPosition:=AValue;
  Modified(4);
end;

procedure TOrganizationUser.InternalInit;
begin
  inherited InternalInit;
  FPermissions:=TOrganizationUserPermissions.Create;
end;

procedure TOrganizationUser.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Id', 1, true);
  RegisterProp('Name', 2, true);
  RegisterProp('Permissions', 3, true);
  RegisterProp('Position', 4, true);
end;

destructor TOrganizationUser.Destroy;
begin
  FreeAndNil(FPermissions);
  inherited Destroy;
end;

end.

