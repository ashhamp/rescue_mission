class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
       redirect_to @question
      flash[:notice] = "Question created!"
    else
      flash[:error] = @question.errors.full_messages.join(", ")
      redirect_to new_question_path
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)

    if @question.save
      redirect_to @question
    else
      flash[:error] = @question.errors.full_messages.join(", ")
      redirect_to edit_question_path(@question)
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    flash[:notice] = "Question successfully deleted!"
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
