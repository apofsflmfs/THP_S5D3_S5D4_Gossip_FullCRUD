class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    unless @current_user
      redirect_to(not_connected_path)
    end
  end

  def create
    result = comment_params
    if params[:gossip_id]
      
      result[:commentable_type] = "Gossip"
      result[:commentable_id] = params[:gossip_id]
      comment = Comment.create(result)
      redirect_to(gossip_path(params[:gossip_id]))
    else
      result[:commentable_type] = "Comment"
      result[:commentable_id] = params[:comment_id]
      comment = Comment.create(result)
      redirect_to(gossip_path(Comment.find(params[:comment_id]).commentable_id))
    end
  end

  def edit
    unless @current_user
      redirect_to(not_connected_path)
    end
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
    unless @current_user
      redirect_to(not_connected_path)
    end
    result = params.require(:comment).permit(:content)
    result[:user_id] = @current_user.id
    return result
  end
end
