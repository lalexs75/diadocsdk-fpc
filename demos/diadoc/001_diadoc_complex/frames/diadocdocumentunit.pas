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

unit DiadocDocumentUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ExtCtrls, StdCtrls, EditBtn, rxmemds,
  Dialogs, Menus, ActnList,
  rxdbgrid, rxtooledit, DB, DiadocAPI,
  DiadocTypes_Organization,
  DiadocTypes_DocumentType,
  DiadocTypes_DiadocMessage_GetApi,
  DiadocTypes,
  diadoc_consts, DiadocTypes_DocumentId,
  DiadocTypes_Document,
  DiadocTypes_DocumentList;

type

  { TDiadocDocumentFrame }

  TDiadocDocumentFrame = class(TFrame)
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    newUPD: TAction;
    actMoveDocBetweenDeps: TAction;
    Button5: TButton;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    OrgBoxInfo: TAction;
    msgShow: TAction;
    ActionList1: TActionList;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    dDocs: TDataSource;
    EditButton1: TEditButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    RxDateEdit1: TRxDateEdit;
    RxDateEdit2: TRxDateEdit;
    RxDBGrid1: TRxDBGrid;
    rxDocs: TRxMemoryData;
    rxDocsCounteragentBoxId: TStringField;
    rxDocsCreationTimestampTicks: TDateTimeField;
    rxDocsDepartmentId: TStringField;
    rxDocsDocumentDate: TDateField;
    rxDocsDocumentNumber: TStringField;
    rxDocsDocumentType: TLongintField;
    rxDocsDocumentTypeStr: TStringField;
    rxDocsEntityId: TStringField;
    rxDocsFileName: TStringField;
    rxDocsIndexKey: TStringField;
    rxDocsMessageId: TStringField;
    rxDocsSUMM: TStringField;
    procedure actMoveDocBetweenDepsExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure EditButton1ButtonClick(Sender: TObject);
    procedure msgShowExecute(Sender: TObject);
    procedure newUPDExecute(Sender: TObject);
    procedure OrgBoxInfoExecute(Sender: TObject);
    procedure rxDocsAfterOpen(DataSet: TDataSet);
  private
    FDiadocAPI: TDiadocAPI;

    FDocumentType: TDocumentTypeFilter;
    FDocumentClass: TDocumentFilterClass;
    FDocumentStatus: TDocumentFilterStatus;

    FLastIndex:string;
    FTotalCount:integer;

    FCurOrgID:string;
    FCurOrgINN:string;
    FCurOrgBoxID:string;

    FBox: TBox;
    FOrgs:TOrganization;
    procedure InitFiltres;
    procedure ClearOrg;
    procedure UpdateCtrlStates;

    procedure AppendDoc(D:TDocument);
    procedure FetchDocList;
    procedure ShowDiadocStatus;
  public
    destructor Destroy; override;
    procedure InitFrame(ADiadocAPI: TDiadocAPI; ABox:TBox; AOrgs:TOrganization);
  end;

implementation
uses DiadocTypes_UniversalTransferDocumentInfo, diadoc_utils, ContragentFindUnit, ShowBoxInfoUnit, SelectDepartmentUnit,
  DiadocTypes_DocumentsMoveOperation, DiadocTypes_DiadocMessage_PostApi, rxAppUtils,
  MessageForDocUnit, upd820_revision, ddNewDocUTDUnit, rxlogging;

{$R *.lfm}

{ TDiadocDocumentFrame }

procedure TDiadocDocumentFrame.Button3Click(Sender: TObject);
begin
  rxDocs.CloseOpen;
  FDocumentType:=TDocumentTypeFilter(ComboBox2.ItemIndex);
  FDocumentClass:=TDocumentFilterClass(ComboBox1.ItemIndex);
//  FDocumentStatus: TDocumentFilterClass}
  FLastIndex:='';
  FetchDocList;
  rxDocs.First;
  rxDocsAfterOpen(nil);
end;

procedure TDiadocDocumentFrame.Button4Click(Sender: TObject);
begin
  FetchDocList;
end;

procedure TDiadocDocumentFrame.Button2Click(Sender: TObject);
var
  M: TMessage;
