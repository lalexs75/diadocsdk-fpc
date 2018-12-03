unit EmployeeUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls,
  DiadocTypes_UniversalTransferDocumentInfo;

type

  { TEmployeeFrame }

  TEmployeeFrame = class(TFrame)
    edtEmployeePosition: TEdit;
    edtEmployeeInfo: TEdit;
    edtEmployeeBase: TEdit;
    edtTransferSurname: TEdit;
    edtTransferFirstName: TEdit;
    edtTransferPatronymic: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
  private
    FEmployee: TEmployee;
    procedure SetEmployee(AValue: TEmployee);

  public
    procedure Clear;
    property Employee:TEmployee read FEmployee write SetEmployee;
  end;

implementation

{$R *.lfm}

{ TEmployeeFrame }

procedure TEmployeeFrame.SetEmployee(AValue: TEmployee);
begin
  if FEmployee=AValue then Exit;
  FEmployee:=AValue;
  if Assigned(FEmployee) then
  begin
    edtEmployeePosition.Text:=FEmployee.EmployeePosition;
    edtEmployeeInfo.Text:=FEmployee.EmployeeInfo;
    edtEmployeeBase.Text:=FEmployee.EmployeeBase;
    edtTransferSurname.Text:=FEmployee.TransferSurname;
    edtTransferFirstName.Text:=FEmployee.TransferFirstName;
    edtTransferPatronymic.Text:=FEmployee.TransferPatronymic;
  end
  else
    Clear;
end;

procedure TEmployeeFrame.Clear;
begin
  edtEmployeePosition.Text:='';
  edtEmployeeInfo.Text:='';
  edtEmployeeBase.Text:='';
  edtTransferSurname.Text:='';
  edtTransferFirstName.Text:='';
  edtTransferPatronymic.Text:='';
end;

end.

