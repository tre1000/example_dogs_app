class Api::DogsController < ApplicationController
  def create
    if current_user
      @dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed],
        user_id: current_user.id,
      )
      if @dog.save
        render "show.json.jb"
      else
        render json: { error: @dog.errors.full_messages }
      end
    else
      render json: { error: "You must be logged in to do that." }
    end
  end

  def index
    if current_user
      @dogs = Dog.all
      render "index.json.jb"
    else
      render json: { error: "You must be logged in to do that" }
    end
  end
end
