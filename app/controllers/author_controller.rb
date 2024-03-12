class AuthorsController < ApplicationController
    # Afficher tous les auteurs
    def index
      @authors = Author.all
      render json: @authors
    end
  
    # Afficher un auteur spécifique
    def show
      @author = Author.find(params[:id])
      render json: @author
    end
  
    # Créer un nouvel auteur
    def create
      @author = Author.new(author_params)
      if author.save
        render json: author, status: :created
      else
        render json: author.errors, status: :unprocessable_entity
      end
    end
  
    # Mettre à jour un auteur existant
    def update
      @author = Author.find(params[:id])
      if author.update(author_params)
        render json: author
      else
        render json: author.errors, status: :unprocessable_entity
      end
    end
  
    # Supprimer un auteur
    def destroy
      author = Author.find(params[:id])
      author.destroy
      head :no_content
    end
  
    private
  
    def author_params
      params.require(:author).permit(:name)
    end
  end
  