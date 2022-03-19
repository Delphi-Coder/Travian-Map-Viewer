unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, GR32, GR32_Image, Vcl.StdCtrls, System.StrUtils,
  GR32_Layers, Vcl.ComCtrls, SimpleDownloadUnit, System.Types, Vcl.Menus, Vcl.Grids, Vcl.Buttons, DBCommon,
  System.TypInfo, System.IniFiles, System.IoUtils;

const
  SquareWidth = 8;
  SquareHeight = 8; // Square height in pixel
  AxisColor = $30BBBBFF;
  Tribes: array [0..6] of string= ('Roman','Teuton','Gaul','Nature','Natars','Egyptians','Huns');
  ScaleValues: array [0..33] of Single = (0.075 , 0.09,
                                          0.125, 0.25 , 0.375, 0.5 , 0.625,  0.75, 0.875, 1,
                                          1.125, 1.25 , 1.375, 1.5 , 1.625 , 1.75, 1.875, 2,
                                          2.125, 2.25 , 2.375, 2.5 , 2.625 , 2.75, 2.875, 3,
                                          3.125, 3.25 , 3.375, 3.5 , 3.625 , 3.75, 3.875, 4);
  DefaultPlayerSelectedColor = clWhite32;
  DefaultSelectedPlayerRectColor = clRed32;
  DefaultVillageSquareBgColor = clGray32;
  DefaultBackGroundColor = clLightSteelblue32;
  DefaultSeperatorLinesColor = clGreen32;
  DefaultFarmVillageColor = clYellow32;

type
  TVillage = class
    LocationID: Integer;
    X: Integer;
    Y: Integer;
    TID: Byte;
    VillageID: Integer;
    VillageName: string;
    PlayerID: Integer;
    PlayerName: string;
    AllianceID: Integer;
    AllianceName: string;
    Population: Integer;
    ActivePlayer: Boolean;
    PlayerSelected: Boolean;
    AllianceSelected: Boolean;
    PlayerSelectedColor: TColor32;
    AllianceSelectedColor: TColor32;
    CropInfo: Byte;  //Bit 0: Is Crop  1: (0:9cc 1:15cc) 2,3,4:(percent 0-0% 1-25% 2-50% 3:75% 4 100% 5 125% 6:150%):
    IsFarm: Boolean;
  end;
//    INSERT INTO `x_world` VALUES (64996,-286,319,3,39378,'03',2329,'Nephalem',17,'®PERSIAN',209);

//    ID: Number of the field, starts in the top left corner at the coordinate (-400|400) and ends in the bottom right corner at (400|-400).
//    X: X-Coordinate of the village.
//    Y: Y-Coordinate of the village.
//    TID: The tribe number. 1 = Roman, 2 = Teuton, 3 = Gaul, 4 = Nature and 5 = Natars
//    VID: Village number. The unique ID for the village.
//    Village: The name of the village.
//    UID: The player's unique ID, also known as User-ID.
//    Player: The player name.
//    AID: The alliance's unique ID.
//    Alliance: The alliance name.
//    Population: The village's number of inhabitants without the troops.

  TMainForm = class(TForm)
    Panel1: TPanel;
    ImgView: TImgView32;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    ServerComboBox: TComboBox;
    DownloadMapButton: TButton;
    MapsListBox: TListBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    PlayerNameLabel: TLabel;
    PopLabel: TLabel;
    TribeLabel: TLabel;
    VillageCountLabel: TLabel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    AllianceListBox: TListBox;
    Label2: TLabel;
    PlayersListBox: TListBox;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ImgViewPopupMenu: TPopupMenu;
    Addplayertofavorites: TMenuItem;
    Addalliancetofavorite: TMenuItem;
    Label10: TLabel;
    AllianceNameLabel: TLabel;
    ActivePlayerStringGrid: TStringGrid;
    ColorDialog: TColorDialog;
    RemoveAllianceButton: TBitBtn;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    AddAllianceButton: TBitBtn;
    ChangeAllianceColorButton: TBitBtn;
    RemovePlayerButton: TBitBtn;
    AddPlayerButton: TBitBtn;
    ChangePlayerColorButton: TBitBtn;
    GroupBox5: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    ColorDialog1: TColorDialog;
    ShowNatarsCheckBox: TCheckBox;
    TotalPlayerLabel: TLabel;
    TotalVillageLabel: TLabel;
    ColorSwatch1: TImage32;
    ColorSwatch2: TImage32;
    ColorSwatch3: TImage32;
    ColorSwatch4: TImage32;
    ColorSwatch5: TImage32;
    Label19: TLabel;
    ColorSwatch6: TImage32;
    ShowCropsCheckBox: TCheckBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImgViewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure ImgViewMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ImgViewClick(Sender: TObject);
    procedure ImgViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure ImgViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure ImgViewMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure DownloadMapButtonClick(Sender: TObject);
    procedure AddplayertofavoritesClick(Sender: TObject);
    procedure AllianceListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure AddalliancetofavoriteClick(Sender: TObject);
    procedure PlayersListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure RemoveAllianceButtonClick(Sender: TObject);
    procedure ChangeAllianceColorButtonClick(Sender: TObject);
    procedure RemovePlayerButtonClick(Sender: TObject);
    procedure ChangePlayerColorButtonClick(Sender: TObject);
    procedure AddAllianceButtonClick(Sender: TObject);
    procedure AddPlayerButtonClick(Sender: TObject);
    procedure ShowNatarsCheckBoxClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MapsListBoxDblClick(Sender: TObject);
    procedure ColorSwatchsClick(Sender: TObject);
    procedure AllianceListBoxClick(Sender: TObject);
    procedure Splitter2CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure AllianceListBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PlayersListBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ShowCropsCheckBoxClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function GetPlayerCount: Integer;
    procedure LoadMap(MapFile: string);
    procedure OnDownloadProgressChange(Sender: TObject);
    procedure OnDownloadFinish(Sender: TObject);
    function CanShowThisCrop(Village: TVillage): Boolean;
    procedure DrawMap2;
    procedure SelectVillage(Village: TVillage);
    procedure UnSelectVillage(Village: TVillage);
    function GetVillage(X: Integer; Y: Integer): TVillage;
    procedure DrawSq(Village: TVillage);
    procedure OnWMContextMenu(var msg: TMessage); message WM_CONTEXTMENU;
    procedure SelectPlayer(PlayerName: string; PlayerColor: TColor);
    procedure SelectAlliance(AllianceName: string; AllianceColor: TColor);
    function GetAllianceName: string;
    function GetPlayerName: string;
    function VillageFromSqlStr(SqlStr: string): TVillage;
    procedure SaveSettings;
    procedure LoadSettings;
    procedure ApplySelectedVillages;
    procedure LoadFarmList;
    procedure LoadCropList;
    procedure KeepLastMousePos;
  public
    { Public declarations }
    FShowCrops: Boolean;
    FFarmList: TStringList;
    FPopupVillage: TVillage;
    FPopupActive: Boolean;
    FDraged: Boolean;
    Download: TDownloadProgress;
    MapSquareList: TStringList;
    FCropList: TStringList;
    LastMousePos: TPoint;
    LastMouseMovePos: TPoint;
    LastMouseBitmapPos: TPoint;
    LastMouseDownPos: TPoint;
    MouseDownFlag: Boolean;
    FSelectedVillage: TVillage;
    ShowNatars: Boolean;
    MapFileName: string;
    MapFiles: TStringDynArray;
    ScaleIndex: Integer;
    FBackgroundColor: TColor32;
    FVillageSquareBgColor: TColor32;
    FSeperatorLinesColor: TColor32;
    FSelectedPlayerRectColor: TColor32;
    FPlayerSelectedColor: TColor32;
    FFarmVillageColor: TColor32;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses DownloadFormUnit, InputNameUnit, CropSettingUnit;

function TMainForm.GetPlayerCount: Integer;
var
  i: Integer;
  PlayerList: TList;
begin
  PlayerList := TList.Create;
  for i := 0 to MapSquareList.Count - 1 do
    if PlayerList.IndexOf(Pointer(TVillage(MapSquareList.Objects[i]).PlayerID))=-1 then
    begin
      PlayerList.Add(Pointer(TVillage(MapSquareList.Objects[i]).PlayerID));
    end;
  Result := PlayerList.Count;
  PlayerList.Free;
end;

function TMainForm.GetPlayerName: string;
begin
  InputForm.Label1.Caption := 'Enter player name:';
  InputForm.NameEdit.Text := '';
  if InputForm.ShowModal=mrOk then
    Result := InputForm.NameEdit.Text
  else
    Result := '';
end;

