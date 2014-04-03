class SubjectsController < ApplicationController
  before_action :set_subject, only: [:edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.includes(:department).all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.includes(answers: :user).find(params[:id])
    @answers = @subject.answers
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html {
          dep = @subject.department
          redirect_to university_department_path(dep.school.id, dep),
            notice: '作成しました。'
        }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html {
          redirect_to subject_path(@subject),
            notice: '更新しました。'
          }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    dep = @subject.department
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to university_department_path(dep.school.id, dep) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:department_id, :name)
    end
end
