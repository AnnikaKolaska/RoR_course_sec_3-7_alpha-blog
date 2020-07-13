class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # usefull: render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was created sucessfully"
      redirect_to article_path(@article) #automatically extracts the id form the article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated sucessfully"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
    flash[:notice] = "Article was deleted sucessfully"
    redirect_to articles_path
  end

  private

    # returns whitelisted parameters for an article
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
