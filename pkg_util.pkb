CREATE OR REPLACE PACKAGE BODY pkg_util IS
  FUNCTION get_cep(pcep IN VARCHAR2) RETURN recod_cep IS
    tcep recod_cep;
  BEGIN
    SELECT *
      INTO tcep
      FROM xmltable('/xmlcep' passing
                    xmltype(convert(utl_http.request('http://viacep.com.br/ws/' || pcep || '/xml'),
                                    'WE8ISO8859P1',
                                    'UTF8')) columns cep VARCHAR2(10) path 'cep',
                    logradouro VARCHAR2(2000) path 'logradouro',
                    complemento VARCHAR2(2000) path 'complemento',
                    bairro VARCHAR2(2000) path 'bairro',
                    localidade VARCHAR2(2000) path 'localidade',
                    uf VARCHAR2(2000) path 'uf',
                    ibge VARCHAR2(2000) path 'ibge') x;
    RETURN tcep;
  END;
END pkg_util;
