--set transaction isolation level read uncommitted;
--set transaction isolation level read committed;
--set transaction isolation level repeatable read;
set transaction isolation level serializable;

--Reader
declare @counter_for_read int;
set @counter_for_read = 0;
while @counter_for_read < 10
	begin
		begin transaction
			select sum(value) from testtable;
			select * from sys.dm_tran_locks 
			where resource_database_id = DB_ID()
			and resource_associated_entity_id = OBJECT_ID(N'dbo.testtable');
		commit;
		set @counter_for_read = @counter_for_read + 1;
	end;