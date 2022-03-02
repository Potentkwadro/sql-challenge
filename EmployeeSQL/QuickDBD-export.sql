-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/DA0Jfz
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "titles" (
    "ID" Serial   NOT NULL,
    "title_id" varchar(10) NOT NULL UNIQUE,
    "title" varchar(50),
    "last_updated" timestamp default localtimestamp NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "departments" (
    "ID" Serial   NOT NULL,
    "dept_no" varchar(10) NOT NULL UNIQUE,
    "dept_name" varchar(50),
    "last_updated" timestamp default localtimestamp NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "employees" (
    "ID" Serial   NOT NULL,
    "emp_no" int   NOT NULL UNIQUE,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" date,
    "first_name" varchar(100),
    "last_name" varchar(100),
	"gender"varchar(1),
    "hire_date" date,
    "last_updated" timestamp default localtimestamp NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "dept_manager" (
    "ID" Serial   NOT NULL,
    "dept_no" varchar(10)   NOT NULL ,
    "emp_no" int   NOT NULL,
    "last_updated" timestamp default localtimestamp NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "salaries" (
    "ID" Serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int,
    "last_updated" timestamp default localtimestamp NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "ID"
     )
);



CREATE TABLE "dept_emp" (
    "ID" Serial   NOT NULL,
    "emp_no" int   NOT NULL,
	"dept_no" varchar(10)  NOT NULL,
    "last_updated" timestamp default localtimestamp NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


