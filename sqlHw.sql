SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[lecturers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	firstName [nvarchar](50) NULL,
	lastName [nvarchar](50) NULL,
 CONSTRAINT [PK_lecturers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

insert into lecturers values('Haim' , 'Levi')
insert into lecturers values('Shoshana' , 'Nahari')
insert into lecturers values('Kirl' , 'Moreno')

select * from lecturers

ALTER TABLE Courses
	ADD LecturerId int NULL
	
ALTER TABLE Courses  
ADD  CONSTRAINT FK_Courses_Lecturers FOREIGN KEY([LecturerId])
REFERENCES Lecturers (Id)

insert into lecturers values('Haim' , 'Levi')
insert into lecturers values('Shoshana' , 'Nahari')
insert into lecturers values('Kirl' , 'Moreno')

update Courses
set LecturerId = 7
where id = 3

update Courses
set LecturerId = 8
where id = 1 or id = 5

update Courses
set LecturerId = 9
where id = 6 or id = 7 


select * from Courses
where id = 3

select c.CourseName, l.firstName, l.lastName
from Courses c
join lecturers l on c.LecturerId = l.Id  

select * from Courses

select * from lecturers

select  l.firstName, l.lastName, c.CourseName
from lecturers l
join Courses c on l.Id = c.LecturerId

select * from Courses
where LecturerId is null

insert into lecturers values('Haim' , 'Levi')

select * from lecturers
where id not in(select lecturerId from Courses c join lecturers on LecturerId = c.id)

select c.CourseName, l.firstName, l.lastName
from Courses c
full join lecturers l on c.LecturerId = l.Id  
