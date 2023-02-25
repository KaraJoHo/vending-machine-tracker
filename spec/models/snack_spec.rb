require 'rails_helper'

RSpec.describe Snack do 
  describe 'relationships' do 
    it { should have_many :machine_snacks}
    it { should have_many :machines}
  end

  describe 'validations' do 
    it { should validate_presence_of :name}
    it { should validate_presence_of :price}
  end
end