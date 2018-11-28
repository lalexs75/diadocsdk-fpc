unit ShowBoxInfoUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, DiadocAPI,
  DiadocTypes_Organization, BoxInfoUnit;

type

  { TShowBoxInfoForm }

  TShowBoxInfoForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    procedure FormCreate(Sender: TObject);
  private
    FBoxInfo:TBoxInfoFrame;
  public

  end;


procedure ShowBoxInfo(ABoxID:string; ADiadocAPI: TDiadocAPI);
implementation

procedure ShowBoxInfo(ABoxID: string; ADiadocAPI: TDiadocAPI);
var
  ShowBoxInfoForm: TShowBoxInfoForm;
  FBox: TBox;
begin
  FBox:=ADiadocAPI.GetBox(ABoxID);
  if Assigned(FBox) then
  begin
    ShowBoxInfoForm:=TShowBoxInfoForm.Create(Application);
    ShowBoxInfoForm.FBoxInfo.LoadInfo(FBox);
    ShowBoxInfoForm.ShowModal;
    ShowBoxInfoForm.Free;
    FBox.Free;
  end;
end;

{$R *.lfm}

{ TShowBoxInfoForm }

procedure TShowBoxInfoForm.FormCreate(Sender: TObject);
begin
  FBoxInfo:=TBoxInfoFrame.Create(Self);
  FBoxInfo.Parent:=Self;
  FBoxInfo.Align:=alClient;
end;

end.

