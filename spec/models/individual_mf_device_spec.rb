require 'rails_helper'

RSpec.describe IndividualMfDevice, type: :model do
  describe 'instantiation' do
    #let!(:individual) { build(:club) }
    let (:individual_mf_device) { FactoryGirl.build_stubbed :individual_mf_device }

    it 'instantiates a list' do
      expect(individual_mf_device.class.name).to eq("IndividualMfDevice")
    end
  end

end
