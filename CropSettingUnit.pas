unit CropSettingUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, GR32_Image, GR32;

type
  TCropSettingForm = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CheckBox9333_150: TCheckBox;
    CheckBox9333_125: TCheckBox;
    CheckBox9333_100: TCheckBox;
    CheckBox9333_75: TCheckBox;
    CheckBox9333_50: TCheckBox;
    CheckBox9333_25: TCheckBox;
    CheckBox9333_0: TCheckBox;
    CheckBox15111_150: TCheckBox;
    CheckBox15111_125: TCheckBox;
    CheckBox15111_100: TCheckBox;
    CheckBox15111_75: TCheckBox;
    CheckBox15111_50: TCheckBox;
    CheckBox15111_25: TCheckBox;
    CheckBox15111_0: TCheckBox;
    Button1: TButton;
    ColorSwatch9cc150: TImage32;
    ColorSwatch9cc125: TImage32;
    ColorSwatch9cc100: TImage32;
    ColorSwatch9cc75: TImage32;
    ColorSwatch9cc50: TImage32;
    ColorSwatch9cc25: TImage32;
    ColorSwatch9cc0: TImage32;
    ColorSwatch15cc150: TImage32;
    ColorSwatch15cc125: TImage32;
    ColorSwatch15cc100: TImage32;
    ColorSwatch15cc75: TImage32;
    ColorSwatch15cc50: TImage32;
    ColorSwatch15cc25: TImage32;
    ColorSwatch15cc0: TImage32;
    ColorDialog: TColorDialog;
    procedure Button1Click(Sender: TObject);
    procedure ColorSwatchsClick(Sender: TObject);
    procedure CropShowCheckBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FShow9cc0percent: Boolean;
    FShow9cc150percent: Boolean;
    FShow9cc25percent: Boolean;
    FShow9cc50percent: Boolean;
    FShow9cc75percent: Boolean;
    FShow9cc100percent: Boolean;
    FShow9cc125percent: Boolean;
    FShow15cc100Percent: Boolean;
    FShow15cc125Percent: Boolean;
    FShow15cc150Percent: Boolean;
    FShow15cc25Percent: Boolean;
    FShow15cc50Percent: Boolean;
    FShow15cc0Percent: Boolean;
    FShow15cc75Percent: Boolean;
    FCr15cc125Color: TColor;
    FCr9cc25Color: TColor;
    FCr15cc150Color: TColor;
    FCr9cc50Color: TColor;
    FCr9cc0Color: TColor;
    FCr9cc75Color: TColor;
    FCr15cc25Color: TColor;
    FCr15cc50Color: TColor;
    FCr15cc0Color: TColor;
    FCr15cc75Color: TColor;
    FCr9cc100Color: TColor;
    FCr9cc125Color: TColor;
    FCr9cc150Color: TColor;
    FCr15cc100Color: TColor;
    procedure SetShow9cc0percent(const Value: Boolean);
    procedure SetShow9cc100percent(const Value: Boolean);
    procedure SetShow9cc125percent(const Value: Boolean);
    procedure SetShow9cc150percent(const Value: Boolean);
    procedure SetShow9cc25percent(const Value: Boolean);
    procedure SetShow9cc50percent(const Value: Boolean);
    procedure SetShow9cc75percent(const Value: Boolean);
    procedure SetShow15cc0Percent(const Value: Boolean);
    procedure SetShow15cc100Percent(const Value: Boolean);
    procedure SetShow15cc125Percent(const Value: Boolean);
    procedure SetShow15cc150Percent(const Value: Boolean);
    procedure SetShow15cc25Percent(const Value: Boolean);
    procedure SetShow15cc50Percent(const Value: Boolean);
    procedure SetShow15cc75Percent(const Value: Boolean);
    procedure SetCr15cc0Color(const Value: TColor);
    procedure SetCr15cc100Color(const Value: TColor);
    procedure SetCr15cc125Color(const Value: TColor);
    procedure SetCr15cc150Color(const Value: TColor);
    procedure SetCr15cc25Color(const Value: TColor);
    procedure SetCr15cc50Color(const Value: TColor);
    procedure SetCr15cc75Color(const Value: TColor);
    procedure SetCr9cc0Color(const Value: TColor);
    procedure SetCr9cc100Color(const Value: TColor);
    procedure SetCr9cc125Color(const Value: TColor);
    procedure SetCr9cc150Color(const Value: TColor);
    procedure SetCr9cc25Color(const Value: TColor);
    procedure SetCr9cc50Color(const Value: TColor);
    procedure SetCr9cc75Color(const Value: TColor);
    { Private declarations }
  public
    { Public declarations }
    property Cr9cc0Color: TColor read FCr9cc0Color write SetCr9cc0Color;
    property Cr9cc25Color: TColor read FCr9cc25Color write SetCr9cc25Color;
    property Cr9cc50Color: TColor read FCr9cc50Color write SetCr9cc50Color;
    property Cr9cc75Color: TColor read FCr9cc75Color write SetCr9cc75Color;
    property Cr9cc100Color: TColor read FCr9cc100Color write SetCr9cc100Color;
    property Cr9cc125Color: TColor read FCr9cc125Color write SetCr9cc125Color;
    property Cr9cc150Color: TColor read FCr9cc150Color write SetCr9cc150Color;
    property Cr15cc0Color: TColor read FCr15cc0Color write SetCr15cc0Color;
    property Cr15cc25Color: TColor read FCr15cc25Color write SetCr15cc25Color;
    property Cr15cc50Color: TColor read FCr15cc50Color write SetCr15cc50Color;
    property Cr15cc75Color: TColor read FCr15cc75Color write SetCr15cc75Color;
    property Cr15cc100Color: TColor read FCr15cc100Color write SetCr15cc100Color;
    property Cr15cc125Color: TColor read FCr15cc125Color write SetCr15cc125Color;
    property Cr15cc150Color: TColor read FCr15cc150Color write SetCr15cc150Color;
    property Show9cc0percent: Boolean read FShow9cc0percent write SetShow9cc0percent;
    property Show9cc25percent: Boolean read FShow9cc25percent write SetShow9cc25percent;
    property Show9cc50percent: Boolean read FShow9cc50percent write SetShow9cc50percent;
    property Show9cc75percent: Boolean read FShow9cc75percent write SetShow9cc75percent;
    property Show9cc100percent: Boolean read FShow9cc100percent write SetShow9cc100percent;
    property Show9cc125percent: Boolean read FShow9cc125percent write SetShow9cc125percent;
    property Show9cc150percent: Boolean read FShow9cc150percent write SetShow9cc150percent;
    property Show15cc0Percent: Boolean read FShow15cc0Percent write SetShow15cc0Percent;
    property Show15cc25Percent: Boolean read FShow15cc25Percent write SetShow15cc25Percent;
    property Show15cc50Percent: Boolean read FShow15cc50Percent write SetShow15cc50Percent;
    property Show15cc75Percent: Boolean read FShow15cc75Percent write SetShow15cc75Percent;
    property Show15cc100Percent: Boolean read FShow15cc100Percent write SetShow15cc100Percent;
    property Show15cc125Percent: Boolean read FShow15cc125Percent write SetShow15cc125Percent;
    property Show15cc150Percent: Boolean read FShow15cc150Percent write SetShow15cc150Percent;
  end;

