CREATE DATABASE Project
USE Project


------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Users Table---------------------------------------------------
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(500) UNIQUE,
    PhoneNumber BIGINT,
    District VARCHAR(100) NOT NULL,
    Pincode BIGINT NOT NULL,
    PasswordHash NVARCHAR(25) NOT NULL,
	Status varchar(100)
);
select *from Users

----------------------------------------------------------------
----------------------------------------------------Users_Insert
CREATE PROCEDURE Users_Insert
(
    @Name as VARCHAR(100),
    @Email as VARCHAR(500),
    @PhoneNumber as BIGINT,
    @District as VARCHAR(100),
    @Pincode as BIGINT,
    @PasswordHash as VARCHAR(25) 
)
as
begin
	BEGIN TRANSACTION
	declare @result as varchar(50)
	begin
	insert into Users (Name, Email ,PhoneNumber, District, Pincode, PasswordHash, Status) values (@Name, @Email, @PhoneNumber, @District, @Pincode, @PasswordHash, 'Active')
	if(@@error > 0)
		begin
			set @result = 'Error'
			ROLLBACK TRANSACTION
		end
	else
		begin
		    set @result = 'Success'
		end
	end
	COMMIT TRANSACTION
	select @result
end
GO

----------------------------------------------------------------
----------------------------------------------------Users_Update
CREATE PROCEDURE Users_Update  
(  
    @UserID as int,  
    @Name as VARCHAR(100),
    @Email as VARCHAR(500),
    @PhoneNumber as BIGINT,
    @District as VARCHAR(100),
    @Pincode as BIGINT,
    @PasswordHash as VARCHAR(25)  
)  
as  
begin  
	 BEGIN TRANSACTION  
	 declare @result as varchar(50)  
	 begin  
		 Update Users set Name = @Name, Email = @Email, PhoneNumber = @PhoneNumber, District = @District, Pincode = @Pincode, PasswordHash = @PasswordHash where UserID = @UserID 
		 if(@@error > 0)  
			 begin  
			   set @result = 'Error'  
			   ROLLBACK TRANSACTION  
			 end  
		 else  
			 begin  
				set @result = 'Success'  
			 end  
	 end  
	 COMMIT TRANSACTION
	 select @result  
end  
GO
exec Users_Update 1, 'Devika Sunilkumar', 'devika@gmail.com', 9846707273, 'Thrissur', 680012, 'devika2002'

----------------------------------------------------------------
----------------------------------------------------Users_Delete
CREATE PROCEDURE Users_Delete 
(  
	@UserID as int  
)  
as  
begin  
	 BEGIN TRANSACTION  
	 declare @result as varchar(50)  
	 update Users set Status = 'Delete' where UserID = @UserID
	 if (@@error>0)  
		  begin  
			   set @result = 'Error'  
			   ROLLBACK TRANSACTION  
		  end  
	 else  
		  begin  
		       set @result = 'Success'  
		  end
	 COMMIT TRANSACTION  
	 select @result
end
GO

----------------------------------------------------------------------
----------------------------------------------------Users_Delete_Admin
CREATE PROCEDURE Users_Delete_Admin
(  
	@UserID as int  
)  
as  
begin  
	 BEGIN TRANSACTION  
	 declare @result as varchar(50)  
	 update Users set Status = 'ADMIN deleted' where UserID = @UserID
	 if (@@error>0)  
		  begin  
			   set @result = 'Error'  
			   ROLLBACK TRANSACTION  
		  end  
	 else  
		  begin  
		       set @result = 'Success'  
		  end
	 COMMIT TRANSACTION  
	 select @result
end
GO

-------------------------------------------------------------------
------------------------------------------------------Register_User
Create PROCEDURE Register_User
(
    @Email as VARCHAR(500),
    @PasswordHash as VARCHAR(25) 
)
as
begin
	Select Status from Users where Email = @Email AND PasswordHash = @PasswordHash
end
GO
exec Register_User 'devikasunilkumar20@gmail.com', 'devika2002'

