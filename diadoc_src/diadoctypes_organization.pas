{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2023 Lagunov Aleksey alexs75@yandex.ru

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

unit DiadocTypes_Organization;

{$I diadoc_define.inc}

interface

//import "Address.proto";
uses
  Classes, SysUtils, DOM, protobuf_fpc,
  DiadocTypes_Address;

type
  TOrganization = class;

  TSociability = (
    AllOrganizations = 0,
    CounteragentsOnly = 1
  );

  TOrganizationInvoiceFormatVersion = (
    v5_01 = 1,
    v5_02 = 2
  );

  { TBox }
  //message Box {
  //	required string BoxId = 1;
  //    required string BoxIdGuid = 6;
  //	required string Title = 2;
  //	optional Organization Organization = 3;
  //	optional OrganizationInvoiceFormatVersion InvoiceFormatVersion = 4 [default = v5_02];
  //	optional bool EncryptedDocumentsAllowed = 5;
  //}
  TBox = class(TSerializationObject)
  private
    FBoxId: string;
    FBoxIdGuid: string;
    FEncryptedDocumentsAllowed: Boolean;
    FInvoiceFormatVersion: TOrganizationInvoiceFormatVersion;
    FOrganization: TOrganization;
    FTitle: string;
    function GetInvoiceFormatVersion: TOrganizationInvoiceFormatVersion;
    procedure SetBoxId(AValue: string);
    procedure SetBoxIdGuid(AValue: string);
    procedure SetEncryptedDocumentsAllowed(AValue: Boolean);
    procedure SetInvoiceFormatVersion(AValue: TOrganizationInvoiceFormatVersion
      );
    procedure SetOrganization(AValue: TOrganization);
    procedure SetTitle(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
    property InvoiceFormatVersion:TOrganizationInvoiceFormatVersion read GetInvoiceFormatVersion write SetInvoiceFormatVersion default v5_02; //4
  published
    property BoxId:string read FBoxId write SetBoxId;  // 1
    property BoxIdGuid:string read FBoxIdGuid write SetBoxIdGuid;// = 6;
    property Title:string read FTitle write SetTitle;  // 2
    property Organization:TOrganization read FOrganization write SetOrganization; //3
    property EncryptedDocumentsAllowed:Boolean read FEncryptedDocumentsAllowed write SetEncryptedDocumentsAllowed; //5;
  end;
  TBoxes = specialize GSerializationObjectList<TBox>;

  { TDepartment }
  //message Department {
  //	required string DepartmentId = 1;
  //	required string ParentDepartmentId = 2;
  //	required string Name = 3;
  //	optional string Abbreviation = 4;
  //	optional string Kpp = 5;
  //	optional Address Address = 6;
  //	optional bool IsDisabled = 7 [default = false];
  //}
  TDepartment = class(TSerializationObject)
  private
    FAbbreviation: string;
    FAddress: TAddress;
    FDepartmentId: string;
    FIsDisabled: Boolean;
    FKpp: string;
    FName: string;
    FParentDepartmentId: string;
    procedure SetAbbreviation(AValue: string);
    procedure SetAddress(AValue: TAddress);
    procedure SetDepartmentId(AValue: string);
    procedure SetIsDisabled(AValue: Boolean);
    procedure SetKpp(AValue: string);
    procedure SetName(AValue: string);
    procedure SetParentDepartmentId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DepartmentId:string read FDepartmentId write SetDepartmentId; //1
    property ParentDepartmentId:string read FParentDepartmentId write SetParentDepartmentId; //2
    property Name:string read FName write SetName;                         //3
    property Abbreviation:string read FAbbreviation write SetAbbreviation; //4
    property Kpp:string read FKpp write SetKpp;                            //5
    property Address:TAddress read FAddress write SetAddress;              //6
    property IsDisabled:Boolean read FIsDisabled write SetIsDisabled;      //7
  end;
  TDepartments = specialize GSerializationObjectList<TDepartment>;


  { TOrganization }
  //message Organization {
  //	required string OrgId = 1;
  //	required string Inn = 2;
  //	optional string Kpp = 3;
  //	required string FullName = 4;
  //	optional string ShortName = 5;
  //	repeated Box Boxes = 7;
  //	optional string Ogrn = 8;
  //	optional string FnsParticipantId = 9;
  //	optional Address Address = 10;
  //	optional string FnsRegistrationDate = 11;
  //	repeated Department Departments = 12;
  //	optional string IfnsCode = 13;
  //	optional bool IsPilot = 14;
  //	optional bool IsActive = 15;
  //	optional bool IsTest = 16;
  //	optional bool IsBranch = 17;
  //	optional bool IsRoaming = 18;
  //	optional bool IsEmployee = 19;
  //	optional int32 InvitationCount = 20;
  //	optional int32 SearchCount = 21;
  //	required Sociability Sociability = 22;
  //	optional string LiquidationDate = 23;
  //	optional string CertificateOfRegistryInfo = 24;
  //	optional bool IsForeign = 25;
  //    optional bool HasCertificateToSign = 26;
  //}
  TOrganization = class(TSerializationObject)
  private
    FAddress: TAddress;
    FBoxes: TBoxes;
    FCertificateOfRegistryInfo: string;
    FDepartments: TDepartments;
    FFnsParticipantId: string;
    FFnsRegistrationDate: string;
    FFullName: string;
    FHasCertificateToSign: Boolean;
    FIfnsCode: string;
    FIgnor1: integer;
    FInn: string;
    FInvitationCount: Int32;
    FIsActive: Boolean;
    FIsBranch: Boolean;
    FIsEmployee: Boolean;
    FIsForeign: Boolean;
    FIsPilot: Boolean;
    FIsRoaming: Boolean;
    FIsTest: Boolean;
    FKpp: string;
    FLiquidationDate: string;
    FOgrn: string;
    FOrgId: string;
    FSearchCount: Int32;
    FShortName: string;
    FSociability: TSociability;
    procedure SetCertificateOfRegistryInfo(AValue: string);
    procedure SetFnsParticipantId(AValue: string);
    procedure SetFnsRegistrationDate(AValue: string);
    procedure SetFullName(AValue: string);
    procedure SetHasCertificateToSign(AValue: Boolean);
    procedure SetIfnsCode(AValue: string);
    procedure SetIgnor1(AValue: integer);
    procedure SetInn(AValue: string);
    procedure SetInvitationCount(AValue: Int32);
    procedure SetIsActive(AValue: Boolean);
    procedure SetIsBranch(AValue: Boolean);
    procedure SetIsEmployee(AValue: Boolean);
    procedure SetIsForeign(AValue: Boolean);
    procedure SetIsPilot(AValue: Boolean);
    procedure SetIsRoaming(AValue: Boolean);
    procedure SetIsTest(AValue: Boolean);
    procedure SetKpp(AValue: string);
    procedure SetLiquidationDate(AValue: string);
    procedure SetOgrn(AValue: string);
    procedure SetOrgId(AValue: string);
    procedure SetSearchCount(AValue: Int32);
    procedure SetShortName(AValue: string);
    procedure SetSociability(AValue: TSociability);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property OrgId:string read FOrgId write SetOrgId;                                  // 1
    property Inn:string read FInn write SetInn;                                        // 2
    property Kpp:string read FKpp write SetKpp;                                        // 3
    property FullName:string read FFullName write SetFullName;                         // 4
    property ShortName:string read FShortName write SetShortName;                      // 5
    property Ignor1:integer read FIgnor1 write SetIgnor1;                              // 6
    property Boxes:TBoxes read FBoxes;                                                 // 7
    property Ogrn:string read FOgrn write SetOgrn;                                     // 8
    property FnsParticipantId:string read FFnsParticipantId write SetFnsParticipantId; // 9
    property Address:TAddress read FAddress;                                           // 10
    property FnsRegistrationDate:string read FFnsRegistrationDate write SetFnsRegistrationDate; //11
    property Departments:TDepartments read FDepartments;                             // 12
    property IfnsCode:string read FIfnsCode write SetIfnsCode;                         // 13
    property IsPilot:Boolean read FIsPilot write SetIsPilot;                           // 14
    property IsActive:Boolean read FIsActive write SetIsActive;                        // 15
    property IsTest:Boolean read FIsTest write SetIsTest;                              // 16
    property IsBranch:Boolean read FIsBranch write SetIsBranch;                        // 17
    property IsRoaming:Boolean read FIsRoaming write SetIsRoaming;                     // 18
    property IsEmployee:Boolean read FIsEmployee write SetIsEmployee;                  // 19
    property InvitationCount:Int32 read FInvitationCount write SetInvitationCount;     // 20
    property SearchCount:Int32 read FSearchCount write SetSearchCount;                 // 21
    property Sociability:TSociability read FSociability write SetSociability;          // 22
    property LiquidationDate : string read FLiquidationDate write SetLiquidationDate;  // 23
    property CertificateOfRegistryInfo:string read FCertificateOfRegistryInfo write SetCertificateOfRegistryInfo; //24
    property IsForeign:Boolean read FIsForeign write SetIsForeign;                     // 25
    property HasCertificateToSign:Boolean read FHasCertificateToSign write SetHasCertificateToSign; // 26;
  end;
  TOrganizations = specialize GSerializationObjectList<TOrganization>;

  { TOrganizationList }
  //message OrganizationList {
	 // repeated Organization Organizations = 1;
  //}
  TOrganizationList = class(TSerializationObject) //message OrganizationList
  private
    FOrganizations: TOrganizations;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Organizations:TOrganizations read FOrganizations; //1;
  end;

function SociabilityToStr(ASociability:TSociability):string;
function OrganizationInvoiceFormatVersionToStr(AFormat:TOrganizationInvoiceFormatVersion):string;
implementation
function SociabilityToStr(ASociability:TSociability):string;
begin
  case ASociability of
    AllOrganizations:Result:='AllOrganizations';
    CounteragentsOnly:Result:='CounteragentsOnly';
  else
    Result:='';
  end;
end;

function OrganizationInvoiceFormatVersionToStr(AFormat:TOrganizationInvoiceFormatVersion):string;
begin
  case AFormat of
    v5_01:Result:='v5_01';
    v5_02:Result:='v5_02';
  else
    Result:='';
  end;
end;

{ TBox }

procedure TBox.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

function TBox.GetInvoiceFormatVersion: TOrganizationInvoiceFormatVersion;
begin
  Result:=FInvoiceFormatVersion;
end;

procedure TBox.SetBoxIdGuid(AValue: string);
begin
  if FBoxIdGuid=AValue then Exit;
  FBoxIdGuid:=AValue;
  Modified(6);
end;

procedure TBox.SetEncryptedDocumentsAllowed(AValue: Boolean);
begin
  if FEncryptedDocumentsAllowed=AValue then Exit;
  FEncryptedDocumentsAllowed:=AValue;
  Modified(5);
end;

procedure TBox.SetInvoiceFormatVersion(AValue: TOrganizationInvoiceFormatVersion
  );
begin
  if FInvoiceFormatVersion=AValue then Exit;
  FInvoiceFormatVersion:=AValue;
  Modified(4);
end;

procedure TBox.SetOrganization(AValue: TOrganization);
begin
  if FOrganization=AValue then Exit;
  FOrganization:=AValue;
  Modified(3);
end;

procedure TBox.SetTitle(AValue: string);
begin
  if FTitle=AValue then Exit;
  FTitle:=AValue;
  Modified(2);
end;

procedure TBox.InternalInit;
begin
  InvoiceFormatVersion:=v5_02;
end;

procedure TBox.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('Title', 2, true);
  RegisterProp('Organization', 3, false, TOrganization);
  RegisterPropPublic('InvoiceFormatVersion', 4, TMethod(@SetInvoiceFormatVersion), TMethod(@GetInvoiceFormatVersion));
  RegisterProp('EncryptedDocumentsAllowed', 5);
  RegisterProp('BoxIdGuid', 6);
end;

destructor TBox.Destroy;
begin
  if Assigned(FOrganization) then
    FreeAndNil(FOrganization);
  inherited Destroy;
end;

{ TDepartment }

procedure TDepartment.SetAbbreviation(AValue: string);
begin
  if FAbbreviation=AValue then Exit;
  FAbbreviation:=AValue;
  Modified(4);
end;

procedure TDepartment.SetAddress(AValue: TAddress);
begin
  if FAddress=AValue then Exit;
  FAddress:=AValue;
  Modified(6);
end;

procedure TDepartment.SetDepartmentId(AValue: string);
begin
  if FDepartmentId=AValue then Exit;
  FDepartmentId:=AValue;
  Modified(1);
end;

procedure TDepartment.SetIsDisabled(AValue: Boolean);
begin
  if FIsDisabled=AValue then Exit;
  FIsDisabled:=AValue;
  Modified(7);
end;

procedure TDepartment.SetKpp(AValue: string);
begin
  if FKpp=AValue then Exit;
  FKpp:=AValue;
  Modified(5);
end;

procedure TDepartment.SetName(AValue: string);
begin
  if FName=AValue then Exit;
  FName:=AValue;
  Modified(3);
end;

procedure TDepartment.SetParentDepartmentId(AValue: string);
begin
  if FParentDepartmentId=AValue then Exit;
  FParentDepartmentId:=AValue;
  Modified(2);
end;

procedure TDepartment.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DepartmentId', 1, true);
  RegisterProp('ParentDepartmentId', 2, true);
  RegisterProp('Name', 3, true);
  RegisterProp('Abbreviation', 4);
  RegisterProp('Kpp', 5);
  RegisterProp('Address', 6, false, TAddress);
end;

procedure TDepartment.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDepartment.Destroy;
begin
  FreeAndNil(FAddress);
  inherited Destroy;
end;

{ TOrganization }

procedure TOrganization.SetCertificateOfRegistryInfo(AValue: string);
begin
  if FCertificateOfRegistryInfo=AValue then Exit;
  FCertificateOfRegistryInfo:=AValue;
  Modified(24);
end;

procedure TOrganization.SetFnsParticipantId(AValue: string);
begin
  if FFnsParticipantId=AValue then Exit;
  FFnsParticipantId:=AValue;
  Modified(9);
end;

procedure TOrganization.SetFnsRegistrationDate(AValue: string);
begin
  if FFnsRegistrationDate=AValue then Exit;
  FFnsRegistrationDate:=AValue;
  Modified(11);
end;

procedure TOrganization.SetFullName(AValue: string);
begin
  if FFullName=AValue then Exit;
  FFullName:=AValue;
  Modified(4);
end;

procedure TOrganization.SetHasCertificateToSign(AValue: Boolean);
begin
  if FHasCertificateToSign=AValue then Exit;
  FHasCertificateToSign:=AValue;
  Modified(26);
end;

procedure TOrganization.SetIfnsCode(AValue: string);
begin
  if FIfnsCode=AValue then Exit;
  FIfnsCode:=AValue;
  Modified(13);
end;

procedure TOrganization.SetIgnor1(AValue: integer);
begin
  if FIgnor1=AValue then Exit;
  FIgnor1:=AValue;
  Modified(6);
end;

procedure TOrganization.SetInn(AValue: string);
begin
  if FInn=AValue then Exit;
  FInn:=AValue;
  Modified(2);
end;

procedure TOrganization.SetInvitationCount(AValue: Int32);
begin
  if FInvitationCount=AValue then Exit;
  FInvitationCount:=AValue;
  Modified(20);
end;

procedure TOrganization.SetIsActive(AValue: Boolean);
begin
  if FIsActive=AValue then Exit;
  FIsActive:=AValue;
  Modified(15);
end;

procedure TOrganization.SetIsBranch(AValue: Boolean);
begin
  if FIsBranch=AValue then Exit;
  FIsBranch:=AValue;
  Modified(17);
end;

procedure TOrganization.SetIsEmployee(AValue: Boolean);
begin
  if FIsEmployee=AValue then Exit;
  FIsEmployee:=AValue;
  Modified(19);
end;

procedure TOrganization.SetIsForeign(AValue: Boolean);
begin
  if FIsForeign=AValue then Exit;
  FIsForeign:=AValue;
  Modified(25);
end;

procedure TOrganization.SetIsPilot(AValue: Boolean);
begin
  if FIsPilot=AValue then Exit;
  FIsPilot:=AValue;
  Modified(14);
end;

procedure TOrganization.SetIsRoaming(AValue: Boolean);
begin
  if FIsRoaming=AValue then Exit;
  FIsRoaming:=AValue;
  Modified(18);
end;

procedure TOrganization.SetIsTest(AValue: Boolean);
begin
  if FIsTest=AValue then Exit;
  FIsTest:=AValue;
  Modified(16);
end;

procedure TOrganization.SetKpp(AValue: string);
begin
  if FKpp=AValue then Exit;
  FKpp:=AValue;
  Modified(3);
end;

procedure TOrganization.SetLiquidationDate(AValue: string);
begin
  if FLiquidationDate=AValue then Exit;
  FLiquidationDate:=AValue;
  Modified(23);
end;

procedure TOrganization.SetOgrn(AValue: string);
begin
  if FOgrn=AValue then Exit;
  FOgrn:=AValue;
  Modified(8);
end;

procedure TOrganization.SetOrgId(AValue: string);
begin
  if FOrgId=AValue then Exit;
  FOrgId:=AValue;
  Modified(1);
end;

procedure TOrganization.SetSearchCount(AValue: Int32);
begin
  if FSearchCount=AValue then Exit;
  FSearchCount:=AValue;
  Modified(21);
end;

procedure TOrganization.SetShortName(AValue: string);
begin
  if FShortName=AValue then Exit;
  FShortName:=AValue;
  Modified(5);
end;

procedure TOrganization.SetSociability(AValue: TSociability);
begin
  if FSociability=AValue then Exit;
  FSociability:=AValue;
  Modified(22);
end;

procedure TOrganization.InternalInit;
begin
  inherited InternalInit;
  FAddress:=TAddress.Create;
  FBoxes:=TBoxes.Create;
  FDepartments:=TDepartments.Create;
end;

procedure TOrganization.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('OrgId', 1);
  RegisterProp('Inn', 2);
  RegisterProp('Kpp', 3);
  RegisterProp('FullName', 4);
  RegisterProp('ShortName', 5);

  RegisterProp('Ignor1', 6);

  RegisterProp('Boxes', 7, false, TBoxes);
  RegisterProp('Ogrn', 8);
  RegisterProp('FnsParticipantId', 9);
  RegisterProp('Address', 10, false, TAddress);
  RegisterProp('FnsRegistrationDate', 11);
  RegisterProp('Departments', 12, false, TDepartment);

  RegisterProp('IfnsCode', 13);
  RegisterProp('IsPilot', 14);
  RegisterProp('IsActive', 15);
  RegisterProp('IsTest', 16);
  RegisterProp('IsBranch', 17);
  RegisterProp('IsRoaming', 18);
  RegisterProp('IsEmployee', 19);
  RegisterProp('InvitationCount', 20);
  RegisterProp('SearchCount', 21);
  RegisterProp('Sociability', 22);
  RegisterProp('LiquidationDate', 23);
  RegisterProp('CertificateOfRegistryInfo', 24);
  RegisterProp('IsForeign', 25);
  RegisterProp('HasCertificateToSign', 26);
end;

destructor TOrganization.Destroy;
begin
  FreeAndNil(FAddress);
  FreeAndNil(FBoxes);
  FreeAndNil(FDepartments);
  inherited Destroy;
end;

{ TOrganizationList }

procedure TOrganizationList.InternalInit;
begin
  inherited InternalInit;
  FOrganizations:=TOrganizations.Create;
end;

procedure TOrganizationList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Organizations', 1);
end;

destructor TOrganizationList.Destroy;
begin
  FreeAndNil(FOrganizations);
  inherited Destroy;
end;

end.

