unit TransferInfoUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, ComCtrls, DB,
  DiadocTypes_UniversalTransferDocumentInfo, ExtendedOrganizationInfoUnit, EmployeeUnit,
  rxdbgrid, rxmemds, DiadocTypes_InvoiceInfo;

type

  { TTransferInfoFrame }

  TTransferInfoFrame = class(TFrame)
    dsTransferBase: TDataSource;
    dsTransferBase1: TDataSource;
    edtAdditionalInfo: TEdit;
    edtCreatedThingTransferDate: TEdit;
    edtCreatedThingInfo: TEdit;
    edtTransferTextInfo: TEdit;
    edtTransferDate: TEdit;
    edtOperationType: TEdit;
    edtOperationInfo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CLabel: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    rxTransferBase: TRxMemoryData;
    rxWaybill: TRxMemoryData;
    rxTransferBaseBaseDocumentDate: TStringField;
    rxTransferBaseBaseDocumentInfo: TStringField;
    rxTransferBaseBaseDocumentName: TStringField;
    rxTransferBaseBaseDocumentNumber: TStringField;
    rxWaybillTransferDocumentDate: TStringField;
    rxWaybillTransferDocumentNumber: TStringField;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
  private
    FTransferInfo: TTransferInfo;
    FCarrier:TExtendedOrganizationInfoFrame;
    FEmployee:TEmployeeFrame;
    procedure SetTransferInfo(AValue: TTransferInfo);
  public
    constructor Create(TheOwner: TComponent); override;
    procedure Clear;
    property TransferInfo:TTransferInfo read FTransferInfo write SetTransferInfo;
  end;

implementation

{$R *.lfm}

{ TTransferInfoFrame }

procedure TTransferInfoFrame.SetTransferInfo(AValue: TTransferInfo);
var
  TB:TTransferBase;
  WB:TWaybill;
  AI:TAdditionalInfo;
begin
  if FTransferInfo=AValue then Exit;
  FTransferInfo:=AValue;
  if Assigned(FTransferInfo) then
  begin
    rxTransferBase.CloseOpen;
    rxWaybill.CloseOpen;

    edtOperationInfo.Text:=FTransferInfo.OperationInfo;
    edtOperationType.Text:=FTransferInfo.OperationType;
    edtTransferDate.Text:=FTransferInfo.TransferDate;
    edtTransferTextInfo.Text:=FTransferInfo.TransferTextInfo;

    FCarrier.ExtendedOrganizationInfo:=FTransferInfo.Carrier;
    FEmployee.Employee:=FTransferInfo.Employee;

    edtCreatedThingTransferDate.Text:=FTransferInfo.CreatedThingTransferDate;
    edtCreatedThingInfo.Text:=FTransferInfo.CreatedThingInfo;

    for AI in FTransferInfo.AdditionalInfoId.AdditionalInfo do
      edtAdditionalInfo.Text:=edtAdditionalInfo.Text + AI.Id + ':'+AI.Value + ',';

    //property OtherIssuer:TOtherIssuer read FOtherIssuer;//9;

    for TB in FTransferInfo.TransferBase do
    begin
      rxTransferBase.Append;
      rxTransferBaseBaseDocumentName.AsString:=TB.BaseDocumentName;
      rxTransferBaseBaseDocumentNumber.AsString:=TB.BaseDocumentNumber;//2;
      rxTransferBaseBaseDocumentDate.AsString:=TB.BaseDocumentDate;//3;
      rxTransferBaseBaseDocumentInfo.AsString:=TB.BaseDocumentInfo;//4;
      rxTransferBase.Post;
    end;
    rxTransferBase.First;


    for WB in FTransferInfo.Waybill do
    begin
      rxWaybill.Append;
      rxWaybillTransferDocumentNumber.AsString:=WB.TransferDocumentNumber;
      rxWaybillTransferDocumentDate.AsString:=WB.TransferDocumentDate;
      rxWaybill.Post;
    end;
    rxWaybill.First;

  end
  else
    Clear;
end;

constructor TTransferInfoFrame.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  FCarrier:=TExtendedOrganizationInfoFrame.Create(Self);
  FCarrier.Parent:=TabSheet2;
  FCarrier.Align:=alClient;

  FEmployee:=TEmployeeFrame.Create(Self);
  FEmployee.Parent:=TabSheet3;
  FEmployee.Align:=alClient;
end;

procedure TTransferInfoFrame.Clear;
begin
  edtOperationInfo.Text:='';
  edtOperationType.Text:='';
  edtTransferDate.Text:='';
  edtTransferTextInfo.Text:='';
  edtCreatedThingTransferDate.Text:='';
  edtCreatedThingInfo.Text:='';
  edtAdditionalInfo.Text:='';

  rxTransferBase.CloseOpen;
  rxWaybill.CloseOpen;
  FEmployee.Clear;
  FCarrier.Clear;
end;

end.

