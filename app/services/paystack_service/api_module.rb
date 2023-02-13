module PaystackService::ApiModule
    extend ActiveSupport::Concern
  
    included do
      include HTTParty
      base_uri 'https://api.paystack.co'
  
      def self.headers
        secret_key = 'sk_test_7c1ca7065434908b33e7c30f8f9fcd0f60cf49a0' # your paystack secret key
        {
          'Authorization' => "Bearer #{secret_key}",
          'Content-Type' => 'application/json'
        }
      end
    end
end
  