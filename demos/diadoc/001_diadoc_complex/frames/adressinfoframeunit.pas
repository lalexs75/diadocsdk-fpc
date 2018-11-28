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

