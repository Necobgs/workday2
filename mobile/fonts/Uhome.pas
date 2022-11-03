unit Uhome;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.ListBox, FMX.Edit;

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
    TabControl1: TTabControl;
    tab_home: TTabItem;
    Tab_reportarProblema: TTabItem;
    Layout_reportarProblemas: TLayout;
    Layout_repotTop: TLayout;
    Layout_reportCenter: TLayout;
    Image7: TImage;
    ActionList1: TActionList;
    act_home: TChangeTabAction;
    act_reports: TChangeTabAction;
    Layout_reportLugar: TLayout;
    Round_lugar: TRoundRect;
    Layout_reportDesricao: TLayout;
    Round_descricao: TRoundRect;
    edt_descricao: TEdit;
    Cb_Lugar: TComboBox;
    lb_lugar: TLabel;
    lb_nomeUsuario: TLabel;
    procedure Image7Click(Sender: TObject);
    procedure Rectangle_criarReporteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frm_home: Tfrm_home;
  Nome_usuario,id_tipo_usuario,Email_usuario,id_usuario:string;

implementation

{$R *.fmx}


procedure Tfrm_home.FormShow(Sender: TObject);
var
empty : tstringlist;
begin
 lb_nomeUsuario.Text := lb_nomeUsuario.Text + nome_usuario;
 cb_lugar.Items.Text := idhttp1.post('http://localhost/3-54/mobile/conex/Lugar.php', empty);
end;

procedure Tfrm_home.Image7Click(Sender: TObject);
begin
 act_home.Execute;
end;

procedure Tfrm_home.Rectangle_criarReporteClick(Sender: TObject);
begin
act_reports.Execute;
end;

end.
