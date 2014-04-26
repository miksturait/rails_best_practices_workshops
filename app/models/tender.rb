class Tender < ActiveRecord::Base
  validates :user_id, :title, presence: true
  belongs_to :user, inverse_of: :tenders
  has_many :offers, inverse_of: :tender, dependent: :destroy
end
