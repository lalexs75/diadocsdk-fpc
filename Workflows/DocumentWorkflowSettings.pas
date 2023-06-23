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

unit DocumentWorkflowSettings;

interface

uses Classes, SysUtils, types, protobuf_fpc, ParticipantType, ParticipantAction, TitleReceiptBehavior, OperatorConfirmationBehavior, OperatorConfirmationReceiptBehavior, ReceiptOperatorConfirmationReceiptBehavior, AmendmentRequestResponseBehavior, InvitationBehavior, RoamingConfirmationBehavior;

type

  TDocumentWorkflowSettingsList = class;
  TDocumentWorkflowSettingsLists = specialize GSerializationObjectList<TDocumentWorkflowSettingsList>;
  TDocumentWorkflowSettings = class;
  TDocumentWorkflowSettingss = specialize GSerializationObjectList<TDocumentWorkflowSettings>;
  TParticipantSetting = class;
  TParticipantSettings = specialize GSerializationObjectList<TParticipantSetting>;

  { DocumentWorkflowSettingsList } 
  //message DocumentWorkflowSettingsList {
  //	repeated DocumentWorkflowSettings DocumentWorkflowSettings = 1;
  //}
  TDocumentWorkflowSettingsList = class(TSerializationObject)
  private
    FDocumentWorkflowSettings:TDocumentWorkflowSettingss;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentWorkflowSettings:TDocumentWorkflowSettingss read FDocumentWorkflowSettings;
  end;

  { DocumentWorkflowSettings } 
  //message DocumentWorkflowSettings {
  //    required int32 Id = 1;
  //    repeated ParticipantSetting Participants = 2;
  //    optional OperatorConfirmationReceiptBehavior.OperatorConfirmationReceiptBehavior OperatorConfirmationReceiptBehavior = 3 [default = Unknown];
  //    optional ReceiptOperatorConfirmationReceiptBehavior.ReceiptOperatorConfirmationReceiptBehavior ReceiptOperatorConfirmationReceiptBehavior = 4 [default = Unknown];
  //    optional OperatorConfirmationBehavior.OperatorConfirmationBehavior ReceiptOperatorConfirmationBehavior = 5 [default = Unknown];
  //    optional AmendmentRequestResponseBehavior.AmendmentRequestResponseBehavior AmendmentRequestResponseBehavior = 6 [default = Unknown];
  //    optional OperatorConfirmationBehavior.OperatorConfirmationBehavior AmendmentRequestOperatorConfirmationBehavior = 7 [default = Unknown];
  //    optional RoamingConfirmationBehavior.RoamingConfirmationBehavior ReceiptRoamingConfirmationBehavior = 8 [default = Unknown];
  //    optional RoamingConfirmationBehavior.RoamingConfirmationBehavior AmendmentRequestRoamingConfirmationBehavior = 9 [default = Unknown];
  //    optional InvitationBehavior.InvitationBehavior InvitationBehavior = 10 [default = Unknown];
  //}
  TDocumentWorkflowSettings = class(TSerializationObject)
  private
    FId:Integer;
    FParticipants:TParticipantSettings;
    FOperatorConfirmationReceiptBehavior:OperatorConfirmationReceiptBehavior.TOperatorConfirmationReceiptBehavior;
    FReceiptOperatorConfirmationReceiptBehavior:ReceiptOperatorConfirmationReceiptBehavior.TReceiptOperatorConfirmationReceiptBehavior;
    FReceiptOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior;
    FAmendmentRequestResponseBehavior:AmendmentRequestResponseBehavior.TAmendmentRequestResponseBehavior;
    FAmendmentRequestOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior;
    FReceiptRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior;
    FAmendmentRequestRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior;
    FInvitationBehavior:InvitationBehavior.TInvitationBehavior;
    procedure SetId(AValue:Integer);
    function GetOperatorConfirmationReceiptBehavior:OperatorConfirmationReceiptBehavior.TOperatorConfirmationReceiptBehavior;
    procedure SetOperatorConfirmationReceiptBehavior(AValue:OperatorConfirmationReceiptBehavior.TOperatorConfirmationReceiptBehavior);
    function GetReceiptOperatorConfirmationReceiptBehavior:ReceiptOperatorConfirmationReceiptBehavior.TReceiptOperatorConfirmationReceiptBehavior;
    procedure SetReceiptOperatorConfirmationReceiptBehavior(AValue:ReceiptOperatorConfirmationReceiptBehavior.TReceiptOperatorConfirmationReceiptBehavior);
    function GetReceiptOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior;
    procedure SetReceiptOperatorConfirmationBehavior(AValue:OperatorConfirmationBehavior.TOperatorConfirmationBehavior);
    function GetAmendmentRequestResponseBehavior:AmendmentRequestResponseBehavior.TAmendmentRequestResponseBehavior;
    procedure SetAmendmentRequestResponseBehavior(AValue:AmendmentRequestResponseBehavior.TAmendmentRequestResponseBehavior);
    function GetAmendmentRequestOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior;
    procedure SetAmendmentRequestOperatorConfirmationBehavior(AValue:OperatorConfirmationBehavior.TOperatorConfirmationBehavior);
    function GetReceiptRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior;
    procedure SetReceiptRoamingConfirmationBehavior(AValue:RoamingConfirmationBehavior.TRoamingConfirmationBehavior);
    function GetAmendmentRequestRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior;
    procedure SetAmendmentRequestRoamingConfirmationBehavior(AValue:RoamingConfirmationBehavior.TRoamingConfirmationBehavior);
    function GetInvitationBehavior:InvitationBehavior.TInvitationBehavior;
    procedure SetInvitationBehavior(AValue:InvitationBehavior.TInvitationBehavior);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
    property OperatorConfirmationReceiptBehavior:OperatorConfirmationReceiptBehavior.TOperatorConfirmationReceiptBehavior read GetOperatorConfirmationReceiptBehavior write SetOperatorConfirmationReceiptBehavior default TOperatorConfirmationReceiptBehavior.Unknown;
    property ReceiptOperatorConfirmationReceiptBehavior:ReceiptOperatorConfirmationReceiptBehavior.TReceiptOperatorConfirmationReceiptBehavior read GetReceiptOperatorConfirmationReceiptBehavior write SetReceiptOperatorConfirmationReceiptBehavior default TReceiptOperatorConfirmationReceiptBehavior.Unknown;
    property ReceiptOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior read GetReceiptOperatorConfirmationBehavior write SetReceiptOperatorConfirmationBehavior default TOperatorConfirmationBehavior.Unknown;
    property AmendmentRequestResponseBehavior:AmendmentRequestResponseBehavior.TAmendmentRequestResponseBehavior read GetAmendmentRequestResponseBehavior write SetAmendmentRequestResponseBehavior default TAmendmentRequestResponseBehavior.Unknown;
    property AmendmentRequestOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior read GetAmendmentRequestOperatorConfirmationBehavior write SetAmendmentRequestOperatorConfirmationBehavior default TOperatorConfirmationBehavior.Unknown;
    property ReceiptRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior read GetReceiptRoamingConfirmationBehavior write SetReceiptRoamingConfirmationBehavior default TRoamingConfirmationBehavior.Unknown;
    property AmendmentRequestRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior read GetAmendmentRequestRoamingConfirmationBehavior write SetAmendmentRequestRoamingConfirmationBehavior default TRoamingConfirmationBehavior.Unknown;
    property InvitationBehavior:InvitationBehavior.TInvitationBehavior read GetInvitationBehavior write SetInvitationBehavior default TInvitationBehavior.Unknown;
  published
    property Id:Integer read FId write SetId;
    property Participants:TParticipantSettings read FParticipants;
  end;

  { ParticipantSetting } 
  //message ParticipantSetting {
  //    optional ParticipantType.ParticipantType Participant = 1 [default = Unknown];
  //    optional ParticipantAction.ParticipantAction ParticipantAction = 2 [default = Unknown];
  //    optional TitleReceiptBehavior.TitleReceiptBehavior TitleReceiptBehavior = 3 [default = Unknown];
  //    optional OperatorConfirmationBehavior.OperatorConfirmationBehavior OperatorConfirmationBehavior = 4 [default = Unknown];
  //    optional RoamingConfirmationBehavior.RoamingConfirmationBehavior RoamingConfirmationBehavior = 5 [default = Unknown];
  //}
  TParticipantSetting = class(TSerializationObject)
  private
    FParticipant:ParticipantType.TParticipantType;
    FParticipantAction:ParticipantAction.TParticipantAction;
    FTitleReceiptBehavior:TitleReceiptBehavior.TTitleReceiptBehavior;
    FOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior;
    FRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior;
    function GetParticipant:ParticipantType.TParticipantType;
    procedure SetParticipant(AValue:ParticipantType.TParticipantType);
    function GetParticipantAction:ParticipantAction.TParticipantAction;
    procedure SetParticipantAction(AValue:ParticipantAction.TParticipantAction);
    function GetTitleReceiptBehavior:TitleReceiptBehavior.TTitleReceiptBehavior;
    procedure SetTitleReceiptBehavior(AValue:TitleReceiptBehavior.TTitleReceiptBehavior);
    function GetOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior;
    procedure SetOperatorConfirmationBehavior(AValue:OperatorConfirmationBehavior.TOperatorConfirmationBehavior);
    function GetRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior;
    procedure SetRoamingConfirmationBehavior(AValue:RoamingConfirmationBehavior.TRoamingConfirmationBehavior);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
    property Participant:ParticipantType.TParticipantType read GetParticipant write SetParticipant default TParticipantType.Unknown;
    property ParticipantAction:ParticipantAction.TParticipantAction read GetParticipantAction write SetParticipantAction default TParticipantAction.Unknown;
    property TitleReceiptBehavior:TitleReceiptBehavior.TTitleReceiptBehavior read GetTitleReceiptBehavior write SetTitleReceiptBehavior default TTitleReceiptBehavior.Unknown;
    property OperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior read GetOperatorConfirmationBehavior write SetOperatorConfirmationBehavior default TOperatorConfirmationBehavior.Unknown;
    property RoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior read GetRoamingConfirmationBehavior write SetRoamingConfirmationBehavior default TRoamingConfirmationBehavior.Unknown;
  published
  end;

implementation

  { DocumentWorkflowSettingsList } 

procedure TDocumentWorkflowSettingsList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentWorkflowSettings', 1);
end;

procedure TDocumentWorkflowSettingsList.InternalInit;
begin
  inherited InternalInit;
  FDocumentWorkflowSettings:= TDocumentWorkflowSettingss.Create;
end;

destructor TDocumentWorkflowSettingsList.Destroy;
begin
  FDocumentWorkflowSettings.Free;
  inherited Destroy;
end;


  { DocumentWorkflowSettings } 

procedure TDocumentWorkflowSettings.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Id', 1, true);
  RegisterProp('Participants', 2);
  RegisterPropPublic('OperatorConfirmationReceiptBehavior', 3, TMethod(@SetOperatorConfirmationReceiptBehavior), TMethod(@GetOperatorConfirmationReceiptBehavior));
  RegisterPropPublic('ReceiptOperatorConfirmationReceiptBehavior', 4, TMethod(@SetReceiptOperatorConfirmationReceiptBehavior), TMethod(@GetReceiptOperatorConfirmationReceiptBehavior));
  RegisterPropPublic('ReceiptOperatorConfirmationBehavior', 5, TMethod(@SetReceiptOperatorConfirmationBehavior), TMethod(@GetReceiptOperatorConfirmationBehavior));
  RegisterPropPublic('AmendmentRequestResponseBehavior', 6, TMethod(@SetAmendmentRequestResponseBehavior), TMethod(@GetAmendmentRequestResponseBehavior));
  RegisterPropPublic('AmendmentRequestOperatorConfirmationBehavior', 7, TMethod(@SetAmendmentRequestOperatorConfirmationBehavior), TMethod(@GetAmendmentRequestOperatorConfirmationBehavior));
  RegisterPropPublic('ReceiptRoamingConfirmationBehavior', 8, TMethod(@SetReceiptRoamingConfirmationBehavior), TMethod(@GetReceiptRoamingConfirmationBehavior));
  RegisterPropPublic('AmendmentRequestRoamingConfirmationBehavior', 9, TMethod(@SetAmendmentRequestRoamingConfirmationBehavior), TMethod(@GetAmendmentRequestRoamingConfirmationBehavior));
  RegisterPropPublic('InvitationBehavior', 10, TMethod(@SetInvitationBehavior), TMethod(@GetInvitationBehavior));
