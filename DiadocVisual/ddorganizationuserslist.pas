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


unit ddOrganizationUsersList;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, ddVisualCommon, DiadocTypes_OrganizationUser,
  Forms, Controls, Graphics, Dialogs, ButtonPanel, ComCtrls,
  ddOrganizationUsersUnit;

type

  { TddOrganizationUsersListForm }

  TddOrganizationUsersListForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    procedure FormCreate(Sender: TObject);
  public
    FOrganizationUsersFrame:TOrganizationUsersFrame;
  end;

  { TddOrganizationUsersList }

  TddOrganizationUsersList = class(TddAbstract)
  private
    FOrgId: string;
    FCurrentUserID:Integer;
    function GetCurrentUser: TOrganizationUser;
  protected
    FUsers: TOrganizationUsersList;
  public
    function Execute:boolean;
    procedure Clear; override;
    property Users: TOrganizationUsersList read FUsers;
    property CurrentUser:TOrganizationUser read GetCurrentUser;
  published
    property OrgId:string read FOrgId write FOrgId;
    property Connection;
  end;

implementation

{$R *.lfm}

{ TddOrganizationUsersList }

function TddOrganizationUsersList.GetCurrentUser: TOrganizationUser;
begin
  if (FCurrentUserID>-1) and (Assigned(FUsers)) then
    Result:=FUsers.Users[FCurrentUserID]
  else
    Result:=nil;
end;

function TddOrganizationUsersList.Execute: boolean;
var
  EditForm: TddOrganizationUsersListForm;
begin
  Clear;
  Result:=false;
  FUsers:=Connection.GetOrganizationUsers(FOrgId);
  if Assigned(FUsers) then
  begin
    EditForm:=TddOrganizationUsersListForm.Create(Application);
    EditForm.FOrganizationUsersFrame.LoadInfo(FUsers);

    if EditForm.ShowModal = mrOk then
      FCurrentUserID:=EditForm.FOrganizationUsersFrame.ListView1.ItemIndex;
    EditForm.Free;
  end;
end;

procedure TddOrganizationUsersList.Clear;
begin
  inherited Clear;
  FCurrentUserID:=-1;
  if Assigned(FUsers) then
    FreeAndNil(FUsers);
end;

{ TddOrganizationUsersListForm }

procedure TddOrganizationUsersListForm.FormCreate(Sender: TObject);
begin
  FOrganizationUsersFrame:=TOrganizationUsersFrame.Create(Self);
  FOrganizationUsersFrame.Parent:=Self;
  FOrganizationUsersFrame.Align:=alClient;
end;

end.
