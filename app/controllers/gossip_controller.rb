class GossipController < ApplicationController
  
  def display
    @id = params['id']
    @gossip = Gossip.find(@id)
  end
end
