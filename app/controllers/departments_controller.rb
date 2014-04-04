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
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render action: 'show', status: :created, location: @department }
      else
        format.html { render action: 'new' }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url }
      format.json { head :no_content }
    end
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
