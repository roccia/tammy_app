class TwitterInfo < ApplicationRecord

  def self.get_user_info(username)
    client = TwitterApi::GetInfo.get_client
    tweets_info = client.home_timeline
    tweets_info.first(10).map do |t|
      content = t.text
      created_at = t.created_at
     {tweets: content, created: created_at}
    end

   end


end
