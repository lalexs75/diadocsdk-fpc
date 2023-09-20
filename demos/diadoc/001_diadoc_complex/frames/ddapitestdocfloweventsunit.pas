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


unit ddapitestDocflowEventsUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, DiadocAPI, DiadocTypes_Organization;

type

  { TddapitestDocflowEventsFrame }

  TddapitestDocflowEventsFrame = class(TFrame)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    FBox: TBox;
    FOrgs:TOrganization;
    FDiadocAPI: TDiadocAPI;
  public
    procedure UpdateCtrlStates;
    procedure InitFrame(ADiadocAPI: TDiadocAPI; ABox:TBox; AOrgs:TOrganization);
  end;

implementation
uses DiadocTypes_DocflowApi, DiadocTypes_TimeBasedFilter, rxlogging;

{$R *.lfm}

{ TddapitestDocflowEventsFrame }

procedure TddapitestDocflowEventsFrame.Button1Click(Sender: TObject);
var
  Flt: TGetDocflowEventsRequest;
  R: TGetDocflowEventsResponse;
begin
  Flt:=TGetDocflowEventsRequest.Create;
  Flt.Filter.FromTimestamp.AsDateTime:=Now - 30;
  Flt.Filter.ToTimestamp.AsDateTime:=Now + 7;
  Flt.Filter.SortDirection:=Ascending;

  R:=FDiadocAPI.GetDocflowEvents(FBox.BoxId, Flt);
  if Assigned(R) then
  begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add('TotalCount = %d', [ R.TotalCount]);
    Memo1.Lines.Add('TotalCountType = %d', [ Ord( R.TotalCountType) ]);
//    Memo1.Lines.Add('TotalCount = %d', [ R.TotalCount]);
    R.Free;
  end;
  if FDiadocAPI.ResultString <> '' then
    RxWriteLog(etDebug, FDiadocAPI.ResultString);
  Flt.Free;
end;

procedure TddapitestDocflowEventsFrame.UpdateCtrlStates;
begin

end;

procedure TddapitestDocflowEventsFrame.InitFrame(ADiadocAPI: TDiadocAPI;
  ABox: TBox; AOrgs: TOrganization);
begin
  FBox:=ABox;
  FOrgs:=AOrgs;
  FDiadocAPI:=ADiadocAPI;
//  InitFiltres;
  UpdateCtrlStates;
end;

end.

