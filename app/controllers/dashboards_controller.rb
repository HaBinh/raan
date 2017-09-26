class DashboardsController < ApplicationController
    def index
        @imported_price = []
        sql1 = "SELECT d.month, SUM(imported_price) AS total 
              FROM (SELECT generate_series( date_trunc('month','#{11.months.ago}'::date), date_trunc('month','#{Date.today}'::date), '1 month') as month) d 
              left join articles on date_trunc('month', created_at) = d.month group by d.month order by d.month"
        @imported_price = Article.connection.select_all(sql1).to_ary
        # render( json: {imported_price: @imported_price})

        @total_amount = []
        sql2 = "SELECT d.month, SUM(total_amount) AS total 
                FROM (SELECT generate_series( date_trunc('month','#{11.months.ago}'::date), date_trunc('month','#{Date.today}'::date), '1 month') as month) d 
                left join orders on date_trunc('month', created_at) = d.month group by d.month order by d.month"
        @total_amount = Order.connection.select_all(sql2).to_ary
        render( json: {total_amount: @total_amount})

        
    end
end
# Article.connection.select_all("SELECT d.month, SUM(imported_price) as total from (select generate_series( date_trunc('month','#{11.months.ago}'::date), date_trunc('month','#{Date.today}'::date), '1 month') as month) d left join articles on date_trunc('month', created_at) = d.month group by d.month order by d.month").to_ary
