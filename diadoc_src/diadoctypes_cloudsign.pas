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

unit DiadocTypes_CloudSign;

{$I diadoc_define.inc}

interface

//import "Content_v2.proto";
uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc,
  DiadocTypes_Content_v2;

type
  {  TCloudSignFile  }
  //message CloudSignFile {
  //        optional Content_v2 Content = 1;
  //        optional string FileName = 2;
  //}
  TCloudSignFile = class(TSerializationObject)
  private
    FContent: TContent_v2;
    FFileName: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Content:TContent_v2 read FContent; //1;
    property FileName:string read FFileName write FFileName; //2;
  end;
  TCloudSignFiles = specialize GSerializationObjectList<TCloudSignFile>;

  {  TCloudSignRequest  }
  //message CloudSignRequest {
  //        repeated CloudSignFile Files = 1;
  //}
  TCloudSignRequest = class(TSerializationObject)
  private
    FFiles: TCloudSignFiles;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Files:TCloudSignFiles read FFiles;//1;
  end;


  {  TCloudSignResult  }
  //message CloudSignResult {
  //        optional string Token = 1;
  //}
  TCloudSignResult = class(TSerializationObject)
  private
    FToken: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Token:string read FToken write FToken;//1;
  end;

  {  TCloudSignConfirmResult  }
  //message CloudSignConfirmResult {
  //        repeated Content_v2 Signatures = 1;
  //}
  TCloudSignConfirmResult = class(TSerializationObject)
  private
    FSignatures: TContent_v2s;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Signatures:TContent_v2s read FSignatures; //1;
  end;


  {  TAutosignReceiptsResult  }
  //message AutosignReceiptsResult {
  //        required int64 SignedReceiptsCount = 1;
  //        required string NextBatchKey = 2;
  //}
  TAutosignReceiptsResult = class(TSerializationObject)
  private
    FNextBatchKey: string;
    FSignedReceiptsCount: int64;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property SignedReceiptsCount:int64 read FSignedReceiptsCount write FSignedReceiptsCount;//1;
    property NextBatchKey:string read FNextBatchKey write FNextBatchKey;//2;
  end;


implementation

{ TAutosignReceiptsResult }

procedure TAutosignReceiptsResult.InternalInit;
begin
  inherited InternalInit;
end;

procedure TAutosignReceiptsResult.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignedReceiptsCount', 1, true);
  RegisterProp('NextBatchKey', 2, true);
end;

destructor TAutosignReceiptsResult.Destroy;
begin
  inherited Destroy;
end;

{ TCloudSignConfirmResult }

procedure TCloudSignConfirmResult.InternalInit;
begin
  inherited InternalInit;
  FSignatures:=TContent_v2s.Create;
end;

procedure TCloudSignConfirmResult.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Signatures', 1);
end;

destructor TCloudSignConfirmResult.Destroy;
begin
  FreeAndNil(FSignatures);
  inherited Destroy;
end;

{ TCloudSignResult }

procedure TCloudSignResult.InternalInit;
begin
  inherited InternalInit;
end;

procedure TCloudSignResult.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Token', 1);
end;

destructor TCloudSignResult.Destroy;
begin
  inherited Destroy;
end;

{ TCloudSignRequest }

procedure TCloudSignRequest.InternalInit;
begin
  inherited InternalInit;
  FFiles:=TCloudSignFiles.Create;
end;

procedure TCloudSignRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Files', 1);
end;

destructor TCloudSignRequest.Destroy;
begin
  FreeAndNil(FFiles);
  inherited Destroy;
end;

{ TCloudSignFile }

procedure TCloudSignFile.InternalInit;
begin
  inherited InternalInit;
  FContent:=TContent_v2.Create;
end;

procedure TCloudSignFile.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Content', 1);
  RegisterProp('FileName', 2);
end;

destructor TCloudSignFile.Destroy;
begin
  FreeAndNil(FContent);
  inherited Destroy;
end;

end.

