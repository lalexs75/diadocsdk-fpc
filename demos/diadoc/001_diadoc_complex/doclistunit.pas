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

unit DocListUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, ExtCtrls,
  StdCtrls, DB, rxdbgrid, rxmemds, rxtooledit, DiadocAPI, DiadocTypes,
  diadoc_consts, DiadocTypes_DocumentType, DiadocTypes_Document,
  DiadocTypes_DiadocMessage_GetApi, DiadocTypes_DocumentList;

type

  { TDocListForm }

  TDocListForm = class(TForm)
    Button3: TButton;
    Button4: TButton;
    ButtonPanel1: TButtonPanel;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    dDocs: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    RxDateEdit1: TRxDateEdit;
    RxDateEdit2: TRxDateEdit;
    RxDBGrid1: TRxDBGrid;
    rxDocs: TRxMemoryData;
    rxDocsCounteragentBoxId: TStringField;
    rxDocsCreationTimestampTicks: TDateTimeField;
    rxDocsDocumentDate: TDateField;
    rxDocsDocumentNumber: TStringField;
    rxDocsDocumentType: TStringField;
    rxDocsEntityId: TStringField;
    rxDocsFileName: TStringField;
    rxDocsIndexKey: TStringField;
    rxDocsMessageId: TStringField;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDiadocAPI: TDiadocAPI;
    FBoxID: String;
    FDocumentType: TDocumentTypeFilter;
    FDocumentClass: TDocumentFilterClass;
    FDocumentStatus: TDocumentFilterStatus;

    FLastIndex:string;
    FTotalCount:integer;
    procedure AppendDoc(D:TDocument);
    procedure FetchDocList;
  public
    procedure OpenDocList(ADiadocAPI: TDiadocAPI; ABoxId:string);
  end;

var
  DocListForm: TDocListForm;

implementation
uses diadoc_utils, protobuf_fpc;

{$R *.lfm}

{ TDocListForm }

procedure TDocListForm.Button3Click(Sender: TObject);
begin
  rxDocs.CloseOpen;
  FDocumentType:=TDocumentTypeFilter(ComboBox2.ItemIndex);
  FDocumentClass:=TDocumentFilterClass(ComboBox1.ItemIndex);
//  FDocumentStatus: TDocumentFilterClass}
  FLastIndex:='';
  FetchDocList;
  rxDocs.First;
end;

procedure TDocListForm.Button4Click(Sender: TObject);
begin
  FetchDocList;
end;

procedure TDocListForm.CheckBox1Change(Sender: TObject);
begin
  Label2.Enabled:=CheckBox1.Checked;
  Label3.Enabled:=CheckBox1.Checked;
  RxDateEdit1.Enabled:=CheckBox1.Checked;
  RxDateEdit2.Enabled:=CheckBox1.Checked;
end;

procedure TDocListForm.FormCreate(Sender: TObject);
var
  i: TDocumentTypeFilter;
  j: TDocumentFilterStatus;
begin
  ComboBox2.Items.Clear;
  for i:=Low(TDocumentTypeFilter) to High(TDocumentTypeFilter) do
    ComboBox2.Items.Add(DocumentTypeFilterDescription(i));
  ComboBox2.ItemIndex:=ComboBox2.Items.Count-1;

  ComboBox3.Items.Clear;
  for j:=Low(TDocumentFilterStatus) to High(TDocumentFilterStatus) do
    ComboBox3.Items.Add(DocumentFilterStatusDesc(J));
  ComboBox3.ItemIndex:=0; //ComboBox3.Items.Count-1;

  CheckBox1Change(nil);

  RxDateEdit1.Date:=Now - 10;
  RxDateEdit2.Date:=Now + 1;
end;

procedure TDocListForm.AppendDoc(D: TDocument);
begin
end;

procedure TDocListForm.FetchDocList;
var
  D: TDocument;
  Docs: TDocumentList;
  FFromDocumentDate, FToDocumentDate: String;
begin
  if CheckBox1.Checked then
  begin
    FFromDocumentDate:=DateToStr(RxDateEdit1.Date);
    FToDocumentDate:=DateToStr(RxDateEdit2.Date);
  end
  else
  begin
    FFromDocumentDate:='';
    FToDocumentDate:='';
  end;
  Docs:=FDiadocAPI.GetDocuments(FBoxId, FDocumentType, FDocumentClass, dfsAny, '', '', FFromDocumentDate, FToDocumentDate, FLastIndex);
  if Assigned(Docs) then
  begin
    if FLastIndex = '' then
    begin
      FTotalCount:=Docs.TotalCount;
      //Label1.Caption:=IntToStr(FTotalCount);
    end;
    for D in Docs.Documents do
    begin
      AppendDoc(D);
      FLastIndex:=D.IndexKey;
    end;
    Docs.Free;
  end
  else
    ShowMessageFmt('Error %d (%s)', [FDiadocAPI.ResultCode, FDiadocAPI.ResultString]);
end;

procedure TDocListForm.OpenDocList(ADiadocAPI: TDiadocAPI; ABoxId: string);
begin
  FBoxID:=ABoxId;
  FDiadocAPI:=ADiadocAPI;
end;

end.

