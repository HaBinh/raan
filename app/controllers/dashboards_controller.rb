class DashboardsController < ApplicationController
    def index
        @result = Array.new
        @imported_price = []
        sql1 = "SELECT d.month, SUM(quantity*imported_price) AS total 
              FROM (SELECT generate_series( date_trunc('month','#{11.months.ago}'::date), date_trunc('month','#{Date.today}'::date), '1 month') as month) d 
              left join imports on date_trunc('month', created_at) = d.month group by d.month order by d.month"
        @imported_price = Article.connection.select_all(sql1).to_a
        @result << {imported_price: @imported_price}

        @total_amount = []
        sql2 = "SELECT d.month, SUM(total_amount) AS total 
                FROM (SELECT generate_series( date_trunc('month','#{11.months.ago}'::date), date_trunc('month','#{Date.today}'::date), '1 month') as month) d 
                left join orders on date_trunc('month', created_at) = d.month group by d.month order by d.month"
        @total_amount = Order.connection.select_all(sql2).to_a
        @result << {total_amount: @total_amount}

        @profit = Array.new
        (0..11).each do |n| 
            if @imported_price[n]['total'] === nil
                @imported_price[n]['total'] = 0
            end
            if @total_amount[n]['total'] === nil
                @total_amount[n]['total'] = 0
            end 
            @profit<<{month: @total_amount[n]['month'][0..6] , total: @total_amount[n]['total'] - @imported_price[n]['total']}           
            
        end
        @result << {profit: @profit}
        
        @inventory = []
        sql3 = "SELECT SUM(imported_price*(quantity-quantity_sold)) AS total 
                FROM imports"
        @inventory = Article.connection.select_all(sql3).to_a
        @result << {inventory: @inventory}
        
        @expected = Array.new
        sql4 = "SELECT SUM(default_sale_price*(quantity-quantity_sold)) AS total 
                FROM imports LEFT JOIN products ON imports.product_id = products.id AND imports.quantity > imports.quantity_sold"
        @expected = Article.connection.select_all(sql4).to_a
        @result <<  {expected: @expected}
        render( json:{result:@result})
    end
end

