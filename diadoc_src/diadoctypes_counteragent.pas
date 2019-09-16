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

unit DiadocTypes_Counteragent;

{$I diadoc_define.inc}

interface

//import "Organization.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_Organization,
  DiadocTypes_DocumentId;

type
  TCounteragentStatus = (
    UnknownCounteragentStatus = 0,
    IsMyCounteragent = 1,
    InvitesMe = 2,
    IsInvitedByMe = 3,
    RejectsMe = 5,
    IsRejectedByMe = 6,
    NotInCounteragentList = 7
  );

  { TCertificate }
  //message Certificate {
  //	required bytes RawCertificateData = 1;
  //}
  TCertificate = class(TSerializationObject) //message Certificate
  private
    FData: TBytes;
    procedure SetData(AValue: TBytes);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property RawCertificateData:TBytes read FData write SetData; //1
  end;
  TCertificates = specialize GSerializationObjectList<TCertificate>;

  { TCounteragentCertificateList }
  //message CounteragentCertificateList {
  //	repeated Certificate Certificates = 1;
  //}
  TCounteragentCertificateList = class(TSerializationObject) //message CounteragentCertificateList
  private
    FCertificates: TCertificates;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Certificates:TCertificates read FCertificates; //1;
  end;


  {  TCounteragent  }
  //message Counteragent {
  //	optional string IndexKey = 1;
  //	required Organization Organization = 2;
  //	optional CounteragentStatus CurrentStatus = 3 [default = UnknownCounteragentStatus];
  //	required sfixed64 LastEventTimestampTicks = 4;
  //	optional string MessageFromCounteragent = 6;
  //	optional string MessageToCounteragent = 7;
  //    optional DocumentId InvitationDocumentId = 8;
  //}
  TCounteragent = class(TSerializationObject)
  private
    FCurrentStatus: TCounteragentStatus;
    FIndexKey: string;
    FInvitationDocumentId: TDocumentId;
    FLastEventTimestampTicks: sfixed64;
    FMessageFromCounteragent: string;
    FMessageToCounteragent: string;
    FOrganization: TOrganization;
    procedure SetCurrentStatus(AValue: TCounteragentStatus);
    procedure SetIndexKey(AValue: string);
    procedure SetLastEventTimestampTicks(AValue: sfixed64);
    procedure SetMessageFromCounteragent(AValue: string);
    procedure SetMessageToCounteragent(AValue: string);
    procedure SetOrganization(AValue: TOrganization);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property IndexKey:string read FIndexKey write SetIndexKey; // = 1;
    property Organization:TOrganization read FOrganization write SetOrganization; //= 2;
    property CurrentStatus:TCounteragentStatus read FCurrentStatus write SetCurrentStatus; //= 3 [default = UnknownCounteragentStatus];
    property LastEventTimestampTicks:sfixed64 read FLastEventTimestampTicks write SetLastEventTimestampTicks; // = 4;
    property MessageFromCounteragent:string read FMessageFromCounteragent write SetMessageFromCounteragent;// = 6;
    property MessageToCounteragent:string read FMessageToCounteragent write SetMessageToCounteragent;// = 7;
    property InvitationDocumentId:TDocumentId read FInvitationDocumentId;//8;
  end;
  TCounteragents = specialize GSerializationObjectList<TCounteragent>;

  { TCounteragentList }
  //message CounteragentList {
  //	required int32 TotalCount = 1;
  //	repeated Counteragent Counteragents = 2;
  //}
  TCounteragentList = class(TSerializationObject)
  private
    FCounteragents: TCounteragents;
    FTotalCount: Int32;
    procedure SetTotalCount(AValue: Int32);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property TotalCount:Int32 read FTotalCount write SetTotalCount;
    property Counteragents:TCounteragents read FCounteragents;
  end;

