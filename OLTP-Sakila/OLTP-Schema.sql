USE [master]
GO

CREATE DATABASE [sakila]

USE [sakila]
GO

CREATE TABLE [dbo].[country](
	[country_id] [smallint] IDENTITY(1,1) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[last_update] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country_id] [smallint] NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[address]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[address2] [varchar](50) NULL,
	[district] [varchar](20) NOT NULL,
	[city_id] [int] NOT NULL,
	[postal_code] [varchar](10) NULL,
	[phone] [varchar](20) NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[store_id] [int] NOT NULL,
	[first_name] [varchar](45) NOT NULL,
	[last_name] [varchar](45) NOT NULL,
	[email] [varchar](50) NULL,
	[address_id] [int] NOT NULL,
	[active] [char](1) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[customer_list]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- View structure for view customer_list
--

CREATE VIEW [dbo].[customer_list]
AS
SELECT cu.customer_id AS ID, 
       cu.first_name + ' ' + cu.last_name AS name, 
       a.address AS address, 
       a.postal_code AS zip_code,
	   a.phone AS phone, 
	   city.city AS city, 
	   country.country AS country, 
	   case when cu.active=1 then 'active' else '' end AS notes, 
	   cu.store_id AS SID
FROM customer AS cu JOIN address AS a ON cu.address_id = a.address_id JOIN city ON a.city_id = city.city_id
	JOIN country ON city.country_id = country.country_id

