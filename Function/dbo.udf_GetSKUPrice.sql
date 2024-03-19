create or alter function dbo.udf_GetSKUPrice(
    @ID_SKU integer
)
returns decimal(18, 2)
as
begin
    select sum(b.Value)/sum(b.Quantity)
    from dbo.Basket b
    where b.ID_SKU = @ID_SKU
end;
