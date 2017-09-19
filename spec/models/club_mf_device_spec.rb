require 'rails_helper'

RSpec.describe ClubMfDevice, type: :model do
  describe 'instantiation' do
    #let!(:club) { build(:club) }
    let (:club_mf_device) { FactoryGirl.build_stubbed :club_mf_device }

    it 'instantiates a list' do
      expect(club_mf_device.class.name).to eq("ClubMfDevice")
    end
  end

end
