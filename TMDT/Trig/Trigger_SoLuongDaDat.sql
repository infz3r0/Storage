--Cập nhật Số lượng đã đặt của Sản Phẩm khi có thay đổi trong Chi tiết đặt hàng
create trigger T_ChiTietDatHang__SanPham_SoLuongDaDat
on ChiTietDatHang
after insert, delete
as
begin
	declare @idSanPham int
	
	DECLARE db_cursor_SanPham CURSOR FOR 
	SELECT IDSanPham
	FROM SanPham

	OPEN db_cursor_SanPham  
	FETCH NEXT FROM db_cursor_SanPham INTO @idSanPham  

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		update SanPham
		set SoLuongDaDat = (select count(*) from ChiTietDatHang where IDSanPham = @idSanPham)
		where IDSanPham = @idSanPham

		FETCH NEXT FROM db_cursor_SanPham INTO @idSanPham 
	END 

	CLOSE db_cursor_SanPham  
	DEALLOCATE db_cursor_SanPham
end
















