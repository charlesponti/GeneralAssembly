json.array!(@students) do |student|
  json.extract! student, :name, :dob, :address, :student_image, :balance
  json.url student_url(student, format: :json)
end
