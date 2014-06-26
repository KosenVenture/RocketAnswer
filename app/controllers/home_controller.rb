class HomeController < ApplicationController
  def index
    @recent_answers = Answer.includes(:user, department: :school).limit(10)
  end

  def aboutus
  end
end
