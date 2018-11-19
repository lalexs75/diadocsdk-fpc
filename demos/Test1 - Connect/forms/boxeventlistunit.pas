unit BoxEventListUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, DB,
  DiadocAPI, DiadocTypes_DiadocMessage_GetApi, rxdbgrid, rxmemds;

type

  { TBoxEventListForm }

  TBoxEventListForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    dsEvents: TDataSource;
    RxDBGrid1: TRxDBGrid;
    rxEvents: TRxMemoryData;
    rxEventsEventId: TStringField;
    rxEventsMessage: TStringField;
  private
    FDiadocAPI: TDiadocAPI;
    FBoxID: String;
  public
    procedure LoadEvents(ABoxID:string; ADiadocAPI: TDiadocAPI);
  end;

var
  BoxEventListForm: TBoxEventListForm;

implementation

{$R *.lfm}

{ TBoxEventListForm }

procedure TBoxEventListForm.LoadEvents(ABoxID: string; ADiadocAPI: TDiadocAPI);
var
  FEvents: TBoxEventList;
  E: TBoxEvent;
begin
  FDiadocAPI:=ADiadocAPI;
  FBoxID:=ABoxID;

  FEvents:=FDiadocAPI.GetNewEvents(FBoxID, '');
  if Assigned(FEvents) then
  begin
    rxEvents.Open;
    for E in FEvents.Events do
    begin
      rxEvents.Append;
      rxEventsEventId.AsString:=E.EventId;
      rxEventsMessage.AsString:=E.Message.ToTitle;
{      property EventId:string read FEventId write FEventId;//1;
      property Message:TMessage read FMessage;//2;
      property Patch:TMessagePatch read FPatch; //3;}

      rxEvents.Post;
    end;
    rxEvents.First;
    FEvents.Free;
  end;
end;

end.