GO
/****** Object:  Table [dbo].[actor]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actor](
	[actor_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](45) NOT NULL,
	[last_name] [varchar](45) NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](25) NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[film]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film](
	[film_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[release_year] [varchar](4) NULL,
	[language_id] [tinyint] NOT NULL,
	[original_language_id] [tinyint] NULL,
	[rental_duration] [tinyint] NOT NULL,
	[rental_rate] [decimal](4, 2) NOT NULL,
	[length] [smallint] NULL,
	[replacement_cost] [decimal](5, 2) NOT NULL,
	[rating] [varchar](10) NULL,
	[special_features] [varchar](255) NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[film_actor]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film_actor](
	[actor_id] [int] NOT NULL,
	[film_id] [int] NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC,
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[film_category]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film_category](
	[film_id] [int] NOT NULL,
	[category_id] [tinyint] NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[film_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[film_list]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- View structure for view film_list
--

CREATE VIEW [dbo].[film_list]
AS
SELECT film.film_id AS FID, 
       film.title AS title, 
       film.description AS description, 
       category.name AS category, 
       film.rental_rate AS price,
	   film.length AS length, 
	   film.rating AS rating, 
	   actor.first_name+' '+actor.last_name AS actors
FROM category LEFT JOIN film_category ON category.category_id = film_category.category_id LEFT JOIN film ON film_category.film_id = film.film_id
        JOIN film_actor ON film.film_id = film_actor.film_id
	JOIN actor ON film_actor.actor_id = actor.actor_id

GO
/****** Object:  Table [dbo].[staff]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[staff_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](45) NOT NULL,
	[last_name] [varchar](45) NOT NULL,
	[address_id] [int] NOT NULL,
	[picture] [image] NULL,
	[email] [varchar](50) NULL,
	[store_id] [int] NOT NULL,
	[active] [bit] NOT NULL,
	[username] [varchar](16) NOT NULL,
	[password] [varchar](40) NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[staff_list]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- View structure for view staff_list
--

CREATE VIEW [dbo].[staff_list]
AS
SELECT s.staff_id AS ID, 
       s.first_name+' '+s.last_name AS name, 
       a.address AS address, 
       a.postal_code AS zip_code, 
       a.phone AS phone,
	   city.city AS city, 
	   country.country AS country, 
	   s.store_id AS SID
FROM staff AS s JOIN address AS a ON s.address_id = a.address_id JOIN city ON a.city_id = city.city_id
	JOIN country ON city.country_id = country.country_id

GO
/****** Object:  Table [dbo].[rental]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rental](
	[rental_id] [int] IDENTITY(1,1) NOT NULL,
	[rental_date] [datetime] NOT NULL,
	[inventory_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[return_date] [datetime] NULL,
	[staff_id] [tinyint] NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rental_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory](
	[inventory_id] [int] IDENTITY(1,1) NOT NULL,
	[film_id] [int] NOT NULL,
	[store_id] [int] NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[store]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[manager_staff_id] [tinyint] NOT NULL,
	[address_id] [int] NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[staff_id] [tinyint] NOT NULL,
	[rental_id] [int] NULL,
	[amount] [decimal](5, 2) NOT NULL,
	[payment_date] [datetime] NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[sales_by_store]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- View structure for view sales_by_store
--

CREATE VIEW [dbo].[sales_by_store]
AS
SELECT
  s.store_id
 ,c.city+','+cy.country AS store
 ,m.first_name+' '+ m.last_name AS manager
 ,SUM(p.amount) AS total_sales
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN store AS s ON i.store_id = s.store_id
INNER JOIN address AS a ON s.address_id = a.address_id
INNER JOIN city AS c ON a.city_id = c.city_id
INNER JOIN country AS cy ON c.country_id = cy.country_id
INNER JOIN staff AS m ON s.manager_staff_id = m.staff_id
GROUP BY   
  s.store_id
, c.city+ ','+cy.country 
, m.first_name+' '+ m.last_name

GO
/****** Object:  View [dbo].[sales_by_film_category]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- View structure for view sales_by_film_category
--
-- Note that total sales will add up to >100% because
-- some titles belong to more than 1 category
--

CREATE VIEW [dbo].[sales_by_film_category]
AS
SELECT
c.name AS category
, SUM(p.amount) AS total_sales
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
GROUP BY c.name

GO
/****** Object:  Table [dbo].[film_text]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film_text](
	[film_id] [smallint] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[language]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[language](
	[language_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [char](20) NOT NULL,
	[last_update] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_actor_last_name]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_actor_last_name] ON [dbo].[actor]
(
	[last_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_city_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_city_id] ON [dbo].[address]
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_country_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_country_id] ON [dbo].[city]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_address_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_address_id] ON [dbo].[customer]
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_store_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_store_id] ON [dbo].[customer]
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_last_name]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_last_name] ON [dbo].[customer]
(
	[last_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_language_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_language_id] ON [dbo].[film]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_original_language_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_original_language_id] ON [dbo].[film]
(
	[original_language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_film_actor_actor]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_film_actor_actor] ON [dbo].[film_actor]
(
	[actor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_film_actor_film]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_film_actor_film] ON [dbo].[film_actor]
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_film_category_category]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_film_category_category] ON [dbo].[film_category]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_film_category_film]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_film_category_film] ON [dbo].[film_category]
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_film_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_film_id] ON [dbo].[inventory]
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_film_id_store_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_film_id_store_id] ON [dbo].[inventory]
(
	[store_id] ASC,
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_customer_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_customer_id] ON [dbo].[payment]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_staff_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_staff_id] ON [dbo].[payment]
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_customer_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_customer_id] ON [dbo].[rental]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_inventory_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_inventory_id] ON [dbo].[rental]
(
	[inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_staff_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_staff_id] ON [dbo].[rental]
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_uq]    Script Date: 21/10/2024 11:24:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_uq] ON [dbo].[rental]
(
	[rental_date] ASC,
	[inventory_id] ASC,
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_address_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_address_id] ON [dbo].[staff]
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_store_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_store_id] ON [dbo].[staff]
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_address_id]    Script Date: 21/10/2024 11:24:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_fk_address_id] ON [dbo].[store]
(
	[manager_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_store_address]    Script Date: 21/10/2024 11:24:41 ******/
