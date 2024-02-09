# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @current_user = current_user
    logger.debug "ログインユーザー情報: #{@current_user.inspect}"
    @tweet = Tweet.new

    # おすすめツイート
    @recommended_tweets = Tweet.all.order(created_at: :desc).page(params[:page]).per(10)

    # フォローしてるユーザーのツイート一覧
    @following_tweets = Tweet.where(user_id: 14).page(params[:page]).per(10)
  end
end
