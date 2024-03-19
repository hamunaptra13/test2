create table dbo.SKU (
    ID integer identity primary key,
    Code as concat('s', ID) unique,
    Name varchar(100)
);

create table dbo.Family (
    ID integer identity primary key primary key,
    SurName varchar(255),
    BudgetValue integer
);

create table dbo.Basket (
    ID integer identity primary key primary key,
    ID_SKU integer references dbo.SKU (ID),
    ID_Family integer references dbo.Family (ID),
    Quantity integer check(Quantity > 0),
    Value integer check(Value > 0),
    PurchaseDate datetime default getdate(),
    DiscountValue integer
);
