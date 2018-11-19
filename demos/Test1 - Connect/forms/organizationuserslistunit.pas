unit OrganizationUsersListUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, DB,
  DiadocTypes_OrganizationUser, rxmemds, rxdbgrid;

type

  { TOrganizationUsersListForm }

  TOrganizationUsersListForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    dsUserList: TDataSource;
    RxDBGrid1: TRxDBGrid;
    rxUserList: TRxMemoryData;
    rxUserListID: TStringField;
    rxUserListNAME: TStringField;
    rxUserListPosition: TStringField;
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
  private
    FCurrentUserId: String;
  public
    procedure LoadInfo(AInfo:TOrganizationUsersList);
  end;

var
  OrganizationUsersListForm: TOrganizationUsersListForm;

implementation

{$R *.lfm}

{ TOrganizationUsersListForm }

procedure TOrganizationUsersListForm.RxDBGrid1GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if rxUserListID.AsString = FCurrentUserId then
    Background:=clSkyBlue;
end;

procedure TOrganizationUsersListForm.LoadInfo(AInfo: TOrganizationUsersList);
var
  U: TOrganizationUser;
begin
  if not Assigned(AInfo) then Exit;
  FCurrentUserId:=AInfo.CurrentUserId;
  rxUserList.Open;
  for U in AInfo.Users do
  begin
    rxUserList.Append;
    rxUserListNAME.AsString:=U.Name;
    rxUserListId.AsString:=U.Id;
    rxUserListPosition.AsString:=U.Position;
    //property Permissions:TOrganizationUserPermissions read FPermissions; //3;
    rxUserList.Post;
  end;
  rxUserList.First;
end;

end.

