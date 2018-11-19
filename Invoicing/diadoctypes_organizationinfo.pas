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

unit DiadocTypes_OrganizationInfo;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Address;
type
  (*
  message DocflowParticipant {
  	optional string BoxId = 1;								// идентификатор ящика в Диадоке
  	optional string Inn = 2;								// ИНН организации-участника обмена
  	optional string Kpp = 3;								// КПП организации-участника обмена
  	optional string FnsParticipantId = 4;					// идентификатор участника ЭДО
  }
  *)

  { TDocflowParticipant }

  TDocflowParticipant = class(TSerializationObject) //message DocflowParticipant
  private
    FBoxId: string;
    FFnsParticipantId: string;
    FInn: string;
    FKpp: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId; //1;  // идентификатор ящика в Диадоке
    property Inn:string read FInn write FInn; //2;        // ИНН организации-участника обмена
    property Kpp:string read FKpp write FKpp; //3;        // КПП организации-участника обмена
    property FnsParticipantId:string read FFnsParticipantId write FFnsParticipantId; //4;  // идентификатор участника ЭДО
  end;

  { TOrganizationInfo }
  (*
  message OrganizationInfo {
  	required string Name = 1;								// название
  	optional string Inn = 2;								// ИНН
  	optional string Kpp = 3;								// КПП
  	required Address Address = 4;							// адрес
  	optional bool IsSoleProprietor = 5 [default = false];	// организация - это ИП
  	optional string Okopf = 6;								// код организационно-правовой формы по ОКОПФ
  	optional string Okpo = 7;								// код в общероссийском классификаторе предприятий и организаций
  	optional string Okdp = 8;								// код основного вида деятельности по ОКДП
  	optional string Phone = 9;								// телефон
  	optional string Fax = 10;								// факс
  	optional string BankAccountNumber = 11;					// номер банковского счета
  	optional string BankName = 12;							// название банка
  	optional string BankId = 13;							// БИК
  	optional string Department = 14;						// структурное подразделение
  	optional string FnsParticipantId = 15;					// идентификатор участника ЭДО
  }
  *)
  TOrganizationInfo = class(TSerializationObject) //message OrganizationInfo
  private
    FAddress: TAddress;
    FBankAccountNumber: string;
    FBankId: string;
    FBankName: string;
    FDepartment: string;
    FFax: string;
    FFnsParticipantId: string;
    FInn: string;
    FIsSoleProprietor: Boolean;
    FKpp: string;
    FName: string;
    FOkdp: string;
    FOkopf: string;
    FOkpo: string;
    FPhone: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Name:string read FName write FName; //1;								// название
    property Inn:string read FInn write FInn; //2;								// ИНН
    property Kpp:string read FKpp write FKpp; //3;								// КПП
    property Address:TAddress read FAddress; //4;							// адрес
    property IsSoleProprietor:Boolean read FIsSoleProprietor write FIsSoleProprietor default false; //5	// организация - это ИП
    property Okopf:string read FOkopf write FOkopf;//6;								// код организационно-правовой формы по ОКОПФ
    property Okpo:string read FOkpo write FOkpo; //7;								// код в общероссийском классификаторе предприятий и организаций
    property Okdp:string read FOkdp write FOkdp; //8;								// код основного вида деятельности по ОКДП
    property Phone:string read FPhone write FPhone; //9;								// телефон
    property Fax:string read FFax write FFax; //10;								// факс
    property BankAccountNumber:string read FBankAccountNumber write FBankAccountNumber; //11;					// номер банковского счета
    property BankName:string read FBankName write FBankName; //12;							// название банка
    property BankId:string read FBankId write FBankId; //13;							// БИК
    property Department:string read FDepartment write FDepartment;//14;						// структурное подразделение
    property FnsParticipantId:string read FFnsParticipantId write FFnsParticipantId;//15;					// идентификатор участника ЭДО
  end;

  { TDiadocOrganizationInfo }
  (*
  message DiadocOrganizationInfo {
  	optional string BoxId = 1;              // идентификатор ящика в Диадоке
  	optional OrganizationInfo OrgInfo = 2;  // реквизиты организации
  }
  *)
  TDiadocOrganizationInfo = class(TSerializationObject) //message DiadocOrganizationInfo
  private
    FBoxId: string;
    FOrgInfo: TOrganizationInfo;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId;   //1;
    property OrgInfo:TOrganizationInfo read FOrgInfo; //2;
  end;

implementation

{ TDiadocOrganizationInfo }

procedure TDiadocOrganizationInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1);
  RegisterProp('OrgInfo', 2);
end;

procedure TDiadocOrganizationInfo.InternalInit;
begin
  inherited InternalInit;
  FOrgInfo:=TOrganizationInfo.Create;
end;

destructor TDiadocOrganizationInfo.Destroy;
begin
  FreeAndNil(FOrgInfo);
  inherited Destroy;
end;

{ TOrganizationInfo }

procedure TOrganizationInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1, true);								// название
  RegisterProp('Inn', 2);								// ИНН
  RegisterProp('Kpp', 3);								// КПП
  RegisterProp('Address', 4, true);							// адрес
  RegisterProp('IsSoleProprietor', 5);	// организация - это ИП
  RegisterProp('Okopf', 6);								// код организационно-правовой формы по ОКОПФ
  RegisterProp('Okpo', 7);								// код в общероссийском классификаторе предприятий и организаций
  RegisterProp('Okdp', 8);								// код основного вида деятельности по ОКДП
  RegisterProp('Phone', 9);								// телефон
  RegisterProp('Fax', 10);								// факс
  RegisterProp('BankAccountNumber', 11);					// номер банковского счета
  RegisterProp('BankName', 12);							// название банка
  RegisterProp('BankId', 13);							// БИК
  RegisterProp('Department', 14);						// структурное подразделение
  RegisterProp('FnsParticipantId', 15);					// идентификатор участника ЭДО
end;

procedure TOrganizationInfo.InternalInit;
begin
  inherited InternalInit;
  FAddress:=TAddress.Create;
end;

destructor TOrganizationInfo.Destroy;
begin
  FreeAndNil(FAddress);
  inherited Destroy;
end;

{ TDocflowParticipant }

procedure TDocflowParticipant.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1);  // идентификатор ящика в Диадоке
  RegisterProp('Inn', 2);        // ИНН организации-участника обмена
  RegisterProp('Kpp', 3);        // КПП организации-участника обмена
  RegisterProp('FnsParticipantId', 4);  // идентификатор участника ЭДО
end;

procedure TDocflowParticipant.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDocflowParticipant.Destroy;
begin
  inherited Destroy;
end;

end.

