CREATE DATABASE IF NOT EXISTS mile3_lab;
USE mile3_lab;

CREATE TABLE User
(
  userId INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  passwordHash VARCHAR(255) NOT NULL,
  displayName VARCHAR(100) NOT NULL,
  status VARCHAR(50) NOT NULL,
  PRIMARY KEY (userId),
  UNIQUE (email)
);

CREATE TABLE Session
(
  sessionId INT NOT NULL AUTO_INCREMENT,
  tokenHash CHAR(64) NOT NULL,
  expiresAt DATE NOT NULL,
  userId INT NOT NULL,
  PRIMARY KEY (sessionId),
  FOREIGN KEY (userId) REFERENCES User(userId),
  UNIQUE (tokenHash)
);

CREATE TABLE UserTimeFramePreferance
(
  preferenceId INT NOT NULL AUTO_INCREMENT,
  timeframe CHAR(10) NOT NULL,
  updatedAt DATE NOT NULL,
  userId INT NOT NULL,
  PRIMARY KEY (preferenceId),
  FOREIGN KEY (userId) REFERENCES User(userId),
  UNIQUE (userId)
);

CREATE TABLE Asset
(
  assetId INT NOT NULL AUTO_INCREMENT,
  symbol VARCHAR(20) NOT NULL,
  name VARCHAR(200) NOT NULL,
  isActive CHAR(1) NOT NULL,
  sector VARCHAR(100) NOT NULL,
  industry VARCHAR(100) NOT NULL,
  PRIMARY KEY (assetId),
  UNIQUE (symbol)
);

CREATE TABLE UserAssetWatchlist
(
  watchId INT NOT NULL AUTO_INCREMENT,
  createdAt DATE NOT NULL,
  userId INT NOT NULL,
  assetId INT NOT NULL,
  PRIMARY KEY (watchId),
  FOREIGN KEY (userId) REFERENCES User(userId),
  FOREIGN KEY (assetId) REFERENCES Asset(assetId)
);

CREATE TABLE PriceSnapshot
(
  priceSnapshotId INT NOT NULL AUTO_INCREMENT,
  snapshotTime DATETIME NOT NULL,
  closePrice NUMERIC(12,4) NOT NULL,
  assetId INT NOT NULL,
  PRIMARY KEY (priceSnapshotId),
  FOREIGN KEY (assetId) REFERENCES Asset(assetId)
);

CREATE TABLE MoverSnapshot
(
  moverSnapshotId INT NOT NULL AUTO_INCREMENT,
  asOfTime DATETIME NOT NULL,
  windowType CHAR(10) NOT NULL,
  PRIMARY KEY (moverSnapshotId)
);

CREATE TABLE MoverItem
(
  moverItemID INT NOT NULL AUTO_INCREMENT,
  rankNum INT NOT NULL,
  direction CHAR(4) NOT NULL,
  priceCurrent NUMERIC(12,4) NOT NULL,
  changePercent NUMERIC(8,4) NOT NULL,
  moverSnapshotId INT NOT NULL,
  assetId INT NOT NULL,
  PRIMARY KEY (moverItemID),
  FOREIGN KEY (moverSnapshotId) REFERENCES MoverSnapshot(moverSnapshotId),
  FOREIGN KEY (assetId) REFERENCES Asset(assetId)
);


