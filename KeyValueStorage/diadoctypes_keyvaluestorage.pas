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

unit DiadocTypes_KeyValueStorage;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc_types,
  protobuf_fpc,
  diadoc_simple_arrays;

type
  {  TKeyValueStorageEntry }
  ///////////////////////////////////////////////////////////////////////////////
  // Протобуфер для представления записи хранилища, то есть пары (ключ, значение)
  // Пара (ключ, значение) для хранения в хранилище
  //message KeyValueStorageEntry {
  //        required string Key = 1;
  //        required string Value = 2;
  //}
  TKeyValueStorageEntry = class(TSerializationObject)
  private
    FKey: string;
    FValue: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Key:string read FKey write FKey;//1;
    property Value:string read FValue write FValue;//2;
  end;
  TKeyValueStorageEntrys = specialize GSerializationObjectList<TKeyValueStorageEntry>;

  {  TKeyValueStorageApiGetRequest  }
  ///////////////////////////////////////////////////////////////////////////////
  // Протобуферы для читающих методов API по работе с хранилищем неструктурированных данных (KeyValueStorage):
  //	Get(KeyValueStorageApiGetRequest request) : KeyValueStorageApiGetResponse
  //message KeyValueStorageApiGetRequest {
  //        repeated string Keys = 1;
  //}
  TKeyValueStorageApiGetRequest = class(TSerializationObject)
  private
    FKeys: TDocumentStrings;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Keys:TDocumentStrings read FKeys;//1;
  end;

  {  TKeyValueStorageApiGetResponse  }
  //message KeyValueStorageApiGetResponse {
  //        repeated KeyValueStorageEntry Entries = 1;
  //}
  TKeyValueStorageApiGetResponse = class(TSerializationObject)
  private
    FEntries: TKeyValueStorageEntrys;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Entries:TKeyValueStorageEntrys read FEntries; //1;
  end;

  {  TKeyValueStorageApiPutRequest  }
  ///////////////////////////////////////////////////////////////////////////////
  // Протобуферы для пишущих методов API по работе с хранилищем неструктурированных данных (KeyValueStorage):
  //	Put(KeyValueStorageApiPutRequest request)
  //message KeyValueStorageApiPutRequest {
  //        repeated KeyValueStorageEntry Entries = 1;
  //}
  TKeyValueStorageApiPutRequest = class(TSerializationObject)
  private
    FEntries: TKeyValueStorageEntrys;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Entries:TKeyValueStorageEntrys read FEntries; //1;
  end;

implementation

{ TKeyValueStorageApiPutRequest }

procedure TKeyValueStorageApiPutRequest.InternalInit;
begin
  inherited InternalInit;
  FEntries:=TKeyValueStorageEntrys.Create;
end;

procedure TKeyValueStorageApiPutRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Entries', 1);
end;

destructor TKeyValueStorageApiPutRequest.Destroy;
begin
  FreeAndNil(FEntries);
  inherited Destroy;
end;

{ TKeyValueStorageApiGetResponse }

procedure TKeyValueStorageApiGetResponse.InternalInit;
begin
  inherited InternalInit;
  FEntries:=TKeyValueStorageEntrys.Create;
end;

procedure TKeyValueStorageApiGetResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Entries', 1);
end;

destructor TKeyValueStorageApiGetResponse.Destroy;
begin
  FreeAndNil(FEntries);
  inherited Destroy;
end;

{ TKeyValueStorageApiGetRequest }

procedure TKeyValueStorageApiGetRequest.InternalInit;
begin
  inherited InternalInit;
  FKeys:=TDocumentStrings.Create;
end;

procedure TKeyValueStorageApiGetRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Keys', 1);
end;

destructor TKeyValueStorageApiGetRequest.Destroy;
begin
  FreeAndNil(FKeys);
  inherited Destroy;
end;

{ TKeyValueStorageEntry }

procedure TKeyValueStorageEntry.InternalInit;
begin
  inherited InternalInit;
end;

procedure TKeyValueStorageEntry.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Key', 1);
  RegisterProp('Value', 2);
end;

destructor TKeyValueStorageEntry.Destroy;
begin
  inherited Destroy;
end;

end.

