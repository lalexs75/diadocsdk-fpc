{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018 Lagunov Aleksey alexs75@yandex.ru

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

  (*
  message ExtendedOrganizationInfo {
    optional string BoxId = 1;       // идентификатор ящика в Диадоке
    optional string OrgName = 2;     // название //НаимОрг
    optional string Inn = 3;         // ИНН //ИНН ФЛ-ИНН
    optional string Kpp = 4;         // КПП //КПП
    optional Address Address = 5;    // адрес //Адрес
    optional string FnsParticipantId = 6; // идентификатор участника ЭДО
    required OrgType OrgType = 7;    // СвИП - СвЮЛУч - СвИнНеУч
    optional string Okopf = 8;       // код организационно-правовой формы по ОКОПФ
    optional string Okpo = 9;        // код в общероссийском классификаторе предприятий и организаций //ОКПО
    optional string Okdp = 10;       // код основного вида деятельности по ОКДП
    optional string Phone = 11;      // Номер контактного телефона/факс //Тлф
    optional string Email = 12;      // Адрес электронной почты // ЭлПочта
    optional string CorrespondentAccount = 13; // Корреспондентский счёт // КорСчет
    optional string BankAccountNumber = 14; // номер банковского счета //НамерСчета
    optional string BankName = 15;   // название банка //НаимБанк
    optional string BankId = 16;     // БИК //БИК
    optional string Department = 17; // структурное подразделение //СтруктПодр
    optional string OrganizationAdditionalInfo = 18; // Информация для участника // ИнфДляУчаст
    optional string OrganizationOrPersonInfo = 19;   // Иные сведения, идентифицирующие ФЛ или ЮЛ //ИныеСвед
    optional string IndividualEntityRegistrationCertificate = 20; // Реквизиты свидетельства о государственной регистрации ИП //СвГосРегИп
    optional string Country = 21; // Страна //Страна
  }
  *)

  { TDocumentWithDocflow }

  TExtendedOrganizationInfo  = class(TSerializationObject) //message ExtendedOrganizationInfo
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId; //1
    property OrgName:string read FOrgName write FOrgName; //2;
    property Inn:string read FInn write FInn; //3;
    property Kpp:string read FKpp write FKpp; //4;
    property Address:TAddress read FAddress; //5;
    property FnsParticipantId:string read FFnsParticipantId write FFnsParticipantId; //6;
    property OrgType:TOrgType read FOrgType write FOrgType; //7
    property Okopf:string read FOkopf write FOkopf; //8;
    property Okpo:string read FOkpo write FOkpo; //9;
    property Okdp:string read FOkdp write FOkdp; //10;
    property Phone:string read FPhone write FPhone; //11;
    property Email:string read FEmail write FEmail; //12;
    property CorrespondentAccount:string read FCorrespondentAccount write FCorrespondentAccount; //13;
    property BankAccountNumber:string read FBankAccountNumber write FBankAccountNumber; //14;
    property BankName:string read FBankName write FBankName; //15;
    property BankId:string read FBankId write FBankId; //16;
    property Department:string read FDepartment write FDepartment; //17;
    property OrganizationAdditionalInfo:string read FOrganizationAdditionalInfo write FOrganizationAdditionalInfo; //18;
    property OrganizationOrPersonInfo:string read FOrganizationOrPersonInfo write FOrganizationOrPersonInfo; //19;
    property IndividualEntityRegistrationCertificate:string read FIndividualEntityRegistrationCertificate write FIndividualEntityRegistrationCertificate; //20;
    property Country:string read FCountry write FCountry; //21;
  end;

implementation

{ TExtendedOrganizationInfo }

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

