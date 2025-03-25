class Item < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :quantity, presence: true, numericality: true
end
