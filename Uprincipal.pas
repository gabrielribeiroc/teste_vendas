unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TResultArray = array of string;
  Tfprincipal = class(TForm)
    lbltitulo: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    edtnomecliente: TEdit;
    Label3: TLabel;
    edtcodcliente: TEdit;
    edtcodproduto: TEdit;
    Label4: TLabel;
    lblcidade: TLabel;
    Label7: TLabel;
    edtqtdproduto: TEdit;
    Label8: TLabel;
    edtvalorproduto: TEdit;
    Label9: TLabel;
    edtnomeproduto: TEdit;
    btninserir: TButton;
    Label10: TLabel;
    lbltotal: TLabel;
    btngravar: TButton;
    btnbuscar: TButton;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnbuscapedido: TButton;
    btnbuscapedidocanc: TButton;
    procedure buscarclientes(codigo,tipo: Integer; nome: string);
    procedure buscarprodutos(codigo: Integer);
    procedure edtcodclienteExit(Sender: TObject);
    procedure edtnomeclienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnbuscarClick(Sender: TObject);
    procedure edtcodclienteDblClick(Sender: TObject);
    procedure edtnomeclienteDblClick(Sender: TObject);
    procedure edtcodprodutoExit(Sender: TObject);
    procedure btninserirClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure limpaitens(tipo: Integer);
    procedure valortotal(tipo: Integer);
    procedure edtcodclienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodprodutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtqtdprodutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btngravarClick(Sender: TObject);
    procedure btnbuscapedidoClick(Sender: TObject);
    procedure btnbuscapedidocancClick(Sender: TObject);
  private
    { Private declarations }
    total: Double;
  public
    { Public declarations }
    cancelapedido: Integer;
  end;

var
  fprincipal: Tfprincipal;

implementation

uses
  Udados, Ubusca;

{$R *.dfm}
procedure Tfprincipal.btngravarClick(Sender: TObject);
var
  num_pedido: Integer;
