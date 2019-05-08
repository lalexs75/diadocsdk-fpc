{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2019 Lagunov Aleksey alexs75@yandex.ru

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
  { TDocflowParticipant }
  //message DocflowParticipant {
  //	optional string BoxId = 1;								// идентификатор ящика в Диадоке
  //	optional string Inn = 2;								// ИНН организации-участника обмена
  //	optional string Kpp = 3;								// КПП организации-участника обмена
  //	optional string FnsParticipantId = 4;					// идентификатор участника ЭДО
  //}
  TDocflowParticipant = class(TSerializationObject) //message DocflowParticipant
  private
    FBoxId: string;
    FFnsParticipantId: string;
    FInn: string;
    FKpp: string;
    procedure SetBoxId(AValue: string);
    procedure SetFnsParticipantId(AValue: string);
    procedure SetInn(AValue: string);
    procedure SetKpp(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId; //1;  // идентификатор ящика в Диадоке
    property Inn:string read FInn write SetInn; //2;        // ИНН организации-участника обмена
    property Kpp:string read FKpp write SetKpp; //3;        // КПП организации-участника обмена
    property FnsParticipantId:string read FFnsParticipantId write SetFnsParticipantId; //4;  // идентификатор участника ЭДО
  end;

  { TOrganizationInfo }
  //message OrganizationInfo {
  //	required string Name = 1;								// название
  //	optional string Inn = 2;								// ИНН
  //	optional string Kpp = 3;								// КПП
  //	required Address Address = 4;							// адрес
  //	optional bool IsSoleProprietor = 5 [default = false];	// организация - это ИП
  //	optional string Okopf = 6;								// код организационно-правовой формы по ОКОПФ
  //	optional string Okpo = 7;								// код в общероссийском классификаторе предприятий и организаций
  //	optional string Okdp = 8;								// код основного вида деятельности по ОКДП
  //	optional string Phone = 9;								// телефон
  //	optional string Fax = 10;								// факс
  //	optional string BankAccountNumber = 11;					// номер банковского счета
  //	optional string BankName = 12;							// название банка
  //	optional string BankId = 13;							// БИК
  //	optional string Department = 14;						// структурное подразделение
  //	optional string FnsParticipantId = 15;					// идентификатор участника ЭДО
  //}
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
    procedure SetBankAccountNumber(AValue: string);
    procedure SetBankId(AValue: string);
    procedure SetBankName(AValue: string);
    procedure SetDepartment(AValue: string);
    procedure SetFax(AValue: string);
    procedure SetFnsParticipantId(AValue: string);
    procedure SetInn(AValue: string);
    procedure SetIsSoleProprietor(AValue: Boolean);
    procedure SetKpp(AValue: string);
    procedure SetName(AValue: string);
    procedure SetOkdp(AValue: string);
    procedure SetOkopf(AValue: string);
    procedure SetOkpo(AValue: string);
    procedure SetPhone(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Name:string read FName write SetName; //1;								// название
    property Inn:string read FInn write SetInn; //2;								// ИНН
    property Kpp:string read FKpp write SetKpp; //3;								// КПП
    property Address:TAddress read FAddress; //4;							// адрес
    property IsSoleProprietor:Boolean read FIsSoleProprietor write SetIsSoleProprietor default false; //5	// организация - это ИП
    property Okopf:string read FOkopf write SetOkopf;//6;								// код организационно-правовой формы по ОКОПФ
    property Okpo:string read FOkpo write SetOkpo; //7;								// код в общероссийском классификаторе предприятий и организаций
    property Okdp:string read FOkdp write SetOkdp; //8;								// код основного вида деятельности по ОКДП
    property Phone:string read FPhone write SetPhone; //9;								// телефон
    property Fax:string read FFax write SetFax; //10;								// факс
    property BankAccountNumber:string read FBankAccountNumber write SetBankAccountNumber; //11;					// номер банковского счета
    property BankName:string read FBankName write SetBankName; //12;							// название банка
    property BankId:string read FBankId write SetBankId; //13;							// БИК
    property Department:string read FDepartment write SetDepartment;//14;						// структурное подразделение
    property FnsParticipantId:string read FFnsParticipantId write SetFnsParticipantId;//15;					// идентификатор участника ЭДО
  end;

  { TDiadocOrganizationInfo }
  //message DiadocOrganizationInfo {
  //	optional string BoxId = 1;              // идентификатор ящика в Диадоке
  //	optional OrganizationInfo OrgInfo = 2;  // реквизиты организации
  //}
  TDiadocOrganizationInfo = class(TSerializationObject) //message DiadocOrganizationInfo
  private
    FBoxId: string;
    FOrgInfo: TOrganizationInfo;
    procedure SetBoxId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId;   //1;
    property OrgInfo:TOrganizationInfo read FOrgInfo; //2;
  end;

implementation

{ TDiadocOrganizationInfo }

procedure TDiadocOrganizationInfo.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

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

procedure TOrganizationInfo.SetBankAccountNumber(AValue: string);
begin
  if FBankAccountNumber=AValue then Exit;
  FBankAccountNumber:=AValue;
  Modified(11);
end;

procedure TOrganizationInfo.SetBankId(AValue: string);
begin
  if FBankId=AValue then Exit;
  FBankId:=AValue;
  Modified(13);
end;

procedure TOrganizationInfo.SetBankName(AValue: string);
begin
  if FBankName=AValue then Exit;
  FBankName:=AValue;
  Modified(12);
end;

procedure TOrganizationInfo.SetDepartment(AValue: string);
begin
  if FDepartment=AValue then Exit;
  FDepartment:=AValue;
  Modified(14);
end;

procedure TOrganizationInfo.SetFax(AValue: string);
begin
  if FFax=AValue then Exit;
  FFax:=AValue;
  Modified(10);
end;

procedure TOrganizationInfo.SetFnsParticipantId(AValue: string);
begin
  if FFnsParticipantId=AValue then Exit;
  FFnsParticipantId:=AValue;
  Modified(15);
end;

procedure TOrganizationInfo.SetInn(AValue: string);
begin
  if FInn=AValue then Exit;
  FInn:=AValue;
  Modified(2);
end;

procedure TOrganizationInfo.SetIsSoleProprietor(AValue: Boolean);
begin
  FIsSoleProprietor:=AValue;
  Modified(5);
end;

procedure TOrganizationInfo.SetKpp(AValue: string);
begin
  if FKpp=AValue then Exit;
  FKpp:=AValue;
  Modified(3);
end;

procedure TOrganizationInfo.SetName(AValue: string);
begin
  if FName=AValue then Exit;
  FName:=AValue;
  Modified(1);
end;

procedure TOrganizationInfo.SetOkdp(AValue: string);
begin
  if FOkdp=AValue then Exit;
  FOkdp:=AValue;
  Modified(8);
end;

procedure TOrganizationInfo.SetOkopf(AValue: string);
begin
  if FOkopf=AValue then Exit;
  FOkopf:=AValue;
  Modified(6);
end;

procedure TOrganizationInfo.SetOkpo(AValue: string);
begin
  if FOkpo=AValue then Exit;
  FOkpo:=AValue;
  Modified(7);
end;

procedure TOrganizationInfo.SetPhone(AValue: string);
begin
  if FPhone=AValue then Exit;
  FPhone:=AValue;
  Modified(9);
end;

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

procedure TDocflowParticipant.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

procedure TDocflowParticipant.SetFnsParticipantId(AValue: string);
begin
  if FFnsParticipantId=AValue then Exit;
  FFnsParticipantId:=AValue;
  Modified(4);
end;

procedure TDocflowParticipant.SetInn(AValue: string);
begin
  if FInn=AValue then Exit;
  FInn:=AValue;
  Modified(2);
end;

procedure TDocflowParticipant.SetKpp(AValue: string);
begin
  if FKpp=AValue then Exit;
  FKpp:=AValue;
  Modified(3);
end;

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

