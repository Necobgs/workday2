unit Uprincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.StdCtrls,
  FMX.TabControl, System.Actions, FMX.ActnList, u99Permissions,
  FMX.MediaLibrary.Actions, FMX.StdActns;

type
  Tfrm_login = class(TForm)
    Layout_login: TLayout;
    img_logo: TImage;
    Layout_senha: TLayout;
    RoundRect1: TRoundRect;
    edt_senha: TEdit;
    StyleBook1: TStyleBook;
    Layout_email: TLayout;
    RoundRect2: TRoundRect;
    Edit1: TEdit;
    Layout_acessar: TLayout;
    Label1: TLabel;
    Tab_control: TTabControl;
    tab_Login: TTabItem;
    tab_Criar_conta: TTabItem;
    round: TRoundRect;
    Layout_conta: TLayout;
    conta_logo: TImage;
    conta_senha: TLayout;
    round_conta_senha: TRoundRect;
    edt_conta_senha: TEdit;
    conta_email: TLayout;
    round_email_conta: TRoundRect;
    edt_conta_email: TEdit;
    Layout_proximo: TLayout;
    Round_conta_proximo: TRoundRect;
    lb_conta_proximo: TLabel;
    Layout_conta_confirma_senha: TLayout;
    Round_conta_confirma_senha: TRoundRect;
    edt_conta_confirma_senha: TEdit;
    Layout_conta_nome: TLayout;
    Round_conta_nome: TRoundRect;
    edt_conta_nome: TEdit;
    Tab_foto: TTabItem;
    Layout_foto: TLayout;
    Circulo_Transparente: TCircle;
    lb_tirafoto: TLabel;
    layout_circle: TLayout;
    Tab_escolhafoto: TTabItem;
    layout_criar_conta: TLayout;
    circle_criar_conta: TRoundRect;
    lb_criar_conta: TLabel;
    Layout_escolha: TLayout;
    lb_escolha: TLabel;
    img_cam: TImage;
    img_gallery: TImage;
    layout_imgs: TLayout;
    layout_tabsdeconta: TLayout;
    lb_Login: TLabel;
    lb_Criarconta: TLabel;
    ActionList1: TActionList;
    act_conta: TChangeTabAction;
    act_login: TChangeTabAction;
    act_foto: TChangeTabAction;
    act_escolher: TChangeTabAction;
    tab_conta_criar_conta: TLayout;
    lbc_login: TLabel;
    lbc_criarconta: TLabel;
    lb_erro_criarconta: TLabel;
    Layout_back: TLayout;
    img_voltar_escolherfoto: TImage;
    act_library: TTakePhotoFromLibraryAction;
    act_camera: TTakePhotoFromCameraAction;
    Layout_back_escolhefoto: TLayout;
    img_back_escolhefoto: TImage;
    procedure lb_CriarcontaClick(Sender: TObject);
    procedure lbc_loginClick(Sender: TObject);
    procedure Round_conta_proximoClick(Sender: TObject);
    procedure Circulo_TransparenteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure img_camClick(Sender: TObject);
    procedure img_galleryClick(Sender: TObject);
    procedure img_back_escolhefotoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure act_libraryDidFinishTaking(Image: TBitmap);
    procedure act_cameraDidFinishTaking(Image: TBitmap);


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
       showmessage('Você não possui permissão de acesso para esse recurso');
     end;


procedure Tfrm_login.act_cameraDidFinishTaking(Image: TBitmap);
begin
   circulo_transparente.Fill.Bitmap.Bitmap := image;
   act_foto.Execute;
end;

procedure Tfrm_login.act_libraryDidFinishTaking(Image: TBitmap);
begin
   circulo_transparente.Fill.Bitmap.Bitmap := image;
   act_foto.Execute;
end;

procedure Tfrm_login.Circulo_TransparenteClick(Sender: TObject);
begin
                        act_escolher.Execute;
end;

procedure Tfrm_login.FormCreate(Sender: TObject);
begin
  permissao := T99Permissions.Create;
end;

procedure Tfrm_login.FormDestroy(Sender: TObject);
begin
permissao.DisposeOf;
end;

procedure Tfrm_login.FormShow(Sender: TObject);
begin
           act_login.Execute;

end;

procedure Tfrm_login.img_back_escolhefotoClick(Sender: TObject);
begin
       act_foto.Execute;
end;

procedure Tfrm_login.img_camClick(Sender: TObject);
begin
   permissao.Camera(act_Camera,TrataErroPermissao)
end;

procedure Tfrm_login.img_galleryClick(Sender: TObject);
begin
  permissao.PhotoLibrary(act_library,TrataErroPermissao);
end;

procedure Tfrm_login.lbc_loginClick(Sender: TObject);
begin
            act_login.Execute;
              lb_erro_criarconta.Visible := false;

end;

procedure Tfrm_login.lb_CriarcontaClick(Sender: TObject);
begin
            act_conta.Execute;
end;

procedure Tfrm_login.Round_conta_proximoClick(Sender: TObject);
begin
//verifica as caixaas
  if (edt_conta_nome.Text <> '') and (edt_conta_email.Text <> '') and
     (edt_conta_senha.text = edt_conta_confirma_senha.text)

     then
      begin
       lb_erro_criarconta.visible := false;
       act_foto.Execute
      end
     else
      begin
        lb_erro_criarconta.visible := true;
      end;


end;

end.
