unit OrganizationInfoFormUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  OrganizationInfoUnit, DiadocTypes_Organization;

type

  { TOrganizationInfoForm }

  TOrganizationInfoForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    procedure FormCreate(Sender: TObject);
  private
    FOrgFrame:TOrganizationInfoFrame;
  public
    procedure OpenInfo(AOrganization: TOrganization);
  end;

var
  OrganizationInfoForm: TOrganizationInfoForm;

implementation

{$R *.lfm}

{ TOrganizationInfoForm }

procedure TOrganizationInfoForm.FormCreate(Sender: TObject);
begin
  FOrgFrame:=TOrganizationInfoFrame.Create(Self);
  FOrgFrame.Parent:=Self;
  FOrgFrame.Align:=alClient;
end;

procedure TOrganizationInfoForm.OpenInfo(AOrganization: TOrganization);
begin
  FOrgFrame.LoadInfo(AOrganization);
end;

end.

