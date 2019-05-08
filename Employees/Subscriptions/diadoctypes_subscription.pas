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

unit DiadocTypes_Subscription;

{$I diadoc_define.inc}

interface

//package Diadoc.Api.Proto.Employees.Subscriptions;
uses
  Classes, SysUtils,
  protobuf_fpc;


type
  { TSubscription }
  //message Subscription
  //{
  //        required string Id = 1;
  //        required bool IsSubscribed = 2;
  //}
  TSubscription = class(TSerializationObject)
  private
    FId: string;
    FIsSubscribed: Boolean;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property Id:string read FId write FId;//1;
    property IsSubscribed:Boolean read FIsSubscribed write FIsSubscribed;//2;
  end;
  TSubscriptions = specialize GSerializationObjectList<TSubscription>;


  { TSubscriptionsToUpdate }
  //message SubscriptionsToUpdate {
  //        repeated Subscription Subscriptions = 1;
  //}
  TSubscriptionsToUpdate = class(TSerializationObject)
  private
    FSubscriptions: TSubscriptions;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Subscriptions:TSubscriptions read FSubscriptions; //1;
  end;

  //message EmployeeSubscriptions {
  //        repeated Subscription Subscriptions = 1;
  //}

  { TEmployeeSubscriptions }

  TEmployeeSubscriptions = class(TSerializationObject)
  private
    FSubscriptions: TSubscriptions;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Subscriptions:TSubscriptions read FSubscriptions; //1;
  end;

implementation

{ TEmployeeSubscriptions }

procedure TEmployeeSubscriptions.InternalInit;
begin
  inherited InternalInit;
  FSubscriptions:=TSubscriptions.Create;
end;

procedure TEmployeeSubscriptions.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Subscriptions', 1);
end;

destructor TEmployeeSubscriptions.Destroy;
begin
  FreeAndNil(FSubscriptions);
  inherited Destroy;
end;

{ TSubscriptionsToUpdate }

procedure TSubscriptionsToUpdate.InternalInit;
begin
  inherited InternalInit;
  FSubscriptions:=TSubscriptions.Create;
end;

procedure TSubscriptionsToUpdate.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Subscriptions', 1);
end;

destructor TSubscriptionsToUpdate.Destroy;
begin
  FreeAndNil(FSubscriptions);
  inherited Destroy;
end;

{ TSubscription }

procedure TSubscription.InternalInit;
begin
  inherited InternalInit;
end;

procedure TSubscription.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Id', 1);
  RegisterProp('IsSubscribed', 2);
end;

end.

