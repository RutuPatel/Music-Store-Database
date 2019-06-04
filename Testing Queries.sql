Use music_store;

/*1*/
SELECT COUNT(customers.Customer_Phone) As total_Customers
FROM Customers;

/*2*/
select max(stocks.Total_Items_sold) as Max_Item_sold, album_Name as Max_Product
from  stocks join  albums
on stocks.albums_album_Id= albums.album_Id;

select  min(stocks.Total_Items_sold) as Min_Item_Sold, album_Name as Min_product
from  stocks join  albums
on stocks.albums_album_Id= albums.album_Id;

/*3*/
SELECT AVG(albums.Unit_Price) as avegrage_Amount, categories.Category_Name As Categories
 from albums join categories
 on albums.Categories_Category_Id= categories.Category_Id
group by Category_Id;

/*4*/
SELECT * FROM Customers join addresses
on customers.Customer_Phone= addresses.Customers_Customer_Phone
Order by City desc;

/* 5 */
select  Customer_Fname, Sales_qty
from sales s
join
    salesdetails sd ON s.Sale_Id = sd.Sales_Sale_Id
    
    join customers c ON s.Customers_Customer_Phone = c.Customer_Phone
where
    Sales_qty > 1
	and
	month(sales_date)=month(NOW() - INTERVAL 1 MONTH);

/*6*/
select artists.Artist_Name, count(distinct albums.album_Id)
from artists join albums
on artists.Artist_Id= albums.Artists_Artist_Id
group by Artist_Id;

/*7*/
select artists.Artist_Name, album_Name, Total_items
from albums join artists
on artists.Artist_Id= albums.Artists_Artist_Id
join stocks
on albums.album_Id= stocks.albums_album_Id
group by album_Id;
