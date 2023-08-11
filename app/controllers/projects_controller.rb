class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end
  def new
    @project = Project.new
  end

  def create
    #return head 401 unless current_user.nil?

    @project = Project.new(project_params)
    @project.user_id = current_user.id
    #byebug
    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
    redirect_to customer_path unless @project.project_status == "draft"
  end

  def destroy
  end
  def publish
    @project = Project.find(params[:project_id])
    @project.may_publish?
    @project.publish
    @project.save
    #byebug
    redirect_to customer_path
  end
  def withdraw_from_publication

    @project = Project.find(params[:project_id])
    @project.may_publish?
    @project.withdraw_from_publication
    @project.save
    #byebug
    redirect_to customer_path
  end

  def get_respond
  @project = Project.find(params[:project_id])
  @project.may_get_respond?
  @project.get_respond
  @project.save
  #byebug
  redirect_to customer_path
  end

  def  select
    @project = Project.find(params[:project_id])
    @project.may_get_select?
    @project.select
    @project.save
    #byebug
    redirect_to customer_path
  end
  def execute
    @project = Project.find(params[:project_id])
    @project.may_execute?
    @project.execute
    @project.save
    #byebug
    redirect_to customer_path
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
    def project_params
      params.require(:project).permit(:short_title, :title, :projects_budget, :implementation_period, :projects_budget, :currency_budget, :tags_tecnologies, :author, :user_id)
    end

end
