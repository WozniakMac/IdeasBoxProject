json.array!(@manager_boxes) do |manager_box|
  json.extract! manager_box, :id
  json.url manager_box_url(manager_box, format: :json)
end
