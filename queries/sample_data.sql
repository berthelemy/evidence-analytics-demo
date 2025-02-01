select
   expenditure
  , SUM(expenditure) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_expenditure
  , revenue
  , SUM(revenue) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_revenue
  , FTE
  , volunteer_hours
  , date
from CSV.sample_data
order by date desc