{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2019 Lagunov Aleksey alexs75@yandex.ru

  base on docs from http://api-docs.diadoc.ru

  This library is free software; you can redistribute it and/or modify it
  under the terms of the GNU Library General Public License as published by
  the Free Software Foundation; either version 2 of the License, or (at your
  option) any later version with the following modification:

  As a special exception, the copyright holders of this library give you
  permission to link this library with independent modules to produce an
  executable, regardless of the license terms of these independent modules,and
  to copy and distribute the resulting executable under terms of your choice,
  provided that you also meet, for each linked independent module, the terms
  and conditions of the license of that module. An independent module is a
  module which is not derived from or based on this library. If you modify
  this library, you may extend this exception to your version of the library,
  but you are not obligated to do so. If you do not wish to do so, delete this
  exception statement from your version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License
  for more details.

  You should have received a copy of the GNU Library General Public License
  along with this library; if not, write to the Free Software Foundation,
  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
}

{ Структуры данных базируются на информации http://api-docs.diadoc.ru/ru/latest/DataStructures.html }

unit DiadocTypes_Docflow;

{$I diadoc_define.inc}

interface

(*
import "Timestamp.proto";
import "CustomDataItem.proto";
import "Docflow/Attachment.proto";
import "Docflow/InvoiceDocflow.proto";
import "Docflow/UnilateralDocflow.proto";
import "Docflow/BilateralDocflow.proto";
import "Docflow/XmlBilateralDocflow.proto";
import "Docflow/RevocationDocflow.proto";
import "Docflow/ResolutionDocflow.proto";
import "Docflow/UniversalTransferDocumentDocflow.proto";
import "Docflow/RoamingNotification.proto";
*)
uses
  Classes, SysUtils, protobuf_fpc,
  DiadocTypes_Timestamp,
  DiadocTypes_Attachment,
  DiadocTypes_CustomDataItem,
  DiadocTypes_InvoiceDocflow,
  DiadocTypes_UnilateralDocflow,
  DiadocTypes_BilateralDocflow,
  DiadocTypes_XmlBilateralDocflow,
  DiadocTypes_RevocationDocflow,
  DiadocTypes_ResolutionDocflow,
  DiadocTypes_UniversalTransferDocumentDocflow,
  RoamingNotification
  ;

type
  TDocflowStatusSeverity = ( //enum DocflowStatusSeverity
    dssUnknownDocflowStatusSeverity = 0,
    dssInfo = 1,
    dssSuccess = 2,
    dssWarning = 3,
    dssError = 4
  );

  { TDocflowStatusModel }
  //message DocflowStatusModel
  //{
  //	optional DocflowStatusSeverity Severity = 1 [default = UnknownDocflowStatusSeverity];
  //	optional string StatusText = 2;
  //	optional string StatusHint = 3;
  //}
  TDocflowStatusModel = class(TSerializationObject) //message DocflowStatusModel
  private
    FSeverity: TDocflowStatusSeverity;
    FStatusHint: string;
    FStatusText: string;
    procedure SetSeverity(AValue: TDocflowStatusSeverity);
    procedure SetStatusHint(AValue: string);
    procedure SetStatusText(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Severity:TDocflowStatusSeverity read FSeverity write SetSeverity default dssUnknownDocflowStatusSeverity; // 1
    property StatusText:string read FStatusText write SetStatusText; //2;
    property StatusHint:string read FStatusHint write SetStatusHint; //3;
  end;

  {  TDocflowStatus  }
  //message DocflowStatus
  //{
  //	optional DocflowStatusModel PrimaryStatus = 1;
  //	optional DocflowStatusModel SecondaryStatus = 2;
  //}
  TDocflowStatus = class(TSerializationObject) //message DocflowStatus
  private
    FPrimaryStatus: TDocflowStatusModel;
    FSecondaryStatus: TDocflowStatusModel;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property PrimaryStatus:TDocflowStatusModel read FPrimaryStatus; //1;
    property SecondaryStatus:TDocflowStatusModel read FSecondaryStatus; //2;
  end;

(*
  //message RoamingNotification
  //{
  //	required Entity Notification = 1;
  //	required bool IsSuccess = 2;
  //}

  { TRoamingNotification }

  TRoamingNotification = class(TSerializationObject) //message RoamingNotification
  private
    FIsSuccess: Boolean;
    FNotification: TEntity;
    procedure SetIsSuccess(AValue: Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Notification:TEntity read FNotification; //1;
    property IsSuccess:Boolean read FIsSuccess write SetIsSuccess; //2;
  end;
*)
  {  TDocflow  }
  //message Docflow
  //{
  //	optional bool IsFinished = 1;
  //
  //	optional SignedAttachment DocumentAttachment = 2;
  //
  //	optional string DepartmentId = 3;
  //	optional bool DocumentIsDeleted = 4;
  //	optional DocflowStatus DocflowStatus = 5;
  //	optional Timestamp SendTimestamp = 6;
  //	optional Timestamp DeliveryTimestamp = 7;
  //
  //	optional InboundInvoiceDocflow InboundInvoiceDocflow = 8;   // for Invoice, InvoiceRevision, InvoiceCorrection, InvoiceCorrectionRevision
  //	optional OutboundInvoiceDocflow OutboundInvoiceDocflow = 9; // for Invoice, InvoiceRevision, InvoiceCorrection, InvoiceCorrectionRevision
  //	optional XmlBilateralDocflow XmlBilateralDocflow = 10;      // for XmlTorg12, XmlAcceptanceCertificate
  //	optional BilateralDocflow BilateralDocflow = 11;            // for Nonformalized, Torg12, AcceptanceCertificate, TrustConnectionRequest, PriceList, PriceListAgreement, CertificateRegistry, ReconciliationAct, Contract, Torg13
  //	optional UnilateralDocflow UnilateralDocflow = 12;          // for ProformaInvoice, ServiceDetails
  //	optional RevocationDocflow RevocationDocflow = 13;
  //	optional ResolutionDocflow ResolutionDocflow = 14;
  //
  //	optional bool CanDocumentBeRevokedUnilaterallyBySender = 15;
  //	optional string PacketId = 16;
  //
  //	repeated CustomDataItem CustomData = 17;
  //
  //	optional InboundUniversalTransferDocumentDocflow InboundUniversalTransferDocumentDocflow = 18; // for UniversalTransferDocument, UniversalTransferDocumentRevision, UniversalCorrectionDocument
  //	optional OutboundUniversalTransferDocumentDocflow OutboundUniversalTransferDocumentDocflow = 19; // for UniversalTransferDocument, UniversalTransferDocumentRevision, UniversalCorrectionDocument
  //
  //	optional RoamingNotification RoamingNotification = 20;
  //}
  TDocflow = class(TSerializationObject) //message Docflow
  private
    FBilateralDocflow: TBilateralDocflow;
    FCanDocumentBeRevokedUnilaterallyBySender: Boolean;
    FCustomData: TCustomDataItems;
    FDeliveryTimestamp: TTimestamp;
    FDepartmentId: string;
    FDocflowStatus: TDocflowStatus;
    FDocumentAttachment: TSignedAttachment;
    FDocumentIsDeleted: Boolean;
    FInboundInvoiceDocflow: TInboundInvoiceDocflow;
    FInboundUniversalTransferDocumentDocflow: TInboundUniversalTransferDocumentDocflow;
    FIsFinished: Boolean;
    FOutboundInvoiceDocflow: TOutboundInvoiceDocflow;
    FOutboundUniversalTransferDocumentDocflow: TOutboundUniversalTransferDocumentDocflow;
    FPacketId: string;
    FResolutionDocflow: TResolutionDocflow;
    FRevocationDocflow: TRevocationDocflow;
    FRoamingNotification: TRoamingNotification;
    FSendTimestamp: TTimestamp;
    FUnilateralDocflow: TUnilateralDocflow;
    FXmlBilateralDocflow: TXmlBilateralDocflow;
    procedure SetCanDocumentBeRevokedUnilaterallyBySender(AValue: Boolean);
    procedure SetDepartmentId(AValue: string);
    procedure SetDocumentIsDeleted(AValue: Boolean);
    procedure SetIsFinished(AValue: Boolean);
    procedure SetPacketId(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property IsFinished:Boolean read FIsFinished write SetIsFinished; //1;
    property DocumentAttachment:TSignedAttachment read FDocumentAttachment; //2;
    property DepartmentId:string read FDepartmentId write SetDepartmentId; //3;
    property DocumentIsDeleted:Boolean read FDocumentIsDeleted write SetDocumentIsDeleted; //4;
    property DocflowStatus:TDocflowStatus read FDocflowStatus; //5;
    property SendTimestamp:TTimestamp read FSendTimestamp; //6;
    property DeliveryTimestamp:TTimestamp read FDeliveryTimestamp; //7;
    property InboundInvoiceDocflow:TInboundInvoiceDocflow read FInboundInvoiceDocflow; //8;
    property OutboundInvoiceDocflow:TOutboundInvoiceDocflow read FOutboundInvoiceDocflow; //9;
    property XmlBilateralDocflow:TXmlBilateralDocflow read FXmlBilateralDocflow; //10;
    property BilateralDocflow:TBilateralDocflow read FBilateralDocflow; //11;
    property UnilateralDocflow:TUnilateralDocflow read FUnilateralDocflow; //12;
    property RevocationDocflow:TRevocationDocflow read FRevocationDocflow; //13;
    property ResolutionDocflow:TResolutionDocflow read FResolutionDocflow; //14;
    property CanDocumentBeRevokedUnilaterallyBySender:Boolean read FCanDocumentBeRevokedUnilaterallyBySender write SetCanDocumentBeRevokedUnilaterallyBySender; //15;
    property PacketId:string read FPacketId write SetPacketId; //16;
    property CustomData:TCustomDataItems read FCustomData; //17;
    property InboundUniversalTransferDocumentDocflow:TInboundUniversalTransferDocumentDocflow read FInboundUniversalTransferDocumentDocflow; //18;
    property OutboundUniversalTransferDocumentDocflow:TOutboundUniversalTransferDocumentDocflow read FOutboundUniversalTransferDocumentDocflow; //19;
    property RoamingNotification:TRoamingNotification read FRoamingNotification;//20;
  end;

function DocflowStatusSeverityToStr(AStatus:TDocflowStatusSeverity):string;
implementation

function DocflowStatusSeverityToStr(AStatus:TDocflowStatusSeverity):string;
begin
  case AStatus of
    dssUnknownDocflowStatusSeverity:Result:='UnknownDocflowStatusSeverity';
    dssInfo:Result:='Info';
    dssSuccess:Result:='Success';
    dssWarning:Result:='Warning';
    dssError:Result:='Error';
  else
    Result:='';
  end;
end;
(*
{ TRoamingNotification }

procedure TRoamingNotification.SetIsSuccess(AValue: Boolean);
begin
  if FIsSuccess=AValue then Exit;
  FIsSuccess:=AValue;
  Modified(2);
end;

procedure TRoamingNotification.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Notification', 1);
  RegisterProp('IsSuccess', 2);
end;

procedure TRoamingNotification.InternalInit;
begin
  inherited InternalInit;
  FNotification:=TEntity.Create;
end;

destructor TRoamingNotification.Destroy;
begin
  FreeAndNil(FNotification);
  inherited Destroy;
end;
*)
{ TDocflow }

procedure TDocflow.SetCanDocumentBeRevokedUnilaterallyBySender(AValue: Boolean);
begin
  if FCanDocumentBeRevokedUnilaterallyBySender=AValue then Exit;
  FCanDocumentBeRevokedUnilaterallyBySender:=AValue;
  Modified(15);
end;

procedure TDocflow.SetDepartmentId(AValue: string);
begin
  if FDepartmentId=AValue then Exit;
  FDepartmentId:=AValue;
  Modified(3);
end;

procedure TDocflow.SetDocumentIsDeleted(AValue: Boolean);
begin
  if FDocumentIsDeleted=AValue then Exit;
  FDocumentIsDeleted:=AValue;
  Modified(4);
end;

procedure TDocflow.SetIsFinished(AValue: Boolean);
begin
  if FIsFinished=AValue then Exit;
  FIsFinished:=AValue;
  Modified(1);
end;

procedure TDocflow.SetPacketId(AValue: string);
begin
  if FPacketId=AValue then Exit;
  FPacketId:=AValue;
  Modified(16);
end;

procedure TDocflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFinished', 1);
  RegisterProp('DocumentAttachment', 2);
  RegisterProp('DepartmentId', 3);
  RegisterProp('DocumentIsDeleted', 4);
  RegisterProp('DocflowStatus', 5);
  RegisterProp('SendTimestamp', 6);
  RegisterProp('DeliveryTimestamp', 7);
  RegisterProp('InboundInvoiceDocflow', 8);
  RegisterProp('OutboundInvoiceDocflow', 9);
  RegisterProp('XmlBilateralDocflow', 10);
  RegisterProp('BilateralDocflow', 11);
  RegisterProp('UnilateralDocflow', 12);
  RegisterProp('RevocationDocflow', 13);
  RegisterProp('ResolutionDocflow', 14);
  RegisterProp('CanDocumentBeRevokedUnilaterallyBySender', 15);
  RegisterProp('PacketId', 16);
  RegisterProp('CustomData', 17);
  RegisterProp('InboundUniversalTransferDocumentDocflow', 18);
  RegisterProp('OutboundUniversalTransferDocumentDocflow', 19);
  RegisterProp('RoamingNotification', 20);
end;

procedure TDocflow.InternalInit;
begin
  inherited InternalInit;
  FDocumentAttachment:=TSignedAttachment.Create;
  FDocflowStatus:=TDocflowStatus.Create;
  FSendTimestamp:=TTimestamp.Create;
  FDeliveryTimestamp:=TTimestamp.Create;
  FInboundInvoiceDocflow:=TInboundInvoiceDocflow.Create;
  FOutboundInvoiceDocflow:=TOutboundInvoiceDocflow.Create;
  FXmlBilateralDocflow:=TXmlBilateralDocflow.Create;
  FBilateralDocflow:=TBilateralDocflow.Create;
  FUnilateralDocflow:=TUnilateralDocflow.Create;
  FRevocationDocflow:=TRevocationDocflow.Create;
  FResolutionDocflow:=TResolutionDocflow.Create;
  FCustomData:=TCustomDataItems.Create;
  FInboundUniversalTransferDocumentDocflow.Create;
  FOutboundUniversalTransferDocumentDocflow.Create;
  FRoamingNotification:=TRoamingNotification.Create;
end;

destructor TDocflow.Destroy;
begin
  FreeAndNil(FRoamingNotification);
  FreeAndNil(FDocumentAttachment);
  FreeAndNil(FDocflowStatus);
  FreeAndNil(FSendTimestamp);
  FreeAndNil(FDeliveryTimestamp);
  FreeAndNil(FInboundInvoiceDocflow);
  FreeAndNil(FOutboundInvoiceDocflow);
  FreeAndNil(FXmlBilateralDocflow);
  FreeAndNil(FBilateralDocflow);
  FreeAndNil(FUnilateralDocflow);
  FreeAndNil(FRevocationDocflow);
  FreeAndNil(FResolutionDocflow);
  FreeAndNil(FCustomData);
  FreeAndNil(FInboundUniversalTransferDocumentDocflow);
  FreeAndNil(FOutboundUniversalTransferDocumentDocflow);
  inherited Destroy;
end;

{ TDocflowStatusModel }

procedure TDocflowStatusModel.SetSeverity(AValue: TDocflowStatusSeverity);
begin
  if FSeverity=AValue then Exit;
  FSeverity:=AValue;
  Modified(1);
end;

procedure TDocflowStatusModel.SetStatusHint(AValue: string);
begin
  if FStatusHint=AValue then Exit;
  FStatusHint:=AValue;
  Modified(3);
end;

procedure TDocflowStatusModel.SetStatusText(AValue: string);
begin
  if FStatusText=AValue then Exit;
  FStatusText:=AValue;
  Modified(2);
end;

procedure TDocflowStatusModel.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Severity' ,1);
  RegisterProp('StatusText' ,2);
  RegisterProp('StatusHint' ,3);
end;

procedure TDocflowStatusModel.InternalInit;
begin
  inherited InternalInit;
  FSeverity:=dssUnknownDocflowStatusSeverity; // 1
end;

destructor TDocflowStatusModel.Destroy;
begin
  inherited Destroy;
end;

{ TDocflowStatus }

procedure TDocflowStatus.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('PrimaryStatus', 1);
  RegisterProp('SecondaryStatus', 2);
end;

procedure TDocflowStatus.InternalInit;
begin
  inherited InternalInit;
  FPrimaryStatus:=TDocflowStatusModel.Create;
  FSecondaryStatus:=TDocflowStatusModel.Create;
end;

destructor TDocflowStatus.Destroy;
begin
  FreeAndNil(FPrimaryStatus);
  FreeAndNil(FSecondaryStatus);
  inherited Destroy;
end;

end.

