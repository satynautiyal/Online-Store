module StaticPagesHelper
    def sales_of_graph_by
        if current_user.role == "admin" && Order.all.length != 0
            @sales_group_by, @sales_data = StaticPageService.total_sales_data_admin(params[:sales_group_by])
        elsif current_user.role == "seller"
            @sales_group_by, @sales_data = StaticPageService.total_sales_data_seller(current_user.id, params[:sales_group_by])
        end
    end

    def users_data_graph_by
        @users_group_by, @users_data = StaticPageService.user_data_graph(params[:users_group_by])
    end

    def tabular_sales_data
        StaticPageService.tabular_sales_data_admin(params[:tabular_sales_group_by])
        if current_user.role == "admin" && Order.all.length != 0
            @tabular_sales_group_by, @tabular_sales_data = StaticPageService.tabular_sales_data_admin(params[:tabular_sales_group_by])
        elsif current_user.role == "seller"
            @tabular_sales_group_by, @tabular_sales_data = StaticPageService.tabular_sales_data_seller(current_user.id,params[:tabular_sales_group_by])           
        end
    end
end