function TMainForm.GetAllianceName: string;
begin
  InputForm.Label1.Caption := 'Enter Alliance name:';
  InputForm.NameEdit.Text := '';
  if InputForm.ShowModal=mrOk then
    Result := InputForm.NameEdit.Text
  else
    Result := '';
end;


procedure TMainForm.AddAllianceButtonClick(Sender: TObject);
var
  AllianceName: string;
begin
  AllianceName := GetAllianceName;
  if AllianceName<>'' then
    if ColorDialog.Execute then
    begin
      AllianceListBox.AddItem(AllianceName,TObject(ColorDialog.Color));
      SelectAlliance(AllianceName,ColorDialog.Color);
      DrawMap2;
    end;
end;

procedure TMainForm.AddalliancetofavoriteClick(Sender: TObject);
begin
  if ColorDialog.Execute(Handle) then
  begin
    //AllianceListBox.AddItem(FPopupVillage.AllianceName,TObject(ColorDialog.Color));
    AllianceListBox.Items.AddObject(FPopupVillage.AllianceName,TObject(ColorDialog.Color));
    SelectAlliance(FPopupVillage.AllianceName,ColorDialog.Color);
    DrawMap2;
  end;
end;

procedure TMainForm.AddPlayerButtonClick(Sender: TObject);
var
  PlayerName: string;
begin
  PlayerName := GetPlayerName;
  if PlayerName<>'' then
    if ColorDialog.Execute then
    begin
      PlayersListBox.AddItem(PlayerName,TObject(ColorDialog.Color));
      SelectPlayer(PlayerName,ColorDialog.Color);
      DrawMap2;
    end;
end;

procedure TMainForm.AddplayertofavoritesClick(Sender: TObject);
begin
  if ColorDialog.Execute(Handle) then
  begin
    PlayersListBox.AddItem(FPopupVillage.PlayerName,TObject(ColorDialog.Color));
    SelectPlayer(FPopupVillage.PlayerName,ColorDialog.Color);
    DrawMap2;
  end;
end;

procedure TMainForm.SelectPlayer(PlayerName: string; PlayerColor: TColor);
var
  i: Integer;
begin
  for i := 0 to MapSquareList.Count-1 do
    if TVillage(MapSquareList.Objects[i]).PlayerName = PlayerName then
    begin
      TVillage(MapSquareList.Objects[i]).PlayerSelected := True;
      TVillage(MapSquareList.Objects[i]).PlayerSelectedColor := Color32(PlayerColor);
    end;
end;

procedure TMainForm.SelectAlliance(AllianceName: string; AllianceColor: TColor);
var
  i: Integer;
begin
  for i := 0 to MapSquareList.Count-1 do
    if TVillage(MapSquareList.Objects[i]).AllianceName = AllianceName then
    begin
      TVillage(MapSquareList.Objects[i]).AllianceSelected := True;
      TVillage(MapSquareList.Objects[i]).AllianceSelectedColor := Color32(AllianceColor);
    end;
end;

procedure TMainForm.AllianceListBoxClick(Sender: TObject);
begin
//  Caption := IntToStr(AllianceListBox.ItemIndex)
end;

procedure TMainForm.AllianceListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  OldColor: TColor;
begin
  OldColor := AllianceListBox.Canvas.Font.Color;
  AllianceListBox.Canvas.Font.Color := TColor(AllianceListBox.Items.Objects[Index]);
  //---------------------------------------
//  if odSelected in State then
//      Brush.Color := $00FFD2A6;

  AllianceListBox.Canvas.FillRect(Rect);
  //---------------------------------------
  AllianceListBox.Canvas.TextOut(Rect.Left,Rect.Top,AllianceListBox.Items[Index]);
  AllianceListBox.Canvas.Font.Color := OldColor;
  if odFocused in State then
    AllianceListBox.Canvas.DrawFocusRect(Rect);
end;

procedure TMainForm.AllianceListBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Pt : TPoint;
  i : integer;
begin
  Pt.x := x;
  Pt.y := y;
  if AllianceListBox.ItemAtPos(Pt, true) = -1 then
    for i := 0 to AllianceListBox.Items.count - 1 do
      AllianceListBox.selected[i] := false;
end;

procedure TMainForm.ApplySelectedVillages;
var
  i: Integer;
begin
  for I := 0 to AllianceListBox.Count - 1 do
    SelectAlliance(AllianceListBox.Items[i],Integer(AllianceListBox.Items.Objects[i]));
  for I := 0 to PlayersListBox.Count - 1 do
    SelectPlayer(PlayersListBox.Items[i],Integer(PlayersListBox.Items.Objects[i]));
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  CropSettingForm.ShowModal;
  DrawMap2;
end;

procedure TMainForm.DownloadMapButtonClick(Sender: TObject);
var
  FName: string;
begin
  if ServerComboBox.Text = '' then
  begin
    ShowMessage('Please select server first.');
    //ServerComboBox.d
    Exit;
  end;
  DownloadForm.Show;
  FName := FormatDateTime('yyyy-mm-dd__h-m-s',Now);
  //ForceDirectories(ExtractFilePath(Application.ExeName))
  ForceDirectories(ExtractFilePath(Application.ExeName)+'maps');
  MapFileName := 'map' + FName + '.sql';
  FName := ExtractFilePath(Application.ExeName)+'maps\'+MapFileName;
  try
    Download.DownloadFile(ServerComboBox.Text+'/map.sql',FName);
  except
    on e: exception do
    begin
      ShowMessage(e.Message);
      DownloadForm.Close;
      Exit;
    end;
  end;
  DownloadForm.Close;
  MapsListBox.Items.Add(ExtractFileName(MapFileName));
  MapsListBox.ItemIndex := MapsListBox.Count - 1;
  SetLength(MapFiles,Length(MapFiles)+1);
  MapFiles[Length(MapFiles)-1] := FName;

  while MapSquareList.Count>0 do
  begin
    //TVillage(MapSquareList.Objects[0]).Free;
    MapSquareList.Delete(0);
  end;

  LoadMap(FName);
  LoadCropList;
  ApplySelectedVillages;
  ScaleIndex := 9;   //scale = 1
  DrawMap2;
end;

procedure TMainForm.DrawMap2;
var
  i: Integer;
  Village: TVillage;
  FillColor: TColor32;
begin
  ImgView.Bitmap.Clear;
  ImgView.Bitmap.FillRect(0,0,ImgView.Bitmap.Width,ImgView.Bitmap.Height,FBackGroundColor);
  for i := 0 to MapSquareList.Count-1 do
  begin
    Village := TVillage(MapSquareList.Objects[i]);
    if (Village.X = 112) and (Village.Y= -77) then
      Village.Population := Village.Population +1;

    if ((Village.CropInfo and 1) = 1) and (not CanShowThisCrop(Village) {ShowCropsCheckBox.Checked}) and (Village.PlayerName='') then
      Continue;
    if (Village.TID = 5) and (not ShowNatars) then
      Continue;
    FillColor := FVillageSquareBgColor;
    if Village.ActivePlayer then
      FillColor := FPlayerSelectedColor
    else
    if Village.IsFarm then
      FillColor := FFarmVillageColor
    else
    if Village.PlayerSelected then
      FillColor := Village.PlayerSelectedColor
    else
    if Village.AllianceSelected then
      FillColor := Village.AllianceSelectedColor
    else
    if ((Village.CropInfo and 1) = 1) and ShowCropsCheckBox.Checked then
    begin
      if (Village.CropInfo and 2) = 2 then // Is 15cc
      begin
        case (Village.CropInfo shr 2) of
        0: if CropSettingForm.Show15cc0Percent then FillColor := CropSettingForm.Cr15cc0Color ;
        1: if CropSettingForm.Show15cc25Percent then FillColor := CropSettingForm.Cr15cc25Color ;
        2: if CropSettingForm.Show15cc50Percent then FillColor := CropSettingForm.Cr15cc50Color ;
        3: if CropSettingForm.Show15cc75Percent then FillColor := CropSettingForm.Cr15cc75Color ;
        4: if CropSettingForm.Show15cc100Percent then FillColor := CropSettingForm.Cr15cc100Color ;
        5: if CropSettingForm.Show15cc125Percent then FillColor := CropSettingForm.Cr15cc125Color ;
        6: if CropSettingForm.Show15cc150Percent then FillColor := CropSettingForm.Cr15cc150Color ;
        end;
      end
      else
      begin  // It's 9cc Crop
        case (Village.CropInfo shr 2) of
        0: if CropSettingForm.Show9cc0Percent then FillColor := CropSettingForm.Cr9cc0Color ;
        1: if CropSettingForm.Show9cc25Percent then FillColor := CropSettingForm.Cr9cc25Color ;
        2: if CropSettingForm.Show9cc50Percent then FillColor := CropSettingForm.Cr9cc50Color ;
        3: if CropSettingForm.Show9cc75Percent then FillColor := CropSettingForm.Cr9cc75Color ;
        4: if CropSettingForm.Show9cc100Percent then FillColor := CropSettingForm.Cr9cc100Color ;
        5: if CropSettingForm.Show9cc125Percent then FillColor := CropSettingForm.Cr9cc125Color ;
        6: if CropSettingForm.Show9cc150Percent then FillColor := CropSettingForm.Cr9cc150Color ;
        end;
      end;
    end;


    ImgView.Bitmap.FillRect((Village.X+400)*SquareWidth,(400-Village.Y)*SquareWidth,(Village.X+400+1)*SquareWidth,(400-Village.Y+1)*SquareWidth,FillColor);

    if (ImgView.Scale>=1) and Village.ActivePlayer then
      ImgView.Bitmap.FrameRectS((Village.X+400)*SquareWidth+1,(400-Village.Y)*SquareWidth+1,(Village.X+400+1)*SquareWidth,(400-Village.Y+1)*SquareWidth,FSelectedPlayerRectColor);
  end;

  if ImgView.Scale>=0.75 then
  begin
    for i := 0 to 800 do      //verticals
    begin
      ImgView.Bitmap.Line(i*SquareWidth,0,i*SquareWidth,800*SquareHeight,FSeperatorLinesColor);
    end;
    for i := 0 to 800 do     //horizontals
    begin
      ImgView.Bitmap.Line(0, i*SquareHeight,800*SquareWidth,i*SquareHeight,FSeperatorLinesColor);
    end;
  end;
  for i := -4 to 4 do
  begin
    ImgView.Bitmap.LineA(0, ImgView.Bitmap.Height div 2+i,ImgView.Bitmap.Width ,ImgView.Bitmap.Height div 2+i,AxisColor);
    ImgView.Bitmap.LineA(ImgView.Bitmap.Width div 2+i, 0,ImgView.Bitmap.Width div 2+i ,ImgView.Bitmap.Height,AxisColor);
