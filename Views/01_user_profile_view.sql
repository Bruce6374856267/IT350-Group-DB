CREATE VIEW user_profile_view AS
SELECT
  u.userId,
  u.email,
  u.displayName,
  u.status,
  p.timeframe AS preferred_timeframe,
  p.updatedAt,
  COUNT(uw.watchId) AS watchlist_count
FROM User u
LEFT JOIN UserTimeFramePreferance p ON p.userId = u.userId
LEFT JOIN UserAssetWatchlist uw ON uw.userId = u.userId
GROUP BY u.userId;