function CounteragentStatusToStr(AStatus:TCounteragentStatus):string;
implementation
function CounteragentStatusToStr(AStatus:TCounteragentStatus):string;
begin
  case AStatus of
    UnknownCounteragentStatus:Result:='UnknownCounteragentStatus';
    IsMyCounteragent:Result:='IsMyCounteragent';
    InvitesMe:Result:='InvitesMe';
    IsInvitedByMe:Result:='IsInvitedByMe';
    RejectsMe:Result:='RejectsMe';
    IsRejectedByMe:Result:='IsRejectedByMe';
    NotInCounteragentList:Result:='NotInCounteragentList';
  else
    Result:='';
  end;
end;

{ TCertificate }

procedure TCertificate.SetData(AValue: TBytes);
begin
  if FData=AValue then Exit;
  FData:=AValue;
  Modified(1);
end;

procedure TCertificate.InternalInit;
begin
  inherited InternalInit;
end;

procedure TCertificate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RawCertificateData', 1);
end;

destructor TCertificate.Destroy;
begin
  inherited Destroy;
end;

{ TCounteragentCertificateList }

procedure TCounteragentCertificateList.InternalInit;
begin
  inherited InternalInit;
  FCertificates:=TCertificates.Create;
end;

procedure TCounteragentCertificateList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Certificates', 1);
end;

destructor TCounteragentCertificateList.Destroy;
begin
  FreeAndNil(FCertificates);
  inherited Destroy;
end;

{ TCounteragent }

procedure TCounteragent.SetCurrentStatus(AValue: TCounteragentStatus);
begin
  if FCurrentStatus=AValue then Exit;
  FCurrentStatus:=AValue;
  Modified(3);
end;

procedure TCounteragent.SetIndexKey(AValue: string);
begin
  if FIndexKey=AValue then Exit;
  FIndexKey:=AValue;
  Modified(1);
end;

procedure TCounteragent.SetLastEventTimestampTicks(AValue: sfixed64);
begin
  if FLastEventTimestampTicks=AValue then Exit;
  FLastEventTimestampTicks:=AValue;
  Modified(4);
end;

procedure TCounteragent.SetMessageFromCounteragent(AValue: string);
begin
  if FMessageFromCounteragent=AValue then Exit;
  FMessageFromCounteragent:=AValue;
  Modified(6);
end;

procedure TCounteragent.SetMessageToCounteragent(AValue: string);
begin
  if FMessageToCounteragent=AValue then Exit;
  FMessageToCounteragent:=AValue;
  Modified(7);
end;

procedure TCounteragent.SetOrganization(AValue: TOrganization);
begin
  if FOrganization=AValue then Exit;
  FOrganization:=AValue;
  Modified(2);
end;

procedure TCounteragent.InternalInit;
begin
  inherited InternalInit;
  FOrganization:=TOrganization.Create;
  FCurrentStatus:=UnknownCounteragentStatus;
  FInvitationDocumentId:=TDocumentId.Create;
end;

procedure TCounteragent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IndexKey', 1);
  RegisterProp('Organization', 2, false, TOrganization);
  RegisterProp('CurrentStatus', 3);
  RegisterProp('LastEventTimestampTicks', 4);
  RegisterProp('MessageFromCounteragent', 6);
  RegisterProp('MessageToCounteragent', 7);
  RegisterProp('InvitationDocumentId', 8);
end;

destructor TCounteragent.Destroy;
begin
  if Assigned(FOrganization) then
    FreeAndNil(FOrganization);

  FreeAndNil(FInvitationDocumentId);
  inherited Destroy;
end;

{ TCounteragentList }

procedure TCounteragentList.SetTotalCount(AValue: Int32);
begin
  if FTotalCount=AValue then Exit;
  FTotalCount:=AValue;
  Modified(1);
end;

procedure TCounteragentList.InternalInit;
begin
  inherited InternalInit;
  FCounteragents:=TCounteragents.Create;
end;

procedure TCounteragentList.InternalRegisterProperty;
begin
  RegisterProp('TotalCount', 1);
  RegisterProp('Counteragents', 2, false, TCounteragent);
end;

destructor TCounteragentList.Destroy;
begin
  FreeAndNil(FCounteragents);
  inherited Destroy;
end;
end.

