Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 02/06/2022

Var
   transacoes:vetor[1..20] de caractere
   tipoTransacao,contTransacoes,i: inteiro
   continuar:  logico
   saldoAtual,valorTransacao: real
   nomeCliente,chavePix,resposta:caractere

FUNCAO gerarSaldo(): real
var
   aleatorioReal:real
   aleatorioInteiro:inteiro
inicio
   aleatorioInteiro<-(randi(10)+1)*1000
   aleatorioReal<-(rand+1)*aleatorioInteiro
   retorne aleatorioReal
FIMFUNCAO


FUNCAO depositar(valor: real):real
inicio
   transacoes[contTransacoes]<-"Tipo: DEPÓSITO || Valor: R$" + numpcarac(valor)
   retorne saldoAtual+valor
FIMFUNCAO

FUNCAO transferir(valor: real; contaDestino: caractere): real
inicio
   transacoes[contTransacoes]<-"Tipo: PIX || Valor: R$" +numpcarac(valor)+ " || Pix Destino: " +contaDestino
   retorne saldoAtual-valor
FIMFUNCAO

FUNCAO sacar(valor:real):real
inicio
   transacoes[contTransacoes]<-"Tipo: SAQUE || Valor: R$" +numpcarac(valor)
   retorne saldoAtual-valor
FIMFUNCAO

Inicio
   escreval("======BANCO W. FINANCE======")
   escreval("Informe seu nome: ")
   leia(nomeCliente)
   escreval("Seja Bem-Vindo, ", nomeCliente,"!!")
   saldoAtual<- gerarSaldo() // gera saldo aleatório
   escreval()

   escreval("[ÁREA DE TRANSAÇÕES]")
   continuar <- verdadeiro
   contTransacoes<-0
   ENQUANTO (continuar = verdadeiro) e (contTransacoes<20)  faca
      escreval("SALDO ATUAL: R$", saldoAtual:6:2)
      escreval("Informe o tipo: (1)DEPÓSITO (2)PIX (3)SAQUE (0)SAIR :")
      leia(resposta)

      ESCOLHA resposta
      caso "1"
         escreval("Informe o valor do depósito: ")
         leia(valorTransacao)
         contTransacoes<-contTransacoes+1
         saldoAtual<-depositar(valorTransacao)
         escreval("Depósito efetuado com sucesso.")

      caso "2"
         escreval("Informe o valor da transferência: ")
         leia(valorTransacao)
         se((saldoAtual-valorTransacao)<0) entao
            escreval("SALDO INSUFICIENTE.")
         senao
            escreval("Informe a chave pix da conta destino: ")
            leia(chavePix)
            contTransacoes<-contTransacoes+1
            saldoAtual<-transferir(valorTransacao,chavePix)
            escreval("Transferência efetuada com sucesso.")
         fimse

      caso "3"
         escreval("Informe o valor que deseja sacar: ")
         leia(valorTransacao)
         se((saldoAtual-valorTransacao)<0) entao
            escreval("SALDO INSUFICIENTE.")
         senao
            contTransacoes<-contTransacoes+1
            saldoAtual<-sacar(valorTransacao)
            escreval("Saque efetuado com sucesso.")
         fimse

      caso "0"
         continuar<- falso
      outrocaso
         escreval("Informe uma opção válida!")
      FIMESCOLHA
      escreval()
   FIMENQUANTO

   se(contTransacoes=20) entao
      escreval("Você antingiu o número máximo de 20 transações diárias.")
   fimse

   escreval()
   escreval("## Seu saldo atual é de: R$",saldoAtual:6:2," ##")
   escreval()

   escreval("Deseja imprimir o extrato detalhado? (1)SIM (0)NÃO")
   leia(resposta)
   se (resposta = 1) entao
      escreval()
      escreval("## EXTRATO DETALHADO: ##")
      i<-1
      enquanto (contTransacoes>0) faca
         escreval(transacoes[i])
         i<-i+1
         contTransacoes<-contTransacoes-1
      fimenquanto
   fimse

   escreval()
   escreval("Obrigado pela preferência!")
   escreval("======BANCO W. FINANCE======")

Fimalgoritmo

