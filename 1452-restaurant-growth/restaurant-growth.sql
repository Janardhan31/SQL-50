# Write your MySQL query statement below
select distinct
visited_on,
sum(amount) over(order by visited_on   range between interval 6 day preceding and current row)amount ,
      round(sum(amount) over(order by visited_on   range between interval 6 day preceding and current row)/7,2)average_amount 
      from Customer 
      order by 1
      limit 1000000
      offset 6