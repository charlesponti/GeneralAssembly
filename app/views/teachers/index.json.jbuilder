json.array!(@teachers) do |teacher|
  json.extract! teacher, :name
  json.url teacher_url(teacher, format: :json)
end
