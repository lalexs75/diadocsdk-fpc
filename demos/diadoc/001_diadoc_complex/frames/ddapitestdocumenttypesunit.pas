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


unit ddapitestDocumentTypesUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, DB, DiadocAPI,
  DiadocTypes_Organization, rxmemds, RxDBGrid, DocumentTypeDescriptionV2;

type

  { TddapitestDocumentTypesFrame }

  TddapitestDocumentTypesFrame = class(TFrame)
    Button1: TButton;
    dsDocTypes: TDataSource;
    RxDBGrid1: TRxDBGrid;
    rxDocTypes: TRxMemoryData;
    rxDocTypesDocTypeName: TStringField;
    rxDocTypesDocTypeRequiresFnsRegistration: TBooleanField;
    rxDocTypesDocTypeTitle: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    FBox: TBox;
    FOrgs:TOrganization;
    FDiadocAPI: TDiadocAPI;
  public
    procedure UpdateCtrlStates;
    procedure InitFrame(ADiadocAPI: TDiadocAPI; ABox:TBox; AOrgs:TOrganization);
    property Box: TBox read FBox;
  end;

implementation

{$R *.lfm}

{ TddapitestDocumentTypesFrame }

procedure TddapitestDocumentTypesFrame.Button1Click(Sender: TObject);
var
  DTL: TGetDocumentTypesResponseV2;
  D: TDocumentTypeDescriptionV2;
begin
  rxDocTypes.CloseOpen;
  DTL:=FDiadocAPI.GetDocumentTypesV2(FBox.BoxId);
  if Assigned(DTL) then
  begin
    for D in DTL.DocumentTypes do
    begin
      rxDocTypes.Append;
      rxDocTypesDocTypeRequiresFnsRegistration.AsBoolean:=D.RequiresFnsRegistration;
      rxDocTypesDocTypeName.AsString:=D.Name;
      rxDocTypesDocTypeTitle.AsString:=D.Title;
      //property SupportedDocflows:TIntegerDynArray read FSupportedDocflows write SetSupportedDocflows;
      //property Functions:TDocumentFunctionV2s read FFunctions;
      rxDocTypes.Post;
    end;
    FreeAndNil(DTL);
  end;
end;

procedure TddapitestDocumentTypesFrame.UpdateCtrlStates;
begin

end;

procedure TddapitestDocumentTypesFrame.InitFrame(ADiadocAPI: TDiadocAPI;
  ABox: TBox; AOrgs: TOrganization);
begin
  FBox:=ABox;
  FOrgs:=AOrgs;
  FDiadocAPI:=ADiadocAPI;
//  InitFiltres;
  UpdateCtrlStates;
end;

end.

