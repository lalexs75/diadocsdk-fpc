{ Diadoc interface library for FPC and Lazarus

  Copyright (C) 2018-2021 Lagunov Aleksey alexs75@yandex.ru

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

unit DocumentTypeDescriptionV2;

interface

uses Classes, SysUtils, types, protobuf_fpc;

type

  TDocumentTypeDescriptionV2 = class;
  TDocumentTypeDescriptionV2s = specialize GSerializationObjectList<TDocumentTypeDescriptionV2>;
  TGetDocumentTypesResponseV2 = class;
  TGetDocumentTypesResponseV2s = specialize GSerializationObjectList<TGetDocumentTypesResponseV2>;
  TDocumentFunctionV2 = class;
  TDocumentFunctionV2s = specialize GSerializationObjectList<TDocumentFunctionV2>;
  TDocumentVersionV2 = class;
  TDocumentVersionV2s = specialize GSerializationObjectList<TDocumentVersionV2>;
  TDocumentWorkflowV2 = class;
  TDocumentWorkflowV2s = specialize GSerializationObjectList<TDocumentWorkflowV2>;
  TDocumentTitleV2 = class;
  TDocumentTitleV2s = specialize GSerializationObjectList<TDocumentTitleV2>;
  TSignerInfoV2 = class;
  TSignerInfoV2s = specialize GSerializationObjectList<TSignerInfoV2>;
  TDocumentMetadataItemV2 = class;
  TDocumentMetadataItemV2s = specialize GSerializationObjectList<TDocumentMetadataItemV2>;

  { DocumentTypeDescriptionV2 } 
  //message DocumentTypeDescriptionV2 {
  //	required string Name = 1;
  //	required string Title = 2;
  //	repeated int32 SupportedDocflows = 3;
  //	required bool RequiresFnsRegistration = 4;
  //	repeated DocumentFunctionV2 Functions = 9;
  //}
  TDocumentTypeDescriptionV2 = class(TSerializationObject)
  private
    FName:String;
    FTitle:String;
    FSupportedDocflows:TIntegerDynArray;
    FRequiresFnsRegistration:Boolean;
    FFunctions:TDocumentFunctionV2s;
    procedure SetName(AValue:String);
    procedure SetTitle(AValue:String);
    procedure SetSupportedDocflows(AValue:TIntegerDynArray);
    procedure SetRequiresFnsRegistration(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Name:String read FName write SetName;
    property Title:String read FTitle write SetTitle;
    property SupportedDocflows:TIntegerDynArray read FSupportedDocflows write SetSupportedDocflows;
    property RequiresFnsRegistration:Boolean read FRequiresFnsRegistration write SetRequiresFnsRegistration;
    property Functions:TDocumentFunctionV2s read FFunctions;
  end;

  { GetDocumentTypesResponseV2 } 
  //message GetDocumentTypesResponseV2 {
  //	repeated DocumentTypeDescriptionV2 DocumentTypes = 1;
  //}
  TGetDocumentTypesResponseV2 = class(TSerializationObject)
  private
    FDocumentTypes:TDocumentTypeDescriptionV2s;
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property DocumentTypes:TDocumentTypeDescriptionV2s read FDocumentTypes;
  end;

  { DocumentFunctionV2 } 
  //message DocumentFunctionV2 {
  //	required string Name = 1;
  //	repeated DocumentVersionV2 Versions = 2;
  //}
  TDocumentFunctionV2 = class(TSerializationObject)
  private
    FName:String;
    FVersions:TDocumentVersionV2s;
    procedure SetName(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Name:String read FName write SetName;
    property Versions:TDocumentVersionV2s read FVersions;
  end;

  { DocumentVersionV2 } 
  //message DocumentVersionV2 {
  //	required string Version = 1;
  //	required bool SupportsContentPatching = 2;
  //	required bool SupportsEncrypting = 3;
  //	required bool SupportsPredefinedRecipientTitle = 7;
  //	required bool SupportsAmendmentRequest = 8;
  //	repeated DocumentTitleV2 Titles = 4;
  //	required bool IsActual = 5;
  //	repeated DocumentWorkflowV2 Workflows = 6;
  //}
  TDocumentVersionV2 = class(TSerializationObject)
  private
    FVersion:String;
    FSupportsContentPatching:Boolean;
    FSupportsEncrypting:Boolean;
    FSupportsPredefinedRecipientTitle:Boolean;
    FSupportsAmendmentRequest:Boolean;
    FTitles:TDocumentTitleV2s;
    FIsActual:Boolean;
    FWorkflows:TDocumentWorkflowV2s;
    procedure SetVersion(AValue:String);
    procedure SetSupportsContentPatching(AValue:Boolean);
    procedure SetSupportsEncrypting(AValue:Boolean);
    procedure SetSupportsPredefinedRecipientTitle(AValue:Boolean);
    procedure SetSupportsAmendmentRequest(AValue:Boolean);
    procedure SetIsActual(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Version:String read FVersion write SetVersion;
    property SupportsContentPatching:Boolean read FSupportsContentPatching write SetSupportsContentPatching;
    property SupportsEncrypting:Boolean read FSupportsEncrypting write SetSupportsEncrypting;
    property SupportsPredefinedRecipientTitle:Boolean read FSupportsPredefinedRecipientTitle write SetSupportsPredefinedRecipientTitle;
    property SupportsAmendmentRequest:Boolean read FSupportsAmendmentRequest write SetSupportsAmendmentRequest;
    property Titles:TDocumentTitleV2s read FTitles;
    property IsActual:Boolean read FIsActual write SetIsActual;
    property Workflows:TDocumentWorkflowV2s read FWorkflows;
  end;

  { DocumentWorkflowV2 } 
  //message DocumentWorkflowV2 {
  //	required int32 Id = 1;
  //	required bool IsDefault = 2;
  //}
  TDocumentWorkflowV2 = class(TSerializationObject)
  private
    FId:Integer;
    FIsDefault:Boolean;
    procedure SetId(AValue:Integer);
    procedure SetIsDefault(AValue:Boolean);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Id:Integer read FId write SetId;
    property IsDefault:Boolean read FIsDefault write SetIsDefault;
  end;

  { DocumentTitleV2 } 
  //message DocumentTitleV2 {
  //	required int32 Index = 7;
  //	required bool IsFormal = 1;
  //	optional string XsdUrl = 2;
  //	optional string UserDataXsdUrl = 5;
  //	required SignerInfoV2 SignerInfo  = 6;
  //	repeated DocumentMetadataItemV2 MetadataItems = 3;
  //	repeated DocumentMetadataItemV2 EncryptedMetadataItems = 4;
  //}
  TDocumentTitleV2 = class(TSerializationObject)
  private
    FIndex:Integer;
    FIsFormal:Boolean;
    FXsdUrl:String;
    FUserDataXsdUrl:String;
    FSignerInfo:TSignerInfoV2;
    FMetadataItems:TDocumentMetadataItemV2s;
    FEncryptedMetadataItems:TDocumentMetadataItemV2s;
    procedure SetIndex(AValue:Integer);
    procedure SetIsFormal(AValue:Boolean);
    procedure SetXsdUrl(AValue:String);
    procedure SetUserDataXsdUrl(AValue:String);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Index:Integer read FIndex write SetIndex;
    property IsFormal:Boolean read FIsFormal write SetIsFormal;
    property XsdUrl:String read FXsdUrl write SetXsdUrl;
    property UserDataXsdUrl:String read FUserDataXsdUrl write SetUserDataXsdUrl;
    property SignerInfo:TSignerInfoV2 read FSignerInfo;
    property MetadataItems:TDocumentMetadataItemV2s read FMetadataItems;
    property EncryptedMetadataItems:TDocumentMetadataItemV2s read FEncryptedMetadataItems;
  end;

  { SignerInfoV2 } 
  //message SignerInfoV2 {
  //	required int32 SignerType = 1;
  //	required int32 ExtendedDocumentTitleType = 2 [default = -1];
  //}
  TSignerInfoV2 = class(TSerializationObject)
  private
    FSignerType:Integer;
    FExtendedDocumentTitleType:Integer;
    procedure SetSignerType(AValue:Integer);
    procedure SetExtendedDocumentTitleType(AValue:Integer);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property SignerType:Integer read FSignerType write SetSignerType;
    property ExtendedDocumentTitleType:Integer read FExtendedDocumentTitleType write SetExtendedDocumentTitleType default -1;
  end;

  { DocumentMetadataItemV2 } 
  //message DocumentMetadataItemV2 {
  //	required string Id = 1;
  //	required int32 Type = 2;
  //	required bool IsRequired = 3;
  //	required int32 Source = 4;
  //}
  TDocumentMetadataItemV2 = class(TSerializationObject)
  private
    FId:String;
    FTypeField:Integer;
    FIsRequired:Boolean;
    FSource:Integer;
    procedure SetId(AValue:String);
    procedure SetTypeField(AValue:Integer);
    procedure SetIsRequired(AValue:Boolean);
    procedure SetSource(AValue:Integer);
  protected
    procedure InternalRegisterProperty; override;
    procedure InternalInit; override;
  public
    destructor Destroy; override;
  published
    property Id:String read FId write SetId;
    property TypeField:Integer read FTypeField write SetTypeField;
    property IsRequired:Boolean read FIsRequired write SetIsRequired;
    property Source:Integer read FSource write SetSource;
  end;

implementation

  { DocumentTypeDescriptionV2 } 

procedure TDocumentTypeDescriptionV2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1, true);
  RegisterProp('Title', 2, true);
  RegisterProp('SupportedDocflows', 3);
  RegisterProp('RequiresFnsRegistration', 4, true);
  RegisterProp('Functions', 9);
end;

procedure TDocumentTypeDescriptionV2.InternalInit;
begin
  inherited InternalInit;
  FFunctions:= TDocumentFunctionV2s.Create;
end;

destructor TDocumentTypeDescriptionV2.Destroy;
begin
  FFunctions.Free;
  inherited Destroy;
end;

procedure TDocumentTypeDescriptionV2.SetName(AValue:String);
begin
  FName:=AValue;
  Modified(1);
end;

procedure TDocumentTypeDescriptionV2.SetTitle(AValue:String);
begin
  FTitle:=AValue;
  Modified(2);
end;

procedure TDocumentTypeDescriptionV2.SetSupportedDocflows(AValue:TIntegerDynArray);
begin
  FSupportedDocflows:=AValue;
  Modified(3);
end;

procedure TDocumentTypeDescriptionV2.SetRequiresFnsRegistration(AValue:Boolean);
begin
  FRequiresFnsRegistration:=AValue;
  Modified(4);
end;


  { GetDocumentTypesResponseV2 } 

procedure TGetDocumentTypesResponseV2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('DocumentTypes', 1);
end;

procedure TGetDocumentTypesResponseV2.InternalInit;
begin
  inherited InternalInit;
  FDocumentTypes:= TDocumentTypeDescriptionV2s.Create;
end;

destructor TGetDocumentTypesResponseV2.Destroy;
begin
  FDocumentTypes.Free;
  inherited Destroy;
end;


  { DocumentFunctionV2 } 

procedure TDocumentFunctionV2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Name', 1, true);
  RegisterProp('Versions', 2);
end;

procedure TDocumentFunctionV2.InternalInit;
begin
  inherited InternalInit;
  FVersions:= TDocumentVersionV2s.Create;
end;

destructor TDocumentFunctionV2.Destroy;
begin
  FVersions.Free;
  inherited Destroy;
end;

procedure TDocumentFunctionV2.SetName(AValue:String);
begin
  FName:=AValue;
  Modified(1);
end;


  { DocumentVersionV2 } 

procedure TDocumentVersionV2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Version', 1, true);
  RegisterProp('SupportsContentPatching', 2, true);
  RegisterProp('SupportsEncrypting', 3, true);
  RegisterProp('SupportsPredefinedRecipientTitle', 7, true);
  RegisterProp('SupportsAmendmentRequest', 8, true);
  RegisterProp('Titles', 4);
  RegisterProp('IsActual', 5, true);
  RegisterProp('Workflows', 6);
end;

procedure TDocumentVersionV2.InternalInit;
begin
  inherited InternalInit;
  FTitles:= TDocumentTitleV2s.Create;
  FWorkflows:= TDocumentWorkflowV2s.Create;
end;

destructor TDocumentVersionV2.Destroy;
begin
  FTitles.Free;
  FWorkflows.Free;
  inherited Destroy;
end;

procedure TDocumentVersionV2.SetVersion(AValue:String);
begin
  FVersion:=AValue;
  Modified(1);
end;

procedure TDocumentVersionV2.SetSupportsContentPatching(AValue:Boolean);
begin
  FSupportsContentPatching:=AValue;
  Modified(2);
end;

procedure TDocumentVersionV2.SetSupportsEncrypting(AValue:Boolean);
begin
  FSupportsEncrypting:=AValue;
  Modified(3);
end;

procedure TDocumentVersionV2.SetSupportsPredefinedRecipientTitle(AValue:Boolean);
begin
  FSupportsPredefinedRecipientTitle:=AValue;
  Modified(7);
end;

procedure TDocumentVersionV2.SetSupportsAmendmentRequest(AValue:Boolean);
begin
  FSupportsAmendmentRequest:=AValue;
  Modified(8);
end;

procedure TDocumentVersionV2.SetIsActual(AValue:Boolean);
begin
  FIsActual:=AValue;
  Modified(5);
end;


  { DocumentWorkflowV2 } 

procedure TDocumentWorkflowV2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Id', 1, true);
  RegisterProp('IsDefault', 2, true);
end;

procedure TDocumentWorkflowV2.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDocumentWorkflowV2.Destroy;
begin
  inherited Destroy;
end;

procedure TDocumentWorkflowV2.SetId(AValue:Integer);
begin
  FId:=AValue;
  Modified(1);
end;

procedure TDocumentWorkflowV2.SetIsDefault(AValue:Boolean);
begin
  FIsDefault:=AValue;
  Modified(2);
end;


  { DocumentTitleV2 } 

procedure TDocumentTitleV2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Index', 7, true);
  RegisterProp('IsFormal', 1, true);
  RegisterProp('XsdUrl', 2);
  RegisterProp('UserDataXsdUrl', 5);
  RegisterProp('SignerInfo', 6, true);
  RegisterProp('MetadataItems', 3);
  RegisterProp('EncryptedMetadataItems', 4);
end;

procedure TDocumentTitleV2.InternalInit;
begin
  inherited InternalInit;
  FSignerInfo:= TSignerInfoV2.Create;
  FMetadataItems:= TDocumentMetadataItemV2s.Create;
  FEncryptedMetadataItems:= TDocumentMetadataItemV2s.Create;
end;

destructor TDocumentTitleV2.Destroy;
begin
  FSignerInfo.Free;
  FMetadataItems.Free;
  FEncryptedMetadataItems.Free;
  inherited Destroy;
end;

procedure TDocumentTitleV2.SetIndex(AValue:Integer);
begin
  FIndex:=AValue;
  Modified(7);
end;

procedure TDocumentTitleV2.SetIsFormal(AValue:Boolean);
begin
  FIsFormal:=AValue;
  Modified(1);
end;

procedure TDocumentTitleV2.SetXsdUrl(AValue:String);
begin
  FXsdUrl:=AValue;
  Modified(2);
end;

procedure TDocumentTitleV2.SetUserDataXsdUrl(AValue:String);
begin
  FUserDataXsdUrl:=AValue;
  Modified(5);
end;


  { SignerInfoV2 } 

procedure TSignerInfoV2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('SignerType', 1, true);
  RegisterProp('ExtendedDocumentTitleType', 2, true);
end;

procedure TSignerInfoV2.InternalInit;
begin
  inherited InternalInit;

  ExtendedDocumentTitleType:= -1;
end;

destructor TSignerInfoV2.Destroy;
begin
  inherited Destroy;
end;

procedure TSignerInfoV2.SetSignerType(AValue:Integer);
begin
  FSignerType:=AValue;
  Modified(1);
end;

procedure TSignerInfoV2.SetExtendedDocumentTitleType(AValue:Integer);
begin
  FExtendedDocumentTitleType:=AValue;
  Modified(2);
end;


  { DocumentMetadataItemV2 } 

procedure TDocumentMetadataItemV2.InternalRegisterProperty;
begin
  inherited InternalRegisterProperty;
  RegisterProp('Id', 1, true);
  RegisterProp('TypeField', 2, true);
  RegisterProp('IsRequired', 3, true);
  RegisterProp('Source', 4, true);
end;

procedure TDocumentMetadataItemV2.InternalInit;
begin
  inherited InternalInit;
end;

destructor TDocumentMetadataItemV2.Destroy;
begin
  inherited Destroy;
end;

procedure TDocumentMetadataItemV2.SetId(AValue:String);
begin
  FId:=AValue;
  Modified(1);
end;

procedure TDocumentMetadataItemV2.SetTypeField(AValue:Integer);
begin
  FTypeField:=AValue;
  Modified(2);
end;

procedure TDocumentMetadataItemV2.SetIsRequired(AValue:Boolean);
begin
  FIsRequired:=AValue;
  Modified(3);
end;

procedure TDocumentMetadataItemV2.SetSource(AValue:Integer);
begin
  FSource:=AValue;
  Modified(4);
end;

end.
