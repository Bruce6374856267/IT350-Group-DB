CREATE VIEW asset_detail_view AS
SELECT
  a.assetId,
  a.symbol,
  a.name,
  a.sector,
  a.industry,
  ps.closePrice
FROM Asset a
LEFT JOIN PriceSnapshot ps ON ps.assetId = a.assetId;
