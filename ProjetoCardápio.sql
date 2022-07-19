create database if not exists cardapio;
  use cardapio;

  create table if not exists manager(
    name varchar (50) not null,
    phone char(14)not null,
    email varchar(40) not null,
    login varchar (12),
    password char (6) ,
    cpf char(11) ,
    id_manager integer not null auto_increment primary key
  );

  create table if not exists establishment(
    name varchar(50) not null,
    cnpj char(12) not null,
    address varchar (255),
    id_establishment integer not null auto_increment primary key,
    id_manager integer not null,
    CONSTRAINT id_managerFK FOREIGN KEY (id_manager) REFERENCES manager (id_manager)
    );

  create table if not exists menu(
    name varchar(50) not null,
    description varchar (200),
    products int,
    id_menu integer not null auto_increment primary key,
    id_establishment integer not null,
    constraint id_establishmentFK foreign key (id_establishment) references establishment (id_establishment)
  );

   create table if not exists employees(
     name varchar(50) not null,
     cpf char(11) not null,
     phone char(14) not null,
     email varchar (100),
     address varchar(255),
     id_employee integer not null auto_increment primary key,
     id_establishment integer not null,
      constraint id_establishmentEMPFK foreign key (id_establishment) references establishment (id_establishment)
   );

   create table if not exists products(
     name varchar(50) not null,
     description char(200),
     price float not null,
     id_product integer not null auto_increment primary key,
     id_menu integer not null,
     constraint id_menuFK foreign KEY (id_menu) references menu (id_menu)
   );

   create table if not exists request (
     total float not null,
     tablenumber int not null,
     id_request integer not null auto_increment primary key
   );

   create table if not exists requestItems(
     amount int,
     subtotal float,
     id_requestItems integer not null auto_increment primary key,
     id_request integer not null,
     id_product integer not null,
     constraint id_requestFK foreign KEY (id_request) references request (id_request),
     constraint id_productFK foreign key (id_product) references products (id_product)
   );

   insert into manager (name, phone, email) values ('Wesley Diogo','42998644852','wesleydiogodovale@hotmail.com');
   insert into manager (name, phone, email) values ('joão da silva','42998635214','Jsilva@hotmail.com');
   insert into manager (name, phone, email) values ('Marcos souza','42998644785','marcossouza@hotmail.com');
