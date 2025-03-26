class ItemsController < ApplicationController
  def show
    item = Item.find_by_id(params[:id])

    if item.blank?
      render json: { message: "not found" }, status: :not_found
    else
      render json: {
        id: item.id,
        name: item.name,
        category: item.category,
        quantity: item.quantity
      }
    end
  end

  def delete
    item = Item.find_by_id(params[:id])

    if item.blank?
      render json: { message: "not found" }, status: :not_found
    else
      item.destroy!

      render json: { message: "ok" }
    end
  end

  def create
    cmd = ::Items::Save.new(
      name: params[:name],
      category: params[:category],
      quantity: params[:quantity]
    )

    cmd.execute!

    if cmd.valid?
      render json: cmd.item
    else
      render json: cmd.errors, status: :unprocessable_entity
    end
  end

  def index
    items = Item.all

    if params[:q]
      items = items.where("LOWER(name) LIKE ?", "%#{params[:q]}%".downcase)
    end

    if params[:category].present?
      items = items.where(category: params[:category])
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
