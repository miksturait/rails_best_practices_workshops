class TendersController < ApplicationController
  before_action :authenticate_user!
  expose(:tender, attributes: :tender_params)
  expose(:tenders, ancestor: :current_user)
  expose(:all_tenders) { Tender.order(:id).page(params[:page]) }
  expose_decorated(:offers, ancestor: :tender)


  def show
    self.tender = all_tenders.find(params[:id])
  end
  # POST /tenders
  def create
    if tender.save
      redirect_to tender, notice: 'Tender was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tenders/1
  def update
    if tender.save
      redirect_to tender, notice: 'Tender was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tenders/1
  def destroy
    tender.destroy
    redirect_to tenders_url, notice: 'Tender was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def tender_params
    params.require(:tender).permit(:title, :description, :user_id)
  end
end
