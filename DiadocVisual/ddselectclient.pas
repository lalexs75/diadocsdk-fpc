{ Diadoc visual forms library for FPC and Lazarus

  Copyright (C) 2018-2020 Lagunov Aleksey alexs75@yandex.ru

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

unit ddSelectClient;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ddVisualCommon, Forms, Controls, ButtonPanel, StdCtrls,  ExtCtrls,
  DiadocTypes_Organization, ssOrganizationInfoSympleUnit,
  ddOrganizationInfoUnit;

type
  TscfStyle = (scfDetail, scfSymply);

  { TddSelectClientForm }

  TddSelectClientForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    ListBox1: TListBox;
    Splitter1: TSplitter;
    procedure ListBox1Click(Sender: TObject);
  private
    FOrganizationInfoFrame: TOrganizationInfoFrame;
    FOrganizationInfoSymple: TOrganizationInfoSymple;
    FOrgsList: TOrganizationList;
  public
    constructor CreateSelectClientForm(AStyle:TscfStyle);
    procedure FillList(AOrgsList: TOrganizationList);
  end;

  { TDiadocSelectClient }

  TDiadocSelectClient = class(TddAbstract)
  private
    FINN: string;
    FKPP: string;
    FOrganizationList: TOrganizationList;
    FSelectedIndex: integer;
    FSelectedBox:TBox;
    FStyle: TscfStyle;
    function GetSelected: TOrganization;
    function GetSelectedBox: TBox;
  protected

  public
    constructor Create(AOwner: TComponent); override;
    function Execute:boolean;
    procedure Clear; override;

    property OrganizationList: TOrganizationList read FOrganizationList;
    property SelectedIndex:integer read FSelectedIndex;
    property Selected:TOrganization read GetSelected;
    property SelectedBox:TBox read GetSelectedBox;
  published
    property Connection;
    property Style:TscfStyle read FStyle write FStyle default scfDetail;
    property INN:string read FINN write FINN;
    property KPP:string read FKPP write FKPP;
  end;

implementation
uses ddConsts;

{$R *.lfm}

{ TddSelectClientForm }

procedure TddSelectClientForm.ListBox1Click(Sender: TObject);
var
  O: TOrganization;
begin
  if ListBox1.Items.Count = 0 then Exit;
  O:=ListBox1.Items.Objects[ListBox1.ItemIndex] as TOrganization;

  if Assigned(FOrganizationInfoSymple) then
    FOrganizationInfoSymple.LoadInfo(O);
  if Assigned(FOrganizationInfoFrame) then
    FOrganizationInfoFrame.LoadInfo(O);
end;

constructor TddSelectClientForm.CreateSelectClientForm(AStyle: TscfStyle);
begin
  inherited Create(Application);
  if AStyle = scfDetail then
  begin
    FOrganizationInfoFrame:=TOrganizationInfoFrame.Create(Self);
    FOrganizationInfoFrame.Parent:=Self;
    FOrganizationInfoFrame.Align:=alClient;
  end
  else
  begin
    FOrganizationInfoSymple:=TOrganizationInfoSymple.Create(Self);
    FOrganizationInfoSymple.Parent:=Self;
    FOrganizationInfoSymple.Align:=alClient;
  end;
end;

procedure TddSelectClientForm.FillList(AOrgsList: TOrganizationList);
var
  O:TOrganization;
begin
  FOrgsList:=AOrgsList;
  ListBox1.Items.BeginUpdate;
  ListBox1.Items.Clear;
  if Assigned(FOrgsList) then
  begin
    for O in FOrgsList.Organizations do
      ListBox1.Items.AddObject(O.FullName, O);
  end;
  ListBox1.Items.EndUpdate;
  if ListBox1.Items.Count>0 then
  begin
    ListBox1.ItemIndex:=0;
    ListBox1Click(nil);
  end
  else
  begin
    if Assigned(FOrganizationInfoSymple) then
      FOrganizationInfoSymple.ClearInfo;
    if Assigned(FOrganizationInfoFrame) then
      FOrganizationInfoFrame.ClearInfo;
  end;
end;

{ TDiadocSelectClient }

function TDiadocSelectClient.GetSelected: TOrganization;
begin
  if (FSelectedIndex > -1) and Assigned(FOrganizationList) then
    Result:=FOrganizationList.Organizations[FSelectedIndex]
  else
    Result:=nil;
end;

function TDiadocSelectClient.GetSelectedBox: TBox;
begin
  if FSelectedIndex > -1 then
    Result:=FSelectedBox
  else
    Result:=nil;
end;

constructor TDiadocSelectClient.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Caption:=sSelectClientCaption;
  FStyle:=scfDetail;
end;

function TDiadocSelectClient.Execute: boolean;
var
  FEditForm: TddSelectClientForm;
begin
  Result:=false;
  Clear;
  if not Assigned(Connection) then Exit;
  FEditForm:=TddSelectClientForm.CreateSelectClientForm(FStyle);
  FEditForm.Caption:=Caption;
  FOrganizationList:=Connection.GetOrganizationsByInnKpp(Inn, Kpp, false);
  FEditForm.FillList(FOrganizationList);

  if FEditForm.ShowModal = mrOk then
  begin
    FSelectedIndex:=FEditForm.ListBox1.ItemIndex;
    if (FSelectedIndex>-1) and Assigned(FEditForm.FOrganizationInfoFrame) and Assigned(FEditForm.FOrganizationInfoFrame.BoxInfo) then
    begin
      if (FEditForm.FOrganizationInfoFrame.ListBox1.ItemIndex>-1) and (FEditForm.FOrganizationInfoFrame.ListBox1.ItemIndex < FEditForm.FOrganizationInfoFrame.ListBox1.Items.Count) then
        FSelectedBox:=TBox(FEditForm.FOrganizationInfoFrame.ListBox1.Items.Objects[FEditForm.FOrganizationInfoFrame.ListBox1.ItemIndex]);
    end;
    Result:=true;
  end;
  FEditForm.Free;
end;

procedure TDiadocSelectClient.Clear;
begin
  inherited Clear;
  if Assigned(FOrganizationList) then
    FreeAndNil(FOrganizationList);
  FSelectedIndex:=-1;
  FSelectedBox:=nil;
end;

end.
