program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Uprincipal in 'Uprincipal.pas' {frm_login},
  u99Permissions in 'Units\u99Permissions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_login, frm_login);
  Application.Run;
end.
