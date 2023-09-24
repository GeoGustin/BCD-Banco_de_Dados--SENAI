CREATE DATABASE meu_segundo_DB;
USE meu_segundo_DB;

-- EXERCICIO 01
-- Escreva uma cláusula SQL para criar uma tabela simples
-- chamada Países, incluindo as colunas country_id, country_name e region_id. 

CREATE TABLE paises(
	country_id	 	char(4) NOT NULL PRIMARY KEY, -- chave primária (não pode ser nula)
    country_name 	varchar(40) NOT NULL,
    region_id 		char(5)
);

-- EXERCICIO 02
-- Escreva uma cláusula SQL para criar uma tabela simples de
-- países incluindo as colunas country_id, country_name e region_id que já existe.

CREATE TABLE IF NOT EXISTS paises( 		-- IF NOT EXISTS -> se não existir, será criado
	country_id	 	char(4) NOT NULL PRIMARY KEY, 
    country_name 	varchar(40) NOT NULL,
    region_id 		char(5)
);

-- Exercício 03 
-- Escreva uma instrução SQL para criar a estrutura de uma tabela dup_countries semelhantes a países.

-- Criando tabela idêntica a tabela paises
CREATE TABLE IF NOT EXISTS dup_countries LIKE paises;
-- LIKE paises;
-- );

-- Criando tabela idêntica a tabela paises
SHOW TABLES;
SHOW TABLES LIKE 'paises';


-- Exercício 06 
-- Escreva uma instrução SQL para criar uma tabela chamada jobs incluindo as colunas job_id,  job_title,
-- min_salary, max_salary e verifique se o valor max_salary excede o limite superior de 25.000.

CREATE TABLE jobs(
	job_id		varchar(10) NOT NULL PRIMARY KEY,
    job_title	varchar(40) NOT NULL,
    min_salary	decimal(6,2),
    max_salary	decimal(6,2),
    CHECK(max_salary <= 25000)
);


-- Exercício 07 
-- Escreva uma instrução SQL para criar uma tabela chamada países
-- incluindo as colunas country_id, country_name e region_id e certifique-se
-- de que nenhum país, exceto Itália, Índia e China, será inserido na tabela.

CREATE TABLE IF NOT EXISTS countries_2( 		
	country_id	 	varchar(2) NOT NULL PRIMARY KEY, 
    country_name 	varchar(20) NOT NULL,
    region_id 		char(5),
    CHECK(country_name IN ('Itália','Índia', 'China')) --
); 

-- Exercício 08 
-- Escreva uma instrução SQL para criar uma tabela chamada
-- job_histry incluindo as colunas Employee_id, start_date, end_date, job_id e
-- Department_id e certifique-se de que o valor da coluna end_date será inserido
-- no momento da inserção no formato como '--/--/----'.

CREATE TABLE IF NOT EXISTS job_histry(
	-- employee_id char(5) NOT NULL PRIMARY KEY,
    employee_id int AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT - automaticamente aumenta e atualiza
    start_date date NOT NULL,
    end_date date NOT NULL,
    job_id varchar(10) NOT NULL,
    department_id varchar(7) NOT NULL,
	CHECK(end_date LIKE '--/--/----')
);

-- Exercício 09 
-- Escreva uma instrução SQL para criar uma tabela chamada
-- países incluindo as colunas country_id, country_name e region_id e
-- certifique-se de que nenhum dado duplicado na coluna country_id será
-- permitido no momento da inserção.

CREATE TABLE IF NOT EXISTS paises_3( 		
	country_id	 	varchar(3) NOT NULL UNIQUE, 
    country_name 	varchar(20) NOT NULL,
    region_id 		char(5)
); 

-- Exercício 10 
-- Escreva uma instrução SQL para criar uma tabela chamada jobs
-- incluindo as colunas job_id, job_title, min_salary e max_salary e certifique-se de
-- que o valor padrão para job_title esteja em branco e min_salary seja 8000 e
-- max_salary seja NULL será inserido automaticamente no momento de inserção
-- se nenhum valor for atribuído às colunas especificadas.

CREATE TABLE jobs_2(
	job_id		varchar(10) NOT NULL UNIQUE,
    job_title	varchar(40) NOT NULL default "",
    min_salary	decimal(6,2) default 8000,
    max_salary	decimal(6,2) default null
);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/* Exercício 11 - Escreva uma instrução SQL para criar uma tabela chamada
países incluindo as colunas country_id, country_name e region_id e certifique-
se de que a coluna country_id será um campo-chave que não conterá nenhum
dado duplicado no momento da inserção. */
CREATE TABLE IF NOT EXISTS paises_4(
	country_id varchar(4) NOT NULL UNIQUE, 
    country_name varchar(40) NOT NULL, 
    region_id varchar(5),
    primary key(country_id)
);

