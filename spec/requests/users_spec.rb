require 'spec_helper'

describe "Users" do
  describe "GET api/v.1/users/<username>/posts" do
    it "returns json posts" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      username = "evanmonkee"
      get user_posts_path(username)
      response.status.should be(200)
    end
  end
end
