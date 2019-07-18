module Manager
  class OrdersController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    
    def index
      @orders = Order.all.order(created_at: :desc)
    end

    def show
      @order = Order.find params[:id]
      @order_items = @order.order_items
      respond_to do |format|
        format.html
        format.js
      end
    end

    def destroy
      @order = Order.find params[:id]
      if @order.destroy
        respond_to do |format|
          format.html
          format.js
        end
      else
        flash[:error] = "Delete order failed!"
      end
    end
  end
end
