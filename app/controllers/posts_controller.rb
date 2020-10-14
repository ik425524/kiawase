class PostsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def show
    redirect_to root_path, notice: "このurlは指定出来ません" unless current_user == User.find(params[:id])
    user = User.find(params[:id])
    @nickname = user.nickname
    @topp_images = current_user.topps
    @bottom_images = current_user.bottoms
  end

  private
  def move_to_index
    redirect_to root_path, notice: "ログインが必要です" unless user_signed_in?
  end
  
end
