programa
{
	//Bibliotecas
	inclua biblioteca Sons -->s
     inclua biblioteca Graficos --> g
     inclua biblioteca Mouse --> m
     inclua biblioteca Calendario --> C
     inclua biblioteca Teclado --> tec
     inclua biblioteca Texto --> txt
     
//------------------------------------------------------------------

     //Altura e Largura da janela de exibição
     const inteiro LarguraT = 1920
     const inteiro AlturaT = 1080

//--------------------------------------------------------------------
 
 /*TELAS*/
 
	//Menu     
     inteiro TelaMenu = g.carregar_imagem("C:/Users/Aluno/Downloads/Realizar Vendas 02 (11).png")

       
     //RealizarVendas
     inteiro TelaCodigo = g.carregar_imagem("C:/Users/Aluno/Downloads/SistemaPadariaTurma237/midia/imagens/Telas do Front Padaria/vendas/vend_finali.png")
     
     
     
     
     

        
    funcao inicio() {
    	
    
		g.definir_cor(g.COR_BRANCO)
		interacaoBotaoLogar()

		
    }

	
	funcao logico mouse(inteiro x, inteiro y, inteiro a, inteiro b){
		se(m.posicao_x() >= x e m.posicao_y() >= y e m.posicao_x() <= x+a e m.posicao_y() <= y+b)
		{
			retorne verdadeiro
		}
		retorne falso
	}
	
	funcao interacaoBotaoLogar(){
				 
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_cor(g.criar_cor(35, 100, 100))
		g.desenhar_retangulo(300, 500, 160, 35, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(11.0)
		g.desenhar_texto(360, 510, "#PARTIU")	
		se(mouse(300, 500, 160, 35) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
			g.desenhar_retangulo(210, 320, 160, 35, verdadeiro, falso)
			g.definir_cor(g.COR_AMARELO)
		     g.definir_tamanho_texto(20.0)
		     g.definir_titulo_janela("Esse professor nem é gente.. é um ANJO ♡")
		}
	
        
        g.definir_dimensoes_janela(LarguraT, AlturaT)

		g.renderizar()
        
        enquanto (verdadeiro) {
          /*  g.definir_titulo_janela("COLHER DE CHÁ - NÃO ESPERO MENOS QUE ISSO DE VCS...  ♡")
            g.definir_cor(g.COR_PRETO)
            g.limpar()           
            g.definir_cor(g.COR_BRANCO)
            g.definir_tamanho_texto(32.0)
            g.desenhar_texto(LarguraT/8, AlturaT / 17, " Bem-vindo à Padaria Pão Quente! Como posso ajudá-lo hoje? ")
            g.desenhar_texto(LarguraT/3, AlturaT / 8, " Como posso ajudá-lo hoje?\n\n\n\n\n\n")
            g.desenhar_imagem(LarguraT/3, AlturaT/6, TelaMenu)*/

           g.definir_cor(g.criar_cor(100, 50, 100))
		g.desenhar_retangulo(LarguraT/2.5, 550, 350, 35, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(11.0)
		g.definir_tamanho_texto(20.0)
		g.desenhar_texto(LarguraT/2, 560, "Observação")	
		
		inteiro clic = m.ler_botao()
		
		se(mouse(LarguraT/2.5, 550, 350, 35) == verdadeiro e clic == 0){
			g.desenhar_retangulo(LarguraT/2.5, 550, 350, 35, verdadeiro, falso)
			g.definir_cor(g.COR_VERDE)
		     g.definir_tamanho_texto(20.0)
		               //g.desenhar_texto(LarguraT/4, AlturaT / 1.22,"Esse professor nem é gente.. é um ANJO! Agora são " + horarioH + " hora(s) e "+ horarioM + " minuto(s)")
		     		g.desenhar_texto(LarguraT/4, AlturaT / 1.15, " COLHER DE CHÁ - 3E30 DA MANHÃ... E O TRABALHO NEM É MEU...")

		     		g.desenhar_imagem(0, 0, TelaCodigo)

					g.definir_cor(g.COR_AZUL)
	//BOTAO DO VERIFICA ACESSO
			//seta de voltar da tela adm_negado
			
					g.desenhar_retangulo(55,980, 57, 50, verdadeiro, falso)	//Usada nas telas --> (senha_incorreta) e (tela_verfica_acesso1)		
	
	//TELA DE REALIZAR VENDA

					//POSIÇÕES DOS BOTÕES ----> Pode ser usado na (forma_pag) , (selec_cart)
			//Cartão
		     		g.desenhar_retangulo(461,292, 117, 50, falso, falso)		
		     		g.desenhar_retangulo(456,362, 128, 50, falso, falso)		// Débito
		     		g.desenhar_retangulo(456,432, 128, 50, falso, falso)		// Crédito
		     //Pix
		     		g.desenhar_retangulo(147,292, 117, 50, falso, falso)
		     //Dinheiro		
		     		g.desenhar_retangulo(305,292, 117, 50, falso, falso)		



		     		//LOCAL PARA ESCREVER
		     		
		    //Informe o codigo
		     		g.desenhar_texto(185,315,"Alelelelele")//  
		     //Informe a Quantidade                                  Pode ser usada na (cod_prod_qtdvend) , ()
		     		g.desenhar_texto(185,450,"tttttttttt")//



					//POSIÇÃO DO BOTÃO FINALIZAR VENDA

			//BOTAO
					g.desenhar_retangulo(193, 602, 356, 77, verdadeiro, falso)// Pode ser usado (vend_finali)
					
					//POSIÇÕES da TABELA    ---> Qualquer image com a tabela da parte vendas

					
					
			//LINHA 1
					g.desenhar_texto(750, 315, "222")		// CODIGO
					g.desenhar_texto(890, 315, "RRR")		//NOME
					g.desenhar_texto(1120, 315, "333")		//QUANTIDADE
					g.desenhar_texto(1315, 315, "Kg")		//UNIDADE
					g.desenhar_texto(1470, 315, "10,90 R$")		//CUSTO
					g.desenhar_texto(1645, 315, "44,55 R$")		//VALOR
			//LINHA 2
					g.desenhar_texto(750, 373, "222")		// CODIGO
					g.desenhar_texto(890, 373, "222")		//NOME
					g.desenhar_texto(1120, 373, "222")		//QUANTIDADE
					g.desenhar_texto(1315, 373, "22")		//UNIDADE
					g.desenhar_texto(1470, 373, "22,22 R$")		//CUSTO
					g.desenhar_texto(1645, 373, "22,22 R$")		//VALOR
			//LINHA 3
					g.desenhar_texto(750, 426, "222")		// CODIGO
					g.desenhar_texto(890, 426, "222")		//NOME
					g.desenhar_texto(1120, 426, "222")		//QUANTIDADE
					g.desenhar_texto(1315, 426, "22")		//UNIDADE
					g.desenhar_texto(1470, 426, "22,22 R$")		//CUSTO
					g.desenhar_texto(1645, 426, "22,22 R$")		//VALOR
			//LINHA 4
					g.desenhar_texto(750, 480, "222")		// CODIGO
					g.desenhar_texto(890, 480, "222")		//NOME
					g.desenhar_texto(1120, 480, "222")		//QUANTIDADE
					g.desenhar_texto(1315, 480, "22")		//UNIDADE
					g.desenhar_texto(1470, 480, "22,22 R$")		//CUSTO
					g.desenhar_texto(1645, 480, "22,22 R$")		//VALOR
			//LINHA 5
					g.desenhar_texto(750, 547, "222")		// CODIGO
					g.desenhar_texto(890, 547, "222")		//NOME
					g.desenhar_texto(1120, 547, "222")		//QUANTIDADE
					g.desenhar_texto(1315, 547, "22")		//UNIDADE
					g.desenhar_texto(1470, 547, "22,22 R$")		//CUSTO
					g.desenhar_texto(1645, 547, "22,22 R$")		//VALOR
			//LINHA 6
					g.desenhar_texto(750, 605, "222")		// CODIGO
					g.desenhar_texto(890, 605, "222")		//NOME
					g.desenhar_texto(1120, 605, "222")		//QUANTIDADE
					g.desenhar_texto(1315, 605, "22")		//UNIDADE
					g.desenhar_texto(1470, 605, "22,22 R$")		//CUSTO
					g.desenhar_texto(1645, 605, "22,22 R$")		//VALOR
			//LINHA 7
					g.desenhar_texto(750, 663, "222")		// CODIGO
					g.desenhar_texto(890, 663, "222")		//NOME
					g.desenhar_texto(1120, 663, "222")		//QUANTIDADE
					g.desenhar_texto(1315, 663, "22")		//UNIDADE
					g.desenhar_texto(1470, 663, "22,22 R$")		//CUSTO
					g.desenhar_texto(1645, 663, "22,22 R$")		//VALOR
			//LINHA 8
					g.desenhar_texto(750, 718, "222")		// CODIGO
					g.desenhar_texto(890, 718, "222")		//NOME
					g.desenhar_texto(1120, 718, "222")		//QUANTIDADE
					g.desenhar_texto(1315, 718, "22")		//UNIDADE
					g.desenhar_texto(1470, 718, "22,22 R$")		//CUSTO
					g.desenhar_texto(1645, 718, "22,22 R$")		//VALOR
			//LINHA 9
					g.desenhar_texto(750, 774, "222")		// CODIGO
					g.desenhar_texto(890, 774, "222")		//NOME
					g.desenhar_texto(1120, 774, "222")		//QUANTIDADE
					g.desenhar_texto(1315, 774, "22")		//UNIDADE
					g.desenhar_texto(1470, 774, "22,22 R$")		//CUSTO
					g.desenhar_texto(1645, 774, "22,22 R$")		//VALOR
			//LINHA 10
					g.desenhar_texto(750, 830, "222")		// CODIGO
					g.desenhar_texto(890, 830, "222")		//NOME
					g.desenhar_texto(1120, 830, "222")		//QUANTIDADE
					g.desenhar_texto(1315, 830, "22")		//UNIDADE
					g.desenhar_texto(1470, 830, "22,22 R$")		//CUSTO
					g.desenhar_texto(1645, 830, "22,22 R$")		//VALOR
			//LINHA 11
					g.desenhar_texto(750, 890, "222")		// CODIGO
					g.desenhar_texto(890, 890, "222")		//NOME
					g.desenhar_texto(1120, 890, "222")		//QUANTIDADE
					g.desenhar_texto(1315, 890, "22")		//UNIDADE
					g.desenhar_texto(1470, 890, "22,22 R$")		//CUSTO
					g.desenhar_texto(1645, 890, "22,22 R$")		//VALOR
		
		
					//POSIÇÃO DOS BOTÕES (FECHAR CAIXA)
					 	
		   //BOTÃO SIM	
					g.desenhar_retangulo(780,766, 127, 53, verdadeiro, falso)
		  //BOTÃO NÃO
					g.desenhar_retangulo(990,766, 127, 53, verdadeiro, falso)
					
					

					 
				
	//POSIÇÃO VENDA ( CASO FOR DINHEIRO )  Pode ser usado em (inf_pagtroco)
	
			//VALOR PAGO
					g.desenhar_texto(170, 435, "222")
			//TROCO
					g.desenhar_texto(160, 555, "222")		
					
					
				 
				 	
	//REALTÓRIO		--> Pode ser usado na tabela do relatorio
	
					//LINHA 1	
					g.desenhar_texto(455, 360, "555")//CÓDIGO
					g.desenhar_texto(690, 360, "rrrrrrrrrrrrrrr")//PRODUTO
					g.desenhar_texto(1060, 360, "22")//QUANTIDADE
					g.desenhar_texto(1380, 360, "890;00")//TOTAL

					
					//LINHA 2
					g.desenhar_texto(455, 415, "555")//CÓDIGO
					g.desenhar_texto(690, 415, "rrrrrrrrrrrrrrr")//PRODUTO
					g.desenhar_texto(1060, 415, "22")//QUANTIDADE
					g.desenhar_texto(1380, 415, "890;00")//TOTAL

					
					//LINHA 3
					g.desenhar_texto(455, 470, "555")//CÓDIGO
					g.desenhar_texto(690, 470, "rrrrrrrrrrrrrrr")//PRODUTO
					g.desenhar_texto(1060, 470, "22")//QUANTIDADE
					g.desenhar_texto(1380, 470, "890;00")//TOTAL

					
					//LINHA 4
					g.desenhar_texto(455, 525, "555")//CÓDIGO
					g.desenhar_texto(690, 525, "rrrrrrrrrrrrrrr")//PRODUTO
					g.desenhar_texto(1060, 525, "22")//QUANTIDADE
					g.desenhar_texto(1380, 525, "890;00")//TOTAL

					
					//LINHA 5
					g.desenhar_texto(455, 580, "555")//CÓDIGO
					g.desenhar_texto(690, 580, "rrrrrrrrrrrrrrr")//PRODUTO
					g.desenhar_texto(1060, 580, "22")//QUANTIDADE
					g.desenhar_texto(1380, 580, "890;00")//TOTAL

					
					//LINHA 6
					g.desenhar_texto(455, 635, "555")//CÓDIGO
					g.desenhar_texto(690, 635, "rrrrrrrrrrrrrrr")//PRODUTO
					g.desenhar_texto(1060, 635, "22")//QUANTIDADE
					g.desenhar_texto(1380, 635, "890;00")//TOTAL

					
					//LINHA 7
					g.desenhar_texto(455, 690, "555")//CÓDIGO
					g.desenhar_texto(690, 690, "rrrrrrrrrrrrrrr")//PRODUTO
					g.desenhar_texto(1060, 690, "22")//QUANTIDADE
					g.desenhar_texto(1380, 690, "890;00")//TOTAL


					//LINHA 8
					g.desenhar_texto(455, 745, "555")//CÓDIGO
					g.desenhar_texto(690, 745, "rrrrrrrrrrrrrrr")//PRODUTO
					g.desenhar_texto(1060, 745, "22")//QUANTIDADE
					g.desenhar_texto(1380, 745, "890;00")//TOTAL


					//LINHA9
					g.desenhar_texto(455, 800, "555")//CÓDIGO
					g.desenhar_texto(690, 800, "rrrrrrrrrrrrrrr")//PRODUTO
					g.desenhar_texto(1060, 800, "22")//QUANTIDADE
					g.desenhar_texto(1380, 800, "890;00")//TOTAL


					//LINHA 10
					g.desenhar_texto(455, 855, "555")//CÓDIGO
					g.desenhar_texto(690, 855, "rrrrrrrrrrrrrrr")//PRODUTO
					g.desenhar_texto(1060, 855, "22")//QUANTIDADE
					g.desenhar_texto(1380, 855, "890;00")//TOTAL

				
					
		}
            g.renderizar()
        }

   
        g.encerrar_modo_grafico()
    }


}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 639; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */