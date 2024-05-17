programa
{
	//Bibliotecas
     inclua biblioteca Graficos --> g
     inclua biblioteca Mouse --> m
     inclua biblioteca Calendario --> C
     inclua biblioteca Teclado --> tec
     inclua biblioteca Texto --> txt
     inclua biblioteca Tipos --> typ
     inclua biblioteca Util --> utl
//------------------------------------------------------------------

     //Altura e Largura da janela de exibição
     inteiro LarguraT = g.largura_tela()
     inteiro AlturaT = g.altura_tela()

//--------------------------------------------------------------------
 
 /*TELAS*/
 	cadeia computador =  utl.obter_diretorio_usuario()
	//Menu 
	inteiro ImgMenu = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/menu/menu_programa1.png")
     //Login e Senha
     inteiro ImgAcesso = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/verificar_ADM/tela_verfica_acesso1.png")
     inteiro ImgAcessoNegado = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/verificar_ADM/senha_incorreta.png")
     inteiro ImgExcessoTentativas = g.carregar_imagem ("./midia/imagens/Telas do Front Padaria/verificar_ADM/excedeu_tentativas.png")
     //cadastro
     inteiro ImgNome = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/nome_produto.png")
    	inteiro ImgCusto = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/custo_produto.png")
	inteiro ImgPesoUnitario = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/kg_ou_uni.png")
	inteiro ImgPeso = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/preco_kg.png")
	inteiro ImgUnitario = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/preco_unidade.png")
	inteiro ImgQuantidade = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/quant_produtos.png")
     inteiro ImgCadastroSucesso = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/produto_cadastrado.png")
	
     
     //RealizarVendas
     inteiro TelaCodigo = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/cod_produto.png")
     inteiro TelaQuantidade = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/cod_prod_qtdvend.png")
     inteiro TelaQuantErrada = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/erro_qtd_infor.png")
     inteiro TelaValor = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/valor_ pgmento.png")
     inteiro TelaTroco = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/inf_pagtroco.png")
     inteiro TelaFormaPag = g.carregar_imagem("./imagens/Telas do Front Padaria/vendas/forma_pag.png")
     inteiro TelaPagCart = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/selec_cart.png")
     inteiro PagCartDeb = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/pgmento_debito.png")
     inteiro PagCartCRed = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/pgmento_credito.png")
     inteiro TelaPagCartConc = g.carregar_imagem("/midia/imagens/Telas do Front Padaria/vendas/pag_aprovado.png")
     inteiro TelaPagPix = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/qrcod_gerado.png")
     inteiro TelaPagPixConc = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/qrcod_aprov.png")

     //Relatório
     inteiro TelaRelatDia = g.carregar_imagem("./midia/ima.gens/Telas do Front Padaria/relatorio/relatorio_vendas.png")
     inteiro TelaVerificaAdm = g.carregar_imagem("‪./midia/imagens/Telas do Front Padaria/verificar_ADM/tela_verfica_acesso1.png")
	inteiro TelaCaixFechado = g.carregar_imagem("./midia/imagens/Telas do Front Padaria/fechar_caixa/caixa_fechado.png")

     //FecharCaixa
     inteiro TelaVerificaAdm = g.carregar_imagem("‪./midia/imagens/Telas do Front Padaria/verificar_ADM/tela_verfica_acesso1.png")
     inteiro TelaAdmNegado = g.carregar_imagem("‪./midia/imagens/Telas do Front Padaria/verificar_ADM/senha_incorreta.png")
     inteiro TelaRelatFina5l = g.carregar_imagem("./midia/ima.gens/Telas do Front Padaria/relatorio/relatorio_vendas.png")
     funcao inicio (){
     
     }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4110; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */