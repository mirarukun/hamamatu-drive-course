class UsersController < ApplicationController
  def show
    @user= User.find(params[:id])
    @spot_num = @user.spots.count
  end
end
