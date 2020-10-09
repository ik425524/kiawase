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
    # Topp.create{topp_params}
    # redirect_to root_path
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

  private
  def bottom_params
    params.require(:bottom).permit(:image, :size, :maker, :category).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
