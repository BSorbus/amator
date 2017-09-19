require 'rails_helper'

RSpec.describe IndividualMfDevicePolicy do
  subject { described_class }

  let(:user) { FactoryGirl.build_stubbed :user }
  let(:admin) { FactoryGirl.build_stubbed :user, :admin }
  let(:power_user) { FactoryGirl.build_stubbed :user, :power_user }

  let(:individual_mf_device) { FactoryGirl.build_stubbed :individual_mf_device }

  permissions :index? do
    it 'allows an admin to index' do
      expect(subject).to permit(user, individual_mf_device)
    end
    it 'allows an admin to index' do
      expect(subject).to permit(admin, individual_mf_device)
    end
    it 'allows an power_user to index' do
      expect(subject).to permit(power_user, individual_mf_device)
    end
  end

  permissions :show? do
    it 'allows an admin to show' do
      expect(subject).to permit(user, individual_mf_device)
    end
    it 'allows an admin to show' do
      expect(subject).to permit(admin, individual_mf_device)
    end
    it 'allows an power_user to show' do
      expect(subject).to permit(power_user, individual_mf_device)
    end
  end

  permissions :create? do
    it 'prevents created if not an admin or power_user' do
      expect(subject).not_to permit(user, individual_mf_device)
    end
    it 'allows an admin to create' do
      expect(subject).to permit(admin, individual_mf_device)
    end
    it 'allows an power_user to create' do
      expect(subject).to permit(power_user, individual_mf_device)
    end
  end

  permissions :update? do
    it 'prevents updates if not an admin or power_user' do
      expect(subject).not_to permit(user, individual_mf_device)
    end
    it 'allows an admin to make updates' do
      expect(subject).to permit(admin, individual_mf_device)
    end
    it 'allows an power_user to make updates' do
      expect(subject).to permit(power_user, individual_mf_device)
    end
  end

  permissions :destroy? do
    it 'prevents destroyed if not an admin or power_user' do
      expect(subject).not_to permit(user, individual_mf_device)
    end
    it 'allows an admin to destroy' do
      expect(subject).to permit(admin, individual_mf_device)
    end
    it 'allows an power_user to destroy' do
      expect(subject).to permit(power_user, individual_mf_device)
    end
  end
end
