object Form2: TForm2
  Left = 216
  Top = 216
  BorderStyle = bsToolWindow
  Caption = 'Quitter'
  ClientHeight = 61
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 16
    Top = 16
    Width = 492
    Height = 33
    Caption = 'Etes vous s'#251'r de vouloir fermer cette fen'#234'tre ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 536
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Oui'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 632
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Non'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
