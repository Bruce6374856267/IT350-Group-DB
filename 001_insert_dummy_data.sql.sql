USE mile3_lab;

INSERT INTO User (email, passwordHash, displayName, status)
VALUES
  ('alice@example.com', 'hash1', 'Alice', 'active'),
  ('bob@example.com',   'hash2', 'Bob',   'active');

INSERT INTO Asset (symbol, name, isActive, sector, industry)
VALUES
  ('AAPL', 'Apple Inc.', 'Y', 'Technology', 'Consumer Electronics'),
  ('MSFT', 'Microsoft Corp.', 'Y', 'Technology', 'Software');

INSERT INTO Session (tokenHash, expiresAt, userId)
VALUES
  ('token1', '2026-03-01', 1),
  ('token2', '2026-03-02', 2);

INSERT INTO UserTimeFramePreferance (timeframe, updatedAt, userId)
VALUES
  ('1D', '2026-02-26', 1),
  ('1W', '2026-02-26', 2);

INSERT INTO UserAssetWatchlist (createdAt, userId, assetId)
VALUES
  ('2026-02-26', 1, 1),
  ('2026-02-26', 1, 2),
  ('2026-02-26', 2, 2);

INSERT INTO PriceSnapshot (snapshotTime, closePrice, assetId)
VALUES
  ('2026-02-26 16:00:00', 180.5000, 1),
  ('2026-02-26 16:00:00', 420.2500, 2);

INSERT INTO MoverSnapshot (asOfTime, windowType)
VALUES
  ('2026-02-26 16:00:00', '1D'),
  ('2026-02-26 16:00:00', '1W');

INSERT INTO MoverItem (rankNum, direction, priceCurrent, changePercent, moverSnapshotId, assetId)
VALUES
  (1, 'UP',   180.5000,  3.2500, 1, 1),
  (2, 'UP',   420.2500,  2.1000, 1, 2),
  (1, 'DOWN', 175.0000, -4.0000, 2, 1);
