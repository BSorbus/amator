# Feature: Navigation links
#   As a visitor
#   I want to see navigation links
#   So I can find home, sign in, or sign up
feature 'Navigation links', :devise do

  # Scenario: View navigation links
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "home," "sign in," and "sign up"
  scenario '1. view navigation links' do
    visit root_path
    #expect(page).to have_content 'Home'
    #expect(page).to have_content 'Sign in'
    #expect(page).to have_content 'Sign up'
    #expect(page).to have_content 'Individuals'
    #expect(page).to have_content 'Clubs'

    expect(page).to have_content I18n.t 'home'
    expect(page).to have_content I18n.t 'link_to.individuals'
    expect(page).to have_content I18n.t 'link_to.clubs'
    expect(page).to have_content I18n.t 'link_to.individual_mf_devices'
    expect(page).to have_content I18n.t 'link_to.club_mf_devices'

    expect(page).to have_content I18n.t 'devise.link_to.sign_in'
  end

end
