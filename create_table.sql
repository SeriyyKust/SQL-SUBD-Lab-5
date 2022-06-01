drop table if exists testtable

create table testtable
	(
		code int not null primary key,
		value int
	);

declare @count int, @counter int;
set @count = 1000000;
set @counter = 1;


while @counter <= @count
	begin
		insert into testtable
		values (@counter, 0);
		set @counter = @counter + 1;
	end;