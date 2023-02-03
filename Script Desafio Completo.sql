--//1 - Buscar o nome e ano dos filmes
SELECT Nome
      ,Ano
FROM dbo.Filmes

--//2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome
      ,Ano
	  ,Duracao
FROM dbo.Filmes
ORDER BY ANO

--//3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome
      ,Ano
	  ,Duracao
FROM dbo.Filmes
WHERE Nome = 'De volta para o futuro'

--//Buscar os filmes lançados em 1997
SELECT Nome
      ,Ano
	  ,Duracao
FROM dbo.Filmes
WHERE Ano = 1997

--//5 - Buscar os filmes lançados APÓS o ano 2000
SELECT Nome
      ,Ano
	  ,Duracao
FROM dbo.Filmes
WHERE Ano > 2000

--//6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome
      ,Ano
	  ,Duracao
FROM dbo.Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao

--//7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano
      ,COUNT(Id) AS Quantidade
FROM dbo.Filmes
GROUP BY Ano
ORDER BY AVG(Duracao) DESC;

--/8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT PrimeiroNome
      ,UltimoNome
	  ,Genero
FROM dbo.Atores
WHERE Genero = 'M'

--//9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT PrimeiroNome
      ,UltimoNome
	  ,Genero
FROM dbo.Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome

--//10 - Buscar o nome do filme e o gênero
SELECT Filmes.Nome
      ,Generos.Genero
FROM dbo.Filmes
INNER JOIN dbo.FilmesGenero
ON FilmesGenero.IdFilme = Filmes.Id
INNER JOIN dbo.Generos
ON Generos.Id = FilmesGenero.IdGenero

--//11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT Filmes.Nome
      ,Generos.Genero
FROM dbo.Filmes
INNER JOIN dbo.FilmesGenero
ON FilmesGenero.IdFilme = Filmes.Id
INNER JOIN dbo.Generos
ON Generos.Id = FilmesGenero.IdGenero
WHERE Genero = 'Mistério'

--//12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT Filmes.Nome
      ,Atores.PrimeiroNome
	  ,Atores.UltimoNome
	  ,ElencoFilme.Papel
FROM dbo.Filmes
INNER JOIN dbo.ElencoFilme
ON ElencoFilme.IdFilme = Filmes.Id
INNER JOIN dbo.Atores
ON Atores.Id = ElencoFilme.IdAtor