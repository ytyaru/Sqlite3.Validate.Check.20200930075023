create table Names(
  Age int
  constraint IsValidName check(-1 < Age and Age < 1000)
);
insert or ignore into Names values(-1),(1000),(0),(999);
select * from Names;
