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

unit DiadocTypes_Address;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc;

type
  { TForeignAddress }
  //message ForeignAddress {
  //	required string Country = 1;	// страна (код)
  //	required string Address = 2;	// текст адреса
  TForeignAddress = class(TSerializationObject) //message ForeignAddress
  private
    FAddress: string;
    FCountry: string;
    procedure SetAddress(AValue: string);
    procedure SetCountry(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
  published
    property Country:string read FCountry write SetCountry;   //1 - страна (код)
    property Address:string read FAddress write SetAddress;   //2 - текст адреса
  end;

  { TRussianAddress }
  //message RussianAddress {
  //	optional string ZipCode = 1;	// индекс
  //	required string Region = 2;		// регион (код)
  //	optional string Territory = 3;	// район
  //	optional string City = 4;		// город
  //	optional string Locality = 5;	// населенный пункт
  //	optional string Street = 6;		// улица
  //	optional string Building = 7;	// дом
  //	optional string Block = 8;		// корпус
  //	optional string Apartment = 9;	// квартира
  //}
  TRussianAddress = class(TSerializationObject)
  private
    FApartment: string;
    FBlock: string;
    FBuilding: string;
    FCity: string;
    FLocality: string;
    FRegion: string;
    FStreet: string;
    FTerritory: string;
    FZipCode: string;
    procedure SetApartment(AValue: string);
    procedure SetBlock(AValue: string);
    procedure SetBuilding(AValue: string);
    procedure SetCity(AValue: string);
    procedure SetLocality(AValue: string);
    procedure SetRegion(AValue: string);
    procedure SetStreet(AValue: string);
    procedure SetTerritory(AValue: string);
    procedure SetZipCode(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
  public
    function AdressStr:string;
  published
    property ZipCode:string read FZipCode write SetZipCode;       // = 1; // индекс
    property Region:string read FRegion write SetRegion;          // = 2; // регион (код)
    property Territory:string read FTerritory write SetTerritory; // = 3; // район
    property City:string read FCity write SetCity;                // = 4; // город
    property Locality:string read FLocality write SetLocality;    // = 5; // населенный пункт
    property Street:string read FStreet write SetStreet;          // = 6; // улица
    property Building:string read FBuilding write SetBuilding;    // = 7; // дом
    property Block:string read FBlock write SetBlock;             // = 8; // корпус
    property Apartment:string read FApartment write SetApartment; // = 9; // квартира
  end;

  { TAddress }
  //message Address {
  //	optional RussianAddress RussianAddress = 1;
  //	optional ForeignAddress ForeignAddress = 2;
  //	optional string AddressCode = 3;
  //}
  TAddress = class(TSerializationObject) //message Address
  private
    FAddressCode: string;
    FForeignAddress: TForeignAddress;
    FRussianAddress: TRussianAddress;
    procedure SetAddressCode(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property RussianAddress:TRussianAddress read FRussianAddress;     // 1
    property ForeignAddress:TForeignAddress read FForeignAddress;     // 2
    property AddressCode:string read FAddressCode write SetAddressCode; // 3 - Код ГАР
  end;

implementation

{ TForeignAddress }

procedure TForeignAddress.SetAddress(AValue: string);
begin
  if FAddress=AValue then Exit;
  FAddress:=AValue;
  Modified(2);
end;

procedure TForeignAddress.SetCountry(AValue: string);
begin
  if FCountry=AValue then Exit;
  FCountry:=AValue;
  Modified(1);
end;

procedure TForeignAddress.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Country', 1, true); //страна (код)
  RegisterProp('Address', 2, true); //текст адреса
end;

{ TAddress }
procedure TAddress.SetAddressCode(AValue: string);
begin
  if FAddressCode=AValue then Exit;
  FAddressCode:=AValue;
  Modified(3);
end;

procedure TAddress.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RussianAddress', 1);
  RegisterProp('ForeignAddress', 2);
  RegisterProp('AddressCode', 3); // 3 - Код ГАР
end;

procedure TAddress.InternalInit;
begin
  FForeignAddress:=TForeignAddress.Create;
  FRussianAddress:=TRussianAddress.Create;
end;

destructor TAddress.Destroy;
begin
  if Assigned(FRussianAddress) then
    FreeAndNil(FRussianAddress);

  if Assigned(FForeignAddress) then
    FreeAndNil(FForeignAddress);

  inherited Destroy;
end;

{ TRussianAddress }

procedure TRussianAddress.SetApartment(AValue: string);
begin
  if FApartment=AValue then Exit;
  FApartment:=AValue;
  Modified(9);
end;

procedure TRussianAddress.SetBlock(AValue: string);
begin
  if FBlock=AValue then Exit;
  FBlock:=AValue;
  Modified(8);
end;

procedure TRussianAddress.SetBuilding(AValue: string);
begin
  if FBuilding=AValue then Exit;
  FBuilding:=AValue;
  Modified(7);
end;

procedure TRussianAddress.SetCity(AValue: string);
begin
  if FCity=AValue then Exit;
  FCity:=AValue;
  Modified(4);
end;

procedure TRussianAddress.SetLocality(AValue: string);
begin
  if FLocality=AValue then Exit;
  FLocality:=AValue;
  Modified(5);
end;

procedure TRussianAddress.SetRegion(AValue: string);
begin
  if FRegion=AValue then Exit;
  FRegion:=AValue;
  Modified(2);
end;

procedure TRussianAddress.SetStreet(AValue: string);
begin
  if FStreet=AValue then Exit;
  FStreet:=AValue;
  Modified(6);
end;

procedure TRussianAddress.SetTerritory(AValue: string);
begin
  if FTerritory=AValue then Exit;
  FTerritory:=AValue;
  Modified(3);
end;

procedure TRussianAddress.SetZipCode(AValue: string);
begin
  if FZipCode=AValue then Exit;
  FZipCode:=AValue;
  Modified(1);
end;

procedure TRussianAddress.InternalRegisterProperty;
begin
  RegisterProp('ZipCode', 1);    // индекс
  RegisterProp('Region', 2, true);     // регион (код)
  RegisterProp('Territory', 3);  // район
  RegisterProp('City', 4);       // город
  RegisterProp('Locality', 5);   // населенный пункт
  RegisterProp('Street', 6);     // улица
  RegisterProp('Building', 7);   // дом
  RegisterProp('Block', 8);      // корпус
  RegisterProp('Apartment', 9);  // квартира
end;

function TRussianAddress.AdressStr: string;
begin
  Result:=Region + ' ' + // регион (код)
    Territory + ' ' + // район
    City + ' ' + // город
    Locality + ' ' + // населенный пункт
    Street + ' ' + // улица
    Building + ' ' + // дом
    Block + ' ' + // корпус
    Apartment; // квартира
end;

end.

