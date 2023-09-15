                                              /* Creating Tabels  */
create Table trains (train_no int ,
                     train_model varchar(50),
                     maintenance_date varchar(50),
                     primary key (train_no));

create Table trips (trip_id int ,
                    trip_date varchar (50),
                    time varchar (50), 
                    train_no int , 
                    primary key (trip_id , trip_date) ,
                    foreign key (train_no) references trains);

create Table tickets (ticket_id int,
                      trip_id int,
                      trip_price int,
                      trip_date varchar (50),
                      primary key (ticket_id) , 
                      foreign key (trip_id,trip_date) references trips);

create Table stations (station_name varchar(50),
                       country varchar (50), 
                       primary key (station_name));

create Table passenger (passenger_id int ,
                        name varchar(50),
                        phone varchar(50),
                        birth_day date, 
                        primary key (passenger_id));
create Table booking (passenger_id int ,
                      ticket_id int, 
                      foreign key (passenger_id) references passenger,
                      foreign key (ticket_id) references tickets);

create Table trip_destination (trip_id int ,
                              trip_date varchar (50),
                              m_station varchar (50),
                              A_station varchar (50),
                              foreign key (trip_id , trip_date) references trips , 
                              foreign key ( m_station ) references stations (station_name)  ,
                              foreign key ( a_station ) references stations (station_name));

/******************************************************************************************************************************/

                      /* Add Age Attribute */
alter table passenger add age as datediff (year,birth_day,current_timestamp);
 
