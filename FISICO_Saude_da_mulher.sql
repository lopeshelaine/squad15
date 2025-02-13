-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Profissional (
Nome VARCHAR(100),
Email VARCHAR(100),
Telefone VARCHAR(15),
Endereco VARCHAR(100),
Especialidade VARCHAR(30),
Conselho_Registro VARCHAR(50),
Disponibilidade VARCHAR(30),
ID_profissional INTEGER PRIMARY KEY
)

CREATE TABLE Consulta (
Data_consulta DATETIME,
Observacoes VARCHAR(255),
Status VARCHAR(30),
ID_consulta INTEGER PRIMARY KEY,
ID_profissional INTEGER,
ID_usuario INTEGER,
FOREIGN KEY(ID_profissional) REFERENCES Profissional (ID_profissional)
)

CREATE TABLE Cliente (
Email VARCHAR(100),
Senha VARCHAR(255),
Nome VARCHAR(100),
Data_nascimento DATETIME,
Telefone VARCHAR(15),
Endereco VARCHAR(100),
Tipo VARCHAR(30),
ID_usuario INTEGER PRIMARY KEY
)

CREATE TABLE Calculadoras (
ID_calculadora INTEGER PRIMARY KEY,
Descricao VARCHAR(10),
Nome VARCHAR(50),
URL VARCHAR(255)
)

CREATE TABLE Vacina (
Descricao VARCHAR(10),
Idade_recomendada VARCHAR(50),
Nome VARCHAR(100),
ID_vacina INTEGER PRIMARY KEY
)

CREATE TABLE Doencas (
ID_doenca INTEGER PRIMARY KEY,
Nome VARCHAR(100),
Prevencao VARCHAR(10),
Sintomas VARCHAR(10),
Tratamento VARCHAR(10)
)

CREATE TABLE Apoio_Emocional (
ID_apoio INTEGER PRIMARY KEY,
Tipo VARCHAR(10),
Titulo VARCHAR(100),
Descricao VARCHAR(30),
URL VARCHAR(255)
)

CREATE TABLE Contato (
Nome VARCHAR(100),
Email VARCHAR(100),
Mensagem VARCHAR(50),
Data_envio DATETIME,
ID_mensagem INTEGER PRIMARY KEY
)

CREATE TABLE Relacao9_Usuarios_Apoio (
ID_usuario INTEGER,
ID_apoio INTEGER,
Data_parcticipacao VARCHAR(10),
FOREIGN KEY(ID_usuario) REFERENCES Cliente (ID_usuario),
FOREIGN KEY(ID_apoio) REFERENCES Apoio_Emocional (ID_apoio)
)

CREATE TABLE Relacao8_Historico_Doencas (
ID_usuario INTEGER,
ID_doenca INTEGER,
ID_historico INTEGER PRIMARY KEY,
Data_pesquisa DATETIME,
FOREIGN KEY(ID_usuario) REFERENCES Cliente (ID_usuario),
FOREIGN KEY(ID_doenca) REFERENCES Doencas (ID_doenca)
)

CREATE TABLE Relacao7_Historico_Calculadora (
ID_calculadora INTEGER,
ID_usuario INTEGER,
Data_uso VARCHAR(10),
ID_historico INTEGER PRIMARY KEY,
Resultado VARCHAR(10),
FOREIGN KEY(ID_calculadora) REFERENCES Calculadoras (ID_calculadora),
FOREIGN KEY(ID_usuario) REFERENCES Cliente (ID_usuario)
)

CREATE TABLE Relacao6_Usuarios_Vacina (
ID_usuario INTEGER,
ID_vacina INTEGER,
Data_vacinacao DATETIME,
FOREIGN KEY(ID_usuario) REFERENCES Cliente (ID_usuario),
FOREIGN KEY(ID_vacina) REFERENCES Vacina (ID_vacina)
)

CREATE TABLE Relacao3 (
ID_mensagem INTEGER,
ID_usuario INTEGER,
FOREIGN KEY(ID_mensagem) REFERENCES Contato (ID_mensagem),
FOREIGN KEY(ID_usuario) REFERENCES Cliente (ID_usuario)
)

ALTER TABLE Consulta ADD FOREIGN KEY(ID_usuario) REFERENCES Cliente (ID_usuario)
