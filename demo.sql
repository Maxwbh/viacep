DECLARE 
  tcep pkg_util.recod_cep;
BEGIN
	tcep := pkg_util.get_cep(pcep => '30240020');
	dbms_output.Put_line (' Cep:'||tcep.cep ||CHR(13)||
	                      ' Logradouro: '||tcep.Logradouro ||CHR(13)||
                          ' complemento: '||tcep.complemento ||CHR(13)||
						  ' bairro: '||tcep.bairro  ||CHR(13)||
						  ' localidade: '||tcep.localidade||CHR(13)||
						  ' ibge:'||tcep.ibge);
END ;
