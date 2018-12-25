{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit diadoc_visual;

{$warn 5023 off : no warning about unused units}
interface

uses
  ddVisualCommon, ddVisualRegister, ddOrganizationInfoUnit, 
  AdressInfoFrameUnit, BoxInfoUnit, ddConsts, ssOrganizationInfoSympleUnit, 
  ddOrganizationUsersList, ddOrganizationUsersUnit, 
  ddOrganizationEmployeesUnit, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('ddVisualRegister', @ddVisualRegister.Register);
end;

initialization
  RegisterPackage('diadoc_visual', @Register);
end.
