{
  Комплексный пример работы с ДИАДОК

  Copyright (C) 2018-2023 Lagunov Aleksey alexs75@yandex.ru

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

unit BoxEventListUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, DB,
  DiadocAPI, DiadocTypes_DiadocMessage_GetApi, rxdbgrid, rxmemds;

type

  { TBoxEventListForm }

  TBoxEventListForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    dsEvents: TDataSource;
    RxDBGrid1: TRxDBGrid;
    rxEvents: TRxMemoryData;
    rxEventsEventId: TStringField;
    rxEventsMessage: TStringField;
  private
    FDiadocAPI: TDiadocAPI;
    FBoxID: String;
  public
    procedure LoadEvents(ABoxID:string; ADiadocAPI: TDiadocAPI);
  end;

var
  BoxEventListForm: TBoxEventListForm;

implementation

{$R *.lfm}

{ TBoxEventListForm }

procedure TBoxEventListForm.LoadEvents(ABoxID: string; ADiadocAPI: TDiadocAPI);
var
  FEvents: TBoxEventList;
  E: TBoxEvent;
begin
  FDiadocAPI:=ADiadocAPI;
  FBoxID:=ABoxID;

  FEvents:=FDiadocAPI.GetNewEvents(FBoxID, '');
  if Assigned(FEvents) then
  begin
    rxEvents.Open;
    for E in FEvents.Events do
    begin
      rxEvents.Append;
      rxEventsEventId.AsString:=E.EventId;
      rxEventsMessage.AsString:=E.Message.ToTitle;
{      property EventId:string read FEventId write FEventId;//1;
      property Message:TMessage read FMessage;//2;
      property Patch:TMessagePatch read FPatch; //3;}

      rxEvents.Post;
    end;
    rxEvents.First;
    FEvents.Free;
  end;
end;

end.

