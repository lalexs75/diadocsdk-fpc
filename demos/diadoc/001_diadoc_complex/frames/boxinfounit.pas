unit BoxInfoUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, DiadocAPI, DiadocTypes,
  DiadocTypes_Organization;

type

  { TBoxInfoFrame }

  TBoxInfoFrame = class(TFrame)
    chEncryptedDocumentsAllowed: TCheckBox;
    edtBoxID: TEdit;
    edtTitle: TEdit;
    edtInvoiceFormatVersion: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private
    FOrganizationInfoFrame:TFrame;
    //FOrganizationInfoFrame:TOrganizationInfoFrame;
  public
    procedure LoadInfo(ABox: TBox);
    procedure ClearInfo;
  end;

implementation
uses OrganizationInfoUnit, diadoc_consts;

{$R *.lfm}

{ TBoxInfoFrame }

procedure TBoxInfoFrame.LoadInfo(ABox: TBox);
begin
  if Assigned(ABox) then
  begin
    edtBoxID.Text:=ABox.BoxId;
    edtTitle.Text:=ABox.Title;
    edtInvoiceFormatVersion.Text:=OrganizationInvoiceFormatVersionToStr(ABox.InvoiceFormatVersion);
    chEncryptedDocumentsAllowed.Checked:=ABox.EncryptedDocumentsAllowed;

    if Assigned(ABox.Organization) then
    begin
      if not Assigned(FOrganizationInfoFrame) then
      begin
        FOrganizationInfoFrame:=TOrganizationInfoFrame.Create(Self);
        FOrganizationInfoFrame.Parent:=GroupBox1;
        FOrganizationInfoFrame.Align:=alClient;
      end;
      TOrganizationInfoFrame(FOrganizationInfoFrame).LoadInfo(ABox.Organization);
    end
    else
    begin
      if Assigned(FOrganizationInfoFrame) then
        FreeAndNil(FOrganizationInfoFrame);
    end;
  end
  else
    ClearInfo;
end;

procedure TBoxInfoFrame.ClearInfo;
begin
  edtBoxID.Text:='';
  edtInvoiceFormatVersion.Text:='';
  edtTitle.Text:='';
  if Assigned(FOrganizationInfoFrame) then
    FreeAndNil(FOrganizationInfoFrame);
end;

end.

