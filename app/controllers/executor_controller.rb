class ExecutorController < ApplicationController
  def index
    @vacancies = Vacancy.where(user_id: current_user.id)
    @projects = Project.all.joins(:responses).where("responses.user_id = ?", current_user.id).uniq
    @confirmed_projects = Project.executors_statuses.joins(:confirmed_response).where("responses.user_id = ?", current_user.id)
    @projects_сompleted = Project.complete.joins(:confirmed_response).where("responses.user_id = ?", current_user.id)
  end
end
