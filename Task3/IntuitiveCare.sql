SET GLOBAL local_infile=1;

CREATE DATABASE IF NOT EXISTS IntuitiveCare;
USE IntuitiveCare;

CREATE TABLE IF NOT EXISTS Relatorio_Operadoras (
Registro_ANS VARCHAR(100) NOT NULL,
CNPJ VARCHAR(100) NOT NULL,
Razao_Social VARCHAR(250),
Nome_Fantasia VARCHAR(250),
Modalidade VARCHAR(250),
Logradouro VARCHAR(250),
Numero VARCHAR(150),
Complemento VARCHAR(500),
Bairro VARCHAR(100),
Cidade VARCHAR(100),
UF VARCHAR(100),
CEP VARCHAR(100),
DDD VARCHAR(6),
Telefone VARCHAR(100),
Fax VARCHAR(100),
Endereco_eletronico VARCHAR(100),
Representante VARCHAR(250),
Cargo_Representante VARCHAR(250),
Data_Registro_ANS DATE,
CONSTRAINT Pk_reg PRIMARY KEY (Registro_ANS)
)CHARACTER SET utf8mb4;

CREATE TABLE IF NOT EXISTS Demonstracoes_Contabeis(
DATA DATE,
REG_ANS VARCHAR(100) NOT NULL,
CD_CONTA_CONTABIL VARCHAR(100),
DESCRICAO VARCHAR(2000),
VL_SALDO_FINAL DECIMAL(15, 2),
CONSTRAINT Fk_registro FOREIGN KEY (REG_ANS) REFERENCES Relatorio_Operadoras(Registro_ANS)
)CHARACTER SET utf8mb4;

LOAD DATA LOCAL INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/datasource/Relatorio_cadop.csv'
INTO TABLE Relatorio_Operadoras
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 3 ROWS
(Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade, Logradouro, Numero, Complemento, Bairro, Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_eletronico, Representante, Cargo_Representante, @Data_Registro_ANS)
SET Data_Registro_ANS = STR_TO_DATE(@Data_Registro_ANS, '%d/%m/%Y');

LOAD DATA LOCAL INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/datasource/1T2019.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/datasource/2T2019.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/datasource/3T2019.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/datasource/4T2019.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/datasource/1T2020.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/datasource/2T2020.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/datasource/3T2020.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/datasource/4T2020.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

SELECT Registro_ANS, Razao_Social, Nome_Fantasia, `DATA`, DESCRICAO, SUM(VL_SALDO_FINAL) AS saldo_total
FROM relatorio_operadoras
JOIN demonstracoes_contabeis AS dcont
ON Registro_ANS = REG_ANS
WHERE DESCRICAO = "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR "
AND `DATA` >= "2020-01-01"
GROUP BY Registro_ANS
ORDER BY saldo_total DESC
LIMIT 10;

SELECT Registro_ANS, Razao_Social, Nome_Fantasia, `DATA`, DESCRICAO, SUM(VL_SALDO_FINAL) AS saldo_total
FROM relatorio_operadoras
JOIN demonstracoes_contabeis AS dcont
ON Registro_ANS = REG_ANS
WHERE DESCRICAO = "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR "
AND `DATA` BETWEEN "2020-10-01" AND "2020-12-31"
GROUP BY Registro_ANS
ORDER BY saldo_total DESC
LIMIT 10;
