class ProfilesController < ApplicationController
  def index
    #byebug
    @vacancies = Vacancy.where(user_id: current_user.id)
  end
end
