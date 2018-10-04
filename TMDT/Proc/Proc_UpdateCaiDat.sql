




create proc p_UpdateCaiDat @TenThamSo varchar(50), @GiaTri nvarchar(100)
as
	update CaiDat
	set GiaTri = @GiaTri
	where TenThamSo = @TenThamSo