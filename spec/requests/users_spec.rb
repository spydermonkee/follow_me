require 'spec_helper'

describe "Users" do
  describe "GET api/v.1/users/<username>/posts" do
    let(:username) { "spydermonkee" }
    it "returns json posts" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers

      TWITTER_CLIENT.should_receive(:user_timeline).with(username, count: 100).and_return(example_geo_tweet)

      get user_posts_path(username)
      expect(response.status).to be(200)
      expect(JSON.parse(response.body)).to have(2).items
    end
  end

  def example_geo_tweet
    [
      double("Tweet", id: 28_669_546_014, geo?: true, text: "hello world1"),
      double("Tweet", id: 28_669_546_015, geo?: true, text: "hello world2")
    ]
  end
end
