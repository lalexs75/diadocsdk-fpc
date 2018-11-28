program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, rxnew, DDAPIMainUnit, ssl_openssl, ssl_openssl_lib,
  CounteragentListUnit, DocListUnit, BoxPropsUnit, MessageForDocUnit,
  BoxInfoUnit, OrganizationInfoUnit,
  UniversalTransferDocumentSellerTitleInfoUnit, DiadocDocumentUnit,
  UniversalTransferDocumentBuyerTitleInfoUnit, ContragentsListUnit,
  OrganizationUsersListUnit, BoxEventListUnit, UserPermissionsUnit,
  ContragentFindUnit, ShowBoxInfoUnit, AdressInfoFrameUnit,
  OrganizationInfoFormUnit, SelectDepartmentUnit
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Контур ДИАДОК API тест';
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.{%H-}UpdateFormatSettings:=false;
  InitLocale;
  Application.Initialize;
  Application.CreateForm(TDDAPIMainForm, DDAPIMainForm);
  Application.Run;
end.

