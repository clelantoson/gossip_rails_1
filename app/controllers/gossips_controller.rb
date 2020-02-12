class GossipsController < ApplicationController

  def index
    @all_gossips = Gossip.all
  end
  
  def show
    @id = params[:id]
    @gossip = Gossip.find(@id)
  end

  def new
    @gossip
   # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    # ou alors écrire gossip = params['gossip']
    # gossip['title']
    user_id = params['gossip']['user_id'].to_i
  
    @gossip = Gossip.new('user_id' => user_id,
    'title' => params['gossip']['title'],
    'content' => params['gossip']['content'])

    if @gossip.save
    redirect_to root_path
    else
      puts "error"
      puts @gossip.errors.full_messages
    render 'new' 
    end

  end 
  # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
end
