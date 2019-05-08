{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit diadoc_fpc;

{$warn 5023 off : no warning about unused units}
interface

uses
  DiadocTypes_Attachment, DiadocTypes_Docflow, 
  DiadocTypes_DocumentWithDocflow, DiadocTypes_InvoiceDocflow, 
  DiadocTypes_ReceiptDocflow, DiadocTypes_XmlBilateralDocflow, 
  DiadocTypes_RecipientSignatureRejectionDocflow, 
  DiadocTypes_BilateralDocflow, DiadocTypes_UnilateralDocflow, 
  DiadocTypes_RecipientSignatureDocflow, DiadocTypes_RevocationDocflow, 
  DiadocTypes_ResolutionDocflow, DiadocTypes_UniversalTransferDocumentDocflow, 
  DiadocTypes_DocumentInfo, DiadocTypes_UniversalTransferDocumentInfo, 
  DiadocTypes_InvoiceInfo, DiadocTypes_Signer, DiadocTypes_OrganizationInfo, 
  DiadocTypes_ExtendedSigner, DiadocTypes_ExtendedOrganizationInfo, 
  DiadocTypes_DocflowApi, DiadocTypes_DocumentTypeDescription, 
  DiadocTypes_DiadocMessage_PostApi, DiadocTypes_ResolutionInfo, 
  DiadocTypes_ResolutionRequestInfo, DiadocTypes_CancellationInfo, 
  DiadocTypes_ResolutionRequestDenialInfo, DiadocTypes_ResolutionRouteInfo, 
  DiadocTypes_DiadocMessage_GetApi, DiadocTypes_Document, 
  DiadocTypes_AcceptanceCertificateDocument, DiadocTypes_ReceiptStatus, 
  DiadocTypes_BilateralDocument, DiadocTypes_InvoiceDocument, 
  DiadocTypes_NonformalizedDocument, DiadocTypes_UnilateralDocument, 
  DiadocTypes_UniversalTransferDocument, DiadocTypes_DocumentZip, 
  DiadocTypes_DocumentsMoveOperation, DiadocTypes_DocumentProtocol, 
  DiadocTypes_DocumentList, DiadocTypes_Recognition, 
  DiadocTypes_KeyValueStorage, DiadocTypes_ForwardedDocument, 
  DiadocTypes_ForwardingApi, DiadocTypes_AcceptanceCertificate552Info, 
  DiadocTypes_AcceptanceCertificateInfo, 
  DiadocTypes_FnsRegistrationMessageInfo, 
  DiadocTypes_InvoiceCorrectionRequestInfo, DiadocTypes_Official, 
  DiadocTypes_RevocationRequestInfo, DiadocTypes_SignatureRejectionInfo, 
  DiadocTypes_Torg12Info, DiadocTypes_TovTorgInfo, DiadocAPI, Diadoc_Base, 
  diadoc_consts, diadoc_simple_arrays, DiadocTypes, 
  DiadocTypes_AcquireCounteragent, DiadocTypes_Address, 
  DiadocTypes_AsyncMethodResult, DiadocTypes_CertificateInfo, 
  DiadocTypes_CloudSign, DiadocTypes_Content, DiadocTypes_Content_v2, 
  DiadocTypes_Counteragent, DiadocTypes_CustomDataItem, 
  DiadocTypes_DocumentDirection, DiadocTypes_DocumentId, 
  DiadocTypes_DocumentType, DiadocTypes_ExternalServiceAuthInfo, 
  DiadocTypes_ForwardDocumentEvent, DiadocTypes_GetOrganizationsByInnList, 
  DiadocTypes_Organization, DiadocTypes_OrganizationPropertiesToUpdate, 
  DiadocTypes_OrganizationUser, DiadocTypes_OrganizationUserPermissions, 
  DiadocTypes_ResolutionRouteList, DiadocTypes_ResolutionTarget, 
  DiadocTypes_RoamingNotification, DiadocTypes_SignatureInfo, 
  DiadocTypes_SignatureVerificationResult, DiadocTypes_TimeBasedFilter, 
  DiadocTypes_Timestamp, DiadocTypes_User, diadoc_utils, DiadocTypes_BoxList, 
  DiadocTypes_LockMode, DiadocTypes_Employee, DiadocTypes_Subscription, 
  DiadocTypes_EmployeeToCreate, DiadocTypes_UserToUpdate, 
  DiadocTypes_EmployeeToUpdate, DiadocTypes_DocumentFilter, 
  DiadocTypes_ResolutionType, DiadocTypes_ResolutionRequestType, 
  DiadocTypes_Department, DiadocTypes_DepartmentList, 
  DiadocTypes_DepartmentToCreate, DiadocTypes_DepartmentToUpdate, 
  DiadocTypes_Routing, ResolutionAction, DiadocTypes_RegistrationRequest, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('DiadocAPI', @DiadocAPI.Register);
end;

initialization
  RegisterPackage('diadoc_fpc', @Register);
end.
