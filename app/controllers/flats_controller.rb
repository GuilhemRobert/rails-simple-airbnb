class FlatsController < ApplicationController

  before_action :set_search, except: [:search]

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.create(flat_params)
    redirect_to flat_path(@flat)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  def search
    @search = search_params
    @flats = Flat.where("name LIKE '%#{@search}%'")
    puts @flats
    render :index
  end

  private

  def set_search
    @search = {query: ""}
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def search_params
    params.require(:query)
  end
end
