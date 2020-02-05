{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2020 Lagunov Aleksey alexs75@yandex.ru

  base on docs from http://api-docs.diadoc.ru

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

{ Структуры данных базируются на информации http://api-docs.diadoc.ru/ru/latest/DataStructures.html }

unit DiadocTypes_ExtendedOrganizationInfo;

{$I diadoc_define.inc}

interface

(*
import "Address.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Address;

type
  TOrgType = (
    LegalEntity = 1,      // Сведения о юридическом лице, состоящем на учете в налоговых органах // СвЮЛУч
    IndividualEntity = 2, // Сведения об индивидуальном предпринимателе// СвИП
    ForeignEntity = 3,    // Сведения об иностранном лице, не состоящем на учете в налоговых органах // СвЮлНеУч
    PhysicalEntity = 4    // Сведения о физическом лице // СвФл
  );

  { TExtendedOrganizationInfo }
  //message ExtendedOrganizationInfo {
  //  optional string BoxId = 1;       // идентификатор ящика в Диадоке
  //  optional string OrgName = 2;     // название //НаимОрг
  //  optional string Inn = 3;         // ИНН //ИНН ФЛ-ИНН
  //  optional string Kpp = 4;         // КПП //КПП
  //  optional Address Address = 5;    // адрес //Адрес
  //  optional string FnsParticipantId = 6; // идентификатор участника ЭДО
  //  required OrgType OrgType = 7;    // СвИП - СвЮЛУч - СвИнНеУч
  //  optional string Okopf = 8;       // код организационно-правовой формы по ОКОПФ
  //  optional string Okpo = 9;        // код в общероссийском классификаторе предприятий и организаций //ОКПО
  //  optional string Okdp = 10;       // код основного вида деятельности по ОКДП
  //  optional string Phone = 11;      // Номер контактного телефона/факс //Тлф
  //  optional string Email = 12;      // Адрес электронной почты // ЭлПочта
  //  optional string CorrespondentAccount = 13; // Корреспондентский счёт // КорСчет
  //  optional string BankAccountNumber = 14; // номер банковского счета //НамерСчета
  //  optional string BankName = 15;   // название банка //НаимБанк
  //  optional string BankId = 16;     // БИК //БИК
  //  optional string Department = 17; // структурное подразделение //СтруктПодр
  //  optional string OrganizationAdditionalInfo = 18; // Информация для участника // ИнфДляУчаст
  //  optional string OrganizationOrPersonInfo = 19;   // Иные сведения, идентифицирующие ФЛ или ЮЛ //ИныеСвед
  //  optional string IndividualEntityRegistrationCertificate = 20; // Реквизиты свидетельства о государственной регистрации ИП //СвГосРегИп
  //  optional string Country = 21; // Страна //Страна
  //}
  TExtendedOrganizationInfo  = class(TSerializationObject)
  private
    FAddress: TAddress;
    FBankAccountNumber: string;
    FBankId: string;
    FBankName: string;
    FBoxId: string;
    FCorrespondentAccount: string;
    FCountry: string;
    FDepartment: string;
    FEmail: string;
    FFnsParticipantId: string;
    FIndividualEntityRegistrationCertificate: string;
    FInn: string;
    FKpp: string;
    FOkdp: string;
    FOkopf: string;
    FOkpo: string;
    FOrganizationAdditionalInfo: string;
    FOrganizationOrPersonInfo: string;
    FOrgName: string;
    FOrgType: TOrgType;
    FPhone: string;
    procedure SetBankAccountNumber(AValue: string);
    procedure SetBankId(AValue: string);
    procedure SetBankName(AValue: string);
    procedure SetBoxId(AValue: string);
    procedure SetCorrespondentAccount(AValue: string);
    procedure SetCountry(AValue: string);
    procedure SetDepartment(AValue: string);
    procedure SetEmail(AValue: string);
    procedure SetFnsParticipantId(AValue: string);
    procedure SetIndividualEntityRegistrationCertificate(AValue: string);
    procedure SetInn(AValue: string);
    procedure SetKpp(AValue: string);
    procedure SetOkdp(AValue: string);
    procedure SetOkopf(AValue: string);
    procedure SetOkpo(AValue: string);
    procedure SetOrganizationAdditionalInfo(AValue: string);
    procedure SetOrganizationOrPersonInfo(AValue: string);
    procedure SetOrgName(AValue: string);
    procedure SetOrgType(AValue: TOrgType);
    procedure SetPhone(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId; //1
    property OrgName:string read FOrgName write SetOrgName; //2;
    property Inn:string read FInn write SetInn; //3;
    property Kpp:string read FKpp write SetKpp; //4;
    property Address:TAddress read FAddress; //5;
    property FnsParticipantId:string read FFnsParticipantId write SetFnsParticipantId; //6;
    property OrgType:TOrgType read FOrgType write SetOrgType; //7
    property Okopf:string read FOkopf write SetOkopf; //8;
    property Okpo:string read FOkpo write SetOkpo; //9;
    property Okdp:string read FOkdp write SetOkdp; //10;
    property Phone:string read FPhone write SetPhone; //11;
    property Email:string read FEmail write SetEmail; //12;
    property CorrespondentAccount:string read FCorrespondentAccount write SetCorrespondentAccount; //13;
    property BankAccountNumber:string read FBankAccountNumber write SetBankAccountNumber; //14;
    property BankName:string read FBankName write SetBankName; //15;
    property BankId:string read FBankId write SetBankId; //16;
    property Department:string read FDepartment write SetDepartment; //17;
    property OrganizationAdditionalInfo:string read FOrganizationAdditionalInfo write SetOrganizationAdditionalInfo; //18;
    property OrganizationOrPersonInfo:string read FOrganizationOrPersonInfo write SetOrganizationOrPersonInfo; //19;
    property IndividualEntityRegistrationCertificate:string read FIndividualEntityRegistrationCertificate write SetIndividualEntityRegistrationCertificate; //20;
    property Country:string read FCountry write SetCountry; //21;
  end;

function OrgTypeToStr(AValue:TOrgType):string;
implementation

function OrgTypeToStr(AValue: TOrgType): string;
begin
  case AValue of
    LegalEntity:Result:='Юридическое лицо';      // Сведения о юридическом лице, состоящем на учете в налоговых органах // СвЮЛУч
    IndividualEntity:Result:='Индивидуальный предприниматель'; // Сведения об индивидуальном предпринимателе// СвИП
    ForeignEntity:Result:='Иностранное лицо, не состоящее на учете в налоговых органах';// Сведения об иностранном лице, не состоящем на учете в налоговых органах // СвЮлНеУч
    PhysicalEntity:Result:='Физическое лицо'; // Сведения о физическом лице // СвФл
  else
    Result:='';
  end;
end;

{ TExtendedOrganizationInfo }

procedure TExtendedOrganizationInfo.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

procedure TExtendedOrganizationInfo.SetBankAccountNumber(AValue: string);
begin
  if FBankAccountNumber=AValue then Exit;
  FBankAccountNumber:=AValue;
  Modified(14);
end;

procedure TExtendedOrganizationInfo.SetBankId(AValue: string);
begin
  if FBankId=AValue then Exit;
  FBankId:=AValue;
  Modified(16);
end;

procedure TExtendedOrganizationInfo.SetBankName(AValue: string);
begin
  if FBankName=AValue then Exit;
  FBankName:=AValue;
  Modified(15);
end;

procedure TExtendedOrganizationInfo.SetCorrespondentAccount(AValue: string);
begin
  if FCorrespondentAccount=AValue then Exit;
  FCorrespondentAccount:=AValue;
  Modified(13);
end;

procedure TExtendedOrganizationInfo.SetCountry(AValue: string);
begin
  if FCountry=AValue then Exit;
  FCountry:=AValue;
  Modified(21);
end;

procedure TExtendedOrganizationInfo.SetDepartment(AValue: string);
begin
  if FDepartment=AValue then Exit;
  FDepartment:=AValue;
  Modified(17);
end;

procedure TExtendedOrganizationInfo.SetEmail(AValue: string);
begin
  if FEmail=AValue then Exit;
  FEmail:=AValue;
  Modified(12);
end;

procedure TExtendedOrganizationInfo.SetFnsParticipantId(AValue: string);
begin
  if FFnsParticipantId=AValue then Exit;
  FFnsParticipantId:=AValue;
  Modified(6);
end;

procedure TExtendedOrganizationInfo.SetIndividualEntityRegistrationCertificate(
  AValue: string);
begin
  if FIndividualEntityRegistrationCertificate=AValue then Exit;
  FIndividualEntityRegistrationCertificate:=AValue;
  Modified(20);
end;

procedure TExtendedOrganizationInfo.SetInn(AValue: string);
begin
  if FInn=AValue then Exit;
  FInn:=AValue;
  Modified(3);
end;

procedure TExtendedOrganizationInfo.SetKpp(AValue: string);
begin
  if FKpp=AValue then Exit;
  FKpp:=AValue;
  Modified(4);
end;

procedure TExtendedOrganizationInfo.SetOkdp(AValue: string);
begin
  if FOkdp=AValue then Exit;
  FOkdp:=AValue;
end;

procedure TExtendedOrganizationInfo.SetOkopf(AValue: string);
begin
  if FOkopf=AValue then Exit;
  FOkopf:=AValue;
  Modified(8);
end;

procedure TExtendedOrganizationInfo.SetOkpo(AValue: string);
begin
  if FOkpo=AValue then Exit;
  FOkpo:=AValue;
  Modified(9);
end;

procedure TExtendedOrganizationInfo.SetOrganizationAdditionalInfo(AValue: string
  );
begin
  if FOrganizationAdditionalInfo=AValue then Exit;
  FOrganizationAdditionalInfo:=AValue;
  Modified(18);
end;

procedure TExtendedOrganizationInfo.SetOrganizationOrPersonInfo(AValue: string);
begin
  if FOrganizationOrPersonInfo=AValue then Exit;
  FOrganizationOrPersonInfo:=AValue;
  Modified(19);
end;

procedure TExtendedOrganizationInfo.SetOrgName(AValue: string);
begin
  if FOrgName=AValue then Exit;
  FOrgName:=AValue;
  Modified(2);
end;

procedure TExtendedOrganizationInfo.SetOrgType(AValue: TOrgType);
begin
  if FOrgType=AValue then Exit;
  FOrgType:=AValue;
  Modified(7);
end;

procedure TExtendedOrganizationInfo.SetPhone(AValue: string);
begin
  if FPhone=AValue then Exit;
  FPhone:=AValue;
  Modified(11);
end;

procedure TExtendedOrganizationInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1);
  RegisterProp('OrgName', 2);
  RegisterProp('Inn', 3);
  RegisterProp('Kpp', 4);
  RegisterProp('Address', 5);
  RegisterProp('FnsParticipantId', 6);
  RegisterProp('OrgType', 7, true);
  RegisterProp('Okopf', 8);
  RegisterProp('Okpo', 9);
  RegisterProp('Okdp', 10);
  RegisterProp('Phone', 11);
  RegisterProp('Email', 12);
  RegisterProp('CorrespondentAccount', 13);
  RegisterProp('BankAccountNumber', 14);
  RegisterProp('BankName', 15);
  RegisterProp('BankId', 16);
  RegisterProp('Department', 17);
  RegisterProp('OrganizationAdditionalInfo', 18);
  RegisterProp('OrganizationOrPersonInfo', 19);
  RegisterProp('IndividualEntityRegistrationCertificate', 20);
  RegisterProp('Country', 21);
end;

procedure TExtendedOrganizationInfo.InternalInit;
begin
  inherited InternalInit;
  FAddress:=TAddress.Create;
end;

destructor TExtendedOrganizationInfo.Destroy;
begin
  FreeAndNil(FAddress);
  inherited Destroy;
end;

end.

