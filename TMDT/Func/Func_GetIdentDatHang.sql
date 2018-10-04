create function f_GetIdentDatHang()
returns int
as
begin
	return Cast(IDENT_CURRENT('DatHang') as int)

end