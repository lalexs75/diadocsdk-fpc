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

unit CounteragentListUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, ExtCtrls,
  Buttons, StdCtrls, Menus, ActnList, DB, rxdbgrid, rxmemds, DiadocTypes,
  DiadocAPI, DiadocTypes_Counteragent;

type

  { TCounteragentListForm }

  TCounteragentListForm = class(TForm)
    MenuItem1: TMenuItem;
    ShowSertif: TAction;
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    ButtonPanel1: TButtonPanel;
    dsClientList: TDataSource;
    Label1: TLabel;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    rxClientListApartment: TStringField;
    rxClientListBlock: TStringField;
    rxClientListBuilding: TStringField;
    rxClientListCity: TStringField;
    rxClientListCurrentStatus: TLongintField;
    rxClientListFullName: TStringField;
    rxClientListIndexKey: TStringField;
    rxClientListInn: TStringField;
    rxClientListKpp: TStringField;
    rxClientListLiquidationDate: TStringField;
    rxClientListLocality: TStringField;
    rxClientListMessageFromCounteragent: TStringField;
    rxClientListOgrn: TStringField;
    rxClientListOrgId: TStringField;
    rxClientListRegion: TStringField;
    rxClientListShortName: TStringField;
    rxClientListStreet: TStringField;
    rxClientListTerritory: TStringField;
    rxClientListZipCode: TStringField;
    RxDBGrid1: TRxDBGrid;
    rxClientList: TRxMemoryData;
    procedure BitBtn1Click(Sender: TObject);
    procedure ShowSertifExecute(Sender: TObject);
  private
    FMaxCntragent:integer;
    FLastContKey: String;
    FKey: String;
    procedure LoadList(ACL: TCounteragentList);
  public
    FDiadocAPI: TDiadocAPI;
    procedure OpenCList(AKey:string);
  end;

var
  CounteragentListForm: TCounteragentListForm;

implementation
uses diadoc_consts, BoxPropsUnit;

{$R *.lfm}

{ TCounteragentListForm }

procedure TCounteragentListForm.BitBtn1Click(Sender: TObject);
var
  CL: TCounteragentList;
begin
  CL:=FDiadocAPI.GetCounteragents(FKey, rcsAny, FLastContKey);
  LoadList(CL);
  Cl.Free;
end;

procedure TCounteragentListForm.ShowSertifExecute(Sender: TObject);
var
  CL: TCounteragentCertificateList;
  C: TCertificate;
  B: Byte;
  I: Integer;
  S: String;
begin
  CL:=FDiadocAPI.GetCounteragentCertificates(FKey, rxClientListOrgId.AsString);
  if not Assigned(CL) then
  begin
    case FDiadocAPI.ResultCode of
      400:S:='(Bad Request) - данные в запросе имеют неверный формат или отсутствуют обязательные параметры';
      401:S:='(Unauthorized) - в запросе отсутствует HTTP-заголовок Authorization, или в этом заголовке содержатся некорректные авторизационные данные';
      403:S:='(Forbidden) - доступ к списку сертификатов организации counteragentOrgId от организации myOrgId с предоставленным авторизационным токеном запрещен';
      404:S:='(Not Found) - между организациями myOrgId и counteragentOrgId партнерские отношения никогда не устанавливались';
      405:S:='(Method not allowed) - используется неподходящий HTTP-метод';
      500:S:='(Internal server error) - при обработке запроса возникла непредвиденная ошибка';
    else
      S:=FDiadocAPI.ResultString;
    end;
    ShowMessageFmt('Error %d (%s)', [FDiadocAPI.ResultCode, S]);
    exit;
  end;
  BoxPropsForm:=TBoxPropsForm.Create(Application);
  BoxPropsForm.Caption:='Certificates';
  for C in CL.Certificates do
  begin
    BoxPropsForm.Memo1.Lines.Add('----------------');
    S:='';
    I:=0;
    for B in C.RawCertificateData do
    begin
      S:=S + HexStr(B, 1);
      inc(I);
      if I > 64 then
      begin
        I:=0;
        S:=S + LineEnding;
      end;
    end;
    BoxPropsForm.Memo1.Lines.Add(S);
  end;
  BoxPropsForm.ShowModal;
  BoxPropsForm.Free;
end;

procedure TCounteragentListForm.LoadList(ACL: TCounteragentList);
var
  i: Integer;
  C: TCounteragent;
begin
  for C in ACL.Counteragents do
  begin
    rxClientList.Append;
    rxClientListIndexKey.AsString:=C.IndexKey;
    rxClientListCurrentStatus.AsInteger:=Ord(C.CurrentStatus);
    rxClientListMessageFromCounteragent.AsString:=C.MessageFromCounteragent;

    rxClientListOrgId.AsString:=C.Organization.OrgId;
    rxClientListFullName.AsString:=C.Organization.FullName;
    rxClientListShortName.AsString:=C.Organization.FullName;
    rxClientListInn.AsString:=C.Organization.Inn;
    rxClientListKpp.AsString:=C.Organization.Kpp;
    rxClientListLiquidationDate.AsString:=C.Organization.LiquidationDate;
    rxClientListOgrn.AsString:=C.Organization.Ogrn;

    rxClientListRegion.AsString:=C.Organization.Address.RussianAddress.Region;
    rxClientListStreet.AsString:=C.Organization.Address.RussianAddress.Street;
    rxClientListTerritory.AsString:=C.Organization.Address.RussianAddress.Territory;
    rxClientListZipCode.AsString:=C.Organization.Address.RussianAddress.ZipCode;
    rxClientListApartment.AsString:=C.Organization.Address.RussianAddress.Apartment;
    rxClientListBlock.AsString:=C.Organization.Address.RussianAddress.Block;
    rxClientListBuilding.AsString:=C.Organization.Address.RussianAddress.Building;
    rxClientListCity.AsString:=C.Organization.Address.RussianAddress.City;
    rxClientListLocality.AsString:=C.Organization.Address.RussianAddress.Locality;
    rxClientList.Post;
    FLastContKey:=C.IndexKey;
  end;

  BitBtn1.Enabled:=rxClientList.RecordCount < FMaxCntragent;
end;

procedure TCounteragentListForm.OpenCList(AKey: string);
var
  CL: TCounteragentList;
begin
  rxClientList.CloseOpen;
  FLastContKey:='';
  FKey:=AKey;
  CL:=FDiadocAPI.GetCounteragents(FKey, rcsAny, FLastContKey);
  FMaxCntragent:=CL.TotalCount;
  Label1.Caption:='Всего : ' + IntToStr(FMaxCntragent);
  LoadList(CL);
  Cl.Free;
end;

end.

