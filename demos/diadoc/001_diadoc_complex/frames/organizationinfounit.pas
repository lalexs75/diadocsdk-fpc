unit OrganizationInfoUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, ComCtrls, ExtCtrls, DiadocAPI,
  DiadocTypes, DiadocTypes_Organization, AdressInfoFrameUnit, BoxInfoUnit;

type

  { TOrganizationInfoFrame }

  TOrganizationInfoFrame = class(TFrame)
    cbIsPilot: TCheckBox;
    cbIsActive: TCheckBox;
    cbIsTest: TCheckBox;
    cbIsBranch: TCheckBox;
    cbIsRoaming: TCheckBox;
    cbIsEmployee: TCheckBox;
    cbIsForeign: TCheckBox;
    edtLiquidationDate: TEdit;
    edtCertificateOfRegistryInfo: TEdit;
    edtSociability: TEdit;
    edtIfnsCode: TEdit;
    edtFnsRegistrationDate: TEdit;
    edtFnsParticipantId: TEdit;
    edtOgrn: TEdit;
    edtOrgFullName: TEdit;
    edtOrgId: TEdit;
    edtOrgINN: TEdit;
    edtOrgKPP: TEdit;
    edtShortName: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    PageControl1: TPageControl;
    Splitter1: TSplitter;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure ListBox1Click(Sender: TObject);
  private
    FBoxInfo: TBoxInfoFrame;
    FAddress:TAdressInfoFrame;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadInfo(AOrganization: TOrganization);
    procedure ClearInfo;
  end;

implementation

{$R *.lfm}

{ TOrganizationInfoFrame }

procedure TOrganizationInfoFrame.ListBox1Click(Sender: TObject);
var
  B: TBox;
begin
  if (ListBox1.Items.Count>0) and (ListBox1.ItemIndex>=0) and (ListBox1.ItemIndex < ListBox1.Items.Count) then
  begin
    B:=TBox(ListBox1.Items.Objects[ListBox1.ItemIndex]);
    FBoxInfo.LoadInfo(B);
  end
  else
    FBoxInfo.ClearInfo;
end;

constructor TOrganizationInfoFrame.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  FAddress:=TAdressInfoFrame.Create(Self);
  FAddress.Parent:=TabSheet2;
  FAddress.Align:=alClient;

  FBoxInfo:=TBoxInfoFrame.Create(Self);
  FBoxInfo.Parent:=TabSheet3;
  FBoxInfo.Align:=alClient;
end;

destructor TOrganizationInfoFrame.Destroy;
begin
  inherited Destroy;
end;

procedure TOrganizationInfoFrame.LoadInfo(AOrganization: TOrganization);
var
  B: TBox;
begin
  ListBox1.Items.Clear;
  if Assigned(AOrganization) then
  begin
    edtOrgId.Text:=AOrganization.OrgId;
    edtOrgINN.Text:=AOrganization.Inn;
    edtOrgKPP.Text:=AOrganization.Kpp;
    edtOrgFullName.Text:=AOrganization.FullName;
    edtShortName.Text:=AOrganization.ShortName;
    edtOgrn.Text:=AOrganization.Ogrn;
    edtFnsParticipantId.Text:=AOrganization.FnsParticipantId;
    edtFnsRegistrationDate.Text:=AOrganization.FnsRegistrationDate;
    edtIfnsCode.Text:=AOrganization.IfnsCode;
    cbIsPilot.Checked:=AOrganization.IsPilot;
    cbIsActive.Checked:=AOrganization.IsActive;
    cbIsTest.Checked:=AOrganization.IsTest;
    cbIsBranch.Checked:=AOrganization.IsBranch;
    cbIsRoaming.Checked:=AOrganization.IsRoaming;
    cbIsEmployee.Checked:=AOrganization.IsEmployee;
    edtSociability.Text:=SociabilityToStr(AOrganization.Sociability);
    cbIsForeign.Checked:=AOrganization.IsForeign;
    edtLiquidationDate.Text:=AOrganization.LiquidationDate;
    edtCertificateOfRegistryInfo.Text:=AOrganization.CertificateOfRegistryInfo;
(*
  property InvitationCount:Int32 read FInvitationCount write FInvitationCount;     // 20
  property SearchCount:Int32 read FSearchCount write FSearchCount;                 // 21
*)
    FAddress.LoadInfo(AOrganization.Address);
    //property Boxes:TBoxes read FBoxes;                                               // 7
    //property Departments:TDepartments read FDepartments;                             // 12

    for B in AOrganization.Boxes do
      ListBox1.Items.AddObject(B.BoxId, B);

    if ListBox1.Items.Count>0 then
      ListBox1.ItemIndex:=0
    else
      FBoxInfo.ClearInfo;
  end
  else
    ClearInfo;
end;

procedure TOrganizationInfoFrame.ClearInfo;
begin
  edtOrgId.Text:='';
  edtOrgINN.Text:='';
  edtOrgKPP.Text:='';
  edtOrgFullName.Text:='';
  edtShortName.Text:='';
  edtOgrn.Text:='';
  FAddress.ClearInfo;
  edtFnsParticipantId.Text:='';
  edtFnsRegistrationDate.Text:='';
  edtIfnsCode.Text:='';
  edtSociability.Text:='';
  edtLiquidationDate.Text:='';
  edtCertificateOfRegistryInfo.Text:='';
end;

end.

