class NotesController < ApplicationController
  ActionController::Base.helpers.asset_path("notes.css")
  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
   @note = Note.new(note_params)
   @note.user = current_user
   #byebug
    if @note.save
      redirect_to notes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to @note
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def destroy
  end

  def index
    @notes = Note.all
  end

  private
    def note_params
      params.require(:note).permit(:title, :body)
    end
end
