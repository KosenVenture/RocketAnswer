class ExpStoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exp_story, only: [:show, :edit, :update, :destroy]
  before_action :set_universities, only: [:new, :edit, :create, :update]

  def show
  end

  def new
    @exp_story = ExpStory.new(user: current_user)
  end

  def create
    @exp_story = ExpStory.new(exp_story_params)
    @exp_story.user = current_user

    respond_to do |format|
      if @exp_story.save
        format.html {
          redirect_to exp_story_path(@exp_story),
          notice: '作成しました。'
        }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @exp_story.update(exp_story_params)
        format.html {
          redirect_to exp_story_path(@exp_story),
            notice: '更新しました。'
        }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    dep = @exp_story.department
    @exp_story.destroy

    respond_to do |format|
      format.html { redirect_to university_department_path(dep.school.id, dep) }
    end
  end

  private
  def set_exp_story
      @exp_story = ExpStory.find(params[:id])
    end

  def set_universities
    @universities = University.all
  end

  def exp_story_params
    params.require(:exp_story).permit(:year,
                                      :university_id,
                                      :department_id,
                                      :way,
                                      :is_passed,
                                      :self_intro,
                                      :motivation,
                                      :exam,
                                      :interview,
                                      :advice,
                                      :grad_school,
                                      :grad_department)
  end
end
