-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql101.infinityfree.com
-- Tempo de geração: 15-Jun-2026 às 11:59
-- Versão do servidor: 11.4.12-MariaDB
-- versão do PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `if0_42014818_ignisshield`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alertas`
--

CREATE TABLE `alertas` (
  `id` int(11) NOT NULL,
  `sensor` varchar(100) DEFAULT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `mensagem` text DEFAULT NULL,
  `nivel` varchar(50) DEFAULT NULL,
  `data_alerta` datetime DEFAULT current_timestamp(),
  `estado` varchar(50) DEFAULT 'ativo',
  `rua` varchar(255) DEFAULT NULL,
  `porta` varchar(50) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `sensor_id` int(11) DEFAULT NULL,
  `id_utilizador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `alertas`
--

INSERT INTO `alertas` (`id`, `sensor`, `localizacao`, `tipo`, `mensagem`, `nivel`, `data_alerta`, `estado`, `rua`, `porta`, `referencia`, `sensor_id`, `id_utilizador`) VALUES
(1, 'Sensor Fumo 01', 'Lisboa - Piso 2', 'Incêndio', 'Foi detetado fumo excessivo na área do servidor.', 'critico', '2026-05-25 03:28:13', 'bombeiros_enviados', NULL, NULL, NULL, NULL, 1),
(2, 'Sensor Fumo A1', 'Laboratório', 'Incêndio', 'Fumo excessivo detetado no laboratório.', 'critico', '2026-05-25 03:31:50', 'bombeiros_enviados', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `freguesias`
--

CREATE TABLE `freguesias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sensores`
--

CREATE TABLE `sensores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `freguesia` varchar(100) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  `id_utilizador` int(11) NOT NULL,
  `zona` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `sensores`
--

INSERT INTO `sensores` (`id`, `nome`, `tipo`, `freguesia`, `estado`, `criado_em`, `id_utilizador`, `zona`) VALUES
(10, 'sdsdsds', '', 'Lumiar', 'ALERTA', '2026-05-28 10:37:06', 0, NULL),
(11, 'Sensor 00', '', 'Porto', 'Online', '2026-05-28 10:55:30', 4, NULL),
(12, 'Sensor 00', '', 'Porto', 'Online', '2026-05-28 10:55:34', 4, NULL),
(13, 'sdsdsds', '', 'Cascais', 'Online', '2026-05-28 10:57:48', 4, NULL),
(14, 'sdsdsds', '', 'Cascais', 'Online', '2026-05-28 10:57:53', 4, NULL),
(15, 'sdsdsds', '', 'Cascais', 'Online', '2026-05-28 10:57:58', 4, NULL),
(16, 'sdsdsds', '', 'Cascais', 'Online', '2026-05-28 10:58:18', 4, NULL),
(17, 'sdsdsds', '', 'Cascais', 'Online', '2026-05-28 10:58:20', 4, NULL),
(18, 'sdsdsds', '', 'Cascais', 'Online', '2026-05-28 10:59:54', 4, NULL),
(19, 'sdsdsds', '', 'Carnide', 'Online', '2026-05-28 11:41:03', 1, NULL),
(20, 'Sensor 00', '', 'Carnide', 'ALERTA', '2026-05-28 11:41:46', 2, NULL),
(21, 'Sensor Rua Aldeias de Cima Edifício jardim da fonte (Trofa)', '', 'Porto', 'Online', '2026-06-15 10:49:39', 21, NULL),
(22, 'Sensor Estádio da Luz', '', 'Benfica', 'ALERTA', '2026-06-15 10:50:07', 6, NULL),
(23, 'Rua Fonte de Eguas', '', 'Braga', 'ALERTA', '2026-06-15 13:32:03', 20, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `id` int(11) NOT NULL,
  `utilizador` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `perfil` enum('admin','user','tecnico') NOT NULL DEFAULT 'user',
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `ultimo_login` datetime DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  `senhaX` text NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expira` datetime DEFAULT NULL,
  `zona` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`id`, `utilizador`, `email`, `password`, `perfil`, `ativo`, `ultimo_login`, `criado_em`, `senhaX`, `reset_token`, `reset_expira`, `zona`) VALUES
