class Offer < ActiveRecord::Base
  belongs_to :user, inverse_of: :offers
  belongs_to :tender, inverse_of: :offers

  validates :message, presence: true

  validate :ensure_offerer_is_not_tender_owner

  private

  def ensure_offerer_is_not_tender_owner
    errors.add(:base, "You cannot make offers for your own tender") if user_id == tender.user_id
  end
end
