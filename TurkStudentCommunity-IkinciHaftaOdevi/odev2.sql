select * from invoice

/*
1. Invoice tablosunda, tüm değerleri NULL olan kayıtların sayısını bulmanız 
isteniyor. 
Bu işlemi tek bir sorgu ile yapmalısınız. Sorguyu yazdıktan sonra, PostgreSQL’in 
sol alt kısmındaki Row sayısını, SQL sorgunuzda yorum satırında belirtmeniz 
gerekmektedir. 
*/
SELECT COUNT(*) 
FROM invoice
WHERE invoice_id IS NULL 
AND customer_id IS NULL 
AND invoice_date IS NULL 
AND billing_address IS NULL 
AND billing_city IS NULL 
AND billing_state IS NULL 
AND billing_country IS NULL 
AND billingpostal_code IS NULL 
AND total IS NULL;

-- Row sayısı: Sorgunun sonucu 0 yani NULL değer yok 

---------------------------------------------------------------------------------------------

/*
2. Koordinasyondaki kişiler, Total değerlerinde bir hata olduğunu belirtiyorlar. 
Bu değerlerin iki katını görmek ve eski versiyonlarıyla birlikte karşılaştırmak için bir 
sorgu yazmanız isteniyor. Ayrıca, verilerin daha rahat takip edilebilmesi için, 
tablonun yeni versiyonuna ait kolona göre büyükten küçüğe sıralama yapılması 
isteniyor. 
*/
SELECT *, total * 2 AS new_total
FROM invoice
ORDER BY new_total DESC;

/* SELECT * ifadesi ile tüm kolonları seçtik
total * 2 ifadesi ile bu değerin iki katını aldık
AS ile new_total kolonunu elde ettik
ORDER BY ile yeni kolona göre DESC kullanarak büyükten küçüğe sıraladık */

---------------------------------------------------------------------------------------------

/*
3. Adres kolonundaki verileri, soldan 3 karakter ve sağdan 4 karakter alarak 
birleştirmeniz ve "Açık Adres" olarak yazmanız isteniyor. Ayrıca, bu yeni açık adresi 
2013 yılı ve 8. ay’a göre filtrelemeniz gerekiyor.
*/
SELECT billing_address,  
LEFT(billing_address, 3) || '...' || RIGHT(billing_address, 4) AS "Açık Adres", 
invoice_date
FROM invoice
WHERE invoice_date BETWEEN '2013-08-01' AND '2013-08-31';

/* SELECT ile kolonlarımızı seçtik
LEFT ile belirtilen değer kadar soldan karakter,
RIGHT ile belirtilen değer kadar sağdan karakter aldık.
||(Concatenation) operatörü ile bu aldığımız karakterleri "Açık Adres" kolonunda birleştirdik 
ve BETWEN ifadesi ile 8. ayın başlangıcı ve sonu arasındaki değerleri filtreledik */





