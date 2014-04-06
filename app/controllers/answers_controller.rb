class AnswersController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_department, only: [:new, :create]

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer_files = @answer.answer_files
    @new_answer_file = AnswerFile.new(answer: @answer)
    @comment = Comment.new(user: current_user)
  end

  # GET /answers/new
  def new
    @answer = @department.answers.new(user: current_user)
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = @department.answers.new(answer_params)
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html {
          redirect_to answer_path(@answer),
          notice: '作成しました。'
        }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html {
          redirect_to answer_path(@answer),
            notice: '更新しました。'
        }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
    end
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_department
      @department = Department.find(params[:department_id] || params[:answer].try(:fetch, :department_id))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:department_id, :subject, :year, answer_files_attributes: [:id, :order])
    end
end