begin
  if rxDocs.RecordCount = 0 then Exit;
  M:=FDiadocAPI.GetMessage(FBox.BoxId, rxDocsMessageId.AsString, '', false, false);
  MessageForDocForm:=TMessageForDocForm.Create(Application);
  MessageForDocForm.OpenDocList(FDiadocAPI, FBox.BoxId, rxDocsMessageId.AsString, M);
  MessageForDocForm.ShowModal;
  MessageForDocForm.Free;
  M.Free;
end;

procedure TDiadocDocumentFrame.Button1Click(Sender: TObject);
var
  M: TMessage;
//  E: TEntity;
  S: String;
begin
  if rxDocs.RecordCount = 0 then Exit;
  M:=FDiadocAPI.GetMessage(FBox.BoxId, rxDocsMessageId.AsString, '', false, false);
//  E:=FindEntitie(M, UniversalTransferDocument);
  S:=rxDocsEntityId.AsString;

  case TDocumentType(rxDocsDocumentType.AsInteger) of
    TDocumentType.UniversalTransferDocument:ShowUniversalTransferDocumentSellerTitleXml(FDiadocAPI, FBox.BoxId, FDiadocAPI.GetEntityContent(FBox.BoxId, rxDocsMessageId.AsString, S));
    TDocumentType.UniversalTransferDocumentRevision:ShowUniversalTransferDocumentRevision(FDiadocAPI, FBox.BoxId, FDiadocAPI.GetEntityContent(FBox.BoxId, rxDocsMessageId.AsString, S));
    TDocumentType.XmlTorg12:ShowTorg12Xml(FDiadocAPI, FDiadocAPI.GetEntityContent(FBox.BoxId, rxDocsMessageId.AsString, S));
    TDocumentType.Invoice:ShowUniversalTransferDocumentSellerTitleXml(FDiadocAPI, FBox.BoxId, FDiadocAPI.GetEntityContent(FBox.BoxId, rxDocsMessageId.AsString, S));
  else
    ShowMessage('УПД не найдена');
  end;
  M.Free;
end;

procedure TDiadocDocumentFrame.actMoveDocBetweenDepsExecute(Sender: TObject);
var
  MO: TDocumentsMoveOperation;
  D: TDocumentId;
  M: TMessage;
  E: TEntity;
begin
  SelectDepartmentForm:=TSelectDepartmentForm.Create(Application);
  SelectDepartmentForm.FillDepsList(FOrgs);
  if SelectDepartmentForm.ShowModal = mrOk then
  begin
    MO:=TDocumentsMoveOperation.Create;

    MO.BoxId:=FBox.BoxId;
    MO.ToDepartmentId:=SelectDepartmentForm.SelectedDepartment;

    RxWriteLog(etCustom, 'BoxId = ' + MO.BoxId);
    RxWriteLog(etCustom, 'MO.ToDepartmentId = ' + MO.ToDepartmentId);

    M:=FDiadocAPI.GetMessage(FBox.BoxId, rxDocsMessageId.AsString, '', false, false);

{    for E in M.Entities do
    begin
      D:=MO.DocumentIds.AddItem;
      D.MessageId:=M.MessageId;
      D.EntityId:=E.EntityId;
      RxWriteLog(etCustom, '%s:%s', [M.MessageId, E.EntityId]);
    end;}

    E:=M.Entities[0];
    D:=MO.DocumentIds.AddItem;
    D.MessageId:=M.MessageId;
    D.EntityId:=E.EntityId;
    RxWriteLog(etCustom, '%s:%s', [M.MessageId, E.EntityId]);

    if FDiadocAPI.MoveDocuments(MO) then
      ShowMessage('Успешно')
    else
      ErrorBox('Ошибка %d : %s '+LineEnding+'(%s)', [FDiadocAPI.ResultCode, FDiadocAPI.ResultString, FDiadocAPI.ResultText.Text]);
    M.Free;
    MO.Free;

    Button3Click(nil);
  end;
  SelectDepartmentForm.Free;
end;

procedure TDiadocDocumentFrame.CheckBox1Change(Sender: TObject);
begin
  UpdateCtrlStates;
end;

