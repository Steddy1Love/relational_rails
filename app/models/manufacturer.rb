class Manufacturer < ApplicationRecord
  has_many :vehicles

  def average_pistons
    self.vehicles.average(:number_of_cylinders)
  end
end