--set transaction isolation level read uncommitted;
--set transaction isolation level read committed;
--set transaction isolation level repeatable read;
set transaction isolation level serializable;

begin transaction
		select sum(value) from testtable;
		select * from sys.dm_tran_locks 
		where resource_database_id = DB_ID()
		and resource_associated_entity_id = OBJECT_ID(N'dbo.testtable');
		waitfor delay '00:00:03';
		select sum(value) from testtable;
		select * from sys.dm_tran_locks 
		where resource_database_id = DB_ID()
		and resource_associated_entity_id = OBJECT_ID(N'dbo.testtable');
	commit;