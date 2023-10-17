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
end
