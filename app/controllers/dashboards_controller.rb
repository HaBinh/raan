class DashboardsController < ApplicationController
    def index
        @result = Array.new
        @imported_price = []
        sql1 = "SELECT d.month, SUM(imported_price) AS total 
              FROM (SELECT generate_series( date_trunc('month','#{11.months.ago}'::date), date_trunc('month','#{Date.today}'::date), '1 month') as month) d 
              left join articles on date_trunc('month', created_at) = d.month group by d.month order by d.month"
        @imported_price = Article.connection.select_all(sql1).to_a
        @result << {imported_price: @imported_price}
        # render( json: {imported_price: @imported_price})

        @total_amount = []
        sql2 = "SELECT d.month, SUM(total_amount) AS total 
                FROM (SELECT generate_series( date_trunc('month','#{11.months.ago}'::date), date_trunc('month','#{Date.today}'::date), '1 month') as month) d 
                left join orders on date_trunc('month', created_at) = d.month group by d.month order by d.month"
        @total_amount = Order.connection.select_all(sql2).to_a
        # render( json: {total_amount: @total_amount})
        @result << {total_amount: @total_amount}

        @profit = Array.new
        (0..11).each do |n| 
            if @imported_price[n]['total'] === nil
                @imported_price[n]['total'] = 0
            end
            if @total_amount[n]['total'] === nil
                @total_amount[n]['total'] = 0
            end
            @profit<<{month: @total_amount[n]['month'], total: @total_amount[n]['total'] - @imported_price[n]['total']}            
        end
        @result << {profit: @profit}
        
        @inventory = []
        sql3 = "SELECT SUM(imported_price) AS total 
                FROM articles
                WHERE status='exist'"
        @inventory = Article.connection.select_all(sql3).to_a
        @result << {inventory: @inventory}
        
        @expected = Array.new
        sql4 = "SELECT SUM(default_sale_price) AS total 
                FROM articles LEFT JOIN products ON articles.product_id = products.id AND articles.status='exist' "
        @expected = Article.connection.select_all(sql4).to_a
        @result << {expected: @expected}
        render( json: {result: @result})
    end
end
# Article.connection.select_all("SELECT d.month, SUM(imported_price) as total from (select generate_series( date_trunc('month','#{11.months.ago}'::date), date_trunc('month','#{Date.today}'::date), '1 month') as month) d left join articles on date_trunc('month', created_at) = d.month group by d.month order by d.month").to_ary
