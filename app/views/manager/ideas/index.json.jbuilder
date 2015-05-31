json.array!(@manager_ideas) do |manager_idea|
  json.extract! manager_idea, :id
  json.url manager_idea_url(manager_idea, format: :json)
end
