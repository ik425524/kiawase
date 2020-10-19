class BottomsController < ApplicationController
  before_action :move_to_index
  before_action :set_bottoms, only: [:show, :edit]

  def new
    @bottom = Bottom.new
  end

  def create
    @bottom = Bottom.new(bottom_params)
    if @bottom.save
      redirect_to post_path(current_user),notice: "登録が完了しました"    
    else
      redirect_to new_bottom_path,notice: "登録に失敗しました"
    end
  end

  def destroy
    bottom = Bottom.find(params[:id])
    bottom.destroy
    redirect_to post_path(current_user),notice: "削除しました"
  end

  def show
  end

  def edit
    redirect_to root_path,notice:"このurlは指定出来ません" unless current_user.id == @bottom.user_id
  end

  def update
    bottom = Bottom.find(params[:id])
    bottom.update(bottom_params)
    redirect_to post_path(current_user),notice: "編集しました"
  end

  def search
    @bottom_images = Bottom.where(user_id: current_user.id).search(params[:keyword])
    @topp_images = current_user.topps
    user = User.find(params[:id])
    @nickname = user.nickname
  end

  private
  def bottom_params
    params.require(:bottom).permit(:image, :size, :maker, :category).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_bottoms
    @bottom = Bottom.find(params[:id])
  end
end
