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

unit ElectricityIndication_DEFAULT_pokaz_01_01_ind0;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject;

type
  Tstring9 = String;
  Tstring10 = String;
  Tstring12 = String;
  Tstring36 = String;
  Tstring60 = String;
  Tstring100 = String;
  Tstring1000 = String;
  //Дата в формате ДД.ММ.ГГГГ (01.01.1800 - 31.12.2099)
  Tdate1 = String;
  TnewIndications = String;
type

  {  Forward declarations  }
  TElectricityIndicationSenderTitle = class;
  TElectricityIndicationSenderTitle_Provider = class;
  TElectricityIndicationSenderTitle_Consumer = class;
  TElectricityIndicationSenderTitle_Period = class;
  TElectricityIndicationSenderTitle_Indications = class;
  TElectricityIndicationSenderTitle_Indications_Indication = class;
  TElectricityIndicationSenderTitle_Signer = class;
  TElectricityIndicationSenderTitle_Signer_SignerDetails = class;
  TElectricityIndicationSenderTitle_Signer_SignerReference = class;

  {  Generic classes for collections  }
  TElectricityIndicationSenderTitleList = specialize GXMLSerializationObjectList<TElectricityIndicationSenderTitle>;
  TElectricityIndicationSenderTitle_ProviderList = specialize GXMLSerializationObjectList<TElectricityIndicationSenderTitle_Provider>;
  TElectricityIndicationSenderTitle_ConsumerList = specialize GXMLSerializationObjectList<TElectricityIndicationSenderTitle_Consumer>;
  TElectricityIndicationSenderTitle_PeriodList = specialize GXMLSerializationObjectList<TElectricityIndicationSenderTitle_Period>;
  TElectricityIndicationSenderTitle_IndicationsList = specialize GXMLSerializationObjectList<TElectricityIndicationSenderTitle_Indications>;
  TElectricityIndicationSenderTitle_Indications_IndicationList = specialize GXMLSerializationObjectList<TElectricityIndicationSenderTitle_Indications_Indication>;
  TElectricityIndicationSenderTitle_SignerList = specialize GXMLSerializationObjectList<TElectricityIndicationSenderTitle_Signer>;
  TElectricityIndicationSenderTitle_Signer_SignerDetailsList = specialize GXMLSerializationObjectList<TElectricityIndicationSenderTitle_Signer_SignerDetails>;
  TElectricityIndicationSenderTitle_Signer_SignerReferenceList = specialize GXMLSerializationObjectList<TElectricityIndicationSenderTitle_Signer_SignerReference>;

  {  TElectricityIndicationSenderTitle  }
  TElectricityIndicationSenderTitle = class(TXmlSerializationObject)
  private
    FProvider:TElectricityIndicationSenderTitle_Provider;
    FConsumer:TElectricityIndicationSenderTitle_Consumer;
    FPeriod:TElectricityIndicationSenderTitle_Period;
    FIndications:TElectricityIndicationSenderTitle_Indications;
    FSigner:TElectricityIndicationSenderTitle_Signer;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
    function RootNodeName:string; override;
  public
    destructor Destroy; override;
  published
    property Provider:TElectricityIndicationSenderTitle_Provider read FProvider;
    property Consumer:TElectricityIndicationSenderTitle_Consumer read FConsumer;
    property Period:TElectricityIndicationSenderTitle_Period read FPeriod;
    property Indications:TElectricityIndicationSenderTitle_Indications read FIndications;
    property Signer:TElectricityIndicationSenderTitle_Signer read FSigner;
  end;

  {  TElectricityIndicationSenderTitle_Provider  }
  TElectricityIndicationSenderTitle_Provider = class(TXmlSerializationObject)
  private
    FInn:Tstring12;
    FKpp:Tstring9;
    FCompanyName:Tstring1000;
    FFnsParticipantId:Tstring100;
    procedure SetInn( AValue:Tstring12);
    procedure SetKpp( AValue:Tstring9);
    procedure SetCompanyName( AValue:Tstring1000);
    procedure SetFnsParticipantId( AValue:Tstring100);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Inn:Tstring12 read FInn write SetInn;
    property Kpp:Tstring9 read FKpp write SetKpp;
    property CompanyName:Tstring1000 read FCompanyName write SetCompanyName;
    property FnsParticipantId:Tstring100 read FFnsParticipantId write SetFnsParticipantId;
  end;

  {  TElectricityIndicationSenderTitle_Consumer  }
  TElectricityIndicationSenderTitle_Consumer = class(TXmlSerializationObject)
  private
    FInn:Tstring12;
    FKpp:Tstring9;
    FCompanyName:Tstring1000;
    FFnsParticipantId:Tstring100;
    FContractNumber:Tstring100;
    FContractDate:Tdate1;
    FId:Tstring60;
    procedure SetInn( AValue:Tstring12);
    procedure SetKpp( AValue:Tstring9);
    procedure SetCompanyName( AValue:Tstring1000);
    procedure SetFnsParticipantId( AValue:Tstring100);
    procedure SetContractNumber( AValue:Tstring100);
    procedure SetContractDate( AValue:Tdate1);
    procedure SetId( AValue:Tstring60);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Inn:Tstring12 read FInn write SetInn;
    property Kpp:Tstring9 read FKpp write SetKpp;
    property CompanyName:Tstring1000 read FCompanyName write SetCompanyName;
    property FnsParticipantId:Tstring100 read FFnsParticipantId write SetFnsParticipantId;
    property ContractNumber:Tstring100 read FContractNumber write SetContractNumber;
    property ContractDate:Tdate1 read FContractDate write SetContractDate;
    property Id:Tstring60 read FId write SetId;
  end;

  {  TElectricityIndicationSenderTitle_Period  }
  TElectricityIndicationSenderTitle_Period = class(TXmlSerializationObject)
  private
    FBeginDate:Tdate1;
    FEndDate:Tdate1;
    procedure SetBeginDate( AValue:Tdate1);
    procedure SetEndDate( AValue:Tdate1);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property BeginDate:Tdate1 read FBeginDate write SetBeginDate;
    property EndDate:Tdate1 read FEndDate write SetEndDate;
  end;

  {  TElectricityIndicationSenderTitle_Indications  }
  TElectricityIndicationSenderTitle_Indications = class(TXmlSerializationObject)
  private
    FIndication:TElectricityIndicationSenderTitle_Indications_Indication;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Indication:TElectricityIndicationSenderTitle_Indications_Indication read FIndication;
  end;

  {  TElectricityIndicationSenderTitle_Indications_Indication  }
  TElectricityIndicationSenderTitle_Indications_Indication = class(TXmlSerializationObject)
  private
    FId:Tstring36;
    FCode:Tstring10;
    FNewIndication:TnewIndications;
    FRegistrationPointName:Tstring100;
    procedure SetId( AValue:Tstring36);
    procedure SetCode( AValue:Tstring10);
    procedure SetNewIndication( AValue:TnewIndications);
    procedure SetRegistrationPointName( AValue:Tstring100);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Id:Tstring36 read FId write SetId;
    property Code:Tstring10 read FCode write SetCode;
    property NewIndication:TnewIndications read FNewIndication write SetNewIndication;
    property RegistrationPointName:Tstring100 read FRegistrationPointName write SetRegistrationPointName;
  end;

  {  TElectricityIndicationSenderTitle_Signer  }
  TElectricityIndicationSenderTitle_Signer = class(TXmlSerializationObject)
  private
    FSignerDetails:TElectricityIndicationSenderTitle_Signer_SignerDetails;
    FSignerReference:TElectricityIndicationSenderTitle_Signer_SignerReference;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property SignerDetails:TElectricityIndicationSenderTitle_Signer_SignerDetails read FSignerDetails;
    property SignerReference:TElectricityIndicationSenderTitle_Signer_SignerReference read FSignerReference;
  end;

  {  TElectricityIndicationSenderTitle_Signer_SignerDetails  }
  TElectricityIndicationSenderTitle_Signer_SignerDetails = class(TXmlSerializationObject)
  private
    FLastName:Tstring60;
    FFirstName:Tstring60;
    FMiddleName:Tstring60;
    FPosition:String;
    FInn:String;
    FSoleProprietorRegistrationCertificate:Tstring100;
    procedure SetLastName( AValue:Tstring60);
    procedure SetFirstName( AValue:Tstring60);
    procedure SetMiddleName( AValue:Tstring60);
    procedure SetPosition( AValue:String);
    procedure SetInn( AValue:String);
    procedure SetSoleProprietorRegistrationCertificate( AValue:Tstring100);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property LastName:Tstring60 read FLastName write SetLastName;
    property FirstName:Tstring60 read FFirstName write SetFirstName;
    property MiddleName:Tstring60 read FMiddleName write SetMiddleName;
    property Position:String read FPosition write SetPosition;
    property Inn:String read FInn write SetInn;
    property SoleProprietorRegistrationCertificate:Tstring100 read FSoleProprietorRegistrationCertificate write SetSoleProprietorRegistrationCertificate;
  end;

  {  TElectricityIndicationSenderTitle_Signer_SignerReference  }
  TElectricityIndicationSenderTitle_Signer_SignerReference = class(TXmlSerializationObject)
  private
    FCertificateBytes:String;
    FCertificateThumbprint:Tstring100;
    procedure SetCertificateBytes( AValue:String);
    procedure SetCertificateThumbprint( AValue:Tstring100);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //X.509 сертификат подписанта (DER-кодировка) в формате BASE64Одно из полей CertificateBytes или CertificateThumbprint обязательно для заполнения
    property CertificateBytes:String read FCertificateBytes write SetCertificateBytes;
    //Отпечаток сертификата подписантаОдно из полей CertificateBytes или CertificateThumbprint обязательно для заполнения
    property CertificateThumbprint:Tstring100 read FCertificateThumbprint write SetCertificateThumbprint;
  end;

