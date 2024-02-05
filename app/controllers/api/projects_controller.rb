class ProjectsController < ActionController::API
  
  include ProjectsHelper

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])

    #@user = User.find(params[:id])
    if Response.where("project_id = ?", @project.id).present?
      @responses = Response.where("project_id = ?", @project.id)
    end
  end
  
  def new
    @project = Project.new
  end

  def create
    #return head 401 unless current_user.nil?
    byebug
    @project = Project.new(project_params)
    
    if request.format.symbol == :json 
      @project.user_id = user_id
    else 
      @project.user_id = current_user.id
    end 
    
    if @project.save
      respond_to do |format|
        
        format.html {redirect_to @project} # show.html.erb
        format.json {render json: @project.to_json(only: [:short_title, :title]), status: :created }
      end
    else
      respond_to do |format|
      format.html {render :new, status: :unprocessable_entity}
      format.json {render json: @project.errors, status: :unprocessable_entity}
    end
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
    @project.may_withdraw_from_publication?
    @project.withdraw_from_publication
    Response.where(project_id: params[:project_id]).destroy_all
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
  redirect_to executor_path
  end

  def select
    @project = Project.find(params[:project_id])
    @project.may_select?
    @project.response_id = params[:response_id]
    @project.select
    @project.save
    #byebug
    redirect_to customer_path
  end

  def complete
    @project = Project.find(params[:project_id])
    @project.may_complete?
    @project.complete
    @project.save
    #byebug
    redirect_to customer_path
  end

  def execute
    @project = Project.find(params[:project_id])
    @project.may_execute?
    @project.execute
    #@project.response_id =
    @project.save
    #byebug
    redirect_to executor_path
  end

  def submit_for_inspection
    @project = Project.find(params[:project_id])
    @project.may_submit_for_inspection?
    @project.submit_for_inspection
    @project.save
    #byebug
    redirect_to executor_path
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
