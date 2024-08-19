-- Verificando a tabela de dados.
SELECT * FROM `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Selecionando dados por crimes:

-- Furtos (máximo e média)
SELECT
  MAX(Furto) AS `Max Furto`,
  AVG(Furto) AS `Med Furto`,
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Roubo de Carga (máximo e média)
SELECT
  MAX(`Roubo de carga`) AS `Max Roubo de carga`,
  AVG(`Roubo de carga`) AS `Med Roubo de carga`,
FROM `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;
 
-- Roubos (máximo e média)
SELECT
  MAX(Roubo) AS `Max Roubo`,
  AVG(Roubo) AS `Med Roubo`,
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Roubo de Veículos (máximo e média)
SELECT
  MAX(`Roubo de veiculos`) AS `Max Roubo de veiculos`,
  AVG(`Roubo de veiculos`) AS `Med Roubo de veiculos`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Furto de Veículo (máximo e média)
SELECT
  MAX(`Furto de veiculo`) AS `Max Furto de veiculo`,
  AVG(`Furto de veiculo`) AS `Med Furto de veiculo`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;
 
-- Latrocínio (máximo e média)
SELECT
  MAX(Latrocinio) AS `Max Latrocinio`,
  AVG(Latrocinio) AS `Med Latrocinio`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Homicídio Doloso por Acidente de Trânsito (máximo e média)
SELECT
  MAX(`Homicidio Doloso por acidente de transito`) AS `Max Homicidio Doloso por acidente de transito`,
  AVG(`Homicidio Doloso por acidente de transito`) AS `Med Homicidio Doloso por acidente de transito`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Homicídio Culposo por Acidente de Trânsito (máximo e média)
SELECT
  MAX(`Homicidio Culposo por acidente de Transito`) AS `Max Homicidio Culposo por acidente de Transito`,
  AVG(`Homicidio Culposo por acidente de Transito`) AS `Med Homicidio Culposo por acidente de Transito`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Homicídio Culposo (máximo e média)
SELECT
  MAX(`Homicidio Culposo`) AS `Max Homicidio Culposo`,
  AVG(`Homicidio Culposo`) AS `Med Homicidio Culposo`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Tentativa de Homicídio (máximo e média)
SELECT
  MAX(`Tentativa de Homicidio`) AS `Max Tentativa de Homicidio`,
  AVG(`Tentativa de Homicidio`) AS `Med Tentativa de Homicidio`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Lesão Corporal Seguida de Morte (máximo e média)
SELECT
  MAX(`Lesao Corporal seguida de morte`) AS `Max Lesao Corporal seguida de morte`,
  AVG(`Lesao Corporal seguida de morte`) AS `Med Lesao Corporal seguida de morte`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Lesão Corporal Dolosa (máximo e média)
SELECT
  MAX(`Lesao Corporal Dolosa`) AS `Max Lesao Corporal Dolosa`,
  AVG(`Lesao Corporal Dolosa`) AS `Med Lesao Corporal Dolosa`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Lesão Corporal Culposa por Acidente de Trânsito (máximo e média)
SELECT
  MAX(`Lesao Corporal Culposa por acidente de transito`) AS `Max Lesao Corporal Culposa por acidente de transito`,
  AVG(`Lesao Corporal Culposa por acidente de transito`) AS `Med Lesao Corporal Culposa por acidente de transito`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Lesão Corporal Culposa (máximo e média)
SELECT
  MAX(`Lesao Corporal Culposa`) AS `Max Lesao Corporal Culposa`,
  AVG(`Lesao Corporal Culposa`) AS `Med Lesao Corporal Culposa`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Estupro (máximo e média)
SELECT
  MAX(`Estupro`) AS `Max Estupro`,
  AVG(`Estupro`) AS `Med Estupro`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Estupro de Vulnerável (máximo e média)
SELECT
  MAX(`Estupro de vulneravel`) AS `Max Estupro de vulneravel`,
  AVG(`Estupro de vulneravel`) AS `Med Estupro de vulneravel`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;

-- Roubo a Banco (máximo e média)
SELECT
  MAX(`Roubo a Banco`) AS `Max Roubo a Banco`,
  AVG(`Roubo a Banco`) AS `Med Roubo a Banco`
FROM
  `crimes-sp-432213.crimes_sp.crimes-sp-tratada`;