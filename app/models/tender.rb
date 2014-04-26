class Tender < ActiveRecord::Base
  validates :user_id, :title, presence: true
  belongs_to :user, inverse_of: :tenders
end
