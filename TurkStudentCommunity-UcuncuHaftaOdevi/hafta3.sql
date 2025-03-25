-- 1)Invoice tablosunda “USA” ülkesine ait, 2009 yılı içerisinde oluşturulmuş tüm faturaların toplamını listeleyen bir sorgu yazınız. 
Select * from invoice

SELECT SUM(total)
FROM invoice
WHERE billing_country = 'USA'
AND EXTRACT(YEAR FROM invoice_date) = 2009;

/*
WHERE komutu ile billing_country kolonunda USA değerlerini filtreledik.
EXTRACT komutu ile 2009 olan değerleri ayıkladık,
(AND komutunda iki şartın da sağlanması beklenir)
SUM komutu ile total kolonunun değerini topladık.
*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2)Track tablosundaki tüm parça bilgilerini, bu parçaların ait olduğu playlisttrack ve playlist tablolarıyla birleştirerek (JOIN) listeleyen bir sorgu yazınız. 
Select * from track
Select * from playlisttrack
Select * from playlist

SELECT
    t.*,					--bu ifade ile track tablosundaki tüm kolonları seçtik.
    pt.playlist_id,				--bu ifade ile playlisttrack tablosundaki playlist_id kolonunu seçtik
    p.name AS playlist_type			--bu ifade, playlist tablosundaki name kolonunu seçtik 
						--ve playlist_type olarak adlandırdık.
FROM track t
JOIN playlisttrack pt ON t.track_id = pt.track_id  	 
JOIN playlist p ON pt.playlist_id = p.playlist_id;

--JOIN ile tablolar verilen kolonlar üzerinden birleştirdik.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3)Track tablosundan "Let There Be Rock" adlı albüme ait tüm parçaları listeleyen, 
-- sanatçı (Artist) bilgisini de içeren bir sorgu yazınız. Ayrıca, sonuçları parça süresi (milliseconds) büyükten küçüğe sıralayınız. 
Select * from track
Select * from album
Select * from artist

SELECT
    track.name AS "Parça Adı",		
    artist.name AS "Sanatçı Adı",	
    track.milliseconds AS "Parça Süresi (ms)"	
FROM track
JOIN album ON track.album_id = album.album_id
JOIN artist ON album.artist_id = artist.artist_id
WHERE album.title = 'Let There Be Rock'
ORDER BY track.milliseconds DESC;

/*
track.name kolonunu "Parça Adı" olarak,
artist.name "Sanatçı Adı" olarak,
track.milliseconds kolonunu "Parça Süresi (ms)" olarak
seçtik ve adlandırdık.
WHERE komutu ile album tablosundan title'ı 'Let There Be Rock'
olan değerleri seçeçerek JOIN ile tabloları 
verilen kolonlar üzerinden birleştirdik.
Parça süresine göre, DESC komutu kullanak azalan yönde ORDER BY ile sıraladık.
*/
