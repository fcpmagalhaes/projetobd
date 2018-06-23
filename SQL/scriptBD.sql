CREATE DATABASE controleCandidatos;
USE controleCandidatos;

CREATE TABLE IF NOT EXISTS ESTADO (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Eleitores INT NOT NULL,
  Area INT NOT NULL,
  Populacao INT NOT NULL,
  PRIMARY KEY (Codigo));

CREATE TABLE IF NOT EXISTS MUNICIPIO (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Eleitores INT NOT NULL,
  Area INT NOT NULL,
  Populacao INT NOT NULL,
  Estado_Codigo INT NOT NULL,
  PRIMARY KEY (Codigo),
  INDEX fk_Municipio_Estado1_idx (Estado_Codigo ASC),
  CONSTRAINT fk_Municipio_Estado1
    FOREIGN KEY (Estado_Codigo)
    REFERENCES ESTADO (Codigo));


CREATE TABLE IF NOT EXISTS PARTIDO (
  Sigla VARCHAR(5) NOT NULL,
  Filiados INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Posicao VARCHAR(45) NOT NULL,
  Logo LONGBLOB,
  PRIMARY KEY (Sigla));


CREATE TABLE IF NOT EXISTS VEREADOR (
  Nome VARCHAR(25) NOT NULL,
  LocalNasc VARCHAR(45) NOT NULL,
  Sexo VARCHAR(1) NOT NULL,
  Escolaridade VARCHAR(45) NOT NULL,
  CPF INT(11) NOT NULL,
  Municipio_Codigo INT NOT NULL,
  Partido_Sigla VARCHAR(5) NOT NULL,
  PRIMARY KEY (CPF),
  INDEX fk_Vereador_Municipio1_idx (Municipio_Codigo ASC),
  INDEX fk_Vereador_Partido1_idx (Partido_Sigla ASC),
  CONSTRAINT fk_Vereador_Municipio1
    FOREIGN KEY (Municipio_Codigo)
    REFERENCES MUNICIPIO (Codigo),
  CONSTRAINT fk_Vereador_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES PARTIDO (Sigla));

CREATE TABLE IF NOT EXISTS PREFEITO (
  Nome VARCHAR(25) NOT NULL,
  LocalNasc VARCHAR(45) NOT NULL,
  Sexo VARCHAR(1) NOT NULL,
  Escolaridade VARCHAR(45) NOT NULL,
  CPF INT(11) NOT NULL,
  Municipio_Codigo INT NOT NULL,
  Partido_Sigla VARCHAR(5) NOT NULL,
  PRIMARY KEY (CPF),
  INDEX fk_Prefeito_Municipio1_idx (Municipio_Codigo ASC),
  INDEX fk_Prefeito_Partido1_idx (Partido_Sigla ASC),
  CONSTRAINT fk_Prefeito_Municipio1
    FOREIGN KEY (Municipio_Codigo)
    REFERENCES MUNICIPIO (Codigo)
,
  CONSTRAINT fk_Prefeito_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES PARTIDO (Sigla)
);

CREATE TABLE IF NOT EXISTS DEPUTADO_EST (
  Nome VARCHAR(25) NOT NULL,
  LocalNasc VARCHAR(45) NOT NULL,
  Sexo VARCHAR(1) NOT NULL,
  Escolaridade VARCHAR(45) NOT NULL,
  CPF INT(11) NOT NULL,
  Estado_Codigo INT NOT NULL,
  Partido_Sigla VARCHAR(5) NOT NULL,
  PRIMARY KEY (CPF),
  INDEX fk_DeputadoEstadual_Estado1_idx (Estado_Codigo ASC),
  INDEX fk_DeputadoEstadual_Partido1_idx (Partido_Sigla ASC),
  CONSTRAINT fk_DeputadoEstadual_Estado1
    FOREIGN KEY (Estado_Codigo)
    REFERENCES ESTADO (Codigo)
,
  CONSTRAINT fk_DeputadoEstadual_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES PARTIDO (Sigla)
);

