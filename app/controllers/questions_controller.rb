class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find( params[:id] )
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new( question_params )
    if @question.save
      redirect_to @question
    end
  end

  def destroy
    @question = Question.find( params[:id] )
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

end