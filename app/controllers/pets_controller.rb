class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @current_shelter = Shelter.find(params[:id])
  end

  def create
    new_pet = Pet.create(pet_params)
    redirect_to ("/shelters/#{pet_params[:shelter_id]}/pets")
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    updated_pet = Pet.find(params[:id])
    updated_pet.update(pet_params)
    redirect_to "/pets/#{updated_pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  private
  def pet_params
    params.permit(:id, :image, :name, :description,
                  :approx_age, :sex, :status, :shelter_id, :shelter_name)
  end
end
