program vendas;

uses
  Vcl.Forms,
  Uprincipal in 'Uprincipal.pas' {fprincipal},
  Udados in 'Udados.pas' {dmdados: TDataModule},
  Ubusca in 'Ubusca.pas' {Fbusca};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfprincipal, fprincipal);
  Application.CreateForm(Tdmdados, dmdados);
  Application.CreateForm(TFbusca, Fbusca);
  Application.Run;
end.