end;

procedure TDocumentWorkflowSettings.InternalInit;
begin
  inherited InternalInit;
  FParticipants:= TParticipantSettings.Create;

  OperatorConfirmationReceiptBehavior:= TOperatorConfirmationReceiptBehavior.Unknown;
  ReceiptOperatorConfirmationReceiptBehavior:= TReceiptOperatorConfirmationReceiptBehavior.Unknown;
  ReceiptOperatorConfirmationBehavior:= TOperatorConfirmationBehavior.Unknown;
  AmendmentRequestResponseBehavior:= TAmendmentRequestResponseBehavior.Unknown;
  AmendmentRequestOperatorConfirmationBehavior:= TOperatorConfirmationBehavior.Unknown;
  ReceiptRoamingConfirmationBehavior:= TRoamingConfirmationBehavior.Unknown;
  AmendmentRequestRoamingConfirmationBehavior:= TRoamingConfirmationBehavior.Unknown;
  InvitationBehavior:= TInvitationBehavior.Unknown;
end;

destructor TDocumentWorkflowSettings.Destroy;
begin
  FParticipants.Free;
  inherited Destroy;
end;

procedure TDocumentWorkflowSettings.SetId(AValue:Integer);
begin
  FId:=AValue;
  Modified(1);
end;

procedure TDocumentWorkflowSettings.SetOperatorConfirmationReceiptBehavior(AValue:OperatorConfirmationReceiptBehavior.TOperatorConfirmationReceiptBehavior);
begin
  FOperatorConfirmationReceiptBehavior:=AValue;
  Modified(3);
