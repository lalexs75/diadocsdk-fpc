{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2021 Lagunov Aleksey alexs75@yandex.ru

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

unit CertificateInfoV2;

interface

uses Classes, SysUtils, types, protobuf_fpc;

type

  { CertificateType } 
  //enum CertificateType {
  //	Unknown = 0;
  //	Token = 1;
  //	Dss = 2;
  //	KonturCertificate = 3;
  //}
  TCertificateType = (
    Unknown = 0,
    Token = 1,
    Dss = 2,
    KonturCertificate = 3
  );
  TCertificateTypeArray = array of TCertificateType;

  TCertificateInfoV2 = class;
  TCertificateInfoV2s = specialize GSerializationObjectList<TCertificateInfoV2>;

  { CertificateInfoV2 } 
  //message CertificateInfoV2 {
  //	required string Thumbprint = 1;
  //	required CertificateType Type = 2;
  //	optional sfixed64 ValidFrom = 3;
  //	optional sfixed64 ValidTo = 4;
  //	optional sfixed64 PrivateKeyValidFrom = 5;
  //	optional sfixed64 PrivateKeyValidTo = 6;
  //	optional string OrganizationName = 7;
  //	optional string Inn = 8;
  //	optional string UserFirstName = 9;
  //	optional string UserMiddleName = 10;
  //	optional string UserLastName = 11;
  //	optional string UserShortName = 12;
  //	optional bool IsDefault = 13;
  //}
  TCertificateInfoV2 = class(TSerializationObject)
  private
    FThumbprint:String;
    FTypeField:TCertificateType;
    FValidFrom:sfixed64;
    FValidTo:sfixed64;
    FPrivateKeyValidFrom:sfixed64;
    FPrivateKeyValidTo:sfixed64;
    FOrganizationName:String;
    FInn:String;
    FUserFirstName:String;
    FUserMiddleName:String;
    FUserLastName:String;
    FUserShortName:String;
    FIsDefault:Boolean;
    procedure SetThumbprint(AValue:String);
    procedure SetTypeField(AValue:TCertificateType);
    procedure SetValidFrom(AValue:sfixed64);
    procedure SetValidTo(AValue:sfixed64);
    procedure SetPrivateKeyValidFrom(AValue:sfixed64);
    procedure SetPrivateKeyValidTo(AValue:sfixed64);
    procedure SetOrganizationName(AValue:String);
    procedure SetInn(AValue:String);
    procedure SetUserFirstName(AValue:String);
    procedure SetUserMiddleName(AValue:String);
    procedure SetUserLastName(AValue:String);
    procedure SetUserShortName(AValue:String);
    procedure SetIsDefault(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Thumbprint:String read FThumbprint write SetThumbprint;
    property TypeField:TCertificateType read FTypeField write SetTypeField;
    property ValidFrom:sfixed64 read FValidFrom write SetValidFrom;
    property ValidTo:sfixed64 read FValidTo write SetValidTo;
    property PrivateKeyValidFrom:sfixed64 read FPrivateKeyValidFrom write SetPrivateKeyValidFrom;
    property PrivateKeyValidTo:sfixed64 read FPrivateKeyValidTo write SetPrivateKeyValidTo;
    property OrganizationName:String read FOrganizationName write SetOrganizationName;
    property Inn:String read FInn write SetInn;
    property UserFirstName:String read FUserFirstName write SetUserFirstName;
    property UserMiddleName:String read FUserMiddleName write SetUserMiddleName;
    property UserLastName:String read FUserLastName write SetUserLastName;
    property UserShortName:String read FUserShortName write SetUserShortName;
    property IsDefault:Boolean read FIsDefault write SetIsDefault;
  end;

implementation

  { CertificateInfoV2 } 

procedure TCertificateInfoV2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Thumbprint', 1, true);
  RegisterProp('TypeField', 2, true);
  RegisterProp('ValidFrom', 3);
  RegisterProp('ValidTo', 4);
  RegisterProp('PrivateKeyValidFrom', 5);
  RegisterProp('PrivateKeyValidTo', 6);
  RegisterProp('OrganizationName', 7);
  RegisterProp('Inn', 8);
  RegisterProp('UserFirstName', 9);
  RegisterProp('UserMiddleName', 10);
  RegisterProp('UserLastName', 11);
  RegisterProp('UserShortName', 12);
  RegisterProp('IsDefault', 13);
end;

procedure TCertificateInfoV2.InternalInit;
begin
  inherited InternalInit;
end;

destructor TCertificateInfoV2.Destroy;
begin
  inherited Destroy;
end;

procedure TCertificateInfoV2.SetThumbprint(AValue:String);
begin
  FThumbprint:=AValue;
  Modified(1);
end;

procedure TCertificateInfoV2.SetTypeField(AValue:TCertificateType);
begin
  FTypeField:=AValue;
  Modified(2);
end;

procedure TCertificateInfoV2.SetValidFrom(AValue:sfixed64);
begin
  FValidFrom:=AValue;
  Modified(3);
end;

procedure TCertificateInfoV2.SetValidTo(AValue:sfixed64);
begin
  FValidTo:=AValue;
  Modified(4);
end;

procedure TCertificateInfoV2.SetPrivateKeyValidFrom(AValue:sfixed64);
begin
  FPrivateKeyValidFrom:=AValue;
  Modified(5);
end;

procedure TCertificateInfoV2.SetPrivateKeyValidTo(AValue:sfixed64);
begin
  FPrivateKeyValidTo:=AValue;
  Modified(6);
end;

procedure TCertificateInfoV2.SetOrganizationName(AValue:String);
begin
  FOrganizationName:=AValue;
  Modified(7);
end;

procedure TCertificateInfoV2.SetInn(AValue:String);
begin
  FInn:=AValue;
  Modified(8);
end;

procedure TCertificateInfoV2.SetUserFirstName(AValue:String);
begin
  FUserFirstName:=AValue;
  Modified(9);
end;

procedure TCertificateInfoV2.SetUserMiddleName(AValue:String);
begin
  FUserMiddleName:=AValue;
  Modified(10);
end;

procedure TCertificateInfoV2.SetUserLastName(AValue:String);
begin
  FUserLastName:=AValue;
  Modified(11);
end;

procedure TCertificateInfoV2.SetUserShortName(AValue:String);
begin
  FUserShortName:=AValue;
  Modified(12);
end;

procedure TCertificateInfoV2.SetIsDefault(AValue:Boolean);
begin
  FIsDefault:=AValue;
  Modified(13);
end;

end.
