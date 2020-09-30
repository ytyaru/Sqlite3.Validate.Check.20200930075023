-- check制約を変更する。alter構文による変更は未実装であるため、テーブル再作成にて実現する。
create table Names(
  Name text,
  constraint IsValidName check(Name in ('A','B','C'))
);
-- alter table Names drop constraint IsValidName;
-- alter table Names add constraint IsValidName check(Name in ('A','B','C','Z'));
insert or ignore into Names values('X'),('A'),('B'),('C'),('Z');
select * from Names;
select sql from sqlite_master where type='table' and name='Names';

alter table Names rename to OLD_Names;
create table Names(
  Name text,
  constraint IsValidName check(Name in ('A','B','C','D'))
);
insert into Names select * from OLD_Names;
drop table OLD_Names;
.tables
select * from Names;
select sql from sqlite_master where type='table' and name='Names';
