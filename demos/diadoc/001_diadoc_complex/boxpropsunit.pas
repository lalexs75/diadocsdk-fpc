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

unit BoxPropsUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls,
  DiadocAPI, DiadocTypes, diadoc_consts, DocumentTypeDescriptionV2;

type

  { TBoxPropsForm }

  TBoxPropsForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    Memo1: TMemo;
  private

  public
    procedure OpenBoxProps(DiadocAPI1:TDiadocAPI; ABoxId:string);
  end;

var
  BoxPropsForm: TBoxPropsForm;

implementation
uses DocumentTypeDescription;

{$R *.lfm}

{ TBoxPropsForm }

procedure TBoxPropsForm.OpenBoxProps(DiadocAPI1: TDiadocAPI; ABoxId: string);
var
  DocTypes: TGetDocumentTypesResponseV2;
  DT:TDocumentTypeDescriptionV2;
  i: Integer;
begin
  Memo1.Lines.Clear;
  DocTypes:=DiadocAPI1.GetDocumentTypesV2(ABoxId);
  if Assigned(DocTypes) then
  begin
    for DT in DocTypes.DocumentTypes do
    begin
      Memo1.Lines.Add('-----');
      Memo1.Lines.Add('Name = ' + DT.Name);
      Memo1.Lines.Add('Title = ' + DT.Title);
      Memo1.Lines.Add('RequiresFnsRegistration = ' + BoolToStr(DT.RequiresFnsRegistration, true));
      for i:=0 to Length(DT.SupportedDocflows)-1 do
        Memo1.Lines.Add( 'SupportedDocflows[%d] = %d', [i, DT.SupportedDocflows[i]]);
      //property Functions:TDocumentFunctions read FFunctions; //9;
    end;
    DocTypes.Free;
  end;
end;

end.

