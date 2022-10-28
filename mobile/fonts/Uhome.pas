unit Uhome;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  Tfrm_home = class(TForm)
    Layout_topMenu: TLayout;
    Layout_bottomMenu: TLayout;
    Layout_centerMenu: TLayout;
    Layout_doBottom: TLayout;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Rectangle_criarReporte: TRectangle;
    Rectangle_mapaEscolar: TRectangle;
    Rectangle_verConcluidos: TRectangle;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    lb_reportarProblema: TLabel;
    lb_concluidos: TLabel;
    lb_mapaEscolar: TLabel;
    linha_Bottom: TLine;
    Linha_top: TLine;
    IdHTTP1: TIdHTTP;
    StyleBook1: TStyleBook;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_home: Tfrm_home;

implementation

{$R *.fmx}


end.
