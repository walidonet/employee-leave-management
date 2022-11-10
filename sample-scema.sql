-- SQLINES DEMO *** ---------------------------------------
-- SQLINES DEMO ***              127.0.0.1
-- SQLINES DEMO ***              10.5.8-MariaDB - mariadb.org binary distribution
-- SQLINES DEMO ***              Win64
-- SQLINES DEMO ***              11.1.0.6116
-- SQLINES DEMO *** ---------------------------------------

/* SQLINES DEMO *** ARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/* SQLINES DEMO *** tf8 */;
/* SQLINES DEMO *** tf8mb4 */;
/* SQLINES DEMO *** REIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/* SQLINES DEMO *** L_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/* SQLINES DEMO *** L_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- SQLINES DEMO *** structure for leavemanagement
CREATE DATABASE `leavemanagement` /* SQLINES DEMO *** RACTER SET latin1 */;
SET SCHEMA 'leavemanagement';

-- SQLINES DEMO ***  for table leavemanagement.employee
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE employee_seq;

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
    CONSTRAINT FK5amfhprgb3rrhxjx7rq3al980 FOREIGN KEY (supervisor) REFERENCES employee (employee_id),
    CONSTRAINT FKaqbqb3qdsfq2f9v3nj7ddgj57 FOREIGN KEY (group_id) REFERENCES employee_group (group_id)
    )  ;

ALTER SEQUENCE employee_seq RESTART WITH 2;

-- SQLINES DEMO *** table leavemanagement.employee: ~1 rows (approximately)
/* SQLINES DEMO ***  `employee` DISABLE KEYS */;

CREATE INDEX FKaqbqb3qdsfq2f9v3nj7ddgj57 ON employee (group_id);
CREATE INDEX FK5amfhprgb3rrhxjx7rq3al980 ON employee (supervisor);
REPLACE INTO employee (employee_id, created_at, email, first_name, last_name, middle_name, password, phone_number, role, status, username, group_id, supervisor) VALUES
	(1, '2020-12-16 20:01:33', NULL, 'admin', 'admin', NULL, '$2a$10$9YBWBYJhjSYCeOpEzIG/H.WbPqlNa688Fs7klp7P07vOUX27ubwlu', '000000000', 'ROLE_ADMIN', 'ACTIVE', 'admin', NULL, NULL);
/* SQLINES DEMO ***  `employee` ENABLE KEYS */;

-- SQLINES DEMO ***  for table leavemanagement.employee_group
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE employee_group_seq;

CREATE TABLE IF NOT EXISTS employee_group (
    group_id bigint NOT NULL DEFAULT NEXTVAL ('employee_group_seq'),
    group_name varchar(255) DEFAULT NULL,
    PRIMARY KEY (group_id)
    ) ;

-- SQLINES DEMO *** table leavemanagement.employee_group: ~0 rows (approximately)
/* SQLINES DEMO ***  `employee_group` DISABLE KEYS */;
/* SQLINES DEMO ***  `employee_group` ENABLE KEYS */;

-- SQLINES DEMO ***  for table leavemanagement.event
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE event_seq;

CREATE TABLE IF NOT EXISTS event (
    event_id bigint NOT NULL DEFAULT NEXTVAL ('event_seq'),
    created_at timestamp(0) NOT NULL,
    end_date date DEFAULT NULL,
    event_type varchar(255) DEFAULT NULL,
    start_date date DEFAULT NULL,
    title varchar(255) DEFAULT NULL,
    PRIMARY KEY (event_id)
    ) ;

-- SQLINES DEMO *** table leavemanagement.event: ~0 rows (approximately)
/* SQLINES DEMO ***  `event` DISABLE KEYS */;
/* SQLINES DEMO ***  `event` ENABLE KEYS */;

-- SQLINES DEMO ***  for table leavemanagement.leave_request
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE leave_request_seq;

