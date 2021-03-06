class SessionsController < ApplicationController

  def new
   
  end

  def create
    user = User.find_by(email: params['email'])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params['password'])
      # session[:user_id] = user.id #remplacé par log_in en dessous
      session[:user_id] = user.id
      log_in(user)
      remember(user)
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    user = current_user
    log_out(user)
    redirect_to root_path
  end

  def current_user
    if session[:user_id]
      # même chose que hier
      current_user = User.find_by(id: session[:user_id])
  
    # nous allons vérifier s'il y a bien un cookie contenant l'id de notre utilisateur
    elsif cookies[:user_id]
  
      # nous allons trouver l'utilisateur en DB à partir du cookie qui stocke le user_id
      user = User.find_by(id: cookies[:user_id])
  
      if user
  
        # nous allons prendre le remember_token stocké en cookie, le hasher, puis le comparer avec notre remember_digest stocké en base
        remember_token = cookies[:remember_token]
        remember_digest = user.remember_digest
        user_authenticated = BCrypt::Password.new(remember_digest).is_password?(remember_token)
  
        # si tout est bon, il ne nous reste plus qu'à souhaiter bienvenue à l'utilisateur !
        if user_authenticated
          log_in user
          current_user = user
        end
  
      end
    end
  end













end
