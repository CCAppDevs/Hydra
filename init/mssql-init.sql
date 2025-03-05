USE [master];
GO

-- create user
IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'hydrauser')
BEGIN
    CREATE LOGIN [hydrauser] WITH PASSWORD = '#123Secret', CHECK_POLICY = OFF;
    ALTER SERVER ROLE [sysadmin] ADD MEMBER [hydrauser];
END
GO

-- create database
IF DB_ID('HydraApi') IS NOT NULL
BEGIN
    CREATE DATABASE [HydraApi];
END
GO

USE [HydraApi];
GO
-- create category table
BEGIN
    CREATE TABLE [Category] (
        [CategoryId] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [Name] NVARCHAR(MAX) NOT NULL,
    );
END
GO

-- create event table
BEGIN
    CREATE TABLE [Event] (
        [EventId] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [Description] NVARCHAR(MAX) NOT NULL,
        [Type] INT NOT NULL,
        [Timestamp] DATETIME2(7) NOT NULL,
        [HostAddress] NVARCHAR(MAX) NOT NULL,
        [CategoryId] INT NOT NULL
        FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
    );
END
GO

BEGIN
  -- insert data into category
  INSERT INTO Category
    ([name])
  VALUES
    ('Api Watcher'),
    ('File Watcher');
END
GO

BEGIN
  -- insert data into event
  INSERT INTO [Event]
    ([Description], [Type], [Timestamp], [HostAddress], [CategoryId])
  VALUES
    ('Test', 1, '2/11/2024 12:00:00 AM', '0.0.0.0', 1);
END
GO