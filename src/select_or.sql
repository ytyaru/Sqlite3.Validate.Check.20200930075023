create table Names(
  Name text,
  constraint IsValidName check(Name='A' or Name='B' or Name='C')
);
insert or ignore into Names values('X'),('A'),('B'),('C'),('Z');
select * from Names;
