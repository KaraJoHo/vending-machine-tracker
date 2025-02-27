class Machine < ApplicationRecord
  validates_presence_of :location
  
  belongs_to :owner
  has_many :machine_snacks 
  has_many :snacks, through: :machine_snacks

  def average_price_of_snacks 
    snacks.average(:price)
  end

  def snack_types 
    snacks.distinct.count
  end
end
