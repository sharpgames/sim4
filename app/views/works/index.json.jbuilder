json.array!(@works) do |work|
  json.extract! work, :id, :name, :desc, :tags
  json.url work_url(work, format: :json)
end
