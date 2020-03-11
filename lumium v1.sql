create database lumium;
use lumium; -- criando e selecionando o banco

create table cliente( -- criando a tabela usuarios
	id int primary key auto_increment,
    nome varchar(100) not null,
    cnpj varchar(20) not null,
    servico int,
    orcamento decimal(5,2),
    telefone varchar(20),
    celular varchar(20),
    email varchar(50) not null
);

create table usuario(
	id int primary key auto_increment,
	id_cli int,
	foreign key(id_usu) references cliente(id),
	login varchar(50) not null,
	senha varchar(50) not null
);

create table outdoor( -- criando a tabela outdoor
	id int primary key auto_increment,
    id_cli int,
	foreign key(id_usu) references cliente(id), -- chave estrangeira, é  uma chave primaria vinda de outra tabela // id, chave da tabela cliente
    localidade varchar(100) not null
);

create table EntradasArduino( -- criando a tabela que recebera os dados do arduino
	id int primary key auto_increment,
    id_out int,
    foreign key(id_out) references outdoor(id), -- chave estrageira, id da tabela outdoor
	tipo int not null,
	valor int not null,
    dataHora dateTime not null
);
-- inserindo registros ficticios na tabela cliente
insert into cliente values (null, 'CenterPoint Luz', '14629125000190', 3, 200.05 ,'(17)1288-2551', '(42)98798-3478', 'd7846eba1b@emailtown.club'),
	(null, 'Silverback Outdoor', '41765118000198', 1, 50.00,'(74)4726-8281', '(35)93870-1193', 'adelyn4@lkxloans.com'), 
(null, 'StraighUp Outdoor', '82462446000100', 2, 65.00,'(31)5479-2956', '(80)99005-6161', 'gewohnheitsmens@zahuy.site'),
 (null, 'AllAround Outdoor', '98214658000109', 0, 0.00,'(16)2114-2032', '(26)95236-8588', 'arlinda@inserver.tk');

-- inserindo registros ficticios na tab outdoor
insert into outdoor values (null, 1, 'Av. Paulista 2000'),
(null, 2, 'Rua Augusta 300'), (null, 1, 'Av. Goiás 7000'), (null, 3, 'Av. Presidente Kennedy 180');

-- inserindo dados ficticios que no tab do arduino
insert into EntradasArduino values (null, 2, 1, '1000cd', '2020-02-20 15:30')
,(null, 2, 0, '900cd','06/06/2020 07:34'), (null, 3, 2, 150, '2021-10-23 19:20')
; 