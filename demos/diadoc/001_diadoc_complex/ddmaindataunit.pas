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

