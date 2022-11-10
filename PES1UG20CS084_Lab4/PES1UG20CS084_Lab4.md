# DBMS Lab 4

### Aryansh Bhargavan

### PES1UG20CS084

---

#### Task 1

>1) Inserting shared data into tables:
>
> ![image-20220927194251864](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194251864.png)
>
> ![image-20220927194407025](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194407025.png)
>
> ![image-20220927194517337](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194517337.png)
>
> ![image-20220927194619736](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194619736.png)
>
> ![image-20220927194714510](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194714510.png)
>
> ![image-20220927194807227](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194807227.png)
>
> ![image-20220927194853120](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194853120.png)
>
> ![image-20220927194938998](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194938998.png)
>
> ![image-20220927195149961](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927195149961.png)
>
> ![image-20220927195240985](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927195240985.png)
>
>---
>
> 2. Calculate and update age attribute in User Table
>
>    **` update train_user set age=timestampdiff(year,dob,curdate());`**
>
>![image-20220927201201743](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927201201743.png)
>
>3) Display all the route information whose distance falls in a range from 70 to 150 km.
>
>**`select * from route_info where distance between 70 and 150;`**
>
>![image-20220927201427906](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927201427906.png)
>
>4) Display the train route information which are run between Chennai and Sholingur
>
>**`select * from route_info where from_station_name="Chennai" and to_station_name="Sholingur";`**
>
>![image-20220927201736835](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927201736835.png)
>
>5) Display the train details whose type is not mail
>
>**`select * from train where train_type != "Mail";`**
>
>![image-20220927202113074](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927202113074.png)
>
>6) Display the train name which goes to Chennai from Bangalore
>
>**`select train_name from train where source="Bengaluru" and destination="Chennai";`**
>
>![image-20220927203059490](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927203059490.png)
>
>7) Display the list of trains starting from Chennai after 8:00
>
>**`select * from ticket where departure="Chennai" and departure_time>cast('8:00:00' as time);`**
>
>![image-20220927203452228](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927203452228.png)
>
>8) Display the list of users who are born between 1980 to 1990
>
>**`select * from train_user where dob between '1980-01-01' and '1990-12-31';`**
>
>![image-20220927203725669](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927203725669.png)
>
>9) Display the train users whose name starts with the letter ‘S’
>
>**`select * from train_user where firstname like "S%";`**
>
>![image-20220927204044319](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927204044319.png)
>
>10) Find the availability of I Class compartment of the train number 62621
>
>**`select availability from compartment where compartment_type="I Class" and train_number=62621;`**
>
>![image-20220927204838290](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927204838290.png)
>
>11) Find the PNR and Transaction ID of the users who made payment via Union Bank
>
>**`select pnr, transaction_no from payment_info where bank="Union Bank";`**
>
>![image-20220927205238189](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927205238189.png)

---

#### Task 2

>1) **Grant privileges on different tables to users and observe the effect.**
>   1) First I create a new user: ![image-20220927212900329](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927212900329.png) 
>   2) I then grant `SELECT` to said user for table `train` in database `lab4_pes1ug20cs084`:![image-20220927213407877](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927213407877.png)
>   3) Now, I log in to mysql using account `pes1ug20cs084 ` and try accessing beyond my granted permissions:![image-20220927213659798](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927213659798.png)
>   4) Now I try accessing what I have been granted access for:![image-20220927213743189](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927213743189.png)
>
>
>---
>
>2) **Revoke UPDATE & DELETE privileges on any tables and observe the effect if any deletion/updation is performed.**
>   1) First I grant access to all commands to user `pes1ug20cs084` on table `train` on database `lab4_pes1ug20cs084`:![image-20220927214713090](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927214713090.png)
>   2) Then I revoke `update` and `delete` on table train:![image-20220927214916933](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927214916933.png)
>   3) Then I try using `update` and `delete` command on table `train` using user `pes1ug20cs084`:![image-20220927215506769](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927215506769.png)
>
>
>---
>
>3) **Create different save points and perform some insert/update/delete operations. Observe the
>   effect of commit & rollback operations and release any created savepoints.**
>   1) Creating savepoint 1:![image-20220927220001426](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927220001426.png)
>   2) I created another table which wasn't affected by foreign key contstraints to demonstrate this:![image-20220927221552583](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927221552583.png)
>   3) Deleting a value and showing table state:![image-20220927221651087](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927221651087.png)
>   4) Rolling back to previous state and showing values:![image-20220927221753584](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927221753584.png)
>
>
>  We notice that previous value has been regained.

---