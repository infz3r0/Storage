--Trigger cập nhật số lượng nhóm khi thay đổi liên quan loại
create trigger T_Loai__Nhom_SoLuong
on Loai
after insert, update, delete
as
begin
	declare @idNhom int
	
	DECLARE db_cursor_nhom CURSOR FOR 
	SELECT IDNhom 
	FROM Nhom

	OPEN db_cursor_nhom  
	FETCH NEXT FROM db_cursor_nhom INTO @idNhom  

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		update Nhom
		set SoLuong = (select count(*) from Loai where IDNhom = @idNhom)
		where IDNhom = @idNhom

		FETCH NEXT FROM db_cursor_nhom INTO @idNhom 
	END 

	CLOSE db_cursor_nhom  
	DEALLOCATE db_cursor_nhom
end

go
--Trigger cập nhật số lượng loại khi thay đổi liên quan NSX
create trigger T_NSX__Loai_SoLuong
on NSX
after insert, update, delete
as
begin
	declare @idLoai int
	
	DECLARE db_cursor_loai CURSOR FOR 
	SELECT IDLoai
	FROM Loai

	OPEN db_cursor_loai  
	FETCH NEXT FROM db_cursor_loai INTO @idLoai  

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		update Loai
		set SoLuong = (select count(*) from NSX where IDLoai = @idLoai)
		where IDLoai = @idLoai

		FETCH NEXT FROM db_cursor_loai INTO @idLoai 
	END 

	CLOSE db_cursor_loai  
	DEALLOCATE db_cursor_loai
end