require 'rails_helper'

feature "question's answers" do

  scenario "user sees all answers for a question" do
    question = Question.create!(title: "Creating a Rails App And this Title has to be at least 140 characters long", description: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")

    original_answer = Answer.create!(description: "I am a little teapot. Short and stout. Here is my handle, here is my spout.  Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah.", question: question)

    answer = "You have to run rails new 'your app name' in the command line.  Be wary of the scaffolding as it will create a lot of unnessary files that you do not need to use"

    visit question_path("#{question.id}")
    fill_in("Description", with: answer)
    click_on "Submit Answer"

    expect(page).to have_text(answer)

    expect(page).to have_selector("ul#answers li:nth-child(2)", text: "You have to run rails new")
    expect(page).to have_selector("ul#answers li:nth-child(1)", text: "I am a little teapot.")
  end
end
