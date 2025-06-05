algoritmo 'LojaEletronicos'
// Algoritmo de uma loja de eletr�nicos com cadastro, listagem, venda e pesquisa de produtos

// Declaração das variáveis principais
var
   // Vetor para armazenar os códigos dos produtos
   codigo: vetor[1..100] de inteiro
   // Vetor para armazenar os nomes dos produtos
   nome: vetor[1..100] de caractere
   // Vetor para armazenar os preços dos produtos
   preco: vetor[1..100] de real
   // Vetor para armazenar a quantidade em estoque
   quantidade: vetor[1..100] de inteiro
   // Variveis auxiliares
   opcao, codigoProduto, totalProdutos, i, opcaoCompra, formaPagamento: inteiro
   // Variável para verificar se um produto foi encontrado
   encontrado: logico
   // Variáveis para nome do produto e forma de pagamento
   nomeProduto, formaPagamentoTexto: caractere

// Procedimento que inicializa a loja com alguns produtos
procedimento InicializarProdutos
inicio
   // Cadastro de smartphones
   codigo[1] <- 1
   nome[1] <- "iPhone 15"
   preco[1] <- 7999.90
   quantidade[1] <- 10

   codigo[2] <- 2
   nome[2] <- "Samsung Galaxy S23"
   preco[2] <- 4599.00
   quantidade[2] <- 15

   codigo[3] <- 3
   nome[3] <- "Xiaomi Redmi Note 12"
   preco[3] <- 1499.90
   quantidade[3] <- 20

   // Cadastro de notebooks
   codigo[4] <- 4
   nome[4] <- "MacBook Pro M2"
   preco[4] <- 12999.00
   quantidade[4] <- 5

   codigo[5] <- 5
   nome[5] <- "Dell Inspiron 15"
   preco[5] <- 3599.00
   quantidade[5] <- 8

   // Cadastro de acessórios
   codigo[6] <- 6
   nome[6] <- "Fone Bluetooth Sony"
   preco[6] <- 599.90
   quantidade[6] <- 30

   codigo[7] <- 7
   nome[7] <- "Smartwatch Amazfit"
   preco[7] <- 899.00
   quantidade[7] <- 12

   // Cadastro de TVs
   codigo[8] <- 8
   nome[8] <- "TV LG OLED 55"
   preco[8] <- 4999.00
   quantidade[8] <- 7

   codigo[9] <- 9
   nome[9] <- "TV Samsung 50 4K"
   preco[9] <- 2899.90
   quantidade[9] <- 9

   // Cadastro de videogame
   codigo[10] <- 10
   nome[10] <- "PlayStation 5"
   preco[10] <- 4499.00
   quantidade[10] <- 6

   // Define a quantidade total de produtos cadastrados
   totalProdutos <- 10
fimprocedimento

