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

unit DiadocTypes_CertificateInfo;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc, protobuf_fpc_types;
type
  {  TCertificateInfo  }
  //message CertificateInfo {
	 // optional string Thumbprint = 1;
	 // optional sfixed64 ValidFrom = 2;
	 // optional sfixed64 ValidTo = 3;
	 // optional string OrganizationName = 4;
	 // optional string Inn = 5;
  //}
  TCertificateInfo = class(TSerializationObject) //message CertificateInfo
  private
    FInn: string;
    FOrganizationName: string;
    FThumbprint: string;
    FValidFrom: sfixed64;
    FValidTo: sfixed64;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Thumbprint:string read FThumbprint write FThumbprint;//1;
    property ValidFrom:sfixed64 read FValidFrom write FValidFrom;//2;
    property ValidTo:sfixed64 read FValidTo write FValidTo;//3;
    property OrganizationName:string read FOrganizationName write FOrganizationName;//4;
    property Inn:string read FInn write FInn;//5;
  end;
  TCertificateInfos = specialize GSerializationObjectList<TCertificateInfo>;

implementation

{ TCertificateInfo }

procedure TCertificateInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Thumbprint', 1);
  RegisterProp('ValidFrom', 2);
  RegisterProp('ValidTo', 3);
  RegisterProp('OrganizationName', 4);
  RegisterProp('Inn', 5);
end;

procedure TCertificateInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TCertificateInfo.Destroy;
begin
  inherited Destroy;
end;

end.

