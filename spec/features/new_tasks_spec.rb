require 'rails_helper'

RSpec.feature "NewTasks", type: :feature do
  
  describe "A user with a room" do
    let(:user) { create :user }
    let(:room) { create :room, user: user }
    
    before do
      visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      visit "/rooms/#{room.id}"
      click_link 'New Task'
    end

    describe "creates a task" do
      context "with valid fields" do
        it "creates task" do
          fill_in 'Name', with: 'Valid Task'
          fill_in 'Days', with: 1
          click_button 'Create Task'
          expect(page).to have_content('Valid Task')
        end
      end

      context "with no name" do
        it "does not create task" do
          click_button 'Create Task'
          expect(page).to have_content("Name can't be blank")
        end
      end
    end
  end
end