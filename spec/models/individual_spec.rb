require 'rails_helper'

RSpec.describe Individual, type: :model do
  describe 'instantiation' do
    #let!(:individual) { build(:individual) }
    let (:individual) { FactoryGirl.build_stubbed :individual }

    it 'instantiates a list' do
      expect(individual.class.name).to eq("Individual")
    end
  end

end
