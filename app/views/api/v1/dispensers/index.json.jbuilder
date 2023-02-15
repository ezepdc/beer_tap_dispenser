json.array! @dispensers do |dispenser|
  json.extract! dispenser, :id, :opened_at, :closed_at, :flow_volume, :price, :total_spent, :user_id
end
