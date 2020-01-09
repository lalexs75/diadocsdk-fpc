unit adMainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Menus, ActnList, DiadocAPI, DiadocTypes_Organization,
  ddSelectClient, DiadocTypes_DocumentTypeDescription, RxIniPropStorage,
  RxCloseFormValidator, httpsend, SynEdit, SynHighlighterXML;

type

  { TForm1 }

  TForm1 = class(TForm)
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
    RxCloseFormValidator1: TRxCloseFormValidator;
    RxIniPropStorage1: TRxIniPropStorage;
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
    procedure xsdOpenExecute(Sender: TObject);
  private
    FMyDT: TGetDocumentTypesResponse;
    FMyOrgs: TOrganizationList;
    procedure DoConnect;
    procedure FillBoxList;
  public

  end;

var
  Form1: TForm1;

implementation
uses rxlogging, rxAppUtils, rxconst, Diadoc_Base, XsdContentType;
{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not RxCloseFormValidator1.CheckCloseForm then Exit;
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
end;

procedure TForm1.TreeView1Click(Sender: TObject);
var
  B: TBox;
  DTD:TDocumentTypeDescription;
  DF:TDocumentFunction;
  DFV:TDocumentVersion;
  i: Integer;
  S: String;
  DFVT:TDocumentTitle;
  V, V1, V2, V3: TTreeNode;
begin
  Memo1.Lines.Clear;
  TreeView2.Items.Clear;

  if Assigned(FMyDT) then
    FreeAndNil(FMyDT);

  if Assigned(TreeView1.Selected) and Assigned(TreeView1.Selected.Data) then
  begin
    B:=TBox(TreeView1.Selected.Data);
    FMyDT:=DiadocAPI1.GetDocumentTypes(B.BoxId);
    if Assigned(FMyDT) then
    begin
      for DTD in FMyDT.DocumentTypes do
      begin
        V:=TreeView2.Items.Add(nil, DTD.Name);
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
        for i:=0 to DTD.SupportedDocflows.Count-1 do
        begin
          if S<>'' then  S:=S+ ',';
          S:=S + DocumentDocflowToStr(DTD.SupportedDocflows[i]);
        end;
        Memo1.Lines.Add('  виды документооборота : '+S);

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
      ErrorBox('Не получен список форматов документов для ящика %s', [B.Title]);
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
    xsdOpen.Enabled:=D is TDocumentVersion;
  end;
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
  if D is TDocumentVersion then
    SVers:=TDocumentVersion(D).Version;

  if TObject(ST.Parent.Data) is TDocumentFunction then
    SFunc:=TDocumentFunction(ST.Parent.Data).Name;

  if TObject(ST.Parent.Parent.Data) is TDocumentTypeDescription then
    STypeDesc:=TDocumentTypeDescription(ST.Parent.Parent.Data).Name;

  if (STypeDesc<>'') and (SFunc <> '') and (SVers <> '') then
  begin
    Edit4.Text:=STypeDesc + '_' + STypeDesc + '_' + SVers + '.xsd';

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

(*
  //GetContent?typeNamedId=UniversalTransferDocument&function=%u0421%u0427%u0424&version=utd820_05_01_01_hyphen&titleIndex=0&contentType=UserContractXsd
  M:=DiadocAPI1.GetContent('UniversalTransferDocument', 'СЧФ', 'utd820_05_01_01_hyphen', 0, UserContractXsd);//'UserContractXsd');
  if Assigned(M) then
  begin
    M.SaveToFile('/home/alexs/3/UniversalTransferDocument.xsd');
    M.Free;
  end
  else
    Memo1.Lines.Assign(DiadocAPI1.ResultText);
*)
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
    Button1.Enabled:=false;
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

end.

