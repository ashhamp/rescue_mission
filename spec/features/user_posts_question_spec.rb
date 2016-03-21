require 'rails_helper'

feature "posting questions" do

  scenario "user submits a question with invalid fields" do
    visit "/questions/new"
    fill_in("question[title]", with: "How to test for order in Capybara")
    fill_in("question[description]", with: "Is this the proper way to test for a specific order in Capybara?  Or is the 'should' syntax an old version.")

    click_on("Create Question")

    expect(page).to have_content("Form is not correctly filled out.")
    expect(page).to_not have_content("Is this the proper way to test for a specific order in Capybara?  Or is the 'should' syntax an old version.")

  end

  scenario "user creates question successfully" do
    visit "/questions/new"
    fill_in("question[title]", with: "Creating a Rails App And this Title has to be at least 140 characters long")
    fill_in("question[description]", with: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")
    click_on("Create Question")

    expect(page).to have_content("Creating a Rails App And this Title has to be at least 140 characters long")
    expect(page).to have_content("I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")
    expect(page).to have_content("Question created!")
  end
end
