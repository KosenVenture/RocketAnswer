class AnswersController < ApplicationController
  before_action :set_subject
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer_files = @answer.answer_files
    @new_answer_file = AnswerFile.new(answer: @answer)
  end

  # GET /answers/new
  def new
    @answer = @subject.answers.build
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = @subject.answers.build(answer_params)

    respond_to do |format|
      if @answer.save
        format.html {
          redirect_to subject_answer_path(@subject, @answer),
          notice: 'アップロードしました。'
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
          redirect_to subject_answer_path(@subject, @answer),
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
    def set_subject
      @subject = Subject.find(params[:subject_id])
    end

    def set_answer
      @answer = @subject.answers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:subject_id, :user_id, :year, answer_files_attributes: [:id, :order])
    end
end