implementation

  {  TElectricityIndicationSenderTitle  }
procedure TElectricityIndicationSenderTitle.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Provider', 'Provider', [], '', -1, -1);
  P:=RegisterProperty('Consumer', 'Consumer', [], '', -1, -1);
  P:=RegisterProperty('Period', 'Period', [], '', -1, -1);
  P:=RegisterProperty('Indications', 'Indications', [], '', -1, -1);
  P:=RegisterProperty('Signer', 'Signer', [], '', -1, -1);
end;

procedure TElectricityIndicationSenderTitle.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FProvider:=TElectricityIndicationSenderTitle_Provider.Create;
  FConsumer:=TElectricityIndicationSenderTitle_Consumer.Create;
  FPeriod:=TElectricityIndicationSenderTitle_Period.Create;
  FIndications:=TElectricityIndicationSenderTitle_Indications.Create;
  FSigner:=TElectricityIndicationSenderTitle_Signer.Create;
end;

destructor TElectricityIndicationSenderTitle.Destroy;
begin
  FProvider.Free;
  FConsumer.Free;
  FPeriod.Free;
  FIndications.Free;
  FSigner.Free;
  inherited Destroy;
end;

function TElectricityIndicationSenderTitle.RootNodeName:string;
begin
  Result:='ElectricityIndicationSenderTitle';
