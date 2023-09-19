{
  Комплексный пример работы с ДИАДОК

  Copyright (C) 2018-2023 Lagunov Aleksey alexs75@yandex.ru

  Этот исходный код является свободно-распространяемым программынм обеспечением.
  Вы можете распространять и (или) модифицировать его при условии соблюдения
  условий лицензии GPL2, опублиованной Фондом свободного програмного обеспечения
  (FSF).

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
  MA 02111-1307, USA.
}

unit ddMainDataUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rxmemds;

type
  TClientRecord = record
    ClientName:string;
    ClientAdress:string;
    ClientINN:string;
    ClientKPP:string;
  end;


  { TMainDM }

  TMainDM = class(TDataModule)
    rxClients: TRxMemoryData;
  private

  public
    function FindClient(AClientID:string):TClientRecord;
  end;

var
  MainDM: TMainDM;

implementation

{$R *.lfm}

{ TMainDM }

function TMainDM.FindClient(AClientID: string): TClientRecord;
begin
  Result.ClientName:='';
  Result.ClientAdress:='';
  Result.ClientINN:='';
  Result.ClientKPP:='';
end;

end.

