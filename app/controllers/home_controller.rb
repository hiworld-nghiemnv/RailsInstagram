require "instagram"
class HomeController < ApplicationController
  def index
    if !session[:access_token]
      redirect_to home_login_path
    else
      client = Instagram.client(:access_token => session[:access_token])
      @user = client.user
      @recent_media_items = client.user_recent_media
      @tags = Array.new
      if params[:name].present?
        @tags = client.tag_search(params[:name])
      end
    end
  end

  def login
  end

  def hashtag
    if !session[:access_token]
      redirect_to home_login_path
    else
      client = Instagram.client(:access_token => session[:access_token])
      @user = client.user
      @tag_recent_medias = Array.new
      if params[:name].present?
        @tag_recent_medias = client.tag_recent_media(params[:name])
      end
    end
  end

  def regis_hashtag
  end

  def logout
    session.delete(:access_token)
    redirect_to home_login_path
  end

end
