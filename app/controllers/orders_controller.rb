class OrdersController < ApplicationController
  before_action :move_to_index, only: [:create]

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :index
    end
  end

end
