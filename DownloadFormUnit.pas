unit DownloadFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Gauges;

type
  TDownloadForm = class(TForm)
    Gauge1: TGauge;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DownloadForm: TDownloadForm;

implementation

{$R *.dfm}

end.
