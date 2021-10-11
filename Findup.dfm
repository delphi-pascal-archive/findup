object Form1: TForm1
  Left = 252
  Top = 114
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Findup'
  ClientHeight = 374
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Findup: TGroupBox
    Left = 0
    Top = 24
    Width = 705
    Height = 313
    Caption = ' Findup '
    TabOrder = 6
  end
  object DriveComboBox1: TDriveComboBox
    Left = 16
    Top = 48
    Width = 145
    Height = 19
    TabOrder = 0
    OnChange = DriveComboBox1Change
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 16
    Top = 72
    Width = 145
    Height = 250
    ItemHeight = 16
    TabOrder = 1
    OnChange = DirectoryListBox1Change
    OnClick = DirectoryListBox1Click
  end
  object Memo1: TMemo
    Left = 168
    Top = 48
    Width = 521
    Height = 273
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Button1: TButton
    Left = 568
    Top = 344
    Width = 129
    Height = 25
    Caption = 'Start scan'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 472
    Top = 344
    Width = 91
    Height = 25
    Caption = 'Clear'
    TabOrder = 4
    OnClick = Button2Click
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 0
    Width = 705
    Height = 17
    TabOrder = 5
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 72
    object N1: TMenuItem
      Caption = 'Fichier'
      object Quitterlapplication1: TMenuItem
        Caption = 'Quitter l'#39'application'
        OnClick = Quitterlapplication1Click
      end
    end
    object Outls1: TMenuItem
      Caption = 'Outils'
      object Clear1: TMenuItem
        Caption = 'Clear'
        OnClick = Button2Click
      end
    end
  end
end
