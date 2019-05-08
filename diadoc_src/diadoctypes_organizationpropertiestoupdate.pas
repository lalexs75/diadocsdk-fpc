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

unit DiadocTypes_OrganizationPropertiesToUpdate;

{$I diadoc_define.inc}

interface

//import "Address.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_Address;

type

  {  TStringValue  }
  //message StringValue {
  //        optional string Value = 1;
  //}
  TStringValue = class(TSerializationObject)
  private
    FValue: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Value:string read FValue write FValue;//1;
  end;

  {  THeadOrganizationPropertiesToUpdate  }
  //message HeadOrganizationPropertiesToUpdate {
  //      optional StringValue Kpp = 1;
  //      optional StringValue FullName = 2;
  //      optional Address Address = 3;
  //}
  THeadOrganizationPropertiesToUpdate = class(TSerializationObject)
  private
    FAddress: TAddress;
    FFullName: TStringValue;
    FKpp: TStringValue;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Kpp:TStringValue read FKpp write FKpp;//1;
    property FullName:TStringValue read FFullName write FFullName;//2;
    property Address:TAddress read FAddress;//3;
  end;


  {  TOrganizationPropertiesToUpdate  }
  //message OrganizationPropertiesToUpdate {
  //      required string OrgId = 1;
  //      optional StringValue Ogrn = 2;
  //      optional StringValue IfnsCode = 3;
  //      optional Address Address = 4;
  //      optional HeadOrganizationPropertiesToUpdate HeadOrganizationProperties = 5;
  //}
  TOrganizationPropertiesToUpdate = class(TSerializationObject)
  private
    FAddress: TAddress;
    FHeadOrganizationProperties: THeadOrganizationPropertiesToUpdate;
    FIfnsCode: TStringValue;
    FOgrn: TStringValue;
    FOrgId: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property OrgId:string read FOrgId write FOrgId;//1;
    property Ogrn:TStringValue read FOgrn write FOgrn;//2;
    property IfnsCode:TStringValue read FIfnsCode write FIfnsCode;//3;
    property Address:TAddress read FAddress;//4;
    property HeadOrganizationProperties:THeadOrganizationPropertiesToUpdate read FHeadOrganizationProperties;//5;
  end;
implementation

{ THeadOrganizationPropertiesToUpdate }

procedure THeadOrganizationPropertiesToUpdate.InternalInit;
begin
  inherited InternalInit;
  FKpp:=TStringValue.Create;
  FFullName:=TStringValue.Create;
  FAddress:=TAddress.Create;
end;

procedure THeadOrganizationPropertiesToUpdate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Kpp', 1);
  RegisterProp('FullName', 2);
  RegisterProp('Address', 3);
end;

destructor THeadOrganizationPropertiesToUpdate.Destroy;
begin
  FreeAndNil(FKpp);
  FreeAndNil(FFullName);
  FreeAndNil(FAddress);
  inherited Destroy;
end;

{ TOrganizationPropertiesToUpdate }

procedure TOrganizationPropertiesToUpdate.InternalInit;
begin
  inherited InternalInit;
  FOgrn:=TStringValue.Create;
  FIfnsCode:=TStringValue.Create;
  FAddress:=TAddress.Create;
  FHeadOrganizationProperties:=THeadOrganizationPropertiesToUpdate.Create;
end;

procedure TOrganizationPropertiesToUpdate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('OrgId', 1, true);
  RegisterProp('Ogrn', 2);
  RegisterProp('IfnsCode', 3);
  RegisterProp('Address', 4);
  RegisterProp('HeadOrganizationProperties', 5);
end;

destructor TOrganizationPropertiesToUpdate.Destroy;
begin
  FreeAndNil(FOgrn);
  FreeAndNil(FIfnsCode);
  FreeAndNil(FAddress);
  FreeAndNil(FHeadOrganizationProperties);
  inherited Destroy;
end;

{ TStringValue }

procedure TStringValue.InternalInit;
begin
  inherited InternalInit;
end;

procedure TStringValue.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Value', 1);
end;

destructor TStringValue.Destroy;
begin
  inherited Destroy;
end;

end.

