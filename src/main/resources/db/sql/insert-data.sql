insert into users values('user1','$2a$10$jL7.YblpS38SQdUC8JEdsuNLp0QSvubmFdENzxSbOvOTruBbWHooS',1); -- Contraseña: secret
insert into users values('admin','$2a$10$jL7.YblpS38SQdUC8JEdsuNLp0QSvubmFdENzxSbOvOTruBbWHooS',1); -- Contraseña: secret

INSERT INTO user_roles (username, role) VALUES ('admin', 'ROLE_USER');
INSERT INTO user_roles (username, role) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('user1', 'ROLE_USER');

insert into clientes values(1,'user1','Jesus J. Puente','11223344X');
insert into clientes values(2,'admin','El jefe','22334455Y');

insert into cuentas values('1111',5000.1);
insert into cuentas values('2222',500.34);
insert into cuentas values('3333',9900.23);
insert into cuentas values('9999',18900.44);

insert into cuentas_clientes values(1,'1111');
insert into cuentas_clientes values(1,'2222');
insert into cuentas_clientes values(2,'3333');
insert into cuentas_clientes values(2,'9999');

