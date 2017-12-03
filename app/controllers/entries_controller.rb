class App
  get "/entries" do
    @entries = Entry.latest.paginate(page: params[:page])
    haml :"entries/index"
  end

  post "/entries" do
    content_type :json
    EntryWorker.perform_async(params)
    status :created
  end
end
