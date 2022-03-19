object CropSettingForm: TCropSettingForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'CropSettingForm'
  ClientHeight = 259
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 201
    Height = 201
    Caption = '9 3 3 3 Crops'
    TabOrder = 0
    object CheckBox9333_150: TCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = ' 150 %'
      TabOrder = 0
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox9333_125: TCheckBox
      Tag = 1
      Left = 8
      Top = 48
      Width = 97
      Height = 17
      Caption = ' 125 %'
      TabOrder = 1
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox9333_100: TCheckBox
      Tag = 2
      Left = 8
      Top = 72
      Width = 97
      Height = 17
      Caption = ' 100 %'
      TabOrder = 2
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox9333_75: TCheckBox
      Tag = 3
      Left = 8
      Top = 96
      Width = 97
      Height = 17
      Caption = ' 75 %'
      TabOrder = 3
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox9333_50: TCheckBox
      Tag = 4
      Left = 8
      Top = 120
      Width = 97
      Height = 17
      Caption = '50 %'
      TabOrder = 4
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox9333_25: TCheckBox
      Tag = 5
      Left = 8
      Top = 144
      Width = 97
      Height = 17
      Caption = ' 25 %'
      TabOrder = 5
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox9333_0: TCheckBox
      Tag = 6
      Left = 8
      Top = 167
      Width = 97
      Height = 17
      Caption = ' 0 %'
      TabOrder = 6
      OnClick = CropShowCheckBoxClick
    end
    object ColorSwatch9cc150: TImage32
      Left = 134
      Top = 28
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 7
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch9cc125: TImage32
      Tag = 1
      Left = 134
      Top = 52
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 8
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch9cc100: TImage32
      Tag = 2
      Left = 134
      Top = 76
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 9
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch9cc75: TImage32
      Tag = 3
      Left = 134
      Top = 100
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 10
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch9cc50: TImage32
      Tag = 4
      Left = 134
      Top = 124
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 11
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch9cc25: TImage32
      Tag = 5
      Left = 134
      Top = 148
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 12
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch9cc0: TImage32
      Tag = 6
      Left = 134
      Top = 171
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 13
      OnClick = ColorSwatchsClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 224
    Top = 8
    Width = 201
    Height = 201
    Caption = '15 1 1 1 Crops'
    TabOrder = 1
    object CheckBox15111_150: TCheckBox
      Tag = 7
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = ' 150 %'
      TabOrder = 0
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox15111_125: TCheckBox
      Tag = 8
      Left = 16
      Top = 48
      Width = 97
      Height = 17
      Caption = ' 125 %'
      TabOrder = 1
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox15111_100: TCheckBox
      Tag = 9
      Left = 16
      Top = 72
      Width = 97
      Height = 17
      Caption = ' 100 %'
      TabOrder = 2
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox15111_75: TCheckBox
      Tag = 10
      Left = 16
      Top = 96
      Width = 97
      Height = 17
      Caption = ' 75 %'
      TabOrder = 3
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox15111_50: TCheckBox
      Tag = 11
      Left = 16
      Top = 120
      Width = 97
      Height = 17
      Caption = '50 %'
      TabOrder = 4
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox15111_25: TCheckBox
      Tag = 12
      Left = 16
      Top = 144
      Width = 97
      Height = 17
      Caption = ' 25 %'
      TabOrder = 5
      OnClick = CropShowCheckBoxClick
    end
    object CheckBox15111_0: TCheckBox
      Tag = 13
      Left = 16
      Top = 167
      Width = 97
      Height = 17
      Caption = ' 0 %'
      TabOrder = 6
      OnClick = CropShowCheckBoxClick
    end
    object ColorSwatch15cc150: TImage32
      Tag = 7
      Left = 134
      Top = 28
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 7
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch15cc125: TImage32
      Tag = 8
      Left = 134
      Top = 52
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 8
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch15cc100: TImage32
      Tag = 9
      Left = 134
      Top = 76
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 9
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch15cc75: TImage32
      Tag = 10
      Left = 134
      Top = 100
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 10
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch15cc50: TImage32
      Tag = 11
      Left = 134
      Top = 124
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 11
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch15cc25: TImage32
      Tag = 12
      Left = 134
      Top = 148
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 12
      OnClick = ColorSwatchsClick
    end
    object ColorSwatch15cc0: TImage32
      Tag = 13
      Left = 134
      Top = 171
      Width = 56
      Height = 13
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clYellow
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 13
      OnClick = ColorSwatchsClick
    end
  end
  object Button1: TButton
    Left = 184
    Top = 226
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 2
    OnClick = Button1Click
  end
  object ColorDialog: TColorDialog
    Left = 364
    Top = 215
  end
end
