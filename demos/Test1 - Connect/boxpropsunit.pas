unit BoxPropsUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls,
  DiadocAPI, DiadocTypes, diadoc_consts;

type

  { TBoxPropsForm }

  TBoxPropsForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    Memo1: TMemo;
  private

  public
    procedure OpenBoxProps(DiadocAPI1:TDiadocAPI; ABoxId:string);
  end;

var
  BoxPropsForm: TBoxPropsForm;

implementation
uses DiadocTypes_DocumentTypeDescription;

{$R *.lfm}

{ TBoxPropsForm }

procedure TBoxPropsForm.OpenBoxProps(DiadocAPI1: TDiadocAPI; ABoxId: string);
var
  DocTypes: TGetDocumentTypesResponse;
  DT: TDocumentTypeDescription;
  i: Integer;
begin
  Memo1.Lines.Clear;
  DocTypes:=DiadocAPI1.GetDocumentTypes(ABoxId);
  if Assigned(DocTypes) then
  begin
    for DT in DocTypes.DocumentTypes do
    begin
      Memo1.Lines.Add('-----');
      Memo1.Lines.Add('Name = ' + DT.Name);
      Memo1.Lines.Add('Title = ' + DT.Title);
      Memo1.Lines.Add('RequiresFnsRegistration = ' + BoolToStr(DT.RequiresFnsRegistration, true));
      for i:=0 to DT.SupportedDocflows.Count-1 do
        Memo1.Lines.Add('SupportedDocflows['+IntToStr(i)+'] = ' + DocumentDocflowToStr(DT.SupportedDocflows[i]));
      //property Functions:TDocumentFunctions read FFunctions; //9;
    end;
    DocTypes.Free;
  end;
end;

end.

