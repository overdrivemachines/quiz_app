class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[ show edit update destroy ]

  # GET /quizzes
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1
  def show; end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
    # create the first question
    @quiz.questions.build
  end

  # GET /quizzes/1/edit
  def edit; end

  # POST /quizzes
  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to @quiz, notice: "Quiz was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quizzes/1
  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: "Quiz was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /quizzes/1
  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: "Quiz was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def quiz_params
    params.require(:quiz).permit(
      :title,
      :image,
      question_attributes: [:id, :_destroy, :content, :answer1, :answer2, :answer3, :answer4, :correct_answer, :image]
    )
  end
end
