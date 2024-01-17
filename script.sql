CREATE TABLE roles (
   id_role   Serial PRIMARY KEY
  ,role_name Varchar(40) NOT NULL
  ,role_code Char(5)     NOT NULL CHECK(role_code in ('ADMIN', 'PACTE', 'COACH', 'NUTRI'))
);


INSERT INTO roles (role_name, role_code)
VALUES ('Administrador', 'ADMIN'),
       ('Paciente', 'PACTE'),
       ('Treinador', 'COACH'),
       ('Nutricionista', 'NUTRI');


CREATE TABLE users (
   id_user       Serial     PRIMARY KEY
  ,user_name     Varchar(80) NOT NULL
  ,cpf_cnpj      Varchar(14) NOT NULL UNIQUE
  ,email         Varchar(80) NOT NULL
  ,created_date  timestamp   NOT NULL
  ,last_login    timestamp
  ,id_role       Int         NOT NULL
  ,FOREIGN KEY (id_role) REFERENCES roles (id_role)
 );


CREATE TABLE user_passwords (
   id_password   Serial PRIMARY KEY
  ,id_user       INT         NOT NULL
  ,user_password Varchar(50) NOT NULL
  ,created_date  Timestamp   NOT NULL,
  FOREIGN KEY (id_User) REFERENCES users (id_user)
)

INSERT INTO users (user_name
                  ,cpf_cnpj
                  ,email
                  ,created_date
                  ,id_role)
VALUES ('sanus', '12345678910', 'sanus@gmail.com', CURRENT_DATE, 1); 


select * 
from users
     inner join roles
     on roles.id_role = users.id_role