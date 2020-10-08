class ToppsController < ApplicationController
  def new
    @topp = Topp.new
  end

  def create
    @topp = Topp.new(topp_params)
    if @topp.save
      redirect_to post_path(current_user),notice: "登録が完了しました"    
    else
      redirect_to new_topp_path,notice: "登録に失敗しました"
    # Topp.create{topp_params}
    # redirect_to root_path
    end
  end

  def destroy
  end

  def show
  end

  private
  def topp_params
    params.require(:topp).permit(:image, :size, :maker, :category_id).merge(user_id: current_user.id)
  end
end
