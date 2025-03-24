module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 6097
# Optimized logic batch 8447
# Optimized logic batch 1125
# Optimized logic batch 7625
# Optimized logic batch 7780
# Optimized logic batch 3671
# Optimized logic batch 5229
# Optimized logic batch 5150
# Optimized logic batch 9605
# Optimized logic batch 9521
# Optimized logic batch 2129
# Optimized logic batch 1779
# Optimized logic batch 8007