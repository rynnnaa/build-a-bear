class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    redirect_to animal_path(@animal)
  end

  def create
    @animal = Animal.create(animal_params)
    redirect_to animal_path(@animal)
  end

  def show
    # @user = User.find(session[:user_id])
    @animal = Animal.find(params[:id])
    # @stuffed_animal = @animal.stuffed_animal.build(user_id: @user.id)
  end



  private 
  def animal_params
    params.require(:animal).permit(:kind, :size, :demeanor, :color,)
  end
end
