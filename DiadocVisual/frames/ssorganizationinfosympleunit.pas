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

unit ssOrganizationInfoSympleUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, DiadocTypes_Organization, AdressInfoFrameUnit;

type

  { TOrganizationInfoSymple }

  TOrganizationInfoSymple = class(TFrame)
    AdressInfoFrame1: TAdressInfoFrame;
    cbIsForeign: TCheckBox;
    edtLiquidationDate: TEdit;
    edtOgrn: TEdit;
    edtOrgFullName: TEdit;
    edtOrgINN: TEdit;
    edtOrgKPP: TEdit;
    edtShortName: TEdit;
    Label1: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
  private
    //FAddress: TAdressInfoFrame;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadInfo(AOrganization: TOrganization);
    procedure ClearInfo;

    property Address: TAdressInfoFrame read AdressInfoFrame1;
  end;

implementation

{$R *.lfm}

{ TOrganizationInfoSymple }

constructor TOrganizationInfoSymple.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
(*  FAddress:=TAdressInfoFrame.Create(Self);
  FAddress.Parent:=Self;

  FAddress.AnchorSideBottom.Control:=Self;
  FAddress.AnchorSideBottom.Side:=asrBottom;

  FAddress.AnchorSideLeft.Control:=Self;
  FAddress.AnchorSideLeft.Side:=asrLeft;

  FAddress.AnchorSideRight.Control:=Self;
  FAddress.AnchorSideRight.Side:=asrRight;

  FAddress.AnchorSideTop.Control:=Label1;
  FAddress.AnchorSideTop.Side:=asrBottom;
*)
end;

destructor TOrganizationInfoSymple.Destroy;
begin
  inherited Destroy;
end;

procedure TOrganizationInfoSymple.LoadInfo(AOrganization: TOrganization);
begin
  if Assigned(AOrganization) then
  begin
    edtOrgINN.Text:=AOrganization.Inn;
    edtOrgKPP.Text:=AOrganization.Kpp;
    edtOrgFullName.Text:=AOrganization.FullName;
    edtShortName.Text:=AOrganization.ShortName;
    edtOgrn.Text:=AOrganization.Ogrn;
    cbIsForeign.Checked:=AOrganization.IsForeign;
    edtLiquidationDate.Text:=AOrganization.LiquidationDate;
    //FAddress.LoadInfo(AOrganization.Address);
    AdressInfoFrame1.LoadInfo(AOrganization.Address);
  end
  else
    ClearInfo;
end;

procedure TOrganizationInfoSymple.ClearInfo;
begin
  edtOrgINN.Text:='';
  edtOrgKPP.Text:='';
  edtOrgFullName.Text:='';
  edtShortName.Text:='';
  edtOgrn.Text:='';
  //FAddress.ClearInfo;
  AdressInfoFrame1.ClearInfo;
  edtLiquidationDate.Text:='';
end;

end.

