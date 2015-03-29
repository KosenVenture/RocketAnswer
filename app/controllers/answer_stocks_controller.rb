class AnswerStocksController < ApplicationController
  def index
    @answers = current_user.stocked_answers
  end
end
