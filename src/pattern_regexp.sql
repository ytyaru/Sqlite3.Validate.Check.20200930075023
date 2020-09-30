create table Names(
  Name text,
  constraint IsValidName check(Name REGEXP '[0-9]{4}-[0-9]{2}-[0-9]{2}')
);
insert or ignore into Names values('2000-01-01'),('xxx'); /* OK */
select * from Names;
