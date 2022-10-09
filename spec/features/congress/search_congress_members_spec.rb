require 'rails_helper'

RSpec.describe 'Govt Search' do
  describe 'happy path' do
    it 'allows user to search for govt members', :vcr do
      # json_response = File.read('spec/fixtures/govt_data.json')
      # stub_request(:get, "https://api.propublica.org/congress/v1/116/senate/members.json").
      #   with(
      #     headers: {
      #     'X-Api-Key'=> ENV['govt_api_key']
      #     }).
      #   to_return(status: 200, body: json_response , headers: {})

      visit root_path

      fill_in :search, with: 'Sanders'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Bernard Sanders was found!")
      expect(page).to have_content("SenSanders")
    end

    it 'allows user to search for another govt member', :vcr do
      # json_response = File.read('spec/fixtures/govt_data.json')
      # stub_request(:get, "https://api.propublica.org/congress/v1/116/senate/members.json").
      #   with(
      #     headers: {
      #     'X-Api-Key'=> ENV['govt_api_key']
      #     }).
      #   to_return(status: 200, body: json_response , headers: {}) this code uses webmock & the code that current is in place uses VCR

      visit root_path #With this line commented out we only produce one yml file when we run these tests

      fill_in :search, with: 'Booker'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Cory Booker was found!")
      expect(page).to have_content("SenBooker")
    end
  end
end