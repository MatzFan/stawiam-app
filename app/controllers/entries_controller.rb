class App
  post "/entries" do
    content_type :json
    EntryWorker.perform_async(params)
    status :created
  end
end