begin
  {AÇÃO DE CANCELAR PEDIDO}
  if cancelapedido = 1 then
  begin
    try
      dmdados.qrgeral.Close;
      dmdados.qrgeral.SQL.Clear;
      dmdados.qrgeral.SQL.Add('Start Transaction');
      dmdados.qrgeral.ExecSQL;

      dmdados.qrdeletapedido.Close;
      dmdados.qrdeletapedido.SQL.Clear;
      dmdados.qrdeletapedido.SQL.Add('delete from pedidos where num_pedido = ' + IntToStr(dmdados.qrpedidos.FieldByName('num_pedido').AsInteger) );
      dmdados.qrdeletapedido.Prepare;
      dmdados.qrdeletapedido.ExecSQL;

      dmdados.qrgeral.Close;
      dmdados.qrgeral.SQL.Clear;
      dmdados.qrgeral.SQL.Add('Commit');
      dmdados.qrgeral.ExecSQL;
    except
      dmdados.qrgeral.Close;
      dmdados.qrgeral.SQL.Clear;
      dmdados.qrgeral.SQL.Add('Rollback');
      dmdados.qrgeral.ExecSQL;
      ShowMessage('Não foi possível Cancelar o Pedido! Solicite Suporte!');
    end;

    limpaitens(5);
    limpaitens(2);
    DBGrid1.DataSource := dmdados.dtsprodutos;
    ShowMessage('Pedido Nº ' + IntToStr(dmdados.qrpedidos.FieldByName('num_pedido').AsInteger) + ' Cancelado!');
    cancelapedido := 0;
  end
  else
  begin
    {AÇÃO DE GRAVAR PEDIDO}
    try
      //dmdados.connVendas.StartTransaction;
      dmdados.qrgeral.Close;
      dmdados.qrgeral.SQL.Clear;
      dmdados.qrgeral.SQL.Add('Start Transaction');
      dmdados.qrgeral.ExecSQL;

      dmdados.qrinsertpedido.Close;
      dmdados.qrinsertpedido.SQL.Clear;
      dmdados.qrinsertpedido.SQL.Add('insert into pedidos (cod_cliente,val_total)Values(:pcod_cliente,:pval_total)');
      dmdados.qrinsertpedido.ParamByName('pcod_cliente').AsInteger := dmdados.dsprodutos.FieldByName('cod_cliente').AsInteger;
      dmdados.qrinsertpedido.ParamByName('pval_total').AsFloat := StrToFloat(lbltotal.Caption);
      dmdados.qrinsertpedido.Prepare;
      dmdados.qrinsertpedido.ExecSQL;

      dmdados.qrgeral.Close;
      dmdados.qrgeral.SQL.Clear;
      dmdados.qrgeral.SQL.Add('select max(num_pedido) as num_pedido from pedidos');
      dmdados.qrgeral.Active := True;
      num_pedido := dmdados.qrgeral.FieldByName('num_pedido').AsInteger;

      dmdados.dsprodutos.First;

      while not dmdados.dsprodutos.Eof do
      begin

        dmdados.qrinsertpedidodetalhe.Close;
        dmdados.qrinsertpedidodetalhe.SQL.Clear;
        dmdados.qrinsertpedidodetalhe.SQL.Add('insert into pedido_detalhe(num_pedido,cod_produto,quantidade,valor_unitario,valor_total)values(:pnum_pedido,:pcod_produto,:pquantidade,:pvalor_unitario,:pvalor_total)');
        dmdados.qrinsertpedidodetalhe.ParamByName('pnum_pedido').AsInteger := num_pedido;
        dmdados.qrinsertpedidodetalhe.ParamByName('pcod_produto').AsInteger := dmdados.dsprodutos.FieldByName('cod_produto').AsInteger ;
        dmdados.qrinsertpedidodetalhe.ParamByName('pquantidade').AsFloat := dmdados.dsprodutos.FieldByName('quantidade').AsFloat;
        dmdados.qrinsertpedidodetalhe.ParamByName('pvalor_unitario').AsFloat := dmdados.dsprodutos.FieldByName('valor_unit').AsFloat;
        dmdados.qrinsertpedidodetalhe.ParamByName('pvalor_total').AsFloat := dmdados.dsprodutos.FieldByName('valor_total').AsFloat;
        dmdados.qrinsertpedidodetalhe.Prepare;
        dmdados.qrinsertpedidodetalhe.ExecSQL;

        dmdados.dsprodutos.Next;

      end;

      //dmdados.connVendas.Commit;
      dmdados.qrgeral.Close;
      dmdados.qrgeral.SQL.Clear;
      dmdados.qrgeral.SQL.Add('Commit');
      dmdados.qrgeral.ExecSQL;

    except
      dmdados.qrgeral.Close;
      dmdados.qrgeral.SQL.Clear;
      dmdados.qrgeral.SQL.Add('Rollback');
      dmdados.qrgeral.ExecSQL;
      //dmdados.connVendas.Rollback;
      ShowMessage('Não foi possível encerrar o Pedido! Solicite Suporte!');

    end;

    With dmdados.dsprodutos do
    begin
      dmdados.dsprodutos.Open;
      dmdados.dsprodutos.EmptyDataSet;
      dmdados.dsprodutos.Close;
    end;
    limpaitens(1);
    limpaitens(2);
    lbltotal.Caption := '';
    dmdados.dsprodutos.Open;
    ShowMessage('Pedido Nº ' + IntToStr(num_pedido) + ' Encerrado!');
    btnbuscapedido.Visible := True;
    btnbuscapedidocanc.Visible := True;
  end;
end;

procedure Tfprincipal.btninserirClick(Sender: TObject);
begin
  {AÇÃO DE INSERIR DADOS DO PEDIDO NO GRID}
  if edtcodproduto.Text <> '' then
  begin

    dmdados.dsprodutos.Append;
    dmdados.dsprodutos.FieldByName('cod_cliente').AsInteger := StrToInt(edtcodcliente.Text);
    dmdados.dsprodutos.FieldByName('cod_produto').AsInteger := StrToInt(edtcodproduto.Text);
    dmdados.dsprodutos.FieldByName('descricao').AsString := edtnomeproduto.Text;
    dmdados.dsprodutos.FieldByName('quantidade').AsFloat := StrToFloat(edtqtdproduto.Text);
    dmdados.dsprodutos.FieldByName('valor_unit').AsFloat := StrToFloat(edtvalorproduto.Text);
    dmdados.dsprodutos.FieldByName('valor_total').AsFloat := StrToFloat(edtqtdproduto.Text) * StrToFloat(edtvalorproduto.Text);
    dmdados.dtsprodutos.Enabled := True;
    dmdados.dsprodutos.Post;
    limpaitens(1);
    valortotal(1);

  end
  else
  begin
    {AÇÃO DE ATUALIZAR O CAMPO VALOR TOTAL QUANDO ALTERADO NO GRID}
    dmdados.dsprodutos.First;

    while not dmdados.dsprodutos.Eof do
    begin
      dmdados.dsprodutos.Edit;
      dmdados.dsprodutos.FieldByName('valor_total').AsFloat := dmdados.dsprodutos.FieldByName('quantidade').AsFloat * dmdados.dsprodutos.FieldByName('valor_unit').AsFloat;
      dmdados.dsprodutos.UpdateRecord;
      dmdados.dsprodutos.Next;
    end;

  end;

  btninserir.Caption := 'Atualizar';
  valortotal(1);
