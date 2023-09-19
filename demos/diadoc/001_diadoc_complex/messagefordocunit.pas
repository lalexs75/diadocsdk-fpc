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

unit MessageForDocUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ButtonPanel, ComCtrls, DB, DiadocAPI, rxdbgrid, rxmemds, rxAppUtils,
  DiadocTypes, DiadocTypes_UniversalTransferDocumentInfo,
  DiadocTypes_InvoiceInfo, DiadocTypes_Torg12Info, DiadocTypes_TovTorgInfo,
  DiadocTypes_DiadocMessage_GetApi;

type

  { TMessageForDocForm }

  TMessageForDocForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ButtonPanel1: TButtonPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    dsEntyty: TDataSource;
    Edit1: TEdit;
    Edit10: TEdit;
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
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    PageControl1: TPageControl;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    rxEntyty: TRxMemoryData;
    rxEntytyAttachmentType: TLongintField;
    rxEntytyAttachmentTypeStr: TStringField;
    rxEntytyContent_SIZE: TLongintField;
    rxEntytyEntityId: TStringField;
    rxEntytyEntityType: TStringField;
    rxEntytyFileName: TStringField;
    rxEntytyParentEntityId: TStringField;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rxEntytyAfterScroll(DataSet: TDataSet);
  private
    FBoxId: string;
    FMessageID: string;
    FDiadocAPI: TDiadocAPI;
    FMessage: TMessage;
  public
    procedure OpenDocList(ADiadocAPI: TDiadocAPI; ABoxId, AMessageID:string; AMessage: TMessage);
  end;

var
  MessageForDocForm: TMessageForDocForm;

procedure ShowInvoiceSellerTitleXml(ADiadocAPI:TDiadocAPI; AStream:TStream);
procedure ShowTorg12Xml(ADiadocAPI:TDiadocAPI; AStream:TStream);
procedure ShowUniversalTransferDocumentSellerTitleXml(ADiadocAPI:TDiadocAPI; FBoxId:string; AStream:TStream);
procedure ShowUniversalTransferDocumentBuyerTitle(ADiadocAPI:TDiadocAPI; AStream:TStream);
procedure ShowInvoiceConfirmation(ADiadocAPI:TDiadocAPI; AStream:TStream; AFileName:string);
procedure ShowOtherAttach(ADiadocAPI:TDiadocAPI; AStream:TStream; AFileName:string);
implementation
uses LCLIntf, diadoc_utils, UniversalTransferDocumentSellerTitleInfoUnit, upd820_revision,
  UniversalTransferDocumentBuyerTitleInfoUnit,
  UniversalTransferDocument_SCHF_utd820_05_01_01_hyphen_ind0;

{$R *.lfm}

procedure ShowInvoiceSellerTitleXml(ADiadocAPI: TDiadocAPI; AStream: TStream);
var
  U1: TInvoiceInfo;
begin
  if not Assigned(AStream) then Exit;
  AStream.Position:=0;
  U1:=ADiadocAPI.ParseInvoiceXml(AStream);
  if Assigned(U1) then
  begin
    UniversalTransferDocumentSellerTitleInfoForm:=TUniversalTransferDocumentSellerTitleInfoForm.Create(Application);
    UniversalTransferDocumentSellerTitleInfoForm.OpenInfo(U1);
    UniversalTransferDocumentSellerTitleInfoForm.ShowModal;
    UniversalTransferDocumentSellerTitleInfoForm.Free;
    FreeAndNil(U1);
  end;
  FreeAndNil(AStream);
end;

procedure ShowTorg12Xml(ADiadocAPI: TDiadocAPI; AStream: TStream);
var
  U1: TTorg12SellerTitleInfo;
  U2: TTovTorgSellerTitleInfo;
  U3: TInvoiceInfo;
