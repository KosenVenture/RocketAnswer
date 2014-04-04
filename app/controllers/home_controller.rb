class HomeController < ApplicationController
  def index
    @recent_answers = Answer.includes(:user, department: :school).limit(5)
  end
end
