class CommentsController < ApplicationController
  # TODO: validate that user is logged-in (not a visitor) before letting them enter a comment...

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [Topic.find(params[:topic_id]), @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [Topic.find(params[:topic_id]), @post]
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to [@topic, @path]
    else
      flash[:error] = "Uh oh, something went wrong - the comment was not deleted. Please try again."
      redirect_to [@topic, @path]
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
