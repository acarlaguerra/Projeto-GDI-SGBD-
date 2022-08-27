CREATE TABLE Cargo_salario (
    cargo VARCHAR2(255) NOT NULL,
    salario NUMBER NOT NULL CHECK (salario >= 1212),
    CONSTRAINT cargo_pk PRIMARY KEY (cargo)
);
