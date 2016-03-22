require 'rails_helper'

feature "deleting question" do

  scenario "user deletes question successfully from details page" do
    question = Question.create!(title: "Creating a Rails App And this Title has to be at least 140 characters long", description: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")

    answer = Answer.create!(description: "I am a little teapot. Short and stout. Here is my handle, here is my spout.  Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah.", question: question)

    visit question_path("#{question.id}")
    click_on "Delete Question"

    expect(page).to have_content("Question successfully deleted!")
    expect(page).to_not have_content(question.title)
  end

  scenario "user deletes question successfully from edit page" do
    question = Question.create!(title: "Creating a Rails App And this Title has to be at least 140 characters long", description: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")

    answer = Answer.create!(description: "I am a little teapot. Short and stout. Here is my handle, here is my spout.  Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah.", question: question)

    visit edit_question_path("#{question.id}")
    click_on "Delete Question"

    expect(page).to have_content("Question successfully deleted!")
    expect(page).to_not have_content(question.title)

  end

  scenario "after user deletes question, all corresponding answers are also deleted" do
    question = Question.create!(title: "Creating a Rails App And this Title has to be at least 140 characters long", description: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")

    answer = Answer.create!(description: "I am a little teapot. Short and stout. Here is my handle, here is my spout.  Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah.", question: question)

    visit edit_question_path("#{question.id}")
    click_on "Delete Question"
    expect(page).to_not have_content(question.title)

  end
end
