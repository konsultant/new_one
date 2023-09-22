class ResponsesController < ApplicationController
  def index
  end

  def new
    @responce = Responce.new
  end

  def edit
  end

  def show
  end

  def create
    #byebug
    @project = Project.find(params[:response][:project_id])
    @response = Response.new(response_params)
    @response.user_id = current_user.id
    @project.get_respond!
    success = @response.save
    #byebug
    if success
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def response_params
    params.require(:response).permit(:text, :price, :project_id, :user_id)
  end
end
