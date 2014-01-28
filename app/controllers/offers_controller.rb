class OffersController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,   only: :destroy

  def create
    @offer = current_user.offers.build(offer_params)
    if @offer.save
      flash[:success] = "Skill/Good added!"
      redirect_to user_path(@current_user)
    else
      render 'users/show'
    end
  end

  def destroy
    @offer.destroy
    redirect_to user_path(@current_user)
  end

  private

    def offer_params
      params.require(:offer).permit(:content)
    end

    def correct_user
      @offer = current_user.offers.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end