var
  CropSettingForm: TCropSettingForm;

implementation

{$R *.dfm}

{ TCropSettingForm }

procedure TCropSettingForm.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
  Close;
end;

procedure TCropSettingForm.ColorSwatchsClick(Sender: TObject);
begin
  case TImage32(Sender).Tag of
  0: ColorDialog.Color := WinColor(ColorSwatch9cc150.Bitmap.Pixel[1,1]);
  1: ColorDialog.Color := WinColor(ColorSwatch9cc125.Bitmap.Pixel[1,1]);
  2: ColorDialog.Color := WinColor(ColorSwatch9cc100.Bitmap.Pixel[1,1]);
  3: ColorDialog.Color := WinColor(ColorSwatch9cc75.Bitmap.Pixel[1,1]);
  4: ColorDialog.Color := WinColor(ColorSwatch9cc50.Bitmap.Pixel[1,1]);
  5: ColorDialog.Color := WinColor(ColorSwatch9cc25.Bitmap.Pixel[1,1]);
  6: ColorDialog.Color := WinColor(ColorSwatch9cc0.Bitmap.Pixel[1,1]);
  7: ColorDialog.Color := WinColor(ColorSwatch15cc150.Bitmap.Pixel[1,1]);
  8: ColorDialog.Color := WinColor(ColorSwatch15cc125.Bitmap.Pixel[1,1]);
  9: ColorDialog.Color := WinColor(ColorSwatch15cc100.Bitmap.Pixel[1,1]);
  10: ColorDialog.Color := WinColor(ColorSwatch15cc75.Bitmap.Pixel[1,1]);
  11: ColorDialog.Color := WinColor(ColorSwatch15cc50.Bitmap.Pixel[1,1]);
  12: ColorDialog.Color := WinColor(ColorSwatch15cc25.Bitmap.Pixel[1,1]);
  13: ColorDialog.Color := WinColor(ColorSwatch15cc0.Bitmap.Pixel[1,1]);
  end;
  if ColorDialog.Execute then
  begin
    case TImage32(Sender).Tag of
    0:
      begin
        ColorSwatch9cc150.Color := Color32(ColorDialog.Color);
        FCr9cc150Color := Color32(ColorDialog.Color);
      end;
    1:
      begin
        ColorSwatch9cc125.Color := Color32(ColorDialog.Color);
        FCr9cc125Color := Color32(ColorDialog.Color);
      end;
    2:
      begin
        ColorSwatch9cc100.Color := Color32(ColorDialog.Color);
        FCr9cc100Color := Color32(ColorDialog.Color);
      end;
    3:
      begin
        ColorSwatch9cc75.Color := Color32(ColorDialog.Color);
        FCr9cc75Color := Color32(ColorDialog.Color);
      end;
    4:
      begin
        ColorSwatch9cc50.Color := Color32(ColorDialog.Color);
        FCr9cc50Color := Color32(ColorDialog.Color);
      end;
    5:
      begin
        ColorSwatch9cc25.Color := Color32(ColorDialog.Color);
        FCr9cc25Color := Color32(ColorDialog.Color);
      end;
    6:
      begin
        ColorSwatch9cc0.Color := Color32(ColorDialog.Color);
        FCr9cc0Color := Color32(ColorDialog.Color);
      end;
    7:
      begin
        ColorSwatch15cc150.Color := Color32(ColorDialog.Color);
        FCr15cc150Color := Color32(ColorDialog.Color);
      end;
    8:
      begin
        ColorSwatch15cc125.Color := Color32(ColorDialog.Color);
        FCr15cc125Color := Color32(ColorDialog.Color);
      end;
    9:
      begin
        ColorSwatch15cc100.Color := Color32(ColorDialog.Color);
        FCr15cc100Color := Color32(ColorDialog.Color);
      end;
    10:
      begin
        ColorSwatch15cc75.Color := Color32(ColorDialog.Color);
        FCr15cc75Color := Color32(ColorDialog.Color);
      end;
    11:
      begin
        ColorSwatch15cc50.Color := Color32(ColorDialog.Color);
        FCr15cc50Color := Color32(ColorDialog.Color);
      end;
    12:
      begin
        ColorSwatch15cc25.Color := Color32(ColorDialog.Color);
        FCr15cc25Color := Color32(ColorDialog.Color);
      end;
    13:
      begin
        ColorSwatch15cc0.Color := Color32(ColorDialog.Color);
        FCr15cc0Color := Color32(ColorDialog.Color);
      end;
    end;
    with TImage32(Sender).Bitmap do
      FillRect(0,0,Width,Height,Color32(ColorDialog.Color))
  end;
end;

procedure TCropSettingForm.CropShowCheckBoxClick(Sender: TObject);
begin
  case TCheckBox(Sender).Tag of
  0: FShow9cc150percent := CheckBox9333_150.Checked;
  1: FShow9cc125percent := CheckBox9333_125.Checked;
  2: FShow9cc100percent := CheckBox9333_100.Checked;
  3: FShow9cc75percent := CheckBox9333_75.Checked;
  4: FShow9cc50percent := CheckBox9333_50.Checked;
  5: FShow9cc25percent := CheckBox9333_25.Checked;
  6: FShow9cc0percent := CheckBox9333_0.Checked;

  7: FShow15cc150Percent := CheckBox15111_150.Checked;
  8: FShow15cc125percent := CheckBox15111_125.Checked;
  9: FShow15cc100percent := CheckBox15111_100.Checked;
  10: FShow15cc75percent := CheckBox15111_75.Checked;
  11: FShow15cc50percent := CheckBox15111_50.Checked;
  12: FShow15cc25percent := CheckBox15111_25.Checked;
  13: FShow15cc0percent := CheckBox15111_0.Checked;
  end;
end;

procedure TCropSettingForm.FormCreate(Sender: TObject);
begin
  ColorSwatch15cc150.Bitmap.SetSize(ColorSwatch15cc150.Width,ColorSwatch15cc150.Height);
  ColorSwatch15cc125.Bitmap.SetSize(ColorSwatch15cc125.Width,ColorSwatch15cc125.Height);
  ColorSwatch15cc100.Bitmap.SetSize(ColorSwatch15cc100.Width,ColorSwatch15cc100.Height);
  ColorSwatch15cc75.Bitmap.SetSize(ColorSwatch15cc75.Width,ColorSwatch15cc75.Height);
  ColorSwatch15cc50.Bitmap.SetSize(ColorSwatch15cc50.Width,ColorSwatch15cc50.Height);
  ColorSwatch15cc25.Bitmap.SetSize(ColorSwatch15cc25.Width,ColorSwatch15cc25.Height);
  ColorSwatch15cc0.Bitmap.SetSize(ColorSwatch15cc0.Width,ColorSwatch15cc0.Height);


  ColorSwatch9cc150.Bitmap.SetSize(ColorSwatch9cc150.Width,ColorSwatch9cc150.Height);
  ColorSwatch9cc125.Bitmap.SetSize(ColorSwatch9cc125.Width,ColorSwatch9cc125.Height);
  ColorSwatch9cc100.Bitmap.SetSize(ColorSwatch9cc100.Width,ColorSwatch9cc100.Height);
  ColorSwatch9cc75.Bitmap.SetSize(ColorSwatch9cc75.Width,ColorSwatch9cc75.Height);
  ColorSwatch9cc50.Bitmap.SetSize(ColorSwatch9cc50.Width,ColorSwatch9cc50.Height);
  ColorSwatch9cc25.Bitmap.SetSize(ColorSwatch9cc25.Width,ColorSwatch9cc25.Height);
  ColorSwatch9cc0.Bitmap.SetSize(ColorSwatch9cc0.Width,ColorSwatch9cc0.Height);
