class ArticlesController < ApplicationController
  before_action :find_article, only: [:update, :show, :delete, :vote_up, :vote_down, :comment]

  # Index action to render all articles
  def index
    @articles = Article.all
  end

  # New action for creating article
  def new
    @article = Article.new
  end

  # Create action saves the article into database
  def add
    @article = Article.new
    if @article.save(article_params)
      flash[:notice] = "Successfully created article!"
      redirect_to article_path(@article)
    else
      flash[:alert] = "Error creating new article!"
      render :new
    end
  end


  # Update action updates the article with the new information
  def update
    if @article.update_attributes(article_params)
      flash[:notice] = "Successfully updated article!"
      redirect_to article_path(@articles)
    else
      flash[:alert] = "Error updating article!"
    end
  end

  # The show action renders the individual article after retrieving the the id
  def show
  end

  # The destroy action removes the article permanently from the database
  def destroy
    if @article.destroy
      flash[:notice] = "Successfully deleted article!"
      redirect_to articles_path
    else
      flash[:alert] = "Error updating article!"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def find_article
    @article = Article.find(params[:id])
  end



    def vote_down
    end

    def vote_up
    end

    def comment
    end

end
