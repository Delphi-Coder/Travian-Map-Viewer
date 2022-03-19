unit InputNameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TInputForm = class(TForm)
    Button1: TButton;
    NameEdit: TEdit;
    Label1: TLabel;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InputForm: TInputForm;

implementation

{$R *.dfm}

end.
