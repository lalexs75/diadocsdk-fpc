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

unit DiadocTypes_ResolutionRequestInfo;

{$I diadoc_define.inc}

interface

//import "ResolutionTarget.proto";
uses
  Classes, SysUtils, protobuf_fpc, protobuf_fpc_types, DiadocTypes_ResolutionRequestType,
  DiadocTypes_ResolutionTarget, ResolutionAction;

type
  {  TResolutionRequestInfo  }
  //message ResolutionRequestInfo {
  //	optional ResolutionRequestType RequestType = 1 [default = UnknownResolutionRequestType];
  //	required string Author = 2;
  //	optional ResolutionTarget Target = 3;
  //	optional string ResolvedWith = 4;
  //    repeated ResolutionAction Actions = 5;
  //}
  TResolutionRequestInfo = class(TSerializationObject) //message ResolutionRequestInfo
  private
    FActions: TResolutionActions;
    FAuthor: string;
    FRequestType: TResolutionRequestType;
    FResolvedWith: string;
    FTarget: TResolutionTarget;
    procedure SetAuthor(AValue: string);
    procedure SetRequestType(AValue: TResolutionRequestType);
    procedure SetResolvedWith(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property RequestType:TResolutionRequestType read FRequestType write SetRequestType default UnknownResolutionRequestType; //1
    property Author:string read FAuthor write SetAuthor; //2
    property Target:TResolutionTarget read FTarget; //3;
    property ResolvedWith:string read FResolvedWith write SetResolvedWith; //4;
    property Actions:TResolutionActions read FActions write FActions;
  end;

implementation

{ TResolutionRequestInfo }

procedure TResolutionRequestInfo.SetAuthor(AValue: string);
begin
  if FAuthor=AValue then Exit;
  FAuthor:=AValue;
  Modified(2);
end;

procedure TResolutionRequestInfo.SetRequestType(AValue: TResolutionRequestType);
begin
  FRequestType:=AValue;
  Modified(1);
end;

procedure TResolutionRequestInfo.SetResolvedWith(AValue: string);
begin
  if FResolvedWith=AValue then Exit;
  FResolvedWith:=AValue;
  Modified(4);
end;

procedure TResolutionRequestInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('RequestType', 1) ;
  RegisterProp('Author', 2, true);
  RegisterProp('Target', 3);
  RegisterProp('ResolvedWith', 4);
end;

procedure TResolutionRequestInfo.InternalInit;
begin
  inherited InternalInit;
  FRequestType:=UnknownResolutionRequestType;
  FTarget:=TResolutionTarget.Create;
end;

destructor TResolutionRequestInfo.Destroy;
begin
  FreeAndNil(FTarget);
  inherited Destroy;
end;
end.

