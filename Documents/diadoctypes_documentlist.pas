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

unit DiadocTypes_DocumentList;

{$I diadoc_define.inc}

interface

//import "Documents/Document.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_Document;

type
  { TDocumentList }
  //message DocumentList {
  //      required int32 TotalCount = 1;
  //      repeated Document Documents = 2;
  //      optional bool HasMoreResults = 3;
  //}
  TDocumentList = class(TSerializationObject)
  private
    FDocuments: TDocuments;
    FHasMoreResults: Boolean;
    FTotalCount: int32;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property TotalCount:int32 read FTotalCount write FTotalCount; //= 1;
    property Documents:TDocuments read FDocuments; //= 2;
    property HasMoreResults:Boolean read FHasMoreResults write FHasMoreResults;//3;
  end;

implementation

{ TDocumentList }

procedure TDocumentList.InternalInit;
begin
  inherited InternalInit;
  FDocuments:=TDocuments.Create;
end;

procedure TDocumentList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TotalCount', 1); //1;
  RegisterProp('Documents', 2, false, TDocument); //2;
  RegisterProp('HasMoreResults', 3); //3
end;

destructor TDocumentList.Destroy;
begin
  FreeAndNil(FDocuments);
  inherited Destroy;
end;

end.

