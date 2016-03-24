class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answers = @question.answers.order(best: :desc, created_at: :asc)
    @best_answer = @answers.where(best: true).first

    if @answer.save
      flash[:notice] = "Answer saved successfully."
      redirect_to question_path(@question)
    else
      flash.now[:error] = @answer.errors.full_messages.join(", ")
      render "questions/show"
    end
  end

  def update
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @all_answers = @question.answers
    @all_answers.update_all(best: false)
    @answer.update_attributes(best: true)


    redirect_to question_path(@answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
