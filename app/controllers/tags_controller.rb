class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @tags = Tag.all
  end

  def show
  end
end
