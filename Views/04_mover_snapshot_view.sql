CREATE VIEW mover_snapshot_view AS
SELECT
  ms.moverSnapshotId,
  ms.asOfTime,
  ms.windowType,
  mi.rankNum,
  mi.direction,
  mi.changePercent,
  a.symbol
FROM MoverSnapshot ms
JOIN MoverItem mi ON mi.moverSnapshotId = ms.moverSnapshotId
JOIN Asset a ON a.assetId = mi.assetId;