CREATE TABLE IF NOT EXISTS DEPUTADO_FED (
  Nome VARCHAR(25) NOT NULL,
  LocalNasc VARCHAR(45) NOT NULL,
  Sexo VARCHAR(1) NOT NULL,
  Escolaridade VARCHAR(45) NOT NULL,
  CPF INT(11) NOT NULL,
  Estado_Codigo INT NOT NULL,
  Partido_Sigla VARCHAR(5) NOT NULL,
  PRIMARY KEY (CPF),
  INDEX fk_DeputadoFederal_Estado1_idx (Estado_Codigo ASC),
  INDEX fk_DeputadoFederal_Partido1_idx (Partido_Sigla ASC),
  CONSTRAINT fk_DeputadoFederal_Estado1
    FOREIGN KEY (Estado_Codigo)
    REFERENCES ESTADO (Codigo)
,
  CONSTRAINT fk_DeputadoFederal_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES PARTIDO (Sigla)
);

CREATE TABLE IF NOT EXISTS SENADOR (
  Nome VARCHAR(25) NOT NULL,
  LocalNasc VARCHAR(45) NOT NULL,
  Sexo VARCHAR(1) NOT NULL,
  Escolaridade VARCHAR(45) NOT NULL,
  CPF INT(11) NOT NULL,
  Estado_Codigo INT NOT NULL,
  Partido_Sigla VARCHAR(5) NOT NULL,
  PRIMARY KEY (CPF),
  INDEX fk_Senador_Estado1_idx (Estado_Codigo ASC),
  INDEX fk_Senador_Partido1_idx (Partido_Sigla ASC),
  CONSTRAINT fk_Senador_Estado1
    FOREIGN KEY (Estado_Codigo)
    REFERENCES ESTADO (Codigo)
,
  CONSTRAINT fk_Senador_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES PARTIDO (Sigla)
);

CREATE TABLE IF NOT EXISTS GOVERNADOR (
  Nome VARCHAR(25) NOT NULL,
  LocalNasc VARCHAR(45) NOT NULL,
  Sexo VARCHAR(1) NOT NULL,
  Escolaridade VARCHAR(45) NOT NULL,
  CPF INT(11) NOT NULL,
  Estado_Codigo INT NOT NULL,
  Partido_Sigla VARCHAR(5) NOT NULL,
  PRIMARY KEY (CPF),
  INDEX fk_Governador_Estado1_idx (Estado_Codigo ASC),
  INDEX fk_Governador_Partido1_idx (Partido_Sigla ASC),
  CONSTRAINT fk_Governador_Estado1
    FOREIGN KEY (Estado_Codigo)
    REFERENCES ESTADO (Codigo)
,
  CONSTRAINT fk_Governador_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES PARTIDO (Sigla)
);

CREATE TABLE IF NOT EXISTS PRESIDENTE (
  Nome VARCHAR(25) NOT NULL,
  LocalNasc VARCHAR(45) NOT NULL,
  Sexo VARCHAR(1) NOT NULL,
  Escolaridade VARCHAR(45) NOT NULL,
  CPF INT(11) NOT NULL,
  Partido_Sigla VARCHAR(5) NOT NULL,
  PRIMARY KEY (CPF),
  INDEX fk_Presidente_Partido1_idx (Partido_Sigla ASC),
  CONSTRAINT fk_Presidente_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES PARTIDO (Sigla)
);

CREATE TABLE IF NOT EXISTS PROCESSOS (
  Numero INT NOT NULL,
  Juiz VARCHAR(45) NOT NULL,
  Forum VARCHAR(45) NOT NULL,
  Delito VARCHAR(45) NOT NULL,
  PRIMARY KEY (Numero));

CREATE TABLE IF NOT EXISTS PROCESSOS_VEREADOR (
  Processos_Numero INT NOT NULL,
  Vereador_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, Vereador_CPF),
  INDEX fk_Processos_has_Vereador_Vereador1_idx (Vereador_CPF ASC),
  INDEX fk_Processos_has_Vereador_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_Vereador_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES PROCESSOS (Numero)
