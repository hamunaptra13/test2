create or alter procedure dbo.usp_MakeFamilyPurchase(
    @FamilySurName varchar(255)
)
as
    begin
        declare
            @SumValue decimal(9, 2),
            @SurName varchar(255)

        select
            @SumValue = sum(b.Value),
            @SurName = f.SurName
        from dbo.Basket as b
            inner join dbo.Family as f on f.ID = b.ID_Family
        where f.SurName = @FamilySurName
        group by f.SurName;

        if @SurName is null
            throw 51000, 'Не найдена семья с фамилией ' + @FamilySurName, 1

        update f
        set BudgetValue = BudgetValue - @SumValue
        from dbo.Family as f
            inner join dbo.Basket as b on b.ID_Family = f.ID
        where f.SurName = @FamilySurName;

    end;