begin
  if not Assigned(AStream) then Exit;
  AStream.Position:=0;
  U1:=ADiadocAPI.ParseTorg12SellerTitleXml(AStream);
  AStream.Position:=0;
  U2:=ADiadocAPI.ParseTovTorg551SellerTitleXml(AStream);
  AStream.Position:=0;
  U3:=ADiadocAPI.ParseInvoiceXml(AStream);
  if Assigned(U1) then
  begin
    UniversalTransferDocumentSellerTitleInfoForm:=TUniversalTransferDocumentSellerTitleInfoForm.Create(Application);
    UniversalTransferDocumentSellerTitleInfoForm.OpenInfo(U1);
    UniversalTransferDocumentSellerTitleInfoForm.ShowModal;
    UniversalTransferDocumentSellerTitleInfoForm.Free;
    FreeAndNil(U1);
  end;

  if Assigned(U2) then
  begin
    FreeAndNil(U2);
  end;

  if Assigned(U3) then
  begin
    FreeAndNil(U3);
  end;
  FreeAndNil(AStream);
end;

procedure ShowUniversalTransferDocumentSellerTitleXml(ADiadocAPI: TDiadocAPI;
  FBoxId: string; AStream: TStream);
var
  U1: TUniversalTransferDocumentSellerTitleInfo;
  I2: TInvoiceInfo;
  S, RDocType, RDocFunct, RDocVers: String;
  U2: TUniversalTransferDocumentWithHyphens;
  M1: TMemoryStream;
begin
  if not Assigned(AStream) then Exit;

  AStream.Position:=0;

  DocumentParams(AStream, RDocType, RDocFunct, RDocVers);

  M1:=ADiadocAPI.ParseTitleXml(FBoxId, RDocType, RDocFunct, RDocVers, 0, AStream);

  if Assigned(M1) then
  begin
    M1.Position:=0;
    M1.SaveToFile('/home/alexs/1/8/aa.xml');
    M1.Position:=0;
    U2:=TUniversalTransferDocumentWithHyphens.Create;
    U2.LoadFromStream(M1);

    UniversalTransferDocumentSellerTitleInfoForm:=TUniversalTransferDocumentSellerTitleInfoForm.Create(Application);
    UniversalTransferDocumentSellerTitleInfoForm.OpenInfo(U2);
    UniversalTransferDocumentSellerTitleInfoForm.ShowModal;
    UniversalTransferDocumentSellerTitleInfoForm.Free;

    U2.Free;
    M1.Free;
  end;
(*
  S:=InvoiceVersion(AStream);


  if S = '' then
    U1:=ADiadocAPI.ParseUniversalTransferDocumentSellerTitleXml(AStream)
  else
    U1:=ADiadocAPI.ParseUniversalTransferDocumentSellerTitleXml(AStream, S);

  if Assigned(U1) then
  begin
    UniversalTransferDocumentSellerTitleInfoForm:=TUniversalTransferDocumentSellerTitleInfoForm.Create(Application);
    UniversalTransferDocumentSellerTitleInfoForm.OpenInfo(U1);
    UniversalTransferDocumentSellerTitleInfoForm.ShowModal;
    UniversalTransferDocumentSellerTitleInfoForm.Free;
    FreeAndNil(U1);
  end
  else
  begin
    AStream.Position:=0;
    I2:=ADiadocAPI.ParseInvoiceXml(AStream);
    if Assigned(I2) then
    begin
      FreeAndNil(I2);
    end;
  end;
*)
  FreeAndNil(AStream);
end;

procedure ShowUniversalTransferDocumentBuyerTitle(ADiadocAPI:TDiadocAPI; AStream: TStream);
var
  U: TUniversalTransferDocumentBuyerTitleInfo;
begin
  if not Assigned(AStream) then Exit;
  AStream.Position:=0;
  U:=ADiadocAPI.ParseUniversalTransferDocumentBuyerTitleXml(AStream);
  if Assigned(U) then
  begin
    UniversalTransferDocumentBuyerTitleInfoForm:=TUniversalTransferDocumentBuyerTitleInfoForm.Create(Application);
    UniversalTransferDocumentBuyerTitleInfoForm.OpenInfo(U);
    UniversalTransferDocumentBuyerTitleInfoForm.ShowModal;
    UniversalTransferDocumentBuyerTitleInfoForm.Free;
    FreeAndNil(U);
  end;
  FreeAndNil(AStream);
end;

procedure ShowInvoiceConfirmation(ADiadocAPI:TDiadocAPI; AStream: TStream;
  AFileName: string);
