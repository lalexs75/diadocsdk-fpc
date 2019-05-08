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

unit DiadocTypes_Signer;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc;

type

  { TSignerDetails }
  //message SignerDetails {
  //	required string Surname = 1;
  //	required string FirstName = 2;
  //	optional string Patronymic = 3;
  //	optional string JobTitle = 4;
  //	optional string Inn = 5;
  //	optional string SoleProprietorRegistrationCertificate = 6;
  //}
  TSignerDetails = class(TSerializationObject) //message SignerDetails
  private
    FFirstName: string;
    FInn: string;
    FJobTitle: string;
    FPatronymic: string;
    FSoleProprietorRegistrationCertificate: string;
    FSurname: string;
    procedure SetFirstName(AValue: string);
    procedure SetInn(AValue: string);
    procedure SetJobTitle(AValue: string);
    procedure SetPatronymic(AValue: string);
    procedure SetSoleProprietorRegistrationCertificate(AValue: string);
    procedure SetSurname(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Surname:string read FSurname write SetSurname; //1;
    property FirstName:string read FFirstName write SetFirstName; //2;
    property Patronymic:string read FPatronymic write SetPatronymic; //3;
    property JobTitle:string read FJobTitle write SetJobTitle; //4;
    property Inn:string read FInn write SetInn; //5;
    property SoleProprietorRegistrationCertificate:string read FSoleProprietorRegistrationCertificate write SetSoleProprietorRegistrationCertificate; //6;
  end;

  {  TSigner  }
  //message Signer {
  //	optional bytes SignerCertificate = 1;
  //	optional SignerDetails SignerDetails = 2;
  //	optional string SignerCertificateThumbprint = 3;
  //}
  TSigner = class(TSerializationObject) //message Signer
  private
    FSignerCertificate: TBytes;
    FSignerCertificateThumbprint: string;
    FSignerDetails: TSignerDetails;
    procedure SetSignerCertificate(AValue: TBytes);
    procedure SetSignerCertificateThumbprint(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignerCertificate:TBytes read FSignerCertificate write SetSignerCertificate; //1;
    property SignerDetails:TSignerDetails read FSignerDetails; //2;
    property SignerCertificateThumbprint:string read FSignerCertificateThumbprint write SetSignerCertificateThumbprint; //3;
  end;

implementation

{ TSigner }

procedure TSigner.SetSignerCertificate(AValue: TBytes);
begin
  if FSignerCertificate=AValue then Exit;
  FSignerCertificate:=AValue;
  Modified(1);
end;

procedure TSigner.SetSignerCertificateThumbprint(AValue: string);
begin
  if FSignerCertificateThumbprint=AValue then Exit;
  FSignerCertificateThumbprint:=AValue;
  Modified(3);
end;

procedure TSigner.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignerCertificate', 1);
  RegisterProp('SignerDetails', 2);
  RegisterProp('SignerCertificateThumbprint', 3);
end;

procedure TSigner.InternalInit;
begin
  inherited InternalInit;
  FSignerDetails:=TSignerDetails.Create;
end;

destructor TSigner.Destroy;
begin
  FreeAndNil(FSignerDetails);
  inherited Destroy;
end;

{ TSignerDetails }

procedure TSignerDetails.SetFirstName(AValue: string);
begin
  if FFirstName=AValue then Exit;
  FFirstName:=AValue;
  Modified(2);
end;

procedure TSignerDetails.SetInn(AValue: string);
begin
  if FInn=AValue then Exit;
  FInn:=AValue;
  Modified(5);
end;

procedure TSignerDetails.SetJobTitle(AValue: string);
begin
  if FJobTitle=AValue then Exit;
  FJobTitle:=AValue;
  Modified(4);
end;

procedure TSignerDetails.SetPatronymic(AValue: string);
begin
  if FPatronymic=AValue then Exit;
  FPatronymic:=AValue;
  Modified(3);
end;

procedure TSignerDetails.SetSoleProprietorRegistrationCertificate(AValue: string
  );
begin
  if FSoleProprietorRegistrationCertificate=AValue then Exit;
  FSoleProprietorRegistrationCertificate:=AValue;
  Modified(6);
end;

procedure TSignerDetails.SetSurname(AValue: string);
begin
  if FSurname=AValue then Exit;
  FSurname:=AValue;
  Modified(1);
end;

procedure TSignerDetails.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Surname', 1, true);
  RegisterProp('FirstName', 2, true);
  RegisterProp('Patronymic', 3);
  RegisterProp('JobTitle', 4);
  RegisterProp('Inn', 5);
  RegisterProp('SoleProprietorRegistrationCertificate', 6);
end;

procedure TSignerDetails.InternalInit;
begin
  inherited InternalInit;
end;

destructor TSignerDetails.Destroy;
begin
  inherited Destroy;
end;

end.

