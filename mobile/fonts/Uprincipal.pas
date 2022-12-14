unit Uprincipal;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.StdCtrls,
  FMX.TabControl, System.Actions, FMX.ActnList, u99Permissions,
  FMX.MediaLibrary.Actions, FMX.StdActns, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  FMX.ExtCtrls, FMX.Menus;
type
  Tfrm_login = class(TForm)
    Layout_login: TLayout;
    img_logo: TImage;
    Layout_senha: TLayout;
    Round_senha: TRoundRect;
    edt_senha: TEdit;
    StyleBook1: TStyleBook;
    Layout_email: TLayout;
    Round_email: TRoundRect;
    edt_email: TEdit;
    Layout_acessar: TLayout;
    lb_acessar: TLabel;
    Tab_control: TTabControl;
    tab_Login: TTabItem;
    tab_Criar_conta: TTabItem;
    Round_acessar: TRoundRect;
    Layout_conta: TLayout;
    img_contaLogo: TImage;
    Layout_contaSenha: TLayout;
    round_contaSenha: TRoundRect;
    edt_contaSenha: TEdit;
    Layout_contaEmail: TLayout;
    round_emailConta: TRoundRect;
    edt_contaEmail: TEdit;
    Layout_contaProximo: TLayout;
    Round_contaProximo: TRoundRect;
    lb_conta_criar: TLabel;
    Layout_contaConfirma: TLayout;
    Layout_contaNome: TLayout;
    Round_conta_nome: TRoundRect;
    edt_contaNome: TEdit;
    ActionList1: TActionList;
    act_conta: TChangeTabAction;
    act_login: TChangeTabAction;
    act_esqueciSenha: TChangeTabAction;
    lb_erroCriarconta: TLabel;
    act_library: TTakePhotoFromLibraryAction;
    act_camera: TTakePhotoFromCameraAction;
    lb_Criarconta: TLabel;
    lb_Login: TLabel;
    Layout_criarContaLogin: TLayout;
    lbc_criarconta: TLabel;
    lbc_login: TLabel;
    IdHTTP1: TIdHTTP;
    Layout1: TLayout;
    lb_esqueciSenha: TLabel;
    lb_erroLogin: TLabel;
    img_olhoAberto: TImage;
    img_olhoFechado: TImage;
    Round_senhaConfirma: TRoundRect;
    edt_senhaConfirma: TEdit;
    procedure lb_CriarcontaClick(Sender: TObject);
    procedure Round_contaProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Round_acessarClick(Sender: TObject);
    procedure img_olhoAbertoClick(Sender: TObject);
    procedure lbc_loginClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frm_login: Tfrm_login;
implementation
{$R *.fmx}

uses Uhome;




procedure Tfrm_login.FormShow(Sender: TObject);
begin
           act_login.Execute;
end;

procedure Tfrm_login.img_olhoAbertoClick(Sender: TObject);
begin

if (img_olhoFechado.Visible = true) and (tab_criar_conta.Enabled = true) then
begin
    edt_senha.Password := false;
    img_olhoAberto.Visible := true;
    img_olhoFechado.Visible := false;
end
 else
  begin
   edt_senha.Password := true;
   img_olhoAberto.Visible := false;
   img_olhoFechado.Visible := true;
end;




end;


procedure Tfrm_login.lbc_loginClick(Sender: TObject);
begin
   act_login.Execute;
   lb_erroCriarConta.Visible := false;
end;

procedure Tfrm_login.lb_CriarcontaClick(Sender: TObject);
begin
               act_conta.Execute;
              lb_erroCriarconta.Visible := false;
end;


//bot?o acessar
procedure Tfrm_login.Round_acessarClick(Sender: TObject);
var
//Lista de string que recebe os dados
jsonToSend: Tstringlist;
logado : String;

begin
//criando a lista e adicionando os valores no tipo key=value
jsontosend := tstringlist.Create;
jsonToSend.Add('email=' + edt_email.Text);
jsonToSend.Add('senha=' + edt_senha.Text);
//postado e execultando o codigo no arquivo .php
logado := idhttp1.post('http://localhost/3-54/mobile/conex/SelecionarUsuario.php', jsonToSend);
Nome_usuario := idhttp1.post('http://localhost/3-54/mobile/conex/Nome_Usuario.php', jsonToSend);
Email_usuario := idhttp1.post('http://localhost/3-54/mobile/conex/Email_Usuario.php', jsonToSend);
id_tipo_usuario := idhttp1.post('http://localhost/3-54/mobile/conex/Id_Tipo_Usuario.php', jsonToSend);
id_usuario := idhttp1.post('http://localhost/3-54/mobile/conex/Id_Usuario.php', jsonToSend);
 if logado = 'ON' then
 begin
    lb_erroLogin.Visible := false;
      Application.MainForm := frm_home;
      frm_login.close;
      frm_home.Show;
 end
 else
 lb_erroLogin.Visible := true;
end;

procedure Tfrm_login.Round_contaProximoClick(Sender: TObject);
var
//Lista de string que recebe os dados
jsonToSendContaNova: Tstringlist;
contaCriada: string;
begin
//verifica as caixaas
  if (edt_contaNome.Text <> '') and (edt_contaEmail.Text <> '') and
     (edt_contaSenha.text = edt_senhaConfirma.Text)
     then
      begin
       lb_erroCriarconta.visible := false;
        //criando a lista e adicionando os valores no tipo key=value
           jsontosendContaNova := tstringlist.Create;
           jsonToSendContaNova.Add('email=' + edt_ContaEmail.Text);
           jsonToSendContaNova.Add('senha=' + edt_Contasenha.Text);
           jsonToSendContaNova.Add('nome=' + edt_ContaNome.Text);
           //postado e execultando o codigo no arquivo .php
            contaCriada:= idhttp1.post('http://localhost/3-54/mobile/conex/InserirUsuario.php', jsonToSendContaNova);

            if contaCriada = 'ON' then
            begin
               act_login.Execute;
               lb_erroCriarconta.Visible := false;
            end
            else
            lb_erroCriarConta.Visible := true;

      end
     else
      begin
        lb_erroCriarconta.visible := true;
      end;

end;

End.
