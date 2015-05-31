json.array!(@admin_boxes) do |admin_box|
  json.extract! admin_box, :id
  json.url admin_box_url(admin_box, format: :json)
end
