#  DBMS Lab 4

### Aryansh Bhargavan

### PES1UG20CS084

---

#### Task 2

>1) **Grant privileges on different tables to users and observe the effect.**
>
>   1) First I create a new user: ![image-20220927212900329](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927212900329.png) 
>   2) I then grant `SELECT` to said user for table `train` in database `lab4_pes1ug20cs084`:![image-20220927213407877](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927213407877.png)
>   3) Now, I log in to mysql using account `pes1ug20cs084 ` and try accessing beyond my granted permissions:![image-20220927213659798](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927213659798.png)
>   4) Now I try accessing what I have been granted access for:![image-20220927213743189](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927213743189.png)
>
>   ---
>
>2) **Revoke UPDATE & DELETE privileges on any tables and observe the effect if any deletion/updation is performed.**
>
>   1) First I grant access to all commands to user `pes1ug20cs084` on table `train` on database `lab4_pes1ug20cs084`:![image-20220927214713090](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927214713090.png)
>   2) Then I revoke `update` and `delete` on table train:![image-20220927214916933](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927214916933.png)
>   3) Then I try using `update` and `delete` command on table `train` using user `pes1ug20cs084`:![image-20220927215506769](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927215506769.png)
>
>   ---
>
>3) **Create different save points and perform some insert/update/delete operations. Observe the
>   effect of commit & rollback operations and release any created savepoints.**
>
>   1) Creating savepoint 1:![image-20220927220001426](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927220001426.png)
>   2) I created another table which wasn't affected by foreign key contstraints to demonstrate this:![image-20220927221552583](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927221552583.png)
>   3) Deleting a value and showing table state:![image-20220927221651087](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927221651087.png)
>   4) Rolling back to previous state and showing values:![image-20220927221753584](C:\Users\Aryansh\AppData\Roaming\Typora\typora-user-images\image-20220927221753584.png)
>
>   We notice that previous value has been regained.
>
>   ---