require 'rails_helper'

RSpec.describe "Snack Show Page" do 
  before(:each) do 
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")

    @owner_2 = Owner.create(name: "Tim's Snacks")
    @soup  = @owner_2.machines.create(location: "Tim's UnMixed Soups")

    @snack_1 = Snack.create!(name: "Chips", price: 1)
    @snack_2 = Snack.create!(name: "Chocolate", price: 2)
    @snack_3 = Snack.create!(name: "Berries", price: 3)

    @snack_in_machine_1 = MachineSnack.create!(snack_id: @snack_1.id, machine_id: @dons.id)
    @snack_in_machine_3 = MachineSnack.create!(snack_id: @snack_1.id, machine_id: @soup.id)
    @snack_in_machine_2 = MachineSnack.create!(snack_id: @snack_2.id, machine_id: @dons.id)
  end

  describe 'when visiting snack show page' do 
    it ' has the name, price, machines locations, anerage price, and count of distinct types of snacks in the machine' do 
      visit snack_path(@snack_1)

      within(".snack_info") do 
        expect(page).to have_content(@snack_1.name)
        expect(page).to_not have_content(@snack_2.name)
        expect(page).to have_content("$1.00")
        expect(page).to have_content("Don's Mixed Drinks")
        expect(page).to have_content("Tim's UnMixed Soups")
        expect(page).to have_content("Don's Mixed Drinks Average Price: $1.50")
        expect(page).to have_content("Tim's UnMixed Soups Average Price: $1.00")
        expect(page).to have_content("2 kinds of snacks in Don's Mixed Drinks")
        expect(page).to have_content("1 kinds of snacks in Tim's UnMixed Soups")
      end
    end
  end
end