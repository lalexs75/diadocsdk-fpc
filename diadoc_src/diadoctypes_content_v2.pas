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

unit DiadocTypes_Content_v2;

{$I diadoc_define.inc}

interface

//import "DocumentId.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_DocumentId;

type
  {  TContent_v2  }
  //message Content_v2 {
	 // optional bytes Content = 1;
	 // optional string NameOnShelf = 2;
	 // optional string PatchedContentId = 3;
	 // optional DocumentIdEx DocumentId = 4;
  //}
  TContent_v2 = class(TSerializationObject)
  private
    FContent: TBytes;
    FDocumentId: TDocumentIdEx;
    FNameOnShelf: string;
    FPatchedContentId: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Content:TBytes read FContent write FContent; //1;
    property NameOnShelf:string read FNameOnShelf write FNameOnShelf; //2;
    property PatchedContentId:string read FPatchedContentId write FPatchedContentId; //3;
    property DocumentId:TDocumentIdEx read FDocumentId; //4;
  end;
  TContent_v2s = specialize GSerializationObjectList<TContent_v2>;

implementation

{ TContent_v2 }

procedure TContent_v2.InternalInit;
begin
  inherited InternalInit;
  FDocumentId:=TDocumentIdEx.Create;
end;

procedure TContent_v2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Content', 1);
  RegisterProp('NameOnShelf', 2);
  RegisterProp('PatchedContentId', 3);
  RegisterProp('DocumentId', 4);
end;

destructor TContent_v2.Destroy;
begin
  FreeAndNil(FDocumentId);
  inherited Destroy;
end;

end.

