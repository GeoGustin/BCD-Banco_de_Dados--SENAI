DROP DATABASE clinica_turmaa;

-- Criar o banco de dados clinica
CREATE DATABASE clinica_turmaA;

-- Ativar o banco para uso
USE clinica_turmaA;

CREATE TABLE sala(
	num_sala 	INT NOT NULL UNIQUE,
    andar 		INT NOT NULL UNIQUE,
    CHECK(num_sala >= 1 and num_sala <= 50),
    CHECK(andar >= 1 and andar <= 12),
    PRIMARY KEY (num_sala)
);

CREATE TABLE pacientes(
	rg 					char (15) NOT NULL UNIQUE,
	nome 				varchar (40) NOT NULL,
	data_nascimento 	date NOT NULL,
	cidade 				varchar(30) default "Itabuna",
	doenca 				varchar (40) NOT NULL,
	plano_saude 		varchar (40) NOT NULL default "SUS",
    PRIMARY KEY (rg)
);

CREATE TABLE funcionarios(
	matricula 		varchar (15) NOT NULL UNIQUE,
	nome 			varchar (40)  NOT NULL,
	data_nascimento date NOT NULL,
	data_admissao 	date NOT NULL,
	cargo 			varchar (40) NOT NULL default "Assistente Médico",
	salario 		float NOT NULL default 510.00,
    PRIMARY KEY (matricula)
);

CREATE TABLE medicos(
	crm varchar (15) NOT NULL UNIQUE,
	nome varchar (40) NOT NULL,
	idade INT NOT NULL,
	especialidade varchar (40) NOT NULL default "Ortopedia",
	cpf varchar (15) NOT NULL UNIQUE,
	data_admissão date NOT NULL,
    
    num_sala int NOT NULL,
    matricula varchar(15) NOT NULL UNIQUE,
    
    CHECK(idade > 23),
    PRIMARY KEY (crm),
    FOREIGN KEY (num_sala) references sala(num_sala),
    FOREIGN KEY (matricula) references funcionarios(matricula)
);

CREATE TABLE consultas(
	codigo_consulta 	INT  NOT NULL UNIQUE,
	data_horario		datetime NOT NULL,
    
    crm_medico 			varchar (15) NOT NULL,
    rg_paciente 		char (15) NOT NULL,
    
    PRIMARY KEY (codigo_consulta),
	FOREIGN KEY (crm_medico) references medicos(crm),
    FOREIGN KEY (rg_paciente) references pacientes(rg)
);

