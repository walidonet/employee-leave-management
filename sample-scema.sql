CREATE SEQUENCE employee_seq;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS employee (
    employee_id bigint NOT NULL DEFAULT NEXTVAL ('employee_seq'),
    created_at timestamp(0) NOT NULL,
    email varchar(255) DEFAULT NULL,
    first_name varchar(255) DEFAULT NULL,
    last_name varchar(255) NOT NULL,
    middle_name varchar(255) DEFAULT NULL,
    password varchar(255) NOT NULL,
    phone_number varchar(255) NOT NULL,
    role varchar(255) NOT NULL,
    status varchar(255) NOT NULL,
    username varchar(255) NOT NULL,
    group_id bigint DEFAULT NULL,
    supervisor bigint DEFAULT NULL,
    PRIMARY KEY (employee_id),
    CONSTRAINT UK_im8flsuftl52etbhgnr62d6wh UNIQUE  (username)
    ,
    CONSTRAINT FK5amfhprgb3rrhxjx7rq3al980 FOREIGN KEY (supervisor) REFERENCES employee (employee_id)
    )  ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX FK5amfhprgb3rrhxjx7rq3al980 ON employee (supervisor);
insert INTO employee (employee_id, created_at, email, first_name, last_name, middle_name, password, phone_number, role, status, username, supervisor) VALUES
(1, '2020-12-16 20:01:33', NULL, 'admin', 'admin', NULL, '$2a$10$9YBWBYJhjSYCeOpEzIG/H.WbPqlNa688Fs7klp7P07vOUX27ubwlu', '000000000', 'ROLE_ADMIN', 'ACTIVE', 'admin', NULL);
/* SQLINES DEMO ***  `employee` ENABLE KEYS */;
