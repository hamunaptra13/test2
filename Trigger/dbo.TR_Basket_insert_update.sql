create trigger dbo.TR_Basket_insert_update on dbo.Basket
for insert
as
begin

    declare @ID_SKU integer
    declare db_cursor cursor for
        select ID_SKU
        from inserted i
        group by ID_SKU
        having count(ID_SKU) > 1

    open db_cursor
    fetch next from db_cursor into @ID_SKU
    while @@FETCH_STATUS = 0
    begin
        update b
            set DiscountValue = b.Value * 0.05
        from dbo.Basket as b
            inner join inserted i on i.ID = b.ID
        where @ID_SKU = b.ID_SKU;
    end;
    close db_cursor;
    deallocate db_cursor;
end;
