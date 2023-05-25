USE bdEscolaIdiomas1

--1-Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;
SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.idMatricula=tbMatricula.idAluno
		INNER JOIN tbTurma ON tbTurma.idCurso=tbTurma.idTurma
			INNER JOIN tbCurso ON tbCurso.idCurso=tbCurso.idCurso

--2-Apresentar a quantidade de alunos por nome do curso;
SELECT tbCurso.nomeCurso, COUNT(tbAluno.idAluno) AS quantidade_alunos
FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
GROUP BY tbCurso.nomeCurso;

--3-Apresentar a quantidade de alunos matriculados por nome da turma;
SELECT tbTurma.nomeTurma, COUNT(tbAluno.idAluno) AS quantidade_alunos
FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
GROUP BY tbTurma.nomeTurma;

--4-Apresentar a quantidade de alunos que fizeram matr�cula em maio de 2016;
SELECT COUNT(tbAluno.idAluno) AS quantidade_alunos
FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
WHERE MONTH(tbMatricula.dataMatricula) = 5 AND YEAR(tbMatricula.dataMatricula) = 2016;

--5-Apresentar o nome dos alunos em ordem alfab�tica ao lado do nome das turmas em que est�o matriculados;
SELECT tbAluno.nomeAluno, tbTurma.nomeTurma
FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
ORDER BY tbAluno.nomeAluno;

--6-Apresentar o nome dos cursos e os hor�rios que eles s�o oferecidos;
SELECT tbCurso.nomeCurso, tbTurma.horarioTurma
FROM tbCurso
INNER JOIN tbTurma ON tbCurso.idCurso = tbTurma.idCurso;

--7-Apresentar a quantidade de alunos nascidos por estado;
SELECT tbAluno.naturalidadeAluno, COUNT(tbAluno.idAluno) AS quantidade_alunos
FROM tbAluno
GROUP BY tbAluno.naturalidadeAluno;

--8-Apresentar o nome dos alunos ao lado da data de matr�cula no formato dd/mm/aaaa;
SELECT tbAluno.naturalidadeAluno, COUNT(tbAluno.idAluno) AS quantidade_alunos
FROM tbAluno
GROUP BY tbAluno.naturalidadeAluno;

--9-Apresentar os alunos cujo nome comece com o A e que estejam matriculados no curso de ingl�s;
SELECT tbAluno.nomeAluno
FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
WHERE tbAluno.nomeAluno LIKE 'A%' AND tbCurso.nomeCurso = 'Ingl�s';

--10-Apresentar a quantidade de matr�culas feitas no ano de 2016;
SELECT COUNT(tbAluno.idAluno) AS quantidade_alunos
FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
WHERE YEAR(tbMatricula.dataMatricula) = 2016;