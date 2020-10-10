class ToppsController < ApplicationController
  before_action :move_to_index

  def new
    @topp = Topp.new
  end

  def create
    @topp = Topp.new(topp_params)
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
    @topp = Topp.find(params[:id])
  end

  def edit
    @topp = Topp.find(params[:id])
  end

  def update
    topp = Topp.find(params[:id])
    topp.update(topp_params)
    redirect_to post_path(current_user),notice: "編集しました"
  end

  def search
    @topp_images = Topp.search(params[:keyword])
    @bottom_images = current_user.bottoms
    user = User.find(params[:id])
    @nickname = user.nickname
  end

  private
  def topp_params
    params.require(:topp).permit(:image, :size, :maker, :category).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
