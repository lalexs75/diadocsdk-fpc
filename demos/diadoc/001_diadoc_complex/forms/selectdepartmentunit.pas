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

