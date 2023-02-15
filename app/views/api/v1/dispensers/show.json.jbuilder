json.extract! @dispenser, :id, :opened_at, :closed_at, :flow_volume, :price, :total_spent, :user
json.spendings @dispenser.spendings do |spending|
  json.extract! spending, :id, :opened_at, :closed_at, :total_time
end
