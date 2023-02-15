class Dispenser < ApplicationRecord
  belongs_to :user
  has_many :spendings
  validates :flow_volume, presence: true

  def calc
    (closed_at.to_i - opened_at.to_i) * flow_volume.to_i * price.to_i
  end
end
