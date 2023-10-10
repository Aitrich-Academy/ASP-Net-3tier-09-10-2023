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


------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Dishes Table--------------------------------------------------


------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Category Table------------------------------------------------


------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Order Table---------------------------------------------------