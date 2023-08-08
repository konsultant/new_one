class VacanciesController < ApplicationController

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def new
    @vacancy = Vacancy.new
    #@user = User.find(params[:id])
    @vacancy.user = current_user  
  end

  def create

    @vacancy = Vacancy.new(vacancy_params)
    @vacancy.user = current_user
    #byebug
    puts @vacancy.attributes

    if @vacancy.save
      redirect_to @vacancy
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @vacancies = Vacancy.all
  end

  def edit
     @vacancy = Vacancy.find(params[:id])
  end

  def destroy
  end

  def update
    @vacancy = Vacancy.find(params[:id])

    if @vacancy.update(vacancy_params)
      redirect_to @vacancy
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
    def vacancy_params
      params.require(:vacancy).permit(:short_name, :body, :user_id, :vacancy_id)
    end

end
