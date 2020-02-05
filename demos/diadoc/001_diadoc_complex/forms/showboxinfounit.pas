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

unit ShowBoxInfoUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, DiadocAPI,
  DiadocTypes_Organization, BoxInfoUnit;

type

  { TShowBoxInfoForm }

  TShowBoxInfoForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    procedure FormCreate(Sender: TObject);
  private
    FBoxInfo:TBoxInfoFrame;
  public

  end;


procedure ShowBoxInfo(ABoxID:string; ADiadocAPI: TDiadocAPI);
implementation

procedure ShowBoxInfo(ABoxID: string; ADiadocAPI: TDiadocAPI);
var
  ShowBoxInfoForm: TShowBoxInfoForm;
  FBox: TBox;
begin
  FBox:=ADiadocAPI.GetBox(ABoxID);
  if Assigned(FBox) then
  begin
    ShowBoxInfoForm:=TShowBoxInfoForm.Create(Application);
    ShowBoxInfoForm.FBoxInfo.LoadInfo(FBox);
    ShowBoxInfoForm.ShowModal;
    ShowBoxInfoForm.Free;
    FBox.Free;
  end;
end;

{$R *.lfm}

{ TShowBoxInfoForm }

procedure TShowBoxInfoForm.FormCreate(Sender: TObject);
begin
  FBoxInfo:=TBoxInfoFrame.Create(Self);
  FBoxInfo.Parent:=Self;
  FBoxInfo.Align:=alClient;
end;

end.

