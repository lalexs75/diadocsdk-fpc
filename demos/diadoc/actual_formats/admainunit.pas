unit adMainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, DiadocAPI, DiadocTypes_Organization, ddSelectClient,
  DiadocTypes_DocumentTypeDescription, RxIniPropStorage, RxCloseFormValidator;

type

  { TForm1 }

  TForm1 = class(TForm)
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
    Panel1: TPanel;
    RxCloseFormValidator1: TRxCloseFormValidator;
    RxIniPropStorage1: TRxIniPropStorage;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
  private
    FMyOrgs: TOrganizationList;
    procedure DoConnect;
    procedure FillBoxList;
  public

  end;

var
  Form1: TForm1;

implementation
uses rxlogging, rxAppUtils, rxconst;
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
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.TreeView1Click(Sender: TObject);
var
  B: TBox;
  DT: TGetDocumentTypesResponse;
  DTD:TDocumentTypeDescription;
  DF:TDocumentFunction;
  DFV:TDocumentVersion;
  i: Integer;
  S: String;
begin
  Memo1.Lines.Clear;
  if Assigned(TreeView1.Selected) and Assigned(TreeView1.Selected.Data) then
  begin
    B:=TBox(TreeView1.Selected.Data);
    DT:=DiadocAPI1.GetDocumentTypes(B.BoxId);
    if Assigned(DT) then
    begin

      for DTD in DT.DocumentTypes do
      begin
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

        Memo1.Lines.Add('  версии :');
        for DF in DTD.Functions do
        begin
          Memo1.Lines.Add('    - '+DF.Name);
          for DFV in DF.Versions do
          begin
            Memo1.Lines.Add('      * '+DFV.Version);
          end;
        end;
        Memo1.Lines.Add('');
      end;
      FreeAndNil(DT);
    end
    else
      ErrorBox('Не получен список форматов документов для ящика %s', [B.Title]);
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

