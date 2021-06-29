unit adMainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Menus, ActnList, IniPropStorage, EditBtn, DiadocAPI,
  DiadocTypes_Organization, ddSelectClient, DocumentTypeDescriptionV2,
  httpsend, SynEdit, SynHighlighterXML, RxIniPropStorage;

type

  { TForm1 }

  TForm1 = class(TForm)
    xsdExportCurr: TAction;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    DirectoryEdit1: TDirectoryEdit;
    Label5: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    RxIniPropStorage1: TRxIniPropStorage;
    xsdExportAll: TAction;
    Button3: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    MenuItem1: TMenuItem;
    Panel2: TPanel;
    xsdOpen: TAction;
    ActionList1: TActionList;
    Button1: TButton;
    DiadocAPI1: TDiadocAPI;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CLabel: TLabel;
    Memo1: TMemo;
    PageControl1: TPageControl;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    Splitter1: TSplitter;
    SynEdit1: TSynEdit;
    SynXMLSyn1: TSynXMLSyn;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TreeView1: TTreeView;
    TreeView2: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView2Click(Sender: TObject);
    procedure xsdExportAllExecute(Sender: TObject);
    procedure xsdExportCurrExecute(Sender: TObject);
    procedure xsdOpenExecute(Sender: TObject);
  private
    FMyDT: TGetDocumentTypesResponseV2;
    FMyOrgs: TOrganizationList;
    procedure DoConnect;
    procedure FillBoxList;
    function CheckConnectionParams:Boolean;
    procedure DoExport(AFolderName:string; DTD:TDocumentTypeDescriptionV2; DF:TDocumentFunctionV2; DFV:TDocumentVersionV2; DFVT:TDocumentTitleV2);
    function NormalazeDocFunction(ADocFunction:string):string;
  public

  end;

var
  Form1: TForm1;

implementation
uses LazFileUtils, Diadoc_Base, XsdContentType, LazUTF8;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not CheckConnectionParams then Exit;
  DoConnect;
  FillBoxList;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if Assigned(FMyOrgs) then
    FreeAndNil(FMyOrgs);

  if Assigned(FMyDT) then
    FreeAndNil(FMyDT);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
  PageControl1.ActivePageIndex:=0;
end;

procedure TForm1.TreeView1Click(Sender: TObject);
var
  B: TBox;
  DTD:TDocumentTypeDescriptionV2;
  DF:TDocumentFunctionV2;
  DFV:TDocumentVersionV2;
  i: Integer;
  S: String;
  DFVT:TDocumentTitleV2;
  V, V1, V2, V3: TTreeNode;
begin
  Memo1.Lines.Clear;
  TreeView2.Items.Clear;

  if Assigned(FMyDT) then
    FreeAndNil(FMyDT);

  if Assigned(TreeView1.Selected) and Assigned(TreeView1.Selected.Data) then
  begin
    B:=TBox(TreeView1.Selected.Data);
    FMyDT:=DiadocAPI1.GetDocumentTypesV2(B.BoxId);
    if Assigned(FMyDT) then
    begin
      for DTD in FMyDT.DocumentTypes do
      begin
        V:=TreeView2.Items.Add(nil, DTD.Name +' : ' + DTD.Title );
        V.Data:=DTD;
        V.ImageIndex:=2;
        V.StateIndex:=2;
        V.SelectedIndex:=2;

        Memo1.Lines.Add('Наименование : ' + DTD.Name);
        Memo1.Lines.Add('  заголовок : '+DTD.Title);
        if DTD.RequiresFnsRegistration then
          Memo1.Lines.Add('  для работы требуется заявление участника ЭДО')
        else
          Memo1.Lines.Add('  заявление участника ЭДО для работы не требуется');

        S:='';
