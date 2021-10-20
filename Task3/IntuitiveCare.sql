CREATE DATABASE IF NOT EXISTS IntuitiveCare;
USE IntuitiveCare;

CREATE TABLE IF NOT EXISTS Relatorio_Operadoras (
Registro_ANS VARCHAR(100) NOT NULL,
CNPJ VARCHAR(100) NOT NULL,
Razao_Social VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
Nome_Fantasia VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
Modalidade VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
Logradouro VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
Numero VARCHAR(150),
Complemento VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
Bairro VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
Cidade VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
UF VARCHAR(4),
CEP VARCHAR(20),
DDD VARCHAR(6),
Telefone VARCHAR(15),
Fax VARCHAR(20),
Endereco_eletronico VARCHAR(50),
Representante VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
Cargo_Representante VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
Data_Registro_ANS DATE,
CONSTRAINT Pk_reg PRIMARY KEY (Registro_ANS)
)CHARACTER SET utf8mb4;

SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/Relatorio_cadop.csv'
INTO TABLE Relatorio_Operadoras
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 3 ROWS
(Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade, Logradouro, Numero, Complemento, Bairro, Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_eletronico, Representante, Cargo_Representante, @Data_Registro_ANS)
SET Data_Registro_ANS = STR_TO_DATE(@Data_Registro_ANS, '%d/%m/%Y');

CREATE TABLE IF NOT EXISTS Demonstracoes_Contabeis(
DATA DATE,
REG_ANS VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
CD_CONTA_CONTABIL VARCHAR(20),
DESCRICAO VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
VL_SALDO_FINAL DECIMAL(15, 2),
CONSTRAINT Fk_registro FOREIGN KEY (REG_ANS) REFERENCES Relatorio_Operadoras(Registro_ANS)
)CHARACTER SET utf8mb4;

LOAD DATA INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/1T2019.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/2T2019.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/3T2019.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/4T2019.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/1T2020.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/2T2020.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/3T2020.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/Users/pvict/IntuitiveChallenge/Task3/4T2020.csv'
INTO TABLE Demonstracoes_Contabeis
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');