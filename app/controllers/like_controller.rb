class LikeController < ApplicationController
  def create
    Like.create(user_id: @current_user.id, content_type: "Gossip", content_id: params[:gossip_id] )
    redirect_to(request.referer)
  end

  def destroy
    
    like = Like.where(user_id: @current_user.id, content_type: "Gossip",content_id: params[:gossip_id]).first
    like.destroy
    redirect_to(request.referer)
  end
end
