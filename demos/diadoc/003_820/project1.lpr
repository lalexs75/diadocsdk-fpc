program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, 
  dd820MainUnit,
  ssl_openssl,
  ssl_openssl_lib,
  rxnew, dd820_utdwh_revision_unit, dd820_utdwh_unit
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tdd820MainForm, dd820MainForm);
  Application.Run;
end.