begin
  ShowOtherAttach(ADiadocAPI, AStream, AFileName)
end;

procedure ShowOtherAttach(ADiadocAPI:TDiadocAPI; AStream: TStream; AFileName: string
  );
var
  FFileName: String;
begin
  if not Assigned(AStream) then Exit;
  AStream.Position:=0;
  FFileName:=GetTempDir(true) + AFileName;
  TMemoryStream(AStream).SaveToFile(FFileName);
  OpenDocument(FFileName);
  FreeAndNil(AStream);
end;

{ TMessageForDocForm }

procedure TMessageForDocForm.rxEntytyAfterScroll(DataSet: TDataSet);
begin
  Button1.Enabled:=(rxEntytyContent_SIZE.AsInteger>0) and (rxEntytyFileName.AsString<>'');
end;

procedure TMessageForDocForm.Button1Click(Sender: TObject);
var
  S: TMemoryStream;
  UPD: TUniversalTransferDocumentBuyerTitleInfo;
  C: TAttachmentType;
begin
  if rxEntytyContent_SIZE.AsInteger > 0 then
  begin
    C:=TAttachmentType(rxEntytyAttachmentType.AsInteger);
    case TAttachmentType(rxEntytyAttachmentType.AsInteger) of
      UniversalTransferDocument:ShowUniversalTransferDocumentSellerTitleXml(FDiadocAPI, FBoxId, FDiadocAPI.GetEntityContent(FBoxId, FMessageID, rxEntytyEntityId.AsString));
      UniversalTransferDocumentBuyerTitle:ShowUniversalTransferDocumentBuyerTitle(FDiadocAPI, FDiadocAPI.GetEntityContent(FBoxId, FMessageID, rxEntytyEntityId.AsString));
      InvoiceConfirmation:ShowInvoiceConfirmation(FDiadocAPI, FDiadocAPI.GetEntityContent(FBoxId, FMessageID, rxEntytyEntityId.AsString), rxEntytyFileName.AsString);
      UniversalTransferDocumentRevision:ShowUniversalTransferDocumentRevision(FDiadocAPI, FBoxId, FDiadocAPI.GetEntityContent(FBoxId, FMessageID, rxEntytyEntityId.AsString));
    else
      ShowOtherAttach(FDiadocAPI, FDiadocAPI.GetEntityContent(FBoxId, FMessageID, rxEntytyEntityId.AsString), rxEntytyFileName.AsString);
    end;
  end;
end;

procedure TMessageForDocForm.Button2Click(Sender: TObject);
var
  R: TPrintFormResult;
  FFileName: String;
