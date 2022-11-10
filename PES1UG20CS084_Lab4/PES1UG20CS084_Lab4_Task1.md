# DBMS Lab 4

### Aryansh Bhargavan

### PES1UG20CS084

---

#### Task 1

>1) Inserting shared data into tables:
>
>  ![image-20220927194251864](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194251864.png)
>
>  ![image-20220927194407025](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194407025.png)
>
>  ![image-20220927194517337](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194517337.png)
>
>  ![image-20220927194619736](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194619736.png)
>
>  ![image-20220927194714510](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194714510.png)
>
>  ![image-20220927194807227](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194807227.png)
>
>  ![image-20220927194853120](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194853120.png)
>
>  ![image-20220927194938998](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927194938998.png)
>
>  ![image-20220927195149961](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927195149961.png)
>
>  ![image-20220927195240985](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927195240985.png)
>
>---
>
>  2) Calculate and update age attribute in User Table
>
>     **` update train_user set age=timestampdiff(year,dob,curdate());`**
>
>![image-20220927201201743](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927201201743.png)
>
>3) Display all the route information whose distance falls in a range from 70 to 150 km.
>
> **`select * from route_info where distance between 70 and 150;`**
>
>![image-20220927201427906](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927201427906.png)
>
>4) Display the train route information which are run between Chennai and Sholingur
>
> **`select * from route_info where from_station_name="Chennai" and to_station_name="Sholingur";`**
>
>![image-20220927201736835](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927201736835.png)
>
>5) Display the train details whose type is not mail
>
> **`select * from train where train_type != "Mail";`**
>
>![image-20220927202113074](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927202113074.png)
>
>6) Display the train name which goes to Chennai from Bangalore
>
> **`select train_name from train where source="Bengaluru" and destination="Chennai";`**
>
>![image-20220927203059490](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927203059490.png)
>
>7) Display the list of trains starting from Chennai after 8:00
>
> **`select * from ticket where departure="Chennai" and departure_time>cast('8:00:00' as time);`**
>
>![image-20220927203452228](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927203452228.png)
>
>8) Display the list of users who are born between 1980 to 1990
>
> **`select * from train_user where dob between '1980-01-01' and '1990-12-31';`**
>
>![image-20220927203725669](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927203725669.png)
>
>9) Display the train users whose name starts with the letter ‘S’
>
> **`select * from train_user where firstname like "S%";`**
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

