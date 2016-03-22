require 'rails_helper'

feature "editing question" do

  scenario "user edits question" do
    question = Question.create!(title: "Creating a Rails App And this Title has to be at least 140 characters long", description: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")

    visit question_path("#{question.id}")
    click_on "Edit Question"
    new_title = "Creating a Rails App and adding foundation to it"
    fill_in("Title", with: new_title)
    click_on "Update"

    expect(page).to have_content(new_title)
    expect(page).to_not have_content(question.title)
  end
end
