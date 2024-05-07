DROP DATABASE IF EXISTS HikuCraft;
CREATE DATABASE HikuCraft;
USE HikuCraft;

-- Tables


-- Common tables

CREATE TABLE Player (
    UUID VARCHAR(36) NOT NULL,

    PRIMARY KEY (UUID),
    UNIQUE (UUID)
);


-- SemiRP tables

CREATE TABLE Economy (

    UUID VARCHAR(36) NOT NULL,
    Balance INT DEFAULT 0,

    PRIMARY KEY (UUID),
    UNIQUE (UUID),

    CONSTRAINT EconomyBalance CHECK (Balance >= 0),

    FOREIGN KEY (UUID) REFERENCES Player(UUID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Home (

    UUID VARCHAR(36) NOT NULL,
    Name VARCHAR(16) NOT NULL,
    World VARCHAR(16) NOT NULL,
    X INT NOT NULL,
    Y INT NOT NULL,
    Z INT NOT NULL,

    PRIMARY KEY (UUID, Name),
    UNIQUE (UUID, Name),

    CONSTRAINT HomeWorld CHECK (World IN ("survival", "village")),

    FOREIGN KEY (UUID) REFERENCES Player(UUID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- CREATE TABLE LastConnectionInfo (
--
--         UUID VARCHAR(36) NOT NULL,
--         Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--         TimeSpent MEDIUMINT UNSIGNED DEFAULT 0,
--         World VARCHAR(16) NOT NULL,
--         X INT NOT NULL,
--         Y INT NOT NULL,
--         Z INT NOT NULL,
--
--         PRIMARY KEY (UUID),
--         UNIQUE (UUID),
--
--         FOREIGN KEY (UUID) REFERENCES Player(UUID) ON DELETE CASCADE ON UPDATE CASCADE
-- );
--
--
-- CREATE TABLE TimeSpent (
--
--     UUID VARCHAR(36) NOT NULL,
--     Duration MEDIUMINT UNSIGNED DEFAULT 0,
--
--     PRIMARY KEY (UUID),
--     UNIQUE (UUID),
--
--     FOREIGN KEY (UUID) REFERENCES Player(UUID) ON DELETE CASCADE ON UPDATE CASCADE
-- );
--
--
-- CREATE TABLE SecondChance (
--
--     UUID VARCHAR(36) NOT NULL,
--     World VARCHAR(16) NOT NULL,
--     X INT NOT NULL,
--     Y INT NOT NULL,
--     Z INT NOT NULL,
--     Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--
--     PRIMARY KEY (UUID),
--     UNIQUE (UUID),
--
--     CONSTRAINT DeathWorld CHECK (World IN ("survival")),
--
--     FOREIGN KEY (UUID) REFERENCES Player(UUID) ON DELETE CASCADE ON UPDATE CASCADE
-- );
--


-- Users
DROP USER IF EXISTS 'HikuCraft_user'@'localhost';
CREATE USER 'HikuCraft_user'@'localhost' IDENTIFIED BY 'HikuCraft_user_psw';

GRANT SELECT ON HikuCraft.* TO 'HikuCraft_user'@'localhost';
GRANT INSERT ON HikuCraft.* TO 'HikuCraft_user'@'localhost';
GRANT UPDATE ON HikuCraft.* TO 'HikuCraft_user'@'localhost';
GRANT DELETE ON HikuCraft.Home TO 'HikuCraft_user'@'localhost';

