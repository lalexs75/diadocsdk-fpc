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

unit OuterDocflowStatus;

interface

uses Classes, SysUtils, types, protobuf_fpc;

type

  { OuterStatusType } 
  //enum OuterStatusType{
  //    UnknownStatus = 0;
  //    Normal = 1;
  //    Success = 2;
  //    Warning = 3;
  //    Error = 4;
  //}
  TOuterStatusType = (
    UnknownStatus = 0,
    Normal = 1,
    Success = 2,
    Warning = 3,
    Error = 4
  );
  TOuterStatusTypeArray = array of TOuterStatusType;

  TStatus = class;
  TStatuss = specialize GSerializationObjectList<TStatus>;
  TStatusDetail = class;
  TStatusDetails = specialize GSerializationObjectList<TStatusDetail>;

  { Status } 
  //message Status {
  //    required string NamedId = 1;
  //    required string FriendlyName = 2;
  //    required OuterStatusType Type = 3;
  //    optional string Description = 4;
  //    repeated StatusDetail Details = 5;
  //}
  TStatus = class(TSerializationObject)
  private
    FNamedId:String;
    FFriendlyName:String;
    FTypeField:TOuterStatusType;
    FDescription:String;
    FDetails:TStatusDetails;
    procedure SetNamedId(AValue:String);
    procedure SetFriendlyName(AValue:String);
    procedure SetTypeField(AValue:TOuterStatusType);
    procedure SetDescription(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property NamedId:String read FNamedId write SetNamedId;
    property FriendlyName:String read FFriendlyName write SetFriendlyName;
    property TypeField:TOuterStatusType read FTypeField write SetTypeField;
    property Description:String read FDescription write SetDescription;
    property Details:TStatusDetails read FDetails;
  end;

  { StatusDetail } 
  //message StatusDetail{
  //    optional string Code = 1;
  //    optional string Text = 2;
  //}
  TStatusDetail = class(TSerializationObject)
  private
    FCode:String;
    FText:String;
    procedure SetCode(AValue:String);
    procedure SetText(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Code:String read FCode write SetCode;
    property Text:String read FText write SetText;
  end;

implementation

  { Status } 

procedure TStatus.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('NamedId', 1, true);
  RegisterProp('FriendlyName', 2, true);
  RegisterProp('TypeField', 3, true);
  RegisterProp('Description', 4);
  RegisterProp('Details', 5);
end;

procedure TStatus.InternalInit;
begin
  inherited InternalInit;
  FDetails:= TStatusDetails.Create;
end;

destructor TStatus.Destroy;
begin
  FDetails.Free;
  inherited Destroy;
end;

procedure TStatus.SetNamedId(AValue:String);
begin
  FNamedId:=AValue;
  Modified(1);
end;

procedure TStatus.SetFriendlyName(AValue:String);
begin
  FFriendlyName:=AValue;
  Modified(2);
end;

procedure TStatus.SetTypeField(AValue:TOuterStatusType);
begin
  FTypeField:=AValue;
  Modified(3);
end;

procedure TStatus.SetDescription(AValue:String);
begin
  FDescription:=AValue;
  Modified(4);
end;


  { StatusDetail } 

procedure TStatusDetail.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Code', 1);
  RegisterProp('Text', 2);
end;

procedure TStatusDetail.InternalInit;
begin
  inherited InternalInit;
end;

destructor TStatusDetail.Destroy;
begin
  inherited Destroy;
end;

procedure TStatusDetail.SetCode(AValue:String);
begin
  FCode:=AValue;
  Modified(1);
end;

procedure TStatusDetail.SetText(AValue:String);
begin
  FText:=AValue;
  Modified(2);
end;

end.
