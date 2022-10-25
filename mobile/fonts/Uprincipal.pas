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
    Label1: TLabel;
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
    Round_senhaConfirma: TRoundRect;
    edt_senhaConfirma: TEdit;
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
    Memo1: TMemo;
    Layout1: TLayout;
    Label2: TLabel;
    procedure lb_CriarcontaClick(Sender: TObject);
    procedure lbc_loginClick(Sender: TObject);
    procedure Round_contaProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Round_acessarClick(Sender: TObject);



  private
    { Private declarations }
    permissao: T99Permissions;
    procedure TrataErroPermissao(Sender: TObject);
  public
    { Public declarations }
  end;
var
  frm_login: Tfrm_login;
implementation
{$R *.fmx}



     procedure Tfrm_login.TrataErroPermissao(Sender: TObject);
     begin
       showmessage('Voc� n�o possui permiss�o de acesso para esse recurso');
     end;

procedure Tfrm_login.FormShow(Sender: TObject);
begin
           act_login.Execute;
end;

procedure Tfrm_login.lbc_loginClick(Sender: TObject);
begin
            act_login.Execute;
              lb_erroCriarconta.Visible := false;
end;
procedure Tfrm_login.lb_CriarcontaClick(Sender: TObject);
begin
            act_conta.Execute;
end;


//bot�o acessar
procedure Tfrm_login.Round_acessarClick(Sender: TObject);
var
//Lista de string que recebe os dados
jsonToSend: Tstringlist;

begin
//criando a lista e adicionando os valores no tipo key=value
jsontosend := tstringlist.Create;
jsonToSend.Add('email=' + edt_email.Text);
jsonToSend.Add('senha=' + edt_senha.Text);
//postado e execultando o codigo no arquivo .php
memo1.Lines.Text := idhttp1.post('http://localhost/conex/SelecionarUsuario.php', jsonToSend);

end;

procedure Tfrm_login.Round_contaProximoClick(Sender: TObject);
var
//Lista de string que recebe os dados
jsonToSendContaNova: Tstringlist;

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
            memo1.Lines.Text := idhttp1.post('http://localhost/conex/InserirUsuario.php', jsonToSendContaNova);

      end
     else
      begin
        lb_erroCriarconta.visible := true;
      end;

end;

End.
