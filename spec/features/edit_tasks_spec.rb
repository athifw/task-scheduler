require 'rails_helper'

RSpec.feature "EditTasks", type: :feature do
  describe "A user with a room with a task" do
    let(:user) { create :user }
    let(:room) { create :room, user: user }
    let!(:task) { create :task, name: "Test Task", room: room}

    before do
      visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      visit "/rooms/#{room.id}"
      click_link "Edit Task"
    end

      describe "edits a task" do
        context "with valid name" do
          it "edits the task" do
            fill_in "Name", with: 'Edited Name'
            click_button "Update Task"
            expect(page).to have_content('Edited Name')
          end
        end

        context "without a name" do
          it "does not edit the task" do
            fill_in "Name", with: ''
            click_button "Update Task"
            expect(page).to have_content("Name can't be blank")
          end
        end
      end

      describe "deletes a task" do
        it "removes the task" do
          click_button "Delete Task"
          expect(page).not_to have_content('Test Task')
        end
      end  
  end
end