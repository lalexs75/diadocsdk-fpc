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

unit DiadocTypes_AcquireCounteragent;

{$I diadoc_define.inc}

interface

//import "Events/DiadocMessage-PostApi.proto";

uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_DiadocMessage_PostApi,
  DiadocTypes_DocumentId;

type

  {  TInvitationDocument  }
  //message InvitationDocument {
  //       required Events.SignedContent SignedContent = 1;
  //       required string FileName = 2;
  //       optional bool SignatureRequested = 3 [default = false];
  //       optional string Type = 4;
  //}
  TInvitationDocument = class(TSerializationObject)
  private
    FDocType: string;
    FFileName: string;
    FSignatureRequested: Boolean;
    FSignedContent: TSignedContent;
    procedure SetDocType(AValue: string);
    procedure SetFileName(AValue: string);
    procedure SetSignatureRequested(AValue: Boolean);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property SignedContent:TSignedContent read FSignedContent; //1;
    property FileName:string read FFileName write SetFileName; //2;
    property SignatureRequested:Boolean read FSignatureRequested write SetSignatureRequested;//3
    property DocType:string read FDocType write SetDocType;//4;
  end;


  {  TAcquireCounteragentResult  }
  //message AcquireCounteragentResult {
  //       required string OrgId = 1;
  //       optional DocumentId InvitationDocumentId = 2;
  //}
  TAcquireCounteragentResult = class(TSerializationObject)
  private
    FInvitationDocumentId: TDocumentId;
    FOrgId: string;
    procedure SetOrgId(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property OrgId:string read FOrgId write SetOrgId;//1;
    property InvitationDocumentId:TDocumentId read FInvitationDocumentId;//2;
  end;

  {  TAcquireCounteragentRequest  }
  //message AcquireCounteragentRequest {
  //       optional string OrgId = 1;
  //       optional string Inn = 2;
  //       optional string MessageToCounteragent = 3;
  //       optional InvitationDocument InvitationDocument = 4;
  //}
  TAcquireCounteragentRequest = class(TSerializationObject)
  private
    FInn: string;
    FInvitationDocument: TInvitationDocument;
    FMessageToCounteragent: string;
    FOrgId: string;
    procedure SetInn(AValue: string);
    procedure SetMessageToCounteragent(AValue: string);
    procedure SetOrgId(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property OrgId:string read FOrgId write SetOrgId;//1;
    property Inn:string read FInn write SetInn;//2;
    property MessageToCounteragent:string read FMessageToCounteragent write SetMessageToCounteragent;//3;
    property InvitationDocument:TInvitationDocument read FInvitationDocument;//4;
  end;

implementation

{ TAcquireCounteragentRequest }

procedure TAcquireCounteragentRequest.SetInn(AValue: string);
begin
  if FInn=AValue then Exit;
  FInn:=AValue;
  Modified(2);
end;

procedure TAcquireCounteragentRequest.SetMessageToCounteragent(AValue: string);
begin
  if FMessageToCounteragent=AValue then Exit;
  FMessageToCounteragent:=AValue;
  Modified(3);
end;

procedure TAcquireCounteragentRequest.SetOrgId(AValue: string);
begin
  if FOrgId=AValue then Exit;
  FOrgId:=AValue;
  Modified(1);
end;

procedure TAcquireCounteragentRequest.InternalInit;
begin
  inherited InternalInit;
  FInvitationDocument:=TInvitationDocument.Create;
end;

procedure TAcquireCounteragentRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('OrgId', 1);
  RegisterProp('Inn', 2);
  RegisterProp('MessageToCounteragent', 3);
  RegisterProp('InvitationDocument', 4);
end;

destructor TAcquireCounteragentRequest.Destroy;
begin
  FreeAndNil(FInvitationDocument);
  inherited Destroy;
end;

{ TAcquireCounteragentResult }

procedure TAcquireCounteragentResult.SetOrgId(AValue: string);
begin
  if FOrgId=AValue then Exit;
  FOrgId:=AValue;
  Modified(1);
end;

procedure TAcquireCounteragentResult.InternalInit;
begin
  inherited InternalInit;
  FInvitationDocumentId:=TDocumentId.Create;
end;

procedure TAcquireCounteragentResult.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('OrgId', 1, true);
  RegisterProp('InvitationDocumentId', 2, false);
end;

destructor TAcquireCounteragentResult.Destroy;
begin
  FreeAndNil(FInvitationDocumentId);
  inherited Destroy;
end;

{ TInvitationDocument }

procedure TInvitationDocument.SetDocType(AValue: string);
begin
  if FDocType=AValue then Exit;
  FDocType:=AValue;
  Modified(4);
end;

procedure TInvitationDocument.SetFileName(AValue: string);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
  Modified(2);
end;

procedure TInvitationDocument.SetSignatureRequested(AValue: Boolean);
begin
  if FSignatureRequested=AValue then Exit;
  FSignatureRequested:=AValue;
  Modified(3);
end;

procedure TInvitationDocument.InternalInit;
begin
  inherited InternalInit;
  FSignedContent:=TSignedContent.Create;
end;

procedure TInvitationDocument.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedContent', 1, true);
  RegisterProp('FileName', 2, true);
  RegisterProp('SignatureRequested', 3);
  RegisterProp('DocType', 4);
end;

destructor TInvitationDocument.Destroy;
begin
  FreeAndNil(FSignedContent);
  inherited Destroy;
end;

end.

