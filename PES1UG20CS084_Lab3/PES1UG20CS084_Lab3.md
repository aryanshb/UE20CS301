# 

##### Creating Database:

> ```create database PES1UG20CS084_Railway;```
>
> ![image-20220911134410902](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911134410902.png)

##### Creating table Train

> ```sql
> create table train(
>     -> train_no int NOT NULL,
>     -> train_name varchar(30),
>     -> train_type varchar(20),
>     -> source_station varchar(30),
>     -> dest_station varchar(30),
>     -> availability boolean,
>     -> PRIMARY KEY(train_no));
> ```
>
> ![image-20220911134912271](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911134912271.png)
>
> ![image-20220911135229261](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911135229261.png)

##### Creating table User

> ```sql
> create table user(
>     -> user_id int NOT NULL,
>     -> user_type varchar(20),
>     -> fname varchar(20),
>     -> lname varchar(20),
>     -> DOB date,
>     -> age int(3),
>     -> pincode int,
>     -> street_no int,
>     -> PRIMARY KEY(user_id));
> ```
>
> ![image-20220911135132325](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911135132325.png)
>
> ![image-20220911135245636](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911135245636.png)



##### Creating table Fare

> ```sql
> create table fare(
>     -> train_type varchar(20) NOT NULL,
>     -> comp_type int,
>     -> farepkm decimal(4,2),
>     -> PRIMARY KEY(train_type));
> ```
>
> ![image-20220911135527317](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911135527317.png)
>
> ![image-20220911135555103](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911135555103.png)

##### Creating table Ticket

> ```sql
> create table ticket(
>     -> VIN int NOT NULL,
>     -> travel_date date,
>     -> departure varchar(20),
>     -> arrival varchar(20),
>     -> dep_time datetime,
>     -> arr_time datetime,
>     -> user_id int,
>     -> train_type varchar(20),
>     -> comp_type int,
>     -> comp_no int,
>     -> PRIMARY KEY(VIN),
>     -> FOREIGN KEY(user_id) REFERENCES user(user_id),
>     -> FOREIGN KEY(train_type) REFERENCES fare(train_type));
> ```
>
> ![image-20220911142258457](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911142258457.png)
>
> ![image-20220911142310424](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911142310424.png)

##### Creating table Payment

> ```sql
> create table payment(
>     -> trans_id varchar(20) NOT NULL,
>     -> bank varchar(50),
>     -> card_no int,
>     -> price decimal(10,2),
>     -> VIN int,
>     -> PRIMARY KEY(trans_id),
>     -> FOREIGN KEY(VIN) REFERENCES ticket(VIN));
> ```
>
> ![image-20220911142634980](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911142634980.png)
>
> ![image-20220911142649966](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911142649966.png)

##### Creating table Compartment

> ```sql
> create table comp(
>     -> type varchar(20),
>     -> capacity int,
>     -> availability boolean,
>     -> comp_no int,
>     -> train_no int,
>     -> FOREIGN KEY(train_no) REFERENCES train(train_no));
> ```
>
> ![image-20220911142909497](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911142909497.png)
>
> ![image-20220911142920554](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911142920554.png)



##### Creating table Route

> ```sql
> create table route(
>     -> from_st_no int,
>     -> from_st_name varchar(20),
>     -> to_st_no int,
>     -> to_st_name varchar(20),
>     -> distance decimal(7,2),
>     -> train_no int,
>     -> FOREIGN KEY(train_no) REFERENCES train(train_no));
> ```
>
> ![image-20220911143159215](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911143159215.png)
>
> ![image-20220911143212760](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911143212760.png)

##### Creating table User_train

> ```sql
> create table user_train(
>     -> date_time_stamp datetime,
>     -> train_no int,
>     -> user_id int,
>     -> FOREIGN KEY(train_no) REFERENCES train(train_no),
>     -> FOREIGN KEY(user_id) REFERENCES user(user_id));
> ```
>
> ![image-20220911143921067](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911143921067.png)
>
> ![image-20220911144110294](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911144110294.png)



##### Creating table Ticket_passenger

> ```sql
> create table ticket_passenger(
>     -> name varchar(20),
>     -> age int,
>     -> seat_no varchar(6),
>     -> VIN int,
>     -> FOREIGN KEY(VIN) REFERENCES ticket(VIN));
> ```
>
> ![image-20220911144327572](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911144327572.png)
>
> ![image-20220911144346401](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911144346401.png)

##### Creating table User_phone

> ```sql
> create table user_phone(
>     -> phone_number int(10),
>     -> user_id int,
>     -> FOREIGN KEY(user_id) REFERENCES user(user_id));
> ```
>
> ![image-20220911144538197](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911144538197.png)
>
> ![image-20220911144550911](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911144550911.png)

---

#### PHPMyadmin

##### Visiting`localhost/phpmyadmin` 

##### Adding `NOT NULL` constraint on `train_name` and `train_type`:

> ```sql
> ALTER TABLE train
> MODIFY train_type varchar(20) NOT NULL;
> ```
>
> 
>
> ![](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911145637059.png)
>
> ```sql
> ALTER TABLE train
> MODIFY train_name varchar(30) NOT NULL;
> ```
>
> 
>
> ![image-20220911145707649](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911145707649.png)

##### Adding default constraint for compartment table setting `availability` attribute to Yes:

> ```sql
> ALTER TABLE comp
> ALTER availability SET DEFAULT 1;
> ```
>
> 
>
> ![](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220911145900617.png)



