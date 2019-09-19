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

unit Diadoc_Base;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils;

const
  sKonturAPI_URL = 'https://diadoc-api.kontur.ru/';

type
  THttpMethod = (hmGET, hmPOST);

  { TProxyData }

  TProxyData = class(TPersistent)
  private
    FProxyHost: string;
    FProxyPass: string;
    FProxyPort: string;
    FProxyUser: string;
  published
    procedure Assign(Source: TPersistent); override;
    property ProxyHost:string read FProxyHost write FProxyHost;
    property ProxyPort:string read FProxyPort write FProxyPort;
    property ProxyUser:string read FProxyUser write FProxyUser;
    property ProxyPass:string read FProxyPass write FProxyPass;
  end;

type
  EDiadocException = class(Exception);

  { EDiadocHttpException }

  EDiadocHttpException = class(EDiadocException)
  private
    FHttpCode: integer;
    FHttpErrorText: string;
  public
    constructor CreateHttpException(const AHttpCode : Integer);
    property HttpCode:integer read FHttpCode;
    property HttpErrorText:string read FHttpErrorText;
  end;

procedure AddURLParam(var S:string; AParam, AValue:string); overload;
procedure AddURLParam(var S:string; AParam:string); overload;
implementation
uses diadoc_consts;

function HTTPEncode(const AStr: String): String;

const
  HTTPAllowed = ['A'..'Z','a'..'z',
                 '*','@','.','_','-',
                 '0'..'9',
                 '$','!','''','(',')'];

var
  SS,S,R: PChar;
  H : String[2];
  L : Integer;

begin
  L:=Length(AStr);
  SetLength(Result,L*3); // Worst case scenario
  if (L=0) then
    exit;
  R:=PChar(Result);
  S:=PChar(AStr);
  SS:=S; // Avoid #0 limit !!
  while ((S-SS)<L) do
    begin
    if S^ in HTTPAllowed then
      R^:=S^
    else if (S^=' ') then
      R^:='+'
    else
      begin
      R^:='%';
      H:=HexStr(Ord(S^),2);
      Inc(R);
      R^:=H[1];
      Inc(R);
      R^:=H[2];
      end;
    Inc(R);
    Inc(S);
    end;
  SetLength(Result,R-PChar(Result));
end;

procedure AddURLParam(var S: string; AParam, AValue: string);
begin
  if S<>'' then S:=S + '&';
  if AValue <>'' then
  begin
    //AValue:=StringReplace(AValue, '#', '%23', [rfReplaceAll]);
    AValue:=StringReplace(AValue, '%', '%25', [rfReplaceAll]);
    S:=S + AParam + '=' + HTTPEncode(AValue)
  end
  else
    S:=S + AParam
end;

procedure AddURLParam(var S: string; AParam: string);
begin
  AddURLParam(S, AParam, '');
end;

{ EDiadocHttpException }

constructor EDiadocHttpException.CreateHttpException(const AHttpCode: Integer);
begin
  inherited Create(DDHTTPErrorCode(AHttpCode));
  FHttpCode:=AHttpCode;
  FHttpErrorText:=DDHTTPErrorCode(AHttpCode);
end;

{ TProxyData }

procedure TProxyData.Assign(Source: TPersistent);
begin
  if Source is TProxyData then
  begin
    FProxyHost:=TProxyData(Source).FProxyHost;
    FProxyPass:=TProxyData(Source).FProxyPass;
    FProxyPort:=TProxyData(Source).FProxyPort;
    FProxyUser:=TProxyData(Source).FProxyUser;
  end
  else
  inherited Assign(Source);
end;

end.