end;

function TDocumentWorkflowSettings.GetOperatorConfirmationReceiptBehavior:OperatorConfirmationReceiptBehavior.TOperatorConfirmationReceiptBehavior;
begin
  Result:=FOperatorConfirmationReceiptBehavior;
end;
procedure TDocumentWorkflowSettings.SetReceiptOperatorConfirmationReceiptBehavior(AValue:ReceiptOperatorConfirmationReceiptBehavior.TReceiptOperatorConfirmationReceiptBehavior);
begin
  FReceiptOperatorConfirmationReceiptBehavior:=AValue;
  Modified(4);
end;

function TDocumentWorkflowSettings.GetReceiptOperatorConfirmationReceiptBehavior:ReceiptOperatorConfirmationReceiptBehavior.TReceiptOperatorConfirmationReceiptBehavior;
begin
  Result:=FReceiptOperatorConfirmationReceiptBehavior;
end;
procedure TDocumentWorkflowSettings.SetReceiptOperatorConfirmationBehavior(AValue:OperatorConfirmationBehavior.TOperatorConfirmationBehavior);
begin
  FReceiptOperatorConfirmationBehavior:=AValue;
  Modified(5);
end;

function TDocumentWorkflowSettings.GetReceiptOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior;
begin
  Result:=FReceiptOperatorConfirmationBehavior;
end;
procedure TDocumentWorkflowSettings.SetAmendmentRequestResponseBehavior(AValue:AmendmentRequestResponseBehavior.TAmendmentRequestResponseBehavior);
begin
  FAmendmentRequestResponseBehavior:=AValue;
  Modified(6);
end;

function TDocumentWorkflowSettings.GetAmendmentRequestResponseBehavior:AmendmentRequestResponseBehavior.TAmendmentRequestResponseBehavior;
begin
  Result:=FAmendmentRequestResponseBehavior;
end;
procedure TDocumentWorkflowSettings.SetAmendmentRequestOperatorConfirmationBehavior(AValue:OperatorConfirmationBehavior.TOperatorConfirmationBehavior);
begin
  FAmendmentRequestOperatorConfirmationBehavior:=AValue;
  Modified(7);
end;

function TDocumentWorkflowSettings.GetAmendmentRequestOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior;
begin
  Result:=FAmendmentRequestOperatorConfirmationBehavior;
end;
procedure TDocumentWorkflowSettings.SetReceiptRoamingConfirmationBehavior(AValue:RoamingConfirmationBehavior.TRoamingConfirmationBehavior);
begin
  FReceiptRoamingConfirmationBehavior:=AValue;
  Modified(8);
end;

