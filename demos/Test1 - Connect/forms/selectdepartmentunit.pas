unit SelectDepartmentUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, DB,
  rxdbgrid, rxmemds;

type

  { TSelectDepartmentForm }

  TSelectDepartmentForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    rxDepsList: TRxMemoryData;
  private

  public
    procedure FillDepsList;
  end;

var
  SelectDepartmentForm: TSelectDepartmentForm;

implementation

{$R *.lfm}

{ TSelectDepartmentForm }

procedure TSelectDepartmentForm.FillDepsList;
begin

end;

end.

