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

unit DiadocTypes_Counteragent;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_Organization, DiadocTypes_DocumentId, TotalCountType;

type

  { CounteragentStatus } 
  //enum CounteragentStatus {
  //	UnknownCounteragentStatus = 0;
  //	IsMyCounteragent = 1;
  //	InvitesMe = 2;
  //	IsInvitedByMe = 3;
  //	RejectsMe = 5;
  //	IsRejectedByMe = 6;
  //	NotInCounteragentList = 7;
  //}
  TCounteragentStatus = (
    UnknownCounteragentStatus = 0,
    IsMyCounteragent = 1,
    InvitesMe = 2,
    IsInvitedByMe = 3,
    RejectsMe = 5,
    IsRejectedByMe = 6,
    NotInCounteragentList = 7
  );
  TCounteragentStatusArray = array of TCounteragentStatus;

  TCounteragentList = class;
  TCounteragentLists = specialize GSerializationObjectList<TCounteragentList>;
  TCounteragent = class;
  TCounteragents = specialize GSerializationObjectList<TCounteragent>;
  TCounteragentCertificateList = class;
  TCounteragentCertificateLists = specialize GSerializationObjectList<TCounteragentCertificateList>;
  TCertificate = class;
  TCertificates = specialize GSerializationObjectList<TCertificate>;

  { CounteragentList } 
  //message CounteragentList {
  //	required int32 TotalCount = 1;
  //	repeated Counteragent Counteragents = 2;
  //	required TotalCountType TotalCountType = 3;
  //}
  TCounteragentList = class(TSerializationObject)
  private
    FTotalCount:Integer;
    FCounteragents:TCounteragents;
    FTotalCountType:TTotalCountType;
    procedure SetTotalCount(AValue:Integer);
    function GetTotalCountType:TTotalCountType;
    procedure SetTotalCountType(AValue:TTotalCountType);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
    property TotalCountType:TTotalCountType read GetTotalCountType write SetTotalCountType;
  published
    property TotalCount:Integer read FTotalCount write SetTotalCount;
    property Counteragents:TCounteragents read FCounteragents;
  end;

  { Counteragent } 
  //message Counteragent {
  //	optional string IndexKey = 1;
  //	required Organization Organization = 2;
  //	optional CounteragentStatus CurrentStatus = 3 [default = UnknownCounteragentStatus];
  //	required sfixed64 LastEventTimestampTicks = 4;
  //	optional string MessageFromCounteragent = 6;
  //	optional string MessageToCounteragent = 7;
  //	optional DocumentId InvitationDocumentId = 8;
  //}
  TCounteragent = class(TSerializationObject)
  private
    FIndexKey:String;
    FOrganization:TOrganization;
    FCurrentStatus:TCounteragentStatus;
    FLastEventTimestampTicks:sfixed64;
    FMessageFromCounteragent:String;
    FMessageToCounteragent:String;
    FInvitationDocumentId:TDocumentId;
    procedure SetIndexKey(AValue:String);
    function GetCurrentStatus:TCounteragentStatus;
    procedure SetCurrentStatus(AValue:TCounteragentStatus);
    procedure SetLastEventTimestampTicks(AValue:sfixed64);
    procedure SetMessageFromCounteragent(AValue:String);
    procedure SetMessageToCounteragent(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
    property CurrentStatus:TCounteragentStatus read GetCurrentStatus write SetCurrentStatus default UnknownCounteragentStatus;
  published
    property IndexKey:String read FIndexKey write SetIndexKey;
    property Organization:TOrganization read FOrganization;
    property LastEventTimestampTicks:sfixed64 read FLastEventTimestampTicks write SetLastEventTimestampTicks;
    property MessageFromCounteragent:String read FMessageFromCounteragent write SetMessageFromCounteragent;
    property MessageToCounteragent:String read FMessageToCounteragent write SetMessageToCounteragent;
    property InvitationDocumentId:TDocumentId read FInvitationDocumentId;
  end;

  { CounteragentCertificateList } 
  //message CounteragentCertificateList {
  //	repeated Certificate Certificates = 1;
  //}
  TCounteragentCertificateList = class(TSerializationObject)
  private
    FCertificates:TCertificates;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Certificates:TCertificates read FCertificates;
  end;

  { Certificate } 
  //message Certificate {
  //	required bytes RawCertificateData = 1;
  //}
  TCertificate = class(TSerializationObject)
  private
    FRawCertificateData:TBytes;
    procedure SetRawCertificateData(AValue:TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property RawCertificateData:TBytes read FRawCertificateData write SetRawCertificateData;
  end;

implementation

  { CounteragentList } 

procedure TCounteragentList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TotalCount', 1, true);
  RegisterProp('Counteragents', 2);
  RegisterPropPublic('TotalCountType', 3, TMethod(@SetTotalCountType), TMethod(@GetTotalCountType), true);
end;

procedure TCounteragentList.InternalInit;
begin
  inherited InternalInit;
  FCounteragents:= TCounteragents.Create;
end;

destructor TCounteragentList.Destroy;
begin
  FCounteragents.Free;
  inherited Destroy;
end;

procedure TCounteragentList.SetTotalCount(AValue:Integer);
begin
  FTotalCount:=AValue;
  Modified(1);
end;

procedure TCounteragentList.SetTotalCountType(AValue:TTotalCountType);
begin
  FTotalCountType:=AValue;
  Modified(3);
end;

function TCounteragentList.GetTotalCountType:TTotalCountType;
begin
  Result:=FTotalCountType;
end;

  { Counteragent } 

procedure TCounteragent.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IndexKey', 1);
  RegisterProp('Organization', 2, true);
  RegisterPropPublic('CurrentStatus', 3, TMethod(@SetCurrentStatus), TMethod(@GetCurrentStatus));
  RegisterProp('LastEventTimestampTicks', 4, true);
  RegisterProp('MessageFromCounteragent', 6);
  RegisterProp('MessageToCounteragent', 7);
  RegisterProp('InvitationDocumentId', 8);
end;

procedure TCounteragent.InternalInit;
begin
  inherited InternalInit;
  FOrganization:= TOrganization.Create;
  FInvitationDocumentId:= TDocumentId.Create;

  CurrentStatus:= UnknownCounteragentStatus;
end;

destructor TCounteragent.Destroy;
begin
  FOrganization.Free;
  FInvitationDocumentId.Free;
  inherited Destroy;
end;

procedure TCounteragent.SetIndexKey(AValue:String);
begin
  FIndexKey:=AValue;
  Modified(1);
end;

procedure TCounteragent.SetCurrentStatus(AValue:TCounteragentStatus);
begin
  FCurrentStatus:=AValue;
  Modified(3);
end;

function TCounteragent.GetCurrentStatus:TCounteragentStatus;
begin
  Result:=FCurrentStatus;
end;
procedure TCounteragent.SetLastEventTimestampTicks(AValue:sfixed64);
begin
  FLastEventTimestampTicks:=AValue;
  Modified(4);
end;

procedure TCounteragent.SetMessageFromCounteragent(AValue:String);
begin
  FMessageFromCounteragent:=AValue;
  Modified(6);
end;

procedure TCounteragent.SetMessageToCounteragent(AValue:String);
begin
  FMessageToCounteragent:=AValue;
  Modified(7);
end;


  { CounteragentCertificateList } 

procedure TCounteragentCertificateList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Certificates', 1);
end;

procedure TCounteragentCertificateList.InternalInit;
begin
  inherited InternalInit;
  FCertificates:= TCertificates.Create;
end;

destructor TCounteragentCertificateList.Destroy;
begin
  FCertificates.Free;
  inherited Destroy;
end;


  { Certificate } 

procedure TCertificate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RawCertificateData', 1, true);
end;

procedure TCertificate.InternalInit;
begin
  inherited InternalInit;
end;

destructor TCertificate.Destroy;
begin
  inherited Destroy;
end;

procedure TCertificate.SetRawCertificateData(AValue:TBytes);
begin
  FRawCertificateData:=AValue;
  Modified(1);
end;

end.
