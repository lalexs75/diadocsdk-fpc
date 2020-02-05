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

unit DiadocTypes_SignatureInfo;

{$I diadoc_define.inc}

interface

//import "SignatureVerificationResult.proto";
//import "Timestamp.proto";
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_SignatureVerificationResult,
  DiadocTypes_Timestamp
  ;

type

  {  TSignatureInfo  }
  //message SignatureInfo
  //{
  //        required Timestamp SigningTime = 1; //Время фомирования подписи
  //        optional Timestamp SignatureVerificationTime = 2; //Дата проверки подписи
  //        optional SignatureVerificationResult SignatureVerificationResult = 3; //Результат проверки подписи
  //        required string Thumbprint = 4;   //Отпечаток сертификата
  //        required string SerialNumber = 5; //Серийный номер
  //        optional string Issuer = 6;       //Кем выдан
  //        optional string StartDate = 7;    //Дата начала действия
  //        optional string EndDate = 8;      //Дата окончания действия
  //        optional string OrgName = 9;      //Организация-наименование
  //        optional string OrgInn = 10;       //Организация-ИНН
  //        optional string JobTitle = 11;    //Должность
  //        optional string FirstName = 12;   //Имя-отчество
  //        optional string Surname = 13;     //Фамилия
  //        optional string Snils = 14;       //СНИЛС
  //        optional string Email = 15;       //Email
  //}
  TSignatureInfo = class(TSerializationObject) //message SignatureInfo
  private
    FEmail: string;
    FEndDate: string;
    FFirstName: string;
    FIssuer: string;
    FJobTitle: string;
    FOrgInn: string;
    FOrgName: string;
    FSerialNumber: string;
    FSignatureVerificationResult: TSignatureVerificationResult;
    FSignatureVerificationTime: TTimestamp;
    FSigningTime: TTimestamp;
    FSnils: string;
    FStartDate: string;
    FSurname: string;
    FThumbprint: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property SigningTime:TTimestamp read FSigningTime; //1;
    property SignatureVerificationTime:TTimestamp read FSignatureVerificationTime; //2;
    property SignatureVerificationResult:TSignatureVerificationResult read FSignatureVerificationResult; //3;
    property Thumbprint:string read FThumbprint write FThumbprint; //4;
    property SerialNumber:string read FSerialNumber write FSerialNumber; //5; /
    property Issuer:string read FIssuer write FIssuer; //6;
    property StartDate:string read FStartDate write FStartDate; //7;
    property EndDate:string read FEndDate write FEndDate; //8;
    property OrgName:string read FOrgName write FOrgName; //9;
    property OrgInn:string read FOrgInn write FOrgInn; //10;
    property JobTitle:string read FJobTitle write FJobTitle; //11;
    property FirstName:string read FFirstName write FFirstName; //12;
    property Surname:string read FSurname write FSurname; //13;
    property Snils:string read FSnils write FSnils; //14;
    property Email:string read FEmail write FEmail; //15;
  end;

implementation

{ TSignatureInfo }

procedure TSignatureInfo.InternalInit;
begin
  inherited InternalInit;
  FSigningTime:=TTimestamp.Create;
  FSignatureVerificationTime:=TTimestamp.Create;
  FSignatureVerificationResult:=TSignatureVerificationResult.Create;
end;

procedure TSignatureInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SigningTime', 1, true);
  RegisterProp('SignatureVerificationTime', 2);
  RegisterProp('SignatureVerificationResult', 3);
  RegisterProp('Thumbprint', 4, true);
  RegisterProp('SerialNumber', 5, true);
  RegisterProp('Issuer', 6);
  RegisterProp('StartDate', 7);
  RegisterProp('EndDate', 8);
  RegisterProp('OrgName', 9);
  RegisterProp('OrgInn', 10);
  RegisterProp('JobTitle', 11);
  RegisterProp('FirstName', 12);
  RegisterProp('Surname', 13);
  RegisterProp('Snils', 14);
  RegisterProp('Email', 15);
end;

destructor TSignatureInfo.Destroy;
begin
  FreeAndNil(FSigningTime);
  FreeAndNil(FSignatureVerificationTime);
  FreeAndNil(FSignatureVerificationResult);
  inherited Destroy;
end;

end.

