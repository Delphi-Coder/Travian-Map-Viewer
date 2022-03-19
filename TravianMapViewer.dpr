program TravianMapViewer;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  SimpleDownloadUnit in 'SimpleDownloadUnit.pas',
  DownloadFormUnit in 'DownloadFormUnit.pas' {DownloadForm},
  InputNameUnit in 'InputNameUnit.pas' {InputForm},
  CropSettingUnit in 'CropSettingUnit.pas' {CropSettingForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDownloadForm, DownloadForm);
  Application.CreateForm(TInputForm, InputForm);
  Application.CreateForm(TCropSettingForm, CropSettingForm);
  Application.Run;
end.
