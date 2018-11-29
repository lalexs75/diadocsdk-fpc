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

unit DiadocTypes_DocumentsMoveOperation;

{$I diadoc_define.inc}

interface

//import "DocumentId.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_DocumentId;

type

  {  TDocumentsMoveOperation  }
  //message DocumentsMoveOperation
  //{
  //      required string BoxId = 1;
  //      optional string ToDepartmentId = 2;
  //      repeated DocumentId DocumentIds = 3;
  //}
  TDocumentsMoveOperation = class(TSerializationObject)
  private
    FBoxId: string;
    FDocumentIds: TDocumentIds;
    FToDepartmentId: string;
    procedure SetBoxId(AValue: string);
    procedure SetToDepartmentId(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write SetBoxId;//1;
    property ToDepartmentId:string read FToDepartmentId write SetToDepartmentId;//2;
    property DocumentIds:TDocumentIds read FDocumentIds;//3;
  end;

implementation

{ TDocumentsMoveOperation }

procedure TDocumentsMoveOperation.SetBoxId(AValue: string);
begin
  if FBoxId=AValue then Exit;
  FBoxId:=AValue;
  Modified(1);
end;

procedure TDocumentsMoveOperation.SetToDepartmentId(AValue: string);
begin
  if FToDepartmentId=AValue then Exit;
  FToDepartmentId:=AValue;
  Modified(2);
end;

procedure TDocumentsMoveOperation.InternalInit;
begin
  inherited InternalInit;
  FDocumentIds:=TDocumentIds.Create;
end;

procedure TDocumentsMoveOperation.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1, true);
  RegisterProp('ToDepartmentId', 2);
  RegisterProp('DocumentIds', 3);
end;

destructor TDocumentsMoveOperation.Destroy;
begin
  FreeAndNil(FDocumentIds);
  inherited Destroy;
end;

end.

