﻿CREATE TABLE [Sales].[CustomerCategories] (
    [CustomerCategoryID]   INT                                         CONSTRAINT [DF_Sales_CustomerCategories_CustomerCategoryID] DEFAULT (NEXT VALUE FOR [Sequences].[CustomerCategoryID]) NOT NULL,
    [CustomerCategoryName] NVARCHAR (50)                               NOT NULL,
    [LastEditedBy]         INT                                         NOT NULL,
    [ValidFrom]            DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]              DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Sales_CustomerCategories] PRIMARY KEY CLUSTERED ([CustomerCategoryID] ASC),
    CONSTRAINT [FK_Sales_CustomerCategories_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Sales_CustomerCategories_CustomerCategoryName] UNIQUE NONCLUSTERED ([CustomerCategoryName] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Sales].[CustomerCategories_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of the category that customers can be assigned to', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerCategories', @level2type = N'COLUMN', @level2name = N'CustomerCategoryName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a customer category within the database', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerCategories', @level2type = N'COLUMN', @level2name = N'CustomerCategoryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Categories for customers (ie restaurants, cafes, supermarkets, etc.)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerCategories';

