CREATE VIEW MUNICIPIO_ESTADO AS
SELECT mun.Codigo AS CodMun, mun.Nome AS Municipio, est.Nome AS Estado, est.Codigo AS CodEst FROM MUNICIPIO AS mun
LEFT JOIN ESTADO AS est ON mun.Estado_Codigo = est.Codigo;

CREATE VIEW SEN_LOC_PROC AS
SELECT sen.Nome AS Senador, estado AS Estado, Delito, Juiz, Forum FROM MUNICIPIO_ESTADO AS mes
  RIGHT JOIN (SENADOR AS sen RIGHT JOIN (PROCESSOS AS pro
    RIGHT JOIN PROCESSOS_SENADOR AS phs ON pro.Numero = phs.Processos_Numero)
    ON sen.CPF = phs.Senador_CPF)
  ON mes.CodEst = sen.Estado_Codigo;

CREATE VIEW SEN_PROJ AS
SELECT sen.Nome AS Senador, estado AS Estado, Numero, Descricao, Data FROM MUNICIPIO_ESTADO AS mes
  RIGHT JOIN (SENADOR AS sen RIGHT JOIN (PROJETOS AS pro
    RIGHT JOIN PROJETOS_SENADOR AS pjs ON pro.Numero = pjs.Projetos_Numero)
    ON sen.CPF = pjs.Senador_CPF)
  ON mes.CodEst = sen.Estado_Codigo;
