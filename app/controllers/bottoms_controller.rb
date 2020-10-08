class BottomsController < ApplicationController
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
  end

  def show
  end

  private
  def bottom_params
    params.require(:bottom).permit(:image, :size, :maker, :category_id).merge(user_id: current_user.id)
  end
end
