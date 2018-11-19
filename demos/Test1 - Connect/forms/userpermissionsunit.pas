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

