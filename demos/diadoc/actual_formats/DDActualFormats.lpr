program DDActualFormats;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  ssl_openssl,
  ssl_openssl_lib,
  rxlogging,
  adMainUnit;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  InitRxLogs;
  Application.Title:='ДиаДок - актуальные форматы';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

