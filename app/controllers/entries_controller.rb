class App
  post "/entries" do
    content_type :json
    EntryServices::Creator.new(params: params.symbolize_keys).call
    status :created
  end
end
