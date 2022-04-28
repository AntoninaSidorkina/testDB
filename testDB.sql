CREATE DATABASE testDb;

CREATE TABLE Clients ( 
	ID int NOT NULL,
	UserID int,
    UserName varchar(50),
    Email varchar(50), 
	PasswordID int,
    PRIMARY KEY (ID),
    UNIQUE(UserID),
    UNIQUE(PasswordID)
);

CREATE TABLE Users (
	ID int NOT NULL,
	UserID int,
    FirstName varchar(50),
    LastName varchar(50),
    Age tinyint,
    Country varchar(50),
	PRIMARY KEY (ID),
    UNIQUE(UserID)
);

CREATE TABLE Passwords (
	ID int NOT NULL,
    UserID int,
	PasswordID int ,
    HashedPassword varchar(50),
    Salt varchar(50),
    Pepper varchar(50),
	PRIMARY KEY (ID),
    UNIQUE(PasswordID)
);

DROP TABLE Clients;
DROP TABLE Users;
DROP TABLE Passwords;

SELECT * FROM Clients;
SELECT * FROM Users;
SELECT * FROM Passwords;

ALTER TABLE Clients
ADD FOREIGN KEY (UserID) REFERENCES Users(UserID),
ADD FOREIGN KEY (PasswordID) REFERENCES Passwords(PasswordID);

ALTER TABLE Users
ADD FOREIGN KEY (UserID) REFERENCES Clients(UserID);

ALTER TABLE Passwords
ADD FOREIGN KEY (UserID) REFERENCES Clients(UserID);

ALTER TABLE Users
DROP FOREIGN KEY users_ibfk_2;



