class Booking < ApplicationRecord
  belongs_to :jew, optional: true
  belongs_to :goy

  validates :start_date, presence: true
  validates :end_date, presence: true
end
