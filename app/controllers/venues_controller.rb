class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @venue = Venue.find(params[:id])
  end

  private
  def strong_params
    params.require(:venue).permit(:name, :address, :photos)
  end
end
