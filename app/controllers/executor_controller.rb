class ExecutorController < ApplicationController
  def index
    @vacancies = Vacancy.where(user_id: current_user.id)
    @projects = Project.where(user_id: current_user.id)
  end
end
