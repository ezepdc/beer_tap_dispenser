class Dispenser < ApplicationRecord
  belongs_to :user
  has_many :spendings
  validates :flow_volume, presence: true

  def status(id)
    if Spending.where(dispenser: id).present?
      if Spending.where(dispenser: id).last.closed_at.nil?
        "open"
      end
    end
  end

end
