{ Комплексный пример работы с ДИАДОК

  Copyright (C) 2018-2020 Lagunov Aleksey alexs75@yandex.ru

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

program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, anchordockpkg,
  UniversalTransferDocument_SCHF_utd820_05_01_01_hyphen_ind0, rxAppUtils,
  rxlogging, DDAPIMainUnit,
  {$IFDEF WINDOWS}
  xmliconv_windows,
  {$ELSE}
  xmliconv,
  {$ENDIF}
  CounteragentListUnit, DocListUnit, BoxPropsUnit, MessageForDocUnit,
  UniversalTransferDocumentSellerTitleInfoUnit, DiadocDocumentUnit,
  UniversalTransferDocumentBuyerTitleInfoUnit, ContragentsListUnit,
  OrganizationUsersListUnit, BoxEventListUnit, UserPermissionsUnit,
  ContragentFindUnit, ShowBoxInfoUnit, OrganizationInfoFormUnit,
  SelectDepartmentUnit, ddMainDataUnit, ddNewDocUTDUnit, TransferInfoUnit,
  ExtendedOrganizationInfoUnit, EmployeeUnit, upd820_revision
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

