class CitiesController < ApplicationController

  def index
    @all_users = User.all

  end

    def show
      @id = params['id']
      @city = City.find(@id)
  end


  def new
    @city = City.new
  end

  def create

  end




end
