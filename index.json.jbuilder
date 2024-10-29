json.array!(@orders) do |o|
  json.(o, :id, :customer_name, :fulfilled, :item, :quantity, :created_at, :pick_up_at)
end
