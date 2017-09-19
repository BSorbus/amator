require 'rails_helper'

RSpec.describe Club, type: :model do
  describe 'instantiation' do
    #let!(:club) { build(:club) }
    let (:club) { FactoryGirl.build_stubbed :club }

    it 'instantiates a list' do
      expect(club.class.name).to eq("Club")
    end
  end

end
