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

unit DiadocTypes_GetOrganizationsByInnList;

{$I diadoc_define.inc}

interface

//import "Organization.proto";
//import "Counteragent.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc, diadoc_simple_arrays,
  DiadocTypes_Organization,
  DiadocTypes_Counteragent,
  DiadocTypes_DocumentId
  ;

type
  {  TOrganizationWithCounteragentStatus  }
  //message OrganizationWithCounteragentStatus {
  //        required Organization Organization = 1;
  //        optional CounteragentStatus CounteragentStatus = 2 [default = UnknownCounteragentStatus];
  //        optional sfixed64 LastEventTimestampTicks = 3;
  //        optional string MessageFromCounteragent = 4;
  //        optional string MessageToCounteragent = 5;
  //        optional DocumentId InvitationDocumentId = 6;
  //}
  TOrganizationWithCounteragentStatus = class(TSerializationObject)
  private
    FCounteragentStatus: TCounteragentStatus;
    FInvitationDocumentId: TDocumentId;
    FLastEventTimestampTicks: sfixed64;
    FMessageFromCounteragent: string;
    FMessageToCounteragent: string;
    FOrganization: TOrganization;
    function GetCounteragentStatus: TCounteragentStatus;
    procedure SetCounteragentStatus(AValue: TCounteragentStatus);
    procedure SetMessageFromCounteragent(AValue: string);
    procedure SetMessageToCounteragent(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
    property CounteragentStatus:TCounteragentStatus read GetCounteragentStatus write SetCounteragentStatus;//2
  published
    property Organization:TOrganization read FOrganization; //1;
    property LastEventTimestampTicks:sfixed64 read FLastEventTimestampTicks write FLastEventTimestampTicks;//3;
    property MessageFromCounteragent:string read FMessageFromCounteragent write SetMessageFromCounteragent; //4;
    property MessageToCounteragent:string read FMessageToCounteragent write SetMessageToCounteragent;//5;
    property InvitationDocumentId:TDocumentId read FInvitationDocumentId; // 6;
  end;
  TOrganizationWithCounteragentStatuss = specialize GSerializationObjectList<TOrganizationWithCounteragentStatus>;

  {  TGetOrganizationsByInnListResponse  }
  //message GetOrganizationsByInnListResponse {
  //      repeated OrganizationWithCounteragentStatus Organizations = 1;
  //}
  TGetOrganizationsByInnListResponse = class(TSerializationObject)
  private
    FOrganizations: TOrganizationWithCounteragentStatuss;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Organizations:TOrganizationWithCounteragentStatuss read FOrganizations; //1;
  end;


  {  TGetOrganizationsByInnListRequest  }
  //message GetOrganizationsByInnListRequest {
  //     repeated string InnList = 1;
  //}
  TGetOrganizationsByInnListRequest = class(TSerializationObject)
  private
    FInnList: TDocumentStrings;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property InnList:TDocumentStrings read FInnList; //1;
  end;

implementation

{ TGetOrganizationsByInnListRequest }

procedure TGetOrganizationsByInnListRequest.InternalInit;
begin
  inherited InternalInit;
  FInnList:=TDocumentStrings.Create;
end;

procedure TGetOrganizationsByInnListRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('InnList', 1);
end;

destructor TGetOrganizationsByInnListRequest.Destroy;
begin
  FreeAndNil(FInnList);
  inherited Destroy;
end;

{ TGetOrganizationsByInnListResponse }

procedure TGetOrganizationsByInnListResponse.InternalInit;
begin
  inherited InternalInit;
  FOrganizations:=TOrganizationWithCounteragentStatuss.Create;
end;

procedure TGetOrganizationsByInnListResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Organizations', 1);
end;

destructor TGetOrganizationsByInnListResponse.Destroy;
begin
  FreeAndNil(FOrganizations);
  inherited Destroy;
end;

{ TOrganizationWithCounteragentStatus }

procedure TOrganizationWithCounteragentStatus.SetMessageFromCounteragent(
  AValue: string);
begin
  if FMessageFromCounteragent=AValue then Exit;
  FMessageFromCounteragent:=AValue;
  Modified(4);
end;

function TOrganizationWithCounteragentStatus.GetCounteragentStatus: TCounteragentStatus;
begin
  Result:=FCounteragentStatus;
end;

procedure TOrganizationWithCounteragentStatus.SetCounteragentStatus(
  AValue: TCounteragentStatus);
begin
  Modified(2);
end;

procedure TOrganizationWithCounteragentStatus.SetMessageToCounteragent(
  AValue: string);
begin
  if FMessageToCounteragent=AValue then Exit;
  FMessageToCounteragent:=AValue;
  Modified(5);
end;

procedure TOrganizationWithCounteragentStatus.InternalInit;
begin
  inherited InternalInit;
  FOrganization:=TOrganization.Create;
  FInvitationDocumentId:=TDocumentId.Create;
end;

procedure TOrganizationWithCounteragentStatus.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Organization', 1, true);
  RegisterPropPublic('CounteragentStatus', 2, TMethod(@SetCounteragentStatus), TMethod(@GetCounteragentStatus));
  RegisterProp('LastEventTimestampTicks', 3);
  RegisterProp('MessageFromCounteragent', 4);
  RegisterProp('MessageToCounteragent', 5);
  RegisterProp('InvitationDocumentId', 6);
end;

destructor TOrganizationWithCounteragentStatus.Destroy;
begin
  FreeAndNil(FOrganization);
  FreeAndNil(FInvitationDocumentId);
  inherited Destroy;
end;

end.

