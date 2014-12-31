class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite

    if favorite.save
      flash[:notice] = "You've successfully favorited this post"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Oops - that didn't work. Try again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = Favorite.find(params[:id])
    authorize favorite

    if favorite.destroy
      flash[:notice] = "You've successfully unfavoited this post"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Oops - something went wrong. Try again."
      redirect_to [@post.topic, @post]
    end
  end
end
