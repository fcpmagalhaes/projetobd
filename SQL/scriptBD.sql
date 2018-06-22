Create database ProjetoFinal;
use ProjetoFinal;
CREATE TABLE IF NOT EXISTS Estado (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Eleitores INT NOT NULL,
  Area INT NOT NULL,
  Populacao INT NOT NULL,
  PRIMARY KEY (Codigo));

CREATE TABLE IF NOT EXISTS Municipio (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Eleitores INT NOT NULL,
  Area INT NOT NULL,
  População INT NOT NULL,
  Estado_Codigo INT NOT NULL,
  PRIMARY KEY (Codigo),
  INDEX fk_Municipio_Estado1_idx (Estado_Codigo ASC),
  CONSTRAINT fk_Municipio_Estado1
    FOREIGN KEY (Estado_Codigo)
    REFERENCES Estado (Codigo));


CREATE TABLE IF NOT EXISTS Partido (
  Sigla VARCHAR(5) NOT NULL,
  Filiados INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Posicao MEDIUMTEXT NOT NULL,
  Logo LONGBLOB NOT NULL,
  PRIMARY KEY (Sigla));


CREATE TABLE IF NOT EXISTS Vereador (
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
    REFERENCES Municipio (Codigo),
  CONSTRAINT fk_Vereador_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES Partido (Sigla));

CREATE TABLE IF NOT EXISTS Prefeito (
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
    REFERENCES Municipio (Codigo)
,
  CONSTRAINT fk_Prefeito_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES Partido (Sigla)
);

CREATE TABLE IF NOT EXISTS DeputadoFederal (
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
    REFERENCES Estado (Codigo)
,
  CONSTRAINT fk_DeputadoFederal_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES Partido (Sigla)
);

CREATE TABLE IF NOT EXISTS Senador (
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
    REFERENCES Estado (Codigo)
,
  CONSTRAINT fk_Senador_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES Partido (Sigla)
);

CREATE TABLE IF NOT EXISTS Governador (
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
    REFERENCES Estado (Codigo)
,
  CONSTRAINT fk_Governador_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES Partido (Sigla)
);

CREATE TABLE IF NOT EXISTS DeputadoEstadual (
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
    REFERENCES Estado (Codigo)
,
  CONSTRAINT fk_DeputadoEstadual_Partido1
    FOREIGN KEY (Partido_Sigla)
    REFERENCES Partido (Sigla)
);

CREATE TABLE IF NOT EXISTS Presidente (
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
    REFERENCES Partido (Sigla)
);

CREATE TABLE IF NOT EXISTS Projetos (
  Numero INT NOT NULL,
  Data DATE NOT NULL,
  Descricao MEDIUMTEXT NOT NULL,
  PRIMARY KEY (Numero));

CREATE TABLE IF NOT EXISTS Processos (
  Numero INT NOT NULL,
  Juiz VARCHAR(45) NOT NULL,
  Forum VARCHAR(45) NOT NULL,
  Delito VARCHAR(45) NOT NULL,
  PRIMARY KEY (Numero));


CREATE TABLE IF NOT EXISTS Processos_has_Prefeito (
  Processos_Numero INT NOT NULL,
  Prefeito_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, Prefeito_CPF),
  INDEX fk_Processos_has_Prefeito_Prefeito1_idx (Prefeito_CPF ASC),
  INDEX fk_Processos_has_Prefeito_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_Prefeito_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES Processos (Numero)
,
  CONSTRAINT fk_Processos_has_Prefeito_Prefeito1
    FOREIGN KEY (Prefeito_CPF)
    REFERENCES Prefeito (CPF)
);

CREATE TABLE IF NOT EXISTS Processos_has_Vereador (
  Processos_Numero INT NOT NULL,
  Vereador_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, Vereador_CPF),
  INDEX fk_Processos_has_Vereador_Vereador1_idx (Vereador_CPF ASC),
  INDEX fk_Processos_has_Vereador_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_Vereador_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES Processos (Numero)
,
  CONSTRAINT fk_Processos_has_Vereador_Vereador1
    FOREIGN KEY (Vereador_CPF)
    REFERENCES Vereador (CPF)
);

CREATE TABLE IF NOT EXISTS Processos_has_Governador (
  Processos_Numero INT NOT NULL,
  Governador_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, Governador_CPF),
  INDEX fk_Processos_has_Governador_Governador1_idx (Governador_CPF ASC),
  INDEX fk_Processos_has_Governador_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_Governador_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES Processos (Numero)
,
  CONSTRAINT fk_Processos_has_Governador_Governador1
    FOREIGN KEY (Governador_CPF)
    REFERENCES Governador (CPF)
);

CREATE TABLE IF NOT EXISTS Processos_has_DeputadoFederal (
  Processos_Numero INT NOT NULL,
  DeputadoFederal_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, DeputadoFederal_CPF),
  INDEX fk_Processos_has_DeputadoFederal_DeputadoFederal1_idx (DeputadoFederal_CPF ASC),
  INDEX fk_Processos_has_DeputadoFederal_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_DeputadoFederal_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES Processos (Numero)
,
  CONSTRAINT fk_Processos_has_DeputadoFederal_DeputadoFederal1
    FOREIGN KEY (DeputadoFederal_CPF)
    REFERENCES DeputadoFederal (CPF)
);

CREATE TABLE IF NOT EXISTS Processos_has_Senador (
  Processos_Numero INT NOT NULL,
  Senador_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, Senador_CPF),
  INDEX fk_Processos_has_Senador_Senador1_idx (Senador_CPF ASC),
  INDEX fk_Processos_has_Senador_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_Senador_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES Processos (Numero)
,
  CONSTRAINT fk_Processos_has_Senador_Senador1
    FOREIGN KEY (Senador_CPF)
    REFERENCES Senador (CPF)
);

