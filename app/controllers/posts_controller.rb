class PostsController < ApplicationController
  def new
    @item = Post.new
    @item.sub_id = params[:sub_id]
  end

  def create
    item = Post.new(item_params)

    if item.save
      redirect_to sub_url(item.sub)
    else
      flash[:errors] = item.errors.full_messages
      redirect_to posts_url
    end
  end

  def show
    @item = Post.find_by_id(params[:id])
  end

  def edit
    @item = Post.find_by_id(params[:id])
  end

  def update
    item = Post.find_by_id(params[:id])
    if item.update(item_params)
      redirect_to sub_url(item.sub)
    else
      flash[:errors] = item.errors.full_messages
      redirect_to posts_url
    end
  end

  def destroy
    item = Post.find_by_id(params[:id])
    if item.destroy
      redirect_to sub_url(item.sub)
    else
      flash[:errors] = item.errors.full_messages
      redirect_to posts_url
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :url, :content, :sub_id, :user_id)
  end
end