----------------------------------------------------------------
------------------------------------------------------Login_User
CREATE PROCEDURE Login_User
(
    @Email as VARCHAR(500),
    @PasswordHash as VARCHAR(25) 
)
AS
begin
	BEGIN TRANSACTION
	DECLARE @result as varchar(50)
	IF EXISTS (select *from Users where Email = @Email AND PasswordHash = @PasswordHash)
		begin
		    SET @result = 'Success'
		end
	else
		begin
		    SET @result = 'Error: User not found'
		end
	COMMIT TRANSACTION
	select @result
end
GO

----------------------------------------------------------------
-----------------------------------------------------User_Select
Create PROCEDURE User_Select
(
    @Email as VARCHAR(500),
    @PasswordHash as VARCHAR(25) 
)
as
begin
	Select UserID, Name, Email, PhoneNumber, District, Pincode, PasswordHash, Status from Users where Email = @Email AND PasswordHash = @PasswordHash
end
GO

--------------------------------------------------------------------------
-----------------------------------------------------User_Select_AdminView
Create PROCEDURE User_Select_AdminView
as
begin
	Select *from Users
end
GO




------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Category Table------------------------------------------------
CREATE TABLE Categorys (
    CategoryID INT PRIMARY KEY,
    Category_Name VARCHAR(50) NOT NULL,
	Status varchar(100),
);

-------------------------------------------------------
----------------------------------------Category_Select
CREATE PROCEDURE Category_Select
as
begin
	select *from Categorys
end
GO

-------------------------------------------------------
----------------------------------------Category_Insert
CREATE PROCEDURE Category_Insert
(
   @Category_Id AS INT,
   @Category_Name AS VARCHAR(50)  
)
as
begin
	BEGIN TRANSACTION
	declare @result as varchar(50)
	begin
	insert into Categorys (CategoryID, Category_Name, Status) values (@Category_Id, @Category_Name, 'A')
	if(@@error > 0)
		begin
			set @result = 'Error'
			ROLLBACK TRANSACTION
		end
	else
		begin
		    set @result = 'Success'
		end
	end
	COMMIT TRANSACTION
	select @result
end
GO




------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Dishes Table--------------------------------------------------
CREATE TABLE Dishes (
    DishID INT IDENTITY(1,1) PRIMARY KEY,
    Dishe_Name VARCHAR(500) NOT NULL,
	Price DECIMAL NOT NULL,
    Image VARCHAR(500) NOT NULL,
    Category_id int,
	Status varchar(100),
	foreign key(Category_id) references Categorys(CategoryID)
);
select *from Dishes
ALTER TABLE Dishes
ADD Meals VARCHAR(100)

--------------------------------------------------------
---------------------------------------------Dish_Insert
alter PROCEDURE Dish_Insert
(
	@Dishe_Name AS VARCHAR(500),
	@Price AS INT,
	@Image AS VARCHAR(500),
	@Category_Id AS INT,
	@Meals VARCHAR(100)
)
AS
BEGIN
BEGIN TRANSACTION 
	DECLARE @result AS VARCHAR(100)
	BEGIN
		INSERT INTO Dishes (Dishe_Name, Price, Image, Category_id, Status, Meals) VALUES (@Dishe_Name, @Price, @Image, @Category_Id, 'A', @Meals)
		IF(@@ERROR>0)
			BEGIN
			set @result='Error'
			ROLLBACK TRANSACTION
			END
		ELSE
		BEGIN
		SET @result='SUCCESS'
	END
	END
	select @result		
	COMMIT TRANSACTION
END
GO

--------------------------------------------------------
---------------------------------------------Dish_Update
alter PROCEDURE Dish_Update  
(
	@Dish_Id as int,
	@Dishe_Name AS VARCHAR(500),
	@Price AS INT,
	@Image AS  VARCHAR(500),
	@Category_Id AS INT,
	@Meals VARCHAR(100)
)  
AS  
BEGIN 
	 BEGIN TRANSACTION  
	 DECLARE @result AS varchar(50)  
	 BEGIN  
		 UPDATE Dishes SET Dishe_Name = @Dishe_Name, Price = @Price, Image = @Image, Category_id = @Category_Id, Meals = @Meals where DishID = @Dish_Id 
		 if(@@error > 0)  
			 begin  
			   set @result = 'Error'  
			   ROLLBACK TRANSACTION  
			 end  
		 else  
			 begin  
				set @result = 'Success'  
			 end  
	 end  
	 COMMIT TRANSACTION  
	 select @result  
