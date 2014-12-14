class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [Topic.find(params[:topic_id]), @post]
    end

  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