function TDocumentWorkflowSettings.GetReceiptRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior;
begin
  Result:=FReceiptRoamingConfirmationBehavior;
end;
procedure TDocumentWorkflowSettings.SetAmendmentRequestRoamingConfirmationBehavior(AValue:RoamingConfirmationBehavior.TRoamingConfirmationBehavior);
begin
  FAmendmentRequestRoamingConfirmationBehavior:=AValue;
  Modified(9);
end;

function TDocumentWorkflowSettings.GetAmendmentRequestRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior;
begin
  Result:=FAmendmentRequestRoamingConfirmationBehavior;
end;
procedure TDocumentWorkflowSettings.SetInvitationBehavior(AValue:InvitationBehavior.TInvitationBehavior);
begin
  FInvitationBehavior:=AValue;
  Modified(10);
end;

function TDocumentWorkflowSettings.GetInvitationBehavior:InvitationBehavior.TInvitationBehavior;
begin
  Result:=FInvitationBehavior;
end;

  { ParticipantSetting } 

procedure TParticipantSetting.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterPropPublic('Participant', 1, TMethod(@SetParticipant), TMethod(@GetParticipant));
  RegisterPropPublic('ParticipantAction', 2, TMethod(@SetParticipantAction), TMethod(@GetParticipantAction));
  RegisterPropPublic('TitleReceiptBehavior', 3, TMethod(@SetTitleReceiptBehavior), TMethod(@GetTitleReceiptBehavior));
  RegisterPropPublic('OperatorConfirmationBehavior', 4, TMethod(@SetOperatorConfirmationBehavior), TMethod(@GetOperatorConfirmationBehavior));
  RegisterPropPublic('RoamingConfirmationBehavior', 5, TMethod(@SetRoamingConfirmationBehavior), TMethod(@GetRoamingConfirmationBehavior));
end;

procedure TParticipantSetting.InternalInit;
begin
  inherited InternalInit;

  Participant:= TParticipantType.Unknown;
  ParticipantAction:= TParticipantAction.Unknown;
  TitleReceiptBehavior:= TTitleReceiptBehavior.Unknown;
  OperatorConfirmationBehavior:= TOperatorConfirmationBehavior.Unknown;
  RoamingConfirmationBehavior:= TRoamingConfirmationBehavior.Unknown;
end;

destructor TParticipantSetting.Destroy;
begin
  inherited Destroy;
end;

procedure TParticipantSetting.SetParticipant(AValue:ParticipantType.TParticipantType);
begin
  FParticipant:=AValue;
  Modified(1);
end;

function TParticipantSetting.GetParticipant:ParticipantType.TParticipantType;
begin
  Result:=FParticipant;
end;
procedure TParticipantSetting.SetParticipantAction(AValue:ParticipantAction.TParticipantAction);
begin
  FParticipantAction:=AValue;
  Modified(2);
end;

function TParticipantSetting.GetParticipantAction:ParticipantAction.TParticipantAction;
begin
  Result:=FParticipantAction;
end;
procedure TParticipantSetting.SetTitleReceiptBehavior(AValue:TitleReceiptBehavior.TTitleReceiptBehavior);
begin
  FTitleReceiptBehavior:=AValue;
  Modified(3);
end;

function TParticipantSetting.GetTitleReceiptBehavior:TitleReceiptBehavior.TTitleReceiptBehavior;
begin
  Result:=FTitleReceiptBehavior;
end;
procedure TParticipantSetting.SetOperatorConfirmationBehavior(AValue:OperatorConfirmationBehavior.TOperatorConfirmationBehavior);
begin
  FOperatorConfirmationBehavior:=AValue;
  Modified(4);
end;

function TParticipantSetting.GetOperatorConfirmationBehavior:OperatorConfirmationBehavior.TOperatorConfirmationBehavior;
begin
  Result:=FOperatorConfirmationBehavior;
end;
procedure TParticipantSetting.SetRoamingConfirmationBehavior(AValue:RoamingConfirmationBehavior.TRoamingConfirmationBehavior);
begin
  FRoamingConfirmationBehavior:=AValue;
  Modified(5);
end;

function TParticipantSetting.GetRoamingConfirmationBehavior:RoamingConfirmationBehavior.TRoamingConfirmationBehavior;
begin
  Result:=FRoamingConfirmationBehavior;
end;
end.