procedure TDiadocDocumentFrame.EditButton1ButtonClick(Sender: TObject);
begin
  ContragentFindForm:=TContragentFindForm.Create(Application);
  ContragentFindForm.InitForm(FDiadocAPI);
  if FCurOrgINN <> '' then
  begin
    ContragentFindForm.edtINN.Text:=FCurOrgINN;
    ContragentFindForm.Button1Click(nil);
  end;

  if ContragentFindForm.ShowModal = mrOk then
  begin
    ClearOrg;
    if Assigned(ContragentFindForm.CurOrg) then
    begin
      FCurOrgID:=ContragentFindForm.CurOrg.OrgId;
      FCurOrgINN:=ContragentFindForm.CurOrg.Inn;
      if ContragentFindForm.CurOrg.Boxes.Count > 0 then
        FCurOrgBoxID:=ContragentFindForm.CurOrg.Boxes[0].BoxId;
      EditButton1.Text:=ContragentFindForm.CurOrg.FullName;
    end;
  end;
  ContragentFindForm.Free;
end;

procedure TDiadocDocumentFrame.msgShowExecute(Sender: TObject);
begin
  //
end;

procedure TDiadocDocumentFrame.newUPDExecute(Sender: TObject);

procedure DoTestSend(AUPDXml: TMemoryStream);
var
  AMsg: TMessageToPost;
  Invoice:TXmlDocumentAttachment;
  IDs: TDocumentId;
  M: TMessage;
begin
  AMsg:=TMessageToPost.Create;
  AMsg.FromBoxId:=FBox.BoxId;
  AMsg.ToBoxId:='7c715969e0034816b1037da20541a83a@diadoc.ru'; //только для внешней отправки - опторг
  AMsg.FromDepartmentId:='00000000-0000-0000-0000-000000000000';
  //AMsg.ToDepartmentId:='1771d98f-aa6d-478a-9419-e51f659085ac';
  //AMsg.IsInternal:=true;

    Invoice:=AMsg.Invoices.AddItem;
    //Invoice.SignedContent.Content:=
    //Invoice.SignedContent.Signature;
    Invoice.SignedContent.LoadContent(AUPDXml);
    //Invoice.SignedContent.NameOnShelf
    //Invoice.SignedContent.SignWithTestSignature:=true;
    //Invoice.SignedContent.SignatureNameOnShelf
    Invoice.Comment:='Тестовоое сообщение с тестовой УПД';
    //IDs:=Invoice.InitialDocumentIds.AddItem;
    //Invoice.SubordinateDocumentIds
    //Invoice.CustomDocumentId
    Invoice.NeedReceipt:=true;
    //Invoice.CustomData;

  AMsg.IsDraft:=true;
  //AMsg.LockDraft
  //AMsg.StrictDraftValidation:=false;
  //AMsg.IsInternal
  //AMsg.DelaySend
  //AMsg.LockPacket:Boolean read FLockPacket write FLockPacket; //32
  //AMsg.LockMode:TLockMode read FLockMode write FLockMode;//35 [default = None];

  M:=FDiadocAPI.PostDiadocMessage(AMsg, '');

  ShowDiadocStatus;

  if Assigned(M) then
    M.Free;
  AMsg.Free;
end;

var
  D: TUniversalTransferDocumentSellerTitleInfo;
  M: TMemoryStream;
begin
{  D:=NewUniversalTransferDocumentSellerTitleInfo;
  D.SaveToFile('/tmp/UniversalTransferDocumentSellerTitleInfo.protobuf');


  M:=FDiadocAPI.GenerateUniversalTransferDocumentXmlForSeller(D, true, 'utd_05_01_05');

  ShowDiadocStatus;

  if Assigned(M) then
  begin
    M.SaveToFile('/tmp/UniversalTransferDocumentXmlForSeller.xml');
    M.Position:=0;
//    DoTestSend(M);
    M.Free;
  end;
  D.Free;}
end;

procedure TDiadocDocumentFrame.OrgBoxInfoExecute(Sender: TObject);
begin
  ShowBoxInfo(rxDocsCounteragentBoxId.AsString, FDiadocAPI);
end;

procedure TDiadocDocumentFrame.rxDocsAfterOpen(DataSet: TDataSet);
begin
  msgShow.Enabled:=rxDocs.Active and (rxDocs.RecordCount > 0);
  OrgBoxInfo.Enabled:=rxDocs.Active and (rxDocs.RecordCount > 0);
end;

