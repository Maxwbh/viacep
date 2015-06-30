CREATE OR REPLACE PACKAGE pkg_util IS

  TYPE recod_cep IS RECORD(
    cep         VARCHAR2(20),
    logradouro  VARCHAR2(2000),
    complemento VARCHAR2(2000),
    bairro      VARCHAR2(2000),
    localidade  VARCHAR2(2000),
    uf          CHAR(2),
    ibge        CHAR(7));

  FUNCTION get_cep(pcep IN VARCHAR2) RETURN recod_cep;

END pkg_util;
