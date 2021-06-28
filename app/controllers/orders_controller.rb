class OrdersController < ApplicationController
  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :new
  end

  private
 
  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture, :municipality, :address, :building_name).merge(user_id: current_user.id, item_id: item.id) #不安！！
end
