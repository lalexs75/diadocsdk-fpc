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

unit DssSign;

interface

uses Classes, SysUtils, types, protobuf_fpc, Content_v3;

type

  { DssFileSigningStatus } 
  //%enum DssFileSigningStatus
  //{
  //	UnknownSigningStatus = 0;
  //	SigningCompleted = 1;
  //	SigningError = 2;
  //}
  TDssFileSigningStatus = (
    UnknownSigningStatus = 0,
    SigningCompleted = 1,
    SigningError = 2
  );

  { DssOperationStatus } 
  //%enum DssOperationStatus
  //{
  //	Unknown = 0;
  //	InProgress = 1;
  //	Completed = 2;
  //	CanceledByUser = 3;
  //	Timeout = 4;
  //	Crashed = 5;
  //	UserHasUnconfirmedOperation = 6;
  //    OperationRetryRequired = 7;
  //}
  TDssOperationStatus = (
    Unknown = 0,
    InProgress = 1,
    Completed = 2,
    CanceledByUser = 3,
    Timeout = 4,
    Crashed = 5,
    UserHasUnconfirmedOperation = 6,
    OperationRetryRequired = 7
  );


  //enum DssConfirmType {
  //	ConfirmTypeUnknown = -1;
  //	None = 0;
  //	Sms = 1;
  //	MyDss = 2;
  //	Applet = 3;
  //}
  TDssConfirmType = (
    ConfirmTypeUnknown = -1,
    None = 0,
    Sms = 1,
    MyDss = 2,
    Applet = 3
  );

  //enum DssOperator {
  //	OperatorUnknown = 0;
  //	Megafon = 1;
  //	Kontur = 2;
  //}
  TDssOperator = (
    OperatorUnknown = 0,
    Megafon = 1,
    Kontur = 2
  );


  TDssSignRequest = class;
  TDssSignFile = class;
  TDssSignResult = class;
  TDssFileSigningResult = class;

  { DssSignFile }
  //message DssSignFile
  //{
  //	required Content_v3 Content = 1;
  //	optional string FileName = 2;
  //}
  TDssSignFile = class(TSerializationObject)
  private
    FContent:TContent_v3;
    FFileName:String;
    procedure SetFileName(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Content:TContent_v3 read FContent;
    property FileName:String read FFileName write SetFileName;
  end;
  TDssSignFiles = specialize GSerializationObjectList<TDssSignFile>;

  { DssSignRequest }
  //message DssSignRequest
  //{
  //	repeated DssSignFile Files = 1;
  //}
  TDssSignRequest = class(TSerializationObject)
  private
    FFiles:TDssSignFiles;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Files:TDssSignFiles read FFiles;
  end;
  TDssSignRequests = specialize GSerializationObjectList<TDssSignRequest>;

  { DssFileSigningResult }
  //message DssFileSigningResult
  //{
  //	optional DssFileSigningStatus FileSigningStatus = 1 [default = UnknownSigningStatus];
  //	optional bytes Signature = 2;
  //}
  TDssFileSigningResult = class(TSerializationObject)
  private
    FFileSigningStatus:TDssFileSigningStatus;
    FSignature:TBytes;
    procedure SetFileSigningStatus(AValue:TDssFileSigningStatus);
    procedure SetSignature(AValue:TBytes);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property FileSigningStatus:TDssFileSigningStatus read FFileSigningStatus write SetFileSigningStatus default UnknownSigningStatus;
    property Signature:TBytes read FSignature write SetSignature;
  end;
  TDssFileSigningResults = specialize GSerializationObjectList<TDssFileSigningResult>;

  { DssSignResult }
  //message DssSignResult
  //{
  //	optional DssOperationStatus OperationStatus = 1 [default = Unknown];
  //	repeated DssFileSigningResult FileSigningResults = 2;
  //    optional DssConfirmType ConfirmType = 3 [default = ConfirmTypeUnknown];
  //    optional DssOperator Operator = 4 [default = OperatorUnknown];
  //    optional string PhoneLastNumbers = 5;
  //}

  { TDssSignResult }

  TDssSignResult = class(TSerializationObject)
  private
    FAOperator: TDssOperator;
    FConfirmType: TDssConfirmType;
    FOperationStatus:TDssOperationStatus;
    FFileSigningResults:TDssFileSigningResults;
    FPhoneLastNumbers: string;
    procedure SetAOperator(AValue: TDssOperator);
    procedure SetConfirmType(AValue: TDssConfirmType);
    procedure SetOperationStatus(AValue:TDssOperationStatus);
    procedure SetPhoneLastNumbers(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property OperationStatus:TDssOperationStatus read FOperationStatus write SetOperationStatus default Unknown;
    property FileSigningResults:TDssFileSigningResults read FFileSigningResults;
    property ConfirmType:TDssConfirmType read FConfirmType write SetConfirmType default ConfirmTypeUnknown; // = 3 [];
    property AOperator:TDssOperator read FAOperator write SetAOperator default OperatorUnknown; //  = 4 [default = OperatorUnknown];
    property PhoneLastNumbers:string read FPhoneLastNumbers write SetPhoneLastNumbers; // = 5;
  end;
  TDssSignResults = specialize GSerializationObjectList<TDssSignResult>;

implementation

  { DssSignRequest } 

procedure TDssSignRequest.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Files', 1);
end;

procedure TDssSignRequest.InternalInit;
begin
  inherited InternalInit;
  FFiles:= TDssSignFiles.Create;
end;

destructor TDssSignRequest.Destroy;
begin
  FFiles.Free;
  inherited Destroy;
end;


  { DssSignFile } 

procedure TDssSignFile.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Content', 1, true);
  RegisterProp('FileName', 2);
end;

procedure TDssSignFile.InternalInit;
begin
  inherited InternalInit;
  FContent:= TContent_v3.Create;
end;

destructor TDssSignFile.Destroy;
begin
  FContent.Free;
  inherited Destroy;
end;

procedure TDssSignFile.SetFileName(AValue:String);
begin
  FFileName:=AValue;
  Modified(2);
end;


  { DssSignResult } 

procedure TDssSignResult.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('OperationStatus', 1);
  RegisterProp('FileSigningResults', 2);
  RegisterProp('ConfirmType', 3);
  RegisterProp('AOperator', 4);
  RegisterProp('PhoneLastNumbers', 5);
end;

procedure TDssSignResult.InternalInit;
begin
  inherited InternalInit;
  FFileSigningResults:= TDssFileSigningResults.Create;

  OperationStatus:= Unknown;
  ConfirmType:=ConfirmTypeUnknown; // = 3 [];
  AOperator:= OperatorUnknown; //  = 4 [default = OperatorUnknown];
end;

destructor TDssSignResult.Destroy;
begin
  FFileSigningResults.Free;
  inherited Destroy;
end;

procedure TDssSignResult.SetOperationStatus(AValue:TDssOperationStatus);
begin
  FOperationStatus:=AValue;
  Modified(1);
end;

procedure TDssSignResult.SetAOperator(AValue: TDssOperator);
begin
  if FAOperator=AValue then Exit;
  FAOperator:=AValue;
  Modified(4);
end;

procedure TDssSignResult.SetConfirmType(AValue: TDssConfirmType);
begin
  if FConfirmType=AValue then Exit;
  FConfirmType:=AValue;
  Modified(3);
end;

procedure TDssSignResult.SetPhoneLastNumbers(AValue: string);
begin
  if FPhoneLastNumbers=AValue then Exit;
  FPhoneLastNumbers:=AValue;
  Modified(5);
end;


  { DssFileSigningResult } 

procedure TDssFileSigningResult.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('FileSigningStatus', 1);
  RegisterProp('Signature', 2);
end;

procedure TDssFileSigningResult.InternalInit;
begin
  inherited InternalInit;

  FileSigningStatus:= UnknownSigningStatus;
end;

destructor TDssFileSigningResult.Destroy;
begin
  inherited Destroy;
end;

procedure TDssFileSigningResult.SetFileSigningStatus(AValue:TDssFileSigningStatus);
begin
  FFileSigningStatus:=AValue;
  Modified(1);
end;

procedure TDssFileSigningResult.SetSignature(AValue:TBytes);
begin
  FSignature:=AValue;
  Modified(2);
end;

end.
