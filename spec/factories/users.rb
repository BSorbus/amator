FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@uke.gov.pl"
    password "please123"

    trait :admin do
      role 'admin'
    end

    trait :power_user do
      role 'power_user'
    end

    # add if Devise confirmable
    #after(:build) do |u|
    #  u.confirm!
    #  u.skip_confirmation_notification!
    #end
    # or
    before(:create) {|user| user.skip_confirmation! }
  end


  factory :user_domain_nouke do
    name "Test NoUkeUser"
    email "test@nouke.domain.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

    # add if Devise confirmable
    before(:create) {|user| user.skip_confirmation! }

  end



end

