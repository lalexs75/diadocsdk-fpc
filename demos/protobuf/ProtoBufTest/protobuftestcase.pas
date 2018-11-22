unit ProtoBufTestCase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry;

type

  { TProtobufTest }

  TProtobufTest= class(TTestCase)
  protected
    function GetTestStream(ATestName:string):TStream;
  published
    procedure SimpleCreate1;
    procedure Test1Read;
    procedure Test2Read;
    procedure Test3Read;
    procedure DiaDocAdressRead;
  end;

implementation

uses FileUtil, LazFileUtils, GoogleTestTypesUnit, DIADocTypesUnit;

procedure TProtobufTest.SimpleCreate1;
var
  P: TPerson;
begin
  P:=TPerson.Create;
  AssertNotNull(P);
  P.Id:=-123;
  P.Name:='Пример';
  P.EMail:='test@test.dom';
  AssertEquals('Поле ID = -123', P.Id, -123);
  AssertEquals('Поле Name = ''Пример''', P.Name, 'Пример');
  AssertEquals('Поле EMail = ''test@test.dom''', P.EMail, 'test@test.dom');
  P.Free;
end;

procedure TProtobufTest.Test1Read;
var
  S: TStream;
  T: TTest1;
begin
  S:=GetTestStream('test1');
  if Assigned(S) then
  begin
    T:=TTest1.Create;
    T.LoadFromStream(S);
    AssertEquals('Поле ID = 150', T.A, 150);
    T.Free;
    S.Free;
  end;
end;

procedure TProtobufTest.Test2Read;
var
  T: TTest2;
  S: TStream;
begin
  S:=GetTestStream('test2');
  if Assigned(S) then
  begin
    T:=TTest2.Create;
    T.LoadFromStream(S);
    AssertEquals('Поле B = ''testing''', T.B, 'testing');
    T.Free;
    S.Free;
  end;
end;

procedure TProtobufTest.Test3Read;
var
  S: TStream;
  T: TTest3;
begin
  S:=GetTestStream('test3');
  if Assigned(S) then
  begin
    T:=TTest3.Create;
    T.LoadFromStream(S);
    AssertEquals('Поле C.A = 150', T.C.A, 150);
    T.Free;
    S.Free;
  end;
end;

procedure TProtobufTest.DiaDocAdressRead;
var
  S: TStream;
  T: TRussianAddress;
begin
  S:=GetTestStream('GetAdress');
  if Assigned(S) then
  begin
    T:=TRussianAddress.Create;
    T.LoadFromStream(S);
    AssertEquals('T.ZipCode = ', T.ZipCode, '620000');
    AssertEquals('T.Region = ', T.Region, '66');
    AssertEquals('T.Territory = ', T.Territory, '');
    AssertEquals('T.City = ', T.City, 'г. Екатеринбург');
    AssertEquals('T.Locality = ', T.Locality, '');
    AssertEquals('T.Street = ', T.Street, 'ул. Радищева');
    AssertEquals('T.Building = ', T.Building, '28');
    AssertEquals('T.Block = ', T.Block, '');
    AssertEquals('T.Apartment = ', T.Apartment, '');
    T.Free;
    S.Free;
  end;
end;

function TProtobufTest.GetTestStream(ATestName: string): TStream;
var
  AFileName: String;
begin
  AFileName:=ExtractFileDir(ParamStr(0));
  AFileName:=AppendPathDelim(ExtractFileDir(AFileName)) + AppendPathDelim('data') + ChangeFileExt(ATestName, '.protobuf') ;
  if FileExists(AFileName) then
    Result:=TFileStream.Create(AFileName, fmOpenRead)
  else
    Result:=nil;
end;

initialization

  RegisterTest(TProtobufTest);
end.

