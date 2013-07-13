json.array!(@courses) do |course|
  json.extract! course, :name, :description, :price, :teacher_id, :course_image
  json.url course_url(course, format: :json)
end
