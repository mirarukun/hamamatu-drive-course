class SpotsController < ApplicationController
  def index
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :score, :text, :genre_id, :time_required_id,
      :situation_id, :direction_id, :image).merge(user_id: current_user.id)
  end
end
