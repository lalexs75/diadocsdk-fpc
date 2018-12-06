unit OrganizationUsersListUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, DB,
  DiadocTypes_OrganizationUser, DiadocTypes_Employee,
  rxmemds, rxdbgrid;

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
    procedure LoadInfoEmp(AInfo:TEmployeeList);
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

procedure TOrganizationUsersListForm.LoadInfoEmp(AInfo: TEmployeeList);
var
  E:TEmployee;
begin
  if not Assigned(AInfo) then Exit;
//  FCurrentUserId:=AInfo.CurrentUserId;
  rxUserList.Open;
  for E in AInfo.Employees do
  begin
    rxUserList.Append;
    rxUserListNAME.AsString:=E.User.FullName.FirstName + ' ' + E.User.FullName.MiddleName + E.User.FullName.LastName;
    rxUserListId.AsString:=E.User.Login;
    rxUserListPosition.AsString:=E.Position;
    //property Permissions:TOrganizationUserPermissions read FPermissions; //3;
    rxUserList.Post;
  end;
  rxUserList.First;
end;

end.

