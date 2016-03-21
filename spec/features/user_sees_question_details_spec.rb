require 'rails_helper'

feature "sees question details" do

  scenario "sees question detail page" do
    question = Question.create!(title: "Creating a Rails App And this Title has to be at least 140 characters long", description: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")
    another_question = Question.create!(title: "Adding Rspec to Rails app. Is this one long enough? I hope so. I hope so. Will this do it?", description: "Is this how you write tests for Rspec in rails? Is this at least 140 characters long?  I don't know.  I don't know.  Is it yet? Is it yet? Is this long enough yet? Is this long enough yet? Is this long enough yet?")

    visit questions_path
    click_on question.title
    expect(page).to have_content(question.title)
    expect(page).to_not have_content(another_question.title)
    expect(page).to have_content(question.description)

  end
end
