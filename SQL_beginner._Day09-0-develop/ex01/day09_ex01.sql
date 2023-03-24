create or replace function fnc_trg_person_update_audit() returns trigger as $$
    begin
        if (tg_op = 'UPDATE') then
        insert into person_audit values
        (current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address);
        return old;
        end if;
        return null;
    end;
$$ language plpgsql;

create trigger trg_person_update_audit after update on person
    for each row execute function fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