,
  CONSTRAINT fk_Processos_has_Vereador_Vereador1
    FOREIGN KEY (Vereador_CPF)
    REFERENCES VEREADOR (CPF)
);

CREATE TABLE IF NOT EXISTS PROCESSOS_PREFEITOS (
  Processos_Numero INT NOT NULL,
  Prefeito_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, Prefeito_CPF),
  INDEX fk_Processos_has_Prefeito_Prefeito1_idx (Prefeito_CPF ASC),
  INDEX fk_Processos_has_Prefeito_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_Prefeito_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES PROCESSOS (Numero)
,
  CONSTRAINT fk_Processos_has_Prefeito_Prefeito1
    FOREIGN KEY (Prefeito_CPF)
    REFERENCES PREFEITO (CPF)
);

CREATE TABLE IF NOT EXISTS PROCESSOS_DEP_EST (
  Processos_Numero INT NOT NULL,
  DeputadoEstadual_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, DeputadoEstadual_CPF),
  INDEX fk_Processos_has_DeputadoEstadual_DeputadoEstadual1_idx (DeputadoEstadual_CPF ASC),
  INDEX fk_Processos_has_DeputadoEstadual_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_DeputadoEstadual_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES PROCESSOS (Numero)
,
  CONSTRAINT fk_Processos_has_DeputadoEstadual_DeputadoEstadual1
    FOREIGN KEY (DeputadoEstadual_CPF)
    REFERENCES DEPUTADO_EST (CPF)
);

CREATE TABLE IF NOT EXISTS PROCESSOS_DEP_FED (
  Processos_Numero INT NOT NULL,
  DeputadoFederal_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, DeputadoFederal_CPF),
  INDEX fk_Processos_has_DeputadoFederal_DeputadoFederal1_idx (DeputadoFederal_CPF ASC),
  INDEX fk_Processos_has_DeputadoFederal_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_DeputadoFederal_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES PROCESSOS (Numero)
,
  CONSTRAINT fk_Processos_has_DeputadoFederal_DeputadoFederal1
    FOREIGN KEY (DeputadoFederal_CPF)
    REFERENCES DEPUTADO_FED (CPF)
);

CREATE TABLE IF NOT EXISTS PROCESSOS_SENADOR (
  Processos_Numero INT NOT NULL,
  Senador_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, Senador_CPF),
  INDEX fk_Processos_has_Senador_Senador1_idx (Senador_CPF ASC),
  INDEX fk_Processos_has_Senador_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_Senador_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES PROCESSOS (Numero)
,
  CONSTRAINT fk_Processos_has_Senador_Senador1
    FOREIGN KEY (Senador_CPF)
    REFERENCES SENADOR (CPF)
);

CREATE TABLE IF NOT EXISTS PROCESSOS_GOVERNADOR (
  Processos_Numero INT NOT NULL,
  Governador_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, Governador_CPF),
  INDEX fk_Processos_has_Governador_Governador1_idx (Governador_CPF ASC),
  INDEX fk_Processos_has_Governador_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_Governador_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES PROCESSOS (Numero)
,
  CONSTRAINT fk_Processos_has_Governador_Governador1
    FOREIGN KEY (Governador_CPF)
    REFERENCES GOVERNADOR (CPF)
);

CREATE TABLE IF NOT EXISTS PROCESSOS_PRESIDENTE (
  Processos_Numero INT NOT NULL,
  Presidente_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, Presidente_CPF),
  INDEX fk_Processos_has_Presidente_Presidente1_idx (Presidente_CPF ASC),
  INDEX fk_Processos_has_Presidente_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_Presidente_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES PROCESSOS (Numero)
,
  CONSTRAINT fk_Processos_has_Presidente_Presidente1
    FOREIGN KEY (Presidente_CPF)
    REFERENCES PRESIDENTE (CPF)
);

CREATE TABLE IF NOT EXISTS PROJETOS (
  Numero INT NOT NULL,
  Data DATE NOT NULL,
  Descricao MEDIUMTEXT NOT NULL,
  PRIMARY KEY (Numero));

