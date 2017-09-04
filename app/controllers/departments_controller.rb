class DepartmentsController < ApplicationController
  before_action :set_university
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments
  # GET /departments.json
  def index
    @departments = @university.departments.all
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    answers = @department.answers
    @q = answers.search(params[:q])
    @answers = @q.result.includes(:user)
  end

  private
    def set_university
      @university = University.find(params[:university_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = @university.departments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:school_id, :name, :kind, :prefecture, :address)
    end
end
