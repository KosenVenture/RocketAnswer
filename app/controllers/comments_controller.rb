class CommentsController < InheritedResources::Base
  authorize_resource

  before_action :authenticate_user!
  before_action :set_comment, only: [:update]

  def create
    @comment = Answer.find(params[:answer_id]).comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html {
          redirect_to answer_path(@comment.answer), notice: 'コメントしました'
        }
      else
        format.html { redirect_to answer_path(@comment.answer) }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.json {
          render json: @comment.attributes.tap{ |a|
            a['content'] = self.class.helpers.markdown(a['content'])
          }
        }
      else
        format.json {
          head :no_content
        }
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
    params.require(:comment).permit(:answer_id, :user_id, :content)
  end
end
