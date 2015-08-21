require 'rails_helper'

RSpec.feature "NewRooms", type: :feature do
  
  describe "A user" do
    let(:user) { create :user }
    
    before do
      visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end
    
    describe "creates a room" do
      context "with valid name field" do
        it "creates the room" do
          click_link "New Room"
          fill_in 'Name', with: 'Valid Room'
          click_button 'Create Room'
          expect(page).to have_content('Valid Room')
        end
      end

      context "with no name field" do
        it "does not create the room" do
          click_link "New Room"
          click_button 'Create Room'
          expect(page).to have_content("Name can't be blank")
        end
      end
    end
  end
end