// In�cio do programa principal
inicio
   // Inicializa a contagem de produtos
   totalProdutos <- 0

   // Chama o procedimento para cadastrar os produtos iniciais
   InicializarProdutos()

   // Loop principal do menu
   repita
      escreval("")
      escreval("=== LOJA DE ELETR�NICOS ===")
      escreval("1 - Cadastrar Produto")
      escreval("2 - Listar Produtos")
      escreval("3 - Vender Produto")
      escreval("4 - Pesquisar Produto")
      escreval("0 - Sair")
      escreval("===========================")
      escreva("Escolha uma opção: ")
      leia(opcao)

      // Menu de opções
      escolha opcao

         // Opçao para cadastrar novo produto
         caso 1
            se totalProdutos < 100 entao
               totalProdutos <- totalProdutos + 1
               codigo[totalProdutos] <- totalProdutos

               escreval("")
               escreval("Cadastro do Produto ", totalProdutos)
               escreva("Nome do produto: ")
               leia(nome[totalProdutos])
               escreva("Preço: R$ ")
               leia(preco[totalProdutos])
               escreva("Quantidade em estoque: ")
               leia(quantidade[totalProdutos])

               escreval("Produto cadastrado com sucesso!")
            senao
               escreval("Limite de produtos atingido (100)!")
            fimse

         // Op��o para listar todos os produtos
         caso 2
            se totalProdutos = 0 entao
               escreval("Nenhum produto cadastrado ainda.")
            senao
               escreval("")
               escreval("=== LISTA DE PRODUTOS ===")
               escreval("Código | Nome | Preço | Estoque")
               para i de 1 ate totalProdutos faca
                  escreva(codigo[i]:6, " | ")
                  escreva(nome[i]:20, " | ")
                  escreva("R$ ", preco[i]:7:2, " | ")
                  escreval(quantidade[i]:5)
               fimpara
            fimse

         // Op��o para vender um produto
         caso 3
            se totalProdutos = 0 entao
               escreval("Nenhum produto cadastrado para venda.")
            senao
               encontrado <- falso
               escreval("")
               escreva("Digite o CÓDIGO do produto para vender: ")
               leia(codigoProduto)

               para i de 1 ate totalProdutos faca
                  se codigo[i] = codigoProduto entao
                     encontrado <- verdadeiro

                     // Verifica se há estoque
                     se quantidade[i] > 0 entao
                        escreval("")
                        escreval("=== DETALHES DO PRODUTO ===")
                        escreval("Código: ", codigo[i])
                        escreval("Produto: ", nome[i])
                        escreval("Preço: R$ ", preco[i]:0:2)

                        // Confirmação da compra
                        repita
                           escreval("")
                           escreval("CONFIRMA��O DE COMPRA:")
                           escreval("1 - Confirmar compra")
                           escreval("2 - Cancelar compra")
                           escreva("Escolha uma opção: ")
                           leia(opcaoCompra)

                           se opcaoCompra = 1 entao
                              escreval("")
                              escreval("FORMAS DE PAGAMENTO:")
                              escreval("1 - Pix")
                              escreval("2 - Cartão")
                              escreval("3 - Dinheiro")
                              escreva("Escolha a forma de pagamento: ")
                              leia(formaPagamento)

                              // Seleciona a forma de pagamento
                              escolha formaPagamento
                                 caso 1
                                    formaPagamentoTexto <- "Pix"
                                 caso 2
                                    formaPagamentoTexto <- "Cartão"
                                 caso 3
                                    formaPagamentoTexto <- "Dinheiro"
                                 outrocaso
                                    formaPagamentoTexto <- "Pix"
                                    formaPagamento <- 1
                              fimescolha

                              // Finaliza a venda e atualiza o estoque
                              quantidade[i] <- quantidade[i] - 1
                              escreval("")
                              escreval("=== COMPRA CONFIRMADA ===")
                              escreval("Produto: ", nome[i])
                              escreval("Valor: R$ ", preco[i]:0:2)
                              escreval("Forma de pagamento: ", formaPagamentoTexto)
                              interrompa

                           senao se opcaoCompra = 2 entao
                              escreval("")
                              escreval("Compra cancelada pelo usu�rio.")
                              interrompa
                           senao
                              escreval("Opção inv�lida! Digite 1 ou 2.")
                           fimse
                        ate falso
                     senao
                        escreval("")
                        escreval("Produto sem estoque!")
                     fimse
                     interrompa
                  fimse
               fimpara

               se nao encontrado entao
                  escreval("Produto n�o encontrado!")
               fimse
            fimse

         // Opção para pesquisar um produto
         caso 4
            se totalProdutos = 0 entao
               escreval("Nenhum produto cadastrado para pesquisa.")
            senao
               escreva("Digite o CÓDIGO do produto: ")
               leia(codigoProduto)

               encontrado <- falso

               para i de 1 ate totalProdutos faca
                  se codigo[i] = codigoProduto entao
                     encontrado <- verdadeiro
                     escreval("----------------------")
                     escreval("C�digo: ", codigo[i])
                     escreval("Nome: ", nome[i])
                     escreval("Pre�o: R$ ", preco[i]:0:2)
                     escreval("Estoque: ", quantidade[i])
                     interrompa
                  fimse
               fimpara

               se nao encontrado entao
                  escreval("Produto n�o encontrado com este c�digo.")
               fimse
            fimse

         // Opção para sair do programa
         caso 0
            escreval("Saindo do sistema...")

         // Opção inválida
         outrocaso
            escreval("Opção inv�lida! Tente novamente.")
      fimescolha
   ate opcao = 0

// Fim do programa
fimalgoritmo