end;

procedure TCropSettingForm.SetCr15cc0Color(const Value: TColor);
begin
  FCr15cc0Color := Value;
  with ColorSwatch15cc0.Bitmap do
    FillRect(0,0,Width,Height,FCr15cc0Color);
end;

procedure TCropSettingForm.SetCr15cc100Color(const Value: TColor);
begin
  FCr15cc100Color := Value;
  with ColorSwatch15cc100.Bitmap do
    FillRect(0,0,Width,Height,FCr15cc100Color);
end;

procedure TCropSettingForm.SetCr15cc125Color(const Value: TColor);
begin
  FCr15cc125Color := Value;
  with ColorSwatch15cc125.Bitmap do
    FillRect(0,0,Width,Height,FCr15cc125Color);
end;

procedure TCropSettingForm.SetCr15cc150Color(const Value: TColor);
begin
  FCr15cc150Color := Value;
  with ColorSwatch15cc150.Bitmap do
    FillRect(0,0,Width,Height,FCr15cc150Color);
end;

procedure TCropSettingForm.SetCr15cc25Color(const Value: TColor);
begin
  FCr15cc25Color := Value;
  with ColorSwatch15cc25.Bitmap do
    FillRect(0,0,Width,Height,FCr15cc25Color);
end;

procedure TCropSettingForm.SetCr15cc50Color(const Value: TColor);
begin
  FCr15cc50Color := Value;
  with ColorSwatch15cc50.Bitmap do
    FillRect(0,0,Width,Height,FCr15cc50Color);
end;

procedure TCropSettingForm.SetCr15cc75Color(const Value: TColor);
begin
  FCr15cc75Color := Value;
  with ColorSwatch15cc75.Bitmap do
    FillRect(0,0,Width,Height,FCr15cc75Color);
end;