(*        for i:=0 to DTD.SupportedDocflows.Count-1 do
        begin
          if S<>'' then  S:=S+ ',';
          S:=S + DocumentDocflowToStr(DTD.SupportedDocflows[i]);
        end;
        Memo1.Lines.Add('  виды документооборота : '+S); *)

        Memo1.Lines.Add('  Функции :');
        for DF in DTD.Functions do
        begin
          V1:=TreeView2.Items.AddChild(V, DF.Name);
          V1.Data:=DF;
          V1.ImageIndex:=3;
          V1.StateIndex:=3;
          V1.SelectedIndex:=3;

          Memo1.Lines.Add('    - '+DF.Name);
          for DFV in DF.Versions do
          begin
            V2:=TreeView2.Items.AddChild(V1, DFV.Version);
            V2.Data:=DFV;
            V2.ImageIndex:=4;
            V2.StateIndex:=4;
            V2.SelectedIndex:=4;


            Memo1.Lines.Add('      * '+DFV.Version);
            for DFVT in DFV.Titles do
            begin
              V3:=TreeView2.Items.AddChild(V2, IntToStr(DFVT.Index) + '.' + DFVT.UserDataXsdUrl);
              V3.Data:=DFVT;
              V3.ImageIndex:=5;
              V3.StateIndex:=5;
              V3.SelectedIndex:=5;

              Memo1.Lines.Add('      ** UserDataXsdUrl : '+DFVT.UserDataXsdUrl);
              Memo1.Lines.Add('      ** XsdUrl : '+DFVT.XsdUrl);

              if (DTD.Name = 'UniversalTransferDocument') and (DFV.Version = 'utd820_05_01_01_hyphen') and (DF.Name = 'СЧФ') then
              begin
                Memo1.Lines.Add('      **** ');
              end;
            end;
            Memo1.Lines.Add('      **** ');
          end;
        end;
        Memo1.Lines.Add('');
      end;
    end
    else
      ShowMessageFmt('Не получен список форматов документов для ящика %s', [B.Title]);
  end
end;

procedure TForm1.TreeView2Click(Sender: TObject);
var
  D: TObject;
begin
  xsdOpen.Enabled:=false;
  if Assigned(TreeView2.Selected) and Assigned(TreeView2.Selected.Data) then
  begin
    D:=TObject(TreeView2.Selected.Data);
    xsdOpen.Enabled:=D is TDocumentVersionV2;
  end;
  xsdExportCurr.Enabled:=xsdOpen.Enabled;
end;

procedure TForm1.xsdExportAllExecute(Sender: TObject);
var
  DTD:TDocumentTypeDescriptionV2;
  DF:TDocumentFunctionV2;
  DFV:TDocumentVersionV2;
  DFVT:TDocumentTitleV2;
begin
  if not Assigned(FMyDT) then Exit;

  for DTD in FMyDT.DocumentTypes do
  begin
    for DF in DTD.Functions do
    begin
      for DFV in DF.Versions do
        for DFVT in DFV.Titles do
          DoExport(DirectoryEdit1.Directory, DTD, DF, DFV, DFVT);
    end;
  end;
  ShowMessage('Выгрузка успешная');
end;

procedure TForm1.xsdExportCurrExecute(Sender: TObject);
begin
//  DoExport(DirectoryEdit1.Directory, DTD, DF, DFV, DFVT);
end;

procedure TForm1.xsdOpenExecute(Sender: TObject);
var
  D: TObject;
  ST: TTreeNode;
  SVers, SFunc, STypeDesc: String;
  M: TMemoryStream;
begin
  Memo1.Lines.Clear;
  SynEdit1.Lines.Clear;
  SVers:='';
  STypeDesc:='';
  SFunc:='';
  Edit4.Text:='';
  if not (Assigned(TreeView2.Selected) and Assigned(TreeView2.Selected.Data)) then Exit;

  ST:=TreeView2.Selected;
  D:=TObject(ST.Data);
  if D is TDocumentVersionV2 then
    SVers:=TDocumentVersionV2(D).Version;

  if TObject(ST.Parent.Data) is TDocumentFunctionV2 then
    SFunc:=TDocumentFunctionV2(ST.Parent.Data).Name;

  if TObject(ST.Parent.Parent.Data) is TDocumentTypeDescriptionV2 then
    STypeDesc:=TDocumentTypeDescriptionV2(ST.Parent.Parent.Data).Name;

  if (STypeDesc<>'') and (SFunc <> '') and (SVers <> '') then
  begin
    Edit4.Text:=STypeDesc + '_' + NormalazeDocFunction(SFunc) + '_' + SVers + '.xsd';

    M:=DiadocAPI1.GetContent(STypeDesc, SFunc, SVers, 0, UserContractXsd);
    if Assigned(M) then
    begin
      M.Position:=0;
      SynEdit1.Lines.LoadFromStream(M);
      M.Free;
      PageControl1.ActivePageIndex:=2;
    end
    else
    begin
      Memo1.Lines.Assign(DiadocAPI1.ResultText);
      PageControl1.ActivePageIndex:=0;
    end
  end
