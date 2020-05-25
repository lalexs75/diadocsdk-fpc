{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2020 Lagunov Aleksey alexs75@yandex.ru

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

unit DiadocTypes_DocumentTypeDescription;

{$I diadoc_define.inc}

interface

uses
  Classes, SysUtils, protobuf_fpc, protobuf_fpc_types,
  DiadocTypes_ExtendedSigner;

type
  TDocumentMetadataItemType = (
    dmtString = 0,
    dmtInteger = 1,
    dmtDecimal = 2,
    dmtDate = 3,
    dmtTime = 4
  );

  TDocumentMetadataSource = (
    dmsXml = 0,                        // метаданные содержатся в теле документа
    dmsUser = 1                        // метаданные передаются в метод API отдельными полями
  );

  TDocumentDocflow = (
    ddfExternal = 0,       // внешний документооборот
    ddfInternal = 1       // внутренний документооборот
  );

  { TDocumentDocflows }

  TDocumentDocflows = class(TSerializationArray)
  private
    FItems:array of TDocumentDocflow;
    function GetItems(AIndex:Integer): TDocumentDocflow;
    //procedure SetItems(AIndex:Integer; AValue: TDocumentDocflow);
  protected
    procedure InternalAddAsInteger(AValue:Integer); override;
    function GetCount: integer; override;
  public
    destructor Destroy; override;
    property Items[AIndex:Integer]:TDocumentDocflow read GetItems {write SetItems}; default;
  end;

  {  TDetectedDocumentType  }
  //message DetectedDocumentType {
  //      required string TypeNamedId = 1;
  //      required string Function = 2;
  //      required string Version = 3;
  //}
  TDetectedDocumentType = class(TSerializationObject) //message DetectedDocumentType
  private
    FFunctionType: string;
    FTypeNamedId: string;
    FVersion: string;
    procedure SetFunctionType(AValue: string);
    procedure SetTypeNamedId(AValue: string);
    procedure SetVersion(AValue: string);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property TypeNamedId:string read FTypeNamedId write SetTypeNamedId;//1;
    property FunctionType:string read FFunctionType write SetFunctionType;//2;
    property Version:string read FVersion write SetVersion;//3;
  end;
  TDetectedDocumentTypes = specialize GSerializationObjectList<TDetectedDocumentType>;

  {  TDetectDocumentTypesResponse  }
  //message DetectDocumentTypesResponse {
  //    repeated DetectedDocumentType DocumentTypes = 1;
  //}
  TDetectDocumentTypesResponse = class(TSerializationObject) //message DetectDocumentTypesResponse
  private
    FDocumentTypes: TDetectedDocumentTypes;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentTypes:TDetectedDocumentTypes read FDocumentTypes;//1;
  end;


  { TDocumentMetadataItem }
  //message DocumentMetadataItem {
  //	required string Id = 1;
  //	required DocumentMetadataItemType Type = 2;
  //	required bool IsRequired = 3;
  //	required DocumentMetadataSource Source = 4;
  //}
  TDocumentMetadataItem = class(TSerializationObject) //message DocumentMetadataItem
  private
    FId: string;
    FIsRequired: Boolean;
    FItemType: TDocumentMetadataItemType;
    FSource: TDocumentMetadataSource;
    procedure SetId(AValue: string);
    procedure SetIsRequired(AValue: Boolean);
    procedure SetItemType(AValue: TDocumentMetadataItemType);
    procedure SetSource(AValue: TDocumentMetadataSource);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property Id:string read FId write SetId; //1
    property ItemType:TDocumentMetadataItemType read FItemType write SetItemType; //2
    property IsRequired:Boolean read FIsRequired write SetIsRequired; //3
    property Source:TDocumentMetadataSource read FSource write SetSource; //4
  end;
  TDocumentMetadataItems = specialize GSerializationObjectList<TDocumentMetadataItem>;

  TSignerType = (
    None = 0,
    Signer = 1,
    ExtendedSigner = 2
  );

  {  TSignerInfo  }
  //message SignerInfo {
  //    required SignerType SignerType = 1;
  //    required Invoicing.Signers.DocumentTitleType ExtendedDocumentTitleType = 2 [default = Absent];
  //}
  TSignerInfo  = class(TSerializationObject) //message SignerInfo
  private
    FExtendedDocumentTitleType: TDocumentTitleType;
    FSignerType: TSignerType;
    procedure SetExtendedDocumentTitleType(AValue: TDocumentTitleType);
    procedure SetSignerType(AValue: TSignerType);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property SignerType:TSignerType read FSignerType write SetSignerType;// = 1;
    property ExtendedDocumentTitleType:TDocumentTitleType read FExtendedDocumentTitleType write SetExtendedDocumentTitleType default Absent;//2 [];
  end;

  { TDocumentTitle }
  //message DocumentTitle {
  //    required int32 Index = 7;
  //	required bool IsFormal = 1;
  //	optional string XsdUrl = 2;
  //    optional string UserDataXsdUrl = 5;
  //    required SignerInfo SignerInfo  = 6;
  //	repeated DocumentMetadataItem MetadataItems = 3;
  //	repeated DocumentMetadataItem EncryptedMetadataItems = 4;
  //}
  TDocumentTitle = class(TSerializationObject) //message DocumentTitle
  private
    FEncryptedMetadataItems: TDocumentMetadataItems;
    FIndex: Integer;
    FIsFormal: Boolean;
    FMetadataItems: TDocumentMetadataItems;
    FSignerInfo: TSignerInfo;
    FUserDataXsdUrl: string;
    FXsdUrl: string;
    procedure SetIndex(AValue: Integer);
    procedure SetIsFormal(AValue: Boolean);
    procedure SetUserDataXsdUrl(AValue: string);
    procedure SetXsdUrl(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Index:Integer read FIndex write SetIndex; //7;
    property IsFormal:Boolean read FIsFormal write SetIsFormal; //1
    property XsdUrl:string read FXsdUrl write SetXsdUrl; //2
    property MetadataItems:TDocumentMetadataItems read FMetadataItems; //3
    property EncryptedMetadataItems:TDocumentMetadataItems read FEncryptedMetadataItems; //4
    property UserDataXsdUrl:string read FUserDataXsdUrl write SetUserDataXsdUrl;//5;
    property SignerInfo:TSignerInfo read FSignerInfo;//6;
  end;
  TDocumentTitles = specialize GSerializationObjectList<TDocumentTitle>;

  {  TDocumentWorkflow  }
  //message DocumentWorkflow {
  //	required int32 Id = 1;
  //	required bool IsDefault = 2;
  //}
  TDocumentWorkflow = class(TSerializationObject) //message DocumentWorkflow
  private
    FId: Int32;
    FIsDefault: Boolean;
    procedure SetId(AValue: Int32);
    procedure SetIsDefault(AValue: Boolean);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
  published
    property Id:Int32 read FId write SetId; //1
    property IsDefault:Boolean read FIsDefault write SetIsDefault; //2
  end;

  {  TDocumentVersion  }
  //message DocumentVersion {
  //    required string Version = 1;
  //    required bool SupportsContentPatching = 2;
  //    required bool SupportsEncrypting = 3;
  //    required bool SupportsPredefinedRecipientTitle = 7;
  //    required bool SupportsAmendmentRequest = 8;
  //    repeated DocumentTitle Titles = 4;
  //    required bool IsActual = 5;
  //    repeated DocumentWorkflow Workflows = 6;
  //}
  TDocumentVersion  = class(TSerializationObject) //message DocumentVersion
  private
    FIsActual: Boolean;
    FSupportsAmendmentRequest: Boolean;
    FSupportsContentPatching: Boolean;
    FSupportsEncrypting: Boolean;
    FSupportsPredefinedRecipientTitle: Boolean;
    FTitles: TDocumentTitles;
    FVersion: string;
    FWorkflows: TDocumentWorkflow;
    procedure SetSupportsAmendmentRequest(AValue: Boolean);
    procedure SetSupportsContentPatching(AValue: Boolean);
    procedure SetSupportsEncrypting(AValue: Boolean);
    procedure SetSupportsPredefinedRecipientTitle(AValue: Boolean);
    procedure SetVersion(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Version:string read FVersion write SetVersion; //1
    property SupportsContentPatching:Boolean read FSupportsContentPatching write SetSupportsContentPatching; //2
    property SupportsEncrypting:Boolean read FSupportsEncrypting write SetSupportsEncrypting; //3;
    property SupportsPredefinedRecipientTitle:Boolean read FSupportsPredefinedRecipientTitle write SetSupportsPredefinedRecipientTitle;//7;
    property SupportsAmendmentRequest:Boolean read FSupportsAmendmentRequest write SetSupportsAmendmentRequest; //8
    property Titles:TDocumentTitles read FTitles; //4;
    property IsActual:Boolean read FIsActual write FIsActual; //5;
    property Workflows:TDocumentWorkflow read FWorkflows; //6;
  end;
  TDocumentVersions = specialize GSerializationObjectList<TDocumentVersion>;

  {  TDocumentFunction  }
  //message DocumentFunction {
  //	required string Name = 1;
  //	repeated DocumentVersion Versions = 2;
  //}
  { TDocumentFunction }

  TDocumentFunction  = class(TSerializationObject) //message DocumentFunction
  private
    FName: string;
    FVersions: TDocumentVersions;
    procedure SetName(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Name:string read FName write SetName; //1;
    property Versions:TDocumentVersions read FVersions; //2;
  end;
  TDocumentFunctions = specialize GSerializationObjectList<TDocumentFunction>;

  {  TDocumentTypeDescription  }
  //message DocumentTypeDescription {
  //        required string Name = 1;
  //        required string Title = 2;
  //        repeated DocumentDocflow SupportedDocflows = 3;
  //        required bool RequiresFnsRegistration = 4;
  //        repeated DocumentFunction Functions = 9;
  //}
  TDocumentTypeDescription  = class(TSerializationObject) //message DocumentTypeDescription
  private
    FFunctions: TDocumentFunctions;
    FName: string;
    FRequiresFnsRegistration: Boolean;
    FSupportedDocflows: TDocumentDocflows;
    FTitle: string;
    procedure SetName(AValue: string);
    procedure SetRequiresFnsRegistration(AValue: Boolean);
    procedure SetTitle(AValue: string);
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property Name:string read FName write SetName; //1;
    property Title:string read FTitle write SetTitle; //2;
    property SupportedDocflows:TDocumentDocflows read FSupportedDocflows; //3
    property RequiresFnsRegistration:Boolean read FRequiresFnsRegistration write SetRequiresFnsRegistration; //4;
    property Functions:TDocumentFunctions read FFunctions; //9;
  end;
  TDocumentTypeDescriptions = specialize GSerializationObjectList<TDocumentTypeDescription>;

  {  TGetDocumentTypesResponse  }
  //message GetDocumentTypesResponse {
  //	repeated DocumentTypeDescription DocumentTypes = 1;
  //}
  TGetDocumentTypesResponse  = class(TSerializationObject) //message GetDocumentTypesResponse
  private
    FDocumentTypes: TDocumentTypeDescriptions;
  protected
    procedure InternalInit; override;
    procedure InternalRegisterProperty; override;
  public
    destructor Destroy; override;
  published
    property DocumentTypes:TDocumentTypeDescriptions read FDocumentTypes; //1;
  end;

function DocumentDocflowToStr(AStatus:TDocumentDocflow):string;
implementation

function DocumentDocflowToStr(AStatus:TDocumentDocflow):string;
begin
  case AStatus of
    ddfExternal:Result:='External';   // внешний документооборот
    ddfInternal:Result:='Internal';   // внутренний документооборот
  else
    Result:='';
  end;
end;

{ TSignerInfo }

procedure TSignerInfo.SetExtendedDocumentTitleType(AValue: TDocumentTitleType);
begin
  if FExtendedDocumentTitleType=AValue then Exit;
  FExtendedDocumentTitleType:=AValue;
  Modified(2);
end;

procedure TSignerInfo.SetSignerType(AValue: TSignerType);
begin
  if FSignerType=AValue then Exit;
  FSignerType:=AValue;
  Modified(1);
end;

procedure TSignerInfo.InternalInit;
begin
  inherited InternalInit;
end;

procedure TSignerInfo.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignerType', 1);
  RegisterProp('ExtendedDocumentTitleType', 2);
end;

destructor TSignerInfo.Destroy;
begin
  inherited Destroy;
end;

{ TDetectDocumentTypesResponse }

procedure TDetectDocumentTypesResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentTypes', 1);
end;

procedure TDetectDocumentTypesResponse.InternalInit;
begin
  inherited InternalInit;
  FDocumentTypes:=TDetectedDocumentTypes.Create;
end;

destructor TDetectDocumentTypesResponse.Destroy;
begin
  FreeAndNil(FDocumentTypes);
  inherited Destroy;
end;

{ TDetectedDocumentType }

procedure TDetectedDocumentType.SetFunctionType(AValue: string);
begin
  if FFunctionType=AValue then Exit;
  FFunctionType:=AValue;
  Modified(2);
end;

procedure TDetectedDocumentType.SetTypeNamedId(AValue: string);
begin
  if FTypeNamedId=AValue then Exit;
  FTypeNamedId:=AValue;
  Modified(1);
end;

procedure TDetectedDocumentType.SetVersion(AValue: string);
begin
  if FVersion=AValue then Exit;
  FVersion:=AValue;
  Modified(3);
end;

procedure TDetectedDocumentType.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('TypeNamedId', 1);
  RegisterProp('FunctionType', 2);
  RegisterProp('Version', 3);
end;

procedure TDetectedDocumentType.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDetectedDocumentType.Destroy;
begin
  inherited Destroy;
end;

{ TDocumentMetadataItem }

procedure TDocumentMetadataItem.SetId(AValue: string);
begin
  if FId=AValue then Exit;
  FId:=AValue;
  Modified(1);
end;

procedure TDocumentMetadataItem.SetIsRequired(AValue: Boolean);
begin
  if FIsRequired=AValue then Exit;
  FIsRequired:=AValue;
  Modified(3);
end;

procedure TDocumentMetadataItem.SetItemType(AValue: TDocumentMetadataItemType);
begin
  if FItemType=AValue then Exit;
  FItemType:=AValue;
  Modified(2);
end;

procedure TDocumentMetadataItem.SetSource(AValue: TDocumentMetadataSource);
begin
  if FSource=AValue then Exit;
  FSource:=AValue;
  Modified(4);
end;

procedure TDocumentMetadataItem.InternalInit;
begin
  inherited InternalInit;
end;

procedure TDocumentMetadataItem.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Id', 1, true);
  RegisterProp('ItemType', 2, true);
  RegisterProp('IsRequired', 3, true);
  RegisterProp('Source', 4, true);
end;

{ TDocumentDocflows }

function TDocumentDocflows.GetItems(AIndex: Integer): TDocumentDocflow;
begin
  if (AIndex >= 0) and (AIndex < Count) then
    Result:=FItems[AIndex]
  else
    raise Exception.Create('Index out of bounds');
end;

procedure TDocumentDocflows.InternalAddAsInteger(AValue: Integer);
var
  L: Integer;
begin
  L:=GetCount + 1;
  SetLength(FItems, L);
  FItems[L-1]:=TDocumentDocflow(AValue);
end;

function TDocumentDocflows.GetCount: integer;
begin
  Result:=Length(FItems);
end;

destructor TDocumentDocflows.Destroy;
begin
  SetLength(FItems, 0);
  inherited Destroy;
end;

{ TDocumentTitle }

procedure TDocumentTitle.SetIndex(AValue: Integer);
begin
  if FIndex=AValue then Exit;
  FIndex:=AValue;
  Modified(7);
end;

procedure TDocumentTitle.SetIsFormal(AValue: Boolean);
begin
  if FIsFormal=AValue then Exit;
  FIsFormal:=AValue;
  Modified(1);
end;

procedure TDocumentTitle.SetUserDataXsdUrl(AValue: string);
begin
  if FUserDataXsdUrl=AValue then Exit;
  FUserDataXsdUrl:=AValue;
  Modified(5);
end;

procedure TDocumentTitle.SetXsdUrl(AValue: string);
begin
  if FXsdUrl=AValue then Exit;
  FXsdUrl:=AValue;
  Modified(2);
end;

procedure TDocumentTitle.InternalInit;
begin
  inherited InternalInit;
  FMetadataItems:=TDocumentMetadataItems.Create;
  FEncryptedMetadataItems:=TDocumentMetadataItems.Create;
  FSignerInfo:=TSignerInfo.Create;
end;

procedure TDocumentTitle.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('IsFormal', 1, true);
  RegisterProp('XsdUrl', 2);
  RegisterProp('MetadataItems', 3);
  RegisterProp('EncryptedMetadataItems', 4);
  RegisterProp('UserDataXsdUrl', 5);
  RegisterProp('SignerInfo', 6, true);
  RegisterProp('Index', 7, true);
end;

destructor TDocumentTitle.Destroy;
begin
  FreeAndNil(FSignerInfo);
  FreeAndNil(FMetadataItems);
  FreeAndNil(FEncryptedMetadataItems);
  inherited Destroy;
end;

{ TDocumentWorkflow }

procedure TDocumentWorkflow.SetId(AValue: Int32);
begin
  if FId=AValue then Exit;
  FId:=AValue;
  Modified(1);
end;

procedure TDocumentWorkflow.SetIsDefault(AValue: Boolean);
begin
  if FIsDefault=AValue then Exit;
  FIsDefault:=AValue;
  Modified(2);
end;

procedure TDocumentWorkflow.InternalInit;
begin
  inherited InternalInit;
end;

procedure TDocumentWorkflow.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Id', 1, true);
  RegisterProp('IsDefault', 2, true);
end;

{ TDocumentVersion }

procedure TDocumentVersion.SetSupportsAmendmentRequest(AValue: Boolean);
begin
  if FSupportsAmendmentRequest=AValue then Exit;
  FSupportsAmendmentRequest:=AValue;
  Modified(8);
end;

procedure TDocumentVersion.SetSupportsContentPatching(AValue: Boolean);
begin
  if FSupportsContentPatching=AValue then Exit;
  FSupportsContentPatching:=AValue;
  Modified(2);
end;

procedure TDocumentVersion.SetSupportsEncrypting(AValue: Boolean);
begin
  if FSupportsEncrypting=AValue then Exit;
  FSupportsEncrypting:=AValue;
  Modified(3);
end;

procedure TDocumentVersion.SetSupportsPredefinedRecipientTitle(AValue: Boolean);
begin
  if FSupportsPredefinedRecipientTitle=AValue then Exit;
  FSupportsPredefinedRecipientTitle:=AValue;
  Modified(7);
end;

procedure TDocumentVersion.SetVersion(AValue: string);
begin
  if FVersion=AValue then Exit;
  FVersion:=AValue;
  Modified(1);
end;

procedure TDocumentVersion.InternalInit;
begin
  inherited InternalInit;
  FTitles:=TDocumentTitles.Create;
  FWorkflows:=TDocumentWorkflow.Create;
end;

procedure TDocumentVersion.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Version', 1, true);
  RegisterProp('SupportsContentPatching', 2, true);
  RegisterProp('SupportsEncrypting', 3, true);
  RegisterProp('SupportsPredefinedRecipientTitle', 7);
  RegisterProp('SupportsAmendmentRequest', 8);
  RegisterProp('Titles', 4, true);
  RegisterProp('IsActual', 5);
  RegisterProp('Workflows', 6);
end;

destructor TDocumentVersion.Destroy;
begin
  FreeAndNil(FTitles);
  FreeAndNil(FWorkflows);
  inherited Destroy;
end;


{ TDocumentFunction }

procedure TDocumentFunction.SetName(AValue: string);
begin
  if FName=AValue then Exit;
  FName:=AValue;
  Modified(1);
end;

procedure TDocumentFunction.InternalInit;
begin
  inherited InternalInit;
  FVersions:=TDocumentVersions.Create;
end;

procedure TDocumentFunction.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1, true);
  RegisterProp('Versions', 2);
end;

destructor TDocumentFunction.Destroy;
begin
  FreeAndNil(FVersions);
  inherited Destroy;
end;

{ TGetDocumentTypesResponse }

procedure TGetDocumentTypesResponse.InternalInit;
begin
  inherited InternalInit;
  FDocumentTypes:=TDocumentTypeDescriptions.Create;
end;

procedure TGetDocumentTypesResponse.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentTypes', 1);
end;

destructor TGetDocumentTypesResponse.Destroy;
begin
  FreeAndNil(FDocumentTypes);
  inherited Destroy;
end;

{ TDocumentTypeDescription }

procedure TDocumentTypeDescription.SetName(AValue: string);
begin
  if FName=AValue then Exit;
  FName:=AValue;
  Modified(1);
end;

procedure TDocumentTypeDescription.SetRequiresFnsRegistration(AValue: Boolean);
begin
  if FRequiresFnsRegistration=AValue then Exit;
  FRequiresFnsRegistration:=AValue;
  Modified(4);
end;

procedure TDocumentTypeDescription.SetTitle(AValue: string);
begin
  if FTitle=AValue then Exit;
  FTitle:=AValue;
  Modified(2);
end;

procedure TDocumentTypeDescription.InternalInit;
begin
  inherited InternalInit;
  FSupportedDocflows:=TDocumentDocflows.Create;
  FFunctions:=TDocumentFunctions.Create;
end;

procedure TDocumentTypeDescription.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1);
  RegisterProp('Title', 2);
  RegisterProp('SupportedDocflows', 3);
  RegisterProp('RequiresFnsRegistration', 4);
  RegisterProp('Functions', 9);
end;

destructor TDocumentTypeDescription.Destroy;
begin
  FreeAndNil(FSupportedDocflows);
  FreeAndNil(FFunctions);
  inherited Destroy;
end;

end.

