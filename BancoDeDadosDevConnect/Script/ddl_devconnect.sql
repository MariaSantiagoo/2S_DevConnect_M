--DDL
CREATE DATABASE db_devconnect;
USE db_devconnect;

--executado
CREATE TABLE tb_usuario(
IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
NomeCompleto NVARCHAR(255) NOT NULL,
Nomeusuario NVARCHAR(50) UNIQUE NOT NULL,
Email NVARCHAR(255) UNIQUE NOT NULL,
Senha NVARCHAR(25) NOT NULL,
FotoPerfilUrl NVARCHAR(150) NULL,
);

--executado
CREATE TABLE tb_seguidor(
IdUsuarioSeguir INT NOT NULL,
IdUsuarioSeguidor INT NOT NULL

PRIMARY KEY (IdUsuarioSeguir, IdUsuarioSeguidor)
);

--executado
CREATE TABLE tb_publicacao(
IdPublicacao INT IDENTITY(1,1) PRIMARY KEY,
IdUsuario INT NOT NULL FOREIGN KEY (IdUsuario) REFERENCES tb_usuario (IdUsuario),
Descricao NVARCHAR(255) NOT NULL,
ImagemUrl NVARCHAR(150) NULL,
DataPublicacao DATE NOT NULL
);


--executado
CREATE TABLE tb_curtida(
IdCurtida INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
IdUsuario INT NOT NULL FOREIGN KEY (IdUsuario) REFERENCES tb_usuario (IdUsuario),
IdPublicacao INT NOT NULL FOREIGN KEY (IdPublicacao) REFERENCES tb_publicacao (IdPublicacao)
);

--executado
CREATE TABLE tb_comentario(
IdComentario INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
IdUsuario INT NOT NULL FOREIGN KEY (IdUsuario) REFERENCES tb_usuario (IdUsuario),
IdPublicacao INT NOT NULL FOREIGN KEY (IdPublicacao) REFERENCES tb_publicacao (IdPublicacao),
Texto NVARCHAR(200) NOT NULL,
DataComentario DATE NOT NULL
);