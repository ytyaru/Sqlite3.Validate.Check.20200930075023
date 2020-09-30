create table Names(
  Name text,
  constraint IsValidName check(Name in ('A','B','C'))
);
alter table Names drop constraint IsValidName;
alter table Names add constraint IsValidName check(Name in ('A','B','C','Z'));
