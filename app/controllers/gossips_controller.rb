class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def create
    gossip = Gossip.create(post_params)
    redirect_to(gossip_path(gossip.id))
  end

  def show
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

  private

  def post_params
    params.require(:gossip).permit(:content)
  end
end
