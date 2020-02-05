{ Комплексный пример работы с ДИАДОК

  Copyright (C) 2018-2020 Lagunov Aleksey alexs75@yandex.ru

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

unit SelectDepartmentUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, DB, DiadocTypes_Organization,
  rxdbgrid, rxmemds;

type

  { TSelectDepartmentForm }

  TSelectDepartmentForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    dsDepsList: TDataSource;
    RxDBGrid1: TRxDBGrid;
    rxDepsList: TRxMemoryData;
    rxDepsListDepartmentID: TStringField;
    rxDepsListDepartmentName: TStringField;
  private

  public
    procedure FillDepsList(O: TOrganization);
    function SelectedDepartment:string;
  end;

var
  SelectDepartmentForm: TSelectDepartmentForm;

implementation

{$R *.lfm}

{ TSelectDepartmentForm }

procedure TSelectDepartmentForm.FillDepsList(O: TOrganization);
var
  D:TDepartment;
begin
  rxDepsList.Open;
  rxDepsList.AppendRecord(['00000000-0000-0000-0000-000000000000', 'Головное подразделение']);

  if not Assigned(O) then Exit;
  for D in O.Departments do
    rxDepsList.AppendRecord([D.DepartmentId, D.Name]);
  rxDepsList.First;
end;

function TSelectDepartmentForm.SelectedDepartment: string;
begin
  Result:=rxDepsListDepartmentID.AsString;
end;

end.

