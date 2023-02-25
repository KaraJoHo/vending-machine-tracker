require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons.id)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'it has the name of all snacks associated with that machine' do 

    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snack_1 = Snack.create!(name: "Chips", price: 1)
    snack_2 = Snack.create!(name: "Chocolate", price: 2)
    snack_3 = Snack.create!(name: "Berries", price: 3)

    snack_in_machine_1 = MachineSnack.create!(snack_id: snack_1.id, machine_id: dons.id)
    snack_in_machine_2 = MachineSnack.create!(snack_id: snack_2.id, machine_id: dons.id)
    
    visit machine_path(dons.id)

    within("#snack_#{snack_1.id}") do 
      expect(page).to have_content("Chips")
      expect(page).to have_content("Price: 1")
      expect(page).to_not have_content("Chocolate")
    end

    within(".snacks") do 
      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_2.name)
      expect(page).to_not have_content(snack_3.name)

    end
  end

  scenario 'has the average price for all snacks' do 
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snack_1 = Snack.create!(name: "Chips", price: 1)
    snack_2 = Snack.create!(name: "Chocolate", price: 2)
    snack_3 = Snack.create!(name: "Berries", price: 3)

    snack_in_machine_1 = MachineSnack.create!(snack_id: snack_1.id, machine_id: dons.id)
    snack_in_machine_1 = MachineSnack.create!(snack_id: snack_2.id, machine_id: dons.id)
    
    visit machine_path(dons.id)
    # require 'pry'; binding.pry


    within(".snacks") do 
      expect(page).to have_content("Average Price: $1.50")
    end
  end
end
