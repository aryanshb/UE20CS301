alter table payment_info drop foreign key payment_info_ibfk_1;
ALTER TABLE `payment_info`
ADD CONSTRAINT `payment_info_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket` (`pnr`) on delete cascade;
---------------------------
delimiter &&
DELIMITER $$
CREATE TRIGGER compartmenttrigger
after insert on compartment for each row
BEGIN
DECLARE error_msg VARCHAR(350); 
declare number_compartments int;
SET error_msg = ('the no of compartments should not be more than 4'); 
set number_compartments=(select count(*) from
compartment where train_number=new.train_number);
IF number_compartments>4 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = error_msg; 
END IF; 
END $$ 
DELIMITER ;
INSERT into compartment 
values('A01','IClass',16,0,25260);
INSERT into compartment 
values('B01','IClass',16,0,25260);
select * from compartment;
---------------------------
create table test as select * from ticket join (ticket_passenger join payment_info using(pnr)) using(pnr);
create table backup like test;
drop table test;
DELIMITER &&
CREATE TRIGGER deletetrigger
BEFORE DELETE ON ticket 
FOR EACH ROW
BEGIN
INSERT INTO backup (select * from ticket join (ticket_passenger join payment_info using(pnr)) using(pnr) where pnr=old.pnr);
delete from payment_info where pnr=old.pnr;
delete from ticket_passenger where pnr =old.pnr;
end &&
delimiter ;
delete from ticket where pnr='PNR001';
select * from backup;
---------------------------
