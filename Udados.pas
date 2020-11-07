unit Udados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient;

type
  Tdmdados = class(TDataModule)
    connVendas: TFDConnection;
    qrgeral: TFDQuery;
    qrprodutos: TFDQuery;
    qrclientes: TFDQuery;
    qrupdate: TFDQuery;
    qrdelete: TFDQuery;
    dtsprodutos: TDataSource;
    dsclientes: TDataSource;
    dsprodutos: TClientDataSet;
    cod_cliente: TIntegerField;
    valor_total: TFloatField;
    cod_produto: TIntegerField;
    quantidade: TFloatField;
    valor_unit: TFloatField;
    descricao: TStringField;
    qrinsertpedido: TFDQuery;
    qrinsertpedidodetalhe: TFDQuery;
    qrpedidos: TFDQuery;
    dsbuscapedido: TDataSource;
    dsbuscapedidodetalhe: TDataSource;
    qrpedidosdetalhe: TFDQuery;
    qrdeletapedido: TFDQuery;
    qrdeletapedidodetalhe: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdados: Tdmdados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
