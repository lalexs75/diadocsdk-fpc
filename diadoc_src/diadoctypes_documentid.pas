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

unit DiadocTypes_DocumentId;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc;

type
  { TDocumentId }
  //message DocumentId {
  //	required string MessageId = 1;
  //	required string EntityId = 2;
  //}
  TDocumentId  = class(TSerializationObject)  //message DocumentId
  private
    FEntityId: string;
    FMessageId: string;
    procedure SetEntityId(AValue: string);
    procedure SetMessageId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
  public
  published
    property MessageId:string read FMessageId write SetMessageId; //1
    property EntityId:string read FEntityId write SetEntityId;    //2
  end;
  TDocumentIds = specialize GSerializationObjectList<TDocumentId>;

  { TDocumentIdEx }
  //message DocumentIdEx {
  //	required string MessageId = 1;
  //	required string EntityId = 2;
  //	required string BoxId = 3;
  //}
  TDocumentIdEx  = class(TSerializationObject)  //message DocumentIdEx
  private
    FBoxId: string;
    FEntityId: string;
    FMessageId: string;
    procedure SetBoxId(AValue: string);
    procedure SetEntityId(AValue: string);
    procedure SetMessageId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
  public
  published
    property MessageId:string read FMessageId write SetMessageId; //1;
    property EntityId:string read FEntityId write SetEntityId; //2;
    property BoxId:string read FBoxId write SetBoxId; //3;
  end;
  TDocumentIdExs = specialize GSerializationObjectList<TDocumentIdEx>;

implementation

{ TDocumentIdEx }

procedure TDocumentIdEx.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(3);
end;

procedure TDocumentIdEx.SetEntityId(AValue: string);
begin
  if FEntityId=AValue then Exit;
  FEntityId:=AValue;
  Modified(2);
end;

procedure TDocumentIdEx.SetMessageId(AValue: string);
begin
  if FMessageId=AValue then Exit;
  FMessageId:=AValue;
  Modified(1);
end;

procedure TDocumentIdEx.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('MessageId', 1, true);
  RegisterProp('EntityId', 2, true);
  RegisterProp('BoxId', 3, true);
end;

{ TDocumentId }

procedure TDocumentId.SetEntityId(AValue: string);
begin
  if FEntityId=AValue then Exit;
  FEntityId:=AValue;
  Modified(2);
end;

procedure TDocumentId.SetMessageId(AValue: string);
begin
  if FMessageId=AValue then Exit;
  FMessageId:=AValue;
  Modified(1);
end;

procedure TDocumentId.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('MessageId', 1, true);
  RegisterProp('EntityId', 2, true);
end;

end.

