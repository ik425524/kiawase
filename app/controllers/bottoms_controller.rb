class BottomsController < ApplicationController
  before_action :move_to_index

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
    @bottom = Bottom.find(params[:id])
  end

  def edit
    @bottom = Bottom.find(params[:id])
  end

  def update
    bottom = Bottom.find(params[:id])
    bottom.update(bottom_params)
    redirect_to post_path(current_user),notice: "編集しました"
  end

  def search
    @bottom_images = Bottom.search(params[:keyword])
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
end
