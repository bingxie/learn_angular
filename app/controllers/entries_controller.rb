class EntriesController < ApplicationController

  def index
    entries = Entry.all

    respond_to do |format|
      format.json { render json: entries}
    end
  end

  def create
    entry = Entry.create(name: params[:name])
    respond_to do |format|
      format.json { render json: entry }
    end
  end

  def update
    entry = Entry.update(params[:id], params.permit(:id, :name, :winner))
    respond_to do |format|
      format.json { render json: entry }
    end
  end
end
