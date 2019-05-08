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
  //	required string Title = 2;
  //	optional Organization Organization = 3;
  //	optional OrganizationInvoiceFormatVersion InvoiceFormatVersion = 4 [default = v5_02];
  //	optional bool EncryptedDocumentsAllowed = 5;
  //}
  TBox = class(TSerializationObject)
  private
    FBoxId: string;
    FEncryptedDocumentsAllowed: Boolean;
    FInvoiceFormatVersion: TOrganizationInvoiceFormatVersion;
    FOrganization: TOrganization;
    FTitle: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId;  // 1
    property Title:string read FTitle write FTitle;  // 2
    property Organization:TOrganization read FOrganization write FOrganization; //3
    property InvoiceFormatVersion:TOrganizationInvoiceFormatVersion read FInvoiceFormatVersion write FInvoiceFormatVersion default v5_02; //4
    property EncryptedDocumentsAllowed:Boolean read FEncryptedDocumentsAllowed write FEncryptedDocumentsAllowed; //5;
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
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DepartmentId:string read FDepartmentId write FDepartmentId; //1
    property ParentDepartmentId:string read FParentDepartmentId write FParentDepartmentId; //2
    property Name:string read FName write FName;                         //3
    property Abbreviation:string read FAbbreviation write FAbbreviation; //4
    property Kpp:string read FKpp write FKpp;                            //5
    property Address:TAddress read FAddress write FAddress;              //6
    property IsDisabled:Boolean read FIsDisabled write FIsDisabled;      //optional
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
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property OrgId:string read FOrgId write FOrgId;                                  // 1
    property Inn:string read FInn write FInn;                                        // 2
    property Kpp:string read FKpp write FKpp;                                        // 3
    property FullName:string read FFullName write FFullName;                         // 4
    property ShortName:string read FShortName write FShortName;                      // 5
    property Ignor1:integer read FIgnor1 write FIgnor1;                              // 6
    property Boxes:TBoxes read FBoxes;                                               // 7
    property Ogrn:string read FOgrn write FOgrn;                                     // 8
    property FnsParticipantId:string read FFnsParticipantId write FFnsParticipantId; // 9
    property Address:TAddress read FAddress;                                         // 10
    property FnsRegistrationDate:string read FFnsRegistrationDate write FFnsRegistrationDate; //11
    property Departments:TDepartments read FDepartments;                             // 12
    property IfnsCode:string read FIfnsCode write FIfnsCode;                         // 13
    property IsPilot:Boolean read FIsPilot write FIsPilot;                           // 14
    property IsActive:Boolean read FIsActive write FIsActive;                        // 15
    property IsTest:Boolean read FIsTest write FIsTest;                              // 16
    property IsBranch:Boolean read FIsBranch write FIsBranch;                        // 17
    property IsRoaming:Boolean read FIsRoaming write FIsRoaming;                     // 18
    property IsEmployee:Boolean read FIsEmployee write FIsEmployee;                  // 19
    property InvitationCount:Int32 read FInvitationCount write FInvitationCount;     // 20
    property SearchCount:Int32 read FSearchCount write FSearchCount;                 // 21
    property Sociability:TSociability read FSociability write FSociability;          // 22
    property LiquidationDate : string read FLiquidationDate write FLiquidationDate;  // 23
    property CertificateOfRegistryInfo:string read FCertificateOfRegistryInfo write FCertificateOfRegistryInfo; //24
    property IsForeign:Boolean read FIsForeign write FIsForeign;                     // 25
    property HasCertificateToSign:Boolean read FHasCertificateToSign write FHasCertificateToSign; //= 26;
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
  RegisterProp('InvoiceFormatVersion', 4);
  RegisterProp('EncryptedDocumentsAllowed', 5);
end;

destructor TBox.Destroy;
begin
  if Assigned(FOrganization) then
    FreeAndNil(FOrganization);
  inherited Destroy;
end;

{ TDepartment }

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

