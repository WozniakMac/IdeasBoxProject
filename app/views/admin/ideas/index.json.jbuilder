json.array!(@admin_ideas) do |admin_idea|
  json.extract! admin_idea, :id
  json.url admin_idea_url(admin_idea, format: :json)
end
