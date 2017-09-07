class CommentsController < InheritedResources::Base
  authorize_resource

  before_action :authenticate_user!
  before_action :set_answer
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = @answer.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        @comment_user = @answer.comments.includes(:user).map(&:user).uniq 
        unless @comment_user.include?(@answer.user)
          @comment_user.push(@answer.user)
        end
        @comment_user.each do |u|
          if u != @comment.user
            CommentMailer.notification_mail(u, @answer).deliver_now
          end
        end
        format.html {
          redirect_to answer_path(@answer), notice: 'コメントしました'
        }
      else
        format.html { redirect_to answer_path(@answer) }
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
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to answer_path(@answer) }
    end
  end

  private

  def set_comment
    @comment = @answer.comments.find(params[:id])
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
