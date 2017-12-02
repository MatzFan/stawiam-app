class App
  get "/status" do
    content_type :json
    { status: "It works!" }.to_json
  end
end
