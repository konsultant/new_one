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
    @project = Project.find(params[:project_id])
    @responce = Response.new()
    @project.get_respond
      if @responce.save
      redirect_to @responce
    else
      render :new, status: :unprocessable_entity
    end
  end
end
