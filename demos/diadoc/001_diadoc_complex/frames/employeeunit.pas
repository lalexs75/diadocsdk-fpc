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

