unit ddOrganizationEmployeesUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, DiadocTypes_Employee;

type

  { TOrganizationEmployeesFrame }

  TOrganizationEmployeesFrame = class(TFrame)
    ListView1: TListView;
  private
  private
    FCurrentUserId: String;
  public
    procedure LoadInfoEmp(AInfo:TEmployeeList);
    property CurrentUserId: String read FCurrentUserId;
  end;

implementation

{$R *.lfm}

{ TOrganizationEmployeesFrame }

procedure TOrganizationEmployeesFrame.LoadInfoEmp(AInfo: TEmployeeList);
var
  E:TEmployee;
begin
  if not Assigned(AInfo) then Exit;
//  FCurrentUserId:=AInfo.CurrentUserId;
(*  rxUserList.Open;
  for E in AInfo.Employees do
  begin
    rxUserList.Append;
    rxUserListNAME.AsString:=E.User.FullName.FirstName + ' ' + E.User.FullName.MiddleName + E.User.FullName.LastName;
    rxUserListId.AsString:=E.User.Login;
    rxUserListPosition.AsString:=E.Position;
    //property Permissions:TOrganizationUserPermissions read FPermissions; //3;
    rxUserList.Post;
  end;
  rxUserList.First; *)
end;

end.

