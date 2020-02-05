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

unit DiadocTypes_DepartmentToUpdate;

interface

uses Classes, SysUtils, types, protobuf_fpc, DiadocTypes_Address;

type

  TDepartmentToUpdate = class;
  TParentDepartmentPatch = class;
  TDepartmentNamingPatch = class;
  TDepartmentKppPatch = class;
  TDepartmentAddressPatch = class;
  TDepartmentRoutingPatch = class;

  { DepartmentToUpdate } 
  //message DepartmentToUpdate 
  //{
  //	optional ParentDepartmentPatch ParentDepartment=1;
  //	optional DepartmentNamingPatch DepartmentNaming=2;
  //	optional DepartmentKppPatch Kpp=3;
  //	optional DepartmentAddressPatch Address = 4;
  //	optional DepartmentRoutingPatch Routing = 5;
  //}
  TDepartmentToUpdate = class(TSerializationObject)
  private
    FParentDepartment:TParentDepartmentPatch;
    FDepartmentNaming:TDepartmentNamingPatch;
    FKpp:TDepartmentKppPatch;
    FAddress:TDepartmentAddressPatch;
    FRouting:TDepartmentRoutingPatch;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentDepartment:TParentDepartmentPatch read FParentDepartment;
    property DepartmentNaming:TDepartmentNamingPatch read FDepartmentNaming;
    property Kpp:TDepartmentKppPatch read FKpp;
    property Address:TDepartmentAddressPatch read FAddress;
    property Routing:TDepartmentRoutingPatch read FRouting;
  end;
  TDepartmentToUpdates = specialize GSerializationObjectList<TDepartmentToUpdate>;

  { ParentDepartmentPatch } 
  //message ParentDepartmentPatch
  //{
  //	required string  ParentDepartmentId=1;
  //}
  TParentDepartmentPatch = class(TSerializationObject)
  private
    FParentDepartmentId:String;
    procedure SetParentDepartmentId(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property ParentDepartmentId:String read FParentDepartmentId write SetParentDepartmentId;
  end;
  TParentDepartmentPatchs = specialize GSerializationObjectList<TParentDepartmentPatch>;

  { DepartmentNamingPatch } 
  //message DepartmentNamingPatch
  //{
  //	required string Name=1;
  //	required string Abbreviation=2;
  //}
  TDepartmentNamingPatch = class(TSerializationObject)
  private
    FName:String;
    FAbbreviation:String;
    procedure SetName(AValue:String);
    procedure SetAbbreviation(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Name:String read FName write SetName;
    property Abbreviation:String read FAbbreviation write SetAbbreviation;
  end;
  TDepartmentNamingPatchs = specialize GSerializationObjectList<TDepartmentNamingPatch>;

  { DepartmentKppPatch } 
  //message DepartmentKppPatch
  //{
  //	optional string  Kpp=1;
  //}
  TDepartmentKppPatch = class(TSerializationObject)
  private
    FKpp:String;
    procedure SetKpp(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Kpp:String read FKpp write SetKpp;
  end;
  TDepartmentKppPatchs = specialize GSerializationObjectList<TDepartmentKppPatch>;

  { DepartmentAddressPatch } 
  //message DepartmentAddressPatch
  //{
  //	optional Address Address =1;
  //}
  TDepartmentAddressPatch = class(TSerializationObject)
  private
    FAddress:TAddress;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Address:TAddress read FAddress;
  end;
  TDepartmentAddressPatchs = specialize GSerializationObjectList<TDepartmentAddressPatch>;

  { DepartmentRoutingPatch } 
  //message DepartmentRoutingPatch
  //{
  //	required bool Kpp = 1;
  //	required bool Address = 2;
  //}
  TDepartmentRoutingPatch = class(TSerializationObject)
  private
    FKpp:Boolean;
    FAddress:Boolean;
    procedure SetKpp(AValue:Boolean);
    procedure SetAddress(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Kpp:Boolean read FKpp write SetKpp;
    property Address:Boolean read FAddress write SetAddress;
  end;
  TDepartmentRoutingPatchs = specialize GSerializationObjectList<TDepartmentRoutingPatch>;

implementation

  { DepartmentToUpdate } 

procedure TDepartmentToUpdate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentDepartment', 1);
  RegisterProp('DepartmentNaming', 2);
  RegisterProp('Kpp', 3);
  RegisterProp('Address', 4);
  RegisterProp('Routing', 5);
end;

procedure TDepartmentToUpdate.InternalInit;
begin
  inherited InternalInit;
  FParentDepartment:= TParentDepartmentPatch.Create;
  FDepartmentNaming:= TDepartmentNamingPatch.Create;
  FKpp:= TDepartmentKppPatch.Create;
  FAddress:= TDepartmentAddressPatch.Create;
  FRouting:= TDepartmentRoutingPatch.Create;
end;

destructor TDepartmentToUpdate.Destroy;
begin
  FParentDepartment.Free;
  FDepartmentNaming.Free;
  FKpp.Free;
  FAddress.Free;
  FRouting.Free;
  inherited Destroy;
end;


  { ParentDepartmentPatch } 

procedure TParentDepartmentPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('ParentDepartmentId', 1, true);
end;

procedure TParentDepartmentPatch.InternalInit;
begin
  inherited InternalInit;
end;

destructor TParentDepartmentPatch.Destroy;
begin
  inherited Destroy;
end;

procedure TParentDepartmentPatch.SetParentDepartmentId(AValue:String);
begin
  FParentDepartmentId:=AValue;
  Modified(1);
end;


  { DepartmentNamingPatch } 

procedure TDepartmentNamingPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1, true);
  RegisterProp('Abbreviation', 2, true);
end;

procedure TDepartmentNamingPatch.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDepartmentNamingPatch.Destroy;
begin
  inherited Destroy;
end;

procedure TDepartmentNamingPatch.SetName(AValue:String);
begin
  FName:=AValue;
  Modified(1);
end;

procedure TDepartmentNamingPatch.SetAbbreviation(AValue:String);
begin
  FAbbreviation:=AValue;
  Modified(2);
end;


  { DepartmentKppPatch } 

procedure TDepartmentKppPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Kpp', 1);
end;

procedure TDepartmentKppPatch.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDepartmentKppPatch.Destroy;
begin
  inherited Destroy;
end;

procedure TDepartmentKppPatch.SetKpp(AValue:String);
begin
  FKpp:=AValue;
  Modified(1);
end;


  { DepartmentAddressPatch } 

procedure TDepartmentAddressPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Address', 1);
end;

procedure TDepartmentAddressPatch.InternalInit;
begin
  inherited InternalInit;
  FAddress:= TAddress.Create;
end;

destructor TDepartmentAddressPatch.Destroy;
begin
  FAddress.Free;
  inherited Destroy;
end;


  { DepartmentRoutingPatch } 

procedure TDepartmentRoutingPatch.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Kpp', 1, true);
  RegisterProp('Address', 2, true);
end;

procedure TDepartmentRoutingPatch.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDepartmentRoutingPatch.Destroy;
begin
  inherited Destroy;
end;

procedure TDepartmentRoutingPatch.SetKpp(AValue:Boolean);
begin
  FKpp:=AValue;
  Modified(1);
end;

procedure TDepartmentRoutingPatch.SetAddress(AValue:Boolean);
begin
  FAddress:=AValue;
  Modified(2);
end;

end.
