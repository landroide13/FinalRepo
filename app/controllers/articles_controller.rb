class ArticlesController < ApplicationController 
  before_action :set_params, only:[:edit, :show, :destroy, :update]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only:[:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 2)
    #@articles = Article.all
  end

  def edit
  end  

  def new
    @article = Article.new
  end  

  def create
    @article = Article.new params_article
    @article.user = current_user
    if @article.save
      flash[:success] = "Article successfully created.."
      redirect_to article_path(@article)
    else
      render 'new'
    end  
  end 
  
  def show
  end  

  def update
    if @article.update(params_article)
      flash[:success] = "Article successfully Updated .."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article successsfully Deleted..."
    redirect_to articles_path
  end

  private

  def set_params
    @article = Article.find(params[:id])
  end

  def params_article
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user
      flash[:danger] = "You can only delete and edit your own article.."
      redirect_to root_path
    end  
  end


end
