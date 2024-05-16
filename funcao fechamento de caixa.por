programa
{
	inclua biblioteca Graficos--> grf
	inclua biblioteca Tipos--> typ
	inclua biblioteca Texto--> txt
	inclua biblioteca Calendario--> cal
	inclua biblioteca Matematica--> mat
	inclua biblioteca Util--> utl
	inclua biblioteca Arquivos--> src

	const inteiro TAM_X_TELA = 1920	
	const inteiro TAM_Y_TELA = 1080
	const inteiro PROD = 5
	const inteiro VENDA = 4
	
	funcao inicio()
	{	

		//variaveis
		inteiro arquivo, mnu=0, qtd_estoque=0, id_produto=0
		real val_uni=0.0, val_custo=0.0
		cadeia nome_produto="", vetsrc[5], typdata[2]={"arquivodetexto|txt","arquivodetexto|txt"}, password = "admin"
		inteiro opcao
	     cadeia  vetorProd[5], vetorVend[5], linhaOriginal=""
	     inteiro posicao=0, vetDeNum[5]
		cadeia caminho ="./todos os dados dos Produtos"
		escreva("Selecione a sequência de arquivos:\n1-Carrinho\n2-Produtos Registrados\n3-Total de vendas\n4-Vendas do dia\n5-Registro de vendas")
		para(inteiro c=0;c<5;c++){
			vetsrc[c] = src.selecionar_arquivo(typdata, verdadeiro)
		}
		limpa()
		//leitura de arquivos
		
		//menu de opções
			imprime_mnu(mnu)
			limpa()
			escolha(mnu){
				caso 1:
					//Cadastrar produtos
					verifAcess(password)
					inteiro y=0
						escreva("Quantos produtos irá cadastrar?: ")
						leia(y)
						limpa()
					para(inteiro i=0; i<y; i++){
						//cadastroProduto(vetsrc[1])
					}
					inicio()
				pare
				caso 2:
					//realizar vendas
					
				pare
				caso 3:
					//relatorio temporario
					
				pare
				caso 4:
					//fechar caixa
					fechamentoCaixa(password,vetorProd,vetorVend,caminho,linhaOriginal,posicao,vetDeNum,vetsrc)
					
				pare
				caso 5:
					//verificar acesso
					
				pare
				caso contrario:
				inicio()
			}
	}
	funcao inteiro imprime_mnu(inteiro &opcao){
		escreva("Escolha uma opcao \n\n 1) Cadastrar produto         2) Registrar Venda\n 3) Relatorio Atual           4) Fechar Caixa e Sair\n\nDigite o numero referente a opção desejada: ")
		leia(opcao)
		retorne opcao
	}

funcao fechamentoCaixa(cadeia password, cadeia vetorProd[], cadeia vetorVend[], cadeia caminho, cadeia linhaOriginal, inteiro posicao, inteiro vetDeNum[],cadeia vetsrc[]) {
	
    // Solicita a verificação de acesso
    verifAcess(password)
    logico formato_24h = verdadeiro
    // Após a verificação bem-sucedida, pergunte ao usuário se ele realmente deseja fechar o caixa
    escreva("Você realmente deseja fechar o caixa? (S/N)\n-->")
    caracter resposta
    leia(resposta)
    enquanto (resposta != 'S' e resposta != 's' e resposta != 'N' e resposta != 'n') {
        escreva("Entrada inválida. Por favor, insira 'S' para sim ou 'N' para não.\n-->")
        leia(resposta)
    }
    se (resposta == 'N' ou resposta == 'n') {
        inicio() // Volta para o menu inicial se o usuário responder 'N' ou 'n'
    }
    // Se o usuário responder 'S' ou 's', prossiga com o fechamento do caixa
    escreva("Fechando o caixa...\n")
     gerarRelatorioVendas(vetsrc)

   // Registrar a data e hora de fechamento
    cadeia dataHoraFechamento = Data()
    escreva("Data e hora de fechamento: ", dataHoraFechamento, "\n")
    
}
   funcao cadeia Data() {
    cadeia dia = typ.inteiro_para_cadeia(cal.dia_mes_atual(),10)
    cadeia mes = typ.inteiro_para_cadeia(cal.mes_atual(),10)
    cadeia ano = typ.inteiro_para_cadeia(cal.ano_atual(),10)
    cadeia hora = typ.inteiro_para_cadeia(cal.hora_atual(verdadeiro),10) // formato_24h = verdadeiro
    cadeia minuto = typ.inteiro_para_cadeia(cal.minuto_atual(),10)

    // Adiciona um zero à esquerda se o dia, mês, hora ou minuto tiverem apenas um dígito
    se (txt.numero_caracteres(dia) == 1) {
        dia = "0" + dia
    }
    se (txt.numero_caracteres(mes) == 1) {
        mes = "0" + mes
    }
    se (txt.numero_caracteres(hora) == 1) {
        hora = "0" + hora
    }
    se (txt.numero_caracteres(minuto) == 1) {
        minuto = "0" + minuto
    }

    retorne ""+dia+"/"+mes+"/"+ano+"\t"+hora+":"+minuto
}

funcao vazio gerarRelatorioVendas(cadeia vetsrc[]) {
    // Abra o arquivo onde os dados de vendas estão armazenados
    inteiro c = 0
    cadeia caminho = vetsrc[c]
    cadeia dataHoraFechamento = Data()
    inteiro arquivoVendas = src.abrir_arquivo(caminho, src.MODO_LEITURA)

    escreva("=============================================\n")
    escreva("RELATÓRIO DE VENDAS - DATA: ", dataHoraFechamento, "\n")
    escreva("=============================================\n\n")
    escreva("PRODUTO\t\tQUANTIDADE VENDIDA\tPREÇO UNITÁRIO\tTOTAL DE VENDAS\n")

    cadeia linhaVenda = src.ler_linha(arquivoVendas)
    // Percorra cada venda no arquivo
    enquanto (src.fim_arquivo(arquivoVendas) == falso) {
        // Supondo que os dados de venda estejam estruturados como: produto|quantidade|preco_unitario
         

        // Imprima os detalhes de cada venda
       

        // Leia a próxima linha no arquivo de vendas
        linhaVenda = src.ler_linha(arquivoVendas)
    }

    escreva("\n=============================================\n")
    escreva("TOTAL DE VENDAS DO DIA: " + "\n")
    escreva("=============================================\n")

    // Feche o arquivo de vendas
    src.fechar_arquivo(arquivoVendas)
}
     funcao vazio verifAcess (cadeia password){
		cadeia senha
		inteiro contador=0
		escreva("Verificação de Acesso\n\nDigite a senha para continuar:\n->")
		leia(senha)
		limpa()
		se(senha=="x" ou senha=="X"){
			inicio()
		}
		enquanto(senha!=password){
			contador++
			se(contador==5){
				para(inteiro i=30;i>0;i--){
					limpa()
					escreva("Você errou demais, aguarde ",i," segundos para tentar novamente...")
					utl.aguarde(1000)
				}
				limpa()
			}
			escreva("Senha incorreta!Tente novamente:\n->")
			leia(senha)
			limpa()
			se(senha=="x" ou senha=="X"){
				inicio()
			}
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1968; 
 * @DOBRAMENTO-CODIGO = [157];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */