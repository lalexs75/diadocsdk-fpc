unit ResolutionAction;

interface

uses Classes, SysUtils, types, protobuf_fpc;

type

  { ResolutionAction } 
  //enum ResolutionAction
  //{
  //	UnknownAction = 0;
  //	ApproveAction = 1;
  //	DisapproveAction = 2;
  //	SignWithApprovementSignature = 3;
  //	SignWithPrimarySignature = 4;
  //	DenySignatureRequest = 5;
  //	RejectSigning = 6;
  //}
  TResolutionAction = (
    UnknownAction = 0,
    ApproveAction = 1,
    DisapproveAction = 2,
    SignWithApprovementSignature = 3,
    SignWithPrimarySignature = 4,
    DenySignatureRequest = 5,
    RejectSigning = 6
  );
  TResolutionActions = array of TResolutionAction;


implementation
end.
