class AnswersController < ApplicationController



  def create
    @question = Question.find(params[:question_id]) #change later maybe
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id


    if @answer.save
      flash[:notice] = "New Answer Added!"
      redirect_to '/questions' #fix this so it goes to our show page again
    else
      flash[:alert] = "Failed to save answer!"
      render action: 'new'
    end
  end

  def answer_params
    params.require(:answer).permit(:description, :question_id)
  end


end
