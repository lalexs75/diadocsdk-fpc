program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols,
  anchordockpkg,
  rxAppUtils,
  rxlogging,
  DDAPIMainUnit,
  ssl_openssl,
  ssl_openssl_lib,
  xmliconv,
  CounteragentListUnit, DocListUnit, BoxPropsUnit,
  MessageForDocUnit,
  UniversalTransferDocumentSellerTitleInfoUnit, DiadocDocumentUnit,
  UniversalTransferDocumentBuyerTitleInfoUnit, ContragentsListUnit,
  OrganizationUsersListUnit, BoxEventListUnit, UserPermissionsUnit,
  ContragentFindUnit, ShowBoxInfoUnit,
  OrganizationInfoFormUnit, SelectDepartmentUnit, ddMainDataUnit,
  ddNewDocUTDUnit, TransferInfoUnit, ExtendedOrganizationInfoUnit, EmployeeUnit
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Контур ДИАДОК API тест';
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.{%H-}UpdateFormatSettings:=false;
  InitLocale;
  Application.Initialize;
  InitRxLogs;
  Application.CreateForm(TMainDM, MainDM);
  Application.CreateForm(TDDAPIMainForm, DDAPIMainForm);
  Application.Run;
end.

