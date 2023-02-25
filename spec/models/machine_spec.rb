require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks}
    it { should have_many :snacks}
  end

  describe "#average_price_of_snacks" do 
    it 'is the average price of snacks in the machine' do 
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snack_1 = Snack.create!(name: "Chips", price: 1)
    snack_2 = Snack.create!(name: "Chocolate", price: 2)
    snack_3 = Snack.create!(name: "Berries", price: 3)

    snack_in_machine_1 = MachineSnack.create!(snack_id: snack_1.id, machine_id: dons.id)
    snack_in_machine_1 = MachineSnack.create!(snack_id: snack_2.id, machine_id: dons.id)
    
    expect(dons.average_price_of_snacks.to_f).to eq(1.5)
    end
  end

  describe '#snack types' do 
    it 'is the count of distinct snacks in the machine' do 
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")

      snack_1 = Snack.create!(name: "Chips", price: 1)
      snack_2 = Snack.create!(name: "Chocolate", price: 2)
      snack_3 = Snack.create!(name: "Berries", price: 3)

      snack_in_machine_1 = MachineSnack.create!(snack_id: snack_1.id, machine_id: dons.id)
      snack_in_machine_1 = MachineSnack.create!(snack_id: snack_2.id, machine_id: dons.id)

      expect(dons.snack_types).to eq(2)
    end
  end
end
