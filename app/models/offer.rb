class Offer < ActiveRecord::Base
  belongs_to :user, inverse_of: :offers
  belongs_to :tender, inverse_of: :offers

  validates :message, presence: true
end
