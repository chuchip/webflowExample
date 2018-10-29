
create TABLE clientes
(
    id int NOT NULL,
    login  varchar(45) not null,
    nombre varchar(100) not null,
    dni varchar(15) not null,
    unique key(login)
);

create table cuentas(
    cuenta varchar(50) not null,
    importe double not null,
    unique key(cuenta)
);

create table cuentas_clientes(
    id int not null,
    cuenta varchar(50) not null,
    unique key(id,cuenta)
);
alter table cuentas_clientes add CONSTRAINT fk_cuentas FOREIGN KEY (cuenta) REFERENCES cuentas (cuenta);

--drop table users;
create table users(
    username   varchar(45) not null,
    password varchar(100) not null,
    enabled smallint not null default 1,
    unique key (username)
);
--drop table user_roles;
CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username)
  );
alter table user_roles add CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username)