end;

procedure Tfprincipal.buscarclientes(codigo,tipo: Integer; nome: string);
begin
  {AÇÃO DE BUSCAR CLIENTE POR CODIGO}
  if (tipo = 1) or (tipo = 3) then
  begin
    dmdados.qrclientes.Close;
    dmdados.qrclientes.SQL.Clear;
    dmdados.qrclientes.SQL.Add('select A.codigo, A.nome, B.descricao AS Cidade, C.descricao AS Estado from clientes A left join cidade B on B.codigo = A.cod_cidade left join estado C on C.codigo = B.cod_uf where A.codigo = '+ IntToStr(codigo));
    dmdados.qrclientes.Active := True;
  end
  else
  begin
    {AÇÃO DE BUSCAR CLIENTE POR NOME}
    dmdados.qrclientes.Close;
    dmdados.qrclientes.SQL.Clear;
    dmdados.qrclientes.SQL.Add('select A.codigo, A.nome, B.descricao AS Cidade, C.descricao AS Estado from clientes A left join cidade B on B.codigo = A.cod_cidade left join estado C on C.codigo = B.cod_uf where A.nome like ' + QuotedStr('%'+ nome + '%') + ' limit 1');
    dmdados.qrclientes.Active := True;
  end;

  if dmdados.qrclientes.RecordCount > 0 then
  begin
    if (tipo = 2) or (tipo = 3) then edtcodcliente.Text := dmdados.qrclientes.FieldByName('codigo').Text;
    edtnomecliente.Text := dmdados.qrclientes.FieldByName('nome').Text;
    lblcidade.Caption := dmdados.qrclientes.FieldByName('Cidade').Text + ' / ' + dmdados.qrclientes.FieldByName('Estado').Text;
    lblcidade.Visible := True;
    edtcodproduto.Enabled := True;
    edtqtdproduto.Enabled := True;
    edtvalorproduto.Enabled := True;
    edtcodproduto.SetFocus;
  end
  else
  begin
    ShowMessage('Cliente não Encontrado!');
    edtcodcliente.Clear;
    edtnomecliente.Clear;
    lblcidade.Visible := False;
    edtcodcliente.SetFocus;
  end;

end;

procedure Tfprincipal.buscarprodutos(codigo: Integer);
begin
  {AÇÃO DE BUSCAR PRODUTOS}
  dmdados.qrprodutos.Close;
  dmdados.qrprodutos.SQL.Clear;
  dmdados.qrprodutos.SQL.Add('select codigo, descricao, preco from produtos where codigo = ' + IntToStr(codigo));
  dmdados.qrprodutos.Active := True;

  if dmdados.qrprodutos.RecordCount > 0 then
  begin
    edtnomeproduto.Text := dmdados.qrprodutos.FieldByName('descricao').Text;
    edtvalorproduto.Text := FloatToStr(dmdados.qrprodutos.FieldByName('preco').AsFloat);
    edtqtdproduto.Text := '1';
    edtqtdproduto.SetFocus;
  end
  else
  begin
    ShowMessage('Produto não Cadastrado!');
    edtcodproduto.Clear;
    edtnomeproduto.Clear;
    edtvalorproduto.Clear;
    edtqtdproduto.Clear;
    edtcodproduto.SetFocus;
  end;
end;

procedure Tfprincipal.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {AÇÃO PARA DELETAR PRODUTO DO PEDIDO (GRID)}
  if key = vk_delete then
  begin

    if Application.messageBox('Deseja Excluir o Item Selecionado?','Excluir', mb_yesno + mb_defbutton2) = idYes then
    dmdados.dsprodutos.Delete;
    valortotal(1);
  end;

end;

procedure Tfprincipal.btnbuscapedidocancClick(Sender: TObject);
begin
  Fbusca.tipo_busca := 3;
  Fbusca.Show;
end;

procedure Tfprincipal.btnbuscapedidoClick(Sender: TObject);
begin
  Fbusca.tipo_busca := 2;
  Fbusca.Show;
end;

procedure Tfprincipal.btnbuscarClick(Sender: TObject);
begin
  Fbusca.tipo_busca := 1;
  Fbusca.Show;
end;

procedure Tfprincipal.edtcodclienteDblClick(Sender: TObject);
begin
  Fbusca.Show;
end;

procedure Tfprincipal.edtcodclienteExit(Sender: TObject);
begin
  if edtcodcliente.Text <> '' then
  begin
    buscarclientes(StrToInt(edtcodcliente.Text),1,'');
    btnbuscapedido.Visible := False;
    btnbuscapedidocanc.Visible := False;
  end;
