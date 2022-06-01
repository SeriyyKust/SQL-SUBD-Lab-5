--set transaction isolation level read uncommitted;
--set transaction isolation level read committed;
--set transaction isolation level repeatable read;
set transaction isolation level serializable;

declare @count int;
set @count = 1001;
	begin transaction
		insert into testtable 
			values(@count,111);
		waitfor delay '00:00:00.1';
	commit;