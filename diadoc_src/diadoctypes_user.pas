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

unit DiadocTypes_User;

{$I diadoc_define.inc}

interface

//import "CertificateInfo.proto";
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_CertificateInfo;

type


  {  TUser  }
  //message User {
	 // optional string Id = 1;
	 // optional string LastName = 2;
	 // optional string FirstName = 3;
	 // optional string MiddleName = 4;
	 // repeated CertificateInfo CloudCertificates = 5;
  //}
  TUser = class(TSerializationObject) //message User
  private
    FCloudCertificates: TCertificateInfos;
    FFirstName: string;
    FId: string;
    FLastName: string;
    FMiddleName: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Id:string read FId write FId; //1;
    property LastName:string read FLastName write FLastName; //2;
    property FirstName:string read FFirstName write FFirstName; //3;
    property MiddleName:string read FMiddleName write FMiddleName; //4;
    property CloudCertificates:TCertificateInfos read FCloudCertificates; //5;
  end;

  //message FullName {
  //	required string LastName = 1;
  //	required string FirstName = 2;
  //	optional string MiddleName = 3;
  //}

  { TFullName }

  TFullName = class(TSerializationObject) //message FullName
  private
    FFirstName: string;
    FLastName: string;
    FMiddleName: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property LastName:string read FLastName write FLastName;//1;
    property FirstName:string read FFirstName write FFirstName;//2;
    property MiddleName:string read FMiddleName write FMiddleName;//3;
  end;

  //message UserV2 {
  //	required string UserId = 1;
  //	optional string Login = 2;
  //	optional FullName FullName = 3;
  //	required bool IsRegistered = 4;
  //}

  { TUserV2 }

  TUserV2 = class(TSerializationObject) //message UserV2
  private
    FFullName: TFullName;
    FIsRegistered: Boolean;
    FLogin: string;
    FUserId: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property UserId:string read FUserId write FUserId;//1;
    property Login:string read FLogin write FLogin;//2;
    property FullName:TFullName read FFullName;//3;
    property IsRegistered:Boolean read FIsRegistered write FIsRegistered;//4;
  end;

implementation

{ TUserV2 }

procedure TUserV2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('UserId', 1);
  RegisterProp('Login', 2);
  RegisterProp('FullName', 3);
  RegisterProp('IsRegistered', 4);
end;

procedure TUserV2.InternalInit;
begin
  inherited InternalInit;
  FFullName:=TFullName.Create;
end;

destructor TUserV2.Destroy;
begin
  FreeAndNil(FFullName);
  inherited Destroy;
end;

{ TFullName }

procedure TFullName.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('LastName', 1);
  RegisterProp('FirstName', 2);
  RegisterProp('MiddleName', 3);
end;

procedure TFullName.InternalInit;
begin
  inherited InternalInit;
end;

destructor TFullName.Destroy;
begin
  inherited Destroy;
end;

{ TUser }

procedure TUser.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Id', 1);
  RegisterProp('LastName', 2);
  RegisterProp('FirstName', 3);
  RegisterProp('MiddleName', 4);
  RegisterProp('CloudCertificate', 5);
end;

procedure TUser.InternalInit;
begin
  inherited InternalInit;
  FCloudCertificates:=TCertificateInfos.Create;
end;

destructor TUser.Destroy;
begin
  FreeAndNil(FCloudCertificates);
  inherited Destroy;
end;

end.

