class HomeController < ApplicationController
  def index
    @recent_answers = Answer.includes(:user, department: :school).limit(10)
    @recent_stories = ExpStory.includes(:user, department: :school).limit(10).order(created_at: :desc)
  end

  def aboutus
  end

  def campaign
  end
end
