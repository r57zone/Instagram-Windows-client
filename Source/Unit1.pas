unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, URLMon, XPMan, IniFiles;

type
  TMain = class(TForm)
    WebView: TWebBrowser;
    XPManifest: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  OldWidth, OldHeight: integer;

implementation

{$R *.dfm}

procedure TMain.FormCreate(Sender: TObject);
const
  UserAgent = ' Mozilla/5.0 (Linux; Android 9.0;) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/51.0.2704.81 Mobile Safari/537.36 Instagram 8.4.0 Android (28/9.0.0; 560dpi; 1440x2560; en_US';
  //https://mpulp.mobi/2016/07/12/instagram-user-agent/
var
  Ini: TIniFile;
begin
  Application.Title:=Caption;
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
  Width:=Ini.ReadInteger('Main', 'Width', Width);
  Height:=Ini.ReadInteger('Main', 'Height', Height);
  OldWidth:=Width;
  OldHeight:=Height;
  Ini.Free;
  UrlMkSetSessionOption(URLMON_OPTION_USERAGENT, PChar(UserAgent), Length(UserAgent), 0);
  WebView.Silent:=true;
  WebView.Navigate('https://instagram.com');
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  if (Main.WindowState <> wsMaximized) then
    if (OldWidth <> Width) or (OldHeight <> Height) then begin
      Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
      Ini.WriteInteger('Main', 'Width', Width);
      Ini.WriteInteger('Main', 'Height', Height);
      Ini.Free;
    end;
end;

end.
