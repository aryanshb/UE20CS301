delimiter !!
create procedure find_and_set_age (in pnr varchar(20), in birth_date date)
begin
  declare age_from_diff int;
  
  set age_from_diff = timestampdiff(year, birth_date, curdate());
  
  update train_user
    set age = age_from_diff
  where
    user_id = pnr;
end;!!
delimiter ;