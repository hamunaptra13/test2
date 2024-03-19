create view dbo.vw_SKUPrice as
    select
        s.ID
        ,s.Code
        ,s.Name
        ,(select dbo.udf_GetSKUPrice(s.ID)) as SKUPrice
    from dbo.SKU s;
