class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.create(destination_params)
    if @destination.valid?
      redirect_to @destination
    else
      flash[:errors] = @destination.errors.full_messages
      redirect_to new_destination_path
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      redirect_to @destination
    else
      flash[:errors] = @destination.errors.full_messages
      redirect_to edit_destination_path
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    redirect_to destinations_path
  end

  private
  def destination_params
    params.require(:destination).permit(:name, :country)
  end
end
