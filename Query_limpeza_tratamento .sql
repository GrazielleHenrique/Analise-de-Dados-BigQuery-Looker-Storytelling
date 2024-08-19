-- Verificando a base de dados 
SELECT * FROM `crimes-sp-432213.crimes_sp.crimes-sp`; 

-- COUNT para contar quantas variáveis são nulas na coluna 'string_field_0'
SELECT COUNT(*) 
FROM `crimes-sp-432213.crimes_sp.crimes-sp` 
  WHERE `string_field_0` IS NULL;

-- Estruturando os dados do arquivo CSV em colunas.
-- CREATE OR REPLACE TABLE é utilizado para atualizar a base de dados existente.
-- WITH é empregado para criar uma tabela intermediária.
-- REPLACE remove os pontos decimais dos valores numéricos.
-- SPLIT divide a coluna `string_field_0` em várias colunas, usando o ponto e vírgula como delimitador (;).
-- ROW_NUMBER() OVER() atribui um número sequencial a cada linha da base de dados.
CREATE OR REPLACE TABLE `crimes-sp-432213.crimes_sp.crimes-sp-tratada` AS (SELECT *,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(0)] AS `Delegacia`,
    REPLACE(SPLIT(`string_field_0`, ';')[SAFE_OFFSET(1)], '.','') AS `Furto na regiao temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(2)] AS `Roubo de carga temporario`,
    REPLACE(SPLIT(`string_field_0`, ';')[SAFE_OFFSET(3)], '.','') AS `Roubo temporario`,
    REPLACE(SPLIT(`string_field_0`, ';')[SAFE_OFFSET(4)], '.','') AS `Roubo de Veiculo temporario`,
    REPLACE(SPLIT(`string_field_0`, ';')[SAFE_OFFSET(5)], '.','') AS `Furto de veiculo temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(6)] AS `Latrocinio temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(7)] AS `Homicidio Doloso por acidente de transito temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(8)] AS `Homicidio Culposo por acidente de Transito temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(9)] AS `Homicidio Culposo temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(10)] AS `Tentativa de Homicidio temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(11)] AS `Lesao Corporal seguida de morte temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(12)] AS `Lesao Corporal Dolosa temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(13)] AS `Lesao Corporal Culposa por acidente de transito temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(14)] AS `Lesao Corporal Culposa temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(15)] AS `Estupro temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(16)] AS `Estupro de vulneravel temporario`,
    REPLACE(SPLIT(`string_field_0`, ';')[SAFE_OFFSET(17)], '.','') AS `Roubo de veiculos temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(18)] AS `Roubo a Banco temporario`,
    SPLIT(`string_field_0`, ';')[SAFE_OFFSET(19)] AS `Ano temporario`,
    ROW_NUMBER() OVER() AS `numero linha`
  FROM `crimes-sp-432213.crimes_sp.crimes-sp`)

-- Verificando se a tabela foi criada corretamente e contém dados.
SELECT * FROM `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- CAST converte dados de STRING para INT64.
-- + é usado para somar valores de colunas que possuem dados duplicados (como Roubo de veículos).
-- WHERE aplica um filtro para incluir apenas as linhas desejadas na consulta, ignorando a primeira linha.
CREATE OR REPLACE TABLE `crimes-sp-432213.crimes_sp.crimes-sp-tratada` AS
SELECT 
  `Delegacia`,
  CAST(`Furto na regiao temporario` AS INT64) AS `Furto`,
  CAST(`Roubo de carga temporario` AS INT64) AS `Roubo de carga`,
  CAST(`Roubo temporario` AS INT64) AS `Roubo`,
  CAST(`Roubo de Veiculo temporario` AS INT64) + CAST(`Roubo de veiculos temporario` AS INT64) AS `Roubo de veiculos`,
  CAST(`Furto de veiculo temporario` AS INT64) AS `Furto de veiculo`,
  CAST(`Latrocinio temporario` AS INT64) AS `Latrocinio`,
  CAST(`Homicidio Doloso por acidente de transito temporario` AS INT64) AS `Homicidio Doloso por acidente de transito`,
  CAST(`Homicidio Culposo por acidente de Transito temporario` AS INT64) AS `Homicidio Culposo por acidente de Transito`,
  CAST(`Homicidio Culposo temporario` AS INT64) AS `Homicidio Culposo`,
  CAST(`Tentativa de Homicidio temporario` AS INT64) AS `Tentativa de Homicidio`,
  CAST(`Lesao Corporal seguida de morte temporario` AS INT64) AS `Lesao Corporal seguida de morte`,
  CAST(`Lesao Corporal Dolosa temporario` AS INT64) AS `Lesao Corporal Dolosa`,
  CAST(`Lesao Corporal Culposa por acidente de transito temporario` AS INT64) AS `Lesao Corporal Culposa por acidente de transito`,
  CAST(`Lesao Corporal Culposa temporario` AS INT64) AS `Lesao Corporal Culposa`,
  CAST(`Estupro temporario` AS INT64) AS `Estupro`,
  CAST(`Estupro de vulneravel temporario` AS INT64) AS `Estupro de vulneravel`,
  CAST(`Roubo a Banco temporario` AS INT64) AS `Roubo a Banco`,
  CAST(`Ano temporario` AS INT64) AS `Ano`
