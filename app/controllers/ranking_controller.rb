class RankingController < ApplicationController
  def index
    # 投稿のあるユーザのidと投稿数を取得
    @ranks = User.find_by_sql(['SELECT user_id AS user_answer, COUNT(user_id) AS user_answer_count
      FROM answers
      GROUP BY user_id
      HAVING COUNT(user_id) > 0
      ORDER BY COUNT(user_id) DESC
      '])

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
end
