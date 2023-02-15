class Spending < ApplicationRecord
  belongs_to :dispenser

  def total_time
    closed_at.to_i - opened_at.to_i
  end
end
