require 'rails_helper'

feature "answers questions" do

  scenario "user answers a question" do
    question = Question.create!(title: "Creating a Rails App And this Title has to be at least 140 characters long", description: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")

    answer = Answer.create!(description: "You have to run rails new <your-app-name> in the command line.  Be wary of the scaffolding as it will create a lot of unnessary files that you do not need to use")

    visit question_path("#{question.id}")

    click_on "Answer"
    fill_in("Description", with: answer)
    click_on("Answer")
  end
end
