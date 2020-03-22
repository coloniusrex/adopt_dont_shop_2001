class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def show_pets
    @shelter = Shelter.find(params[:id])
    pets_at_shelter = Pet.where(shelter_id: params[:id])
    @sorted_pets = pets_at_shelter.sort{ |a, b| a.status <=> b.status}
  end

  def new
  end

  def create
    new_shelter = Shelter.create(shelter_params)
    redirect_to "/shelters"
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
     updated_shelter = Shelter.find(params[:id])
     updated_shelter.update(shelter_params)
     redirect_to "/shelters/#{updated_shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  private
  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
