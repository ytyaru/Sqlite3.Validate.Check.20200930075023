create table Names(
  Name text,
  constraint IsValidName check(Name Like '%ABC%')
);
insert or ignore into Names values('A'),('ABC'),('xABCx'),('Z');
select * from Names;
