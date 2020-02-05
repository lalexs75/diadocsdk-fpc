{ Diadoc visual forms library for FPC and Lazarus

  Copyright (C) 2018-2020 Lagunov Aleksey alexs75@yandex.ru

  This library is free software; you can redistribute it and/or modify it
  under the terms of the GNU Library General Public License as published by
  the Free Software Foundation; either version 2 of the License, or (at your
  option) any later version with the following modification:

  As a special exception, the copyright holders of this library give you
  permission to link this library with independent modules to produce an
  executable, regardless of the license terms of these independent modules,and
  to copy and distribute the resulting executable under terms of your choice,
  provided that you also meet, for each linked independent module, the terms
  and conditions of the license of that module. An independent module is a
  module which is not derived from or based on this library. If you modify
  this library, you may extend this exception to your version of the library,
  but you are not obligated to do so. If you do not wish to do so, delete this
  exception statement from your version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License
  for more details.

  You should have received a copy of the GNU Library General Public License
  along with this library; if not, write to the Free Software Foundation,
  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
}

unit ddOrganizationInfoUnit;

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
    property BoxInfo: TBoxInfoFrame read FBoxInfo;
    property Address:TAdressInfoFrame read FAddress;
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
    begin
      ListBox1.ItemIndex:=0;
      ListBox1Click(nil);
    end
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