procedure TCropSettingForm.SetCr9cc0Color(const Value: TColor);
begin
  FCr9cc0Color := Value;
  with ColorSwatch9cc0.Bitmap do
    FillRect(0,0,Width,Height,FCr9cc0Color);
end;

procedure TCropSettingForm.SetCr9cc100Color(const Value: TColor);
begin
  FCr9cc100Color := Value;
  with ColorSwatch9cc100.Bitmap do
    FillRect(0,0,Width,Height,FCr9cc100Color);
end;

procedure TCropSettingForm.SetCr9cc125Color(const Value: TColor);
begin
  FCr9cc125Color := Value;
  with ColorSwatch9cc125.Bitmap do
    FillRect(0,0,Width,Height,FCr9cc125Color);
end;

procedure TCropSettingForm.SetCr9cc150Color(const Value: TColor);
begin
  FCr9cc150Color := Value;
  with ColorSwatch9cc150.Bitmap do
    FillRect(0,0,Width,Height,FCr9cc150Color);
end;

procedure TCropSettingForm.SetCr9cc25Color(const Value: TColor);
begin
  FCr9cc25Color := Value;
  with ColorSwatch9cc25.Bitmap do
    FillRect(0,0,Width,Height,FCr9cc25Color);
end;

procedure TCropSettingForm.SetCr9cc50Color(const Value: TColor);
begin
  FCr9cc50Color := Value;
  with ColorSwatch9cc50.Bitmap do
    FillRect(0,0,Width,Height,FCr9cc50Color);
end;

procedure TCropSettingForm.SetCr9cc75Color(const Value: TColor);
begin
  FCr9cc75Color := Value;
  with ColorSwatch9cc75.Bitmap do
    FillRect(0,0,Width,Height,FCr9cc75Color);
end;

procedure TCropSettingForm.SetShow15cc0Percent(const Value: Boolean);
begin
  FShow15cc0Percent := Value;
  CheckBox15111_0.Checked := Value;
end;

procedure TCropSettingForm.SetShow15cc100Percent(const Value: Boolean);
begin
  FShow15cc100Percent := Value;
  CheckBox15111_100.Checked := Value;
end;

procedure TCropSettingForm.SetShow15cc125Percent(const Value: Boolean);
begin
  FShow15cc125Percent := Value;
  CheckBox15111_125.Checked := Value;
end;

procedure TCropSettingForm.SetShow15cc150Percent(const Value: Boolean);
begin
  FShow15cc150Percent := Value;
  CheckBox15111_150.Checked := Value;
end;

procedure TCropSettingForm.SetShow15cc25Percent(const Value: Boolean);
begin
  FShow15cc25Percent := Value;
  CheckBox15111_25.Checked := Value;
end;

procedure TCropSettingForm.SetShow15cc50Percent(const Value: Boolean);
begin
  FShow15cc50Percent := Value;
  CheckBox15111_50.Checked := Value;
end;

procedure TCropSettingForm.SetShow15cc75Percent(const Value: Boolean);
begin
  FShow15cc75Percent := Value;
  CheckBox15111_75.Checked := Value;
end;

procedure TCropSettingForm.SetShow9cc0percent(const Value: Boolean);
begin
  FShow9cc0percent := Value;
  CheckBox9333_0.Checked := Value;
end;

procedure TCropSettingForm.SetShow9cc100percent(const Value: Boolean);
begin
  FShow9cc100percent := Value;
  CheckBox9333_100.Checked := Value;
end;

procedure TCropSettingForm.SetShow9cc125percent(const Value: Boolean);
begin
  FShow9cc125percent := Value;
  CheckBox9333_125.Checked := Value;
end;

procedure TCropSettingForm.SetShow9cc150percent(const Value: Boolean);
begin
  FShow9cc150percent := Value;
  CheckBox9333_150.Checked := Value;
end;

procedure TCropSettingForm.SetShow9cc25percent(const Value: Boolean);
begin
  FShow9cc25percent := Value;
  CheckBox9333_25.Checked := Value;
end;

procedure TCropSettingForm.SetShow9cc50percent(const Value: Boolean);
begin
  FShow9cc50percent := Value;
  CheckBox9333_50.Checked := Value;
end;

procedure TCropSettingForm.SetShow9cc75percent(const Value: Boolean);
begin
  FShow9cc75percent := Value;
  CheckBox9333_75.Checked := Value;
end;

end.
