class EntriesController < ApplicationController

  def index
    entries = Entry.all

    respond_to do |format|
      format.json { render json: entries}
    end
  end

  def create
    entry = Entry.create(params[:entry])
    respond_to do |format|
      format.json { render json: entry }
    end
  end

  def update
    entry = Entry.update(params[:id], params[:entry])
    respond_to do |format|
      format.json { render json: entry }
    end
  end
end
