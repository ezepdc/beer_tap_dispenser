json.extract! @dispenser, :amount
json.spendings @dispenser.spendings do |spending|
  json.extract! spending, :opened_at, :closed_at, :flow_volume, :total_spent
end
