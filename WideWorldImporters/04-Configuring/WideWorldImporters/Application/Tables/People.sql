CREATE TABLE [Application].[People] (
    [PersonID]     INT             NOT NULL,
    [FullName]     NVARCHAR (50)   NOT NULL,
    CONSTRAINT [PK_Application_People] PRIMARY KEY CLUSTERED ([PersonID] ASC)
)

GO
EXECUTE sp_addextendedproperty
    @name = N'Description',
    @value = 'Full name for this person',
    @level0type = N'SCHEMA',
    @level0name = N'Application',
    @level1type = N'TABLE',
    @level1name = N'People',
    @level2type = N'COLUMN',
    @level2name = N'FullName';

GO
EXECUTE sp_addextendedproperty
    @name = N'Description',
    @value = 'Numeric ID used for reference to a person within the database',
    @level0type = N'SCHEMA',
    @level0name = N'Application',
    @level1type = N'TABLE',
    @level1name = N'People',
    @level2type = N'COLUMN',
    @level2name = N'PersonID';

GO
EXECUTE sp_addextendedproperty
    @name = N'Description',
    @value = N'People known to the application (staff, customer contacts, supplier contacts)',
    @level0type = N'SCHEMA',
    @level0name = N'Application',
    @level1type = N'TABLE',
    @level1name = N'People';
