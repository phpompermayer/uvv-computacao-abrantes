CREATE TABLE publico.usuarios (
                id_usuario NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                senha VARCHAR(255) NOT NULL,
                sexo CHAR(1),
                nome VARCHAR(255),
                nascimento DATE,
                CONSTRAINT usuarios PRIMARY KEY (id_usuario)
);


CREATE TABLE publico.posts (
                id_post NUMERIC(38) NOT NULL,
                data de postagem DATE,
                conteudo VARCHAR(255) NOT NULL,
                id_usuario NUMERIC(38) NOT NULL,
                CONSTRAINT posts PRIMARY KEY (id_post)
);


CREATE TABLE publico.comentarios (
                id_comentario NUMERIC(38) NOT NULL,
                data do comentario DATE,
                conteudo VARCHAR(255) NOT NULL,
                id_post NUMERIC(38) NOT NULL,
                id_usuario NUMERIC(38) NOT NULL,
                CONSTRAINT comentarios PRIMARY KEY (id_comentario)
);


CREATE TABLE publico.telefone (
                id_telefone NUMERIC(38) NOT NULL,
                ddd NUMERIC(2) NOT NULL,
                numero NUMERIC(10) NOT NULL,
                id_usuario NUMERIC(38) NOT NULL,
                CONSTRAINT telefone PRIMARY KEY (id_telefone)
);


CREATE TABLE publico.amigos (
                id_amigo NUMERIC(38) NOT NULL,
                data da amizade DATE,
                id_usuario NUMERIC(38) NOT NULL,
                CONSTRAINT amigos PRIMARY KEY (id_amigo)
);


CREATE TABLE publico.endereço (
                id_endereço NUMERIC(38) NOT NULL,
                cep VARCHAR(255) NOT NULL,
                bairro VARCHAR(255),
                rua VARCHAR(255),
                pais VARCHAR(255) NOT NULL,
                complemento VARCHAR(255) NOT NULL,
                usuarios_id NUMERIC(38) NOT NULL,
                CONSTRAINT endereco PRIMARY KEY (id_endereço)
);

ALTER TABLE publico.telefone ADD CONSTRAINT usuarios_telefone
FOREIGN KEY (id_usuario)
REFERENCES publico.usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE publico.endereço ADD CONSTRAINT usuarios_endereco
FOREIGN KEY (usuarios_id)
REFERENCES publico.usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE publico.amigos ADD CONSTRAINT usuarios_amigos
FOREIGN KEY (id_usuario)
REFERENCES publico.usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE publico.comentarios ADD CONSTRAINT posts_comentarios
FOREIGN KEY (id_post)
REFERENCES publico.posts (id_post)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE publico.posts ADD CONSTRAINT usuarios_posts
FOREIGN KEY (id_usuario)
REFERENCES publico.usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE publico.comentarios ADD CONSTRAINT usuarios_comentarios
FOREIGN KEY (id_usuario)
REFERENCES publico.usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
