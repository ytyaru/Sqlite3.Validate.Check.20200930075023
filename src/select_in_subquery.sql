create table NameValidateValues(Name text primary key not null) without rowid;
insert into NameValidateValues values('A'),('B'),('C');
create table Names(
  Name text,
  constraint IsValidName check(Name in (select Name from NameValidateValues))
);
