# Lab 7 Database Management Systems

### PES1UG20CS084

### Aryansh Bhargavan

---

**1. Find the list of passengers (user_id, user_type First name and
last name) who have traveled from Bengaluru to Chennai during
the month of Oct 2021 and Aug 2022**

> ```sql
> select train_user.user_id,train_user.user_type,train_user.firstname,train_user.lastname from train_user join ticket on
> train_user.User_ID=ticket.passenger_id where Travel_Date > '2022-8-1' and Travel_Date<'2022-8-31' and Departure='bengaluru' and Arrival='chennai'
> union
> select train_user.User_ID,train_user.User_Type,train_user.firstname,train_user.lastname from train_user join ticket on
> train_user.user_id=ticket.passenger_id where Travel_Date > '2021-10-1' and Travel_Date<'2021-10-31' and Departure='bengaluru' and Arrival='chennai';
> ```
>
> ![image-20221022224804907](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221022224804907.png)

**2. Find the list of passengers (user_id, user_type First name and
last name) who have traveled from Bengaluru to Chennai during
the month of Oct 2021 and also during Aug 2022**

> ```sql
> select u1.user_id,u1.user_type,u1.firstname,u1.lastname from train_user u1 join ticket on
> u1.user_id=ticket.passenger_id where Travel_Date > '2021-10-1' and Travel_Date<'2021-10-30' and Departure='bengaluru' and Arrival='chennai'
> and exists(select u2.user_id,u2.user_type,u2.firstname,u2.lastname from train_user u2 join ticket on 
> u2.user_id=ticket.passenger_id where Travel_Date > '2022-8-1' and Travel_Date<'2022-8-30' and Departure='bengaluru' and Arrival='chennai' and u1.user_id=u2.user_id);
> ```
>
> ![image-20221022225021181](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221022225021181.png)

**3. Find the list of passengers (user_id, user_type First name and last name) who have traveled from Bengaluru to Chennai during the month of Aug 2022 and not in Oct 2021**

> ```sql
> select u2.user_id,u2.user_type,u2.firstname,u2.lastname from train_user u2 join ticket on
> u2.user_id=ticket.passenger_id where Travel_Date > '2022-8-1' and Travel_Date<'2022-8-30' and Departure='bengaluru' and Arrival='chennai'
> and not exists(select u1.user_id,u1.user_type,u1.firstname,u1.lastname from train_user u1 join ticket on
> u1.user_id=ticket.passenger_id where Travel_Date > '2021-10-1' and Travel_Date<'2021-10-30' and Departure='bengaluru' and Arrival='chennai' and u1.user_id=u2.user_id);
> ```
>
> ![image-20221022225113586](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221022225113586.png)

**4. Find the list of passengers (user_id, user_type, First name and last name) who have traveled from Bengaluru to Chennai and returned to Bengaluru within a week.**

> ```sql
> select u1.user_id,u1.user_type,u1.firstname,u1.lastname from train_user u1 join ticket t1 on
> u1.user_id=t1.passenger_id where Departure='bengaluru' and Arrival='chennai'
> and exists(select u2.user_id,u2.user_type,u2.firstname,u2.lastname from train_user u2 join ticket t2 on
> u2.user_id=t2.passenger_id where Departure='chennai' and Arrival='bengaluru' and DATEDIFF(t2.travel_date,t1.travel_date)<= 7 and u2.user_id=u1.user_id);
> ```
>
> ![image-20221022225219390](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221022225219390.png)

**5. Find the list of passengers (user_id, user_type, First name and
last name) who have traveled from Bengaluru to Chennai and did
not return to Bengaluru (in other words, only one way travel
from Bengaluru to Chennai)**

> ```sql
> select u1.user_id,u1.user_type,u1.firstname,u1.lastname from train_user u1 join ticket t1 on
> u1.user_id=t1.passenger_id where Departure='bengaluru' and Arrival='chennai'
> and not exists(select u2.user_id,u2.user_type,u2.firstname,u2.lastname from train_user u2 join ticket t2 on
> u2.user_id=t2.passenger_id where Departure='chennai' and Arrival='bengaluru' and u2.user_id=u1.user_id);
> ```
>
> ![image-20221022230752883](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221022230752883.png)
>
> ---

