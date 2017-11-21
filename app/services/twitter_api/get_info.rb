module TwitterApi
  class GetInfo
    def self.get_client
      Twitter::REST::Client.new do |config|
        config.consumer_key = "Uyxpx37RKKWOjbpgsVuW8vUrd"
        config.consumer_secret = "HujjVQhagDFGhWBE9z6JbrlJz0xlnRf6JGxtq3sjlxsHvainB1"
        config.access_token = "38432022-TlVDSjVO01RJ69eCCyorFkdESXwhd30jIA2w1DSdC"
        config.access_token_secret = "INUQl4rsw4vBSkNyEVGYP9uYu7fXwChmjPW6oYqmLKoFF"
      end
    end
  end
end
