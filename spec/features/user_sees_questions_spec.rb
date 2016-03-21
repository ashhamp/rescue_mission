require 'rails_helper'

feature "sees questions" do

  scenario "see all the questions" do
    question = Question.create(title: "Creating a Rails App", description: "I have no idea what I'm doing.  Do you write the tests first?")
    another_question = Question.create(title: "Adding Rspec to Rails app", description: "Is this how you write tests for Rspec in rails?")

    visit questions_path
    expect(page).to have_content(question.title)
    expect(page).to have_content(another_question.title)
    expect(another_question.title < question.title)

  end
end
