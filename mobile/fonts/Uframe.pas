unit Uframe;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  Tframe_registro = class(TForm)
    Layout1: TLayout;
    lb_problema: TLabel;
    lb_local: TLabel;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frame_registro: Tframe_registro;

implementation

{$R *.fmx}

end.
