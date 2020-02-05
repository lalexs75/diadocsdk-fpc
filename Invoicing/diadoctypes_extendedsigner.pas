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

unit DiadocTypes_ExtendedSigner;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc;

type
  TSignerType = (
    LegalEntity = 1,      // Представитель юридического лица
    IndividualEntity = 2, // Индивидуальный предприниматель
    PhysicalPerson = 3   // Физическое лицо
  );

  TSignerPowers = (
    InvoiceSigner = 0,                 // лицо, ответственное за подписание счетов-фактур
    PersonMadeOperation = 1,           // лицо, совершившее сделку, операцию
    MadeAndSignOperation = 2,          // лицо, совершившее сделку, операцию и ответственное за её оформление;
    PersonDocumentedOperation = 3,     // лицо, ответственное за оформление свершившегося события;
    MadeOperationAndSignedInvoice = 4, // лицо, совершившее сделку, операцию и ответственное за подписание счетов-фактур;
    MadeAndResponsibleForOperationAndSignedInvoice = 5, // лицо, совершившее сделку, операцию и ответственное за её оформление и за подписание счетов-фактур;
    ResponsibleForOperationAndSignerForInvoice = 6      // лицо, ответственное за оформление свершившегося события и за подписание счетов-фактур
  );

  TSignerStatus = (
    SellerEmployee = 1,             // Работник организации продавца товаров (работ, услуг, имущественных прав);
    InformationCreatorEmployee = 2, // Работник организации - составителя информации продавца;
    OtherOrganizationEmployee = 3,  // Работник иной уполномоченной организации;
    AuthorizedPerson = 4,           // Уполномоченное физическое лицо (в том числе индивидуальный предприниматель)
    BuyerEmployee = 5,                   // Работник организации - покупателя (для документов в формате приказа №820);
    InformationCreatorBuyerEmployee = 6  // Работник организации - составителя файла обмена информации покупателя, если составитель файла обмена информации покупателя не является покупателем (для документов в формате приказа №820)
  );

  TDocumentTitleType = (
    Absent = -1,
    UtdSeller = 0,         // Данные для титула продавца УПД
    UtdBuyer = 1,          // Данные для титула покупателя УПД
    UcdSeller = 2,         // Данные для титула продавца УКД
    UcdBuyer = 3,          // Данные для титула покупателя УКД
    TovTorg551Seller = 4,  // Данные для титула продавца формата приказа  551
    TovTorg551Buyer = 5,   // Данные для титула покупателя формата приказа 551
    AccCert552Seller = 6,  // Данные для титула исполнителя формата приказа 552
    AccCert552Buyer = 7,   // Данные для титула заказчика формата приказа 552
    Utd820Buyer = 8        // Данные для титула покупателя УПД формата приказа 820
  );


  { TExtendedSignerDetailsToPost }
  //message ExtendedSignerDetailsToPost {
  //	optional string JobTitle = 1;
  //	optional string RegistrationCertificate = 2;
  //	required SignerType SignerType = 3;        // Физическое лицо-Индивидуальный предприниматель – представитель юридического лица (ФЛ-ИП-ЮЛ)
  //	optional string SignerInfo = 4;            // Иные сведения, идентифицирующие лицо (Юл.ИныеСвед или СвИП.ИныеСвед  или ФЛ.ИныеСвед)
  //	required SignerPowers SignerPowers = 5;    // Область полномочий (ОблПолн)
  //	required SignerStatus SignerStatus = 6;    // Статус (Статус)
  //	optional string SignerPowersBase = 7;      // Основание полномочий (доверия) (ОснПолн)
  //	optional string SignerOrgPowersBase = 8;   // Основание полномочий (доверия) организации (ОснПолнОрг)
  //}
  TExtendedSignerDetailsToPost  = class(TSerializationObject) //message ExtendedSignerDetailsToPost
  private
    FJobTitle: string;
    FRegistrationCertificate: string;
    FSignerInfo: string;
    FSignerOrgPowersBase: string;
    FSignerPowers: TSignerPowers;
    FSignerPowersBase: string;
    FSignerStatus: TSignerStatus;
    FSignerType: TSignerType;
    procedure SetJobTitle(AValue: string);
    procedure SetRegistrationCertificate(AValue: string);
    procedure SetSignerInfo(AValue: string);
    procedure SetSignerOrgPowersBase(AValue: string);
    procedure SetSignerPowers(AValue: TSignerPowers);
    procedure SetSignerPowersBase(AValue: string);
    procedure SetSignerStatus(AValue: TSignerStatus);
    procedure SetSignerType(AValue: TSignerType);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property JobTitle:string read FJobTitle write SetJobTitle; //1;
    property RegistrationCertificate:string read FRegistrationCertificate write SetRegistrationCertificate; //2;
    property SignerType:TSignerType read FSignerType write SetSignerType; //3
    property SignerInfo:string read FSignerInfo write SetSignerInfo; //4
    property SignerPowers:TSignerPowers read FSignerPowers write SetSignerPowers; //5
    property SignerStatus:TSignerStatus read FSignerStatus write SetSignerStatus; //6
    property SignerPowersBase:string read FSignerPowersBase write SetSignerPowersBase; //7
    property SignerOrgPowersBase:string read FSignerOrgPowersBase write SetSignerOrgPowersBase; //8
  end;

  {  TExtendedSignerDetails  }
  //message ExtendedSignerDetails {
  //	required string Surname = 1;
  //	required string FirstName = 2;
  //	optional string Patronymic = 3;
  //	optional string JobTitle = 4;
  //	optional string Inn = 5;
  //	optional string RegistrationCertificate = 6;
  //	required SignerType SignerType = 7 [default = LegalEntity]; // Физическое лицо-Индивидуальный предприниматель – представитель юридического лица (ФЛ-ИП-ЮЛ)
  //	optional string SignerOrganizationName = 8; // Наименование (НаимОрг)
  //	optional string SignerInfo = 9;             // Иные сведения, идентифицирующие физическое лицо (ИныеСвед)
  //	required SignerPowers SignerPowers = 10;    // Область полномочий (ОблПолн)
  //	required SignerStatus SignerStatus = 11;    // Статус (Статус)
  //	optional string SignerPowersBase = 12;      // Основание полномочий (доверия) (ОснПолн)
  //	optional string SignerOrgPowersBase = 13;   // Основание полномочий (доверия) организации (ОснПолнОрг)
  //}
  TExtendedSignerDetails  = class(TSerializationObject) //message ExtendedSignerDetails
  private
    FFirstName: string;
    FInn: string;
    FJobTitle: string;
    FPatronymic: string;
    FRegistrationCertificate: string;
    FSignerInfo: string;
    FSignerOrganizationName: string;
    FSignerOrgPowersBase: string;
    FSignerPowers: TSignerPowers;
    FSignerPowersBase: string;
    FSignerStatus: TSignerStatus;
    FSignerType: TSignerType;
    FSurname: string;
    procedure SetFirstName(AValue: string);
    procedure SetInn(AValue: string);
    procedure SetJobTitle(AValue: string);
    procedure SetPatronymic(AValue: string);
    procedure SetRegistrationCertificate(AValue: string);
    procedure SetSignerInfo(AValue: string);
    procedure SetSignerOrganizationName(AValue: string);
    procedure SetSignerOrgPowersBase(AValue: string);
    procedure SetSignerPowers(AValue: TSignerPowers);
    procedure SetSignerPowersBase(AValue: string);
    procedure SetSignerStatus(AValue: TSignerStatus);
    procedure SetSignerType(AValue: TSignerType);
    procedure SetSurname(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Surname:string read FSurname write SetSurname; //1;
    property FirstName:string read FFirstName write SetFirstName; //2;
    property Patronymic:string read FPatronymic write SetPatronymic;//3;
    property JobTitle:string read FJobTitle write SetJobTitle;//4;
    property Inn:string read FInn write SetInn;//5;
    property RegistrationCertificate:string read FRegistrationCertificate write SetRegistrationCertificate;//6;
    property SignerType:TSignerType read FSignerType write SetSignerType default LegalEntity; //7
    property SignerOrganizationName:string read FSignerOrganizationName write SetSignerOrganizationName;//8
    property SignerInfo:string read FSignerInfo write SetSignerInfo;//9
    property SignerPowers:TSignerPowers read FSignerPowers write SetSignerPowers; //10
    property SignerStatus:TSignerStatus read FSignerStatus write SetSignerStatus; //11
    property SignerPowersBase:string read FSignerPowersBase write SetSignerPowersBase;//12
    property SignerOrgPowersBase:string read FSignerOrgPowersBase write SetSignerOrgPowersBase; //13
  end;

  {  TExtendedSigner  }
  //message ExtendedSigner {
  //	optional string BoxId = 1;
  //	optional bytes SignerCertificate = 2;
  //	optional string SignerCertificateThumbprint = 3;
  //	optional ExtendedSignerDetails SignerDetails = 4;
  //}
  TExtendedSigner  = class(TSerializationObject) //message ExtendedSigner
  private
    FBoxId: string;
    FSignerCertificate: TBytes;
    FSignerCertificateThumbprint: string;
    FSignerDetails: TExtendedSignerDetails;
    procedure SetBoxId(AValue: string);
    procedure SetSignerCertificate(AValue: TBytes);
    procedure SetSignerCertificateThumbprint(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId; //1;
    property SignerCertificate:TBytes read FSignerCertificate write SetSignerCertificate; //2;
    property SignerCertificateThumbprint:string read FSignerCertificateThumbprint write SetSignerCertificateThumbprint; //3;
    property SignerDetails:TExtendedSignerDetails read FSignerDetails; //4;
  end;
  TExtendedSigners = specialize GSerializationObjectList<TExtendedSigner>;


function SignerTypeStr(AValue:TSignerType):string;
function SignerPowersStr(AValue:TSignerPowers):string;
function SignerStatusStr(AValue:TSignerStatus):string;
implementation

function SignerTypeStr(AValue: TSignerType): string;
begin
  case AValue of
    LegalEntity:Result:='Представитель юридического лица';
    IndividualEntity:Result:='Индивидуальный предприниматель';
    PhysicalPerson:Result:='Физическое лицо';
  else
    Result:='<Не определено>';
  end;
end;


function SignerPowersStr(AValue:TSignerPowers):string;
begin
  case AValue of
    InvoiceSigner:Result:='лицо, ответственное за подписание счетов-фактур';
    PersonMadeOperation:Result:='лицо, совершившее сделку, операцию';
    MadeAndSignOperation:Result:='лицо, совершившее сделку, операцию и ответственное за её оформление';
    PersonDocumentedOperation:Result:='лицо, ответственное за оформление свершившегося события';
    MadeOperationAndSignedInvoice:Result:='лицо, совершившее сделку, операцию и ответственное за подписание счетов-фактур';
    MadeAndResponsibleForOperationAndSignedInvoice:Result:='лицо, совершившее сделку, операцию и ответственное за её оформление и за подписание счетов-фактур';
    ResponsibleForOperationAndSignerForInvoice:Result:='лицо, ответственное за оформление свершившегося события и за подписание счетов-фактур';
  else
    Result:='<Не определено>';
  end;
end;

function SignerStatusStr(AValue:TSignerStatus):string;
begin
  case AValue of
    SellerEmployee:Result:='Работник организации продавца товаров (работ, услуг, имущественных прав';
    InformationCreatorEmployee:Result:='Работник организации - составителя информации продавца';
    OtherOrganizationEmployee:Result:='Работник иной уполномоченной организации';
    AuthorizedPerson:Result:='Уполномоченное физическое лицо (в том числе индивидуальный предприниматель)';
  else
    Result:='<Не определено>';
  end;
end;

{ TExtendedSigner }

procedure TExtendedSigner.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

procedure TExtendedSigner.SetSignerCertificate(AValue: TBytes);
begin
  if FSignerCertificate=AValue then Exit;
  FSignerCertificate:=AValue;
  Modified(2);
end;

procedure TExtendedSigner.SetSignerCertificateThumbprint(AValue: string);
begin
  if FSignerCertificateThumbprint=AValue then Exit;
  FSignerCertificateThumbprint:=AValue;
  Modified(3);
end;

procedure TExtendedSigner.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1);
  RegisterProp('SignerCertificate', 2);
  RegisterProp('SignerCertificateThumbprint', 3);
  RegisterProp('SignerDetails', 4);
end;

procedure TExtendedSigner.InternalInit;
begin
  inherited InternalInit;
  FSignerDetails:=TExtendedSignerDetails.Create;
end;

destructor TExtendedSigner.Destroy;
begin
  FreeAndNil(FSignerDetails);
  inherited Destroy;
end;

{ TExtendedSignerDetails }

procedure TExtendedSignerDetails.SetFirstName(AValue: string);
begin
  if FFirstName=AValue then Exit;
  FFirstName:=AValue;
  Modified(2);
end;

procedure TExtendedSignerDetails.SetInn(AValue: string);
begin
  if FInn=AValue then Exit;
  FInn:=AValue;
  Modified(5);
end;

procedure TExtendedSignerDetails.SetJobTitle(AValue: string);
begin
  if FJobTitle=AValue then Exit;
  FJobTitle:=AValue;
  Modified(4);
end;

procedure TExtendedSignerDetails.SetPatronymic(AValue: string);
begin
  if FPatronymic=AValue then Exit;
  FPatronymic:=AValue;
  Modified(3);
end;

procedure TExtendedSignerDetails.SetRegistrationCertificate(AValue: string);
begin
  if FRegistrationCertificate=AValue then Exit;
  FRegistrationCertificate:=AValue;
  Modified(6);
end;

procedure TExtendedSignerDetails.SetSignerInfo(AValue: string);
begin
  if FSignerInfo=AValue then Exit;
  FSignerInfo:=AValue;
  Modified(9);
end;

procedure TExtendedSignerDetails.SetSignerOrganizationName(AValue: string);
begin
  if FSignerOrganizationName=AValue then Exit;
  FSignerOrganizationName:=AValue;
  Modified(8);
end;

procedure TExtendedSignerDetails.SetSignerOrgPowersBase(AValue: string);
begin
  if FSignerOrgPowersBase=AValue then Exit;
  FSignerOrgPowersBase:=AValue;
  Modified(13);
end;

procedure TExtendedSignerDetails.SetSignerPowers(AValue: TSignerPowers);
begin
  FSignerPowers:=AValue;
  Modified(10);
end;

procedure TExtendedSignerDetails.SetSignerPowersBase(AValue: string);
begin
  if FSignerPowersBase=AValue then Exit;
  FSignerPowersBase:=AValue;
  Modified(12);
end;

procedure TExtendedSignerDetails.SetSignerStatus(AValue: TSignerStatus);
begin
  FSignerStatus:=AValue;
  Modified(11);
end;

procedure TExtendedSignerDetails.SetSignerType(AValue: TSignerType);
begin
  FSignerType:=AValue;
  Modified(7);
end;

procedure TExtendedSignerDetails.SetSurname(AValue: string);
begin
  if FSurname=AValue then Exit;
  FSurname:=AValue;
  Modified(1);
end;

procedure TExtendedSignerDetails.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Surname', 1, true);
  RegisterProp('FirstName', 2, true);
  RegisterProp('Patronymic', 3);
  RegisterProp('JobTitle', 4);
  RegisterProp('Inn', 5);
  RegisterProp('RegistrationCertificate', 6);
  RegisterProp('SignerType', 7, true);
  RegisterProp('SignerOrganizationName', 8);
  RegisterProp('SignerInfo', 9);
  RegisterProp('SignerPowers', 10, true);
  RegisterProp('SignerStatus', 11, true);
  RegisterProp('SignerPowersBase', 12);
  RegisterProp('SignerOrgPowersBase', 13);
end;

procedure TExtendedSignerDetails.InternalInit;
begin
  inherited InternalInit;
  FSignerType:=LegalEntity;
end;

destructor TExtendedSignerDetails.Destroy;
begin
  inherited Destroy;
end;

{ TExtendedSignerDetailsToPost }

procedure TExtendedSignerDetailsToPost.SetJobTitle(AValue: string);
begin
  if FJobTitle=AValue then Exit;
  FJobTitle:=AValue;
  Modified(1);
end;

procedure TExtendedSignerDetailsToPost.SetRegistrationCertificate(AValue: string
  );
begin
  if FRegistrationCertificate=AValue then Exit;
  FRegistrationCertificate:=AValue;
  Modified(2);
end;

procedure TExtendedSignerDetailsToPost.SetSignerInfo(AValue: string);
begin
  if FSignerInfo=AValue then Exit;
  FSignerInfo:=AValue;
  Modified(4);
end;

procedure TExtendedSignerDetailsToPost.SetSignerOrgPowersBase(AValue: string);
begin
  if FSignerOrgPowersBase=AValue then Exit;
  FSignerOrgPowersBase:=AValue;
  Modified(8);
end;

procedure TExtendedSignerDetailsToPost.SetSignerPowers(AValue: TSignerPowers);
begin
  FSignerPowers:=AValue;
  Modified(5);
end;

procedure TExtendedSignerDetailsToPost.SetSignerPowersBase(AValue: string);
begin
  if FSignerPowersBase=AValue then Exit;
  FSignerPowersBase:=AValue;
  Modified(7);
end;

procedure TExtendedSignerDetailsToPost.SetSignerStatus(AValue: TSignerStatus);
begin
  FSignerStatus:=AValue;
  Modified(6);
end;

procedure TExtendedSignerDetailsToPost.SetSignerType(AValue: TSignerType);
begin
  if FSignerType=AValue then Exit;
  FSignerType:=AValue;
  Modified(3);
end;

procedure TExtendedSignerDetailsToPost.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('JobTitle', 1);
  RegisterProp('RegistrationCertificate', 2);
  RegisterProp('SignerType', 3, true);
  RegisterProp('SignerInfo', 4);
  RegisterProp('SignerPowers', 5, true);
  RegisterProp('SignerStatus', 6, true);
  RegisterProp('SignerPowersBase', 7);
  RegisterProp('SignerOrgPowersBase', 8);
end;

procedure TExtendedSignerDetailsToPost.InternalInit;
begin
  inherited InternalInit;
end;

destructor TExtendedSignerDetailsToPost.Destroy;
begin
  inherited Destroy;
end;

end.

