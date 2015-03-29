class AnswerStocksController < ApplicationController
  before_action :authenticate_user!

  def index
    @answers = current_user.stocked_answers
  end
end