end  
GO

---------------------------------------------------------
----------------------------------------------Dish_Delete
Create PROCEDURE Dish_Delete 
(  
   @DishID AS INT  
)  
AS 
BEGIN 
	 BEGIN TRANSACTION  
	 DECLARE @result AS varchar(50)  
	 DELETE FROM Dishes where DishID = @DishID  
	 if (@@error>0)  
		  BEGIN  
			   SET @result = 'Error'  
			   ROLLBACK TRANSACTION  
		  end  
	 else  
		  begin  
		       set @result = 'Success'  
		  end
	 COMMIT TRANSACTION  
	 select @result
end
GO

----------------------------------------------------
-----------------------------------------Dish_Select
CREATE PROCEDURE Dish_Select
as
begin
  select *from Dishes Where Status = 'A'
end
GO

----------------------------------------------------
-------------------------------------------Edit_Dish
CREATE PROCEDURE Edit_Dish
(
	@Dish_Id AS INT
)
AS
BEGIN
	SELECT *FROM Dishes WHERE DishId = @Dish_Id AND Status = 'A'
END
GO

-------------------------------------------------------
-------------------------------------------Dishessearch
CREATE PROCEDURE Dishessearch
as
begin
  select *from Dishes Where Status='A'
end
GO

---------------------------------------------------------
---------------------------------------GetDishesByStarter
CREATE PROCEDURE GetDishesByStarter
AS
BEGIN
	Select DishID, Dishe_Name, Price, Image, Category_id
	FROM Dishes
	WHERE Meals = 'Starter'
END
GO
SELECT DishID, Dishe_Name, Price, Image, Category_id FROM Dishes WHERE Meals = 'Starter'

----------------------------------------------------------
---------------------------------------GetDishesByBrakfast
CREATE PROCEDURE GetDishesByBrakfast
AS
BEGIN
	Select DishID, Dishe_Name, Price, Image, Category_id
	FROM Dishes
	WHERE Meals = 'Brakfast'
END
GO

-------------------------------------------------------
---------------------------------------GetDishesByLunch
CREATE PROCEDURE GetDishesByLunch
AS
BEGIN
	Select DishID, Dishe_Name, Price, Image, Category_id
	FROM Dishes
	WHERE Meals = 'Lunch'
END
GO

--------------------------------------------------------
---------------------------------------GetDishesByDinner
CREATE PROCEDURE GetDishesByDinner
AS
BEGIN
	Select DishID, Dishe_Name, Price, Image, Category_id
	FROM Dishes
	WHERE Meals = 'Dinner'
END
GO

--------------------------------------------------------
---------------------------------------GetDishesByDrinks
CREATE PROCEDURE GetDishesByDrinks
AS
BEGIN
	Select DishID, Dishe_Name, Price, Image, Category_id
	FROM Dishes
	WHERE Meals = 'Drinks'
END
GO




----------------------------------------------------Orders Table---------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Orders (
    OrderID INT IDENTITY(100,1) PRIMARY KEY,
	User__id INT,
	Dish_id INT,
    Dish_Name VARCHAR(50) NOT NULL,
	Price DECIMAL NOT NULL,
	Quantity INT NOT NULL,
	Total_Price INT NOT NULL,
	Image VARCHAR(500) NOT NULL,
	Status varchar(100),
	foreign key(User__id) references Users(UserID),
	foreign key(Dish_id) references Dishes(DishID)
);

select *from Orders

