object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object EdgeBrowser1: TEdgeBrowser
    Left = 0
    Top = 185
    Width = 624
    Height = 256
    Align = alClient
    TabOrder = 0
    OnWebMessageReceived = EdgeBrowser1WebMessageReceived
    ExplicitLeft = 248
    ExplicitTop = 216
    ExplicitWidth = 100
    ExplicitHeight = 41
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 185
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Button1: TButton
      Left = 40
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Refresh'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Memo1: TMemo
      Left = 200
      Top = 32
      Width = 185
      Height = 89
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 80
      Top = 128
      Width = 121
      Height = 23
      TabOrder = 2
      Text = 'Edit1'
    end
  end
end
