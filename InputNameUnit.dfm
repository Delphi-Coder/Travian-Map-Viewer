object InputForm: TInputForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Input'
  ClientHeight = 90
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 97
    Height = 13
    Caption = 'Enter alliance name:'
  end
  object Button1: TButton
    Left = 30
    Top = 57
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object NameEdit: TEdit
    Left = 8
    Top = 27
    Width = 228
    Height = 21
    TabOrder = 0
  end
  object Button2: TButton
    Left = 136
    Top = 57
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
