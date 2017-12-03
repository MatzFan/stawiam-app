class App
  get "/top" do
    @users = User.top5
    haml :"users/top"
  end
end
