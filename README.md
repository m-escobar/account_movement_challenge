# App Movimentação de Contas
Esta é uma aplicação em Ruby, linha de comando, que calcula o saldo da conta corrente dos clientes.

***
## Execução
Para executar esta aplicação, execute a aplicação passando como parâmetros os nomes dos arquivos de contas e de transações, conforme abaixo:
#### ruby account_movement.rb account_file_name.csv transactions_file_name.csv

O formato dos arquivos de entrada devem ser em CSV - sem cabeçalho, sem aspas e com campos delimitados por vírgula.
Conteúdo dos arquivos
### Contas:
    Número da conta (inteiro)
    Saldo inicial da conta, em centavos de real (inteiro) 
    Exemplo: 123,13052 (Conta: 123, Saldo Inicial: R$ 130,52)

### Transações:
    Número da conta (inteiro)
    Valor da transação, em centavos de real (inteiro) Uma transação com valor negativo é um débito na conta e uma transação com valor positivo é um depósito na conta. 
    Exemplo: 123,-5300 (Débito de R$ 53,00 na conta 123)
    Exemplo: 123,350000 (Depósito de R$ 3.500,00 na conta 123)

***
## Cálculo do Saldo
O saldo da conta será calculado a partir do saldo inicial. Será aplicada uma transação por vez, na sequência que estas forem lançadas no arquivo de transações.

Os débitos reduzirão o saldo da conta e depósitos aumentarão o saldo da conta, conforme o valor da transação. Não existem limites positivos ou negativos para o saldo de uma conta, porém quando uma conta tiver seu saldo final negativo após uma transação de débito será cobrada uma multa de R$3,00 imediatamente. Esta multa será aplicada independentemente da conta estar ou não com saldo negativo antes da transação, porém se a transação for um depósito a multa não se aplica. 

### Criação da conta:
  Saldo inicial da conta 123: R$100,00;
### Primeira movimentação:
  Débito de R$103,00 na conta 123;
  Saldo atual da conta 123: R$ -6,00 (aplicada multa de R$3,00);
### Segunda movimentação:
  Débito de R$10,00 da conta 123;
  Saldo atual da conta 123: R$-19,00 (R$3,00 de multa aplicado);
### Terceira movimentação:
  Depósito de R$5,00 na conta 123;
  Saldo final da conta 123: R$-14,00
  
***
## Visualização dos resultados
A saída deve será exibida na tela (stdout) no formato abaixo:

***
# Sobre o projeto:
  Neste projeto foi utilizada apenas a gem 'CSV' para auxílio na leitura dos arquivos de contas e transações.