procedure TDiadocDocumentFrame.InitFiltres;
var
  i: TDocumentTypeFilter;
  j: TDocumentFilterStatus;
begin
  ComboBox2.Items.Clear;
  for i:=Low(TDocumentTypeFilter) to High(TDocumentTypeFilter) do
    ComboBox2.Items.Add(DocumentTypeFilterDescription(i));
  ComboBox2.ItemIndex:=ComboBox2.Items.Count-1;

  ComboBox3.Items.Clear;
  for j:=Low(TDocumentFilterStatus) to High(TDocumentFilterStatus) do
    ComboBox3.Items.Add(DocumentFilterStatusDesc(J));
  ComboBox3.ItemIndex:=0; //ComboBox3.Items.Count-1;

  CheckBox1Change(nil);

  RxDateEdit1.Date:=Now - 10;
  RxDateEdit2.Date:=Now + 1;
end;

procedure TDiadocDocumentFrame.ClearOrg;
begin
  FCurOrgID:='';
  FCurOrgINN:='';
  FCurOrgBoxID:='';
  EditButton1.Text:='';
end;

procedure TDiadocDocumentFrame.UpdateCtrlStates;
begin
  Label2.Enabled:=CheckBox1.Checked;
  Label3.Enabled:=CheckBox1.Checked;
  RxDateEdit1.Enabled:=CheckBox1.Checked;
  RxDateEdit2.Enabled:=CheckBox1.Checked;

  EditButton1.Enabled:=CheckBox2.Checked;
  if not CheckBox2.Checked then
    ClearOrg;

  rxDocsAfterOpen(nil);
end;

procedure TDiadocDocumentFrame.AppendDoc(D: TDocument);
begin
  rxDocs.Append;
  rxDocsIndexKey.AsString:=D.IndexKey;
  rxDocsMessageId.AsString:=D.MessageId;
  rxDocsEntityId.AsString:=D.EntityId;
  rxDocsCreationTimestampTicks.AsDateTime:=TimestampTicksToDateTime(D.CreationTimestampTicks);
  rxDocsCounteragentBoxId.AsString:=D.CounteragentBoxId;
  rxDocsDocumentType.AsInteger:=Ord(D.DocumentType);
  rxDocsDocumentTypeStr.AsString:=DocumentTypeToDescription(D.DocumentType);
  rxDocsFileName.AsString:=D.FileName;
  rxDocsDepartmentId.AsString:=D.DepartmentId;


  if D.DocumentDate<>'' then
    rxDocsDocumentDate.AsDateTime:=StrToDate(D.DocumentDate);

  rxDocsDocumentNumber.AsString:=D.DocumentNumber;

  case D.DocumentType of
    //UnknownDocumentType = -1,
    //Nonformalized = 0,
    //Invoice = 1,
    //TrustConnectionRequest = 11,
    //Torg12 = 12,
    //InvoiceRevision = 13,
    //InvoiceCorrection = 14,
    //InvoiceCorrectionRevision = 15,
    //AcceptanceCertificate = 16,
    //ProformaInvoice = 18,
    TDocumentType.XmlTorg12:begin
        rxDocsSUMM.AsString:=D.Torg12Metadata.Total;
      end;
    //XmlAcceptanceCertificate = 20,
    //PriceList = 26,
    //PriceListAgreement = 30,
    //CertificateRegistry = 34,
    //ReconciliationAct = 35,
    //Contract = 36,
    //Torg13 = 37,
    //ServiceDetails = 38,
    //SupplementaryAgreement = 40,
    TDocumentType.UniversalTransferDocument:begin
        rxDocsSUMM.AsString:=D.UniversalTransferDocumentMetadata.Total;
      end;
    //UniversalTransferDocumentRevision = 45,
    //UniversalCorrectionDocument = 49,
    //UniversalCorrectionDocumentRevision = 50
  end;

