class OffersController < ApplicationController
  before_action :signed_in_user

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
  end

  private

    def offer_params
      params.require(:offer).permit(:content)
    end
end