begin
  R:=FDiadocAPI.GeneratePrintForm(FBoxID, FMessageID, rxEntytyEntityId.AsString);
  if Assigned(R) then
  begin
    if R.RetryAfter > 0 then
      ShowMessageFmt('Система занята. Повтор запроса возможен через %d секунд.',[R.RetryAfter])
    else
    if R.HasContent then
    begin
      if R.FileName <> '' then
        FFileName:=GetTempDir(true) + R.FileName
      else
        FFileName:=GetTempDir(true) + 'tmp.pdf';
      R.Stream.SaveToFile(FFileName);
      OpenDocument(FFileName);
    end
    else
      ShowMessage('Пустой файл ответа');
    R.Free;
  end
  else
    ShowMessageFmt('Код ошибки: %d (%s)'#13'%s', [FDiadocAPI.ResultCode, FDiadocAPI.ResultString, FDiadocAPI.ResultText.Text]);
end;

procedure TMessageForDocForm.Button3Click(Sender: TObject);
var
  M: TMemoryStream;
begin
//  if rxEntytyContent_SIZE.AsInteger > 0 then
  begin
    M:=FDiadocAPI.GetEntityContent(FBoxId, FMessageID, rxEntytyEntityId.AsString);
    if Assigned(M) then
    begin
      SaveDialog1.FileName:=rxEntytyEntityType.AsString;
      if SaveDialog1.Execute then
        M.SaveToFile(SaveDialog1.FileName);
      M.Free;
    end
    else
      ErrorBox('Ошибка получения вложения');
  end;
end;

procedure TMessageForDocForm.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
end;

procedure TMessageForDocForm.OpenDocList(ADiadocAPI: TDiadocAPI; ABoxId,
  AMessageID: string; AMessage: TMessage);
var
  E: TEntity;
begin
  FDiadocAPI:=ADiadocAPI;
  FBoxId:=ABoxId;
  FMessageID:=AMessageID;
  FMessage:=AMessage;


  Edit1.Text:=FMessage.MessageId;
  Edit2.Text:=DateTimeToStr(TimestampTicksToDateTime(FMessage.TimestampTicks));
  Edit3.Text:=DateTimeToStr(TimestampTicksToDateTime(FMessage.LastPatchTimestampTicks));

  Edit4.Text:=FMessage.FromBoxId;
  Edit5.Text:=FMessage.FromTitle;

  Edit6.Text:=FMessage.ToBoxId;
  Edit7.Text:=FMessage.ToTitle;

  CheckBox1.Checked:=FMessage.IsDraft;
  CheckBox2.Checked:=FMessage.DraftIsLocked;
  CheckBox3.Checked:=FMessage.DraftIsRecycled;

  Edit8.Text:=FMessage.CreatedFromDraftId;

  CheckBox4.Checked:=FMessage.IsDeleted;
  CheckBox5.Checked:=FMessage.IsTest;
  CheckBox6.Checked:=FMessage.IsInternal;
  CheckBox7.Checked:=FMessage.IsProxified;

  Edit9.Text:=FMessage.ProxyBoxId;
  Edit10.Text:=FMessage.ProxyTitle;
  CheckBox8.Checked:=FMessage.PacketIsLocked;
  Memo1.Lines.Assign(FMessage.DraftIsTransformedToMessageIdList.Items);

  rxEntyty.Open;

  for E in FMessage.Entities do
  begin
    rxEntyty.Append;
    rxEntytyEntityType.AsString:=EntityTypeToStr(E.EntityType);
    rxEntytyEntityId.AsString:=E.EntityId;
    rxEntytyParentEntityId.AsString:=E.ParentEntityId;
    rxEntytyContent_SIZE.AsInteger:=E.Content.Size;
    rxEntytyAttachmentType.AsInteger:=Ord(E.AttachmentType);
    rxEntytyAttachmentTypeStr.AsString:=AttachmentTypeToStr(E.AttachmentType);
    rxEntytyFileName.AsString:=E.FileName;

(*    property NeedRecipientSignature:Boolean read FNeedRecipientSignature write FNeedRecipientSignature; //7
    property SignerBoxId:string read FSignerBoxId write FSignerBoxId; //8
    property NotDeliveredEventId:string read FNotDeliveredEventId write FNotDeliveredEventId; //10
    property DocumentInfo:TDocument read FDocumentInfo; //11
    property RawCreationDate:sfixed64 read FRawCreationDate write FRawCreationDate;//12
    property ResolutionInfo:TResolutionInfo read FResolutionInfo; //13;
    property SignerDepartmentId:string read FSignerDepartmentId write FSignerDepartmentId; //14;
    property ResolutionRequestInfo:TResolutionRequestInfo read FResolutionRequestInfo; //15;
    property ResolutionRequestDenialInfo:TResolutionRequestDenialInfo read FResolutionRequestDenialInfo; //16;
    property NeedReceipt:boolean read FNeedReceipt write FNeedReceipt; //17
    property PacketId:string read FPacketId write FPacketId; //18;
    property IsApprovementSignature:Boolean read FIsApprovementSignature write FIsApprovementSignature; //19
    property IsEncryptedContent:Boolean read FIsEncryptedContent write FIsEncryptedContent; //20
    property AttachmentVersion:string read FAttachmentVersion write FAttachmentVersion; //21;
    property ResolutionRouteAssignmentInfo:TResolutionRouteAssignmentInfo read FResolutionRouteAssignmentInfo;//22
    property ResolutionRouteRemovalInfo:TResolutionRouteRemovalInfo read FResolutionRouteRemovalInfo; //23
    property CancellationInfo:TCancellationInfo read FCancellationInfo; //24
    property Labels:TDocumentStrings read FLabels; //25; *)
    rxEntyty.Post;
  end;
  rxEntyty.First;
end;

end.

