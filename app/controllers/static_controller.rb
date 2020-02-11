class StaticController < ApplicationController
  def index
    @all_gossips = Gossip.all
  end

  def team
    #dire d'aller dans la view
  end

  def contact

  end
end
