# Lab 6 Database Management Systems

### PES1UG20CS084

### Aryansh Bhargavan

---

#### 1) Find the average distance between subsequent stations for every train

>`select avg(distance) from route_info group by train_no;`
>
>![image-20221014084639543](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221014084639543.png)

#### 2) Find the average distance between subsequent stations for every train and display them in

#### descending order of distance

>`select avg(distance) from route_info group by train_no order by avg(distance) desc;`
>
>![image-20221014084859590](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221014084859590.png)

#### 3) Display the list of train numbers and the total distance traveled by each in descending
#### order of the distance traveled

>`select train_no, sum(distance) from route_info group by train_no order by sum(distance) desc;`
>
>![image-20221014085343052](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221014085343052.png)

#### 4) List those trains that have maximum and minimum number compartments and also
#### display number of compartments they have. (2 queries one to find max and other to find min)

>`select train_number, count(compartment_no) from compartment group by train_number having count(compartment_no)>=all(select count(comp.compartment_no) from compartment as comp group by comp.train_number);`
>
>![image-20221014091539345](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221014091539345.png)
>
>`select train_number, count(compartment_no) from compartment group by train_number having count(compartment_no)<=all(select count(comp.compartment_no) from compartment as comp group by comp.train_number);`
>
>![image-20221014091603907](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221014091603907.png)

#### 5) Display the number of phone numbers corresponding to the user_id(s) ADM_001,
USR_006, USR_10

>`select user_id, count(phone_no) from user_phone where user_id in ('ADM_001','USR_006','USR_010') group by user_id;`
>
>![image-20221014092838637](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221014092838637.png)

#### 6) Find the average fare per km for each train type specified and display the train type and
corresponding average fare per km as ‘Avg_Fare’ in decreasing order of Avg_Fare

>`select train_type, avg(fare_per_km) as Avg_fare from fare group by train_type order by Avg_fare desc;`
>
>![image-20221014093548278](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221014093548278.png)

#### 7) Retrieve all details of the oldest passenger

>`select * from ticket_passenger as tp where age=(select max(age) from ticket_passenger);`
>
>![image-20221014095648656](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221014095648656.png)

#### 8) Count the number of passengers whose name consists of ‘Ullal’. (Hint: Use the LIKE
operator)

>`select count(*) from ticket_passenger where name like '%Ullal%';`
>
>![image-20221014094510345](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20221014094510345.png)