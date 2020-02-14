class UsersController < ApplicationController

  def index
    @all_users = User.all
  end

  def show
    @id = params['id']
    @user = User.find(@id)
  end

  def new
    @user = User.new
  end

  # def create
  #   @user = User.new(city_id: params['city_id'],first_name: params['first_name'], description: params['description'], email: params['email'], age: params['age'], password: ['password_digest'])
    
  #   if  params['password_digest'] == params['password_confirmation']
  #     if @user.save
  #       @success = "Votre compte a bien été créé"
  #       puts @success
  #       redirect_to root_path(:success => @success)
  #     else
  #       puts @error = @user.errors.full_messages
  #     end
  #   else
  #     @error_mismatch = "Mismatch passwords"
  #     render 'new' 
  #   end
  # end


  def create
    # if city exist?
    if City.find_by(name:params['city']) != nil
      city = City.find_by(name:params['city'])
    else
      puts city
      city = City.create(name:params['city'])
    end
    # new user
    @user = User.new(email:params['email'], password:params['password_digest'], city: city, age:params['age'], first_name:params['first_name'], last_name: params['last_name'], description: params['description'])
    if params['password_digest'] == params['password_confirmation']
      if @user.save
        @success_login = "Bravo ! User inscrit !"
        log_in(@user)
        redirect_to root_path(:add_user => @success_login)
      else
        @user.errors.full_messages
        render 'new'
      end
    else
      @pwd_not_match = "Les passwords ne matchent pas !"
      render 'new'
    end
    # save or error
  end



end