end;

procedure TForm1.DoConnect;
begin
  DiadocAPI1.ApiClientId:=Edit1.Text;
  DiadocAPI1.UserName:=Edit2.Text;
  DiadocAPI1.Password:=Edit3.Text;
  FMyOrgs:=DiadocAPI1.GetMyOrganizations;
  if not Assigned(FMyOrgs) then
    raise Exception.Create('Ошибка инициализации Diadoc (не полученна информация об организации).')
  else
  begin
    Button1.Enabled:=false;
    PageControl1.ActivePageIndex:=1;
  end;
end;

procedure TForm1.FillBoxList;
var
  O:TOrganization;
  B:TBox;
  Node, NodeBox: TTreeNode;
begin
  TreeView1.Items.BeginUpdate;
  TreeView1.Items.Clear;
  for O in FMyOrgs.Organizations do
  begin
    Node:=TreeView1.Items.Add(nil, O.FullName);
    Node.ImageIndex:=0;
    Node.SelectedIndex:=0;
    Node.StateIndex:=0;
    //Node.Data:=O;

    for B in O.Boxes do
    begin
      NodeBox:=TreeView1.Items.AddChild(Node, B.Title);
      NodeBox.ImageIndex:=1;
      NodeBox.SelectedIndex:=1;
      NodeBox.StateIndex:=1;
      NodeBox.Data:=B;
    end;
    Node.AlphaSort;
  end;
  TreeView1.Items.EndUpdate;
  TreeView1.FullExpand;
  if TreeView1.Items.Count>0 then
    TreeView1.Selected:=TreeView1.Items[0];
  TreeView1Click(nil);

end;

function TForm1.CheckConnectionParams: Boolean;
begin
  Result:=(Trim(Edit1.Text)<>'') and (Trim(Edit2.Text)<>'') and (Trim(Edit3.Text)<>'');
  if not Result then
    ShowMessage('Необходимо указать параметры подключения');
end;

procedure TForm1.DoExport(AFolderName: string; DTD: TDocumentTypeDescriptionV2;
  DF: TDocumentFunctionV2; DFV: TDocumentVersionV2; DFVT: TDocumentTitleV2);
var
  M: TMemoryStream;
  S: String;
begin
  if (not (Assigned(DTD) and Assigned(DF) and  Assigned(DFV) and Assigned(DFVT))) or (DFVT.UserDataXsdUrl = '') then Exit;

  S:=AppendPathDelim(AFolderName) + DTD.Name + '_' + NormalazeDocFunction(DF.Name) + '_' + DFV.Version+'_ind'+IntToStr(DFVT.Index) + '.xsd';

  M:=DiadocAPI1.GetContent(DTD.Name, DF.Name, DFV.Version, DFVT.Index, UserContractXsd);
  if Assigned(M) then
  begin
    M.Position:=0;
    M.SaveToFile(S);
    M.Free;
  end
end;

function TForm1.NormalazeDocFunction(ADocFunction: string): string;
begin
  ADocFunction:=UTF8UpperCase(ADocFunction);
  if ADocFunction = 'СЧФ' then
    Result:='SCHF'
  else
  if ADocFunction = 'ДОП' then
    Result:='DOP'
  else
  if ADocFunction = 'СЧФДОП' then
    Result:='SCHFDOP'
  else
  if ADocFunction = 'КСЧФ' then
    Result:='KSCHF'
  else
  if ADocFunction = 'ДИС' then
    Result:='DIS'
  else
  if ADocFunction = 'КСЧФДИС' then
    Result:='KSCHFDIS'
  else
  if ADocFunction = 'СВРК' then
    Result:='SVRK'
  else
  if ADocFunction = 'СВЗК' then
    Result:='SVZK'
  else
  if ADocFunction = 'СВИСРК' then
    Result:='SVISRK'
  else
  if ADocFunction = 'СВИСЗК' then
    Result:='SVISZK'
  else
  if ADocFunction = 'DEFAULT' then
    Result:='DEFAULT'
  else
    raise Exception.CreateFmt('Не известная функция - %s', [ADocFunction]);
end;

end.

