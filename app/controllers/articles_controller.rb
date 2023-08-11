class ArticlesController < ApplicationController

before_action :authenticate_user!, except: %i[show index]

  def index
    @users = User.all
    #byebug
    @articles = Article.all  
    @projects = Project.includes(:user)
    @notes = Note.all
    @vacancies = Vacancy.includes(:user)
    @tags = Tag.all
  end


  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end


# USer.wherdse().we
#
#
# User
#   .where
#   .pluck +
#   .joins
#   .includes
#   .left_joins
#   .select
#   .find
#
#

Vacancy.all.each do |v|
  puts "#{v.short_name} - #{v.user.email}"
end
