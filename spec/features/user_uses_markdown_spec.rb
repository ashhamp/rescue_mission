require 'rails_helper'

feature "uses markdown" do

  scenario "uses markdown to write question" do
    question = Question.create!(title: "##Creating a Rails App And this Title has to be at least **140** characters long", description: "**I have no idea what I'm doing**.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")

    normal_title = "Creating a Rails App And this Title has to be at least 140 characters long"

    normal_body = "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see."

    visit questions_path

    expect(page).to have_content(normal_title)
    expect(page).to_not have_content(question.title)
  end
end
