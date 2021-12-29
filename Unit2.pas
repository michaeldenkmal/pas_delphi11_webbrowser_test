unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Winapi.WebView2,
  Winapi.ActiveX, Vcl.Edge, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.JSON;
const
  cINDEX_HTML='C:\Users\michael\Documents\Embarcadero\Studio\Projekte\webbrowsertest\index.html';

type
  TJsCall = record
    data:TJSONValue;
    nameOfRetFunc:String;
    class function fromJson(json:String):TJsCall;static;
    class function createJsCallFromRetValue(nameOfRetFunc:String;retvalue:TJSONObject):string;static;
  end;

  TForm2 = class(TForm)
    EdgeBrowser1: TEdgeBrowser;
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EdgeBrowser1WebMessageReceived(Sender: TCustomEdgeBrowser;
      Args: TWebMessageReceivedEventArgs);
  private
    { Private-Deklarationen }
    procedure reload;
    procedure edgeEnableDebug;
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  reload;
end;

procedure TForm2.EdgeBrowser1WebMessageReceived(Sender: TCustomEdgeBrowser;
  Args: TWebMessageReceivedEventArgs);
begin
  var json:Pchar:='';
  Args.ArgsInterface.Get_webMessageAsJson(json);
  var s:string := json;
  Memo1.Lines.Add(s);
  var jsExecargs:= TJsCall.fromJson(s);
  var ret := TJSONObject.Create(TJsonPair.Create('value',edit1.Text));
  var jsCallText:string := TJsCall.createJsCallFromRetValue(jsExecargs.nameOfRetFunc, ret);
  EdgeBrowser1.ExecuteScript(jsCallText);
end;

procedure TForm2.edgeEnableDebug;
begin
  // https://docs.microsoft.com/en-us/microsoft-edge/webview2/how-to/debug?tabs=devtools
  // f12 verwenden
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  EdgeBrowser1.Navigate(cINDEX_HTML);
end;

procedure TForm2.reload;
begin
  EdgeBrowser1.Navigate(cINDEX_HTML);
end;

{ TJsCall }

class function TJsCall.createJsCallFromRetValue(nameOfRetFunc: String;
  retvalue: TJSONObject): string;
begin
  var json:string := #39 + retValue.ToJSON() + #39;

  result := Format('%s (%s)',[nameOfRetFunc, json]);
end;

class function TJsCall.fromJson(json: String): TJsCall;
begin
  var jsObj:= TJsonObject.ParseJSONValue(json);
  result.data := jsObj.GetValue<TJSONValue>('data');
  result.nameOfRetFunc := jsObj.GetValue<string>('nameOfRetFunc');
end;

end.
