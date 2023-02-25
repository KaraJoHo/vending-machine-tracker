class Machine < ApplicationRecord
  validates_presence_of :location, :name
  
  belongs_to :owner
  has_many :machine_snacks 
  has_many :snacks, through: :machine_snacks
end
