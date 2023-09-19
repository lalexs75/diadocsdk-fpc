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

unit UserPermissionsUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ButtonPanel,
  DiadocTypes_OrganizationUserPermissions;

type

  { TUserPermissionsForm }

  TUserPermissionsForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
  private

  public
    procedure LoadInfo(AInfo:TOrganizationUserPermissions);
  end;

var
  UserPermissionsForm: TUserPermissionsForm;

implementation

{$R *.lfm}

{ TUserPermissionsForm }

procedure TUserPermissionsForm.LoadInfo(AInfo: TOrganizationUserPermissions);
begin
  if not Assigned(AInfo) then Exit;

  Edit1.Text:=AInfo.UserDepartmentId;
  CheckBox1.Checked:=AInfo.IsAdministrator;
  Edit2.Text:=DocumentAccessLevelToStr(AInfo.DocumentAccessLevel);
  CheckBox2.Checked:=AInfo.CanSignDocuments;
  CheckBox3.Checked:=AInfo.CanAddResolutions;
  CheckBox4.Checked:=AInfo.CanRequestResolutions;
  Memo1.Lines.Assign(AInfo.SelectedDepartmentIds.Items);
  Edit3.Text:=AInfo.JobTitle;
end;

end.

