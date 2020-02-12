class CommentsController < ApplicationController
  def index
    @all_comments = Comment.all
  end
  
  def show
    @id = params[:id]
    @comment = Comment.find(@id)
  end

  def new
    @comment = Comment.new
   # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    @comment = Comment.new(content: params['content'], user: User.find_by(first_name: "Anonymous" ),  gossip_id: params['gossip_id'])

    if @comment.save
      @success = "Votre commentaire a bien été créé"
      puts @success
      redirect_to gossips_path(:success => @success)
    else
      @error = @comment.errors.full_messages
      puts @error 
       render 'gossip' 
    end
  end 

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params['content'], user: User.find_by(first_name: "Anonymous", gossip_id: params['gossip_id']))
      redirect_to @comment
    else
      @error = @comment.errors.full_messages
      render :edit
    end
  end
 

  def destroy
    @comment = Gossip.find(params[:id])
    @comment.destroy

    redirect_to @comment
  end
end
