object DownloadForm: TDownloadForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'DownloadForm'
  ClientHeight = 86
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 8
    Top = 40
    Width = 345
    Height = 25
    Progress = 0
  end
  object Label1: TLabel
    Left = 80
    Top = 11
    Width = 187
    Height = 16
    Caption = 'Downloading map... Please wait!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
end
