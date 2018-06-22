DROP PROCEDURE Processos;
DELIMITER //

CREATE PROCEDURE Processos(IN cpf INT)

BEGIN

  -- SELECT COUNT(*) FROM 
    -- (SELECT Processos_Numero FROM Processos_has_Presidente pres WHERE Presidente_CPF = cpf
      -- UNION ALL
     -- SELECT Processos_Numero FROM Processos_has_Senador    sen  WHERE Senador_CPF    = cpf) p;


  SELECT COUNT(DISTINCT Processos_Numero) AS Processos FROM 
    (SELECT Processos_Numero FROM Processos_has_DeputadoEstadual  dep_est WHERE DeputadoEstadual_CPF = cpf
      UNION ALL
     SELECT Processos_Numero FROM Processos_has_DeputadoFederal   dep_est WHERE DeputadoFederal_CPF  = cpf
      UNION ALL
     SELECT Processos_Numero FROM Processos_has_Governador        gov     WHERE Governador_CPF       = cpf
      UNION ALL
     SELECT Processos_Numero FROM Processos_has_Prefeito          pref    WHERE Prefeito_CPF         = cpf
      UNION ALL
     SELECT Processos_Numero FROM Processos_has_Presidente        pres    WHERE Presidente_CPF       = cpf
      UNION ALL
     SELECT Processos_Numero FROM Processos_has_Senador           sen     WHERE Senador_CPF          = cpf
      UNION ALL
     SELECT Processos_Numero FROM Processos_has_Vereador          ver     WHERE Vereador_CPF         = cpf) p;


END //
DELIMITER ;