-----------------------------------------------------
-----------------------------------------Order_Delete
CREATE PROCEDURE Order_Delete
(  
   @OrderID AS INT  
)  
AS 
BEGIN 
	 BEGIN TRANSACTION  
	 DECLARE @result AS varchar(50)  
	 UPDATE Orders SET Status = 'Cancelled' where OrderID = @OrderID  
	 if (@@error>0)  
		  BEGIN  
			   SET @result = 'Error'  
			   ROLLBACK TRANSACTION  
		  end  
	 else  
		  begin  
		       set @result = 'Success'  
		  end
	 COMMIT TRANSACTION  
	 select @result
end
GO
exec Order_Delete 100 


---------------------------------------------------------
-----------------------------------------Order_Management
Create PROCEDURE Order_Management
(
    @UserID INT,
    @Name VARCHAR(100),
    @Email VARCHAR(500),
    @PhoneNumber BIGINT,
    @District VARCHAR(100),
    @Pincode BIGINT,
    @Dish_Name VARCHAR(50),
    @Price INT,
    @Quantity INT,
    @TotalPrice INT,
	@Image Varchar(500)
   
)
AS
BEGIN
    BEGIN TRANSACTION;
    DECLARE @result AS VARCHAR(50);

    UPDATE Users
    SET Name = @Name,
        Email = @Email,
        PhoneNumber = @PhoneNumber,
        District = @District,
        Pincode = @Pincode
    WHERE UserID = @UserID;

   if (@@error>0)
    BEGIN  
        SET @result = 'Error';  
        ROLLBACK TRANSACTION;  
    END  
    ELSE  
    BEGIN  
        INSERT INTO Orders (User__id, Dish_id, Dish_Name, Price, Quantity, Total_Price, Image, Status)
        VALUES (@UserID, (SELECT DishID FROM Dishes WHERE Dishe_Name = @Dish_Name), @Dish_Name, @Price, @Quantity, @TotalPrice, @Image,'Ordered');

        if (@@error>0)
        BEGIN  
            SET @result = 'Error';  
            ROLLBACK TRANSACTION;  
        END  
        ELSE  
        BEGIN  
            SET @result = 'Success';  
            COMMIT TRANSACTION;  
        END
    END

    SELECT @result;
END
GO
--exec Order_Management 1,'Devika Sunilkumar', 'devikasunilkumar20@gmail.com', 9846707273, 'Thrissur', 680012, 'Vada',24, 2, 48, '~/Picture/9659.jpg'
--exec Order_Management 2,'Ashily Mariya', 'ashilymariyapv@gmail.com', 9633644327, 'Eranakulam', 650020, 'Idiyappum',70, 1, 70, '~/Picture/1160.jpg'

-----------------------------------------------------------
-----------------------------------------Admin_OrderDetails
CREATE PROCEDURE Admin_OrderDetails
AS
BEGIN
    SELECT 
        O.OrderID,
        U.Name AS User_Name,
		U.Email,
		U.PhoneNumber,
		U.District,
		U.Pincode,
        D.Dishe_Name AS DishName,
        D.Price,
        O.Quantity,
		o.Total_Price,
	    D.Image,
		o.Status
    FROM Orders O
    INNER JOIN Users U ON O.User__id = U.UserID
    INNER JOIN Dishes D ON O.Dish_id = D.DishID
END
GO

-----------------------------------------------------------------
-----------------------------------------User_DisplayOrderDetails
CREATE PROCEDURE User_DisplayOrderDetails
(
    @Email as VARCHAR(500),
    @PasswordHash as VARCHAR(25)
)
AS
BEGIN
    SELECT 
        O.OrderID,
        U.Name AS User_Name,
        U.Email,
        U.PhoneNumber,
        U.District,
        U.Pincode,
        D.Dishe_Name AS DishName,
        D.Price,
        O.Quantity,
		o.Total_Price,
        D.Image
    FROM Orders O
    INNER JOIN Users U ON O.User__id = U.UserID
    INNER JOIN Dishes D ON O.Dish_id = D.DishID
    WHERE U.Email = @Email AND U.PasswordHash = @PasswordHash
END
GO
--exec User_DisplayOrderDetails 'devikasunilkumar20@gmail.com', 'devika2002'
--exec User_DisplayOrderDetails 'ashilymariyapv@gmail.com', 'ashily2020'