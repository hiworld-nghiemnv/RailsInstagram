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
      @tag_name = params[:name]
      if @tag_name.present?
        @tag_recent_medias = client.tag_recent_media(@tag_name)
        @user_tags = Hash.new
        #get user
        @tag_recent_medias.each do |tag_recent_media|
          uname = tag_recent_media[:user][:username]
          if !@user_tags.has_key?(uname)
            @user_tags[uname] = 0
          end

        end
        #count comment
        comments = Array.new
        @tag_recent_medias.each do |tag_recent_media|
          media_comments = client.media_comments(tag_recent_media.id)
          media_comments.each do |media_comment|
            if media_comment[:text].include?'#'+@tag_name
              @user_tags[media_comment[:from][:username]]+=1
              comments.push([media_comment[:from][:username],media_comment[:text],media_comment[:created_time]]);
            end
          end
        end
        @user_tags.values.sort.reverse
        comments = comments.sort{|a,b| b[2] <=> a[2]}
        @comments = comments.paginate(:page => params[:page], :per_page => 5)
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
