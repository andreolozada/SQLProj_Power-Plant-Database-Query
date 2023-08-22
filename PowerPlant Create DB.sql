USE PowerPlantDB
GO

-- DDL (Table Creation)
CREATE TABLE OWNER (
    OwnerID INT PRIMARY KEY,
    CompanyName VARCHAR(50) NOT NULL,
    OfficeAddress VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE SUPPLY (
    SupplyType VARCHAR(10) PRIMARY KEY,
    MinCF DECIMAL(10, 2) NOT NULL,
    MaxCF DECIMAL(10, 2) NOT NULL,
);

CREATE TABLE POWERPLANT (
    PlantID INT PRIMARY KEY,
    OwnerID INT,
    PlantName VARCHAR(50) NOT NULL,
    RatedCapacity DECIMAL(10, 2) NOT NULL,
    SupplyType VARCHAR(10),
    Technology VARCHAR(20) NOT NULL,
    FOREIGN KEY (OwnerID) REFERENCES OWNER(OwnerID),
    FOREIGN KEY (SupplyType) REFERENCES SUPPLY(SupplyType)
);

-- DML (Inserting Sample Data)
-- Owners
INSERT INTO OWNER (OwnerID, CompanyName, OfficeAddress, Email)
VALUES
    (1, 'Cleanergy Inc.', 'Manila, Philippines', 'contact@cleanergy.com'),
    (2, 'Total Power Corp.', 'Hanoi, Vietnam', 'contact@tpc.com'),
    (3, 'Metropower', 'Tokyo, Japan', 'contact@metropower.com'),
    (4, 'LightCo', 'Taipei, Taiwan', 'contact@light.co'),
    (5, 'One Energy', 'Bangkok, Thailand', 'contact@oneenergy.com');

-- Supply Types
INSERT INTO SUPPLY (SupplyType, MinCF, MaxCF)
VALUES
    ('Base Load', 0.50, 1.00),
    ('Mid Merit', 0.25, 0.75),
    ('Peaking', 0.00, 0.50);

-- Power Plants
INSERT INTO POWERPLANT (PlantID, OwnerID, PlantName, RatedCapacity, SupplyType, Technology)
VALUES
    (1, 1, 'Manila Solar', 100.00, 'Peaking', 'Solar'),
    (2, 1, 'Cebu Solar', 50.00, 'Peaking', 'Solar'),
    (3, 1, 'Ilocos Wind', 150.00, 'Mid Merit', 'Wind'),
    (4, 1, 'Davao Hydro', 100.00, 'Mid Merit', 'Hydro'),
    (5, 2, 'Hanoi Coal', 500.00, 'Base Load', 'Coal'),
    (6, 2, 'Ho Chi Minh Solar', 200.00, 'Peaking', 'Solar'),
    (7, 3, 'Nagoya Solar', 100.00, 'Peaking', 'Solar'),
    (8, 3, 'Hamamatsu Wind', 250.00, 'Base Load', 'Wind'),
    (9, 3, 'Tokyo Wind', 80.00, 'Mid Merit', 'Wind'),
    (10, 3, 'Sendai Coal', 600.00, 'Base Load', 'Coal'),
    (11, 3, 'Saitama Diesel', 60.00, 'Peaking', 'Diesel'),
    (12, 4, 'Taipei Hydro', 120.00, 'Mid Merit', 'Hydro'),
    (13, 5, 'Bangkok Natural Gas', 300.00, 'Base Load', 'Natural Gas'),
    (14, 5, 'Phuket Natural Gas', 200.00, 'Base Load', 'Natural Gas'),
    (15, 5, 'Chiang Mai Natural Gas', 250.00, 'Base Load', 'Natural Gas');