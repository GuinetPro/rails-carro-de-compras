json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :nombre, :extension, :post_id
  json.url attachment_url(attachment, format: :json)
end
