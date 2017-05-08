class QuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at DESC").all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order("created_at DESC").all
    @answer = Answer.new
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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Question updated!"
    else
      render 'edit'
    end
  end

  def destroy
  @question =  Question.find(params[:id])
  @question.destroy
    flash[:success] = "Question deleted!"
    redirect_to questions_url
  end


private
  #params error
  def question_params
    params.require(:question).permit(:description, :title)
  end

end