//    ImgView.Bitmap.LineA(ImgView.Bitmap.Width div 2+i, 0,ImgView.Bitmap.Width div 2+i ,ImgView.Bitmap.Height,$50FFAAAA);
  end;
//  if FSelectedVillage<>nil then
//    DrawSelectedSq(FSelectedVillage);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure TMainForm.SaveSettings;
var
  i: Integer;
  IniFile: TMemIniFile;
begin
  IniFile := TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'MapViewer.ini',TEncoding.UTF8);
  IniFile.WriteString('General','Active Map',MapFileName);
  IniFile.WriteString('General','Background Color','$'+Format('%x',[FBackgroundColor]));
  IniFile.WriteString('General','Village Square Background Color','$'+Format('%x',[FVillageSquareBgColor]));
  IniFile.WriteString('General','Seperator Lines Color','$'+Format('%x',[FSeperatorLinesColor]));
  IniFile.WriteString('General','Selected Player Border Color','$'+Format('%x',[FSelectedPlayerRectColor]));
  IniFile.WriteString('General','Selected Player Background Color','$'+Format('%x',[FPlayerSelectedColor]));
  IniFile.WriteString('General','Farm Village Background Color','$'+Format('%x',[FFarmVillageColor]));

  IniFile.WriteBool('ShwCrpSetting','Show Crops',ShowCropsCheckBox.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 15-1-1-1 150',CropSettingForm.CheckBox15111_150.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 15-1-1-1 125',CropSettingForm.CheckBox15111_125.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 15-1-1-1 100',CropSettingForm.CheckBox15111_100.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 15-1-1-1 75',CropSettingForm.CheckBox15111_75.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 15-1-1-1 50',CropSettingForm.CheckBox15111_50.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 15-1-1-1 25',CropSettingForm.CheckBox15111_25.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 15-1-1-1 0',CropSettingForm.CheckBox15111_0.Checked);

  IniFile.WriteBool('ShwCrpSetting','Show 9-3-3-3 150',CropSettingForm.CheckBox9333_150.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 9-3-3-3 125',CropSettingForm.CheckBox9333_125.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 9-3-3-3 100',CropSettingForm.CheckBox9333_100.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 9-3-3-3 75',CropSettingForm.CheckBox9333_75.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 9-3-3-3 50',CropSettingForm.CheckBox9333_50.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 9-3-3-3 25',CropSettingForm.CheckBox9333_25.Checked);
  IniFile.WriteBool('ShwCrpSetting','Show 9-3-3-3 0',CropSettingForm.CheckBox9333_0.Checked);

  IniFile.WriteString('ShwCrpSetting','Crop 15-1-1-1 150 Color','$'+Format('%x',[CropSettingForm.Cr15cc150Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 15-1-1-1 125 Color','$'+Format('%x',[CropSettingForm.Cr15cc125Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 15-1-1-1 100 Color','$'+Format('%x',[CropSettingForm.Cr15cc100Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 15-1-1-1 75  Color','$'+Format('%x',[CropSettingForm.Cr15cc75Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 15-1-1-1 50  Color','$'+Format('%x',[CropSettingForm.Cr15cc50Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 15-1-1-1 25  Color','$'+Format('%x',[CropSettingForm.Cr15cc25Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 15-1-1-1 0   Color','$'+Format('%x',[CropSettingForm.Cr15cc0Color]));

  IniFile.WriteString('ShwCrpSetting','Crop 9-3-3-3 150 Color','$'+Format('%x',[CropSettingForm.Cr9cc150Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 9-3-3-3 125 Color','$'+Format('%x',[CropSettingForm.Cr9cc125Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 9-3-3-3 100 Color','$'+Format('%x',[CropSettingForm.Cr9cc100Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 9-3-3-3 75  Color','$'+Format('%x',[CropSettingForm.Cr9cc75Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 9-3-3-3 50  Color','$'+Format('%x',[CropSettingForm.Cr9cc50Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 9-3-3-3 25  Color','$'+Format('%x',[CropSettingForm.Cr9cc25Color]));
  IniFile.WriteString('ShwCrpSetting','Crop 9-3-3-3 0   Color','$'+Format('%x',[CropSettingForm.Cr9cc0Color]));

  IniFile.EraseSection('Aliances');
  for I := 0 to AllianceListBox.Items.Count - 1 do
    IniFile.WriteInteger('Aliances',AllianceListBox.Items[i],Integer(AllianceListBox.Items.Objects[i]));
  IniFile.EraseSection('Players');
  for I := 0 to PlayersListBox.Items.Count - 1 do
    IniFile.WriteInteger('Players',PlayersListBox.Items[i],Integer(PlayersListBox.Items.Objects[i]));
  IniFile.UpdateFile;
  IniFile.Free;
  FFarmList.SaveToFile(ExtractFilePath(Application.ExeName)+'FarmList.dat');
end;

procedure TMainForm.LoadSettings;
var
  i: Integer;
  IniFile: TMemIniFile;
  AllianceList: TStringList;
  PlayerList: TStringList;
  ColorStr: string;
  ServerList: string;
begin
  IniFile := TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'MapViewer.ini',TEncoding.UTF8);
  MapFileName := IniFile.ReadString('General','Active Map','');
  ColorStr := IniFile.ReadString('General','Background Color','');
  FBackgroundColor := StrToUIntDef(ColorStr,DefaultBackGroundColor);

  ColorStr := IniFile.ReadString('General','Village Square Background Color','');
  FVillageSquareBgColor := StrToUIntDef(ColorStr,DefaultVillageSquareBgColor);

  ServerList := IniFile.ReadString('General','Server List','https://ts4.travian.com,https://ts5.travian.com,https://ts6.travian.com,https://ts7.travian.com,https://ts8.travian.com,https://tx3.travian.com');
  ServerComboBox.Items.CommaText := ServerList;

  ColorStr := IniFile.ReadString('General','Seperator Lines Color','');
  FSeperatorLinesColor := StrToUIntDef(ColorStr,DefaultSeperatorLinesColor);

  ColorStr := IniFile.ReadString('General','Selected Player Border Color','');
  FSelectedPlayerRectColor := StrToUIntDef(ColorStr,DefaultSelectedPlayerRectColor);

  ColorStr := IniFile.ReadString('General','Selected Player Background Color','');
  FPlayerSelectedColor := StrToUIntDef(ColorStr,DefaultPlayerSelectedColor);

  ColorStr := IniFile.ReadString('General','Farm Village Background Color','');
  FFarmVillageColor := StrToUIntDef(ColorStr,DefaultFarmVillageColor);

  ShowCropsCheckBox.Checked := IniFile.ReadBool('ShwCrpSetting','Show Crops',False);
  CropSettingForm.Show15cc150Percent := IniFile.ReadBool('ShwCrpSetting','Show 15-1-1-1 150',False);
  CropSettingForm.Show15cc125Percent := IniFile.ReadBool('ShwCrpSetting','Show 15-1-1-1 125',False);
  CropSettingForm.Show15cc100Percent := IniFile.ReadBool('ShwCrpSetting','Show 15-1-1-1 100',False);
  CropSettingForm.Show15cc75Percent  := IniFile.ReadBool('ShwCrpSetting','Show 15-1-1-1 75',False);
  CropSettingForm.Show15cc50Percent  := IniFile.ReadBool('ShwCrpSetting','Show 15-1-1-1 50',False);
  CropSettingForm.Show15cc25Percent  := IniFile.ReadBool('ShwCrpSetting','Show 15-1-1-1 25',False);
  CropSettingForm.Show15cc0Percent   := IniFile.ReadBool('ShwCrpSetting','Show 15-1-1-1 0',False);

  CropSettingForm.Show9cc150percent := IniFile.ReadBool('ShwCrpSetting','Show 9-3-3-3 150',False);
  CropSettingForm.Show9cc125percent := IniFile.ReadBool('ShwCrpSetting','Show 9-3-3-3 125',False);
  CropSettingForm.Show9cc100percent := IniFile.ReadBool('ShwCrpSetting','Show 9-3-3-3 100',False);
  CropSettingForm.Show9cc75percent  := IniFile.ReadBool('ShwCrpSetting','Show 9-3-3-3 75',False);
  CropSettingForm.Show9cc50percent  := IniFile.ReadBool('ShwCrpSetting','Show 9-3-3-3 50',False);
  CropSettingForm.Show9cc25percent  := IniFile.ReadBool('ShwCrpSetting','Show 9-3-3-3 25',False);
  CropSettingForm.Show9cc0percent   := IniFile.ReadBool('ShwCrpSetting','Show 9-3-3-3 0',False);

  CropSettingForm.Cr15cc150Color := IniFile.ReadInteger('ShwCrpSetting','Crop 15-1-1-1 150 Color',0);
  CropSettingForm.Cr15cc125Color := IniFile.ReadInteger('ShwCrpSetting','Crop 15-1-1-1 125 Color',0);
  CropSettingForm.Cr15cc100Color := IniFile.ReadInteger('ShwCrpSetting','Crop 15-1-1-1 100 Color',0);
  CropSettingForm.Cr15cc75Color  := IniFile.ReadInteger('ShwCrpSetting','Crop 15-1-1-1 75  Color',0);
  CropSettingForm.Cr15cc50Color  := IniFile.ReadInteger('ShwCrpSetting','Crop 15-1-1-1 50  Color',0);
  CropSettingForm.Cr15cc25Color  := IniFile.ReadInteger('ShwCrpSetting','Crop 15-1-1-1 25  Color',0);
  CropSettingForm.Cr15cc0Color   := IniFile.ReadInteger('ShwCrpSetting','Crop 15-1-1-1 0   Color',0);

  CropSettingForm.Cr9cc150Color := IniFile.ReadInteger('ShwCrpSetting','Crop 9-3-3-3 150 Color',0);
  CropSettingForm.Cr9cc125Color := IniFile.ReadInteger('ShwCrpSetting','Crop 9-3-3-3 125 Color',0);
  CropSettingForm.Cr9cc100Color := IniFile.ReadInteger('ShwCrpSetting','Crop 9-3-3-3 100 Color',0);
  CropSettingForm.Cr9cc75Color  := IniFile.ReadInteger('ShwCrpSetting','Crop 9-3-3-3 75  Color',0);
  CropSettingForm.Cr9cc50Color  := IniFile.ReadInteger('ShwCrpSetting','Crop 9-3-3-3 50  Color',0);
  CropSettingForm.Cr9cc25Color  := IniFile.ReadInteger('ShwCrpSetting','Crop 9-3-3-3 25  Color',0);
  CropSettingForm.Cr9cc0Color   := IniFile.ReadInteger('ShwCrpSetting','Crop 9-3-3-3 0   Color',0);

  AllianceList := TStringList.Create;
  IniFile.ReadSection('Aliances',AllianceList);
  for I := 0 to AllianceList.Count - 1 do
  begin
    AllianceList.Objects[i] := TObject(IniFile.ReadInteger('Aliances',AllianceList.Strings[i],0));
//    SelectAlliance(AllianceList.Strings[i],Integer(AllianceList.Objects[i]));
  end;
  PlayerList := TStringList.Create;
  IniFile.ReadSection('Players',PlayerList);
  for I := 0 to PlayerList.Count - 1 do
  begin
    PlayerList.Objects[i] := TObject(IniFile.ReadInteger('Players',PlayerList.Strings[i],0));
//    SelectPlayer(PlayerList.Strings[i],Integer(PlayerList.Objects[i]));
  end;
  IniFile.Free;

  AllianceListBox.Items.Assign(AllianceList);
  PlayersListBox.Items.Assign(PlayerList);

  AllianceList.Free;
  PlayerList.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  MapSquareList := TStringList.Create;
  FCropList := TStringList.Create;
  FFarmList := TStringList.Create;
  MapSquareList.OwnsObjects := True;
  Download := TDownloadProgress.Create(Self);
  Download.OnChange := OnDownloadProgressChange;
  Download.OnFinish := OnDownloadFinish;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Download.Free;
  FFarmList.Free;
  FCropList.Free;
  MapSquareList.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  i: Integer;
  IniFile: TIniFile;
  FName: string;
begin
  ImgView.Bitmap.SetSize(801*SquareWidth,801*SquareHeight);
  ImgView.Bitmap.FillRect(0,0,ImgView.Bitmap.Width,ImgView.Bitmap.Height,clLightSteelblue32);
//  ActivePlayerStringGrid.Cells[0,0] := 'Village Name';
//  ActivePlayerStringGrid.Cells[1,0] := 'Coordinate';
//  ActivePlayerStringGrid.Cells[2,0] := 'Population';
  ActivePlayerStringGrid.ColWidths[0] := 90;
  ActivePlayerStringGrid.ColWidths[1] := 60;
  ActivePlayerStringGrid.ColWidths[2] := 30;

  LoadSettings;

  ColorSwatch1.Bitmap.SetSize(ColorSwatch1.Width,ColorSwatch1.Height);
  ColorSwatch1.Bitmap.FillRect(0,0,ColorSwatch1.Width,ColorSwatch1.Height,FBackgroundColor);

  ColorSwatch2.Bitmap.SetSize(ColorSwatch2.Width,ColorSwatch2.Height);
  ColorSwatch2.Bitmap.FillRect(0,0,ColorSwatch2.Width,ColorSwatch2.Height,FVillageSquareBgColor);

  ColorSwatch3.Bitmap.SetSize(ColorSwatch3.Width,ColorSwatch3.Height);
  ColorSwatch3.Bitmap.FillRect(0,0,ColorSwatch3.Width,ColorSwatch3.Height,FSelectedPlayerRectColor);

  ColorSwatch4.Bitmap.SetSize(ColorSwatch4.Width,ColorSwatch4.Height);
  ColorSwatch4.Bitmap.FillRect(0,0,ColorSwatch4.Width,ColorSwatch4.Height,FPlayerSelectedColor);

  ColorSwatch5.Bitmap.SetSize(ColorSwatch5.Width,ColorSwatch5.Height);
  ColorSwatch5.Bitmap.FillRect(0,0,ColorSwatch5.Width,ColorSwatch5.Height,FSeperatorLinesColor);

  ColorSwatch6.Bitmap.SetSize(ColorSwatch5.Width,ColorSwatch5.Height);
  ColorSwatch6.Bitmap.FillRect(0,0,ColorSwatch5.Width,ColorSwatch5.Height,FFarmVillageColor);

  //ColorSwatch1.Color := FBackgroundColor;
  //ColorSwatch2.Color := FVillageSquareBgColor;
  //ColorSwatch3.Color := FSelectedPlayerRectColor;
  //ColorSwatch4.Color := FPlayerSelectedColor;
  //ColorSwatch5.Color := FSeperatorLinesColor;

  ForceDirectories(ExtractFilePath(Application.ExeName)+'Maps');
  MapFiles := TDirectory.GetFiles(ExtractFilePath(Application.ExeName)+'Maps','*.sql');
  for i := 0 to Length(MapFiles)-1 do
    MapsListBox.Items.Add(ExtractFileName(MapFiles[i]));

  FName := ExtractFilePath(Application.ExeName)+'Maps\'+MapFileName;
  if FileExists(FName,False) then
    LoadMap(FName);
  LoadCropList;
  ApplySelectedVillages;

  LoadFarmList;

  ScaleIndex := 9;   //scale = 1
  DrawMap2;
end;

function TMainForm.GetVillage(X, Y: Integer): TVillage;
var
  i: Integer;
  Village: TVillage;
begin
  Result := nil;
  for i := 0 to MapSquareList.Count-1 do
  begin
    Village := TVillage(MapSquareList.Objects[i]);
    if (Village.X = X) and (Village.Y = Y) then
    begin
      Result := Village;
      break;
    end;
  end;
end;

procedure TMainForm.ImgViewClick(Sender: TObject);
var
  Village: TVillage;
begin
  if FPopupActive then
    Exit;
  if not FDraged then
  begin
    Village := GetVillage(LastMousePos.X,LastMousePos.Y);
    if (Village<>nil) and (((Village.TID = 5) and ShowNatars) or (Village.TID<>5)) and (Village.PlayerName<>'') then
    begin
      if FSelectedVillage<>nil then
      begin
        //Caption := 'X:'+ IntToStr(Village.X)+'   Y='+ IntToStr(Village.Y) + '    ' +Village.VillageName;
        UnSelectVillage(FSelectedVillage);
        //DrawUnSelectedSq(FSelectedVillage);
        FSelectedVillage := Village;
        SelectVillage(Village);
//        DrawMap2;
        //DrawSelectedSq(FSelectedVillage);
      end
      else
      begin
        //Caption := 'X:'+ IntToStr(Village.X)+'   Y='+ IntToStr(Village.Y) + '    ' +Village.VillageName;
        FSelectedVillage := Village;
        SelectVillage(Village);
//        DrawMap2;
        //DrawSelectedSq(FSelectedVillage);
      end;
      Exit;
    end;

    // Not found so clicked on empty space. unselect
    if FSelectedVillage<>nil then
    begin
      //DrawUnSelectedSq(FSelectedVillage);
      UnSelectVillage(FSelectedVillage);
      //DrawMap2;
      FSelectedVillage := nil;
    end;
  end
  else
    FDraged := False;
end;

procedure TMainForm.ImgViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if (Button=mbleft) and (not FPopupActive)then
  begin
    MouseDownFlag := True;
    LastMouseDownPos := LastMouseMovePos;
  end;
end;

procedure TMainForm.ImgViewMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer; Layer: TCustomLayer);
var
  BitmapPoint: TPoint;
  Village: TVillage;
  DeltaX,DeltaY: Integer;
begin
  LastMouseMovePos.X := X;
  LastMouseMovePos.Y := Y;
  if MouseDownFlag then
  begin
    DeltaX := LastMouseDownPos.X-X;
    DeltaY := LastMouseDownPos.Y-Y;
    if (DeltaX<>0) or (DeltaY<>0) then
    begin
      FDraged := True;
      ImgView.Scroll(DeltaX,DeltaY);
    end;
    LastMouseDownPos := LastMouseMovePos;
    Exit
  end;
  BitmapPoint := ImgView.ControlToBitmap(System.Types.Point(x,y));
  LastMouseBitmapPos := BitmapPoint;
  //Caption := Format('X=%3d,Y=%3d',[BitmapPoint.x,BitmapPoint.y]);
  X := BitmapPoint.X div SquareWidth;
  Y := BitmapPoint.Y div SquareHeight;
  X := X - 400;
  Y := 400 - Y;
  LastMousePos.X := X;
  LastMousePos.Y := Y;

  StatusBar1.Panels[0].Text := Format('X=%3d,Y=%3d',[x,y]);

  Village := GetVillage(X,Y);
  if (Village<>nil) and (((Village.TID = 5) and ShowNatars) or (Village.TID<>5)) then
  begin
//    ImgView.Hint := 'x='+IntToStr(Village.X)
//    +' ,y='+IntToStr(Village.Y)+#13+#10
//    +'Player: '+Village.PlayerName+#13+#10
//    +'Village: '+Village.VillageName+#13+#10
//    +'Alliance: ' +Village.AllianceName+#13+#10
//    +'Pop: ' +IntToStr(Village.Population)+#13+#10
//    +'Tribe: ' +Tribes[Village.TID-1];
    ImgView.Hint := '';
    if Village.PlayerName<>'' then
      ImgView.Hint := 'x='+IntToStr(Village.X)
      +' ,y='+IntToStr(Village.Y)+#13+#10
      +'Player: '+Stringreplace(Village.PlayerName,'|',#5,[rfReplaceAll])+#13+#10
      +'Village: '+Stringreplace(Village.VillageName,'|',#5,[rfReplaceAll])+#13+#10
      +'Alliance: ' +Village.AllianceName+#13+#10
      +'Pop: ' +IntToStr(Village.Population)+#13+#10
      + 'Tribe: ' +Tribes[Village.TID-1];

    if ((Village.CropInfo and 1) = 1) then
      if (Village.PlayerName<>'') or ShowCropsCheckBox.Checked  then
      begin
        if Village.PlayerName<>'' then
          ImgView.Hint := ImgView.Hint + #13 + #10;
        if (Village.CropInfo and 2) = 2 then
          ImgView.Hint := ImgView.Hint + 'Crop 15 1 1 1'+#13+#10
        else
          ImgView.Hint := ImgView.Hint + 'Crop 9 3 3 3'+#13+#10;
        case (Village.CropInfo shr 2) of
        0: ImgView.Hint := ImgView.Hint + '0 %';
        1: ImgView.Hint := ImgView.Hint + '25 %';
        2: ImgView.Hint := ImgView.Hint + '50 %';
        3: ImgView.Hint := ImgView.Hint + '75 %';
        4: ImgView.Hint := ImgView.Hint + '100 %';
        5: ImgView.Hint := ImgView.Hint + '125 %';
        6: ImgView.Hint := ImgView.Hint + '150 %';
        end;
      end;

    ImgView.ShowHint := False;
    ImgView.ShowHint := True;
    Application.ActivateHint(ImgView.ClientToScreen(LastMouseMovePos));
  end
  else
  begin
    ImgView.Hint := '';
    Application.CancelHint;
  end;
end;

procedure TMainForm.ImgViewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
var
  P: TPoint;
  Village: TVillage;
begin
  if Button=mbRight then
  begin
    Village := GetVillage(LastMousePos.X,LastMousePos.Y);
    FPopupVillage := Village;
    if Village<>nil then
    begin
      P := ClientToScreen(System.Types.Point(x,y));
      ImgViewPopupMenu.Popup(P.X,P.Y);
      FPopupActive := True;
    end
  end
  else
  begin
    MouseDownFlag := False;
    FPopupActive := False;
  end;
end;

procedure TMainForm.ImgViewMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if ScaleIndex>0 then
  begin
    ScaleIndex := ScaleIndex - 1;
    ImgView.Scale := ScaleValues[ScaleIndex];
    KeepLastMousePos;
  end;

  if ScaleIndex=6 then
  begin
    DrawMap2;
    if FSelectedVillage<>nil then
      SelectVillage(FSelectedVillage);
  end;

  //Caption := FloatToStr(ImgView.Scale);
end;

procedure TMainForm.KeepLastMousePos;
var
  Str: string;
  R: TRect;
  MPoint: TPoint;
  LastBitmapPoint: TPoint;
  CurrBitmapPoint: TPoint;
  DeltaX: Integer;
  DeltaY: Integer;
begin
  //LastBitmapPoint := LastMouseMovePos;
  //LastMouseBitmapPoint := ImgView.ControlToBitmap(LastBitmapPoint);
//  if ScaleIndex<8 then
//    Exit;

  CurrBitmapPoint := ScreenToClient(Mouse.CursorPos);
  CurrBitmappoint := ImgView.ControlToBitmap(CurrBitmapPoint);

//  DeltaX := CurrBitmapPoint.X-LastMouseBitmapPos.X;
//  DeltaY := CurrBitmapPoint.Y-LastMouseBitmapPos.Y;
  DeltaX := Round((CurrBitmapPoint.X-LastMouseBitmapPos.X)*ScaleValues[ScaleIndex]);
  DeltaY := Round((CurrBitmapPoint.Y-LastMouseBitmapPos.Y)*ScaleValues[ScaleIndex]);

  ImgView.Scroll(-DeltaX, -DeltaY);

//  Label8.Caption := IntToStr(MPoint.X)+' '+IntToStr(MPoint.Y)
end;

procedure TMainForm.ImgViewMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  Point: TPoint;
begin
  if ScaleIndex<33 then
  begin
    ScaleIndex := ScaleIndex + 1;
    ImgView.Scale := ScaleValues[ScaleIndex];
    KeepLastMousePos;
  end;

  if ScaleIndex=7 then
  begin
    DrawMap2;
    if FSelectedVillage<>nil then
      SelectVillage(FSelectedVillage);
  end;

  //Caption := FloatToStr(ImgView.Scale);
end;

{
procedure TMainForm.LoadMap;
var
  i,j: Integer;
  TmpStr: string;
  TmpStrList: TStringList;
  MapFileLines: TStringList;
  Village: TVillage;
begin
  MapFileLines := TStringList.Create;
  MapFileLines.LoadFromFile('..\..\map.sql');
  TmpStrList := TStringList.Create;
  for i := 0 to MapFileLines.Count-1 do
  begin
    TmpStr := MapFileLines.Strings[i];
    if i=5460 then
    begin
      ParseSql(TmpStr);
      Continue
    end;
    j := Pos('(',TmpStr);
    Delete(TmpStr,1,j);
    TmpStr := LeftStr(TmpStr,Length(TmpStr)-2);

    TmpStr := UTF8ToString(PAnsiChar(AnsiString(TmpStr)));//UTF8Decode(TmpStr);
    TmpStr := ReplaceStr(TmpStr,'''','');
    //TmpStr := UTF8Decode(TmpStr);
    //if i=1 then begin Caption := TmpStr; Exit end;
    TmpStrList.StrictDelimiter := True;
    TmpStrList.CommaText := TmpStr;
    Village := TVillage.Create;
    Village.LocationID := StrToInt(TmpStrList.Strings[0]);
    Village.X := StrToInt(TmpStrList.Strings[1]);
    Village.Y := StrToInt(TmpStrList.Strings[2]);
    Village.TID := StrToInt(TmpStrList.Strings[3]);
    Village.VillageID := StrToInt(TmpStrList.Strings[4]);
    Village.VillageName := TmpStrList.Strings[5];
    try
    Village.PlayerID := StrToInt(TmpStrList.Strings[6]);
    except
    end;
    Village.PlayerName := TmpStrList.Strings[7];
    Village.AllianceID := StrToInt(TmpStrList.Strings[8]);
    Village.AllianceName := TmpStrList.Strings[9];
    Village.Population := StrToInt(TmpStrList.Strings[10]);
    Village.PlayerSelectedColor := PlayerSelectedColor;
    MapSquareList.AddObject('',Village);
    TmpStrList.Clear;
  end;
  TmpStrList.Free;
  MapFileLines.Free;
  DrawMap2;
end;
}

procedure TMainForm.LoadCropList;
var
  i,j,x,y: Integer;
  SqInfoList: TStringList;
  Percent: Byte;
  Found: Boolean;
  Village: TVillage;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'CropList.dat') then
    FCropList.LoadFromFile(ExtractFilePath(Application.ExeName)+'CropList.dat');
  SqInfoList := TStringList.Create;
  SqInfoList.Delimiter := '|';
  for I := 0 to FCropList.Count - 1 do
  begin
    SqInfoList.CommaText := FCropList.Strings[i];
    x := StrToInt(SqInfoList.Strings[0]);
    y := StrToInt(SqInfoList.Strings[1]);
    Found := False;
    for j := 0 to MapSquareList.Count - 1 do
    begin
      if (x=TVillage(MapSquareList.Objects[j]).X) and (y=TVillage(MapSquareList.Objects[j]).y) then
      begin
        Found := True;
        TVillage(MapSquareList.Objects[j]).CropInfo := TVillage(MapSquareList.Objects[j]).CropInfo or 1;
        if SqInfoList.Strings[2] = '15cc' then
          TVillage(MapSquareList.Objects[j]).CropInfo := TVillage(MapSquareList.Objects[j]).CropInfo or 2;
        if SqInfoList.Strings[3] = '150%' then
          Percent := 6
        else
        if SqInfoList.Strings[3] = '125%' then
          Percent := 5
        else
        if SqInfoList.Strings[3] = '100%' then
          Percent := 4
        else
        if SqInfoList.Strings[3] = '75%' then
          Percent := 3
        else
        if SqInfoList.Strings[3] = '50%' then
          Percent := 2
        else
        if SqInfoList.Strings[3] = '25%' then
          Percent := 1
        else
          Percent := 0;
        TVillage(MapSquareList.Objects[j]).CropInfo := TVillage(MapSquareList.Objects[j]).CropInfo or (Percent shl 2);
      end;
    end;
    if not Found then
    begin
      Village := TVillage.Create;
      Village.CropInfo := 1;
      if SqInfoList.Strings[2] = '15cc' then
        Village.CropInfo := Village.CropInfo or 2;
      if SqInfoList.Strings[3] = '150%' then
        Percent := 6
      else
      if SqInfoList.Strings[3] = '125%' then
        Percent := 5
      else
      if SqInfoList.Strings[3] = '100%' then
        Percent := 4
      else
      if SqInfoList.Strings[3] = '75%' then
        Percent := 3
      else
      if SqInfoList.Strings[3] = '50%' then
        Percent := 2
      else
      if SqInfoList.Strings[3] = '25%' then
        Percent := 1
      else
        Percent := 0;
      Village.X := x;
      Village.Y := y;
      Village.CropInfo := Village.CropInfo or (Percent shl 2);
      MapSquareList.AddObject('',TObject(Village));
    end;
  end;
end;

procedure TMainForm.LoadFarmList;
var
  i,j,x,y: Integer;
  Cordinate: TStringList;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'FarmList.dat') then
    FFarmList.LoadFromFile(ExtractFilePath(Application.ExeName)+'FarmList.dat');
  Cordinate := TStringList.Create;
  Cordinate.Delimiter := '|';
  for I := 0 to FFarmList.Count - 1 do
  begin
    Cordinate.DelimitedText := FFarmList.Strings[i];
    x := StrToInt(Cordinate.Strings[0]);
    y := StrToInt(Cordinate.Strings[1]);
    for j := 0 to MapSquareList.Count - 1 do
      if (x=TVillage(MapSquareList.Objects[j]).X) and (y=TVillage(MapSquareList.Objects[j]).y) then
        TVillage(MapSquareList.Objects[j]).IsFarm := True;
  end;
end;

procedure TMainForm.LoadMap(MapFile: string);
var
  i,j: Integer;
  TmpStr: string;
  TmpStrList: TStringList;
  MapFileLines: TStringList;
  Village: TVillage;
begin
  MapFileLines := TStringList.Create;
  MapFileLines.LoadFromFile(MapFile);
  for i := 0 to MapFileLines.Count-1 do
  begin
    TmpStr := MapFileLines.Strings[i];
    Village := VillageFromSqlStr(TmpStr);
    MapSquareList.AddObject('',Village);
  end;
  MapFileLines.Free;
  TotalVillageLabel.Caption := IntToStr(MapSquareList.Count);
  TotalPlayerLabel.Caption := IntToStr(GetPlayerCount);
end;

procedure TMainForm.MapsListBoxDblClick(Sender: TObject);
var
  Index: Integer;
begin
  if MapsListBox.ItemIndex>-1 then
  begin
    while MapSquareList.Count>0 do
    begin
      //TVillage(MapSquareList.Objects[0]).Free;
      MapSquareList.Delete(0);
    end;
    //MapFileName := MapFiles[MapsListBox.ItemIndex];
    MapFileName := MapsListBox.Items[MapsListBox.ItemIndex];
    LoadMap(ExtractFilePath(Application.ExeName)+'Maps\'+MapFileName);
    LoadCropList;
    ApplySelectedVillages;
    DrawMap2;
  end;
end;

procedure TMainForm.OnDownloadFinish(Sender: TObject);
begin
  DownloadForm.Close;
end;

procedure TMainForm.OnDownloadProgressChange(Sender: TObject);
begin
  DownloadForm.Gauge1.Progress := TDownloadProgress(Sender).Progress;
  Application.ProcessMessages;
end;

procedure TMainForm.OnWMContextMenu(var msg: TMessage);
begin
    inherited;
//  FPopupActive := True;
//  try
//    OutputDebugString(PChar(Format('popup opening', [])));
//  finally
//    FPopupActive := False;
//    OutputDebugString(PChar(Format('popup closed', [])));
//  end;
end;

procedure TMainForm.PlayersListBoxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  OldColor: TColor;
begin
  OldColor := PlayersListBox.Canvas.Font.Color;
  PlayersListBox.Canvas.Font.Color := TColor(PlayersListBox.Items.Objects[Index]);
  //---------------------------------------
//  if odSelected in State then
//      Brush.Color := $00FFD2A6;

  PlayersListBox.Canvas.FillRect(Rect);
  //---------------------------------------
  PlayersListBox.Canvas.TextOut(Rect.Left,Rect.Top,PlayersListBox.Items[Index]);
  PlayersListBox.Canvas.Font.Color := OldColor;
  if odFocused in State then
    PlayersListBox.Canvas.DrawFocusRect(Rect);
end;

procedure TMainForm.PlayersListBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Pt : TPoint;
  i : integer;
begin
  Pt.x := x;
  Pt.y := y;
  if PlayersListBox.ItemAtPos(Pt, true) = -1 then
    for i := 0 to PlayersListBox.Items.count - 1 do
      PlayersListBox.selected[i] := False;
end;

procedure TMainForm.RemoveAllianceButtonClick(Sender: TObject);
var
  i: Integer;
begin
  if AllianceListBox.ItemIndex>-1 then
  begin
    for i := 0 to MapSquareList.Count-1 do
      if TVillage(MapSquareList.Objects[i]).AllianceName = AllianceListBox.Items[AllianceListBox.ItemIndex] then
        TVillage(MapSquareList.Objects[i]).AllianceSelected := False;
    AllianceListBox.DeleteSelected;//. rItems[AllianceListBox.ItemIndex]
    DrawMap2;
  end;
end;

procedure TMainForm.RemovePlayerButtonClick(Sender: TObject);
var
  i: Integer;
begin
  if PlayersListBox.ItemIndex>-1 then
  begin
    for i := 0 to MapSquareList.Count-1 do
      if TVillage(MapSquareList.Objects[i]).PlayerName = PlayersListBox.Items[PlayersListBox.ItemIndex] then
        TVillage(MapSquareList.Objects[i]).PlayerSelected := False;
    PlayersListBox.DeleteSelected;
    DrawMap2;
  end;
end;

function TMainForm.CanShowThisCrop(Village: TVillage): Boolean;
begin
  Result := ShowCropsCheckBox.Checked;
  if (Village.CropInfo and 2) = 2 then // Is 15cc
  begin
    case (Village.CropInfo shr 2) of
    0: Result := Result and CropSettingForm.Show15cc0Percent;
    1: Result := Result and CropSettingForm.Show15cc25Percent;
    2: Result := Result and CropSettingForm.Show15cc50Percent;
    3: Result := Result and CropSettingForm.Show15cc75Percent;
    4: Result := Result and CropSettingForm.Show15cc100Percent;
    5: Result := Result and CropSettingForm.Show15cc125Percent;
    6: Result := Result and CropSettingForm.Show15cc150Percent;
    end;
  end
  else
  begin  // It's 9cc Crop
    case (Village.CropInfo shr 2) of
    0: Result := Result and CropSettingForm.Show9cc0Percent;
    1: Result := Result and CropSettingForm.Show9cc25Percent;
    2: Result := Result and CropSettingForm.Show9cc50Percent;
    3: Result := Result and CropSettingForm.Show9cc75Percent;
    4: Result := Result and CropSettingForm.Show9cc100Percent;
    5: Result := Result and CropSettingForm.Show9cc125Percent;
    6: Result := Result and CropSettingForm.Show9cc150Percent;
    end;
  end;
end;

procedure TMainForm.ChangeAllianceColorButtonClick(Sender: TObject);
var
  i: Integer;
begin
  if AllianceListBox.ItemIndex>-1 then
  begin
    ColorDialog.Color := Integer(AllianceListBox.Items.Objects[AllianceListBox.ItemIndex]);
    if ColorDialog.Execute then
    begin
      AllianceListBox.Items.Objects[AllianceListBox.ItemIndex] := TObject(ColorDialog.Color);
      for i := 0 to MapSquareList.Count-1 do
        if TVillage(MapSquareList.Objects[i]).AllianceName = AllianceListBox.Items[AllianceListBox.ItemIndex] then
          TVillage(MapSquareList.Objects[i]).AllianceSelectedColor := Color32(ColorDialog.Color);
      DrawMap2;
//      AllianceListBox.Repaint;
//      AllianceListBox.Refresh;
    end;
  end;
end;

procedure TMainForm.ChangePlayerColorButtonClick(Sender: TObject);
var
  i: Integer;
begin
  if PlayersListBox.ItemIndex>-1 then
  begin
    ColorDialog.Color := Integer(PlayersListBox.Items.Objects[PlayersListBox.ItemIndex]);
    if ColorDialog.Execute then
    begin
      PlayersListBox.Items.Objects[PlayersListBox.ItemIndex] := TObject(ColorDialog.Color);
      for i := 0 to MapSquareList.Count-1 do
        if TVillage(MapSquareList.Objects[i]).PlayerName = PlayersListBox.Items[PlayersListBox.ItemIndex] then
          TVillage(MapSquareList.Objects[i]).PlayerSelectedColor := Color32(ColorDialog.Color);
      DrawMap2;
    end;
  end;
end;

procedure TMainForm.ColorSwatchsClick(Sender: TObject);
begin
  case TImage32(Sender).Tag of
  0: ColorDialog.Color := WinColor(ColorSwatch1.Bitmap.Pixel[1,1]);
  1: ColorDialog.Color := WinColor(ColorSwatch2.Bitmap.Pixel[1,1]);
  2: ColorDialog.Color := WinColor(ColorSwatch3.Bitmap.Pixel[1,1]);
  3: ColorDialog.Color := WinColor(ColorSwatch4.Bitmap.Pixel[1,1]);
  4: ColorDialog.Color := WinColor(ColorSwatch5.Bitmap.Pixel[1,1]);
  5: ColorDialog.Color := WinColor(ColorSwatch6.Bitmap.Pixel[1,1]);
  end;
  if ColorDialog.Execute then
  begin
    case TImage32(Sender).Tag of
    0:
      begin
        ColorSwatch1.Color := Color32(ColorDialog.Color);
        FBackgroundColor := Color32(ColorDialog.Color);
        with ColorSwatch1.Bitmap do
          FillRect(0,0,Width,Height,Color32(ColorDialog.Color));
      end;
    1:
      begin
        ColorSwatch2.Color := Color32(ColorDialog.Color);
        FVillageSquareBgColor := Color32(ColorDialog.Color);
        with ColorSwatch2.Bitmap do
          FillRect(0,0,Width,Height,Color32(ColorDialog.Color));
      end;
    2:
      begin
        ColorSwatch3.Color := Color32(ColorDialog.Color);
        FSelectedPlayerRectColor := Color32(ColorDialog.Color);
        with ColorSwatch3.Bitmap do
          FillRect(0,0,Width,Height,Color32(ColorDialog.Color));
      end;
    3:
      begin
        ColorSwatch4.Color := Color32(ColorDialog.Color);
        FPlayerSelectedColor := Color32(ColorDialog.Color);
        with ColorSwatch4.Bitmap do
          FillRect(0,0,Width,Height,Color32(ColorDialog.Color));
      end;
    4:
      begin
        ColorSwatch5.Color := Color32(ColorDialog.Color);
        FSeperatorLinesColor := Color32(ColorDialog.Color);
        with ColorSwatch5.Bitmap do
          FillRect(0,0,Width,Height,Color32(ColorDialog.Color));
      end;
    5:
      begin
        ColorSwatch6.Color := Color32(ColorDialog.Color);
        FFarmVillageColor := Color32(ColorDialog.Color);
        with ColorSwatch6.Bitmap do
          FillRect(0,0,Width,Height,Color32(ColorDialog.Color));
      end;
    end;
    DrawMap2;
//    SelectPlayer(FSelectedVillage.PlayerName,);
  end;
end;

procedure TMainForm.ShowCropsCheckBoxClick(Sender: TObject);
begin
  FShowCrops := ShowCropsCheckBox.Checked;
  DrawMap2;
end;

procedure TMainForm.ShowNatarsCheckBoxClick(Sender: TObject);
begin
  ShowNatars := ShowNatarsCheckBox.Checked;
  DrawMap2;
end;

procedure TMainForm.SelectVillage(Village: TVillage);
var
  i: Integer;
  Pop: Integer;
  VillageCount: Integer;
begin
  Pop := 0;
  VillageCount := 0;
  //PlayerVillagesListBox.Clear;
  ImgView.Bitmap.BeginUpdate;
  ActivePlayerStringGrid.RowCount := 0;
  for i := 0 to MapSquareList.Count-1 do
    if Village.PlayerID=TVillage(MapSquareList.Objects[i]).PlayerID then
    begin
      Inc(VillageCount);
      Pop := Pop + TVillage(MapSquareList.Objects[i]).Population;
      TVillage(MapSquareList.Objects[i]).ActivePlayer := True;
      DrawSq(TVillage(MapSquareList.Objects[i]));
//      PlayerVillagesListBox.AddItem(Format('%20-s (%3-d,%3-d) %3-d',[TVillage(MapSquareList.Objects[i]).VillageName,TVillage(MapSquareList.Objects[i]).X,TVillage(MapSquareList.Objects[i]).Y,TVillage(MapSquareList.Objects[i]).Population]),nil);
      ActivePlayerStringGrid.Cells[0,ActivePlayerStringGrid.RowCount - 1] := TVillage(MapSquareList.Objects[i]).VillageName;
      ActivePlayerStringGrid.Cells[1,ActivePlayerStringGrid.RowCount - 1] := IntToStr(TVillage(MapSquareList.Objects[i]).X)+','+IntToStr(TVillage(MapSquareList.Objects[i]).Y);
      ActivePlayerStringGrid.Cells[2,ActivePlayerStringGrid.RowCount - 1] := IntToStr(TVillage(MapSquareList.Objects[i]).Population);
      ActivePlayerStringGrid.RowCount := ActivePlayerStringGrid.RowCount + 1;
    end;

  // clear last row
  ActivePlayerStringGrid.Cells[0,ActivePlayerStringGrid.RowCount - 1] := '';
  ActivePlayerStringGrid.Cells[1,ActivePlayerStringGrid.RowCount - 1] := '';
  ActivePlayerStringGrid.Cells[2,ActivePlayerStringGrid.RowCount - 1] := '';

  ImgView.Bitmap.EndUpdate;
  ImgView.Invalidate;
  PlayerNameLabel.Caption := Village.PlayerName;
  PopLabel.Caption := IntToStr(Pop);
  TribeLabel.Caption := Tribes[Village.TID-1];
  VillageCountLabel.Caption := IntToStr(VillageCount);
  AllianceNameLabel.Caption := Village.AllianceName;
end;

procedure TMainForm.Splitter1CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  Accept := False;
//  if NewSize>272 then
//    Accept := True
end;

procedure TMainForm.Splitter2CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  Accept := False
end;

procedure TMainForm.UnSelectVillage(Village: TVillage);
var
  i: Integer;
begin
//  PlayerVillagesListBox.Clear;
  ActivePlayerStringGrid.RowCount := 0;
  // clear last row
  ActivePlayerStringGrid.Cells[0,ActivePlayerStringGrid.RowCount - 1] := '';
  ActivePlayerStringGrid.Cells[1,ActivePlayerStringGrid.RowCount - 1] := '';
  ActivePlayerStringGrid.Cells[2,ActivePlayerStringGrid.RowCount - 1] := '';

  for i := 0 to MapSquareList.Count-1 do
    if Village.PlayerID=TVillage(MapSquareList.Objects[i]).PlayerID then
    begin
      TVillage(MapSquareList.Objects[i]).ActivePlayer := False;
      DrawSq(TVillage(MapSquareList.Objects[i]));
    end;

  PlayerNameLabel.Caption := '-';
  PopLabel.Caption := '0';
  TribeLabel.Caption := '-';
  VillageCountLabel.Caption := '0';
  AllianceNameLabel.Caption := '-';
end;

procedure TMainForm.DrawSq(Village: TVillage);
var
  FillColor: TColor32;
begin
  if Village.ActivePlayer then
    FillColor := FPlayerSelectedColor
  else
  if Village.IsFarm then
    FillColor := FFarmVillageColor
  else
  if Village.PlayerSelected then
    FillColor := Village.PlayerSelectedColor
  else
  if Village.AllianceSelected then
    FillColor := Village.AllianceSelectedColor
  else
  if (Village.CropInfo and 1) = 1 then
  begin
    if (Village.PlayerName='') and not ShowCropsCheckBox.Checked then
      Exit;
    if (Village.CropInfo and 2) = 2 then // Is 15cc
    begin
      case (Village.CropInfo shr 2) of
      0: if CropSettingForm.Show15cc0Percent then FillColor := CropSettingForm.Cr15cc0Color else Exit;
      1: if CropSettingForm.Show15cc25Percent then FillColor := CropSettingForm.Cr15cc25Color else Exit;
      2: if CropSettingForm.Show15cc50Percent then FillColor := CropSettingForm.Cr15cc50Color else Exit;
      3: if CropSettingForm.Show15cc75Percent then FillColor := CropSettingForm.Cr15cc75Color else Exit;
      4: if CropSettingForm.Show15cc100Percent then FillColor := CropSettingForm.Cr15cc100Color else Exit;
      5: if CropSettingForm.Show15cc125Percent then FillColor := CropSettingForm.Cr15cc125Color else Exit;
      6: if CropSettingForm.Show15cc150Percent then FillColor := CropSettingForm.Cr15cc150Color else Exit;
      end;
    end
    else
    begin  // It's 9cc Crop
      case (Village.CropInfo shr 2) of
      0: if CropSettingForm.Show9cc0Percent then FillColor := CropSettingForm.Cr9cc0Color else Exit;
      1: if CropSettingForm.Show9cc25Percent then FillColor := CropSettingForm.Cr9cc25Color else Exit;
      2: if CropSettingForm.Show9cc50Percent then FillColor := CropSettingForm.Cr9cc50Color else Exit;
      3: if CropSettingForm.Show9cc75Percent then FillColor := CropSettingForm.Cr9cc75Color else Exit;
      4: if CropSettingForm.Show9cc100Percent then FillColor := CropSettingForm.Cr9cc100Color else Exit;
      5: if CropSettingForm.Show9cc125Percent then FillColor := CropSettingForm.Cr9cc125Color else Exit;
      6: if CropSettingForm.Show9cc150Percent then FillColor := CropSettingForm.Cr9cc150Color else Exit;
      end;
    end;
  end
  else
    FillColor := FVillageSquareBgColor;

  if ImgView.Scale>=0.5 then
  begin
    ImgView.Bitmap.FillRect((Village.X+400)*SquareWidth+1,(400-Village.Y)*SquareWidth+1,(Village.X+400+1)*SquareWidth,(400-Village.Y+1)*SquareWidth,FillColor{Village.PlayerSelectedColor});
    if Village.ActivePlayer then
      ImgView.Bitmap.FrameRectS((Village.X+400)*SquareWidth+1,(400-Village.Y)*SquareWidth+1,(Village.X+400+1)*SquareWidth,(400-Village.Y+1)*SquareWidth,FSelectedPlayerRectColor)
    else
      ImgView.Bitmap.FrameRectS((Village.X+400)*SquareWidth,(400-Village.Y)*SquareWidth,(Village.X+400+1)*SquareWidth+1,(400-Village.Y+1)*SquareWidth+1,FSeperatorLinesColor);
  end
  else
    ImgView.Bitmap.FillRect((Village.X+400)*SquareWidth,(400-Village.Y)*SquareWidth,(Village.X+400+1)*SquareWidth,(400-Village.Y+1)*SquareWidth,FillColor{Village.PlayerSelectedColor});
end;

function TMainForm.VillageFromSqlStr(SqlStr: string): TVillage;
var
  SQLToken     : TSQLToken;
  CurSection   : TSQLToken;
  Start        : PWideChar;
  Token        : string;
  IdOption     : IDENTIFIEROption;
  Counter      : Integer;
begin
  SqlStr := UTF8ToString(SqlStr);
  Result := TVillage.Create;
  IdOption   :=idMixCase;
  Start      :=PWideChar(SqlStr);
  CurSection := stUnknown;
  Counter := 0;
  repeat
    SQLToken := NextSQLTokenEx(Start, Token, CurSection, IdOption);
//    if SQLToken<>stEnd then
//      Memo1.Lines.Add(Format('Type %s Token %s', [GetEnumName(TypeInfo(TSQLToken), integer(SQLToken)),Token]));
    case Counter of
    4: Result.LocationID := StrToInt(Token);
    5: Result.X := StrToInt(Token);
    6: Result.Y := StrToInt(Token);
    7: Result.TID := StrToInt(Token);
    8: Result.VillageID := StrToInt(Token);
    9: Result.VillageName := Token;
    10: Result.PlayerID := StrToInt(Token);
    11: Result.PlayerName := Token;
    12: Result.AllianceID := StrToInt(Token);
    13: Result.AllianceName := Token;
    14: Result.Population := StrToInt(Token);
    end;
    Inc(Counter);
    CurSection := SQLToken;
  until SQLToken in [stEnd];
  Result.PlayerSelectedColor := FPlayerSelectedColor;
end;

end.
