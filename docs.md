---
title: Trabalho sobre SQL Básico
author:
  - Lucas de Almeida Carotta
  - USP 8598732
  - Danilo de Moraes Costa
  - USP 8921972
---

# Introdução
O trabalho segue de acordo as descrições, tirando algumas queries que mesmo presentes no anexo não foram implementadas. Dito isso a descrição diz sobre 10 arquivos de queries e de documentação, como há apenas oito tarefas descritas acreditamos que deve ter sido algum erro de digitação ou até mesmo alguma mudança na descrição do trabalho que tenha removido duas tarefas e não foram removidas do terceiro tópico do pdf de enunciado do trablho.

Como a documentação deste trabalho também foi feita utilizando o [pandoc](https://pandoc.org/), não vimos necessidade de anexar o arquivo ".txt" contendo o número dos alunos. Além disso o pandoc foi utilizado por não existir um "JSDoc" gratuito ou de fácil acesso para SQL, sendo que as opções que existem são pagas e consideravelmente caras; a ideia era utilizar o [TypeScript](https://www.typescriptlang.org/) para poder gerar a documentação encapsulando a chamada das funções SQLs em um código e documentando ele -- tal projeto pode ser visto na integra [aqui](https://github.com/Fazendaaa/SchoolShootings).

# Descrição das Tarefas
## Tarefa Um
A primeira tarefa seleciona os valores as ocorrências no primeiro comando SELECT. Já o segundo comando do tipo acaba somando o número de vítimas onde elas são da etinia negra.

## Tarefa Dois
O único comando SELECT apresentado no arquivo foi feito graças à ajuda [deste](https://stackoverflow.com/a/40317116/7092954) comentário em uma pergunta no StackOverflow; nele se mostra como calcular a mediana de uma maneira simple e rápida -- havia como se utilizar funções próprias do Postegres que permitiam tal abordagem, todavia tais funções não foram utilizadas por dificuldades em chamá-las.

## Tarefa Três
O primeiro comando SELECT mostra os dados disponíveis do censo americano para todas as capitais dos estados, limitando há apenas as 20 primeiras ocorrências assim como expecificado na descrição do trabalho. Já o segundo comando mostra quais dados estão incosistentes corrigindo tais inconsistências.

## Tarefa Quatro
O primeiro comando SELECT verifica quais dados estão consistentes e acrescenta a sigla dos estados na tabela SchoolShoots. Já o segundo corrige tais dados.

O comando ALTER TABLE acrescenta as siglas dos estados.

E o comando UPDATE dá uma junção de tais valores dando o devido tratamento à eles.
