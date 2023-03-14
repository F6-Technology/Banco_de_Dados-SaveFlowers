create database SaveFlowers;

use SaveFlowers;

create table empresa(
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar(100) not null,
    cnpj varchar(18) not null,
	loginEmpresa varchar(50),
    senhaEmpresa varchar(50)
);

create table funcionario(
	idFuncionario int primary key auto_increment,
    tipoFuncionario varchar(50) not null, constraint chkTipoFuncionario check(tipoFuncionario in ('Administrador', 'Entregador')),
    nomeFuncionario varchar(100) not null,
    cpf char(14) not null,    
    dtNasc date not null,
    email varchar(100) not null,
    loginFuncionario varchar(50) not null,
    senhaFuncionario varchar(50) not null,
	fkEmpresa int, foreign key(fkEmpresa) references empresa(idEmpresa)
);

create table caminhao(
	idCaminhao int primary key auto_increment,
    placa char(8)
);

create table sensor(
	idSensor int primary key auto_increment,
    tipoSensor varchar(50) not null, constraint chkTipoSensor check (tipoSensor in ('Temperatura e Umidade')),
    statusSensor varchar(50) not null, constraint chkStatusSensor check (statusSensor in ('Ativo', 'Inativo', 'Em manutenção')),
    fkCaminhao int, foreign key (fkCaminhao) references caminhao(idCaminhao) 
);

create table capturaTemperaturaUmidade(
	idCaptura int primary key auto_increment,
    dtCaptura date not null,
    hrCaptura time not null,
    temperatura float not null,
    umidade float not null,
    fkSensor int, foreign key (fkSensor) references sensor(idSensor)
);


-- Inserção de Registros
insert into empresa values
	(null, 'Delivery Roses', '12.345.678/0001-00', 'DeliveryRoses', '1234');

insert into funcionario values
	(null, 'Administrador', 'Maria Rosaria da Silva', '123.456.789-01', '1985-06-25', 'mariarosario@hotmail.com', 'MariaRosario', '4321', 1),
    (null, 'Entregador', 'José Ferreira', '987.654.321-09', '1980-12-01', 'joseferreira@hotmail.com', 'JoseFerreira', '3412', 1),
    (null, 'Entregador', 'Bianca de Souza', '741.852.963-07', '1989-02-10', 'biancasouza@hotmail.com', 'BiancaSouza', '2143', 1),
    (null, 'Entregador', 'André Paulo Neto', '369.258.147-03', '1993-05-17', 'andreneto@hotmail.com', 'AndrePaulo', '1423', 1);
    
insert into caminhao values
	(null, 'BRA 2K20'),
    (null, 'BRA 2E19'),
    (null, 'BRA 0S17');
    
insert into sensor values
	(null, 'Temperatura e Umidade', 'Ativo', 1),
    (null, 'Temperatura e Umidade', 'Ativo', 2),
    (null, 'Temperatura e Umidade', 'Inativo', 3);
    
insert into capturaTemperaturaUmidade values
	(null, '2023-03-01', '13:00:00', 5, 73, 2),
    (null, '2023-03-01', '13:30:00', 5, 73, 2),
    (null, '2023-03-01', '14:00:00', 5, 72, 2),
    (null, '2023-03-02', '11:00:00', 4, 70, 1),
    (null, '2023-03-02', '11:30:00', 4, 70, 1),
    (null, '2023-03-02', '12:00:00', 20, 65, 1),
    (null, '2023-03-02', '12:30:00', 19, 65, 1),
    (null, '2023-03-03', '10:00:00', 7, 75, 3),
    (null, '2023-03-03', '10:30:00', 7, 75, 3),
    (null, '2023-03-03', '11:00:00', 6, 77, 3);


-- Consulta de dados
select * from capturaTemperaturaUmidade 
	order by dtCaptura;
    
select * from capturaTemperaturaUmidade 
	order by dtCaptura desc;
  
select * from capturatemperaturaumidade
	where temperatura > 7 or temperatura < 1 or umidade > 75 or umidade < 70;
  
select * from capturaTemperaturaUmidade 
	where dtCaptura = '2023-03-02';
    
select * from empresa;

select * from funcionario;

select * from funcionario
	where tipoFuncionario = 'Administrador';
    
select * from funcionario
	where tipoFuncionario = 'Entregador';
    
select * from caminhao;

select * from caminhao
	where placa = 'BRA 2K20';
    
select * from sensor;

select * from sensor
	where statusSensor = 'Ativo';

select * from sensor
	where statusSensor = 'Inativo';    
    