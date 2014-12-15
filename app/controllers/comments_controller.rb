class CommentsController < ApplicationController
  # TODO: validate that user is logged-in (not a visitor) before letting them enter a comment...

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [Topic.find(params[:topic_id]), @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [Topic.find(params[:topic_id]), @post]
    end

  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
