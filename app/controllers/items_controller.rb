class ItemsController < ApplicationController
  def index
    items = Item.all

    if params[:q]
      items = items.where("LOWER(name) LIKE ?", "%#{params[:q]}%".downcase)
    end

    items = items.map{ |item|
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
