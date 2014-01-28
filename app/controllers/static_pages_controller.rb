class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @offer = current_user.offers.build
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @pickofferform_items = current_user.pickofferform.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
