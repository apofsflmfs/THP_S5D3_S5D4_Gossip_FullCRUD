class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    puts "ceci est le hash des params #{comment_params}"
    comment = Comment.create(comment_params)
    puts "ceci est le commentaire #{comment}"
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
    result = params.require(:comment).permit(:anonymous_commentor, :content)
    result[:gossip_id] = params[:gossip_id]
    return result
  end
end
