-- QUESTION #1
-- 1. LIST ALL CUSTOMERS (NAME & EMAIL), ORDERED ALPHABETICALLY
# hint: should give 59 results
SELECT first_name, last_name, email
FROM customers
ORDER BY first_name;

-- QUESTION #2
-- 2. List tracks (Name + Composer) who belong to the 'Classical' playlist
# hint: should give 75 results
SELECT tracks.name, tracks.composer
FROM tracks
JOIN playlist_tracks ON playlist_tracks.track_id = tracks.id
JOIN playlists ON playlists.id = playlist_tracks.playlist_id
WHERE playlists.name = 'Classical';

N:N => Middle table (joint table)

-- QUESTION #3
-- 3. List the top 10 Artists who appear the most often in playlists
# hint: first results should be Iron Maiden - 516 appearances
SELECT artists.name, COUNT(*) c
FROM tracks
JOIN albums ON tracks.album_id = albums.id
JOIN artists ON albums.artist_id = artists.id
JOIN playlist_tracks ON tracks.id = playlist_tracks.track_id
GROUP BY artists.name
ORDER BY c DESC
LIMIT 10;

-- QUESTION #4
-- 4. List the tracks which have been purchased at least twice,
-- ordered by number of purchases.
# hint : should give 256 results. Steve Harris - The Trooper should be first with 5 purchases.
# hint 2: you may need a new keyword for this... HAVING said that, good luck!
SELECT tracks.name, COUNT(*) purchases
FROM tracks
JOIN invoice_lines ON invoice_lines.track_id = tracks.id
GROUP BY tracks.id
HAVING purchases >= 2
ORDER BY purchases DESC;





