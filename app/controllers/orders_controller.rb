class OrdersController < ApplicationController
  before_action :move_to_index, only: [:create]

  def index
    @items = Item.all
  end


end
