--Mostre um comando em SQL que permita verificar se todos os dados estao consistentes para acrescentar a sigla dos estados na SchoolShoots. Cuidado com espacos em branco nos atributos.
SELECT SchoolShoots.state, USStates.State, USStates.StateName FROM 
    SchoolShoots LEFT JOIN USStates ON 
    (SchoolShoots.state = USStates.StateName) LIMIT 20;

--Escreva um comando simples que corrija os dados
SELECT SchoolShoots.state, USStates.State, USStates.StateName FROM 
    SchoolShoots JOIN USStates ON 
    (TRIM(' ' FROM SchoolShoots.state) = USStates.StateName) LIMIT 20;

--Modifique a tabela SchoolShoots para acrescentar a sigla dos estados.
ALTER TABLE SchoolShoots ADD SttNam TEXT;  

UPDATE SchoolShoots SET
    SttNam = tableAux.Stn FROM
    (SELECT USStates.State as Stn, USStates.StateName FROM 
    SchoolShoots JOIN USStates ON 
    (TRIM(' ' FROM SchoolShoots.state) = USStates.StateName)) AS tableAux
    WHERE (TRIM(' ' FROM SchoolShoots.state) = tableAux.StateName);