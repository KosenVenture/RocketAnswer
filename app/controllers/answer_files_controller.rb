class AnswerFilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resources

  def create
    @answer_file = @answer.answer_files.build(answer_file_params)

    respond_to do |format|
      if @answer_file.save
        format.html {
          redirect_to answer_path(@answer),
            notice: '正常にアップロードされました。'
        }
        format.json {
          render json: {
              files: [@answer_file.to_jq_upload]
            },
            status: :created,
            location: @answer_file
          }
      else
        format.html {
          redirect_to answer_path(@answer),
            alert: 'アップロードに失敗しました。'
        }
      end
    end
  end

  def destroy
    @answer_file = @answer.answer_files.find(params[:id])

    respond_to do |format|
      if @answer_file.destroy
        format.html {
          redirect_to answer_path(@answer),
            notice: '削除されました。'
        }
        format.json { head :no_content }
      else
        format.html {
          redirect_to answer_path(@answer),
            alert: '削除に失敗しました。'
        }
        format.html { head :internal_server_error }
      end
    end
  end

private
  def answer_file_params
    params.require(:answer_file).permit(:image)
  end

  def set_resources
    @answer = Answer.find(params[:answer_id])
  end
end