FROM `crimes-sp-432213.crimes_sp.crimes-sp-tratada`
WHERE `numero linha` >1;

-- COUNT para contar a quantidade de Delegacias presentes na base.
SELECT COUNT(`Delegacia`) 
FROM `crimes-sp-432213.crimes_sp.crimes-sp-tratada`
WHERE Delegacia IS NOT NULL;

-- COUNT para contar a quantidade de Delegacias presentes na base por ano.
SELECT Ano,
  COUNT(DISTINCT `Delegacia`) AS `Quantidade Delegacias Ano`
FROM `crimes-sp-432213.crimes_sp.crimes-sp-tratada` 
GROUP BY Ano;

-- SUM para contar a quantidade Total dos crimes presentes na base por ano.
SELECT
  `Ano`,
  SUM(ROUND(`Furto`)) AS `Total Furto`,
  SUM(ROUND(`Roubo de carga`)) AS `Total Roubo de carga`,
  SUM(ROUND(`Roubo`)) AS `Total Roubo`,
  SUM(ROUND(`Roubo de veiculos`)) AS `Total Roubo de veiculos`,
  SUM(ROUND(`Furto de veiculo`)) AS `Total Furto de veiculo`,
  SUM(ROUND(`Latrocinio`)) AS `Total Latrocinio`,
  SUM(ROUND(`Homicidio Doloso por acidente de transito`)) AS `Total Homicidio Doloso por acidente de transito`,
  SUM(ROUND(`Homicidio Culposo por acidente de Transito`)) AS `Total Homicidio Culposo por acidente de Transito`,
  SUM(ROUND(`Homicidio Culposo`)) AS `Total Homicidio Culposo`,
  SUM(ROUND(`Tentativa de Homicidio`)) AS `Total Tentativa de Homicidio`,
  SUM(ROUND(`Lesao Corporal seguida de morte`)) AS `Total Lesao Corporal seguida de morte`,
  SUM(ROUND(`Lesao Corporal Dolosa`)) AS `Total Lesao Corporal Dolosa`,
  SUM(ROUND(`Lesao Corporal Culposa por acidente de transito`)) AS `Total Lesao Corporal Culposa por acidente de transito`,
  SUM(ROUND(`Lesao Corporal Culposa`)) AS `Total Lesao Corporal Culposa`,
  SUM(ROUND(`Estupro`)) AS `Total Estupro`,
  SUM(ROUND(`Estupro de vulneravel`)) AS `Total Estupro de vulneravel`,
  SUM(ROUND(`Roubo a Banco`)) AS `Total Roubo a Banco`
FROM `crimes-sp-432213.crimes_sp.crimes-sp-tratada` 
GROUP BY `Ano`;

-- Separando as tabelas por ano
-- 2019
CREATE OR REPLACE TABLE `crimes-sp-432213.crimes_sp.crimes-sp-tratada-2019`
AS
SELECT *
FROM `crimes-sp-432213.crimes_sp.crimes-sp-tratada`
WHERE `Ano` = 2019;

-- 2020 
CREATE OR REPLACE TABLE `crimes-sp-432213.crimes_sp.crimes-sp-tratada-2020`
AS
SELECT *
FROM `crimes-sp-432213.crimes_sp.crimes-sp-tratada`
WHERE `Ano` = 2020;