class RankingController < ApplicationController
  def index
    query = Answer
      .group(:user)
      .having('count_all > 0')
      .reorder('count_all DESC')
      .limit(20)

     if params[:begin_date]
      @begin_date = Date.parse(params[:begin_date])
      query = query.where('created_at >= ?', @begin_date)
    end

    # { User => カウント数 } というHashに変換
    @ranks = query.count
  end
end
