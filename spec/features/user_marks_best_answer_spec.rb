require 'rails_helper'

feature "best answer" do

  scenario "user marks answer as the best answer" do
    question = Question.create!(title: "Creating a Rails App And this Title has to be at least 140 characters long", description: "I have no idea what I'm doing.  Do you write the tests first? Is this thing long enough yet?  I really really really really hope so.  Guess we'll see.")

    answer1 = Answer.create!(description: "I am a little teapot. Short and stout. Here is my handle, here is my spout.  Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah.", question: question)

   answer2 = Answer.create!(description: "You have to run rails new yourappname in the command line.  Be wary of the scaffolding as it will create a lot of unnessary files that you do not need to use", question: question)

    visit question_path("#{question.id}")
    within('.answers li:nth-child(2)') do
      click_button "Best Answer!"
    end

    expect(page).to have_content(answer1.description)
    expect(page).to have_content(answer2.description)

    expect(answer2.description).to appear_before(answer1.description)

  end
end
