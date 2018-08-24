-- 1)Recupere todos os atributos dos professores do departamento Ciência da Computação.
select d.nome, p.* from professor p join departamento d on (d.codigo = p.codigoDepartamento)
where upper(d.nome) ilike upper('CIÊNCIA DA COMPUTAÇÃO')
-- 2)Recupere o CPF, nome e endereço dos professores do departamento Administração.
select p.cpf, p.nome, p.bairro, p.cidade, p.estado
from professor p join departamento d on (p.codigoDepartamento = d.codigo)
where upper(d.nome) ilike upper('Administração')
-- 3)Recupere as disciplinas dos cursos de Ciência da Computação e Física.
select *
from disciplina dis join curso c on (dis.codigocurso = c.codigo)
where upper(c.nome) = (upper('Ciência da computação')) or upper(c.nome) = (upper('Fisica'));
-- 4)Recupere os alunos matriculados na disciplina Engenharia de Software do curso
-- Ciência da Computação no semestre 2012-2. O resultado deve conter: ano, semestre,
-- matrícula do aluno, nome do aluno, código da disciplina, nome da disciplina e o código do curso.
select m.anosemestre, m.numerosemestre, a.matricula, a.nome, d.codigo, d.nome
from aluno a join matricula m on (a.matricula = m.matriculaaluno)
	join disciplina d on (m.codigodisciplina = d.codigo) and  (m.codigocurso = d.codigocurso)
        join curso c on (d.codigocurso = c.codigo)
where upper(d.nome) = upper('Engenharia de Software') and
		upper(c.nome) = upper('Ciência da Computação') and
        m.anosemestre = '2012' and
        m.numerosemestre = '2'

-- 5)Recupere a quantidade de alunos matriculados na disciplina Banco de Dados II do curso Ciência da Computação em cada semestre letivo.
select count(1)
from aluno a join matricula m on (a.matricula = m.matriculaaluno)
	join disciplina d on (m.codigodisciplina = d.codigo) and  (m.codigocurso = d.codigocurso)
        join curso c on (d.codigocurso = c.codigo)
where upper(d.nome) = upper('Banco de Dados II') and
		upper(c.nome) = upper('Ciência da Computação')

-- 6)Recupere o CPF e nome dos professores que reprovaram mais de 2 alunos em um semestre
-- (reprovação => nota < 7.0). Mostrar também a ano e semestre das reprovações.
select p.nome, p.cpf, m.numerosemestre, count(1)
from professor p join vinculo v on (p.cpf = v.cpfprofessor)
	join disciplina d on (v.codigodisciplina = d.codigo)
    	join matricula m on (m.codigodisciplina = d.codigo)
where m.notafinal < 7.0
group by p.nome, p.cpf, m.numerosemestre
having count(1) > 2

-- 7)Recupere o código da disciplina, nome da disciplina, código do curso, número de alunos
-- matriculados na disciplina e a média das notas dos alunos matriculados na disciplina.

-- 8)Recupere os professores do curso de Ciência da Computação, em ordem alfabética.
-- A lista deve conter todos os atributos de Professor e o código do departamento onde ele está vinculado.

-- 9)Recupere os alunos que tiveram faltas. A lista deve conter nome do curso, nome da disciplina,
-- nome do aluno e número de faltas. Ordenar a relação de forma decrescente, de acordo com número de faltas.
