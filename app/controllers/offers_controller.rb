class OffersController < ApplicationController
  before_action :authenticate_user!
  expose(:tender)
  expose(:offers, ancestor: :tender)
  expose(:offer, attributes: :offer_params)


  # POST /tenders
  def create
    if offer.save
      redirect_to tender, notice: 'Offer was successfully created.'
    else
      redirect_to tender, notice: 'Nope...'
    end
  end

  # DELETE /tenders/1
  def destroy
    offer.destroy
    redirect_to tender, notice: 'Offer was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def offer_params
    params.require(:offer).permit(:message).merge(user_id: current_user.id)
  end
end
