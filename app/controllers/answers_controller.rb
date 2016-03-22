class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
       redirect_to @questions
    else
      flash.now[:error] = @answer.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
