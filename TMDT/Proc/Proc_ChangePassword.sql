




create proc p_ChangePassword @Username varchar(30), @Password nvarchar(40)
as
	update Admin
	set Password = @Password
	where Username = @Username










