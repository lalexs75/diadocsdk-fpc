unit DDAPIMainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, Menus, ActnList, httpsend, DividerBevel, AnchorDockPanel, DiadocAPI,
  DiadocTypes, ddOrganizationInfoUnit, RxIniPropStorage, DiadocTypes_Address,
  rxAppUtils, LazFileUtils,
  protobuf_fpc, DiadocDocumentUnit,

  DiadocTypes_GetOrganizationsByInnList, DiadocTypes_DocumentList,
  DiadocTypes_Organization, DiadocTypes_OrganizationUser,
  DiadocTypes_OrganizationUserPermissions, DiadocTypes_User,
  DiadocTypes_Employee, ddSelectClient, ddOrganizationUsersList;

type

  { TMyOrg }

  TMyOrg = class(TObject)
  private
    Boxes:TBoxes;
  public
    destructor Destroy; override;
    procedure Clear;
  end;

  TMyDep = class(TObject)
    Orgs:TMyOrg;
  end;

  { TDDAPIMainForm }

  TDDAPIMainForm = class(TForm)
    Button4: TButton;
    CheckBox2: TCheckBox;
    ddOrganizationUsersList1: TddOrganizationUsersList;
    DiadocSelectClient1: TDiadocSelectClient;
    MenuItem8: TMenuItem;
    Panel2: TPanel;
    Splitter3: TSplitter;
    TabSheet2: TTabSheet;
    usrEmployeesList: TAction;
    Button2: TButton;
    Button5: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    DividerBevel3: TDividerBevel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    MenuItem7: TMenuItem;
    Panel1: TPanel;
    usrCurUserPermission: TAction;
    boxEventList: TAction;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    usrUserList: TAction;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    molRefresh: TAction;
    Button1: TButton;
    Button10: TButton;
    edtFndINN: TEdit;
    edtFndKPP: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    ListBox2: TListBox;
    MenuItem1: TMenuItem;
    PageControl2: TPageControl;
    Panel3: TPanel;
    TabSheet6: TTabSheet;
    molProps: TAction;
    ActionList1: TActionList;
    Button3: TButton;
    CheckBox1: TCheckBox;
    DiadocAPI1: TDiadocAPI;
    DividerBevel1: TDividerBevel;
    DividerBevel2: TDividerBevel;
    edtStreet: TEdit;
    edtApartment: TEdit;
    edtBuilding: TEdit;
    edtZipCode: TEdit;
    edtRegion: TEdit;
    edtTerritory: TEdit;
    edtBlock: TEdit;
    edtLocality: TEdit;
    edtCity: TEdit;
    edtAPIClientKey: TEdit;
    edtProxyUserName: TEdit;
    edtProxyPassword: TEdit;
    edtProxyPort: TEdit;
    edtProxyHost: TEdit;
    Edit2: TEdit;
    edtUserName: TEdit;
    edtUserPwd: TEdit;
    ImageList1: TImageList;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    PageControl1: TPageControl;
    PopupMenu1: TPopupMenu;
    RxIniPropStorage1: TRxIniPropStorage;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    TabSheet1: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TreeView1: TTreeView;
    procedure boxEventListExecute(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure DiadocAPI1HttpStatus(Sender: TDiadocAPI; AHTTP: THTTPSend);
    procedure FormCreate(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure molPropsExecute(Sender: TObject);
    procedure molRefreshExecute(Sender: TObject);
    procedure TreeView1Deletion(Sender: TObject; Node: TTreeNode);
    procedure usrEmployeesListExecute(Sender: TObject);
    procedure usrUserListExecute(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure usrCurUserPermissionExecute(Sender: TObject);
  private
    Orgs: TOrganizationList;
    FInfoFrame:TFrame;
    FOrgsQueryList: TOrganizationList;
    FOrganizationInfoFrame1:TOrganizationInfoFrame;

    FDiadocDocumentFrame:TDiadocDocumentFrame;
    function GetLoggedIn: boolean;
    procedure SetupAPI;
    procedure ShowStatus;
    procedure HttpStatusEnevent(Sender:TDiadocAPI; AHTTP:THTTPSend);
    procedure ShowCounteragentList(AOrgID:string);
    procedure LoadMyOrgsTree;
    procedure UpdateConnectionParams;
    function CurrentOrg:TOrganization;
    function CurrentBox:TBox;
    procedure ShowUserInfo;
  public
    procedure WriteLog(S:string);
    procedure DoLogin;
    property LoggedIn:boolean read GetLoggedIn;
  end;

var
  DDAPIMainForm: TDDAPIMainForm;

procedure InitLocale;
implementation
uses blcksock, synautil, ssl_openssl, CounteragentListUnit, DocListUnit,
  BoxPropsUnit, OrganizationUsersListUnit, BoxEventListUnit,
  UserPermissionsUnit, ContragentFindUnit, OrganizationInfoFormUnit,
  BoxInfoUnit, Diadoc_Base;

{$R *.lfm}

procedure ConvetToUTF8LocalConst;
var
  i:integer;
begin
  DefaultFormatSettings.ShortMonthNames[1]:='Январь';
  DefaultFormatSettings.ShortMonthNames[2]:='Февраль';
  DefaultFormatSettings.ShortMonthNames[3]:='Март';
  DefaultFormatSettings.ShortMonthNames[4]:='Апрель';
  DefaultFormatSettings.ShortMonthNames[5]:='Май';
  DefaultFormatSettings.ShortMonthNames[6]:='Июнь';
  DefaultFormatSettings.ShortMonthNames[7]:='Июль';
  DefaultFormatSettings.ShortMonthNames[8]:='Август';
  DefaultFormatSettings.ShortMonthNames[9]:='Сентябрь';
  DefaultFormatSettings.ShortMonthNames[10]:='Октябрь';
  DefaultFormatSettings.ShortMonthNames[11]:='Ноябрь';
  DefaultFormatSettings.ShortMonthNames[12]:='Декабрь';

  for i:=1 to 12 do
    DefaultFormatSettings.LongMonthNames[i] := DefaultFormatSettings.ShortMonthNames[i];

  DefaultFormatSettings.LongDayNames[1]:='Воскресенье';
  DefaultFormatSettings.LongDayNames[2]:='Понедельник';
  DefaultFormatSettings.LongDayNames[3]:='Вторник';
  DefaultFormatSettings.LongDayNames[4]:='Среда';
  DefaultFormatSettings.LongDayNames[5]:='Четверг';
  DefaultFormatSettings.LongDayNames[6]:='Пятница';
  DefaultFormatSettings.LongDayNames[7]:='Суббота';

  DefaultFormatSettings.ShortDayNames[1]:='Вс';
  DefaultFormatSettings.ShortDayNames[2]:='Пн';
  DefaultFormatSettings.ShortDayNames[3]:='Вт';
  DefaultFormatSettings.ShortDayNames[4]:='Ср';
  DefaultFormatSettings.ShortDayNames[5]:='Чт';
  DefaultFormatSettings.ShortDayNames[6]:='Пт';
  DefaultFormatSettings.ShortDayNames[7]:='Сб';
end;

procedure InitLocale;
begin
  //
  DefaultFormatSettings.LongDateFormat:='dd.mm.yyyy';
  DefaultFormatSettings.ShortDateFormat:=DefaultFormatSettings.LongDateFormat;
{.$IFNDEF MSWindows}
  DefaultFormatSettings.DateSeparator:='.';
  DefaultFormatSettings.TimeSeparator:=':';
{.$ELSE}
  ConvetToUTF8LocalConst;
{.$endif}
  DefaultFormatSettings.ThousandSeparator:=' ';
  DefaultFormatSettings.CurrencyString:='р.';
end;

{ TMyOrg }

destructor TMyOrg.Destroy;
begin
  inherited Destroy;
end;

procedure TMyOrg.Clear;
begin
  Boxes.Free;
  Boxes:=nil;
end;

{ TDDAPIMainForm }

procedure TDDAPIMainForm.Button10Click(Sender: TObject);
var
  O: TOrganization;
begin
  SetupAPI;
  FOrgsQueryList:=DiadocAPI1.GetOrganizationsByInnKpp(edtFndINN.Text, edtFndKPP.Text, true);
  ListBox2.Items.BeginUpdate;
  ListBox2.Items.Clear;
  if Assigned(FOrganizationInfoFrame1) then
    FOrganizationInfoFrame1.ClearInfo;
  for O in FOrgsQueryList.Organizations do
  begin
    ListBox2.Items.AddObject(O.FullName, O);
  end;
  if ListBox2.Items.Count > 0 then
    ListBox2.ItemIndex:=0;
  ListBox2.Items.EndUpdate;
end;

procedure TDDAPIMainForm.boxEventListExecute(Sender: TObject);
var
  FBox: TBox;
begin
  FBox:=CurrentBox;
  if not Assigned(FBox) then Exit;
  BoxEventListForm:=TBoxEventListForm.Create(Application);
  BoxEventListForm.LoadEvents(FBox.BoxId, DiadocAPI1);
  BoxEventListForm.ShowModal;
  BoxEventListForm.Free;
end;

procedure TDDAPIMainForm.Button1Click(Sender: TObject);
begin
  DoLogin;
  if LoggedIn then
    PageControl1.ActivePage:=TabSheet5;
end;

procedure TDDAPIMainForm.Button2Click(Sender: TObject);
var
  FRequest: TGetOrganizationsByInnListRequest;
  R: TGetOrganizationsByInnListResponse;
  O: TOrganizationWithCounteragentStatus;
begin
  FRequest:=TGetOrganizationsByInnListRequest.Create;
  FRequest.InnList.Add('7712040126');
  FRequest.InnList.Add('2635024103');
  R:=DiadocAPI1.GetOrganizationsByInnList('', FRequest);
  if Assigned(R) then
  begin
    for O in R.Organizations do
    begin
      WriteLog(O.Organization.FullName);
    end;
    R.Free;
  end;
  FRequest.Free;
end;

procedure TDDAPIMainForm.Button3Click(Sender: TObject);
var
  R: TRussianAddress;
begin
  SetupAPI;
  R:=DiadocAPI1.ParseRussianAddress(Edit2.Text);
  if Assigned(R) then
  begin
    edtZipCode.Text:=R.ZipCode;
    edtRegion.Text:=R.Region;
    edtTerritory.Text:=R.Territory;
    edtCity.Text:=R.City;
    edtLocality.Text:=R.Locality;
    edtStreet.Text:=R.Street;
    edtBuilding.Text:=R.Building;
    edtBlock.Text:=R.Block;
    edtApartment.Text:=R.Apartment;
  end
  else
  begin
    edtZipCode.Text:='';
    edtRegion.Text:='';
    edtTerritory.Text:='';
    edtBlock.Text:='';
    edtLocality.Text:='';
    edtCity.Text:='';
    edtApartment.Text:='';
    edtBuilding.Text:='';
    edtStreet.Text:='';
  end;
  ShowStatus;
  R.Free;
end;

procedure TDDAPIMainForm.Button4Click(Sender: TObject);
var
  S: String;
begin
  SetupAPI;

  if CheckBox2.Checked then
    DiadocSelectClient1.Style:=scfSymply
  else
    DiadocSelectClient1.Style:=scfDetail;

  DiadocSelectClient1.INN:=edtFndINN.Text;
  DiadocSelectClient1.KPP:=edtFndKPP.Text;
  if DiadocSelectClient1.Execute then
  begin
    if Assigned(DiadocSelectClient1.Selected) then
    begin
      S:='Организация - ' + DiadocSelectClient1.Selected.FullName + LineEnding;
      if Assigned(DiadocSelectClient1.SelectedBox) then
        S:=S + 'Почтовый ящик - ' + DiadocSelectClient1.SelectedBox.Title
      else
        S:=S + 'Не выбран почтовый ящик';
      InfoBox(S);
    end
    else
      ErrorBox('Ничего не выбрано');
  end;
end;

procedure TDDAPIMainForm.Button5Click(Sender: TObject);
begin
  ContragentFindForm:=TContragentFindForm.Create(Application);
  ContragentFindForm.InitForm(DiadocAPI1);
  ContragentFindForm.ShowModal;
  ContragentFindForm.Free;
end;

procedure TDDAPIMainForm.Button7Click(Sender: TObject);
var
  S: String;
  FOrg: TOrganization;
begin
  S:='';
  FOrg:=nil;
  if Assigned(TreeView1.Selected) and Assigned(TreeView1.Selected.Data) then
  begin
    if TObject(TreeView1.Selected.Data) is TOrganization then
      FOrg:=TOrganization(TreeView1.Selected.Data)
    else
    if (TObject(TreeView1.Selected.Data) is TDepartment) or (TObject(TreeView1.Selected.Data) is TBox) then
    begin
      if Assigned(TreeView1.Selected.Parent) and Assigned(TreeView1.Selected.Parent.Data) then
        if TObject(TreeView1.Selected.Parent.Data) is TOrganization then
          FOrg:=TOrganization(TreeView1.Selected.Parent.Data);
    end;
  end
  else
    Exit;

  if not Assigned(FOrg) then Exit;

  S:=FOrg.OrgId;

  ShowCounteragentList(S);
end;

procedure TDDAPIMainForm.Button8Click(Sender: TObject);
var
  Box: TBox;
  B: TObject;
  Docs: TDocumentList;
begin
  if not Assigned(TreeView1.Selected) then Exit;
  B:=TObject(TreeView1.Selected.Data);
  if not (B is TBox) then Exit;
  Box:=TBox(B);

  SetupAPI;
  DocListForm:=TDocListForm.Create(Application);
  DocListForm.OpenDocList(DiadocAPI1, Box.BoxId);
  DocListForm.ShowModal;
  DocListForm.Free;
end;

procedure TDDAPIMainForm.CheckBox1Change(Sender: TObject);
var
  F: Boolean;
begin
  F:=CheckBox1.Checked and not LoggedIn;
  edtProxyUserName.Enabled:=F;
  edtProxyPassword.Enabled:=F;
  edtProxyHost.Enabled:=F;
  edtProxyPort.Enabled:=F;

  Label5.Enabled:=F;
  Label6.Enabled:=F;
  Label7.Enabled:=F;
  Label10.Enabled:=F;
end;

procedure TDDAPIMainForm.DiadocAPI1HttpStatus(Sender: TDiadocAPI;
  AHTTP: THTTPSend);
begin
  WriteLog(Format('ResultCode: %d.  ResultString: "%s".', [Sender.ResultCode, Sender.ResultString]));
end;

procedure TDDAPIMainForm.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
  Memo1.Lines.Clear;

  FDiadocDocumentFrame:=TDiadocDocumentFrame.Create(Self);
  FDiadocDocumentFrame.Parent:=TabSheet7;
  FDiadocDocumentFrame.Align:=alClient;
  FDiadocDocumentFrame.InitFrame(DiadocAPI1, CurrentBox, CurrentOrg);

  TreeView1Click(nil);

  UpdateConnectionParams;
end;

procedure TDDAPIMainForm.ListBox2Click(Sender: TObject);
var
  O: TOrganization;
  B: TBox;
begin
  if not Assigned(FOrganizationInfoFrame1) then
  begin
    FOrganizationInfoFrame1:=TOrganizationInfoFrame.Create(Self);
    FOrganizationInfoFrame1.Parent:=Panel3;
    FOrganizationInfoFrame1.Align:=alClient;
  end;
  O:=ListBox2.Items.Objects[ListBox2.ItemIndex] as TOrganization;
  FOrganizationInfoFrame1.LoadInfo(O);
  if Assigned(O) then
  begin
    WriteLog('------Box-------');
    for B in O.Boxes do
      WriteLog(B.BoxId);
  end;
end;

procedure TDDAPIMainForm.molPropsExecute(Sender: TObject);
var
  B: TBox;
  O: TOrganization;
begin
  if TObject(TreeView1.Selected.Data) is TBox then
  begin
    B:=TBox(TreeView1.Selected.Data);

    BoxPropsForm:=TBoxPropsForm.Create(Application);
    BoxPropsForm.OpenBoxProps(DiadocAPI1, B.BoxId);
    BoxPropsForm.ShowModal;
    BoxPropsForm.Free;
  end
  else
  if TObject(TreeView1.Selected.Data) is TOrganization then
  begin
    O:=TOrganization(TreeView1.Selected.Data);

    OrganizationInfoForm:=TOrganizationInfoForm.Create(Application);
    OrganizationInfoForm.OpenInfo(O);
    OrganizationInfoForm.ShowModal;
    OrganizationInfoForm.Free;
  end;
end;

procedure TDDAPIMainForm.molRefreshExecute(Sender: TObject);
begin
  LoadMyOrgsTree;
end;

procedure TDDAPIMainForm.TreeView1Deletion(Sender: TObject; Node: TTreeNode);
begin
  if not Assigned(Node) then Exit;
  if not Assigned(Node.Data) then Exit;
  if TObject(Node.Data) is TMyOrg then
    TMyOrg(Node.Data).Free
  else
  if TObject(Node.Data) is TMyDep then
    TMyDep(Node.Data).Free;
  Node.Data:=nil;
end;

procedure TDDAPIMainForm.usrEmployeesListExecute(Sender: TObject);
var
  FEmployeesList: TEmployeeList;
begin
  if not Assigned(CurrentOrg) then Exit;

  FEmployeesList:=DiadocAPI1.GetEmployees(CurrentBox.BoxId, 0, 0);
  if Assigned(FEmployeesList) then
  begin
    OrganizationUsersListForm:=TOrganizationUsersListForm.Create(Application);
    OrganizationUsersListForm.LoadInfoEmp(FEmployeesList);
    OrganizationUsersListForm.ShowModal;
    OrganizationUsersListForm.Free;
    FreeAndNil(FEmployeesList);
  end
  else
    ShowMessage(DiadocAPI1.ResultString + LineEnding + DiadocAPI1.ResultText.Text);
end;

procedure TDDAPIMainForm.usrUserListExecute(Sender: TObject);
var
  FOrgs: TOrganization;
  FUsers: TOrganizationUsersList;
begin
  FOrgs:=CurrentOrg;
  if not Assigned(FOrgs) then Exit;

  FUsers:=DiadocAPI1.GetOrganizationUsers(FOrgs.OrgId);
  if Assigned(FUsers) then
  begin
    OrganizationUsersListForm:=TOrganizationUsersListForm.Create(Application);
    OrganizationUsersListForm.LoadInfo(FUsers);
    OrganizationUsersListForm.ShowModal;
    OrganizationUsersListForm.Free;
    FreeAndNil(FUsers);
  end
  else
    ShowMessage(DiadocAPI1.ResultString + LineEnding + DiadocAPI1.ResultText.Text);
end;

procedure TDDAPIMainForm.TreeView1Click(Sender: TObject);
begin
  if Assigned(TreeView1.Selected) then
  begin
    Button7.Enabled:=Assigned(TreeView1.Selected.Data);
    usrCurUserPermission.Enabled:=Button7.Enabled;
    usrUserList.Enabled:=Button7.Enabled;

    Button8.Enabled:=Button7.Enabled and (TObject(TreeView1.Selected.Data) is TBox);
    boxEventList.Enabled:=Button8.Enabled;
    Button9.Enabled:=Button8.Enabled;
  end
  else
  begin
    Button7.Enabled:=false;
    Button8.Enabled:=false;
    Button9.Enabled:=false;
    boxEventList.Enabled:=false;
    usrCurUserPermission.Enabled:=false;
    usrUserList.Enabled:=false;
  end;
  FDiadocDocumentFrame.Visible:=Assigned(CurrentBox);
  if FDiadocDocumentFrame.Visible then
    FDiadocDocumentFrame.InitFrame(DiadocAPI1, CurrentBox, CurrentOrg);
end;

procedure TDDAPIMainForm.usrCurUserPermissionExecute(Sender: TObject);
var
  FOrg: TOrganization;
  FPermission: TOrganizationUserPermissions;
begin
  FOrg:=CurrentOrg;
  if not Assigned(FOrg) then Exit;

  FPermission:=DiadocAPI1.GetMyPermissions(FOrg.OrgId);

  if Assigned(FPermission) then
  begin
    UserPermissionsForm:=TUserPermissionsForm.Create(Application);
    UserPermissionsForm.LoadInfo(FPermission);
    UserPermissionsForm.ShowModal;
    UserPermissionsForm.Free;
    FreeAndNil(FPermission);
  end;
end;

procedure TDDAPIMainForm.SetupAPI;
begin
  DiadocAPI1.UserName:=edtUserName.Text;
  DiadocAPI1.Password:=edtUserPwd.Text;
  DiadocAPI1.ApiClientId:=edtAPIClientKey.Text;

  if CheckBox1.Checked then
  begin
    {$IFNDEF LINUX}
    DiadocAPI1.ProxyData.ProxyHost:=edtProxyHost.Text;
    {$ENDIF}
    DiadocAPI1.ProxyData.ProxyPort:=edtProxyPort.Text;
    DiadocAPI1.ProxyData.ProxyUser:=edtProxyUserName.Text;
    DiadocAPI1.ProxyData.ProxyPass:=edtProxyPassword.Text;
  end
  else
  begin
    DiadocAPI1.ProxyData.ProxyHost:='';
    DiadocAPI1.ProxyData.ProxyPort:='';
    DiadocAPI1.ProxyData.ProxyUser:='';
    DiadocAPI1.ProxyData.ProxyPass:='';
  end;
end;

function TDDAPIMainForm.GetLoggedIn: boolean;
begin
  Result:=Assigned(Orgs);
end;

procedure TDDAPIMainForm.ShowStatus;
begin
  WriteLog('DiadocAPI1.ResultCode : ' + IntToStr(DiadocAPI1.ResultCode));
  WriteLog('DiadocAPI1.ResultString : ' + DiadocAPI1.ResultString);
  WriteLog('----  DiadocAPI1.ResultText.Text ----');
  WriteLog(DiadocAPI1.ResultText.Text);
end;

procedure TDDAPIMainForm.HttpStatusEnevent(Sender: TDiadocAPI; AHTTP: THTTPSend);
begin

end;

procedure TDDAPIMainForm.ShowCounteragentList(AOrgID: string);
begin
  SetupAPI;
  CounteragentListForm:=TCounteragentListForm.Create(Application);
  CounteragentListForm.FDiadocAPI:=DiadocAPI1;
  CounteragentListForm.OpenCList(AOrgID);
  CounteragentListForm.ShowModal;
  CounteragentListForm.Free;
  ShowStatus;
end;

procedure TDDAPIMainForm.LoadMyOrgsTree;
var
  Node, NodeBox: TTreeNode;
  B: TBox;
  D: TDepartment;
  O: TOrganization;
begin
  if Assigned(Orgs) then
    FreeAndNil(Orgs);
  SetupAPI;
  Orgs:=DiadocAPI1.GetMyOrganizations;
  if Assigned(Orgs) then
  begin
    TreeView1.Items.Clear;
    for O in Orgs.Organizations do
    begin
      Node:=TreeView1.Items.Add(nil, O.FullName);
      Node.ImageIndex:=0;
      Node.SelectedIndex:=0;
      Node.StateIndex:=0;
      Node.Data:=O;

      for B in O.Boxes do
      begin
        NodeBox:=TreeView1.Items.AddChild(Node, B.Title);
        NodeBox.ImageIndex:=1;
        NodeBox.SelectedIndex:=1;
        NodeBox.StateIndex:=1;
        NodeBox.Data:=B;
      end;

      for D in O.Departments do
      begin
        NodeBox:=TreeView1.Items.AddChild(Node, D.Name);
        NodeBox.ImageIndex:=2;
        NodeBox.SelectedIndex:=2;
        NodeBox.StateIndex:=2;
        NodeBox.Data:=D;
      end;

    end;
  end;
  TreeView1Click(nil);
  ShowStatus;
end;

procedure TDDAPIMainForm.UpdateConnectionParams;
var
  F: Boolean;
begin
  F:=LoggedIn;
  TabSheet5.TabVisible:=F;
  TabSheet4.TabVisible:=F;

  edtAPIClientKey.Enabled:=not F;
  edtUserPwd.Enabled:=not F;
  edtUserName.Enabled:=not F;
  Label3.Enabled:=not F;
  Label4.Enabled:=not F;
  Label8.Enabled:=not F;

  CheckBox1Change(nil);
end;

function TDDAPIMainForm.CurrentOrg: TOrganization;
begin
  Result:=nil;
  if TreeView1.Items.Count = 0 then Exit;

  if Assigned(TreeView1.Selected) and Assigned(TreeView1.Selected.Data) then
  begin
    if TObject(TreeView1.Selected.Data) is TOrganization then
      Result:=TOrganization(TreeView1.Selected.Data)
    else
    if (TObject(TreeView1.Selected.Data) is TDepartment) or (TObject(TreeView1.Selected.Data) is TBox) then
    begin
      if Assigned(TreeView1.Selected.Parent) and Assigned(TreeView1.Selected.Parent.Data) then
        if TObject(TreeView1.Selected.Parent.Data) is TOrganization then
          Result:=TOrganization(TreeView1.Selected.Parent.Data);
    end;
  end
end;

function TDDAPIMainForm.CurrentBox: TBox;
begin
  Result:=nil;
  if TreeView1.Items.Count = 0 then Exit;

  if Assigned(TreeView1.Selected) and Assigned(TreeView1.Selected.Data) and (TObject(TreeView1.Selected.Data) is TBox) then
    Result:=TBox(TreeView1.Selected.Data);
end;

procedure TDDAPIMainForm.ShowUserInfo;
var
  U: TUser;
begin
  U:=DiadocAPI1.GetMyUser;
  if Assigned(U) then
  begin
    Edit1.Text:=U.Id;
    Edit5.Text:=U.LastName;
    Edit4.Text:=U.FirstName;
    Edit3.Text:=U.MiddleName;
    FreeAndNil(U);
  end;
end;

procedure TDDAPIMainForm.WriteLog(S: string);
var
  LogFileName: String;
  F: TextFile;
begin
  LogFileName:=ChangeFileExt(ParamStr(0), '.log');
  AssignFile(F, LogFileName);
  if FileExists(LogFileName) then
    Append(F)
  else
    Rewrite(F);
  Writeln(F, S);
  CloseFile(F);

  Memo1.Lines.Add(S);
end;

procedure TDDAPIMainForm.DoLogin;
begin
  LoadMyOrgsTree;
  UpdateConnectionParams;

  if LoggedIn then
  begin
    ShowUserInfo;
//    TabSheet8
//    LoadContragens;
  end;
end;

end.