CREATE NONCLUSTERED INDEX [idx_fk_store_address] ON [dbo].[store]
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[actor] ADD  CONSTRAINT [DF_actor_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[address] ADD  DEFAULT (NULL) FOR [address2]
GO
ALTER TABLE [dbo].[address] ADD  DEFAULT (NULL) FOR [postal_code]
GO
ALTER TABLE [dbo].[address] ADD  CONSTRAINT [DF_address_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[category] ADD  CONSTRAINT [DF_category_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[city] ADD  CONSTRAINT [DF_city_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[country] ADD  CONSTRAINT [DF_country_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT ('Y') FOR [active]
GO
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (NULL) FOR [original_language_id]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT ((3)) FOR [rental_duration]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT ((4.99)) FOR [rental_rate]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (NULL) FOR [length]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT ((19.99)) FOR [replacement_cost]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT ('G') FOR [rating]
GO
ALTER TABLE [dbo].[film] ADD  DEFAULT (NULL) FOR [special_features]
GO
ALTER TABLE [dbo].[film] ADD  CONSTRAINT [DF_film_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[film_actor] ADD  CONSTRAINT [DF_film_actor_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[film_category] ADD  CONSTRAINT [DF_film_category_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[inventory] ADD  CONSTRAINT [DF_inventory_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[language] ADD  CONSTRAINT [DF_language_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[payment] ADD  DEFAULT (NULL) FOR [rental_id]
GO
ALTER TABLE [dbo].[payment] ADD  CONSTRAINT [DF_payment_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[rental] ADD  DEFAULT (NULL) FOR [return_date]
GO
ALTER TABLE [dbo].[rental] ADD  CONSTRAINT [DF_rental_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[staff] ADD  DEFAULT (NULL) FOR [picture]
GO
ALTER TABLE [dbo].[staff] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[staff] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[staff] ADD  DEFAULT (NULL) FOR [password]
GO
ALTER TABLE [dbo].[staff] ADD  CONSTRAINT [DF_staff_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[store] ADD  CONSTRAINT [DF_store_last_update]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [fk_address_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [fk_address_city]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [fk_city_country] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([country_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [fk_city_country]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [fk_customer_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [fk_customer_address]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [fk_customer_store] FOREIGN KEY([store_id])
REFERENCES [dbo].[store] ([store_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [fk_customer_store]
GO
ALTER TABLE [dbo].[film]  WITH CHECK ADD  CONSTRAINT [fk_film_language] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([language_id])
GO
ALTER TABLE [dbo].[film] CHECK CONSTRAINT [fk_film_language]
GO
ALTER TABLE [dbo].[film]  WITH CHECK ADD  CONSTRAINT [fk_film_language_original] FOREIGN KEY([original_language_id])
REFERENCES [dbo].[language] ([language_id])
GO
ALTER TABLE [dbo].[film] CHECK CONSTRAINT [fk_film_language_original]
GO
ALTER TABLE [dbo].[film_actor]  WITH CHECK ADD  CONSTRAINT [fk_film_actor_actor] FOREIGN KEY([actor_id])
REFERENCES [dbo].[actor] ([actor_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film_actor] CHECK CONSTRAINT [fk_film_actor_actor]
GO
ALTER TABLE [dbo].[film_actor]  WITH CHECK ADD  CONSTRAINT [fk_film_actor_film] FOREIGN KEY([film_id])
REFERENCES [dbo].[film] ([film_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film_actor] CHECK CONSTRAINT [fk_film_actor_film]
GO
ALTER TABLE [dbo].[film_category]  WITH CHECK ADD  CONSTRAINT [fk_film_category_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film_category] CHECK CONSTRAINT [fk_film_category_category]
GO
ALTER TABLE [dbo].[film_category]  WITH CHECK ADD  CONSTRAINT [fk_film_category_film] FOREIGN KEY([film_id])
REFERENCES [dbo].[film] ([film_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film_category] CHECK CONSTRAINT [fk_film_category_film]
GO
ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  CONSTRAINT [fk_inventory_film] FOREIGN KEY([film_id])
REFERENCES [dbo].[film] ([film_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [fk_inventory_film]
GO
ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  CONSTRAINT [fk_inventory_store] FOREIGN KEY([store_id])
REFERENCES [dbo].[store] ([store_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [fk_inventory_store]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [fk_payment_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [fk_payment_customer]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [fk_payment_rental] FOREIGN KEY([rental_id])
REFERENCES [dbo].[rental] ([rental_id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [fk_payment_rental]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [fk_payment_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [fk_payment_staff]
GO
ALTER TABLE [dbo].[rental]  WITH CHECK ADD  CONSTRAINT [fk_rental_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[rental] CHECK CONSTRAINT [fk_rental_customer]
GO
ALTER TABLE [dbo].[rental]  WITH CHECK ADD  CONSTRAINT [fk_rental_inventory] FOREIGN KEY([inventory_id])
REFERENCES [dbo].[inventory] ([inventory_id])
GO
ALTER TABLE [dbo].[rental] CHECK CONSTRAINT [fk_rental_inventory]
GO
ALTER TABLE [dbo].[rental]  WITH CHECK ADD  CONSTRAINT [fk_rental_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[rental] CHECK CONSTRAINT [fk_rental_staff]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [fk_staff_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [fk_staff_address]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [fk_staff_store] FOREIGN KEY([store_id])
REFERENCES [dbo].[store] ([store_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [fk_staff_store]
GO
ALTER TABLE [dbo].[store]  WITH CHECK ADD  CONSTRAINT [fk_store_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[store] CHECK CONSTRAINT [fk_store_address]
GO
ALTER TABLE [dbo].[store]  WITH CHECK ADD  CONSTRAINT [fk_store_staff] FOREIGN KEY([manager_staff_id])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[store] CHECK CONSTRAINT [fk_store_staff]
GO
ALTER TABLE [dbo].[film]  WITH CHECK ADD  CONSTRAINT [CHECK_special_features] CHECK  (([special_features] IS NULL OR [special_features] like '%Trailers%' OR [special_features] like '%Commentaries%' OR [special_features] like '%Deleted Scenes%' OR [special_features] like '%Behind the Scenes%'))
GO
ALTER TABLE [dbo].[film] CHECK CONSTRAINT [CHECK_special_features]
GO
ALTER TABLE [dbo].[film]  WITH CHECK ADD  CONSTRAINT [CHECK_special_rating] CHECK  (([rating]='NC-17' OR [rating]='R' OR [rating]='PG-13' OR [rating]='PG' OR [rating]='G'))
GO
ALTER TABLE [dbo].[film] CHECK CONSTRAINT [CHECK_special_rating]
GO
/****** Object:  Trigger [dbo].[trg_Update_LastUpdate_address]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_Update_LastUpdate_address]
ON [dbo].[address]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.address
    SET last_update = GETDATE()
    WHERE address_id IN (SELECT address_id FROM inserted);
END;

GO
ALTER TABLE [dbo].[address] ENABLE TRIGGER [trg_Update_LastUpdate_address]
GO
/****** Object:  Trigger [dbo].[trg_Update_LastUpdate_customer]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_Update_LastUpdate_customer]
ON [dbo].[customer]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualiza el campo last_update a la fecha actual
    UPDATE dbo.customer
    SET last_update = GETDATE()
    WHERE customer_id IN (SELECT customer_id FROM inserted);
END;

GO
ALTER TABLE [dbo].[customer] ENABLE TRIGGER [trg_Update_LastUpdate_customer]
GO
/****** Object:  Trigger [dbo].[trg_Update_LastUpdate_film]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_Update_LastUpdate_film]
ON [dbo].[film]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualiza el campo last_update a la fecha actual
    UPDATE dbo.film
    SET last_update = GETDATE()
    WHERE film_id IN (SELECT film_id FROM inserted);
END;

GO
ALTER TABLE [dbo].[film] ENABLE TRIGGER [trg_Update_LastUpdate_film]
GO
/****** Object:  Trigger [dbo].[trg_Update_LastUpdate_rental]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_Update_LastUpdate_rental]
ON [dbo].[rental]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualiza el campo last_update a la fecha actual
    UPDATE dbo.rental
    SET last_update = GETDATE()
    WHERE rental_id IN (SELECT rental_id FROM inserted);
END;

GO
ALTER TABLE [dbo].[rental] ENABLE TRIGGER [trg_Update_LastUpdate_rental]
GO
/****** Object:  Trigger [dbo].[trg_Update_LastUpdate_staff]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_Update_LastUpdate_staff]
ON [dbo].[staff]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualiza el campo last_update a la fecha actual
    UPDATE dbo.staff
    SET last_update = GETDATE()
    WHERE staff_id IN (SELECT staff_id FROM inserted);
END;

GO
ALTER TABLE [dbo].[staff] ENABLE TRIGGER [trg_Update_LastUpdate_staff]
GO
/****** Object:  Trigger [dbo].[trg_Update_LastUpdate_store]    Script Date: 21/10/2024 11:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_Update_LastUpdate_store]
ON [dbo].[store]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualiza el campo last_update a la fecha actual
    UPDATE dbo.store
    SET last_update = GETDATE()
    WHERE store_id IN (SELECT store_id FROM inserted);
END;

GO
ALTER TABLE [dbo].[store] ENABLE TRIGGER [trg_Update_LastUpdate_store]
GO
USE [master]
GO
ALTER DATABASE [sakila] SET  READ_WRITE 
GO
