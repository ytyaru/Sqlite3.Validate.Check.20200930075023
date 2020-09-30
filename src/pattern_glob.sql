create table Names(
  Name text,
  constraint IsValidName check(Name GLOB '???_[abc]')
);
insert or ignore into Names values('xxx_a'),('xxx_z');
select * from Names;
