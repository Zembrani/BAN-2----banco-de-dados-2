-- 1)Mostre o nome e a função dos mecânicos.
select nome, funcao
from mecanico

-- ou
create or replace view mec_nome_mecanico
as
select nome, funcao from mecanico

select nome, funcao
from mec_nome_mecanico
where nome = 'Pedro'

-- 2)Mostre o modelo e a marca dos veículos dos clientes.
select modelo, marca
from veiculo

-- 3)Mostre o nome dos mecânicos, o nome dos clientes, o modelo dos veículos e a data e hora dos consertos realizados.
select m.nome, c.nome, v.modelo, cons.data, cons.hora
from conserto cons join veiculo v on (cons.codv = v.codv)
		join mecanico m on (cons.codm = m.codm)
        	join cliente c on (c.codc = v.codc)

-- 4)Mostre o ano dos veículos e a média de quilometragem para cada ano.
select ano, avg(quilometragem)
from veiculo
group by ano
order by ano DESC

-- 5)Mostre o nome dos mecânicos e o total de consertos feitos por um mecânico em cada dia.
select m.nome, c.data, count(1)
from mecanico m join conserto c using (codm)
group by m.nome, c.data
order by c.data ASC

-- 6)Mostre o nome dos setores e o total de consertos feitos em um setor em cada dia.
select s.nome, c.data, count(1)
from mecanico m join conserto c using (codm)
	join setor s on (s.cods = m.cods)
group by s.nome, c.data
order by c.data ASC

-- 7)Mostre o nome das funções e o número de mecânicos que têm uma destas funções.
select m.funcao, count(1)
from mecanico m
group by m.funcao

-- 8)Mostre o nome dos mecânicos e suas funções e, para os mecânicos que estejam alocados a um setor, informe também o número e nome do setor.
select m.nome, m.funcao, s.cods, s.nome
from mecanico m left join setor s using (cods)

-- 9)Mostre o nome das funções dos mecânicos e a quantidade de consertos feitos agrupado por cada função.
select m.funcao, count(c)
from mecanico m left join conserto c using (codm)
group by m.funcao
