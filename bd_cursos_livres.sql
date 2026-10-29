CREATE DATABASE IF NOT EXISTS bd_cursos_livres
CHARACTER SET uf8mb4;

USE bd_cursos_livres;

CREATE TABLE aluno(
id_aluno INT PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
cpf CHAR(11) UNIQUE NOT NULL,
email VARCHAR(150),
data_nascimento DATE,
CONSTRAINT uq_aluno_cpf UNIQUE (cpf)
);

CREATE TABLE instrutor(
id_instrutor INT PRIMARY KEY,
nome VARCHAR(150) ,
email VARCHAR(150),
especialidade VARCHAR(150)
);

CREATE TABLE curso (
id_curso INT PRIMARY KEY,
nome VARCHAR(15) NOT NULL,
carga_horaria INT DEFAULT 40,
valor DECIMAL(10,2)
);

CREATE TABLE turma(
id_turma INT PRIMARY KEY,
id_curso INT,
id_instrutor INT,
data_inicio DATE,
quantidade_vagas INT DEFAULT 30,
id_instrutor INT,
id_curso INT,

CONSTRAINT pk_instrutor
FOREIGN KEY(id_instrutor)
REFERENCES aluno(id_instrutor),

CONSTRAINT pk_curso
FOREIGN KEY(id_curso)
REFERENCES curso(id_curso)
ON DELETE RESTRICT
ON UPDATE CASCADE
)ENGINE = InnoDB;


CREATE TABLE matricula(
id_matricula INT PRIMARY KEY,
data_matricula DATE NOT NULL,
situacao VARCHAR(20) DEFAULT 'ativa',
id_turma INT NOT NULL,
id_aluno INT NOT NULL,

CONSTRAINT pk_turma
FOREIGN KEY(id_turma)
REFERENCES turma(id_turma),

CONSTRAINT pk_aluno
FOREIGN KEY(id_aluno)
REFERENCES aluno(id_aluno)
ON DELETE RESTRICT
ON UPDATE CASCADE
)ENGINE = InnoDB;


ALTER TABLE aluno
ADD telefone VARCHAR(20);

ALTER TABLE aluno
MODIFY telefone VARCHAR(25);

ALTER TABLE aluno
CHANGE nome telefone_contato VARCHAR(25);

ALTER TABLE cursos
ADD descricao TEXT;

ALTER TABLE cursos
ADD modalidade VARCHAR(100) DEFAULT 'presencial';

ALTER TABLE cursos
ADD CONSTRAINT chk_modalidade
CHECK (modalidade IN ('presencial', 'online', 'hibrido'));

ALTER TABLE turmas
ADD observacao TEXT;

ALTER TABLE turmas
DROP COLUMN observacao;

RENAME TABLE instrutores TO professor;

SHOW TABLES;

DESCRIBE alunos;

SHOW CREATE TABLE alunos;
SHOW CREATE TABLE cursos;
SHOW CREATE TABLE turmas;
SHOW CREATE TABLE professor;