CREATE TABLE IF NOT EXISTS PROJETOS_VEREADOR (
  Vereador_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (Vereador_CPF, Projetos_Numero),
  INDEX fk_Vereador_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_Vereador_has_Projetos_Vereador1_idx (Vereador_CPF ASC),
  CONSTRAINT fk_Vereador_has_Projetos_Vereador1
    FOREIGN KEY (Vereador_CPF)
    REFERENCES VEREADOR (CPF)
,
  CONSTRAINT fk_Vereador_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES PROJETOS (Numero)
);
    
CREATE TABLE IF NOT EXISTS PROJETOS_PREFEITO (
  Prefeito_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (Prefeito_CPF, Projetos_Numero),
  INDEX fk_Prefeito_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_Prefeito_has_Projetos_Prefeito1_idx (Prefeito_CPF ASC),
  CONSTRAINT fk_Prefeito_has_Projetos_Prefeito1
    FOREIGN KEY (Prefeito_CPF)
    REFERENCES PREFEITO (CPF)
,
  CONSTRAINT fk_Prefeito_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES PROJETOS (Numero)
);

CREATE TABLE IF NOT EXISTS PROJETOS_DEP_EST (
  DeputadoEstadual_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (DeputadoEstadual_CPF, Projetos_Numero),
  INDEX fk_DeputadoEstadual_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_DeputadoEstadual_has_Projetos_DeputadoEstadual1_idx (DeputadoEstadual_CPF ASC),
  CONSTRAINT fk_DeputadoEstadual_has_Projetos_DeputadoEstadual1
    FOREIGN KEY (DeputadoEstadual_CPF)
    REFERENCES DEPUTADO_EST (CPF)
,
  CONSTRAINT fk_DeputadoEstadual_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES PROJETOS (Numero)
);

CREATE TABLE IF NOT EXISTS PROJETOS_DEP_FED (
  DeputadoFederal_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (DeputadoFederal_CPF, Projetos_Numero),
  INDEX fk_DeputadoFederal_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_DeputadoFederal_has_Projetos_DeputadoFederal1_idx (DeputadoFederal_CPF ASC),
  CONSTRAINT fk_DeputadoFederal_has_Projetos_DeputadoFederal1
    FOREIGN KEY (DeputadoFederal_CPF)
    REFERENCES DEPUTADO_FED (CPF)
,
  CONSTRAINT fk_DeputadoFederal_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES PROJETOS (Numero)
);

CREATE TABLE IF NOT EXISTS PROJETOS_SENADOR (
  Senador_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (Senador_CPF, Projetos_Numero),
  INDEX fk_Senador_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_Senador_has_Projetos_Senador1_idx (Senador_CPF ASC),
  CONSTRAINT fk_Senador_has_Projetos_Senador1
    FOREIGN KEY (Senador_CPF)
    REFERENCES SENADOR (CPF)
,
  CONSTRAINT fk_Senador_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES PROJETOS (Numero)
);

CREATE TABLE IF NOT EXISTS PROJETOS_GOVERNADOR (
  Governador_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (Governador_CPF, Projetos_Numero),
  INDEX fk_Governador_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_Governador_has_Projetos_Governador1_idx (Governador_CPF ASC),
  CONSTRAINT fk_Governador_has_Projetos_Governador1
    FOREIGN KEY (Governador_CPF)
    REFERENCES GOVERNADOR (CPF)
,
  CONSTRAINT fk_Governador_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES PROJETOS (Numero)
);

CREATE TABLE IF NOT EXISTS PROJETOS_PRESIDENTE (
  Presidente_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (Presidente_CPF, Projetos_Numero),
  INDEX fk_Presidente_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_Presidente_has_Projetos_Presidente1_idx (Presidente_CPF ASC),
  CONSTRAINT fk_Presidente_has_Projetos_Presidente1
    FOREIGN KEY (Presidente_CPF)
    REFERENCES PRESIDENTE (CPF)
,
  CONSTRAINT fk_Presidente_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES PROJETOS (Numero)
);
