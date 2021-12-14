alter user hr identified by hr account unlock;

drop user you cascade;

create user you identified by you
default tablespace users;

grant connect, resource to you;

grant all on hr.departments to you;