class Recipe < ApplicationRecord
  has_many :ingredients, inverse_of: :recipe
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  validates :name, :description, presence: true
end
