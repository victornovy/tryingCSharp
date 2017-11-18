﻿CREATE DATABASE SALE;
USE SALE;
/*
- PRODUTO
    - ID (PK)
    - COD_BAR (UNIQ)
    - NOME
    - DESCRICAO
    - VR_UNIT
*/
CREATE TABLE PRODUTO(
    ID INT NOT NULL AUTO_INCREMENT,
    COD_BAR INT NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    VR_UNIT double(10,2) NOT NULL,
    DESCRICAO VARCHAR(255) NULL,
    UNIQUE (COD_BAR),
    PRIMARY KEY (ID)
);
INSERT INTO PRODUTO(COD_BAR, NOME, DESCRICAO, VR_UNIT) VALUES (1, 'CELULAR', 'ASUS ZENFONE', 890.99);
INSERT INTO PRODUTO(COD_BAR, NOME, DESCRICAO, VR_UNIT) VALUES (2, 'IFONE X', 'IFONE - PRODUTO EXCLUSIVO DO BRAZIL', 8890.99);
INSERT INTO PRODUTO(COD_BAR, NOME, VR_UNIT) VALUES (3, 'COMPUTA DOR', 2399.99);
INSERT INTO PRODUTO(COD_BAR, NOME, VR_UNIT) VALUES (4, 'PANO', 5.99);

/*
- ESTOQUE
    - ID (PK)
    - COD_BAR (FK)
    - QUANT
    - ID_ENTR_SAID
*/
CREATE TABLE ESTOQUE(
    ID INT NOT NULL AUTO_INCREMENT,
    COD_BAR INT NOT NULL,
    QUANT double(10,2) NOT NULL,
    ID_ENTR_SAID CHAR (1) NOT NULL,
	DT_ENTRADA DATE,
    CHECK (ID_ENTR_SAID = 'S' OR ID_ENTR_SAID = 'E'),
    FOREIGN KEY (COD_BAR) REFERENCES PRODUTO(COD_BAR),
    PRIMARY KEY (ID)
);
INSERT INTO ESTOQUE (COD_BAR, ID_ENTR_SAID, QUANT) VALUES (1, 'E', 20);
INSERT INTO ESTOQUE (COD_BAR, ID_ENTR_SAID, QUANT) VALUES (2, 'E', 20);
INSERT INTO ESTOQUE (COD_BAR, ID_ENTR_SAID, QUANT) VALUES (3, 'E', 20);
INSERT INTO ESTOQUE (COD_BAR, ID_ENTR_SAID, QUANT) VALUES (4, 'E', 20);

/*
- VENDA
    - ID (PK)
    - COD_BAR (FK)
    - QUANT
    - VR_DESC
*/
CREATE TABLE VENDA(
    ID INT NOT NULL,
    COD_BAR INT NOT NULL,
    QUANT double(10,2) NOT NULL,
    VR_DESC double(10,2) NOT NULL DEFAULT 0,
    VR_TOT double(10,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (COD_BAR) REFERENCES PRODUTO(COD_BAR),
    PRIMARY KEY (ID, COD_BAR)
);
INSERT INTO VENDA(ID, COD_BAR, QUANT, VR_DESC, VR_TOT) VALUES(1, 1, 2, 2, 5);
INSERT INTO VENDA(ID, COD_BAR, QUANT) VALUES(1, 2, 1);
INSERT INTO VENDA(ID, COD_BAR, QUANT, VR_DESC) VALUES(2, 3, 1, 5);
INSERT INTO VENDA(ID, COD_BAR, QUANT) VALUES(3, 4, 6);

/*
- OPERADOR
    - ID (PK)
    - NOME
    - SENHA
*/
CREATE TABLE OPERADOR(
    ID INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    SENHA VARCHAR(20) NOT NULL,
    PRIMARY KEY (ID)
);
INSERT INTO OPERADOR(NOME, SENHA) VALUES('VICTOR', '123');
INSERT INTO OPERADOR(NOME, SENHA) VALUES('NOVY', '123');
INSERT INTO OPERADOR(NOME, SENHA) VALUES('MARCELO', '123');
