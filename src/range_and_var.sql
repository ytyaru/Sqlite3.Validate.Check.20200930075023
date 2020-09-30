.parameter set @min -1
.parameter set @max 1000
create table Names(
  Age int
  constraint IsValidName check(@min < Age and Age < @max)
);
