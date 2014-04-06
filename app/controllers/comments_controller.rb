class CommentsController < InheritedResources::Base
  load_and_authorize_resource

  before_action :authenticate_user!

  def create
    @comment = Answer.find(params[:answer_id]).comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html {
          redirect_to answer_path(@comment.answer), notice: 'コメントしました'
        }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    answer = @comment.answer
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to answer_path(answer) }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :content)
  end
end