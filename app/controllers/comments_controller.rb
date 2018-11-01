class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    unless @current_user
      redirect_to(not_connected_path)
    end
  end

  def create
    comment = Comment.create(comment_params)
    redirect_to(gossip_path(params[:gossip_id]))
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to(gossip_path(@comment.gossip_id))
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to(gossip_path(comment.gossip_id))
  end

  private

  def comment_params
    result = params.require(:comment).permit(:content)
    result[:gossip_id] = params[:gossip_id]
    result[:user_id] = @current_user.id
    return result
  end
end
