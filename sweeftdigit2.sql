--7.     გვაქვს Teacher ცხრილი, რომელსაც აქვს შემდეგი მახასიათებლები: სახელი, გვარი,
--სქესი, საგანი. გვაქვს Pupil ცხრილი, 
--რომელსაც აქვს შემდეგი მახასიათებლები: სახელი, გვარი, სქესი, კლასი. ააგეთ ნებისმიერ
--რელაციურ ბაზაში ისეთი დამოკიდებულება,
--რომელიც საშუალებას მოგვცემს, რომ მასწავლებელმა ასწავლოს რამოდენიმე მოსწავლეს და 
--ამავდროულად მოსწავლეს ჰყავდეს რამდენიმე მასწავლებელი (როგორც რეალურ ცხოვრებაში).
--
--1. დაწერეთ sql რომელიც ააგებს შესაბამის table-ებს.
--2. დაწერეთ sql რომელიც დააბრუნებს ყველა მასწავლებელს, რომელიც ასწავლის მოსწავლეს,
--რომელის სახელია: „გიორგი“ .

drop table Teacher;
drop table Pupil;
drop table bridge;

create TABLE Teacher(
T_id INT PRIMARY KEY not null,
name VARCHAR2(50),
surname VARCHAR2(50),
gender CHAR(20),
subject VARCHAR2(50)
)
create table Pupil(
P_id int PRIMARY KEY not null,
name VARCHAR2(50),
surname VARCHAR2(50),
gender CHAR(20),
class NUMBER
)

create table bridge(
    T_id INT NOT NULL,
    P_id INT NOT NULL,
    PRIMARY KEY ( T_id, P_id),
    FOREIGN KEY ( T_id ) References Teacher,
    FOREIGN KEY ( P_id ) References Pupil
)
--insert into bridge value(1,1);

insert into bridge values(1,3);
insert into bridge values(1,1);
insert into bridge values(2,3);
insert into bridge values(2,4);
insert into bridge values(3,2);
insert into bridge values(3,1);

insert into Teacher values(1,'ნინო', 'ბერიძე', 'მდედრი', 'ქიმია');
insert into Teacher values(2,'მარიამი', 'თევდორაშვილი', 'მდედრი', 'ფიზიკა');
insert into Teacher values(3,'ზურაბი', 'გირგვლიანი', 'მამრი', 'მათემატიკა');

insert into Pupil values(1,'გიორგი', 'გვარამია', 'მამრი', 10);
insert into Pupil values(2,'ნინო', 'ორჯონიკიძე', 'მდედრი', 9);
insert into Pupil values(3,'ნიკოლოზ', 'ქათამაძე', 'მამრი', 10);
insert into Pupil values(4,'გიორგი', 'ბერიძე', 'მამრი', 12);
insert into Pupil values(5,'კოტე', 'ღუდუშაური', 'მამრი', 11);

select T.name as Teacher_name, P.name as Pupil_name from Teacher T
Join bridge br on T.T_id = br.T_id
Join Pupil P on P.P_id = br.P_id
Where P.name like 'გიორგი';


--select name from Teacher
--where T_id IN (select T_id from bridge
--                where P_id in (SELECT P_id FROM Pupil
--                                where name like 'გიორგი'));
