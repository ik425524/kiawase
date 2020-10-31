class PostsController < ApplicationController
  before_action :move_to_index, except: [:index,:new_guest]
  before_action :check_user, except: [:index,:new_guest]
  before_action :set_show, only: [:show,:list_show]

  def index
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end

  def show
  end

  def list_show
  end

  private
  def move_to_index
    redirect_to root_path, notice: "ログインが必要です" unless user_signed_in?
  end

  def check_user
    redirect_to root_path, notice: "このurlは指定出来ません" unless current_user == User.find(params[:id])
  end

  def set_show
    user = User.find(params[:id])
    @nickname = user.nickname
    @topp_images = user.topps
    @bottom_images = user.bottoms
  end
end
