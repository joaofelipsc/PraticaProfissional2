create schema Karate

CREATE TABLE Karate.Faixa (
    Id_Faixa INT PRIMARY KEY,
    Cor VARCHAR(50)
);

CREATE TABLE Karate.Aluno (
    Id_Aluno INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    CPF BIGINT,
    EMail VARCHAR(30),
    Celular BIGINT,
    Data_Nascimento DATE
);

CREATE TABLE Karate.Pagamento (
    Cod_Pgmnto INT PRIMARY KEY,
    Id_Matr�cula INT,
    Id_Aluno INT,

    FOREIGN KEY (Id_Aluno) REFERENCES Karate.Aluno(Id_Aluno)
);

CREATE TABLE Karate.Matr�cula (
    Id_Matricula INT PRIMARY KEY,
    Id_Aluno INT,
    Cod_Pgmnto INT,
    Id_Prof INT,
    FOREIGN KEY (Id_Aluno) REFERENCES Karate.Aluno(Id_Aluno),
    FOREIGN KEY (Cod_Pgmnto) REFERENCES Karate.Pagamento(Cod_Pgmnto),
    FOREIGN KEY (Id_Prof) REFERENCES Karate.Professor(Id_Prof)
);

CREATE TABLE Karate.Professor (
    Id_Prof INT PRIMARY KEY,
    Nome VARCHAR(50),
    Horarios DATETIME
);

ALTER TABLE Karate.Pagamento
ADD CONSTRAINT FK_Matricula_Pagamento
FOREIGN KEY (Id_Matr�cula) REFERENCES Karate.Matr�cula(Id_Matricula);


-- Adicionar a coluna Id_Faixa na tabela Karate.Aluno
ALTER TABLE KARATE.Aluno
ADD CONSTRAINT FK_Faixa_Aluno
FOREIGN KEY (Id_Faixa) REFERENCES Karate.Faixa(Id_Faixa);




ALTER TABLE Karate.Pagamento
add 