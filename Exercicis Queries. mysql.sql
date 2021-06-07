use usairlineflights;

-- EXERCICI1
select count(*) total from flights;


-- EXERCICI2
select origin, AVG(ARRDELAY) AS PROM_ARRIBADES, AVG(DEPDELAY) AS PROM_SORTIDES from flights group by origin LIMIT 25;


-- EXERCICI3
select origin, colYear, colMonth, AVG(ARRDELAY)
AS PROM_ARRIBADES from flights group by origin, colYear, colMonth order by origin asc, colYear asc, colMonth asc LIMIT 25;


-- EXERCICI4
create  table newFlights2 as (select origin, colYear, colMonth, ARRDELAY from flights);
update newFlights2 set origin="Albany" where origin="ALB";
update newFlights2 set origin ="Albany" where origin="ALB";
update newFlights2 set origin ="Albuquerque" where origin= "ABQ";  

select  origin as city, colYear, colMonth, AVG(ARRDELAY)
AS prom_arribades from newFlights2 where origin in("Albany", "Albuquerque") group by arrdelay order by origin asc, colYear asc, colMonth;


-- EXERCICI5
select  uniqueCarrier, colYear, colMonth, sum(cancelled) as totalCancelled from flights where cancelled!=0 group by colYear, uniqueCarrier, colMonth 
order by totalCancelled desc; 


-- EXERCICI6
select tailNum, sum(distance) as totalDistance from flights where tailNum is not null group by tailNum order by totalDistance desc limit 10;


-- EXERCICI7
create table newFlights as (select uniqueCarrier, avg(arrDelay) as avgDelay from flights group by uniqueCarrier);
select uniqueCarrier, avgDelay from newFlights where avgDelay>10 order by avgDelay desc;

 








