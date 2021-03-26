-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/wUbWTP
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
-- Customer
-- -
-- CustomerID PK int
-- Name string INDEX
-- Address1 string
-- Address2 NULL string
-- Address3 NULL string
-- Order
-- -
-- OrderID PK int
-- CustomerID int FK >- Customer.CustomerID
-- TotalAmount money
-- OrderStatusID int FK >- os.OrderStatusID
-- OrderLine as ol
-- ----
-- OrderLineID PK int
-- OrderID int FK >- Order.OrderID
-- ProductID int FK >- p.ProductID
-- Quantity int
-- Product as p
-- ------------
-- ProductID PK int
-- Name varchar(200) UNIQUE
-- Price money
-- OrderStatus as os
-- ----
-- OrderStatusID PK int
-- Name UNIQUE string

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [deparments] (
    [dept_no] string  NOT NULL ,
    [dept_name] strin  NULL ,
    CONSTRAINT [PK_deparments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_emp] (
    [emp_no] int  NOT NULL ,
    [dept_no] string  NOT NULL ,
    CONSTRAINT [PK_dept_emp] PRIMARY KEY CLUSTERED (
        [emp_no] ASC,[dept_no] ASC
    )
)

CREATE TABLE [dept_manager] (
    [dept_no] string  NOT NULL ,
    [emp_no] int  NOT NULL ,
    CONSTRAINT [PK_dept_manager] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [employees] (
    [emp_no] int  NOT NULL ,
    [emp_title_id] string  NOT NULL ,
    [birth_date] int  NOT NULL ,
    [first_name] string  NOT NULL ,
    [last_name] string  NOT NULL ,
    [sex] string  NOT NULL ,
    [hire_date] int  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL ,
    CONSTRAINT [PK_salaries] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [titles] (
    [title_id] strin  NOT NULL ,
    [title] string  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [deparments] WITH CHECK ADD CONSTRAINT [FK_deparments_dept_no] FOREIGN KEY([dept_no])
REFERENCES [dept_manager] ([dept_no])

ALTER TABLE [deparments] CHECK CONSTRAINT [FK_deparments_dept_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [deparments] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [salaries] ([emp_no])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_title_id] FOREIGN KEY([emp_title_id])
REFERENCES [titles] ([title_id])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_title_id]

COMMIT TRANSACTION QUICKDBD