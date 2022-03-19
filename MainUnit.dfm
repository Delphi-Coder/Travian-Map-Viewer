object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Travian Map Viewer'
  ClientHeight = 719
  ClientWidth = 905
  Color = clBtnFace
  Constraints.MinWidth = 921
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 675
    Top = 0
    Width = 5
    Height = 565
    Align = alRight
    OnCanResize = Splitter1CanResize
    ExplicitLeft = 673
    ExplicitHeight = 564
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 565
    Width = 905
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    OnCanResize = Splitter2CanResize
    ExplicitTop = 0
    ExplicitWidth = 424
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 565
    Align = alClient
    TabOrder = 0
    object ImgView: TImgView32
      Left = 1
      Top = 1
      Width = 673
      Height = 563
      Align = alClient
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baCustom
      Color = clBtnFace
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smScale
      ScrollBars.ShowHandleGrip = True
      ScrollBars.Style = rbsDefault
      ScrollBars.Size = 17
      OverSize = 0
      TabOrder = 0
      TabStop = True
      OnClick = ImgViewClick
      OnMouseDown = ImgViewMouseDown
      OnMouseMove = ImgViewMouseMove
      OnMouseUp = ImgViewMouseUp
      OnMouseWheelDown = ImgViewMouseWheelDown
      OnMouseWheelUp = ImgViewMouseWheelUp
    end
  end
  object Panel2: TPanel
    Left = 680
    Top = 0
    Width = 225
    Height = 565
    Align = alRight
    TabOrder = 1
    object GroupBox3: TGroupBox
      Left = 6
      Top = 1
      Width = 213
      Height = 276
      Caption = 'Favorite Players/Alliances'
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 25
        Width = 41
        Height = 13
        Caption = 'Alliances'
      end
      object Label2: TLabel
        Left = 6
        Top = 147
        Width = 35
        Height = 13
        Caption = 'Players'
      end
      object AllianceListBox: TListBox
        Left = 6
        Top = 44
        Width = 122
        Height = 97
        Style = lbOwnerDrawFixed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        StyleElements = [seFont]
        OnClick = AllianceListBoxClick
        OnDrawItem = AllianceListBoxDrawItem
        OnMouseDown = AllianceListBoxMouseDown
      end
      object PlayersListBox: TListBox
        Left = 6
        Top = 166
        Width = 122
        Height = 97
        Style = lbOwnerDrawFixed
        ItemHeight = 13
        TabOrder = 1
        OnDrawItem = PlayersListBoxDrawItem
        OnMouseDown = PlayersListBoxMouseDown
      end
      object RemoveAllianceButton: TBitBtn
        Left = 131
        Top = 44
        Width = 75
        Height = 25
        Caption = ' Remove'
        Glyph.Data = {
          E6010000424DE60100000000000036000000280000000C0000000C0000000100
          180000000000B0010000C30E0000C30E00000000000000000000FFFFFF5959C7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFE6E5F6FFFFFF2D2D
          BC0606AFABABE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4BC59B
          9BDE4F4FC71A1AB90909B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9EB
          1111B6FFFFFFCDCDF01717BA1B1BBD6D6DD3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0000A6A1A1E3FFFFFFFFFFFF6363D31F1FC22626C2BFBFECFFFFFFFFFFFFE5
          E5F53131C54747CBFFFFFFFFFFFFFFFFFFFFFFFF3838C91E1EC43737C9FFFFFF
          FFFFFF5050CF0000B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444D11E1D
          C84141CF3F3FCF0D0DC5BCBCECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF6969DB2B2BCE2C2CCE7777DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF7E7EE24343D73A3AD50808CD4747D7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFB5B5EE2525D52F2FD63131D84B4BDBFFFFFF5A5ADF0000CACECEF3FFFFFFFF
          FFFF7373E52828D93737DC2F2FDA7272E5FFFFFFFFFFFFFFFFFFAAAAF02E2ED8
          6363E3E9E9F9FFFFFF4E4EE36868E5D2D2F7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFABABF0FCFCFC}
        TabOrder = 2
        OnClick = RemoveAllianceButtonClick
      end
      object AddAllianceButton: TBitBtn
        Left = 131
        Top = 75
        Width = 75
        Height = 25
        Caption = '  Add      '
        Glyph.Data = {
          E6010000424DE60100000000000036000000280000000C0000000C0000000100
          180000000000B0010000C30E0000C30E00000000000000000000FFFFF5FFFFF5
          FFFFF5FFFFF524663503681A03681A246635FFFFF5FFFFF5FFFFF5FFFFF5FFFF
          F5FFFFF5FFFFF5FFFFF504671F008A1A008A1A04671FFFFFF5FFFFF5FFFFF5FF
          FFF5FFFFF5FFFFF5FFFFF5FFFFF504651B009D21009D2104651BFFFFF5FFFFF5
          FFFFF5FFFFF5FFFFF5FFFFF5FFFFF5FFFFF51369230CA1290CA129136923FFFF
          F5FFFFF5FFFFF5FFFFF5017A180E7C1C00760A007E1A007825159C56159C5600
          7825007E1A00760A0E7C1C017A18007C161FA54B1FAD4C17A54015B1420CA73C
          0CA73C15B14217A5401FAD4C1FA54B007C16008A2F1AA9521AB15422B05D14B3
          5722B66A22B66A14B35722B05D1AB1541AA952008A2F1180241385280A80210B
          792B008E281AB1621AB162008E280B792B0A8021138528118024FFFFF5FFFFF5
          FFFFF5FFFFF50087362FBF772FBF77008736FFFFF5FFFFF5FFFFF5FFFFF5FFFF
          F5FFFFF5FFFFF5FFFFF500882835C57235C572008828FFFFF5FFFFF5FFFFF5FF
          FFF5FFFFF5FFFFF5FFFFF5FFFFF500872F33BB7B33BB7B00872FFFFFF5FFFFF5
          FFFFF5FFFFF5FFFFF5FFFFF5FFFFF5FFFFF500941A00962900962900941AFFFF
          F5FFFFF5FFFFF5FFFFF5}
        TabOrder = 3
        OnClick = AddAllianceButtonClick
      end
      object ChangeAllianceColorButton: TBitBtn
        Left = 131
        Top = 106
        Width = 75
        Height = 25
        Caption = ' Color     '
        Glyph.Data = {
          16020000424D160200000000000036000000280000000D0000000C0000000100
          180000000000E0010000120B0000120B00000000000000000000FFFFFF2F3BF7
          2F3BF72F3BF7FFFFFF3D92403D92403D9240FFFFFFC20E00C20E00C20E00FFFF
          FF80FFFFFF2F3BF7090FBC2F3BF7FFFFFF3D92400F700F3D9240FFFFFFC20E00
          7E1D15C20E00FFFFFF00FFFFFF2F3BF7090FBC2F3BF7FFFFFF3D92400F700F3D
          9240FFFFFFC20E007E1D15C20E00FFFFFF00FFFFFF2F3BF7090FBC2F3BF7FFFF
          FF3D92400F700F3D9240FFFFFFC20E007E1D15C20E00FFFFFF00FFFFFF2F3BF7
          090FBC2F3BF7FFFFFF3D92400F700F3D9240FFFFFFC20E007E1D15C20E00FFFF
          FF80FFFFFF2F3BF7090FBC2F3BF7FFFFFF3D92400F700F3D9240FFFFFFC20E00
          7E1D15C20E00FFFFFF00FFFFFF2F3BF7090FBC2F3BF7FFFFFF3D92400F700F3D
          9240FFFFFFC20E007E1D15C20E00FFFFFF80FFFFFF2F3BF72F3BF72F3BF7FFFF
          FF3D92403D92403D9240FFFFFFC20E00C20E00C20E00FFFFFF00FFFFFF8AD0FF
          8AD0FF8AD0FFFFFFFF8AD0FF8AD0FF8AD0FFFFFFFF8AD0FF84CDF58AD0FFFFFF
          FF00FFFFFFBFC3FE8AD0FFBFC3FEFFFFFFA7DEA98AD0FFA7DEA9FFFFFFE1A29D
          8AD0FFE1A29DFFFFFF00FFFFFFFFFFFF2F3BF7F2F1F8FFFFFFFFFFFF3D9240FD
          FDFBFFFFFFFFFFFFC20E00D4EDF7FFFFFF80FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
        TabOrder = 4
        OnClick = ChangeAllianceColorButtonClick
      end
      object RemovePlayerButton: TBitBtn
        Left = 131
        Top = 164
        Width = 75
        Height = 25
        Caption = ' Remove'
        Glyph.Data = {
          E6010000424DE60100000000000036000000280000000C0000000C0000000100
          180000000000B0010000C30E0000C30E00000000000000000000FFFFFF5959C7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFE6E5F6FFFFFF2D2D
          BC0606AFABABE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4BC59B
          9BDE4F4FC71A1AB90909B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9EB
          1111B6FFFFFFCDCDF01717BA1B1BBD6D6DD3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0000A6A1A1E3FFFFFFFFFFFF6363D31F1FC22626C2BFBFECFFFFFFFFFFFFE5
          E5F53131C54747CBFFFFFFFFFFFFFFFFFFFFFFFF3838C91E1EC43737C9FFFFFF
          FFFFFF5050CF0000B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444D11E1D
          C84141CF3F3FCF0D0DC5BCBCECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF6969DB2B2BCE2C2CCE7777DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF7E7EE24343D73A3AD50808CD4747D7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFB5B5EE2525D52F2FD63131D84B4BDBFFFFFF5A5ADF0000CACECEF3FFFFFFFF
          FFFF7373E52828D93737DC2F2FDA7272E5FFFFFFFFFFFFFFFFFFAAAAF02E2ED8
          6363E3E9E9F9FFFFFF4E4EE36868E5D2D2F7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFABABF0FCFCFC}
        TabOrder = 5
        OnClick = RemovePlayerButtonClick
      end
      object AddPlayerButton: TBitBtn
        Left = 131
        Top = 195
        Width = 75
        Height = 25
        Caption = '  Add      '
        Glyph.Data = {
          E6010000424DE60100000000000036000000280000000C0000000C0000000100
          180000000000B0010000C30E0000C30E00000000000000000000FFFFF5FFFFF5
          FFFFF5FFFFF524663503681A03681A246635FFFFF5FFFFF5FFFFF5FFFFF5FFFF
          F5FFFFF5FFFFF5FFFFF504671F008A1A008A1A04671FFFFFF5FFFFF5FFFFF5FF
          FFF5FFFFF5FFFFF5FFFFF5FFFFF504651B009D21009D2104651BFFFFF5FFFFF5
          FFFFF5FFFFF5FFFFF5FFFFF5FFFFF5FFFFF51369230CA1290CA129136923FFFF
          F5FFFFF5FFFFF5FFFFF5017A180E7C1C00760A007E1A007825159C56159C5600
          7825007E1A00760A0E7C1C017A18007C161FA54B1FAD4C17A54015B1420CA73C
          0CA73C15B14217A5401FAD4C1FA54B007C16008A2F1AA9521AB15422B05D14B3
          5722B66A22B66A14B35722B05D1AB1541AA952008A2F1180241385280A80210B
          792B008E281AB1621AB162008E280B792B0A8021138528118024FFFFF5FFFFF5
          FFFFF5FFFFF50087362FBF772FBF77008736FFFFF5FFFFF5FFFFF5FFFFF5FFFF
          F5FFFFF5FFFFF5FFFFF500882835C57235C572008828FFFFF5FFFFF5FFFFF5FF
          FFF5FFFFF5FFFFF5FFFFF5FFFFF500872F33BB7B33BB7B00872FFFFFF5FFFFF5
          FFFFF5FFFFF5FFFFF5FFFFF5FFFFF5FFFFF500941A00962900962900941AFFFF
          F5FFFFF5FFFFF5FFFFF5}
        TabOrder = 6
        OnClick = AddPlayerButtonClick
      end
      object ChangePlayerColorButton: TBitBtn
        Left = 131
        Top = 226
        Width = 75
        Height = 25
        Caption = ' Color     '
        Glyph.Data = {
          16020000424D160200000000000036000000280000000D0000000C0000000100
          180000000000E0010000120B0000120B00000000000000000000FFFFFF2F3BF7
          2F3BF72F3BF7FFFFFF3D92403D92403D9240FFFFFFC20E00C20E00C20E00FFFF
          FF80FFFFFF2F3BF7090FBC2F3BF7FFFFFF3D92400F700F3D9240FFFFFFC20E00
          7E1D15C20E00FFFFFF00FFFFFF2F3BF7090FBC2F3BF7FFFFFF3D92400F700F3D
          9240FFFFFFC20E007E1D15C20E00FFFFFF00FFFFFF2F3BF7090FBC2F3BF7FFFF
          FF3D92400F700F3D9240FFFFFFC20E007E1D15C20E00FFFFFF00FFFFFF2F3BF7
          090FBC2F3BF7FFFFFF3D92400F700F3D9240FFFFFFC20E007E1D15C20E00FFFF
          FF80FFFFFF2F3BF7090FBC2F3BF7FFFFFF3D92400F700F3D9240FFFFFFC20E00
          7E1D15C20E00FFFFFF00FFFFFF2F3BF7090FBC2F3BF7FFFFFF3D92400F700F3D
          9240FFFFFFC20E007E1D15C20E00FFFFFF80FFFFFF2F3BF72F3BF72F3BF7FFFF
          FF3D92403D92403D9240FFFFFFC20E00C20E00C20E00FFFFFF00FFFFFF8AD0FF
          8AD0FF8AD0FFFFFFFF8AD0FF8AD0FF8AD0FFFFFFFF8AD0FF84CDF58AD0FFFFFF
          FF00FFFFFFBFC3FE8AD0FFBFC3FEFFFFFFA7DEA98AD0FFA7DEA9FFFFFFE1A29D
          8AD0FFE1A29DFFFFFF00FFFFFFFFFFFF2F3BF7F2F1F8FFFFFFFFFFFF3D9240FD
          FDFBFFFFFFFFFFFFC20E00D4EDF7FFFFFF80FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
        TabOrder = 7
        OnClick = ChangePlayerColorButtonClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 6
      Top = 283
      Width = 213
      Height = 78
      Caption = 'Statistics'
      TabOrder = 1
      object Label8: TLabel
        Left = 8
        Top = 24
        Width = 96
        Height = 13
        Caption = 'Total players count:'
      end
      object Label9: TLabel
        Left = 8
        Top = 43
        Width = 96
        Height = 13
        Caption = 'Total Villages count:'
      end
      object TotalPlayerLabel: TLabel
        Left = 120
        Top = 24
        Width = 6
        Height = 13
        Caption = '0'
      end
      object TotalVillageLabel: TLabel
        Left = 120
        Top = 43
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
    object ShowNatarsCheckBox: TCheckBox
      Left = 6
      Top = 367
      Width = 97
      Height = 17
      Caption = 'Show Natars'
      TabOrder = 2
      OnClick = ShowNatarsCheckBoxClick
    end
    object ShowCropsCheckBox: TCheckBox
      Left = 6
      Top = 390
      Width = 97
      Height = 17
      Caption = 'Show Crops'
      TabOrder = 3
      OnClick = ShowCropsCheckBoxClick
    end
    object Button1: TButton
      Left = 120
      Top = 392
      Width = 71
      Height = 19
      Caption = 'Crop Settings'
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 568
    Width = 905
    Height = 151
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      905
      151)
    object StatusBar1: TStatusBar
      Left = 1
      Top = 131
      Width = 903
      Height = 19
      Panels = <
        item
          Width = 50
        end>
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 2
      Width = 206
      Height = 126
      Caption = 'Map'
      TabOrder = 1
      object Label3: TLabel
        Left = 9
        Top = 13
        Width = 54
        Height = 13
        Caption = 'Server URL'
      end
      object ServerComboBox: TComboBox
        Left = 9
        Top = 27
        Width = 125
        Height = 21
        TabOrder = 0
        Items.Strings = (
          'https://ts4.travian.com'
          'https://ts5.travian.com'
          'https://ts6.travian.com'
          'https://ts7.travian.com'
          'https://ts8.travian.com'
          'https://tx3.travian.com'
          'https://tx3.travian.ir')
      end
      object DownloadMapButton: TButton
        Left = 138
        Top = 25
        Width = 60
        Height = 25
        Caption = 'Download'
        TabOrder = 1
        OnClick = DownloadMapButtonClick
      end
      object MapsListBox: TListBox
        Left = 9
        Top = 51
        Width = 189
        Height = 71
        ItemHeight = 13
        TabOrder = 2
        OnDblClick = MapsListBoxDblClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 440
      Top = 2
      Width = 458
      Height = 126
      Anchors = [akRight, akBottom]
      Caption = 'Selected Player'
      TabOrder = 2
      object Label4: TLabel
        Left = 12
        Top = 23
        Width = 44
        Height = 16
        Caption = 'Player: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 12
        Top = 40
        Width = 26
        Height = 16
        Caption = 'Pop:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 12
        Top = 57
        Width = 35
        Height = 16
        Caption = 'Tribe:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 12
        Top = 74
        Width = 80
        Height = 16
        Caption = 'Village Count:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object PlayerNameLabel: TLabel
        Left = 110
        Top = 23
        Width = 5
        Height = 16
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object PopLabel: TLabel
        Left = 110
        Top = 40
        Width = 7
        Height = 16
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object TribeLabel: TLabel
        Left = 110
        Top = 57
        Width = 5
        Height = 16
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object VillageCountLabel: TLabel
        Left = 110
        Top = 74
        Width = 7
        Height = 16
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 12
        Top = 92
        Width = 49
        Height = 16
        Caption = 'Alliance:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object AllianceNameLabel: TLabel
        Left = 110
        Top = 92
        Width = 4
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 227
        Top = 13
        Width = 27
        Height = 13
        Caption = 'Name'
      end
      object Label12: TLabel
        Left = 316
        Top = 13
        Width = 61
        Height = 13
        Caption = 'Coordination'
      end
      object Label13: TLabel
        Left = 381
        Top = 13
        Width = 50
        Height = 13
        Caption = 'Population'
      end
      object ActivePlayerStringGrid: TStringGrid
        Left = 219
        Top = 29
        Width = 232
        Height = 90
        ColCount = 3
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goThumbTracking]
        ScrollBars = ssVertical
        TabOrder = 0
        ColWidths = (
          64
          64
          64)
        RowHeights = (
          24)
      end
    end
    object GroupBox5: TGroupBox
      Left = 214
      Top = 2
      Width = 224
      Height = 126
      Caption = 'Colors'
      TabOrder = 3
      object Label14: TLabel
        Left = 8
        Top = 24
        Width = 56
        Height = 13
        Caption = 'Background'
      end
      object Label15: TLabel
        Left = 8
        Top = 40
        Width = 89
        Height = 13
        Caption = 'Village Background'
      end
      object Label16: TLabel
        Left = 8
        Top = 56
        Width = 109
        Height = 13
        Caption = 'Selected Village Border'
      end
      object Label17: TLabel
        Left = 8
        Top = 88
        Width = 75
        Height = 13
        Caption = 'Seperator Lines'
      end
      object Label18: TLabel
        Left = 8
        Top = 72
        Width = 133
        Height = 13
        Caption = 'Selected Village Background'
      end
      object Label19: TLabel
        Left = 8
        Top = 104
        Width = 116
        Height = 13
        Caption = 'Farm Village Background'
      end
      object ColorSwatch1: TImage32
        Left = 160
        Top = 24
        Width = 56
        Height = 13
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        Color = clYellow
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 0
        OnClick = ColorSwatchsClick
      end
      object ColorSwatch2: TImage32
        Tag = 1
        Left = 160
        Top = 40
        Width = 56
        Height = 13
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        Color = -9728477
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 1
        OnClick = ColorSwatchsClick
      end
      object ColorSwatch3: TImage32
        Tag = 2
        Left = 160
        Top = 56
        Width = 56
        Height = 13
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        Color = -360334
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 2
        OnClick = ColorSwatchsClick
      end
      object ColorSwatch4: TImage32
        Tag = 3
        Left = 160
        Top = 72
        Width = 56
        Height = 13
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        Color = -360334
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 3
        OnClick = ColorSwatchsClick
      end
      object ColorSwatch5: TImage32
        Tag = 4
        Left = 160
        Top = 88
        Width = 56
        Height = 13
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        Color = -360334
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 4
        OnClick = ColorSwatchsClick
      end
      object ColorSwatch6: TImage32
        Tag = 5
        Left = 160
        Top = 104
        Width = 56
        Height = 13
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        Color = -360334
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 5
        OnClick = ColorSwatchsClick
      end
    end
  end
  object ImgViewPopupMenu: TPopupMenu
    Left = 201
    Top = 97
    object Addplayertofavorites: TMenuItem
      Caption = 'Add player to favorites'
      OnClick = AddplayertofavoritesClick
    end
    object Addalliancetofavorite: TMenuItem
      Caption = 'Add alliance to favorite'
      OnClick = AddalliancetofavoriteClick
    end
  end
  object ColorDialog: TColorDialog
    Left = 489
    Top = 129
  end
  object ColorDialog1: TColorDialog
    Left = 543
    Top = 625
  end
end
