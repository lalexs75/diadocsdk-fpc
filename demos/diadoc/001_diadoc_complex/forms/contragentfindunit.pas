{
  Комплексный пример работы с ДИАДОК

  Copyright (C) 2018-2023 Lagunov Aleksey alexs75@yandex.ru

  Этот исходный код является свободно-распространяемым программынм обеспечением.
  Вы можете распространять и (или) модифицировать его при условии соблюдения
  условий лицензии GPL2, опублиованной Фондом свободного програмного обеспечения
  (FSF).

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
  MA 02111-1307, USA.
}

unit ContragentFindUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ButtonPanel, ExtCtrls, DiadocAPI, DiadocTypes_Organization, BoxInfoUnit,
  ddOrganizationInfoUnit;

type

  { TContragentFindForm }

  TContragentFindForm = class(TForm)
    Button1: TButton;
    ButtonPanel1: TButtonPanel;
    edtINN: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    Panel1: TPanel;
    Splitter1: TSplitter;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    FOrgs: TOrganizationList;
    FOrgFrame:TOrganizationInfoFrame;
    FDiadocAPI: TDiadocAPI;
    function GetCurOrg: TOrganization;
  public
    procedure InitForm(ADiadocAPI:TDiadocAPI);
    property Orgs: TOrganizationList read FOrgs;
    property CurOrg:TOrganization read GetCurOrg;
  end;

var
  ContragentFindForm: TContragentFindForm;

implementation

{$R *.lfm}

{ TContragentFindForm }

procedure TContragentFindForm.Button1Click(Sender: TObject);
var
  B: TBox;
  O: TOrganization;
begin
  if Assigned(FOrgs) then
    FreeAndNil(FOrgs);
  ListBox1.Items.Clear;

  FOrgs:=FDiadocAPI.GetOrganizationsByInnKpp(edtINN.Text);
  ListBox1.Items.Clear;
  if Assigned(FOrgs) then
  begin
    for O in FOrgs.Organizations do
      ListBox1.Items.AddObject(O.ShortName, O);

    if ListBox1.Items.Count > 0 then
      ListBox1.ItemIndex:=0;
  end;

  ListBox1Click(nil);
end;

procedure TContragentFindForm.FormCreate(Sender: TObject);
begin
  FOrgFrame:=TOrganizationInfoFrame.Create(Self);
  FOrgFrame.Parent:=Panel1;
  FOrgFrame.Align:=alClient;


end;

procedure TContragentFindForm.FormDestroy(Sender: TObject);
begin
  if Assigned(FOrgs) then
    FreeAndNil(FOrgs);
end;

procedure TContragentFindForm.ListBox1Click(Sender: TObject);
var
  O: TOrganization;
begin
  O:=nil;
  if (ListBox1.Items.Count > 0) and (ListBox1.ItemIndex>=0) and (ListBox1.Items.Count > ListBox1.ItemIndex) then
    O:=TOrganization(ListBox1.Items.Objects[ListBox1.ItemIndex]);

  FOrgFrame.LoadInfo(O);
end;

function TContragentFindForm.GetCurOrg: TOrganization;
begin
  Result:=nil;
  if (ListBox1.Items.Count > 0) and (ListBox1.ItemIndex>=0) and (ListBox1.Items.Count > ListBox1.ItemIndex) then
    Result:=TOrganization(ListBox1.Items.Objects[ListBox1.ItemIndex]);
end;

procedure TContragentFindForm.InitForm(ADiadocAPI: TDiadocAPI);
begin
  FDiadocAPI:=ADiadocAPI;
  FOrgFrame.ClearInfo;
end;

end.

