class ToppsController < ApplicationController
  before_action :move_to_index
  before_action :set_topps, only: [:show, :edit]

  def new
    @topp = Topp.new
  end

  def create
    @topp = Topp.new(topp_params)
    logger.debug @topp.errors.inspect
    if @topp.save
      redirect_to post_path(current_user),notice: "登録が完了しました"    
    else
      redirect_to new_topp_path,notice: "登録に失敗しました"
    end
  end

  def destroy
    topp = Topp.find(params[:id])
    topp.destroy
    redirect_to post_path(current_user),notice: "削除しました"
  end

  def show
  end

  def edit
    redirect_to root_path,notice:"このurlは指定出来ません" unless current_user.id == @topp.user_id
  end

  def update
    topp = Topp.find(params[:id])
    topp.update(topp_params)
    redirect_to post_path(current_user),notice: "編集しました"
  end

  def search
    @topp_images = Topp.where(user_id: current_user.id).search(params[:keyword])
    @bottom_images = current_user.bottoms
    user = User.find(params[:id])
    @nickname = user.nickname
  end

  private
  def topp_params
    params.require(:topp).permit(:image, :size, :maker, :category).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path, notice: "ログインが必要です"unless user_signed_in?
  end

  def set_topps
    @topp = Topp.find(params[:id])
  end
  
end
