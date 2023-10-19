CREATE DATABASE Project
USE Project


------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Users Table---------------------------------------------------
CREATE TABLE Users
( UserID INT IDENTITY(1, 1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(500) UNIQUE,
    PhoneNumber BIGINT,
    District VARCHAR(100) NOT NULL,
    Pincode BIGINT NOT NULL,
    PasswordHash NVARCHAR(25) NOT NULL,
    Status VARCHAR(100)
);

select *from Users

----------------------------------------------------------------
----------------------------------------------------Users_Insert
--CREATE PROCEDURE Users_Insert
--(
--    @Name as VARCHAR(100),
--    @Email as VARCHAR(500),
--    @PhoneNumber as BIGINT,
--    @District as VARCHAR(100),
--    @Pincode as BIGINT,
--    @PasswordHash as VARCHAR(25) 
--)
--as
--begin
--	BEGIN TRANSACTION
--	declare @result as varchar(50)
--	begin
--	insert into Users (Name, Email ,PhoneNumber, District, Pincode, PasswordHash, Status) values (@Name, @Email, @PhoneNumber, @District, @Pincode, @PasswordHash, 'A')
--	if(@@error > 0)
--		begin
--			set @result = 'Error'
--			ROLLBACK TRANSACTION
--		end
--	else
--		begin
--		    set @result = 'Success'
--		end
--	end
--	COMMIT TRANSACTION
--	select @result
--end
--GO


--CREATE PROCEDURE GetUserIdByEmail
--    @Email NVARCHAR(255)
--AS
--BEGIN
--    SELECT UserID
--    FROM Users
--    WHERE Email = @Email
--END

ALTER PROCEDURE Users_Update
(  
    @UserID INT,
    @Name VARCHAR(100),
    @Email VARCHAR(500),
    @PhoneNumber BIGINT,
    @District VARCHAR(100),
    @Pincode BIGINT,
    @PasswordHash NVARCHAR(25)
)
AS
BEGIN
    BEGIN TRANSACTION;
    DECLARE @result VARCHAR(50);

    BEGIN
        UPDATE Users
        SET Name = @Name, Email = @Email, PhoneNumber = @PhoneNumber, District = @District, Pincode = @Pincode, PasswordHash = @PasswordHash
        WHERE UserID = @UserID;

        IF (@@ERROR > 0)
        BEGIN
            SET @result = 'Error';
            ROLLBACK TRANSACTION;
        END
        ELSE
        BEGIN
            SET @result = 'Success';
        END;
    END;

    COMMIT TRANSACTION;
    SELECT @result;
END;
GO
----------------------------------------------------------------
----------------------------------------------------Users_Update
alter PROCEDURE Users_Update  
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
----------------------------------------
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
	SELECT UserID, Name, Email, PhoneNumber, District, Pincode FROM Users WHERE Email = @Email AND PasswordHash = @PasswordHash
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
	Price DECIMAL NOT NULL,
    Image VARCHAR(500) NOT NULL,
    Category_id int,
	Status varchar(100),
	foreign key(Category_id) references Categorys(CategoryID)
);
select * from Dishes

insert into Dishes values ('Sample Dish', 100 , 'sample_image_url' ,101, '')
--------------------------------------------------------
---------------------------------------------Dish_Insert
CREATE PROCEDURE Dish_Insert
(
	@Dishe_Name AS VARCHAR(500),
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
GO

--------------------------------------------------------
---------------------------------------------Dish_Update
CREATE PROCEDURE Dish_Update  
(
	@Dish_Id as int,
	@Dishe_Name AS VARCHAR(500),
	@Price AS INT,
	@Image AS  VARCHAR(500),
	@Category_Id AS INT
)  
AS  
BEGIN 
	 BEGIN TRANSACTION  
	 DECLARE @result AS varchar(50)  
	 BEGIN  
		 UPDATE Dishes SET Dishe_Name=@Dishe_Name, Price=@Price,Image=@Image,Category_id=@Category_Id  where  DishID=@Dish_Id 
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
CREATE PROCEDURE Dish_Delete 
(  
   @DishID AS INT  
)  
AS 
BEGIN 
	 BEGIN TRANSACTION  
	 DECLARE @result AS varchar(50)  
	 UPDATE Dishes SET  Status = 'D' where DishID = @DishID  
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
  select *from Dishes Where Status='A'
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
	SELECT * FROM Dishes WHERE DishId=@Dish_Id AND Status='A'
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

---------------------------------------------------------
-----------------------------------------Order_Management
CREATE PROCEDURE Order_Management
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
    @Image VARCHAR(500)
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

    IF @@ERROR <> 0  
    BEGIN  
        SET @result = 'Error';  
        ROLLBACK TRANSACTION;  
    END  
    ELSE  
    BEGIN  
        INSERT INTO Orders (User__id, Dish_id, Dish_Name, Price, Quantity, Total_Price, Image, Status) 
        VALUES (@UserID, (SELECT DishID FROM Dishes WHERE Dishe_Name = @Dish_Name), @Dish_Name, @Price, @Quantity, @TotalPrice, @Image, 'A');

        IF @@ERROR <> 0  
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

EXEC Order_Management 1, 'Devika Sunilkumar', 'devika2002@gmail.com', 9846707273, 'Thrissur', 680012, 'Sample Dish',10, 2, 20, 'sample_image_url'

CREATE PROCEDURE GetOrderDetails
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
        O.Total_Price,
	    D.Image
    FROM Orders O
    INNER JOIN Users U ON O.User__id = U.UserID
    INNER JOIN Dishes D ON O.Dish_id = D.DishID;
END
GO
select * from Users;

