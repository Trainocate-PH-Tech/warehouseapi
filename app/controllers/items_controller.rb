class ItemsController < ApplicationController
  def index
    items = Item.all.map{ |item|
      {
        id: item.id,
        name: item.name,
        quantity: item.quantity,
        category: item.category
      }
    }

    render json: items
  end
end
