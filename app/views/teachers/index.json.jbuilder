json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :academic_degree, :name, :surname
  json.url teacher_url(teacher, format: :json)
end
