DROP PROCEDURE Processos;
DELIMITER //

CREATE PROCEDURE Processos(IN cpf INT)

BEGIN

  -- SELECT COUNT(*) FROM 
    -- (SELECT Processos_Numero FROM Processos_has_Presidente pres WHERE Presidente_CPF = cpf
      -- UNION ALL
     -- SELECT Processos_Numero FROM Processos_has_Senador    sen  WHERE Senador_CPF    = cpf) p;


  SELECT COUNT(DISTINCT Processos_Numero) AS Processos FROM 
    (SELECT Processos_Numero FROM PROCESSOS_DEP_EST     dep_est WHERE DeputadoEstadual_CPF = cpf
      UNION ALL
     SELECT Processos_Numero FROM PROCESSOS_DEP_FED     dep_est WHERE DeputadoFederal_CPF  = cpf
      UNION ALL
     SELECT Processos_Numero FROM PROCESSOS_GOVERNADOR  gov     WHERE Governador_CPF       = cpf
      UNION ALL
     SELECT Processos_Numero FROM PROCESSOS_PREFEITO    pref    WHERE Prefeito_CPF         = cpf
      UNION ALL
     SELECT Processos_Numero FROM PROCESSOS_PRESIDENTE  pres    WHERE Presidente_CPF       = cpf
      UNION ALL
     SELECT Processos_Numero FROM PROCESSOS_SENADOR     sen     WHERE Senador_CPF          = cpf
      UNION ALL
     SELECT Processos_Numero FROM PROCESSOS_VEREADOR    ver     WHERE Vereador_CPF         = cpf) p;


END //
DELIMITER ;

