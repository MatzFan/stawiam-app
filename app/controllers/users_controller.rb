class App
  get "/top" do
    protected!
    @users = User.top5
    haml :"users/top"
  end
end
