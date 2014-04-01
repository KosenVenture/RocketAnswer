class AnswerFilesController < ApplicationController
  before_action :set_answer_file, only: [:show, :edit, :update, :destroy]

  # GET /answer_files
  # GET /answer_files.json
  def index
    @answer_files = AnswerFile.all
  end

  # GET /answer_files/1
  # GET /answer_files/1.json
  def show
  end

  # GET /answer_files/new
  def new
    @answer_file = AnswerFile.new
  end

  # GET /answer_files/1/edit
  def edit
  end

  # POST /answer_files
  # POST /answer_files.json
  def create
    @answer_file = AnswerFile.new(answer_file_params)

    respond_to do |format|
      if @answer_file.save
        format.html { redirect_to @answer_file, notice: 'Answer file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @answer_file }
      else
        format.html { render action: 'new' }
        format.json { render json: @answer_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answer_files/1
  # PATCH/PUT /answer_files/1.json
  def update
    respond_to do |format|
      if @answer_file.update(answer_file_params)
        format.html { redirect_to @answer_file, notice: 'Answer file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @answer_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_files/1
  # DELETE /answer_files/1.json
  def destroy
    @answer_file.destroy
    respond_to do |format|
      format.html { redirect_to answer_files_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_file
      @answer_file = AnswerFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_file_params
      params.require(:answer_file).permit(:answer_id, :user_id, :image)
    end
end
