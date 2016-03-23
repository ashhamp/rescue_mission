require 'rails_helper'

feature "answers questions" do

  scenario "user successfully answers a question" do
    question = Question.create!(title: "Creating a Rails App And this Title has to be at least 140 characters long", description: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")

    answer = "You have to run rails new 'your app name' in the command line.  Be wary of the scaffolding as it will create a lot of unnessary files that you do not need to use"

    visit question_path("#{question.id}")
    fill_in("Description", with: answer)
    click_on("Submit Answer")
    expect(page).to have_content(answer)
  end

  scenario "user submits answer with invalid form" do
    question = Question.create!(title: "Creating a Rails App And this Title has to be at least 140 characters long", description: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")

    answer = "This answer is not long enough."

    visit question_path("#{question.id}")
    fill_in("Description", with: answer)
    click_on("Submit Answer")
    expect(page).to have_content("Description is too short (minimum is 50 characters)")
  end
end
