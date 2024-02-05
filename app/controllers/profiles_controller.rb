class ProfilesController < ApplicationController
  def index
    #byebug
    @vacancies = Vacancy.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    #byebug
    if !params['user'].nil?
      @user.role = params['user']['role'] 
      @user.save!
    end
  end
  def show
    @user = User.find(params[:id])
    @projects_count = Project.where(user_id: params[:id]).count
    @vacancy_count = Vacancy.where(user_id: params[:id]).count
    @articles_count = Article.where(user_id: params[:id]).count
  end

end
