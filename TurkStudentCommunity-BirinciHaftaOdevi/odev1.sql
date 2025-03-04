-- a) Belirli Kolonları Seçme
-- employees tablosundan çalışanların firstname, lastname ve salary
-- bilgilerini getirmek için select komutundan sonra ilgili kolonların adını
-- girip, from ile hangi tablodan çektiğimizi belirttik.
select firstname, lastname, salary from employees;


-- b) DISTINCT Komutu ile Tekrarları Önleme
-- çalışılan departmanların tekrarsız bir şekilde filtrelenmesi
-- için distinct komutunu kullandık.
select distinct departmentname from departments;


-- c) Belirli Bir Departmana Ait Çalışanları Listeleme
-- departments tablosunda IT departmanının id'si 1,
-- employees tablosunda departmenid bilgisi 1 olan çalışanları getirteceğiz
-- where komutu verilen şarta göre filtreleme sağlar.
-- where komutundan sonra aradığımız özelliğin değerini belirterek istenilen sorguya ulaştık.
select  * from employees where departmentid =1;


-- d) Maaşa Göre Sıralama
-- order by komutu verileri default olarak küçükten büyüğe doğru sıralar,
-- order by kullanarak sıralamak istediğimiz ilgili kolonun adından sonra
-- desc komutunu eklersek varsayılanın tersi yönünde yani büyükten küçüğe doğru
-- sıralama yapmış oluruz.
select * from employees
order by salary desc;


-- e) Kolonları Birleştirme (Concatenation)
-- çalışanların firstname ve lastname alanlarını concat (||) operatörü ile
-- birleştirdik ve 'as' komutu kullanarak fullname etiketi ile tek kolonda
-- gösterilmesini sağladık.
select employeeid, firstname || ' ' || lastname as fullname, 
age, departmentid, salary, joindate from employees;



