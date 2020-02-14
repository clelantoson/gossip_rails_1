class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

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
    @comment = Comment.new(content: params['content'], user: params['current_user'],  gossip_id: params['gossip_id'])
    # @comment = @gossip.comments.new(comment:params['comment']['comment'],user:current_user)
    if @comment.save
      @success = "Votre commentaire a bien été créé"
     
      redirect_to gossips_path(:success => @success)
    else
      @error = @comment.errors.full_messages
       
       render 'gossip' 
    end
  end 

  def edit
    @comment = Comment.find(comment_id)
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

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
