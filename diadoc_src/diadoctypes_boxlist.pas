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

unit DiadocTypes_BoxList;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc;

type
  { TOrgInfo }
  //message OrgInfo {
  //	required string Name = 1;
  //	required string Inn = 2;
  //	required string Kpp = 3; // Пустая строка, если КПП не предусмотрен.
  //}
  TOrgInfo  = class(TSerializationObject) //message OrgInfo
  private
    FInn: string;
    FKpp: string;
    FName: string;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Name:string read FName write FName; //1;
    property Inn:string read FInn write FInn;  //2;
    property Kpp:string read FKpp write FKpp; //3; // Пустая строка, если КПП не предусмотрен.
  end;

  {  TBoxInfo }
  //message BoxInfo {
  //	required string BoxId = 1;
  //	required string BoxName = 2;
  //	required OrgInfo Org = 3;
  //}
  TBoxInfo  = class(TSerializationObject) //message BoxInfo
  private
    FBoxId: string;
    FBoxNamestring: string;
    FOrg: TOrgInfo;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property BoxId:string read FBoxId write FBoxId;//1;
    property BoxNamestring:string read FBoxNamestring write FBoxNamestring;//2;
    property Org:TOrgInfo read FOrg; //3;
  end;
  TBoxInfos = specialize GSerializationObjectList<TBoxInfo>;

  {  TBoxList  }
  //message BoxList {
  //	repeated BoxInfo Boxes = 1;
  //}
  TBoxList  = class(TSerializationObject) //message BoxList
  private
    FBoxes: TBoxInfos;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Boxes:TBoxInfos read FBoxes;//1;
  end;

implementation

{ TBoxList }

procedure TBoxList.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Boxes', 1);
end;

procedure TBoxList.InternalInit;
begin
  inherited InternalInit;
  FBoxes:=TBoxInfos.Create;
end;

destructor TBoxList.Destroy;
begin
  FreeAndNil(FBoxes);
  inherited Destroy;
end;

{ TBoxInfo }

procedure TBoxInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('BoxId', 1);
  RegisterProp('BoxNamestring', 2);
  RegisterProp('Org', 3);
end;

procedure TBoxInfo.InternalInit;
begin
  inherited InternalInit;
  FOrg:=TOrgInfo.Create;
end;

destructor TBoxInfo.Destroy;
begin
  FreeAndNil(FOrg);
  inherited Destroy;
end;

{ TOrgInfo }

procedure TOrgInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1);
  RegisterProp('Inn', 2);
  RegisterProp('Kpp', 3);
end;

procedure TOrgInfo.InternalInit;
begin
  inherited InternalInit;
end;

destructor TOrgInfo.Destroy;
begin
  inherited Destroy;
end;

end.

