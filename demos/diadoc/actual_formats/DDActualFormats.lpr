program DDActualFormats;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, rxnew,
  ssl_openssl,
  ssl_openssl_lib,
  adMainUnit;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='ДиаДок - актуальные форматы';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

