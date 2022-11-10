--1a--
CREATE VIEW compute_price AS
SELECT Ticket.PNR, Ticket.Train_No, Ticket.Departure, Ticket.Arrival,
Route_Info.Distance, Fare.fare_per_km
FROM Ticket, Route_Info, Fare
WHERE (Ticket.Train_No = Route_Info.Train_No AND
Ticket.Departure = Route_Info.From_Station_Name AND
Ticket.Arrival = Route_Info.To_Station_Name AND
Fare.Train_Type=Ticket.Train_Type AND
Fare.Compartment_Type =Ticket.Compartment_type);

--1b--
CREATE VIEW passenger_num AS select PNR, count(PNR) as numbers from
Ticket_Passenger group by PNR;

--1c--
UPDATE Payment_Info AS p INNER JOIN compute_price AS cs ON p.PNR =
cs.PNR INNER JOIN passenger_num AS pn ON cs.PNR = pn.PNR SET p.Price =
cs.Distance * cs.Fare_Per_KM * pn.numbers;

--2--
SELECT Train_No,train_name,From_Station_Name,To_Station_Name,Distance FROM TRAIN NATURAL JOIN ROUTE_INFO;

--3--
select distinct train_no from route_info inner join compartment on train_no=train_number where availability>10 and from_station_name='Bengaluru' and to_station_name='Chennai';

--4--
select name from ticket_passenger inner join compute_price on ticket_passenger.pnr=compute_price.pnr where distance*fare_per_km>500;

--5--
SELECT firstname,lastname,DOB,PNR FROM TRAIN_USER LEFT OUTER JOIN TICKET ON TRAIN_USER.User_ID=TICKET.passenger_id WHERE TICKET.PNR IS NOT NULL;

--6--
SELECT firstname,lastname FROM TRAIN_USER LEFT OUTER JOIN TICKET ON TRAIN_USER.User_ID=TICKET.passenger_id WHERE TICKET.PNR IS NULL;

--7--
SELECT PNR,TRAIN_No,Travel_date,firstname,lastname FROM TRAIN_USER RIGHT OUTER JOIN TICKET ON TRAIN_USER.User_ID=TICKET.passenger_ID WHERE TRAIN_USER.User_ID IS NOT NULL;

--8--
SELECT passenger_id as User_ID,TRAIN.train_no,train_name FROM TICKET RIGHT OUTER JOIN TRAIN ON TRAIN.train_No=TICKET.train_no WHERE (CURRENT_DATE>=TICKET.Travel_date);

--9--
SELECT distinct train.Train_No ,train.train_name FROM TRAIN,route_info,ticket WHERE train.Destination != "Mangaluru" AND route_info.distance NOT IN (Select distance from route_info where distance<100) AND ticket.departure_time NOT IN(SELECT departure_time from ticket where departure_time = '20:30:00');

--10--
SELECT passenger_id as user_id FROM TICKET JOIN PAYMENT_INFO ON PAYMENT_INFO.PNR=TICKET.PNR WHERE ( PAYMENT_INFO.Price > (SELECT AVG(PRICE) FROM PAYMENT_INFO));