end;

  {  TElectricityIndicationSenderTitle_Provider  }
procedure TElectricityIndicationSenderTitle_Provider.SetInn(AValue: Tstring12);
begin
  FInn:=AValue;
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  ModifiedProperty('Inn');
end;

procedure TElectricityIndicationSenderTitle_Provider.SetKpp(AValue: Tstring9);
begin
  FKpp:=AValue;
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  ModifiedProperty('Kpp');
end;

procedure TElectricityIndicationSenderTitle_Provider.SetCompanyName(AValue: Tstring1000);
begin
  FCompanyName:=AValue;
  CheckStrMinSize('CompanyName', AValue);
  CheckStrMaxSize('CompanyName', AValue);
  ModifiedProperty('CompanyName');
end;

procedure TElectricityIndicationSenderTitle_Provider.SetFnsParticipantId(AValue: Tstring100);
begin
  FFnsParticipantId:=AValue;
  CheckStrMinSize('FnsParticipantId', AValue);
  CheckStrMaxSize('FnsParticipantId', AValue);
  ModifiedProperty('FnsParticipantId');
end;

procedure TElectricityIndicationSenderTitle_Provider.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Inn', 'Inn', [xsaRequared], '', 1, 12);
  P:=RegisterProperty('Kpp', 'Kpp', [], '', 1, 9);
  P:=RegisterProperty('CompanyName', 'CompanyName', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('FnsParticipantId', 'FnsParticipantId', [], '', 1, 100);
end;

procedure TElectricityIndicationSenderTitle_Provider.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TElectricityIndicationSenderTitle_Provider.Destroy;
begin
  inherited Destroy;
end;

  {  TElectricityIndicationSenderTitle_Consumer  }
procedure TElectricityIndicationSenderTitle_Consumer.SetInn(AValue: Tstring12);
begin
  FInn:=AValue;
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  ModifiedProperty('Inn');
end;

procedure TElectricityIndicationSenderTitle_Consumer.SetKpp(AValue: Tstring9);
begin
  FKpp:=AValue;
  CheckStrMinSize('Kpp', AValue);
  CheckStrMaxSize('Kpp', AValue);
  ModifiedProperty('Kpp');
end;

procedure TElectricityIndicationSenderTitle_Consumer.SetCompanyName(AValue: Tstring1000);
begin
  FCompanyName:=AValue;
  CheckStrMinSize('CompanyName', AValue);
  CheckStrMaxSize('CompanyName', AValue);
  ModifiedProperty('CompanyName');
end;

procedure TElectricityIndicationSenderTitle_Consumer.SetFnsParticipantId(AValue: Tstring100);
begin
  FFnsParticipantId:=AValue;
  CheckStrMinSize('FnsParticipantId', AValue);
  CheckStrMaxSize('FnsParticipantId', AValue);
  ModifiedProperty('FnsParticipantId');
end;

procedure TElectricityIndicationSenderTitle_Consumer.SetContractNumber(AValue: Tstring100);
begin
  FContractNumber:=AValue;
  CheckStrMinSize('ContractNumber', AValue);
  CheckStrMaxSize('ContractNumber', AValue);
  ModifiedProperty('ContractNumber');
end;

procedure TElectricityIndicationSenderTitle_Consumer.SetContractDate(AValue: Tdate1);
begin
  FContractDate:=AValue;
  CheckStrMinSize('ContractDate', AValue);
  CheckStrMaxSize('ContractDate', AValue);
  ModifiedProperty('ContractDate');
end;

procedure TElectricityIndicationSenderTitle_Consumer.SetId(AValue: Tstring60);
begin
  FId:=AValue;
  CheckStrMinSize('Id', AValue);
  CheckStrMaxSize('Id', AValue);
  ModifiedProperty('Id');
end;

procedure TElectricityIndicationSenderTitle_Consumer.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Inn', 'Inn', [xsaRequared], '', 1, 12);
  P:=RegisterProperty('Kpp', 'Kpp', [], '', 1, 9);
  P:=RegisterProperty('CompanyName', 'CompanyName', [xsaRequared], '', 1, 1000);
  P:=RegisterProperty('FnsParticipantId', 'FnsParticipantId', [], '', 1, 100);
  P:=RegisterProperty('ContractNumber', 'ContractNumber', [xsaRequared], '', 1, 100);
  P:=RegisterProperty('ContractDate', 'ContractDate', [xsaRequared], '', 10, 10);
  P:=RegisterProperty('Id', 'Id', [xsaRequared], '', 1, 60);
end;

procedure TElectricityIndicationSenderTitle_Consumer.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TElectricityIndicationSenderTitle_Consumer.Destroy;
begin
  inherited Destroy;
end;

  {  TElectricityIndicationSenderTitle_Period  }
procedure TElectricityIndicationSenderTitle_Period.SetBeginDate(AValue: Tdate1);
begin
  FBeginDate:=AValue;
  CheckStrMinSize('BeginDate', AValue);
  CheckStrMaxSize('BeginDate', AValue);
  ModifiedProperty('BeginDate');
end;

procedure TElectricityIndicationSenderTitle_Period.SetEndDate(AValue: Tdate1);
begin
  FEndDate:=AValue;
  CheckStrMinSize('EndDate', AValue);
  CheckStrMaxSize('EndDate', AValue);
  ModifiedProperty('EndDate');
end;

procedure TElectricityIndicationSenderTitle_Period.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('BeginDate', 'BeginDate', [], '', 10, 10);
  P:=RegisterProperty('EndDate', 'EndDate', [xsaRequared], '', 10, 10);
end;

procedure TElectricityIndicationSenderTitle_Period.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TElectricityIndicationSenderTitle_Period.Destroy;
begin
  inherited Destroy;
end;

  {  TElectricityIndicationSenderTitle_Indications  }
procedure TElectricityIndicationSenderTitle_Indications.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Indication', 'Indication', [], '', -1, -1);
end;

procedure TElectricityIndicationSenderTitle_Indications.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FIndication:=TElectricityIndicationSenderTitle_Indications_Indication.Create;
end;

destructor TElectricityIndicationSenderTitle_Indications.Destroy;
begin
  FIndication.Free;
  inherited Destroy;
end;

  {  TElectricityIndicationSenderTitle_Indications_Indication  }
procedure TElectricityIndicationSenderTitle_Indications_Indication.SetId(AValue: Tstring36);
begin
  FId:=AValue;
  CheckStrMinSize('Id', AValue);
  CheckStrMaxSize('Id', AValue);
  ModifiedProperty('Id');
end;

procedure TElectricityIndicationSenderTitle_Indications_Indication.SetCode(AValue: Tstring10);
begin
  FCode:=AValue;
  CheckStrMinSize('Code', AValue);
  CheckStrMaxSize('Code', AValue);
  ModifiedProperty('Code');
end;

procedure TElectricityIndicationSenderTitle_Indications_Indication.SetNewIndication(AValue: TnewIndications);
begin
  FNewIndication:=AValue;
  CheckStrMaxSize('NewIndication', AValue);
  ModifiedProperty('NewIndication');
end;

procedure TElectricityIndicationSenderTitle_Indications_Indication.SetRegistrationPointName(AValue: Tstring100);
begin
  FRegistrationPointName:=AValue;
  CheckStrMinSize('RegistrationPointName', AValue);
  CheckStrMaxSize('RegistrationPointName', AValue);
  ModifiedProperty('RegistrationPointName');
end;

procedure TElectricityIndicationSenderTitle_Indications_Indication.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('Id', 'Id', [xsaRequared], '', 1, 36);
  P:=RegisterProperty('Code', 'Code', [xsaRequared], '', 1, 10);
  P:=RegisterProperty('NewIndication', 'NewIndication', [xsaRequared], '', -1, 21);
  P:=RegisterProperty('RegistrationPointName', 'RegistrationPointName', [xsaRequared], '', 1, 100);
end;

procedure TElectricityIndicationSenderTitle_Indications_Indication.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TElectricityIndicationSenderTitle_Indications_Indication.Destroy;
begin
  inherited Destroy;
end;

  {  TElectricityIndicationSenderTitle_Signer  }
procedure TElectricityIndicationSenderTitle_Signer.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('SignerDetails', 'SignerDetails', [], '', -1, -1);
  P:=RegisterProperty('SignerReference', 'SignerReference', [], '', -1, -1);
end;

procedure TElectricityIndicationSenderTitle_Signer.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSignerDetails:=TElectricityIndicationSenderTitle_Signer_SignerDetails.Create;
  FSignerReference:=TElectricityIndicationSenderTitle_Signer_SignerReference.Create;
end;

destructor TElectricityIndicationSenderTitle_Signer.Destroy;
begin
  FSignerDetails.Free;
  FSignerReference.Free;
  inherited Destroy;
end;

  {  TElectricityIndicationSenderTitle_Signer_SignerDetails  }
procedure TElectricityIndicationSenderTitle_Signer_SignerDetails.SetLastName(AValue: Tstring60);
begin
  FLastName:=AValue;
  CheckStrMinSize('LastName', AValue);
  CheckStrMaxSize('LastName', AValue);
  ModifiedProperty('LastName');
end;

procedure TElectricityIndicationSenderTitle_Signer_SignerDetails.SetFirstName(AValue: Tstring60);
begin
  FFirstName:=AValue;
  CheckStrMinSize('FirstName', AValue);
  CheckStrMaxSize('FirstName', AValue);
  ModifiedProperty('FirstName');
end;

procedure TElectricityIndicationSenderTitle_Signer_SignerDetails.SetMiddleName(AValue: Tstring60);
begin
  FMiddleName:=AValue;
  CheckStrMinSize('MiddleName', AValue);
  CheckStrMaxSize('MiddleName', AValue);
  ModifiedProperty('MiddleName');
end;

procedure TElectricityIndicationSenderTitle_Signer_SignerDetails.SetPosition(AValue: String);
begin
  FPosition:=AValue;
  CheckStrMinSize('Position', AValue);
  CheckStrMaxSize('Position', AValue);
  ModifiedProperty('Position');
end;

procedure TElectricityIndicationSenderTitle_Signer_SignerDetails.SetInn(AValue: String);
begin
  FInn:=AValue;
  CheckStrMinSize('Inn', AValue);
  CheckStrMaxSize('Inn', AValue);
  ModifiedProperty('Inn');
end;

procedure TElectricityIndicationSenderTitle_Signer_SignerDetails.SetSoleProprietorRegistrationCertificate(AValue: Tstring100);
begin
  FSoleProprietorRegistrationCertificate:=AValue;
  CheckStrMinSize('SoleProprietorRegistrationCertificate', AValue);
  CheckStrMaxSize('SoleProprietorRegistrationCertificate', AValue);
  ModifiedProperty('SoleProprietorRegistrationCertificate');
end;

procedure TElectricityIndicationSenderTitle_Signer_SignerDetails.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('LastName', 'LastName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('FirstName', 'FirstName', [xsaRequared], '', 1, 60);
  P:=RegisterProperty('MiddleName', 'MiddleName', [], '', 1, 60);
  P:=RegisterProperty('Position', 'Position', [], '', 0, 128);
  P:=RegisterProperty('Inn', 'Inn', [xsaRequared], '', 10, 12);
  P:=RegisterProperty('SoleProprietorRegistrationCertificate', 'SoleProprietorRegistrationCertificate', [], '', 1, 100);
end;

procedure TElectricityIndicationSenderTitle_Signer_SignerDetails.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TElectricityIndicationSenderTitle_Signer_SignerDetails.Destroy;
begin
  inherited Destroy;
end;

  {  TElectricityIndicationSenderTitle_Signer_SignerReference  }
procedure TElectricityIndicationSenderTitle_Signer_SignerReference.SetCertificateBytes(AValue: String);
begin
  FCertificateBytes:=AValue;
  ModifiedProperty('CertificateBytes');
end;

procedure TElectricityIndicationSenderTitle_Signer_SignerReference.SetCertificateThumbprint(AValue: Tstring100);
begin
  FCertificateThumbprint:=AValue;
  CheckStrMinSize('CertificateThumbprint', AValue);
  CheckStrMaxSize('CertificateThumbprint', AValue);
  ModifiedProperty('CertificateThumbprint');
end;

procedure TElectricityIndicationSenderTitle_Signer_SignerReference.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('CertificateBytes', 'CertificateBytes', [], '', -1, -1);
  P:=RegisterProperty('CertificateThumbprint', 'CertificateThumbprint', [], '', 1, 100);
end;

procedure TElectricityIndicationSenderTitle_Signer_SignerReference.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TElectricityIndicationSenderTitle_Signer_SignerReference.Destroy;
begin
  inherited Destroy;
end;

end.