unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  EditBtn, ExtCtrls, DiadocAPI, DiadocTypes_User, DiadocTypes_InvoiceInfo,
  DiadocTypes_UniversalTransferDocumentInfo, ddOrganizationUsersList,
  RxIniPropStorage, DividerBevel, httpsend;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CLabel: TLabel;
    DiadocAPI1: TDiadocAPI;
    DividerBevel1: TDividerBevel;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    FileNameEdit1: TFileNameEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
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
    RxIniPropStorage1: TRxIniPropStorage;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DiadocAPI1HttpStatus(Sender: TDiadocAPI; AHTTP: THTTPSend);
    procedure FormCreate(Sender: TObject);
  private
    FLoggedID:boolean;
    procedure SetupAPI;
    procedure ShowUserInfo;
  public
    procedure DoLogin;
    procedure WriteLog(S:string);
  end;

var
  Form1: TForm1;

implementation
uses ssl_openssl, ssl_openssl_lib;
{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  DoLogin;
  if FLoggedID then
  begin
    PageControl1.ActivePage:=TabSheet2;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  FInvInf: TInvoiceInfo;
  U1: TUniversalTransferDocumentSellerTitleInfo;
  F: TFileStream;
begin
  //lFInvInf:=DiadocAPI1.ParseInvoiceXml();
  F:=TFileStream.Create(FileNameEdit1.Text, fmOpenRead);
  U1:=DiadocAPI1.ParseUniversalTransferDocumentSellerTitleXml(F);
  if Assigned(U1) then
  begin
    Edit8.Text:=FunctionTypeToStr(U1.FunctionType);
    Edit9.Text:=U1.DocumentName;
    Edit10.Text:=U1.DocumentDate;
    Edit11.Text:=U1.DocumentNumber;

    Edit12.Text:=U1.Seller.OrgName;
    Edit13.Text:=U1.Buyer.OrgName;
(*

    property Seller:TExtendedOrganizationInfo read FSeller; //5;
    property Buyer:TExtendedOrganizationInfo read FBuyer; //6;
    property Shipper:TShipper read FShipper; //7;
    property Consignee:TExtendedOrganizationInfo read FConsignee; //8;
    property Signers:TExtendedSigners read FSigners; // = 9;
    property PaymentDocuments:TPaymentDocumentInfos read FPaymentDocuments;//10;
    property InvoiceTable:TInvoiceTable read FInvoiceTable; //11
    property Currency:string read FCurrency write SetCurrency;//12;
    property CurrencyRate:string read FCurrencyRate write SetCurrencyRate; //13;
    property RevisionDate:string read FRevisionDate write SetRevisionDate; //14;
    property RevisionNumber:string read FRevisionNumber write SetRevisionNumber; //15;
    property AdditionalInfoId:TAdditionalInfoId read FAdditionalInfoId; //16
    property TransferInfo:TTransferInfo read FTransferInfo; //17;
    property DocumentCreator:string read FDocumentCreator write SetDocumentCreator;//18;
    property DocumentCreatorBase:string read FDocumentCreatorBase write SetDocumentCreatorBase;//19;
    property GovernmentContractInfo:string read FGovernmentContractInfo write SetGovernmentContractInfo;//20
*)
    U1.Free;
  end;
  F.Free;
end;

procedure TForm1.DiadocAPI1HttpStatus(Sender: TDiadocAPI; AHTTP: THTTPSend);
begin
  WriteLog(Format('ResultCode: %d.  ResultString: "%s".', [Sender.ResultCode, Sender.ResultString]));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLoggedID:=false;
  PageControl1.ActivePageIndex:=0;
end;

procedure TForm1.SetupAPI;
begin
  DiadocAPI1.UserName:=Edit1.Text;
  DiadocAPI1.Password:=Edit2.Text;
  DiadocAPI1.ApiClientId:=Edit3.Text;
end;

procedure TForm1.ShowUserInfo;
var
  U: TUser;
begin
  U:=DiadocAPI1.GetMyUser;
  if Assigned(U) then
  begin
    Edit4.Text:=U.Id;
    Edit5.Text:=U.LastName;
    Edit6.Text:=U.FirstName;
    Edit7.Text:=U.MiddleName;
    FreeAndNil(U);
    FLoggedID:=true;
  end;
end;

procedure TForm1.DoLogin;
begin
  SetupAPI;
  ShowUserInfo;
  TabSheet2.TabVisible:=FLoggedID;

  Edit1.Enabled:=not FLoggedID;
  Edit2.Enabled:=not FLoggedID;
  Edit3.Enabled:=not FLoggedID;
  Edit4.Enabled:=not FLoggedID;
  Edit5.Enabled:=not FLoggedID;
  Edit6.Enabled:=not FLoggedID;
  Edit7.Enabled:=not FLoggedID;
end;

procedure TForm1.WriteLog(S: string);
begin
  Memo1.Lines.Add(S);
end;

end.

