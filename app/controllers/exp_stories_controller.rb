class ExpStoriesController < ApplicationController
  before_action :authenticate_user!
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
  end

  def destroy
  end

  private

  def set_universities
      @universities = University.all
    end

  def exp_story_params
    params.require(:exp_story).permit(:year,
                                      :wish_university,
                                      :department,
                                      :way,
                                      :is_passed,
                                      :self_intro,
                                      :motivation,
                                      :exam,
                                      :interview,
                                      :advice)
  end
end

