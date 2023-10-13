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
	insert into Users (Name, Email ,PhoneNumber, District, Pincode, PasswordHash, Status) values (@Name, @Email, @PhoneNumber, @District, @Pincode, @PasswordHash, 'A')
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
		 Update Users set Name = @Name, Email = @Email, PhoneNumber = @PhoneNumber,District = @District, Pincode = @Pincode, PasswordHash = @PasswordHash where UserID = @UserID 
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
----------------------------------------------------Users_Delete
CREATE PROCEDURE Users_Delete 
(  
@UserID as int  
)  
as  
begin  
	 BEGIN TRANSACTION  
	 declare @result as varchar(50)  
	 update Users set Status = 'D' where UserID = @UserID  
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
CREATE PROCEDURE User_Select
as
begin
select *from Users
end




------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Category Table------------------------------------------------
Create TABLE Categorys (
    CategoryID INT PRIMARY KEY,
    Category_Name VARCHAR(50) NOT NULL,
	Status varchar(100),
);
insert into Categorys values(103,'veg','A')
select *from Categorys

CREATE PROCEDURE Category_Select
as
begin
select *from Categorys
end
----------------------------------------------------------------------------------------------------------
----------------------------------------Category Table Insert---------------------------------------------
-----------------------------------------------------------------------------------------------------------
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
	insert into Categorys(CategoryID,Category_Name,Status) values (@Category_Id,@Category_Name,'A')
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
	Price int NOT NULL,
    Image VARCHAR(500) NOT NULL,
    Category_id int,
	Status varchar(100),
	foreign key(Category_id) references Categorys(CategoryID)
);
select *from Dishes
-------------------------------------------------------------------------------------------------------------------
---------------------------------------------DISH INSERT-----------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE Dish_Insert
(@Dishe_Name AS VARCHAR(500),
@Price AS INT,
@Image AS VARCHAR(500) ,
@Category_Id AS INT
)
AS
BEGIN
BEGIN TRANSACTION 
	DECLARE @result AS VARCHAR(100)
	BEGIN
		INSERT INTO Dishes(Dishe_Name,Price,Image,Category_id,Status)VALUES(@Dishe_Name,@Price,@Image,@Category_Id,'A')
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
exec Dish_Insert 'hjhjhj',123,'not null',101
-------------------------------------------------------------------------------------------------------------------
---------------------------------------------DISH UPDATE-----------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE Dish_Update  
(  @Dish_Id as int,
  @Dishe_Name AS VARCHAR(500)
,@Price AS INT,
@Image AS  VARCHAR(500),
@Category_Id AS INT
 
)  
as  
begin  
	 BEGIN TRANSACTION  
	 declare @result as varchar(50)  
	 begin  
		 Update Dishes set Dishe_Name=@Dishe_Name, Price=@Price,Image=@Image ,Category_id=@Category_Id where  DishID=@Dish_Id 
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
---------------------------------------------------------------------------------------------------------
----------------------------------------------DISH DELETE-------------------------------------------------
---------------------------------------------------------------------------------------------------------
CREATE PROCEDURE Dish_Delete 
(  
@DishID as int  
)  
as  
begin  
	 BEGIN TRANSACTION  
	 declare @result as varchar(50)  
	 update Dishes set Status = 'D' where DishID = @DishID  
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
------------------------------------------------------------------------------------------------------
-----------------------------------------Dish_Select--------------------------------------------------
-------------------------------------------------------------------------------------------------------
CREATE PROCEDURE Dish_Select
as
begin
select *from Dishes
end

CREATE PROCEDURE GetCategoriesAndDishes
AS
BEGIN
    SELECT
        c.Category_Name AS CategoryName,
        d.DishID,
        d.Dishe_Name AS DishName,
        d.Price,
        d.Image
    FROM Categorys c
    LEFT JOIN Dishes d ON c.CategoryID = d.Category_id
END

-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Order Table---------------------------------------------------
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
	User__id INT,
	Dishe_id INT,
    Dishe_Name VARCHAR(50) NOT NULL,
	Price INT NOT NULL,
	Total_Price INT NOT NULL,
	Image VARCHAR(500) NOT NULL,
	Status varchar(100),
	foreign key(User__id) references Users(UserID),
	foreign key(Dishe_id) references Dishes(DishID)
);

select *from Orders