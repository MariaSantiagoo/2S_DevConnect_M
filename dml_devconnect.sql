--DML
USE db_devconnect;

INSERT INTO tb_usuario(NomeCompleto,Nomeusuario, Email, Senha, FotoPerfilUrl)
VALUES 
('Giulia Marzano', 'Giukia','Giuliamarzano@gmail.com', 1234, 'www.fotoperfilgiukia.com'),
('Maria Almeida', 'Mari','MariaAlm@gmail.com', 1234, 'www.fotoperfilmari.com');

INSERT INTO tb_publicacao(Descricao, ImagemUrl, DataPublicacao,Idusuario)
VALUES 
('<3', 'www.imagempublicacao.com', '2025/10/02', 1),
(':)', 'www.imagempublicacao.com', '2025/10/03', 2);

INSERT INTO tb_curtida(IdUsuario, IdPublicacao)
VALUES 
(1,3);

INSERT INTO tb_seguidor(IdUsuarioSeguir, IdUsuarioSeguidor)
VALUES 
(1,2),
(2,1);

INSERT INTO tb_comentario(IdUsuario, IdPublicacao, Texto, DataComentario)
VALUES 
(1, 3, 'Linda<3', '2025/10/02');

UPDATE tb_usuario
SET Senha = '4321'
WHERE Nomeusuario = 'Mari';