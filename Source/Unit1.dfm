object Main: TMain
  Left = 192
  Top = 125
  Width = 480
  Height = 640
  Caption = 'Instagram'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object WebView: TWebBrowser
    Left = 0
    Top = 0
    Width = 464
    Height = 601
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C000000F52F00001D3E00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object XPManifest: TXPManifest
    Left = 8
    Top = 8
  end
end
