class TwitterInfo < ApplicationRecord

  def self.get_user_info(username)
    client = TwitterApi::GetInfo.get_client
    tweets_info = client.user_timeline(username)
    tweets_info.first(10).map do |t|
      content = t.text
      created_at = t.created_at
     {tweets: content, created: created_at}
    end

  end


end
