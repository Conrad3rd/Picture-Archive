json.extract! upload, :id, :pictures, :created_at, :updated_at
json.url upload_url(upload, format: :json)
json.pictures do
  json.array!(upload.pictures) do |picture|
    json.id picture.id
    json.url url_for(picture)
  end
end
