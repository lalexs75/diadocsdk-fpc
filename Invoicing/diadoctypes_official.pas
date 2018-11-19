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

unit DiadocTypes_Official;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc_types, protobuf_fpc;

type
  {  TOfficial  }
  // Должностное лицо
  //message Official {
  //	required string Surname = 1;
  //	required string FirstName = 2;
  //	optional string Patronymic = 3;
  //	optional string JobTitle = 4;
  //}
  TOfficial = class(TSerializationObject)
  private
    FFirstName: string;
    FJobTitle: string;
    FPatronymic: string;
    FSurname: string;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Surname:string read FSurname write FSurname;//1;
    property FirstName:string read FFirstName write FFirstName;//2;
    property Patronymic:string read FPatronymic write FPatronymic;//3;
    property JobTitle:string read FJobTitle write FJobTitle;//4;
  end;

  {  TAttorney  }
  //message Attorney {
  //	optional string Date = 1;						// дата выдачи доверенности
  //	optional string Number = 2;						// номер доверенности
  //	optional string IssuerOrganizationName = 3;		// организация, представитель которой выдал доверенность
  //	optional Official IssuerPerson = 4;				// лицо, выдавшее доверенность
  //	optional string IssuerAdditionalInfo = 5;		// дополнительная информация о выдавшем доверенность
  //	optional Official RecipientPerson = 6;			// лицо, получившее доверенность
  //	optional string RecipientAdditionalInfo = 7;	// дополнительная информация о получившем доверенность
  //}
  TAttorney = class(TSerializationObject)
  private
    FDate: string;
    FIssuerAdditionalInfo: string;
    FIssuerOrganizationName: string;
    FIssuerPerson: TOfficial;
    FNumber: string;
    FRecipientAdditionalInfo: string;
    FRecipientPerson: TOfficial;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Date:string read FDate write FDate;//1;
    property Number:string read FNumber write FNumber;//2;
    property IssuerOrganizationName:string read FIssuerOrganizationName write FIssuerOrganizationName;//3;
    property IssuerPerson:TOfficial read FIssuerPerson; //4;
    property IssuerAdditionalInfo:string read FIssuerAdditionalInfo write FIssuerAdditionalInfo;//5;
    property RecipientPerson:TOfficial read FRecipientPerson;//6;
    property RecipientAdditionalInfo:string read FRecipientAdditionalInfo write FRecipientAdditionalInfo;//7;
  end;
implementation

{ TAttorney }

procedure TAttorney.InternalInit;
begin
  inherited InternalInit;
  FIssuerPerson:=TOfficial.Create;
  FRecipientPerson:=TOfficial.Create;
end;

procedure TAttorney.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Date', 1);
  RegisterProp('Number', 2);
  RegisterProp('IssuerOrganizationName', 3);
  RegisterProp('IssuerPerson', 4);
  RegisterProp('IssuerAdditionalInfo', 5);
  RegisterProp('RecipientPerson', 6);
  RegisterProp('RecipientAdditionalInfo', 7);
end;

destructor TAttorney.Destroy;
begin
  FreeAndNil(FIssuerPerson);
  FreeAndNil(FRecipientPerson);
  inherited Destroy;
end;

{ TOfficial }

procedure TOfficial.InternalInit;
begin
  inherited InternalInit;
end;

procedure TOfficial.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Surname', 1, true);
  RegisterProp('FirstName', 2, true);
  RegisterProp('Patronymic', 3);
  RegisterProp('JobTitle', 4);
end;

destructor TOfficial.Destroy;
begin
  inherited Destroy;
end;

end.