(*
  property InitialDocumentIds:TDocumentIds read FInitialDocumentIds;                  //7
  property SubordinateDocumentIds:TDocumentIds read FSubordinateDocumentIds;          //8
  property Content:TContent read FContent;                                            //9;

  property NonformalizedDocumentMetadata:TNonformalizedDocumentMetadata read FNonformalizedDocumentMetadata; //13
  property InvoiceMetadata:TInvoiceMetadata read FInvoiceMetadata;                    //14
  property TrustConnectionRequestMetadata:TTrustConnectionRequestMetadata read FTrustConnectionRequestMetadata; //15
  property Torg12Metadata:TBasicDocumentMetadata read FTorg12Metadata;                //16;
  property InvoiceRevisionMetadata:TInvoiceRevisionMetadata read FInvoiceRevisionMetadata;//17
  property InvoiceCorrectionMetadata:TInvoiceCorrectionMetadata read FInvoiceCorrectionMetadata; // 18;
  property InvoiceCorrectionRevisionMetadata:TInvoiceCorrectionRevisionMetadata read FInvoiceCorrectionRevisionMetadata; //19
  property AcceptanceCertificateMetadata:TAcceptanceCertificateMetadata read FAcceptanceCertificateMetadata; //20
  property ProformaInvoiceMetadata:TProformaInvoiceMetadata read FProformaInvoiceMetadata; //21
  property XmlTorg12Metadata:TBasicDocumentMetadata read FXmlTorg12Metadata; //22;
  property XmlAcceptanceCertificateMetadata:TBasicDocumentMetadata read FXmlAcceptanceCertificateMetadata; //23;
  property IsDeleted:Boolean read FIsDeleted write FIsDeleted; //24
  property DepartmentId:string read FDepartmentId write FDepartmentId; //25
  property IsTest:Boolean read FIsTest write FIsTest; //26
  property FromDepartmentId:string read FFromDepartmentId write FFromDepartmentId; //27
  property ToDepartmentId:string read FToDepartmentId write FToDepartmentId; //28;
  property PriceListMetadata:TPriceListMetadata read FPriceListMetadata; //29;
  property CustomDocumentId:string read FCustomDocumentId write FCustomDocumentId; //30;
  property ResolutionStatus:TResolutionStatus read FResolutionStatus; //31;
  property RevocationStatus:TRevocationStatus read FRevocationStatus write FRevocationStatus; //32
  property SendTimestampTicks:sfixed64 read FSendTimestampTicks write FSendTimestampTicks; //33;
  property DeliveryTimestampTicks:sfixed64 read FDeliveryTimestampTicks write FDeliveryTimestampTicks; //34;
  property ForwardDocumentEvents:TForwardDocumentEvents read FForwardDocumentEvents; // = 35;
  property ReconciliationActMetadata:TBilateralDocumentMetadata read FReconciliationActMetadata; //38
  property ContractMetadata:TContractMetadata read FContractMetadata; //39;

  property Torg13Metadata:TBasicDocumentMetadata read FTorg13Metadata; //40;
  property ServiceDetailsMetadata:TServiceDetailsMetadata read FServiceDetailsMetadata; //41
  property RoamingNotificationStatus:TRoamingNotificationStatus read FRoamingNotificationStatus write FRoamingNotificationStatus default UnknownRoamingNotificationStatus; // = 42 ;

  property HasCustomPrintForm:Boolean read FHasCustomPrintForm write FHasCustomPrintForm; //43
  property CustomData:TCustomDataItems read FCustomData; //44
  property PacketId:string read FPacketId write FPacketId; //45;
  property DocumentDirection:TDocumentDirection read FDocumentDirection write FDocumentDirection default UnknownDocumentDirection; //46
  property LastModificationTimestampTicks:sfixed64 read FLastModificationTimestampTicks write FLastModificationTimestampTicks; //47;
  property IsEncryptedContent:Boolean read FIsEncryptedContent write FIsEncryptedContent; // 48;
  property SenderSignatureStatus:TSenderSignatureStatus read FSenderSignatureStatus write FSenderSignatureStatus default UnknownSenderSignatureStatus; //49

  property SupplementaryAgreementMetadata:TSupplementaryAgreementMetadata read FSupplementaryAgreementMetadata; //50;
  property IsRead:Boolean read FIsRead write FIsRead; //51
  property RoamingNotificationStatusDescription:string read FRoamingNotificationStatusDescription write FRoamingNotificationStatusDescription; //52;
  property PacketIsLocked:Boolean read FPacketIsLocked write FPacketIsLocked; //53
  property PriceListAgreementMetadata:TNonformalizedDocumentMetadata read FPriceListAgreementMetadata; //54
  property CertificateRegistryMetadata:TNonformalizedDocumentMetadata read FCertificateRegistryMetadata; //55
  property UniversalTransferDocumentMetadata:TUniversalTransferDocumentMetadata read fUniversalTransferDocumentMetadata; //56
  property UniversalTransferDocumentRevisionMetadata:TUniversalTransferDocumentRevisionMetadata read FUniversalTransferDocumentRevisionMetadata; //57
  property UniversalCorrectionDocumentMetadata:TUniversalCorrectionDocumentMetadata read FUniversalCorrectionDocumentMetadata; //58;
  property UniversalCorrectionDocumentRevisionMetadata:TUniversalCorrectionDocumentRevisionMetadata read FUniversalCorrectionDocumentRevisionMetadata; //59;
  property ResolutionRouteId:string read FResolutionRouteId write FResolutionRouteId;//60
  property AttachmentVersion:string read FAttachmentVersion write FAttachmentVersion;//61;
  property ProxySignatureStatus:TProxySignatureStatus read FProxySignatureStatus write FProxySignatureStatus default UnknownProxySignatureStatus;//62
  property TypeNamedId:string read FTypeNamedId write FTypeNamedId; //63;
  property DocFunction:string read FDocFunction write FDocFunction; //64;
  property WorkflowId:int32 read FWorkflowId write FWorkflowId;     //65;
  property Title:string read FTitle write FTitle;                   //66;
  property Metadata:TMetadataItems read FMetadata; //67;
  property RecipientReceiptMetadata:TRecipientReceiptMetadata read FRecipientReceiptMetadata; //68;
  property ConfirmationMetadata:TConfirmationMetadata read FConfirmationMetadata; //69;
  property RecipientResponseStatus:TRecipientResponseStatus read FRecipientResponseStatus write FRecipientResponseStatus default RecipientResponseStatusUnknown; //70
  property AmendmentRequestMetadata:TAmendmentRequestMetadata read FAmendmentRequestMetadata; //71;
  property Origin:TOrigin read FOrigin; //72;
*)
  rxDocs.Post;
