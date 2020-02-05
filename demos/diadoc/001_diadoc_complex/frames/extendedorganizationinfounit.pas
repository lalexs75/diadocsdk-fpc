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

unit ExtendedOrganizationInfoUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls,
  DiadocTypes_ExtendedOrganizationInfo;

type

  { TExtendedOrganizationInfoFrame }

  TExtendedOrganizationInfoFrame = class(TFrame)
    edtBoxId: TEdit;
    edtPhone: TEdit;
    edtEmail: TEdit;
    edtDepartment: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    edtOrgName: TEdit;
    edtINN: TEdit;
    edtKPP: TEdit;
    edtFnsParticipantId: TEdit;
    edtOkopf: TEdit;
    edtOkpo: TEdit;
    edtOkdp: TEdit;
    edtCountry: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    CLabel: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
  private
    FExtendedOrganizationInfo: TExtendedOrganizationInfo;
    procedure SetExtendedOrganizationInfo(AValue: TExtendedOrganizationInfo);

  public
    procedure Clear;
    property ExtendedOrganizationInfo:TExtendedOrganizationInfo read FExtendedOrganizationInfo write SetExtendedOrganizationInfo;
  end;

implementation

{$R *.lfm}

{ TExtendedOrganizationInfoFrame }

procedure TExtendedOrganizationInfoFrame.SetExtendedOrganizationInfo(
  AValue: TExtendedOrganizationInfo);
begin
  if FExtendedOrganizationInfo=AValue then Exit;
  FExtendedOrganizationInfo:=AValue;
  if Assigned(FExtendedOrganizationInfo) then
  begin
    edtBoxId.Text:=FExtendedOrganizationInfo.BoxId;
    edtOrgName.Text:=FExtendedOrganizationInfo.OrgName;
    edtINN.Text:=FExtendedOrganizationInfo.Inn;
    edtKPP.Text:=FExtendedOrganizationInfo.Kpp;
    //Address:TAddress read FAddress; //5;
    edtFnsParticipantId.Text:=FExtendedOrganizationInfo.FnsParticipantId;
    Label18.Caption:=OrgTypeToStr(FExtendedOrganizationInfo.OrgType);
    edtOkopf.Text:=FExtendedOrganizationInfo.Okopf;
    edtOkpo.Text:=FExtendedOrganizationInfo.Okpo;
    edtOkdp.Text:=FExtendedOrganizationInfo.Okdp;
    edtCountry.Text:=FExtendedOrganizationInfo.Country;
    edtPhone.Text:=FExtendedOrganizationInfo.Phone;
    edtEmail.Text:=FExtendedOrganizationInfo.Email;
    edtDepartment.Text:=FExtendedOrganizationInfo.Department;

(*
  property CorrespondentAccount:string read FCorrespondentAccount write SetCorrespondentAccount; //13;
  property BankAccountNumber:string read FBankAccountNumber write SetBankAccountNumber; //14;
  property BankName:string read FBankName write SetBankName; //15;
  property BankId:string read FBankId write SetBankId; //16;

  property OrganizationAdditionalInfo:string read FOrganizationAdditionalInfo write SetOrganizationAdditionalInfo; //18;
  property OrganizationOrPersonInfo:string read FOrganizationOrPersonInfo write SetOrganizationOrPersonInfo; //19;
  property IndividualEntityRegistrationCertificate:string read FIndividualEntityRegistrationCertificate write SetIndividualEntityRegistrationCertificate; //20;
*)
  end
  else
    Clear;
end;

procedure TExtendedOrganizationInfoFrame.Clear;
begin
  edtBoxId.Text:='';
  edtOrgName.Text:='';
  edtINN.Text:='';
  edtKPP.Text:='';
  edtFnsParticipantId.Text:='';
  Label18.Caption:=' ';
  edtOkopf.Text:='';
  edtOkpo.Text:='';
  edtOkdp.Text:='';
  edtCountry.Text:='';
  edtPhone.Text:='';
  edtEmail.Text:='';
end;

end.

