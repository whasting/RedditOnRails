class UsersController < ApplicationController

  def new
  end

  def create
    item = User.new(item_params)
    if item.save
      login!(item)
      redirect_to user_url(item)
    else
      flash[:errors] = item.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @item = User.find_by_id(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:email, :password)
  end
end
