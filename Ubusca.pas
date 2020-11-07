unit Ubusca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFbusca = class(TForm)
    Panel1: TPanel;
    lbltitulo: TLabel;
    edtnome: TEdit;
    lblnome: TLabel;
    dbgrid_result: TDBGrid;
    btnok: TButton;
    procedure btnokClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrid_resultDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  tipo_busca: Integer;
  end;

var
  Fbusca: TFbusca;

implementation

uses
  Udados, Uprincipal;

{$R *.dfm}

procedure TFbusca.btnokClick(Sender: TObject);
begin
  {BUSCA DE ACORDO COM A OPÇÃO
  1 - BUSCA CLIENTES
  2 E 3 -  BUSCA PEDIDO}

  if tipo_busca = 1 then
  begin
    dmdados.qrclientes.Close;
    dmdados.qrclientes.SQL.Clear;
    dmdados.qrclientes.SQL.Add('select A.codigo, A.nome, B.descricao AS Cidade, C.descricao AS Estado from clientes A left join cidade B on B.codigo = A.cod_cidade left join estado C on C.codigo = B.cod_uf where A.nome like ' + QuotedStr('%'+ edtnome.Text + '%'));
    dmdados.qrclientes.Active := True;
    dmdados.dsclientes.Enabled := True;
    dbgrid_result.DataSource := dmdados.dsclientes;

    if dmdados.qrclientes.RecordCount > 0 then
    begin
      dmdados.dsclientes.Enabled := True;
    end
    else
    begin
      ShowMessage('Cliente não Encontrado!');
      edtnome.SetFocus;
      edtnome.SelectAll;
    end;
  end
  else
  if (tipo_busca = 2) or (tipo_busca = 3)  then
  begin
    dmdados.qrpedidos.Close;
    dmdados.qrpedidos.SQL.Clear;
    dmdados.qrpedidos.SQL.Add('Select A.*, B.* from pedidos A left join clientes B on B.codigo = A.cod_cliente where num_pedido = ' + edtnome.Text);
    dmdados.qrpedidos.Active := True;
    dmdados.dsbuscapedido.Enabled := True;
    dbgrid_result.DataSource := dmdados.dsbuscapedido;

    dmdados.qrpedidosdetalhe.Close;
    dmdados.qrpedidosdetalhe.SQL.Clear;
    dmdados.qrpedidosdetalhe.SQL.Add('Select cod_produto, B.descricao as descricao, A.quantidade, A.valor_unitario, A.valor_total from pedido_detalhe A left join produtos B on B.codigo = A.cod_produto where num_pedido = ' + edtnome.Text);
    //dmdados.qrpedidosdetalhe.Active := True;
    dmdados.dsbuscapedidodetalhe.Enabled := True;
    fprincipal.DBGrid1.DataSource := dmdados.dsbuscapedidodetalhe;

  end;

end;

procedure TFbusca.dbgrid_resultDblClick(Sender: TObject);
begin
  if tipo_busca = 1 then
  begin
    fprincipal.buscarclientes(dmdados.qrclientes.FieldByName('codigo').AsInteger,3,'');
    Fbusca.Close;
  end
  else
  if tipo_busca = 2 then
  begin
    fprincipal.buscarclientes(dmdados.qrpedidos.FieldByName('cod_cliente').AsInteger,3,'');
    dmdados.qrpedidosdetalhe.Active := True;
    fprincipal.valortotal(2);
    fprincipal.limpaitens(3);
    Fbusca.Close;
  end
  else
  if tipo_busca = 3 then
  begin
    fprincipal.buscarclientes(dmdados.qrpedidos.FieldByName('cod_cliente').AsInteger,3,'');
    dmdados.qrpedidosdetalhe.Active := True;
    fprincipal.valortotal(2);
    fprincipal.limpaitens(4);
    fprincipal.cancelapedido := 1;
    Fbusca.Close;
  end;
  
end;

procedure TFbusca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmdados.dsclientes.Enabled := False;
  edtnome.Clear;
end;

procedure TFbusca.FormShow(Sender: TObject);
begin
  {CONFIGURA A TELA DE ACORDO COM A SOLICITAÇÃO NA TELA PRINCIPAL}

  if tipo_busca = 1 then
  begin
    lbltitulo.Caption := 'Busca de Clientes';
    lblnome.Caption := 'Nome';
    btnok.Caption := 'Buscar';

  end
  else
  if tipo_busca = 2 then
  begin
    lbltitulo.Caption := 'Busca de Pedidos';
    lblnome.Caption := 'Numero do Pedido';
    btnok.Caption := 'Buscar';
  end
  else
  if tipo_busca = 3 then
  begin
    lbltitulo.Caption := 'Busca de Pedidos para Cancelamento';
    lblnome.Caption := 'Numero do Pedido';
    btnok.Caption := 'Buscar';
  end;
end;

end.
