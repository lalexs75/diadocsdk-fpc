{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2021 Lagunov Aleksey alexs75@yandex.ru

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

unit DocumentTypeDescription;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_ExtendedSigner;

type

  TDetectedDocumentType = class;
  TDetectedDocumentTypes = specialize GSerializationObjectList<TDetectedDocumentType>;
  TDetectDocumentTypesResponse = class;
  TDetectDocumentTypesResponses = specialize GSerializationObjectList<TDetectDocumentTypesResponse>;

  { DetectedDocumentType } 
  //message DetectedDocumentType {
  //	required string TypeNamedId = 1;
  //	required string Function = 2;
  //	required string Version = 3;
  //}
  TDetectedDocumentType = class(TSerializationObject)
  private
    FTypeNamedId:String;
    FFunctionField:String;
    FVersion:String;
    procedure SetTypeNamedId(AValue:String);
    procedure SetFunctionField(AValue:String);
    procedure SetVersion(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TypeNamedId:String read FTypeNamedId write SetTypeNamedId;
    property FunctionField:String read FFunctionField write SetFunctionField;
    property Version:String read FVersion write SetVersion;
  end;

  { DetectDocumentTypesResponse } 
  //message DetectDocumentTypesResponse {
  //	repeated DetectedDocumentType DocumentTypes = 1;
  //}
  TDetectDocumentTypesResponse = class(TSerializationObject)
  private
    FDocumentTypes:TDetectedDocumentTypes;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentTypes:TDetectedDocumentTypes read FDocumentTypes;
  end;

implementation

  { DetectedDocumentType } 

procedure TDetectedDocumentType.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TypeNamedId', 1, true);
  RegisterProp('FunctionField', 2, true);
  RegisterProp('Version', 3, true);
end;

procedure TDetectedDocumentType.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDetectedDocumentType.Destroy;
begin
  inherited Destroy;
end;

procedure TDetectedDocumentType.SetTypeNamedId(AValue:String);
begin
  FTypeNamedId:=AValue;
  Modified(1);
end;

procedure TDetectedDocumentType.SetFunctionField(AValue:String);
begin
  FFunctionField:=AValue;
  Modified(2);
end;

procedure TDetectedDocumentType.SetVersion(AValue:String);
begin
  FVersion:=AValue;
  Modified(3);
end;


  { DetectDocumentTypesResponse } 

procedure TDetectDocumentTypesResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentTypes', 1);
end;

procedure TDetectDocumentTypesResponse.InternalInit;
begin
  inherited InternalInit;
  FDocumentTypes:= TDetectedDocumentTypes.Create;
end;

destructor TDetectDocumentTypesResponse.Destroy;
begin
  FDocumentTypes.Free;
  inherited Destroy;
end;

end.
