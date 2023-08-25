-- Devices table
CREATE TABLE Devices (
    DeviceID SERIAL PRIMARY KEY,
    DeviceType VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    InstallationDate DATE NOT NULL,
    Manufacturer VARCHAR(255),
    Model VARCHAR(255),
    FirmwareVersion VARCHAR(50),
    IsActive BOOLEAN DEFAULT TRUE
);

-- Clients table
CREATE TABLE Clients (
    ClientID SERIAL PRIMARY KEY,
    ClientName VARCHAR(255) NOT NULL,
    ContactEmail VARCHAR(255),
    ContactPhone VARCHAR(50),
    BillingAddress TEXT,
    IsActive BOOLEAN DEFAULT TRUE
);

-- Leases table
CREATE TABLE Leases (
    LeaseID SERIAL PRIMARY KEY,
    DeviceID INT REFERENCES Devices(DeviceID),
    ClientID INT REFERENCES Clients(ClientID),
    LeaseStartDate DATE NOT NULL,
    LeaseEndDate DATE,
    MonthlyRate DECIMAL(10, 2) NOT NULL,
    IsActive BOOLEAN DEFAULT TRUE
);

-- TelemetryData table
CREATE TABLE TelemetryData (
    DataID SERIAL PRIMARY KEY,
    DeviceID INT REFERENCES Devices(DeviceID),
    Timestamp TIMESTAMP NOT NULL,
    Metric1 FLOAT,
    Metric2 FLOAT,
    Metric3 FLOAT,
    Metric4 FLOAT,
    Metric5 FLOAT,
    Latitude DOUBLE PRECISION,
    Longitude DOUBLE PRECISION,
    Altitude FLOAT,
    Humidity FLOAT,
    Temperature FLOAT,
    CO2Level FLOAT,
    BatteryLevel FLOAT,
    WaterLevel FLOAT,
    SoilMoisture FLOAT,
    EnergyConsumption FLOAT,
    EventCode VARCHAR(50),
    AlertStatus VARCHAR(20)
);
