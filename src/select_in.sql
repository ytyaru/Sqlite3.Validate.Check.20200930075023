create table Names(
  Name text,
  constraint IsValidName check(Name in ('A','B','C'))
);
insert or ignore into Names values('X'),('A'),('B'),('C'),('Z');
select * from Names;
