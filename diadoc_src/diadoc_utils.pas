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


unit diadoc_utils;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc, protobuf_fpc_types;

function TimestampTicksToDateTime(Ticks:sfixed64):TDateTime;
function DateTimeToTimestampTicks(ADateTime:TDateTime):sfixed64;

function InvoiceVersion(const AXmlDoc:TStream):string;
implementation
uses DateUtils, DOM, XMLRead;

function TimestampTicksToDateTime(Ticks: sfixed64): TDateTime;
var
  D: Extended;
begin
  D:=(Ticks / 10000000);
  D:=D / SecsPerDay;
  Result:=EncodeDate(0001, 01, 01);
  Result:=Result + D; //(Ticks / 10000000) / SecsPerDay;
end;

function DateTimeToTimestampTicks(ADateTime: TDateTime): sfixed64;
begin

end;

function InvoiceVersion(const AXmlDoc: TStream): string;

function NodeValue(ANode:TDOMNode):String;
begin
//  Result:='';
  Result:=ANode.NodeValue;
//  SetCodePage();
end;

var
  P: Int64;
  D: TXMLDocument;
  S: String;
  RFile, RDoc, EVerF, EKnd, EFunc: TDOMNode;
  S1, S2, S3: String;
begin
  Result:='';
  RFile:=nil;
  RDoc:=nil;
  EVerF:=nil;
  EKnd:=nil;
  EFunc:=nil;

  P:=AXmlDoc.Position;
  try
    ReadXMLFile(D, AXmlDoc);
    if Assigned(D) then
    begin
      S:='Файл';
      RFile:=D.FindNode(S);
      S:='Документ';
      if Assigned(RFile) then
        RDoc:=RFile.FindNode(S);

      if Assigned(RFile) and Assigned(RDoc) then
      begin
        S:='ВерсФорм'; //="5.02"
        EVerF:=RFile.Attributes.GetNamedItem(S);
        //КНД="1115125" Функция="СЧФДОП"
        S:='КНД';
        EKnd:=RDoc.Attributes.GetNamedItem(S);
        S:='Функция';
        EFunc:=RDoc.Attributes.GetNamedItem(S);
        if Assigned(EVerF) and Assigned(EKnd) and Assigned(EFunc) then
        begin
          S1:=EVerF.NodeValue;
          S2:=EKnd.NodeValue;
          //S3:=EFunc.NodeValue;
          S3:=NodeValue(EFunc);

          if S3 = 'СЧФ' then
          begin
            Result:='invoice_';
            if S1 = '5.02' then
              Result:=Result + '05_02_01'
            else
            if S1 = '5.01' then
              Result:=Result + '05_01_03';
          end
          else
          if S3 = 'СЧФДОП' then
          begin
            Result:='utd_';
            if S1 = '5.02' then
              Result:=Result + '05_02_01'
            else
            if S1 = '5.01' then
              Result:=Result + '05_01_05';
          end;
        end;
      end;
      D.Free;
          //invoice_05_01_01
          //invoice_05_01_03
          //invoice_05_02_01
          //utd_05_01_01
          //utd_05_01_02
          //utd_05_01_04
          //utd_05_01_05
          //utd_05_02_01
          //utd820_05_01_01
    end;
  finally
    AXmlDoc.Position;
  end;
end;

end.

