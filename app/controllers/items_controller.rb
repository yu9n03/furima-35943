class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :seller_confirmation, only: [:edit, :update, :destroy]
  before_action :sold_out_item, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :charge_rate_id, :prefecture_id, :until_send_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def seller_confirmation
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end
end
