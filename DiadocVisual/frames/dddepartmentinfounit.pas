{ Diadoc visual forms library for FPC and Lazarus

  Copyright (C) 2018 Lagunov Aleksey alexs75@yandex.ru

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

unit ddDepartmentInfoUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, ComCtrls,
  DiadocTypes_Organization, AdressInfoFrameUnit;

type

  { TDepartmentInfoFrame }

  TDepartmentInfoFrame = class(TFrame)
    CheckBox1: TCheckBox;
    CLabel: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
  private
    FAddress: TAdressInfoFrame;
    FDepartment: TDepartment;
  public
    constructor Create(TheOwner: TComponent); override;
    procedure LoadInfo(ADepartment: TDepartment);
    procedure ClearInfo;
    property Address:TAdressInfoFrame read FAddress;
  end;

implementation

{$R *.lfm}

{ TDepartmentInfoFrame }

constructor TDepartmentInfoFrame.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  FAddress:=TAdressInfoFrame.Create(Self);
  FAddress.Parent:=TabSheet2;
  FAddress.Align:=alClient;
end;

procedure TDepartmentInfoFrame.LoadInfo(ADepartment: TDepartment);
begin
  if Assigned(ADepartment) then
  begin
    FDepartment:=ADepartment;
    Edit1.Text:=FDepartment.DepartmentId;
    Edit2.Text:=FDepartment.ParentDepartmentId;
    Edit3.Text:=FDepartment.Name;
    Edit4.Text:=FDepartment.Abbreviation;
    Edit5.Text:=FDepartment.Kpp;
    CheckBox1.Checked:=FDepartment.IsDisabled;
    FAddress.LoadInfo(ADepartment.Address)
  end
  else
    ClearInfo;
end;

procedure TDepartmentInfoFrame.ClearInfo;
begin
  FDepartment:=nil;
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit5.Text:='';
  CheckBox1.Checked:=false;
  FAddress.ClearInfo;
end;

end.

