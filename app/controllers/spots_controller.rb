class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit, :destroy]
  before_action :assign_to_spot_instance, only: [ :show, :edit, :update, :destroy]
  before_action :move_to_root, only: [ :edit, :destroy]

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
    @spots = Spot.includes(:user)
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      redirect_to spot_path
    else
      render :edit
    end
  end

  def destroy
    if @spot.destroy
      redirect_to action: :index
    end
  end

  def search
    @q = Spot.ransack(params[:q])
    @spots = @q.result
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :score, :text, :genre_id, :time_required_id,
                                 :situation_id, :direction_id, :image).merge(user_id: current_user.id)
  end

  def assign_to_spot_instance
    @spot = Spot.find(params[:id])
  end

  def move_to_root
    if @spot.user_id != current_user.id
      redirect_to root_path
    end
  end
end