class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @all_answers = @question.answers
    @best_answer = @all_answers.where(best: true)

    if @best_answer
      @answers = @all_answers - @best_answer
    else
      @answers = @all_answers
    end

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
    @answer.update_attributes(best: true)
    redirect_to question_path(@answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
