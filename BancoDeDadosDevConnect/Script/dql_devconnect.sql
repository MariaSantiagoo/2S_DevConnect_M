--DQL
USE db_devconnect;

SELECT * FROM tb_usuario;

SELECT * FROM tb_seguidor;

SELECT * FROM tb_publicacao;

SELECT * FROM tb_curtida;

SELECT * FROM tb_comentario;

--Exiba todos os nomes dos seguidores (de quem esta seguindo e de quem será seguido)

SELECT 
S.Nomeusuario AS Seguidor,
SE.Nomeusuario AS Seguir
FROM
tb_seguidor
INNER JOIN tb_usuario S ON tb_seguidor.IdUsuarioSeguir = S.IdUsuario
INNER JOIN tb_usuario SE ON tb_seguidor.IdUsuarioSeguidor = SE.IdUsuario;

--Exiba quantos seguidores possui um respectivo usuário

 SELECT 
    U.Nomeusuario AS Nome,
    COUNT(S.IdUsuarioSeguir)
  
 FROM tb_usuario U
    LEFT JOIN tb_seguidor S ON S.IdUsuarioSeguidor = U.IdUsuario
 GROUP BY U.Nomeusuario;

--Exiba todas as publicações contendo a descrição, o caminho da imagem, o nome de usuário
SELECT
U.Nomeusuario,
P.Descricao,
P.ImagemUrl

FROM tb_publicacao P
LEFT JOIN tb_usuario U ON P.IdUsuario = U.IdUsuario;


--Exiba todos os comentários com o nome e o texto de uma respectiva publicação

SELECT 
    USU.nomeusuario,
    com.texto
FROM tb_usuario USU
LEFT JOIN  tb_comentario com ON com.IdUsuario = USU.IdUsuario
WHERE IdPublicacao = 3;


--Exiba a quantidade de curtidas de uma respectiva publicação.

SELECT 
    curti.IdPublicacao,
    COUNT(curti.IdCurtida) AS qtd_curtidas
FROM tb_curtida curti
    LEFT JOIN tb_publicacao publi  ON curti.IdPublicacao = publi.IdPublicacao
    GROUP BY curti.IdPublicacao;

--Exiba todos usuários que não chegaram a fazer publicações.
SELECT 
    USU.nomeusuario
FROM tb_usuario USU
LEFT JOIN tb_publicacao publi ON publi.IdUsuario = USU.IdUsuario
WHERE publi.IdUsuario IS NULL;



--Exiba todos usuários que não chegaram a fazer reações.
SELECT 
    USU.nomeusuario
FROM tb_usuario USU
LEFT JOIN tb_curtida curti ON curti.IdUsuario = USU.IdUsuario
WHERE curti.IdUsuario IS NULL;


--Descurtir: remova uma curtida de um usuário há uma publicação.



--Tornar a coluna e como chave composta na tabela comentário. Para evitar duplicidade de curtida do mesmo usuário e publicação.