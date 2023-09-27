class CustomerController < ApplicationController
  def index
    @vacancies = Vacancy.where(user_id: current_user.id)
    @projects = Project.where(user_id: current_user.id)
    @projects_approval = Project.approval
    @projects_сompleted = Project.complete.where("user_id = ?", current_user.id)
  end
end
