class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    # usefull: render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was created sucessfully"
      redirect_to article_path(@article) #automatically extracts the id form the article
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated sucessfully"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy # IMPORTANT use destroy not delete
    flash[:notice] = "Article was deleted sucessfully"
    redirect_to articles_path
  end

  private

    # Finds the article by id
    def set_article
      @article = Article.find(params[:id])
    end

    # Returns whitelisted parameters for an article
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def require_same_user
      if current_user != @article.user
        flash[:alert] = "You can only edit or delete you own article!"
        redirect_to @article
      end
    end
end
