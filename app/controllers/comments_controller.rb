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
        @comment_email = @answer.comments.includes(:user).map{|c| c.user.email}.uniq
        @comment_user  = @answer.comments.includes(:user).map(&:user).name.uniq
        @comment_list  = @comment_email.zip(@comment_user)
  
        if !@comment_user.include?(@answer.user.name)
          @comment_list.push[@answer.user.email ,@answer.user.name]
        end

        @comment_list.each do |c_e c_u|
          if c_u != @comment.user
            CommentMailer.send_notification_comment(c_e, c_u, @answer).deliver
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
