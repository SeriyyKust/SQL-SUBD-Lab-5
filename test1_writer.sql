--set transaction isolation level read uncommitted;
--set transaction isolation level read committed;
--set transaction isolation level repeatable read;
set transaction isolation level serializable;

--Writer
declare @count int;
set @count = 1000000;
while 1=1
	begin
		declare @num1 int, @num2 int;
		set @num1 = 1;
		set @num2 = 1;
		while @num1 = @num2
			begin
				set @num1 = RAND()*(@count - 1) + 1;
				set @num2 = RAND()*(@count - 1) + 1;
			end;
		begin transaction
			update testtable set value = value + 1 
				where code = @num1;
			update testtable set value = value - 1
				where code = @num2;
		commit;
		waitfor delay '00:00:00.1'
	end;