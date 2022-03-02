class CommentsController < ApplicationController
  def create
    @comment = Comment.new(spot_params)
    if @comment.save
      redirect_to spot_path(@comment.spot)
    else
      @spot = @comment.spot
      @comments = @spot.comments
      render "spots/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:spot_id])
    if @comment.destroy
      redirect_to action: :spots/show
    end
  end

  private
  def spot_params
    params.require(:comment).permit(:score, :text).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end
end