end;

procedure TDiadocDocumentFrame.FetchDocList;
var
  D: TDocument;
  FFromDocumentDate, FToDocumentDate, FCurBoxID: String;
  Docs: TDocumentList;
begin
  if CheckBox1.Checked then
  begin
    FFromDocumentDate:=DateToStr(RxDateEdit1.Date);
    FToDocumentDate:=DateToStr(RxDateEdit2.Date);
  end
  else
  begin
    FFromDocumentDate:='';
    FToDocumentDate:='';
  end;

  FCurBoxID:='';
  if CheckBox2.Checked then
    FCurBoxID:=FCurOrgBoxID;


  Docs:=FDiadocAPI.GetDocuments(FBox.BoxId, FDocumentType, FDocumentClass, dfsAny, '', FCurBoxID, FFromDocumentDate, FToDocumentDate, FLastIndex);

  if Assigned(Docs) then
  begin
    if FLastIndex = '' then
    begin
      FTotalCount:=Docs.TotalCount;
      Label1.Caption:=IntToStr(FTotalCount);
    end;
    for D in Docs.Documents do
    begin
      AppendDoc(D);
      FLastIndex:=D.IndexKey;
    end;
    Docs.Free;
  end
  else
    ShowMessageFmt('Error %d (%s)', [FDiadocAPI.ResultCode, FDiadocAPI.ResultString]);
end;

procedure TDiadocDocumentFrame.ShowDiadocStatus;
begin
  if FDiadocAPI.ResultCode <> 200 then
    ErrorBox('Ошибка %d : %s '+LineEnding+'(%s)', [FDiadocAPI.ResultCode, FDiadocAPI.ResultString, FDiadocAPI.ResultText.Text])
  else
    ShowMessage('Успешно');
end;

destructor TDiadocDocumentFrame.Destroy;
begin
  ClearOrg;
  inherited Destroy;
end;


procedure TDiadocDocumentFrame.InitFrame(ADiadocAPI: TDiadocAPI; ABox: TBox;
  AOrgs: TOrganization);
begin
  FBox:=ABox;
  FOrgs:=AOrgs;
  FDiadocAPI:=ADiadocAPI;
  InitFiltres;
  UpdateCtrlStates;
end;

end.

