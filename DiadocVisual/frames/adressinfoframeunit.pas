{ Diadoc visual forms library for FPC and Lazarus

  Copyright (C) 2018-2019 Lagunov Aleksey alexs75@yandex.ru

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


unit AdressInfoFrameUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, DiadocTypes_Address;

type

  { TAdressInfoFrame }

  TAdressInfoFrame = class(TFrame)
    edtCountry: TEdit;
    edtFKAddress: TEdit;
    edtBlock: TEdit;
    edtApartment: TEdit;
    edtStreet: TEdit;
    edtBuilding: TEdit;
    edtLocality: TEdit;
    edtCity: TEdit;
    edtTerritory: TEdit;
    edtRegion: TEdit;
    edtZipCode: TEdit;
    edtAddressCode: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
  private

  public
    procedure LoadInfo(AInfo:TAddress);
    procedure ClearInfo;
  end;

implementation

{$R *.lfm}

{ TAdressInfoFrame }

procedure TAdressInfoFrame.LoadInfo(AInfo: TAddress);
begin
  if Assigned(AInfo) then
  begin
    edtAddressCode.Text:=AInfo.AddressCode;
    edtZipCode.Text:=AInfo.RussianAddress.ZipCode;
    edtRegion.Text:=AInfo.RussianAddress.Region;
    edtCity.Text:=AInfo.RussianAddress.City;
    edtLocality.Text:=AInfo.RussianAddress.Locality;
    edtStreet.Text:=AInfo.RussianAddress.Street;
    edtBuilding.Text:=AInfo.RussianAddress.Building;
    edtTerritory.Text:=AInfo.RussianAddress.Territory;

    edtBlock.Text:=AInfo.RussianAddress.Block;
    edtApartment.Text:=AInfo.RussianAddress.Apartment;

    edtCountry.Text:=AInfo.ForeignAddress.Country;
    edtFKAddress.Text:=AInfo.ForeignAddress.Address;
  end
  else
    ClearInfo;
end;

procedure TAdressInfoFrame.ClearInfo;
begin
  edtAddressCode.Text:='';
  edtZipCode.Text:='';
  edtRegion.Text:='';
  edtCity.Text:='';
  edtLocality.Text:='';
  edtStreet.Text:='';
  edtBuilding.Text:='';

  edtBlock.Text:='';
  edtApartment.Text:='';

  edtCountry.Text:='';
  edtFKAddress.Text:='';
  edtTerritory.Text:='';
end;

end.

