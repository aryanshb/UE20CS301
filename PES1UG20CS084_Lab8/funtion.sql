delimiter !!
create function number_of_tickets (user_id varchar(20))
returns varchar(50)
deterministic
begin
  declare number_of_tickets varchar(50);

  set number_of_tickets = (
    select
      cast(count(*) as varchar(50))
    from
      ticket
    where
      pnr = user_id
        and
      year(travel_date) = year(curdate())
        and
      month(travel_date) = month(curdate())
  );

  if number_of_tickets > 3 then
    set number_of_tickets = "cannot purchase tickets current limit is over";
  end if;

  return number_of_tickets;
end;!!
delimiter ;