class Dispenser < ApplicationRecord
  belongs_to :user
  has_many :spendings
  validates :flow_volume, presence: true
end
