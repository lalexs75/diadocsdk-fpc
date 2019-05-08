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

unit DiadocTypes_RegistrationRequest;

interface

uses Classes, SysUtils, types, protobuf_fpc;

type

  { RegistrationStatus } 
  //enum RegistrationStatus {
  //    Unknown = 0;
  //    AccessIsDenied = 1;
  //    AccessRequestIsRejected = 2;
  //    CertificateOwnershipProofIsRequired = 3;
  //    CertificateIsNotQualified = 4;
  //    RegistrationIsCompleted = 5;
  //    RegistrationIsInProgress = 6;
  //    RegistrationInBranchIsForbidden = 7;
  //    AccessRequestIsPending = 8;
  //    OrganizationNotFound = 9;
  //}
  TRegistrationStatus = (
    Unknown = 0,
    AccessIsDenied = 1,
    AccessRequestIsRejected = 2,
    CertificateOwnershipProofIsRequired = 3,
    CertificateIsNotQualified = 4,
    RegistrationIsCompleted = 5,
    RegistrationIsInProgress = 6,
    RegistrationInBranchIsForbidden = 7,
    AccessRequestIsPending = 8,
    OrganizationNotFound = 9
  );

  TRegistrationRequest = class;
  TRegistrationResponse = class;
  TRegistrationConfirmRequest = class;

  { RegistrationRequest } 
  //message RegistrationRequest {
  //    optional bytes CertificateContent = 1;
  //    optional string Thumbprint = 2;
  //}
  TRegistrationRequest = class(TSerializationObject)
  private
    FCertificateContent:TBytes;
    FThumbprint:String;
    procedure SetCertificateContent(AValue:TBytes);
    procedure SetThumbprint(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property CertificateContent:TBytes read FCertificateContent write SetCertificateContent;
    property Thumbprint:String read FThumbprint write SetThumbprint;
  end;
  TRegistrationRequests = specialize GSerializationObjectList<TRegistrationRequest>;

  { RegistrationResponse } 
  //message RegistrationResponse {
  //    required RegistrationStatus RegistrationStatus = 1;
  //    optional string BoxId = 2;
  //    optional bytes DataToSign = 3;
  //}
  TRegistrationResponse = class(TSerializationObject)
  private
    FRegistrationStatus:TRegistrationStatus;
    FBoxId:String;
    FDataToSign:TBytes;
    procedure SetRegistrationStatus(AValue:TRegistrationStatus);
    procedure SetBoxId(AValue:String);
    procedure SetDataToSign(AValue:TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property RegistrationStatus:TRegistrationStatus read FRegistrationStatus write SetRegistrationStatus;
    property BoxId:String read FBoxId write SetBoxId;
    property DataToSign:TBytes read FDataToSign write SetDataToSign;
  end;
  TRegistrationResponses = specialize GSerializationObjectList<TRegistrationResponse>;

  { RegistrationConfirmRequest } 
  //message RegistrationConfirmRequest {
  //    optional bytes CertificateContent = 1;
  //    optional string Thumbprint = 2;
  //    required bytes DataToSign  = 3;
  //    required bytes Signature = 4;
  //}
  TRegistrationConfirmRequest = class(TSerializationObject)
  private
    FCertificateContent:TBytes;
    FThumbprint:String;
    FDataToSign:TBytes;
    FSignature:TBytes;
    procedure SetCertificateContent(AValue:TBytes);
    procedure SetThumbprint(AValue:String);
    procedure SetDataToSign(AValue:TBytes);
    procedure SetSignature(AValue:TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property CertificateContent:TBytes read FCertificateContent write SetCertificateContent;
    property Thumbprint:String read FThumbprint write SetThumbprint;
    property DataToSign:TBytes read FDataToSign write SetDataToSign;
    property Signature:TBytes read FSignature write SetSignature;
  end;
  TRegistrationConfirmRequests = specialize GSerializationObjectList<TRegistrationConfirmRequest>;

implementation

  { RegistrationRequest } 

procedure TRegistrationRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('CertificateContent', 1);
  RegisterProp('Thumbprint', 2);
end;

procedure TRegistrationRequest.InternalInit;
begin
  inherited InternalInit;
end;

destructor TRegistrationRequest.Destroy;
begin
  inherited Destroy;
end;

procedure TRegistrationRequest.SetCertificateContent(AValue:TBytes);
begin
  FCertificateContent:=AValue;
  Modified(1);
end;

procedure TRegistrationRequest.SetThumbprint(AValue:String);
begin
  FThumbprint:=AValue;
  Modified(2);
end;


  { RegistrationResponse } 

procedure TRegistrationResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RegistrationStatus', 1, true);
  RegisterProp('BoxId', 2);
  RegisterProp('DataToSign', 3);
end;

procedure TRegistrationResponse.InternalInit;
begin
  inherited InternalInit;
end;

destructor TRegistrationResponse.Destroy;
begin
  inherited Destroy;
end;

procedure TRegistrationResponse.SetRegistrationStatus(AValue:TRegistrationStatus);
begin
  FRegistrationStatus:=AValue;
  Modified(1);
end;

procedure TRegistrationResponse.SetBoxId(AValue:String);
begin
  FBoxId:=AValue;
  Modified(2);
end;

procedure TRegistrationResponse.SetDataToSign(AValue:TBytes);
begin
  FDataToSign:=AValue;
  Modified(3);
end;


  { RegistrationConfirmRequest } 

procedure TRegistrationConfirmRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('CertificateContent', 1);
  RegisterProp('Thumbprint', 2);
  RegisterProp('DataToSign', 3, true);
  RegisterProp('Signature', 4, true);
end;

procedure TRegistrationConfirmRequest.InternalInit;
begin
  inherited InternalInit;
end;

destructor TRegistrationConfirmRequest.Destroy;
begin
  inherited Destroy;
end;

procedure TRegistrationConfirmRequest.SetCertificateContent(AValue:TBytes);
begin
  FCertificateContent:=AValue;
  Modified(1);
end;

procedure TRegistrationConfirmRequest.SetThumbprint(AValue:String);
begin
  FThumbprint:=AValue;
  Modified(2);
end;

procedure TRegistrationConfirmRequest.SetDataToSign(AValue:TBytes);
begin
  FDataToSign:=AValue;
  Modified(3);
end;

procedure TRegistrationConfirmRequest.SetSignature(AValue:TBytes);
begin
  FSignature:=AValue;
  Modified(4);
end;

end.
