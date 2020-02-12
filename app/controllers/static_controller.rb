class StaticController < ApplicationController
  
  def welcome_post
    user = User.create(first_name: params['first_name'], 
    last_name: params['last_name'], 
    email: params['email'], age: params['age'], 
    city: City.create(name: params['name']), 
    description: params['description'])

    first_name_url = "/welcome/#{user.first_name}"
    redirect_to first_name_url
  end

  def welcome
    @user_first_name = params['first_name']
  end 

  def team
    #dire d'aller dans la view
  end

  def contact

  end
end
