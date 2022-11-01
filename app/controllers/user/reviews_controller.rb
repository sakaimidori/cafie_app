class User::ReviewsController < ApplicationController


  def create
    cafe = Cafe.find(params[:cafe_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.cafe_id = cafe.id
    if @review.save
      flash[:notice] = "クチコミを投稿しました。"
      redirect_to cafe_show_path(cafe)
    else
      @cafe = Cafe.find(params[:cafe_id])
      render "user/cafes/show"
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    flash[:notice] = "クチコミを削除しました。"
    redirect_to request.referer
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