CREATE TABLE IF NOT EXISTS Processos_has_DeputadoEstadual (
  Processos_Numero INT NOT NULL,
  DeputadoEstadual_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, DeputadoEstadual_CPF),
  INDEX fk_Processos_has_DeputadoEstadual_DeputadoEstadual1_idx (DeputadoEstadual_CPF ASC),
  INDEX fk_Processos_has_DeputadoEstadual_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_DeputadoEstadual_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES Processos (Numero)
,
  CONSTRAINT fk_Processos_has_DeputadoEstadual_DeputadoEstadual1
    FOREIGN KEY (DeputadoEstadual_CPF)
    REFERENCES DeputadoEstadual (CPF)
);

CREATE TABLE IF NOT EXISTS Processos_has_Presidente (
  Processos_Numero INT NOT NULL,
  Presidente_CPF INT(11) NOT NULL,
  PRIMARY KEY (Processos_Numero, Presidente_CPF),
  INDEX fk_Processos_has_Presidente_Presidente1_idx (Presidente_CPF ASC),
  INDEX fk_Processos_has_Presidente_Processos1_idx (Processos_Numero ASC),
  CONSTRAINT fk_Processos_has_Presidente_Processos1
    FOREIGN KEY (Processos_Numero)
    REFERENCES Processos (Numero)
,
  CONSTRAINT fk_Processos_has_Presidente_Presidente1
    FOREIGN KEY (Presidente_CPF)
    REFERENCES Presidente (CPF)
);

CREATE TABLE IF NOT EXISTS DeputadoEstadual_has_Projetos (
  DeputadoEstadual_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (DeputadoEstadual_CPF, Projetos_Numero),
  INDEX fk_DeputadoEstadual_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_DeputadoEstadual_has_Projetos_DeputadoEstadual1_idx (DeputadoEstadual_CPF ASC),
  CONSTRAINT fk_DeputadoEstadual_has_Projetos_DeputadoEstadual1
    FOREIGN KEY (DeputadoEstadual_CPF)
    REFERENCES DeputadoEstadual (CPF)
,
  CONSTRAINT fk_DeputadoEstadual_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES Projetos (Numero)
);

CREATE TABLE IF NOT EXISTS Presidente_has_Projetos (
  Presidente_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (Presidente_CPF, Projetos_Numero),
  INDEX fk_Presidente_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_Presidente_has_Projetos_Presidente1_idx (Presidente_CPF ASC),
  CONSTRAINT fk_Presidente_has_Projetos_Presidente1
    FOREIGN KEY (Presidente_CPF)
    REFERENCES Presidente (CPF)
,
  CONSTRAINT fk_Presidente_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES Projetos (Numero)
);

CREATE TABLE IF NOT EXISTS Senador_has_Projetos (
  Senador_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (Senador_CPF, Projetos_Numero),
  INDEX fk_Senador_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_Senador_has_Projetos_Senador1_idx (Senador_CPF ASC),
  CONSTRAINT fk_Senador_has_Projetos_Senador1
    FOREIGN KEY (Senador_CPF)
    REFERENCES Senador (CPF)
,
  CONSTRAINT fk_Senador_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES Projetos (Numero)
);

CREATE TABLE IF NOT EXISTS DeputadoFederal_has_Projetos (
  DeputadoFederal_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (DeputadoFederal_CPF, Projetos_Numero),
  INDEX fk_DeputadoFederal_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_DeputadoFederal_has_Projetos_DeputadoFederal1_idx (DeputadoFederal_CPF ASC),
  CONSTRAINT fk_DeputadoFederal_has_Projetos_DeputadoFederal1
    FOREIGN KEY (DeputadoFederal_CPF)
    REFERENCES DeputadoFederal (CPF)
,
  CONSTRAINT fk_DeputadoFederal_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES Projetos (Numero)
);

CREATE TABLE IF NOT EXISTS Governador_has_Projetos (
  Governador_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (Governador_CPF, Projetos_Numero),
  INDEX fk_Governador_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_Governador_has_Projetos_Governador1_idx (Governador_CPF ASC),
  CONSTRAINT fk_Governador_has_Projetos_Governador1
    FOREIGN KEY (Governador_CPF)
    REFERENCES Governador (CPF)
,
  CONSTRAINT fk_Governador_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES Projetos (Numero)
);

CREATE TABLE IF NOT EXISTS Vereador_has_Projetos (
  Vereador_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (Vereador_CPF, Projetos_Numero),
  INDEX fk_Vereador_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_Vereador_has_Projetos_Vereador1_idx (Vereador_CPF ASC),
  CONSTRAINT fk_Vereador_has_Projetos_Vereador1
    FOREIGN KEY (Vereador_CPF)
    REFERENCES Vereador (CPF)
,
  CONSTRAINT fk_Vereador_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES Projetos (Numero)
);
    
CREATE TABLE IF NOT EXISTS Prefeito_has_Projetos (
  Prefeito_CPF INT(11) NOT NULL,
  Projetos_Numero INT NOT NULL,
  PRIMARY KEY (Prefeito_CPF, Projetos_Numero),
  INDEX fk_Prefeito_has_Projetos_Projetos1_idx (Projetos_Numero ASC),
  INDEX fk_Prefeito_has_Projetos_Prefeito1_idx (Prefeito_CPF ASC),
  CONSTRAINT fk_Prefeito_has_Projetos_Prefeito1
    FOREIGN KEY (Prefeito_CPF)
    REFERENCES Prefeito (CPF)
,
  CONSTRAINT fk_Prefeito_has_Projetos_Projetos1
    FOREIGN KEY (Projetos_Numero)
    REFERENCES Projetos (Numero)
);
