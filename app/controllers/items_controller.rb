class ItemsController < ApplicationController
  def index
    @items = Item.new
  end
end
