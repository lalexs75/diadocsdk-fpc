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
unit DiadocTypes_SignatureVerificationResult;

{$I diadoc_define.inc}

interface

//import "Timestamp.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_Timestamp;

type
  { TCertificateChainElement }
  //message CertificateChainElement
  //{
  //    required int32 CertificateChainStatusFlags = 1; // X509ChainStatusFlags value
  //    required bytes DerCertificate = 2;
  //}
  TCertificateChainElement = class(TSerializationObject) //message CertificateChainElement
  private
    FCertificateChainStatusFlags: Int32;
    FDerCertificate: TBytes;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property CertificateChainStatusFlags:Int32 read FCertificateChainStatusFlags write FCertificateChainStatusFlags; //1;
    property DerCertificate:TBytes read FDerCertificate write FDerCertificate; //2;
  end;


  { TCertificateVerificationResult }
  //message CertificateVerificationResult
  //{
  //        required bool IsValid = 2;
  //        repeated CertificateChainElement CertificateChain = 3; // first element corresponds to signer certificate
  //        required Timestamp VerificationTime = 4;
  //}
  TCertificateVerificationResult = class(TSerializationObject) //message CertificateVerificationResult
  private
    FCertificateChain: TCertificateChainElement;
    FIsValid: Boolean;
    FVerificationTime: TTimestamp;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsValid:Boolean read FIsValid write FIsValid; //2;
    property CertificateChain:TCertificateChainElement read FCertificateChain; //3;
    property VerificationTime:TTimestamp read FVerificationTime; //4;
  end;


  { TSignatureVerificationResult }
  //message SignatureVerificationResult
  //{
  //      required bool IsValid = 1;
  //      optional CertificateVerificationResult CertificateStatus = 2;
  //      optional Timestamp SignatureTimestamp = 3;
  //}
  TSignatureVerificationResult = class(TSerializationObject) //message SignatureVerificationResult
  private
    FCertificateStatus: TCertificateVerificationResult;
    FIsValid: boolean;
    FSignatureTimestamp: TTimestamp;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsValid:boolean read FIsValid write FIsValid; //1;
    property CertificateStatus:TCertificateVerificationResult read FCertificateStatus; //2;
    property SignatureTimestamp:TTimestamp read FSignatureTimestamp; //3;
  end;

implementation

{ TSignatureVerificationResult }

procedure TSignatureVerificationResult.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsValid', 1, true);
  RegisterProp('CertificateStatus', 2);
  RegisterProp('SignatureTimestamp', 3);
end;

procedure TSignatureVerificationResult.InternalInit;
begin
  inherited InternalInit;
  FCertificateStatus:=TCertificateVerificationResult.Create;
  FSignatureTimestamp:=TTimestamp.Create;
end;

destructor TSignatureVerificationResult.Destroy;
begin
  FreeAndNil(FCertificateStatus);
  FreeAndNil(FSignatureTimestamp);
  inherited Destroy;
end;

{ TCertificateVerificationResult }

procedure TCertificateVerificationResult.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsValid', 2, true);
  RegisterProp('CertificateChain', 3);
  RegisterProp('VerificationTime', 4, true);
end;

procedure TCertificateVerificationResult.InternalInit;
begin
  inherited InternalInit;
  FCertificateChain:=TCertificateChainElement.Create;
  FVerificationTime:=TTimestamp.Create;
end;

destructor TCertificateVerificationResult.Destroy;
begin
  FreeAndNil(FCertificateChain);
  FreeAndNil(FVerificationTime);
  inherited Destroy;
end;

{ TCertificateChainElement }

procedure TCertificateChainElement.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('CertificateChainStatusFlags', 1, true);
  RegisterProp('DerCertificate', 2, true);
end;

procedure TCertificateChainElement.InternalInit;
begin
  inherited InternalInit;
end;

destructor TCertificateChainElement.Destroy;
begin
  inherited Destroy;
end;
end.

