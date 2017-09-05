class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]

  # GET /universities
  # GET /universities.json
  def index
    @universities = University.answer_exists
    @answer_counts = Answer.joins(department: :school).where(schools: { type: 'University'}).group('school_id').reorder('').count
    @story_counts = ExpStory.joins(department: :school).where(schools: { type: 'University'}).group('school_id').reorder('').count
  end

  # GET /universities/1
  # GET /universities/1.json
  def show
    # FIXME: 表示上は10件だがanswers, exp_storiesを全部読んでいるので直したい（N+1よりはマシ）
    @departments = @university.departments.includes(:answers, :exp_stories)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university
      @university = University.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_params
      params.require(:university).permit(:type, :establishment, :name)
    end
end
