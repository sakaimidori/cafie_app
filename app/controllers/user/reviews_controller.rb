class User::ReviewsController < ApplicationController

  def create
    cafe = Cafe.find(params[:cafe_id])
    content = Content.new(review_params)
    content.user_id = current_user.id
    content.cafe_id = cafe.id
    content.save
    flash[:notice] = "クチコミを投稿しました。"
    redirect_to cafe_path(cafe)
  end

  def destroy
    Content.find(params[:id]).destroy
    flash[:notice] = "クチコミを削除しました。"
    redirect_to cafe_path(cafe)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
