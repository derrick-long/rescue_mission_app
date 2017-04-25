class QuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at DESC").all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "New question added!"
      redirect_to @question
    else
      render action: 'new'
    end
  end

  def question_params
    params.require(:question).permit(:description, :title)
  end

end
