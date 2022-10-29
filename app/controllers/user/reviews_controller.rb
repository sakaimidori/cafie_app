class User::ReviewsController < ApplicationController

  def create
    cafe = Cafe.find(params[:cafe_id])
    review = Review.new(review_params)
    #ログインしてない場合、クチコミ投稿ボタンを出さない
    review.user_id = current_user.id
    review.cafe_id = cafe.id
    review.save
    flash[:notice] = "クチコミを投稿しました。"
    redirect_to cafe_show_path(cafe)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    flash[:notice] = "クチコミを削除しました。"
    redirect_to cafe_show_path(params[:cafe_id])
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
