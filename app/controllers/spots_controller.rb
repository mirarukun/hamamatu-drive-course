class SpotsController < ApplicationController
  def index
    @spots = Spot.includes(:user)
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :score, :text, :genre_id, :time_required_id,
                                 :situation_id, :direction_id, :image).merge(user_id: current_user.id)
  end
end
