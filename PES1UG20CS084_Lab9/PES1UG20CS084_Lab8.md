# DBMS Lab 9

### Aryansh Bhargavan

### PES1UG20CS084

---

**1) Write a trigger on insert to compartment table when a new compartment gets added to a train and make sure that total number of compartments available in the train does not exceed more than 4.**

>```sql
>delimiter &&
>DELIMITER $$
>CREATE TRIGGER no_compartment2
>after insert on compartment for each row
>BEGIN
>DECLARE error_msg VARCHAR(350); 
>declare number_compartments int;
>SET error_msg = ('the no of compartments should not be more than 4'); 
>set number_compartments=(select count(*) from
>compartment where train_number=new.train_number);
>IF number_compartments>4 THEN
>SIGNAL SQLSTATE '45000'
>SET MESSAGE_TEXT = error_msg; 
>END IF; 
>END $$ 
>DELIMITER ;
>INSERT into compartment 
>values('A01','IClass',16,0,25260);
>INSERT into compartment 
>values('B01','IClass',16,0,25260);
>select * from compartment;
>```
>
>![image-20221108225721529](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221108225721529.png)
>
>---

**2) Create a trigger to add payment information to the backup table when we try to delete some information from the ticket table.**

>```sql
>create table test as select * from ticket join (ticket_passenger join payment_info using(pnr)) using(pnr);
>create table backup like test;
>drop table test;
>DELIMITER &&
>CREATE TRIGGER deletetrigger
>BEFORE DELETE ON ticket 
>FOR EACH ROW
>BEGIN
>INSERT INTO backup (select * from ticket join (ticket_passenger join payment_info using(pnr)) using(pnr) where pnr=old.pnr);
>delete from payment_info where pnr=old.pnr;
>delete from ticket_passenger where pnr =old.pnr;
>end &&
>delimiter ;
>delete from ticket where pnr='PNR001';
>select * from backup;
>```
>
>![image-20221108225817145](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221108225817145.png)
>
>![image-20221108225848498](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221108225848498.png)
>
>
>
>---