CREATE TABLE IF NOT EXISTS leave_request (
    leave_id bigint NOT NULL DEFAULT NEXTVAL ('leave_request_seq'),
    created_at timestamp(0) NOT NULL,
    denied_reason text DEFAULT NULL,
    from_date date NOT NULL,
    leave_reason text NOT NULL,
    status varchar(255) NOT NULL,
    to_date date NOT NULL,
    employee_id bigint NOT NULL,
    leave_type bigint NOT NULL,
    reviewed_by bigint DEFAULT NULL,
    PRIMARY KEY (leave_id)
    ,
    CONSTRAINT FK7nc4hxm1gc3ud3kq7612sgleg FOREIGN KEY (leave_type) REFERENCES leave_type (leave_type_id),
    CONSTRAINT FKlm66o70qrqubdmyxha1r817k1 FOREIGN KEY (reviewed_by) REFERENCES employee (employee_id),
    CONSTRAINT FKtc4wao0ica39vusknbo96ln2w FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
    ) ;

CREATE INDEX FKtc4wao0ica39vusknbo96ln2w ON leave_request (employee_id);
CREATE INDEX FK7nc4hxm1gc3ud3kq7612sgleg ON leave_request (leave_type);
CREATE INDEX FKlm66o70qrqubdmyxha1r817k1 ON leave_request (reviewed_by);

-- SQLINES DEMO *** table leavemanagement.leave_request: ~0 rows (approximately)
/* SQLINES DEMO ***  `leave_request` DISABLE KEYS */;
/* SQLINES DEMO ***  `leave_request` ENABLE KEYS */;

-- SQLINES DEMO ***  for table leavemanagement.leave_type
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE leave_type_seq;

CREATE TABLE IF NOT EXISTS leave_type (
    leave_type_id bigint NOT NULL DEFAULT NEXTVAL ('leave_type_seq'),
    status varchar(255) NOT NULL,
    type_name varchar(255) NOT NULL,
    PRIMARY KEY (leave_type_id),
    CONSTRAINT UK_neurrpkaxg9cheirk5cr06kgk UNIQUE (type_name)
    ) ;

-- SQLINES DEMO *** table leavemanagement.leave_type: ~0 rows (approximately)
/* SQLINES DEMO ***  `leave_type` DISABLE KEYS */;
/* SQLINES DEMO ***  `leave_type` ENABLE KEYS */;

-- SQLINES DEMO ***  for table leavemanagement.oauth_access_token
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS oauth_access_token (
    token_id varchar(255) DEFAULT NULL,
    token mediumblob DEFAULT NULL,
    authentication_id varchar(255) NOT NULL,
    user_name varchar(255) DEFAULT NULL,
    client_id varchar(255) DEFAULT NULL,
    authentication mediumblob DEFAULT NULL,
    refresh_token varchar(255) DEFAULT NULL,
    PRIMARY KEY (authentication_id)
    ) ;

-- SQLINES DEMO *** table leavemanagement.oauth_access_token: ~0 rows (approximately)
/* SQLINES DEMO ***  `oauth_access_token` DISABLE KEYS */;
/* SQLINES DEMO ***  `oauth_access_token` ENABLE KEYS */;

-- SQLINES DEMO ***  for table leavemanagement.oauth_refresh_token
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS oauth_refresh_token (
    token_id varchar(255) DEFAULT NULL,
    token mediumblob DEFAULT NULL,
    authentication mediumblob DEFAULT NULL
    ) ;

-- SQLINES DEMO *** table leavemanagement.oauth_refresh_token: ~0 rows (approximately)
/* SQLINES DEMO ***  `oauth_refresh_token` DISABLE KEYS */;
/* SQLINES DEMO ***  `oauth_refresh_token` ENABLE KEYS */;

/* SQLINES DEMO *** E=IFNULL(@OLD_SQL_MODE, '') */;
/* SQLINES DEMO *** _KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/* SQLINES DEMO *** ER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/* SQLINES DEMO *** ES=@OLD_SQL_NOTES */;
