programa
{
	//Bibliotecas
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
     inteiro TelaMenu = g.carregar_imagem("C:/Users/Aluno/Desktop/portugol/Telas/Menu/telaMenu.png")

     //CadastrarProduto
     inteiro TelaVerificaAdm = g.carregar_imagem("C:/Users/Aluno/Desktop/portugol/Telas/Cadastrar/Tela_senha.png")
     /*inteiro TelaAdmNegado = g.carregar_imagem()
     inteiro TelaCusto = g.carregar_imagem()
     inteiro TelaPreco = g.carregar_imagem()
     inteiro TelaQuant = g.carregar_imagem()

     //RealizarVendas
     inteiro TelaCodigo = g.carregar_imagem()
     inteiro TelaQuantidade = g.carregar_imagem()
     inteiro TelaQuantErrada = g.carregar_imagem()
     inteiro TelaValor = g.carregar_imagem()
     inteiro TelaTroco = g.carregar_imagem()
     inteiro TelaFormaPag = g.carregar_imagem()
     inteiro TelaPagCart = g.carregar_imagem()
     inteiro TelaOpcCart = g.carregar_imagem()
     inteiro TelaPagCartConc = g.carregar_imagem()
     inteiro TelaPagPix = g.carregar_imagem()
     inteiro TelaPagPixConc = g.carregar_imagem()

     //Relatório
     inteiro TelaRelatDia = g.carregar_imagem()
     inteiro TelaVerificaAdm = g.carregar_imagem()
	inteiro TelaCaixFechado = g.carregar_imagem()
	
     //FecharCaixa
     inteiro TelaVerificaAdm = g.carregar_imagem()
     inteiro TelaAdmNegado = g.carregar_imagem()
     inteiro TelaRelatFinal = g.carregar_imagem()*/

 //---------------------------------------------------------------------------

     funcao inicio()
     {
          g.definir_cor(Graficos.COR_BRANCO)
          interacaoBotaoLogar()
     }

//-------------------------------------------------------------------------------

	//Função para ativar o mouse
     funcao logico mouse(inteiro x, inteiro y, inteiro a, inteiro b)
     {
          se (m.posicao_x() >= x e m.posicao_y() >= y e m.posicao_x() <= x + a e m.posicao_y() <= y + b) {
               retorne verdadeiro
          }
          retorne falso
     }
//--------------------------------------------------------------------------------
	
     funcao interacaoBotaoLogar()
     {
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LarguraT, AlturaT)
          g.renderizar()// antes de aparecer alguma imagem aparece uma tela preta.
         
          
          enquanto (verdadeiro) {
          	
               
               inteiro TelaMenu2 = g.redimensionar_imagem(TelaMenu, 1920, 1080, verdadeiro) // variavel que recebe a foto da variavel (telaMenu) e redimensiona para cobrir toda a janela.
               
               g.desenhar_imagem(1,1, TelaMenu2)
               g.liberar_imagem(TelaMenu2)  // libera o cache dessa imagem da memoria RAM 

			//Função para Cadastrar Produtos

			inteiro VerificaAdm = 0
			inteiro mou = m.ler_botao() 
			inteiro botao = 0
			
			cadeia texto = ""
			
       	  	
       	  	
			////////////////////////////
			
           	se(mouse(735, 330, 325, 85) == verdadeiro e mou == m.BOTAO_ESQUERDO){
           		botao = 1
               }
               se(botao == 1){
               	inteiro saida = 0
               	enquanto(saida != 1){
               		g.desenhar_imagem(1, 1, TelaVerificaAdm)
               		Escrever(texto)
		               g.renderizar()
		               
               	}
	               
               }
               //Função para Realizar Vendas
           	se(mouse(735, 475, 325, 85) == verdadeiro e m.ler_botao() == 1){
           		
				g.definir_cor(g.COR_VERDE)
		     	g.definir_tamanho_texto(20.0)
		          g.desenhar_texto(LarguraT/4, AlturaT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	
		     
               }

               //Função para Relatório 
            	se(mouse(735, 620, 325, 85) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
            		
				g.desenhar_retangulo(LarguraT/2.5, 550, 350, 35, verdadeiro, falso)
				g.definir_cor(g.COR_VERDE)
		     	g.definir_tamanho_texto(20.0)
		          g.desenhar_texto(LarguraT/4, AlturaT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		  		     	
			
               }

               //Função para Fechar caixa
            	se(mouse(735, 765, 325, 85) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
            		
				g.desenhar_retangulo(LarguraT/2.5, 550, 350, 35, verdadeiro, falso)
				g.definir_cor(g.COR_VERDE)
		     	g.definir_tamanho_texto(20.0)
		          g.desenhar_texto(LarguraT/4, AlturaT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	
			
               }
               g.renderizar()
          }
          g.encerrar_modo_grafico()
     }

     funcao vazio Apresenta_Menu()// função para aparecer a outra tela 
     {
     	
     }

     funcao vazio Escrever (cadeia &texto)
     {
     	
		inteiro tam = txt.numero_caracteres(texto)
          inteiro tecla = tec.ler_tecla() // função para pegar o código da tecla pressionada.

		g.definir_cor(g.COR_AZUL) // cor da letra da variavel ( texto )
          g.definir_tamanho_texto(20.0) // ( texto)
		se (tecla >= tec.TECLA_A e tecla <= tec.TECLA_Z ou tecla == tec.TECLA_ESPACO) {
                    texto += tec.caracter_tecla(tecla)
          }
          senao {
                    se (tecla == tec.TECLA_BACKSPACE e tam >= 1) {
                         texto = txt.extrair_subtexto(texto, 0, tam - 1)
                    }
          }
          g.desenhar_texto(735, 330, texto)
     }
}