(1, 'admin', 'admin@ignisshield.com', '$2y$10$lOcEJ3ExqmU6mov/svIyqOQQqBP/ElOS0YlVB.G3rRQFlkGA6iyny', 'admin', 1, '2026-06-15 08:05:34', '2026-05-25 13:33:16', '123456', NULL, NULL, NULL),
(5, 'Bombeiro_Alvalade', 'alvalade@ignisshield.pt', '$2y$10$65OZ8rBRB/ZQ0mfTnKmOROFgG4NCirMd6/l7MlH5qWKigJDs9YYsq', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Alvalade'),
(6, 'Bombeiro_Benfica', 'benfica@ignisshield.pt', '$2y$10$vVPwlosyTgy5CW8JEJGeL.yNm2ffDuCIwAFrpPmjSxS4PSwfDWtYu', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Benfica'),
(7, 'Bombeiro_Lumiar', 'lumiar@ignisshield.pt', '$2y$10$B8dcetQ04NgvBSQ/qQBZl.d7zsrmuO0lAp5KwRw5Xe5f7vqSVqRbK', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Lumiar'),
(8, 'Bombeiro_Carnide', 'carnide@ignisshield.pt', '$2y$10$IpmZA7mY32MWNXOENYZ1DuvYqAYIYdqOs/XEiBnW8fy/8R4JdVE7q', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Carnide'),
(9, 'Bombeiro_Campolide', 'campolide@ignisshield.pt', '$2y$10$tboXl89Y90HoLmRq6EZEoeyjP.C1W0neSm9/MgFJGjvhifp4zEQ4q', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Campolide'),
(10, 'Bombeiro_Marvila', 'marvila@ignisshield.pt', '$2y$10$a5w.H8q/RPafYzWl2mPQSeImfoDH0mPBkad4uW94qLuOvSSXI1myu', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Marvila'),
(11, 'Bombeiro_Olivais', 'olivais@ignisshield.pt', '$2y$10$x9LWap7GXr52ePLK0zReLubRPrT3iI53LZzpjjRVSbNGh47bGR0ly', '', 1, '2026-06-02 04:23:52', '2026-06-02 10:39:28', '123456', NULL, NULL, 'Olivais'),
(12, 'Bombeiro_ParqueNacoes', 'parque.nacoes@ignisshield.pt', '$2y$10$D2mczsemwY4nR504cHXlM.iLhdoQJScGse1auIGoqjqRYe232B7lG', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Parque das Nações'),
(13, 'Bombeiro_SantaClara', 'santaclara@ignisshield.pt', '$2y$10$Gx8R9XLZytGXli0MTgvnWemqsh8iLnfggkzR2gHAxPkvKaEwfEVD6', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Santa Clara'),
(14, 'Bombeiro_Ajuda', 'ajuda@ignisshield.pt', '$2y$10$Gm7JA15MQIOY70SwoCrTX.kPIDI003Nm6StyhcmOjtwliTpwK3v1a', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Ajuda'),
(15, 'Bombeiro_Alges', 'alges@ignisshield.pt', '$2y$10$QPKJhe9DPJl/3tZx2rH0wOVZtLUUmbi1dcKEjtJYdIfyvynh571UC', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Algés'),
(16, 'Bombeiro_Amadora', 'amadora@ignisshield.pt', '$2y$10$vZkWtTNWlc.7aZ.Mz5mCw.mKIKWciQzhPBY60lxP8OBQg/vpvbkHW', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Amadora'),
(17, 'Bombeiro_Sintra', 'sintra@ignisshield.pt', '$2y$10$FMTpoZzptAr9tcAj/TK96O2sgEMzVr29xQNeZq2N1ypNncrIya4xa', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Sintra'),
(18, 'Bombeiro_Cascais', 'cascais@ignisshield.pt', '$2y$10$9qsfj/oyMSzoffrs4EewlO9lKpSqeOSzuFUrpfj515iio0KFI.NJu', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Cascais'),
(19, 'Bombeiro_Oeiras', 'oeiras@ignisshield.pt', '$2y$10$mbd7vdRTMGxkPNQjtkAiGu4pdfx4yUuvk2ZA8GROQWjOm2OwWAf8e', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Oeiras'),
(20, 'Bombeiro_Braga', 'braga@ignisshield.pt', '$2y$10$TC4MEhBCnFSrBIzP.tszsum0Q21hVtxkUWj05Y8E5WcNhQ997P2ZG', '', 1, '2026-06-15 06:32:26', '2026-06-02 10:39:28', '123456', NULL, NULL, 'Braga'),
(21, 'Bombeiro_Porto', 'porto@ignisshield.pt', '$2y$10$maOkV9owE63yrY9QLxfyS.TfNIj5SIO394UbfIRUGZd1/WivalweS', '', 1, '2026-06-15 06:46:10', '2026-06-02 10:39:28', '123456', NULL, NULL, 'Porto'),
(22, 'Bombeiro_Coimbra', 'coimbra@ignisshield.pt', '$2y$10$kn.KImFuWLpjUnL7CN5sXOe9.dU9aq9HznaifUcLDLeWocfeV37Xe', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Coimbra'),
(23, 'Bombeiro_Faro', 'faro@ignisshield.pt', '$2y$10$t.2xtfSe9XIaOz0f2vJnl.v/G6Z3afgKrUe.8MTf0QboIfYoo1hLW', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Faro'),
(24, 'Bombeiro_Aveiro', 'aveiro@ignisshield.pt', '$2y$10$dnG5TLDPXNTH6Nc1rcvaZOVewUOufMnlWHfDmgpyoi2sX36dyNgc6', '', 1, NULL, '2026-06-02 10:39:28', '123456', NULL, NULL, 'Aveiro');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alertas`
--
ALTER TABLE `alertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sensor_id` (`sensor_id`);

--
-- Índices para tabela `freguesias`
--
ALTER TABLE `freguesias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sensores`
--
ALTER TABLE `sensores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_perfil` (`perfil`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alertas`
--
ALTER TABLE `alertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `freguesias`
--
ALTER TABLE `freguesias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sensores`
--
ALTER TABLE `sensores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
