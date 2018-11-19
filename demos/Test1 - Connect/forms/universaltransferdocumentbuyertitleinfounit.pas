unit UniversalTransferDocumentBuyerTitleInfoUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ButtonPanel,
  StdCtrls, DiadocTypes_UniversalTransferDocumentInfo;

type

  { TUniversalTransferDocumentBuyerTitleInfoForm }

  TUniversalTransferDocumentBuyerTitleInfoForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
  private

  public
    procedure OpenInfo(AInfo:TUniversalTransferDocumentBuyerTitleInfo);
  end;

var
  UniversalTransferDocumentBuyerTitleInfoForm: TUniversalTransferDocumentBuyerTitleInfoForm;

implementation

{$R *.lfm}

{ TUniversalTransferDocumentBuyerTitleInfoForm }

procedure TUniversalTransferDocumentBuyerTitleInfoForm.OpenInfo(
  AInfo: TUniversalTransferDocumentBuyerTitleInfo);
begin
  if not Assigned(AInfo) then Exit;

  Edit1.Text:=AInfo.DocumentCreator;
  Edit2.Text:=AInfo.DocumentCreatorBase;
  Edit3.Text:=AInfo.OperationCode;
  Edit4.Text:=AInfo.OperationContent;
  Edit5.Text:=AInfo.AcceptanceDate;
  Edit6.Text:=AInfo.Employee.EmployeeBase + ' ' + AInfo.Employee.EmployeePosition + ' ' + AInfo.Employee.TransferFirstName + ' ' + AInfo.Employee.TransferPatronymic + ' ' + AInfo.Employee.TransferSurname + ' ' + AInfo.Employee.EmployeeInfo;
  Edit7.Text:=AInfo.OtherIssuer.TransferOrganizationName;

  Edit8.Text:=AInfo.AdditionalInfoId.InfoFileId; //optional AdditionalInfoId AdditionalInfoId = 8; // ИнфПолФХЖ4
  Edit9.Text:=''; //repeated Signers.ExtendedSigner Signers = 9; // Подписант
end;

end.

