--set transaction isolation level read uncommitted;
--set transaction isolation level read committed;
--set transaction isolation level repeatable read;
set transaction isolation level serializable;

declare @count int, @a int;
set @count = 1200000;
	begin transaction
		set @a = (select sum(value) from testtable);
		waitfor delay '00:00:03';
		if @a = 0
		begin
			insert into testtable 
				values(@count,111);
		select * from sys.dm_tran_locks 
			where resource_database_id = DB_ID()
			and resource_associated_entity_id = OBJECT_ID(N'dbo.testtable');
		end;
	commit;