/* Exercício 12 - Escreva uma instrução SQL para criar uma tabela países
incluindo as colunas country_id, country_name e region_id e certifique-se
de que a coluna country_id seja exclusiva e armazene um valor
incrementado automaticamente. */
CREATE TABLE IF NOT EXISTS paises_5(
	country_id int NOT NULL UNIQUE AUTO_INCREMENT,
    country_name varchar(40) NOT NULL, 
    region_id varchar(5)
);

/* Exercício 13 - Escreva uma instrução SQL para criar uma tabela países
incluindo as colunas country_id, country_name e region_id e certifique-se
de que a combinação das colunas country_id e region_id será exclusiva. */
CREATE TABLE IF NOT EXISTS paises_6(
	country_id varchar(3) NOT NULL UNIQUE,
    country_name varchar(40) NOT NULL, 
    region_id varchar(5) NOT NULL UNIQUE
);

/* Exercício 14 - Escreva uma instrução SQL para criar uma tabela
job_history incluindo as colunas Employee_id, Start_date, End_date,
Job_id e Department_id e certifique-se de que a coluna Employee_id não
contenha nenhum valor duplicado no momento da inserção e a coluna de
chave estrangeira Job_id contenha apenas esses valores que existem na
tabela de empregos. */
CREATE TABLE IF NOT EXISTS job_history2(
	-- employee_id char(5) NOT NULL PRIMARY KEY,
    employee_id int AUTO_INCREMENT PRIMARY KEY, 
    start_date date NOT NULL,
    end_date date NOT NULL,
    job_id varchar(10) NOT NULL,
    department_id varchar(7) NOT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

/* Exercício 15 - Escreva uma instrução SQL para criar uma tabela
funcionários incluindo as colunas Employee_id, First_Name, Last_Name,
Email, Phone_number Hire_date, Job_id, Salary, Commission,
Manager_id e Department_id e 

certifique-se de que a coluna 
Employee_id não contenha nenhum valor duplicado no momento de inserção e as
colunas de chave estrangeira combinadas pelas colunas 
Department_id e Manager_id contêm apenas os valores de combinação exclusivos, cujas
combinações existem na tabela de departamentos. */

CREATE TABLE departamentos(
	Department_id varchar(5) UNIQUE NOT NULL PRIMARY KEY,
    Manager_id varchar(5) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS funcionarios(
	employee_id int auto_increment not null unique, 
	first_Name varchar(25) not null, 
	last_Name varchar(25) not null,
	email varchar(80) not null, 
	phone_number char(11) not null,
	hire_date date not null, 
	job_id varchar(5) not null, 
	salary decimal(8,2) not null, 
	commission decimal(8,2) not null,
	manager_id varchar(5) not null unique, 
	department_id varchar(5) not null unique,
    
    foreign key(department_id) references departamentos(Department_id),
    foreign key(manager_id) references departamentos(Manager_id),
    primary key(employee_id)
);
	
/* Exercício 16 - Escreva uma instrução SQL para criar uma tabela funcionários incluindo as colunas Employee_id, First_Name, Last_Name, 
Email, Phone_number Hire_date, Job_id, Salary, Commission, Manager_id e Department_id e certifique-se de que a coluna 
Employee_id não contenha nenhum valor duplicado no momento de inserção, e a 
coluna de chave estrangeira Department_id, referenciada pela coluna Department_id da tabela de departamentos,
 pode conter apenas os valores que existem na tabela de departamentos e outra coluna de chave 
estrangeira job_id, referenciada pela coluna Job_id da tabela de empregos, pode conter apenas aqueles valores que existem na tabela de 
empregos. O InnoDB Engine foi usado para criar as tabelas. */
CREATE TABLE IF NOT EXISTS funcionarios2(
	employee_id int auto_increment not null unique, 
	first_Name varchar(25) not null, 
	last_Name varchar(25) not null,
	email varchar(80) not null, 
	phone_number char(11) not null,
	hire_date date not null, 
	job_id varchar(5) not null, 
	salary decimal(8,2) not null, 
	commission decimal(8,2) not null,
	manager_id varchar(5) not null unique, 
	department_id varchar(5) not null unique,

    foreign key(department_id) references departamentos(Department_id),
    foreign key(job_id) references jobs(job_id),
    primary key(employee_id)
    
) ENGINE=InnoDB;

/* Exercício 17 - Escreva uma instrução SQL para criar uma tabela funcionários incluindo colunas Employee_id, first_name, last_name, 
job_id, salário e certifique-se de que a coluna Employee_id não contenha nenhum valor duplicado no momento da inserção, e a coluna 
de chave estrangeira job_id, referenciada pela coluna job_id da tabela de empregos, pode conter apenas os valores que existem na tabela 
de empregos. O InnoDB Engine foi usado para criar as tabelas. 
A especialidade da instrução é que a ação ON UPDATE CASCADE permite 
realizar atualização entre tabelas e a ação ON DELETE RESTRICT rejeita a exclusão. 
A ação padrão é ON DELETE RESTRICT.*/
CREATE TABLE IF NOT EXISTS funcionarios3(
	employee_id int auto_increment not null unique,  
	first_Name varchar(25) not null, 
	last_Name varchar(25) not null,
    job_id varchar(5) not null, 
	salario decimal(8,2) not null, 
    
    foreign key(job_id) references jobs(job_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	primary key(employee_id)
    
) ENGINE=InnoDB;
    
/* Exercício 18 - Escreva uma instrução SQL para criar uma tabela funcionários incluindo colunas Employee_id, first_name, last_name, 
job_id, salário e certifique-se de que a coluna Employee_id não contenha nenhum valor duplicado no momento da inserção, e a coluna de 
chave estrangeira job_id, referenciada pela coluna job_id da tabela de empregos, pode conter apenas os valores que existem na tabela 
de empregos. O InnoDB Engine foi usado para criar as tabelas. 
A especialidade da instrução é que, O ON DELETE CASCADE que permite 
excluir registros na tabela Employees(child) que se referem a um registro na tabela jobs(parent) 
quando o registro na tabela pai é 
excluído e o ON As ações UPDATE RESTRICT rejeitam quaisquer atualizações. */
CREATE TABLE IF NOT EXISTS funcionarios4(
	employee_id int auto_increment not null unique,  
	first_Name varchar(25) not null, 
	last_Name varchar(25) not null,
    job_id varchar(5) not null, 
	salario decimal(8,2) not null, 
    
    foreign key(job_id) references jobs(job_id) ON DELETE CASCADE ON UPDATE RESTRICT,
    primary key(employee_id)
    
) ENGINE=InnoDB;

/* Exercício 19 - Escreva uma instrução SQL para criar uma tabela Employees incluindo as colunas Employee_id, First_Name, Last_Name, 
Job_id, Salary e certifique-se de que a coluna Employee_id não contenha nenhum valor duplicado no momento da inserção e a coluna de 
chave estrangeira Job_id, referenciada pelo coluna job_id da tabela de empregos, pode conter apenas os valores que existem na tabela de
empregos. O InnoDB Engine foi usado para criar as tabelas. 
A especialidade da instrução é que, a ação ON DELETE SET NULL definirá os 
valores da coluna de chave estrangeira na tabela filho (funcionários) como NULL 
quando o registro na tabela pai (trabalhos) for excluído, 
Suponha que a estrutura de dois trabalhos de tabela e o InnoDB Engine tenham sido usados para criar os trabalhos de tabela
*/
CREATE TABLE IF NOT EXISTS Employees(
	employee_id int auto_increment not null unique,  
	first_Name varchar(25) not null, 
	last_Name varchar(25) not null,
    job_id varchar(5) not null, 
	salario decimal(8,2) not null, 
    
    foreign key(job_id) references jobs(job_id) ON DELETE SET NULL,
    primary key(employee_id)
    
) ENGINE=InnoDB;

/* Exercício 20 - Escreva uma instrução SQL para criar uma tabela funcionários incluindo colunas Employee_id, first_name, last_name, 
job_id, salário e certifique-se de que a coluna Employee_id não contenha nenhum valor duplicado no momento da inserção, e a coluna de 
chave estrangeira job_id, referenciada pela coluna job_id da tabela de empregos, pode conter apenas os valores que existem na tabela 
de empregos. O InnoDB Engine foi usado para criar as tabelas. 
A especialidade da declaração é que as ações ON DELETE NO ACTION e ON 
UPDATE NO ACTION rejeitarão a exclusão e quaisquer atualizações. */
CREATE TABLE IF NOT EXISTS funcionarios5(
	employee_id int auto_increment not null unique,  
	first_Name varchar(25) not null, 
	last_Name varchar(25) not null,
    job_id varchar(5), 
	salario decimal(8,2) not null, 
    
    foreign key(job_id) references jobs(job_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    primary key(employee_id)
    
) ENGINE=InnoDB;


