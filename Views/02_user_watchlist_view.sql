CREATE VIEW user_watchlist_view AS
SELECT
  uw.userId,
  a.assetId,
  a.symbol,
  a.name,
  ps.closePrice,
  ps.snapshotTime
FROM UserAssetWatchlist uw
JOIN Asset a ON a.assetId = uw.assetId
LEFT JOIN PriceSnapshot ps ON ps.assetId = a.assetId;

