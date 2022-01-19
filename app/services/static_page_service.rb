class StaticPageService
    def self.total_sales_data_admin(sales_group_by)
        if sales_group_by == nil
            @sales_group_by = "Monthly"
            @sales_data = Order.group_by_month(:created_at,range: 5.month.ago..Time.now).count 
        else
            if sales_group_by=="Yearly" 
                @sales_group_by = "Yearly"
                @sales_data = Order.group_by_year(:created_at, range: 5.year.ago..Time.now).count 
            elsif sales_group_by=="Monthly" 
                @sales_group_by = "Monthly"
                @sales_data = Order.group_by_month(:created_at,range: 5.month.ago..Time.now).count  
            elsif sales_group_by=="Weekly" 
                @sales_group_by = "Weekly"
                @sales_data = Order.group_by_week(:created_at, range: 5.week.ago..Time.now).count 
            elsif sales_group_by=="Daily" 
                @sales_group_by = "Daily"
                @sales_data = Order.group_by_day(:created_at, range: 7.day.ago..Time.now).count  
            end 
        end
        return @sales_group_by,@sales_data
    end

    def self.total_sales_data_seller(user, sales_group_by)
        seller = User.find(user)
        seller_sales_data = 
                            seller.product_variants.map {|p| p.orders} << 
                            seller.product_services.map {|s| s.orders}
        if seller_sales_data[0].empty? == "false"
            if sales_group_by == nil
                @sales_group_by = "Monthly"
                @sales_data = seller_sales_data[0].group_by_year(:created_at).count 
            else
                if sales_group_by=="Yearly" 
                    @sales_group_by = "Yearly"
                    @sales_data = seller_sales_data[0].group_by_year(:created_at).count 
                elsif sales_group_by=="Monthly" 
                    @sales_group_by = "Monthly"
                    @sales_data = seller_sales_data[0].group_by_year(:created_at).count  
                elsif sales_group_by=="Weekly" 
                    @sales_group_by = "Weekly"
                    @sales_data = seller_sales_data[0].group_by_year(:created_at).countt 
                elsif sales_group_by=="Daily" 
                    @sales_group_by = "Daily"
                    @sales_data = seller_sales_data[0].group_by_year(:created_at).count 
                end 
            end
        end
        return @sales_group_by,@sales_data
    end

    def self.user_data_graph(user_group_by)
        if user_group_by == nil
            @users_group_by = "Monthly"
            @users_data = User.group_by_month(:created_at,range: 5.month.ago..Time.now).count 
        else
            if user_group_by=="Yearly" 
                @users_group_by = "Yearly"
                @users_data = User.group_by_year(:created_at,range: 5.year.ago..Time.now).count  
            elsif user_group_by=="Monthly" 
                @users_group_by = "Monthly"
                @users_data = User.group_by_month(:created_at,range: 5.month.ago..Time.now).count  
            elsif user_group_by=="Weekly" 
                @users_group_by = "Weekly"
                @users_data = User.group_by_week(:created_at,range: 5.week.ago..Time.now).count 
            elsif user_group_by=="Daily" 
                @users_group_by = "Daily"
                @users_data = User.group_by_day(:created_at,range: 5.day.ago..Time.now).count  
            end 
        end
        return @users_group_by, @users_data
    end

    def self.tabular_sales_data_admin(tabular_sales_group_by)
        if tabular_sales_group_by == nil
            @tabular_sales_group_by = "Monthly"
            @tabular_sales_data =Order.all.group_by {|m|  m.created_at.beginning_of_month}
        else
            if tabular_sales_group_by=="Yearly" 
                @tabular_sales_group_by = "Yearly"
                @tabular_sales_data =Order.all.group_by {|m|  m.created_at.beginning_of_year} 
            elsif tabular_sales_group_by=="Monthly" 
                @tabular_sales_group_by = "Monthly"
                @tabular_sales_data =Order.all.group_by {|m|  m.created_at.beginning_of_month}  
            elsif tabular_sales_group_by=="Weekly" 
                @tabular_sales_group_by = "Weekly"
                @tabular_sales_data =Order.all.group_by {|m|  m.created_at.beginning_of_week} 
            elsif tabular_sales_group_by=="Daily" 
                @tabular_sales_group_by = "Daily"
                @tabular_sales_data =Order.all.group_by {|m|  m.created_at.beginning_of_day}  
            end 
        end
        return @tabular_sales_group_by, @tabular_sales_data
    end

    def self.tabular_sales_data_seller(user, tabular_sales_group_by)
        seller = User.find(user)
        seller_tabular_sales_data = 
                                    seller.product_variants.map {|p| p.orders} << 
                                    seller.product_services.map {|s| s.orders}
        if seller_tabular_sales_data[0].empty? == "false"
            if tabular_sales_group_by == nil
                @tabular_sales_group_by = "Monthly"
                @tabular_sales_data =seller_tabular_sales_data[0].all.group_by {|m|  m.created_at.beginning_of_month}
            else
                if tabular_sales_group_by=="Yearly" 
                    @tabular_sales_group_by = "Yearly"
                    @tabular_sales_data = 
                                    seller_tabular_sales_data[0].all.group_by {|m|  m.created_at.beginning_of_year} 
                elsif tabular_sales_group_by=="Monthly" 
                    @tabular_sales_group_by = "Monthly"
                    @tabular_sales_data = 
                                    seller_tabular_sales_data[0].all.group_by {|m|  m.created_at.beginning_of_month}  
                elsif tabular_sales_group_by=="Weekly" 
                    @tabular_sales_group_by = "Weekly"
                    @tabular_sales_data = 
                                    seller_tabular_sales_data[0].all.group_by {|m|  m.created_at.beginning_of_week} 
                elsif tabular_sales_group_by=="Daily" 
                    @tabular_sales_group_by = "Daily"
                    @tabular_sales_data = 
                                    seller_tabular_sales_data[0].all.group_by {|m|  m.created_at.beginning_of_day}  
                end 
            end
        end  
        return @tabular_sales_group_by, @tabular_sales_data      
    end
end