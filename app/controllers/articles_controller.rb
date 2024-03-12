class ArticlesController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show, :create, :destroy, :update]
  

  # Afficher tous les articles
  def index
    @articles = Article.includes(:author, :category).all
    render json: @articles, include: [:author, :category]
    
  end

  # Afficher un article spécifique
  def show
    @article = Article.find(params[:id])
    render json: @article, include: :author
  end

  def create
    puts "Params: #{params.inspect}" 
    author = Author.find_or_create_by(author: params[:author])
    category = Category.find_or_create_by(name: params[:category])
  
    @article = Article.new(article_params.merge(author: author, category: category))
    if @article.save
      render json: @article, include: [:author, :category], location: @article
    else
      render json: @article.errors
    end
  end

  # Mettre à jour un article
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors
    end
  end

  # Supprimer un article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    head :no_content
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :author, :category)
  end
end
