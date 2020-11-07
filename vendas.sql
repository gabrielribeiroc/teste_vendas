-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 07/11/2020 às 04:22
-- Versão do servidor: 10.3.25-MariaDB
-- Versão do PHP: 5.6.40

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas`
--
CREATE DATABASE IF NOT EXISTS `vendas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `vendas`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `cod_uf` int(11) DEFAULT NULL COMMENT 'Relaciona com o campo codigo da tabela estados',
  `status` varchar(1) DEFAULT 'A' COMMENT 'A = Ativo\\nI = Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `cidade`
--

INSERT INTO `cidade` (`codigo`, `descricao`, `cod_uf`, `status`) VALUES
(3300407, 'Barra Mansa', 33, 'A'),
(3300704, 'Cabo Frio', 33, 'A'),
(3301702, 'Duque de Caxias', 33, 'A'),
(3304557, 'Rio de Janeiro', 33, 'A'),
(3304904, 'São Gonçalo', 33, 'A'),
(3500808, 'Alfredo Marcondes', 35, 'A'),
(3506003, 'Bauru', 35, 'A'),
(3510500, 'Caraguatatuba', 35, 'A'),
(3520400, 'Ilhabela', 35, 'A'),
(3550704, 'São Sebastião', 35, 'A'),
(4103453, 'Cafelândia', 41, 'A'),
(4104808, 'Cascavel', 41, 'A'),
(4106902, 'Curitiba', 41, 'A'),
(4107520, 'Esperança Nova', 41, 'A'),
(4108809, 'Guaíra', 41, 'A'),
(4202008, 'Balneário Camboriú', 42, 'A'),
(4202404, 'Blumenau', 42, 'A'),
(4204202, 'Chapecó', 42, 'A'),
(4204608, 'Criciúma', 42, 'A'),
(4208203, 'Itajaí', 42, 'A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cod_cidade` int(11) DEFAULT NULL COMMENT 'relaciona com codigo da tabela cidade',
  `status` varchar(1) DEFAULT 'A' COMMENT 'A = Ativo\\nI = Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`codigo`, `nome`, `cod_cidade`, `status`) VALUES
(1, 'Vítor Conde Filgueiras', 3300407, 'A'),
(2, 'Eduard Anes Salgueiro', 3300704, 'A'),
(3, 'Lorenzo Matias Peralta', 3301702, 'A'),
(4, 'Luke Canhão Sabala', 3304557, 'A'),
(5, 'Kira Milheirão Sardo', 3304904, 'A'),
(6, 'Tainara Quinteiro Mirandela', 3500808, 'A'),
(7, 'Sara Teodoro Santos', 3500808, 'A'),
(8, 'Mariano Caminha Almeida', 3506003, 'A'),
(9, 'Arman Barros Robalinho', 3510500, 'A'),
(10, 'Gabrielly Penteado Gentil', 3510500, 'A'),
(11, 'Graça Gusmão Lopes', 3520400, 'A'),
(12, 'Klara Telinhos Queirós', 3520400, 'A'),
(13, 'Angela Castelhano Palhares', 3550704, 'A'),
(14, 'Matthias Aires Taveiros', 3550704, 'A'),
(15, 'Alisha Gadelha Couto', 3550704, 'A'),
(16, 'Ruben Goulart Remígio', 4103453, 'A'),
(17, 'Luana Vidigal Feijó', 4104808, 'A'),
(18, 'Samuel Penha Álvaro', 4106902, 'A'),
(19, 'Angélico Simão Coutinho', 4107520, 'A'),
(20, 'Sónia Colaço Rebouças', 4108809, 'A'),
(21, 'Ângela Félix Falcão', 4202008, 'A'),
(22, 'Andrei Cachão Anhaia', 4202404, 'A'),
(23, 'Naomi Parracho Carvalhal', 4204202, 'A'),
(24, 'Dylan Arantes Parafita', 4204608, 'A'),
(25, 'Ticiana Frajuca Valério', 4208203, 'A'),
(26, 'Mélanie Vidal Quental', 3300407, 'A'),
(27, 'Mafalda Guterres Camarinho', 3304557, 'A'),
(28, 'Simara Serro Filgueiras', 3304557, 'A'),
(29, 'Eder Vilhena Domingos', 3300704, 'A'),
(30, 'Jadir Medeiros Leão', 3300704, 'A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `status` varchar(1) DEFAULT 'A' COMMENT 'A = Ativo\\nI = Inativo\\n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `estado`
--

INSERT INTO `estado` (`codigo`, `descricao`, `status`) VALUES
(33, 'Rio de Janeiro', 'A'),
(35, 'São Paulo', 'A'),
(41, 'Parana', 'A'),
(42, 'Santa Catarina', 'A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `num_pedido` int(11) NOT NULL,
  `data_emissao` datetime DEFAULT current_timestamp(),
  `cod_cliente` int(11) DEFAULT NULL COMMENT 'relaciona o codigo da tabela clientes',
  `val_total` decimal(10,2) DEFAULT NULL,
  `status` varchar(1) DEFAULT 'A' COMMENT 'A = Ativo\\nI = Inativo\\n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`num_pedido`, `data_emissao`, `cod_cliente`, `val_total`, `status`) VALUES
(12, '2020-11-06 23:30:31', 1, '50.50', 'A'),
(16, '2020-11-07 00:27:32', 1, '2578.00', 'A'),
(17, '2020-11-07 00:31:28', 1, '50.50', 'A'),
(18, '2020-11-07 02:56:59', 1, '1815.80', 'A'),
(20, '2020-11-07 03:07:38', 1, '22.00', 'A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_detalhe`
--

CREATE TABLE `pedido_detalhe` (
  `codigo` int(11) NOT NULL,
  `num_pedido` int(11) NOT NULL COMMENT 'relaciona com o campo num_pedido da tabela pedidos',
  `cod_produto` int(11) DEFAULT NULL COMMENT 'relaciona com o codigo da tabela produtos',
  `quantidade` decimal(10,0) DEFAULT NULL,
  `valor_unitario` decimal(10,0) DEFAULT NULL,
  `valor_total` decimal(10,0) DEFAULT NULL,
  `status` varchar(1) DEFAULT 'A' COMMENT 'A = Ativo\\nI = Inativo\\n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `pedido_detalhe`
--

INSERT INTO `pedido_detalhe` (`codigo`, `num_pedido`, `cod_produto`, `quantidade`, `valor_unitario`, `valor_total`, `status`) VALUES
(21, 12, 2, '1', '22', '22', 'A'),
(22, 12, 1, '1', '29', '29', 'A'),
(29, 16, 2, '1', '22', '22', 'A'),
(30, 16, 5, '1', '2556', '2556', 'A'),
(31, 17, 2, '1', '22', '22', 'A'),
(32, 17, 1, '1', '29', '29', 'A'),
(33, 18, 2, '1', '22', '22', 'A'),
(34, 18, 2, '5', '22', '110', 'A'),
(35, 18, 3, '1', '39', '39', 'A'),
(36, 18, 4, '7', '235', '1645', 'A'),
(39, 20, 2, '1', '22', '22', 'A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `status` varchar(1) DEFAULT 'A' COMMENT 'A = Ativo\\nI = Inativo\\n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`codigo`, `descricao`, `preco`, `status`) VALUES
(1, 'Pendrive 8gb', '28.50', 'A'),
(2, 'Mouse USB', '22.00', 'A'),
(3, 'Teclado USB', '38.80', 'A'),
(4, 'Cadeira', '235.00', 'A'),
(5, 'Notebook', '2556.00', 'A'),
(6, 'HD Externo', '120.00', 'A'),
(7, 'SSD 120GB', '230.00', 'A'),
(8, 'Monitor 19 Polegadas', '650.00', 'A'),
(9, 'Memória DDR4', '299.00', 'A'),
(10, 'Fonte ATX', '80.00', 'A'),
(11, 'Gabinete Gamer', '143.00', 'A'),
(12, 'Suporte Notebook', '89.90', 'A'),
(13, 'Case para HD', '35.00', 'A'),
(14, 'Fone de Ouvido', '175.00', 'A'),
(15, 'Cabo HDMI', '47.90', 'A'),
(16, 'WebCam', '139.90', 'A'),
(17, 'Cabo USB-C', '35.00', 'A'),
(18, 'Roteador Gigabit', '234.00', 'A'),
(19, 'Acces Point Wireless', '180.00', 'A'),
(20, 'Adaptador de rede Ethernet', '55.00', 'A'),
(21, 'Mochila para Notebook', '133.90', 'A'),
(22, 'Cartão de Memória', '34.00', 'A');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`num_pedido`);

--
-- Índices de tabela `pedido_detalhe`
--
ALTER TABLE `pedido_detalhe`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_pedido` (`num_pedido`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `num_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `pedido_detalhe`
--
ALTER TABLE `pedido_detalhe`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pedido_detalhe`
--
ALTER TABLE `pedido_detalhe`
  ADD CONSTRAINT `fk_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`num_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
