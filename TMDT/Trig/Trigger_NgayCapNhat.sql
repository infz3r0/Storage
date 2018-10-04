--Update ngày cập nhật khi insert update sản phẩm
create trigger T_SanPham_NgayCapNhat
on SanPham
after insert, update
as
begin
	declare @idSanPham int
	select @idSanPham = IDSanPham from inserted

	update SanPham
	set NgayCapNhat = GETDATE()
	where IDSanPham = @idSanPham
end