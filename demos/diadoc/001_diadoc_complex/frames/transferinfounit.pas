unit TransferInfoUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, DiadocTypes_UniversalTransferDocumentInfo;

type

  { TTransferInfoFrame }

  TTransferInfoFrame = class(TFrame)
    edtOperationInfo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private
    FTransferInfo: TTransferInfo;
    procedure SetTransferInfo(AValue: TTransferInfo);
  public
    procedure Clear;
    property TransferInfo:TTransferInfo read FTransferInfo write SetTransferInfo;
  end;

implementation

{$R *.lfm}

{ TTransferInfoFrame }

procedure TTransferInfoFrame.SetTransferInfo(AValue: TTransferInfo);
begin
  if FTransferInfo=AValue then Exit;
  FTransferInfo:=AValue;
  if Assigned(FTransferInfo) then
  begin
    edtOperationInfo.Text:=FTransferInfo.OperationInfo;

  end
  else
    Clear;
end;

procedure TTransferInfoFrame.Clear;
begin
  edtOperationInfo.Text:='';
end;

end.

