class GossipsController < ApplicationController

  def index
    @all_gossips = Gossip.all
  end
  
  def show
    @id = params[:id]
    @gossip = Gossip.find(@id)

  end

  def new
    @gossip = Gossip.new
   # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    @gossip = Gossip.new(title: params['title'],content: params['content'],user: User.find_by(first_name: "Anonymous"))

    if @gossip.save
      @success = "Votre potin a bien été créé"
      puts @success
      redirect_to root_path(:success => @success)
    else
      @error = @gossip.errors.full_messages
      puts @error 
      render 'new' 
    end
  end 

  def edit
    @gossip = Gossip.find(params[:id]) #pour afficher la page edit, j'ai besoin du gossip a modifier @gossip, c'est lié au edit.html.erb
  end

  def update #apres avoir cliqué sur submit le formulaire va envoyer une requete post à la route update (gossips#update) qui va prendre en params les nouveaux champs a modifier, la methode va l'enregister dans la db 
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params['title'],content: params['content'],user: User.find_by(first_name: "Anonymous"))
      redirect_to @gossip
    else
      @error = @gossip.errors.full_messages
      render :edit
    end
  end
 

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy

    redirect_to @gossip
  end
end
