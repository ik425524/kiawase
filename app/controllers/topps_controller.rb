class ToppsController < ApplicationController
  def new
    @topp = Topp.new
  end

  def create
    Topp.create{topp_params}
    redirect_to root_path
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