end;

procedure Tfprincipal.edtcodclienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  begin
    edtcodclienteExit(Sender);
  end;
end;

procedure Tfprincipal.edtcodprodutoExit(Sender: TObject);
begin
  if edtcodproduto.Text <> '' then
  begin
    buscarprodutos(StrToInt(edtcodproduto.Text));
  end;
  btninserir.Caption := 'Inserir';
end;

procedure Tfprincipal.edtcodprodutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    edtcodprodutoExit(Sender);
  end;
end;

procedure Tfprincipal.edtnomeclienteDblClick(Sender: TObject);
begin
  Fbusca.Show;
end;

procedure Tfprincipal.edtnomeclienteExit(Sender: TObject);
begin
  if edtcodcliente.Text = '' then
  begin
    if edtnomecliente.Text <> '' then
    begin
      buscarclientes(0,2,edtnomecliente.Text);
    end;
  end;

end;

procedure Tfprincipal.edtqtdprodutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    btninserirClick(Sender);
  end;
end;

procedure Tfprincipal.FormShow(Sender: TObject);
begin
  total := 0;
  edtcodcliente.SetFocus;
end;

procedure Tfprincipal.limpaitens(tipo: Integer);
begin
  {AÇÃO DE LIMPAR OS CAMPOS DA TELA}
  if tipo = 1 then
  begin
    edtcodproduto.Clear;
    edtnomeproduto.Clear;
    edtqtdproduto.Clear;
    edtvalorproduto.Clear;
    edtcodproduto.SetFocus;
  end
  else
  if tipo = 2 then
  begin
    edtcodcliente.Clear;
    edtnomecliente.Clear;
    lblcidade.Caption := '';
    lblcidade.Visible := False;
    edtcodcliente.SetFocus;
  end
  else
  if tipo = 3 then
  begin
    edtcodcliente.Enabled := False;
    edtnomecliente.Enabled := False;
    btnbuscar.Enabled := False;
    edtcodproduto.Enabled := False;
    edtnomeproduto.Enabled := False;
    edtqtdproduto.Enabled := False;
    edtvalorproduto.Enabled := False;
    btninserir.Enabled := False;
    btngravar.Enabled := False;
  end
  else
  if tipo = 4 then
  begin
    edtcodcliente.Enabled := False;
    edtnomecliente.Enabled := False;
    btnbuscar.Enabled := False;
    edtcodproduto.Enabled := False;
    edtnomeproduto.Enabled := False;
    edtqtdproduto.Enabled := False;
    edtvalorproduto.Enabled := False;
    btninserir.Enabled := False;
    btngravar.Enabled := True;
    btngravar.Caption := 'Cancelar Pedido';
  end
  else
  if tipo = 5 then
  begin
    edtcodcliente.Enabled := True;
    edtnomecliente.Enabled := True;
    btnbuscar.Enabled := True;
    edtcodproduto.Enabled := True;
    edtnomeproduto.Enabled := True;
    edtqtdproduto.Enabled := True;
    edtvalorproduto.Enabled := True;
    btninserir.Enabled := True;
    btngravar.Enabled := True;
    btngravar.Caption := 'Encerrar Pedido';
    lbltotal.Caption := '';
  end;

end;

procedure Tfprincipal.valortotal(tipo: Integer);
begin
    {CALCULAR O VALOR TOTAL DE ACORDO COM A OPÇÃO}
    total := 0;
    {1 - TOTAL DOS ITENS INSERIDOS EM NOVO PEDIDO
     2 - TOTAL DOS ITENS DE UM PEDIDO EXISTENTE
     3 - TOTAL DOS ITENS DE UM PEDIDO QUE SERÁ CANCELADO}

    if tipo = 1 then
    begin
      dmdados.dsprodutos.First;
      while not dmdados.dsprodutos.Eof do
      begin
        total := total + dmdados.dsprodutos.FieldByName('valor_total').AsFloat;
        dmdados.dsprodutos.Next;
      end;
    end
    else
    if tipo = 2 then
    begin
      dmdados.qrpedidosdetalhe.First;
      while not dmdados.qrpedidosdetalhe.Eof do
      begin
        total := total + dmdados.qrpedidosdetalhe.FieldByName('valor_total').AsFloat;
        dmdados.qrpedidosdetalhe.Next;
      end;
    end
    else
    if tipo = 3 then
    begin
      dmdados.dsprodutos.First;
      while not dmdados.dsprodutos.Eof do
      begin
        total := total + dmdados.dsprodutos.FieldByName('valor_total').AsFloat;
        dmdados.dsprodutos.Next;
      end;
    end;

    lbltotal.Caption := FloatToStr(total);

  
end;

end.
