class RankingController < ApplicationController
  before_action :set_variable, :check_params

  def index
    # ランキングの取得期間の最初を指定
    if @begin_date.present? then
      val = "WHERE created_at >= '#{@begin_date}'"
    end

    sql = "SELECT user_id AS user_answer, COUNT(user_id) AS user_answer_count
      FROM answers
      #{val}
      GROUP BY user_id
      HAVING COUNT(user_id) > 0
      ORDER BY COUNT(user_id) DESC"

    # 投稿のあるユーザのidと投稿数を取得
    @ranks = Answer.find_by_sql(sql)

    # ハッシュに変更
    @ranks.map!{|rank| rank.attributes}

    # 投稿数順にソート
    @ranks.sort! do |a, b|
      a[:user_answer_count] <=> b[:user_answer_count]
    end

    # 順位を追加
    i = @ranks.first["user_answer_count"]
    jyuni = 1
    @ranks.each do |rank|
      if rank["user_answer_count"] < i then
        i = rank["user_answer_count"]
        jyuni += 1
      end
      rank.store("rank", jyuni)
    end

    # ユーザのidをニックネームに置換
    @ranks.each do |rank|
      rank["user_answer"] = User.find(rank["user_answer"]).nickname
    end
  end

  private

  def set_variable
    @period_month = "month"
    @period_half_year = "half-year"
    @period_year = "year"
  end

  def check_params
    if params[:period].present?
      case params[:period]
      when @period_month then
        @period = @period_month
        begin_date_all = 1.months.ago
      when @period_half_year then
        @period = @period_half_year
        begin_date_all = 6.months.ago
      when @period_year then
        @period = @period_year
        begin_date_all = 1.years.ago
      else
        redirect_to ranking_path
      end
      if begin_date_all.present? then
        @begin_date = begin_date_all.strftime("%Y-%m-%d")
      end
    end
  end
end
