create database RCGE;
use RCGE;

create table persona
(
id int primary key auto_increment,
num_documento int(11),
tipo_documento varchar(30) not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
correo_elect varchar(50) not null,
telefono varchar(10) not null
)engine=InnoDB;

create table usuario
(
id_usuario int primary key auto_increment,
tipo_usuario varchar(20) not null,
contraseña varchar(25) not null,
descripcion varchar(200),
id_persona int,

	constraint fkUsuarioPersona
	foreign key (id_persona)
	references persona (id)
	on delete no action
)engine=InnoDB;

create table Rol_sistema
(
id int not null,
tipo_rol varchar(20) not null,
id_usuario int,
	constraint fkUsuarioRolsistema
	foreign key (id_usuario)
	references usuario (id_usuario)
	on delete no action
)engine=InnoDB;

create table docente
(
id_docente int primary key auto_increment,
jornada varchar(10) not null,
id_usuario int,

	constraint fkDocenteUsuario
    foreign key (id_usuario)
    references usuario (id_usuario)
    on delete no action
)engine=InnoDB;

create table estudiante
(
id_estudiante int primary key auto_increment,
curso varchar(30) not null,
jornada varchar(10) not null,
id_usuario int,

	constraint fkEstudianteUsuario
    foreign key (id_usuario)
    references usuario (id_usuario)
    on delete no action
)engine=InnoDB;

create table acudiente
(
id_acudiente int primary key auto_increment,
id_estudiante int,
id_usuario int,

	constraint fkAcudienteEstudiante
    foreign key (id_estudiante)
    references estudiante (id_estudiante)
    on delete no action,
    
	constraint fkAcudienteUsuario
    foreign key (id_usuario)
    references usuario (id_usuario)
    on delete no action
)engine=InnoDB;

create table asistencia
(
id int primary key,
fecha date not null, 
hora time not null,
id_estudiante int,
id_docente int,
	constraint fkAsistenciaEstudiante
    foreign key (id_estudiante)
    references estudiante (id_estudiante)
    on delete no action,
    
    constraint fkAsistenciaDocente
    foreign key (id_docente)
    references docente (id_docente)
    on delete no action
)engine=InnoDB;